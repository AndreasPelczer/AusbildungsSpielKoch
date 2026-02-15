//
//  StartScreenView.swift
//  AusbildungsSpielKoch
//
//  Halbjahr-Auswahl mit Pr\u{00FC}fungen
//

import SwiftUI

struct StartScreenView: View {
    @EnvironmentObject var progressManager: ProgressManager

    let allQuestions = QuestionLoader.loadFromJSON()

    @State private var flameGlow = false
    @State private var headerVisible = false
    @State private var contentVisible = false
    @State private var cursorVisible = true

    /// Halbjahr-Konfiguration mit Level-Ranges
    private struct HalbjahrConfig {
        let number: Int
        let title: String
        let subtitle: String
        let icon: String
        let color: Color
        let levelRange: ClosedRange<Int>
        let unlockHint: String
    }

    private let halbjahre: [HalbjahrConfig] = [
        HalbjahrConfig(number: 1, title: "1. Halbjahr", subtitle: "Grundlagen", icon: "1.circle.fill", color: .green, levelRange: 1...5, unlockHint: ""),
        HalbjahrConfig(number: 2, title: "2. Halbjahr", subtitle: "Warenkunde", icon: "2.circle.fill", color: .blue, levelRange: 6...10, unlockHint: "Level 5 abschlie\u{00DF}en"),
        HalbjahrConfig(number: 3, title: "3. Halbjahr", subtitle: "Vertiefung", icon: "3.circle.fill", color: .purple, levelRange: 11...15, unlockHint: "Level 10 abschlie\u{00DF}en"),
        HalbjahrConfig(number: 4, title: "4. Halbjahr", subtitle: "Anwenden & Bewerten", icon: "4.circle.fill", color: .orange, levelRange: 16...20, unlockHint: "Commis-Pr\u{00FC}fung bestehen"),
    ]

    private var availableLevels: Set<Int> {
        QuestionLoader.availableLevels(in: allQuestions)
    }

    private var totalAvailableRange: ClosedRange<Int> {
        guard let minLevel = availableLevels.min(), let maxLevel = availableLevels.max() else {
            return 1...1
        }
        return minLevel...maxLevel
    }

    private var unlockedHalbjahrCount: Int {
        halbjahre.filter { progressManager.isHalbjahrUnlocked($0.number) }.count
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                LinearGradient(
                    colors: [Color.blue.opacity(0.5), Color.black],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 0) {
                        // Header
                        VStack(spacing: 8) {
                            Text("\u{1F41F}")
                                .font(.system(size: 50))
                                .shadow(color: .blue.opacity(flameGlow ? 0.8 : 0.3), radius: flameGlow ? 20 : 8)
                                .scaleEffect(flameGlow ? 1.08 : 1.0)
                                .accessibilityHidden(true)

                            Text("Matjes")
                                .font(.system(size: 36, weight: .black, design: .rounded))
                                .foregroundColor(.white)

                            Text("der kleine Hering")
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(.orange)

                            Text("Das Ausbildungsspiel der K\u{00FC}che")
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                                .foregroundColor(.gray)
                                .padding(.top, 2)
                        }
                        .padding(.top, 50)
                        .opacity(headerVisible ? 1 : 0)
                        .offset(y: headerVisible ? 0 : -20)
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Matjes, der kleine Hering, Das Ausbildungsspiel der K\u{00FC}che")

                        // Halbjahr-Auswahl + Pr\u{00FC}fungen
                        VStack(spacing: 12) {
                            Text("W\u{00E4}hle dein Halbjahr")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .padding(.top, 30)
                                .padding(.bottom, 8)

                            // Halbjahr 1
                            halbjahrRow(halbjahre[0])

                            // Halbjahr 2
                            halbjahrRow(halbjahre[1])

                            // Halbjahr 3
                            halbjahrRow(halbjahre[2])

                            // Commis-Pr\u{00FC}fung (nach Halbjahr 3)
                            examRow(ExamConfig.commisPruefung)

                            // Halbjahr 4
                            halbjahrRow(halbjahre[3])

                            // Bossfight (nach Halbjahr 4)
                            examRow(ExamConfig.bossfight)
                        }
                        .padding(.horizontal, 20)
                        .opacity(contentVisible ? 1 : 0)
                        .offset(y: contentVisible ? 0 : 30)

                        // Alle Level Button (nur wenn mindestens 2 Halbjahre freigeschaltet)
                        if unlockedHalbjahrCount > 1 {
                            NavigationLink(destination: LevelGridView(
                                halbjahr: 0,
                                levelRange: totalAvailableRange,
                                allQuestions: allQuestions
                            )) {
                                HStack {
                                    Image(systemName: "square.grid.3x3.fill")
                                        .font(.title3)
                                    Text("Alle Level")
                                        .font(.system(size: 16, weight: .bold, design: .rounded))
                                }
                                .foregroundColor(.orange)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 30)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.orange, lineWidth: 2)
                                        .shadow(color: .orange.opacity(0.3), radius: 5)
                                )
                            }
                            .accessibilityLabel("Alle Level anzeigen")
                            .padding(.top, 20)
                            .opacity(contentVisible ? 1 : 0)
                        }

                        Spacer(minLength: 40)
                    }
                }
            }
            // iMOPS Wasserzeichen + Signatur
            .overlay(alignment: .bottom) {
                HStack(alignment: .bottom) {
                    // ;=)_ Signatur unten links
                    HStack(spacing: 0) {
                        Text(";=)")
                            .font(.system(size: 11, weight: .medium, design: .monospaced))
                            .foregroundColor(.green.opacity(0.4))
                        Text("_")
                            .font(.system(size: 11, weight: .medium, design: .monospaced))
                            .foregroundColor(.green.opacity(cursorVisible ? 0.6 : 0.0))
                    }

                    Spacer()

                    // iMOPS Logo dezent
                    VStack(spacing: 1) {
                        RoundedRectangle(cornerRadius: 1)
                            .fill(Color.orange.opacity(0.15))
                            .frame(width: 20, height: 2)
                        Text("\u{2303}")
                            .font(.system(size: 8))
                            .foregroundColor(.orange.opacity(0.15))
                            .offset(y: -2)
                        Text("iMOPS")
                            .font(.system(size: 7, weight: .bold, design: .rounded))
                            .foregroundColor(.orange.opacity(0.15))
                            .offset(y: -4)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
            }
            .toolbar(.hidden, for: .navigationBar)
            .onAppear {
                withAnimation(.easeOut(duration: 0.5)) {
                    headerVisible = true
                }

                withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                    flameGlow = true
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeOut(duration: 0.5)) {
                        contentVisible = true
                    }
                }

                withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
                    cursorVisible.toggle()
                }
            }
        }
    }

    // MARK: - Halbjahr Row

    @ViewBuilder
    private func halbjahrRow(_ config: HalbjahrConfig) -> some View {
        let hasQuestions = config.levelRange.contains(where: { availableLevels.contains($0) })
        let isUnlocked = progressManager.isHalbjahrUnlocked(config.number)

        if hasQuestions {
            if isUnlocked {
                NavigationLink(destination: LevelGridView(
                    halbjahr: config.number,
                    levelRange: config.levelRange,
                    allQuestions: allQuestions
                )) {
                    HalbjahrButtonContent(
                        title: config.title,
                        subtitle: config.subtitle,
                        icon: config.icon,
                        color: config.color,
                        locked: false,
                        unlockHint: ""
                    )
                }
            } else {
                HalbjahrButtonContent(
                    title: config.title,
                    subtitle: config.subtitle,
                    icon: config.icon,
                    color: config.color,
                    locked: true,
                    unlockHint: config.unlockHint
                )
            }
        }
    }

    // MARK: - Exam Row

    @ViewBuilder
    private func examRow(_ exam: ExamConfig) -> some View {
        let isUnlocked = progressManager.isExamUnlocked(exam)
        let bestResult = progressManager.examResult(for: exam.id)

        if isUnlocked {
            NavigationLink(destination: ExamGameView(
                config: exam,
                allQuestions: allQuestions
            )) {
                ExamButton(exam: exam, bestResult: bestResult)
            }
        } else {
            ExamButton(exam: exam, bestResult: nil, locked: true)
        }
    }
}

// MARK: - Halbjahr Button
struct HalbjahrButtonContent: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let locked: Bool
    let unlockHint: String

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: locked ? "lock.fill" : icon)
                .font(.system(size: 32))
                .foregroundColor(locked ? .gray : color)
                .frame(width: 50)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(locked ? .gray : .white)
                Text(locked ? unlockHint : subtitle)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundColor(.gray)
            }

            Spacer()

            if !locked {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .bold))
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(locked ? Color.gray.opacity(0.05) : Color.white.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(
                            locked ? Color.gray.opacity(0.15) : color.opacity(0.3),
                            lineWidth: 1
                        )
                )
        )
        .accessibilityLabel(locked ? "\(title), gesperrt, \(unlockHint)" : "\(title), \(subtitle)")
    }
}

// MARK: - Pr\u{00FC}fungs-Button
struct ExamButton: View {
    let exam: ExamConfig
    let bestResult: ExamResult?
    var locked: Bool = false

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: locked ? "lock.fill" : exam.icon)
                .font(.system(size: 28))
                .foregroundColor(locked ? .gray : exam.color)
                .frame(width: 50)

            VStack(alignment: .leading, spacing: 2) {
                Text(exam.name)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(locked ? .gray : .white)

                if locked {
                    Text("Level \(exam.unlockLevel) abschlie\u{00DF}en")
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(.gray)
                } else if let result = bestResult {
                    HStack(spacing: 6) {
                        Image(systemName: result.passed ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(result.passed ? .green : .red)
                            .font(.caption)
                        Text("Bestes: \(Int(result.percentage))%")
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundColor(result.passed ? .green : .red)
                    }
                } else {
                    Text("\(exam.fragenAnzahl) Fragen \u{00B7} \(exam.dauerMinuten) Min.")
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(.gray)
                }
            }

            Spacer()

            if !locked {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .bold))
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(locked ? Color.gray.opacity(0.05) : exam.color.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(
                            locked ? Color.gray.opacity(0.15) : exam.color.opacity(0.3),
                            lineWidth: locked ? 1 : 2
                        )
                )
        )
        .accessibilityLabel(locked ? "\(exam.name), gesperrt" : "\(exam.name), \(exam.subtitle)")
    }
}
