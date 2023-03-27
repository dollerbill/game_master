# frozen_string_literal: true

campaigns = [
  {
    "name": 'The Curse of the Shadow Relic.',
    "description": 'In a land plagued by darkness, a group of adventurers stumbles upon the entrance to a cursed forest, where ancient relics and dangerous creatures are rumored to dwell. As the adventurers delve deeper into the mysteries of the forest, they uncover an abandoned village with a chilling past.',
    "chapters": [
      {
        "chapter": 1,
        "title": 'The Cursed Forest',
        "storyPrompt": 'As the sun sets, you find yourself at the entrance of a dark and mysterious forest. The trees loom overhead, casting eerie shadows on the ground. Rumors of cursed creatures and ancient relics fill your mind as you decide how to proceed.',
        "options": [
          {
            "id": 'A',
            "description": 'Enter the forest cautiously, keeping an eye out for danger.',
            "outcome": {
              "text": 'You carefully step into the forest, senses heightened, and begin your journey into the darkness.',
              "event": 'encounter',
              "encounter": {
                "type": 'choice',
                "options": [
                  {
                    "id": 'A1',
                    "description": 'Attempt to sneak past the lurking creature.',
                    "outcome": {
                      "text": 'You manage to sneak past the creature, continuing deeper into the forest.',
                      "event": 'continue',
                      "nextEventId": 'Chapter2'
                    }
                  },
                  {
                    "id": 'A2',
                    "description": 'Confront the creature and prepare for battle.',
                    "outcome": {
                      "text": 'You bravely face the creature, weapons at the ready.',
                      "event": 'combat',
                      "combat": {
                        "enemies": [
                          {
                            "name": 'Cursed Wolf',
                            "level": 3,
                            "hp": 30,
                            "abilities": %w[Bite Howl]
                          }
                        ],
                        "successEventId": 'Chapter2',
                        "failureEventId": 'GameOver'
                      }
                    }
                  }
                ]
              }
            }
          },
          {
            "id": 'B',
            "description": 'Search the outskirts of the forest for another entrance.',
            "outcome": {
              "text": "You circle the forest's edge, hoping to find a safer path.",
              "event": 'encounter',
              "encounter": {
                "type": 'choice',
                "options": [
                  {
                    "id": 'B1',
                    "description": 'Follow the hidden path you discovered.',
                    "outcome": {
                      "text": 'You enter the forest through the hidden path, feeling a sense of security.',
                      "event": 'continue',
                      "nextEventId": 'Chapter2'
                    }
                  },
                  {
                    "id": 'B2',
                    "description": 'Decide the hidden path is too risky and return to the main entrance.',
                    "outcome": {
                      "text": 'You return to the main entrance, steeling yourself for what lies ahead.',
                      "event": 'continue',
                      "nextEventId": 'A'
                    }
                  }
                ]
              }
            }
          }
        ]
      },
      {
        "chapter": 2,
        "title": 'The Abandoned Village',
        "storyPrompt": "After navigating the treacherous forest, you and your party stumble upon an eerie, abandoned village. The houses are crumbling, and the silence is unsettling. You can't shake the feeling that something is watching you.",
        "options": [
          {
            "id": 'A',
            "description": 'Investigate the village for clues and resources.',
            "outcome": {
              "text": 'You cautiously explore the village, searching for anything that might explain what happened here.',
              "event": 'encounter',
              "encounter": {
                "type": 'choice',
                "options": [
                  {
                    "id": 'A1',
                    "description": 'Enter the largest building in the center of the village.',
                    "outcome": {
                      "text": 'You cautiously enter the building, only to find it was once an old chapel. A mysterious relic lies on the altar.',
                      "event": 'continue',
                      "nextEventId": 'Chapter3'
                    }
                  },
                  {
                    "id": 'A2',
                    "description": 'Explore the smaller houses around the village.',
                    "outcome": {
                      "text": 'You search the smaller houses and discover notes left by the villagers. The notes tell of a powerful relic and the darkness it unleashed.',
                      "event": 'continue',
                      "nextEventId": 'Chapter3'
                    }
                  }
                ]
              }
            }
          },
          {
            "id": 'B',
            "description": 'Avoid the village and continue through the forest.',
            "outcome": {
              "text": "You decide to bypass the village, but as you continue through the forest, you come across a wounded traveler who speaks of the village's dark history.",
              "event": 'encounter',
              "encounter": {
                "type": 'choice',
                "options": [
                  {
                    "id": 'B1',
                    "description": 'Go back to the village to uncover the truth.',
                    "outcome": {
                      "text": 'You return to the village, determined to learn more about the relic and its connection to the curse.',
                      "event": 'continue',
                      "nextEventId": 'Chapter3'
                    }
                  },
                  {
                    "id": 'B2',
                    "description": "Press on, disregarding the traveler's warnings.",
                    "outcome": {
                      "text": "You continue through the forest, hoping to avoid the village's dark past. However, the curse seems to follow you.",
                      "event": 'combat',
                      "combat": {
                        "enemies": [
                          {
                            "name": 'Shadow Wraith',
                            "level": 5,
                            "hp": 45,
                            "abilities": %w[Shadow Strike Chilling Grasp]
                          }
                        ],
                        "successEventId": 'Chapter3',
                        "failureEventId": 'GameOver'
                      }
                    }
                  }
                ]
              }
            }
          }
        ]
      },
      {
        "chapter": 3,
        "title": 'The Shadow Relic',
        "storyPrompt": "With knowledge of the village's dark past and the mysterious relic, you and your party decide to confront the source of the curse. The path leads you to a hidden cave where the relic is said to reside. The air is thick with dark energy.",
        "options": [
          {
            "id": 'A',
            "description": 'Venture into the cave to find the relic.',
            "outcome": {
              "text": 'You cautiously enter the cave, navigating the darkness and the oppressive atmosphere. The air grows colder as you descend.',
              "event": 'encounter',
              "encounter": {
                "type": 'choice',
                "options": [
                  {
                    "id": 'A1',
                    "description": "Attempt to dispel the dark energy using your party's magical abilities.",
                    "outcome": {
                      "text": 'Your party combines their magical powers and successfully weakens the dark energy. The path to the relic becomes clearer.',
                      "event": 'continue',
                      "nextEventId": 'Chapter4'
                    }
                  },
                  {
                    "id": 'A2',
                    "description": 'Brace yourselves and continue deeper into the cave.',
                    "outcome": {
                      "text": "The darkness closes in around you, and you're attacked by the cursed guardians of the relic.",
                      "event": 'combat',
                      "combat": {
                        "enemies": [
                          {
                            "name": 'Shadow Guardian',
                            "level": 6,
                            "hp": 55,
                            "abilities": [
                              'Shadow Slam',
                              'Dark Binding'
                            ]
                          }
                        ],
                        "successEventId": 'Chapter4',
                        "failureEventId": 'GameOver'
                      }
                    }
                  }
                ]
              }
            }
          },
          {
            "id": 'B',
            "description": 'Search for an alternate entrance to the cave.',
            "outcome": {
              "text": 'You scout the area and discover a hidden passage that leads into the cave. As you enter, you feel the dark energy surrounding you.',
              "event": 'encounter',
              "encounter": {
                "type": 'choice',
                "options": [
                  {
                    "id": 'B1',
                    "description": 'Rely on stealth to avoid attracting the attention of the cursed guardians.',
                    "outcome": {
                      "text": 'You manage to evade the guardians, but the dark energy in the cave grows stronger as you approach the relic.',
                      "event": 'continue',
                      "nextEventId": 'Chapter4'
                    }
                  },
                  {
                    "id": 'B2',
                    "description": 'Confront the cursed guardians and fight your way to the relic.',
                    "outcome": {
                      "text": 'Your presence alerts the guardians, and they attack.',
                      "event": 'combat',
                      "combat": {
                        "enemies": [
                          {
                            "name": 'Shadow Guardian',
                            "level": 6,
                            "hp": 55,
                            "abilities": [
                              'Shadow Slam',
                              'Dark Binding'
                            ]
                          }
                        ],
                        "successEventId": 'Chapter4',
                        "failureEventId": 'GameOver'
                      }
                    }
                  }
                ]
              }
            }
          }
        ]
      },
      {
        "chapter": 4,
        "title": 'The Heart of Darkness',
        "storyPrompt": 'You reach the deepest part of the cave, where the Shadow Relic resides. The relic is an obsidian gemstone pulsating with dark energy. The power it emits seems to have corrupted the land and its creatures. You must decide how to proceed.',
        "options": [
          {
            "id": 'A',
            "description": 'Attempt to purify the Shadow Relic.',
            "outcome": {
              "text": "You gather your party's magical powers and focus on purifying the relic. The dark energy within the gemstone resists your efforts.",
              "event": 'encounter',
              "encounter": {
                "type": 'choice',
                "options": [
                  {
                    "id": 'A1',
                    "description": 'Continue to channel your combined powers to purify the relic.',
                    "outcome": {
                      "text": 'Your persistence pays off, and the dark energy dissipates from the gemstone. The curse is lifted.',
                      "event": 'continue',
                      "nextEventId": 'Chapter5'
                    }
                  },
                  {
                    "id": 'A2',
                    "description": 'Stop your attempts and prepare for battle.',
                    "outcome": {
                      "text": 'As you cease your efforts, the cave trembles, and a monstrous creature emerges, intent on protecting the relic.',
                      "event": 'combat',
                      "combat": {
                        "enemies": [
                          {
                            "name": 'Corrupted Guardian',
                            "level": 8,
                            "hp": 80,
                            "abilities": [
                              'Corrupting Touch',
                              'Shadow Eruption'
                            ]
                          }
                        ],
                        "successEventId": 'Chapter5',
                        "failureEventId": 'GameOver'
                      }
                    }
                  }
                ]
              }
            }
          },
          {
            "id": 'B',
            "description": 'Destroy the Shadow Relic.',
            "outcome": {
              "text": 'You and your party unleash your combined strength to shatter the relic. The gemstone cracks, and the dark energy surges.',
              "event": 'encounter',
              "encounter": {
                "type": 'choice',
                "options": [
                  {
                    "id": 'B1',
                    "description": 'Flee the cave before the energy consumes you.',
                    "outcome": {
                      "text": "You barely escape the cave as the relic's energy dissipates. The curse has been broken.",
                      "event": 'continue',
                      "nextEventId": 'Chapter5'
                    }
                  },
                  {
                    "id": 'B2',
                    "description": 'Stand your ground and confront the dark energy.',
                    "outcome": {
                      "text": 'As the dark energy swirls around you, it forms into a terrifying creature determined to punish you for your actions.',
                      "event": 'combat',
                      "combat": {
                        "enemies": [
                          {
                            "name": 'Darkness Incarnate',
                            "level": 9,
                            "hp": 100,
                            "abilities": [
                              'Shadow Bolt',
                              'Dark Vortex'
                            ]
                          }
                        ],
                        "successEventId": 'Chapter5',
                        "failureEventId": 'GameOver'
                      }
                    }
                  }
                ]
              }
            }
          }
        ]
      },
      {
        "chapter": 5,
        "title": 'A Land Reborn',
        "storyPrompt": 'With the curse lifted, you begin to see the positive effects of your actions. The forest starts to regain its vibrancy, and the creatures lose their aggressive demeanor. As you make your way back through the forest, you come across the abandoned village once more.',
        "options": [
          {
            "id": 'A',
            "description": 'Visit the village to see if anything has changed.',
            "outcome": {
              "text": 'You find the village transformed. The houses are no longer crumbling, and the once eerie silence has been replaced with the sounds of life. The villagers have returned.',
              "event": 'encounter',
              "encounter": {
                "type": 'choice',
                "options": [
                  {
                    "id": 'A1',
                    "description": 'Speak to the villagers about their experiences.',
                    "outcome": {
                      "text": 'The villagers share their gratitude and stories of how the curse affected them. They offer you their aid for your upcoming journey.',
                      "event": 'continue',
                      "nextEventId": 'Chapter6'
                    }
                  },
                  {
                    "id": 'A2',
                    "description": 'Decline their gratitude and continue your journey.',
                    "outcome": {
                      "text": 'You humbly decline their gratitude, knowing that your quest is far from over.',
                      "event": 'continue',
                      "nextEventId": 'Chapter6'
                    }
                  }
                ]
              }
            }
          },
          {
            "id": 'B',
            "description": 'Leave the village behind and continue your journey.',
            "outcome": {
              "text": "You decide not to linger in the village and instead continue your journey. As you leave, you can't help but feel a sense of accomplishment for having lifted the curse.",
              "event": 'continue',
              "nextEventId": 'Chapter6'
            }
          }
        ]
      },
      {
        "chapter": 6,
        "title": 'Epilogue: A New Beginning',
        "storyPrompt": "As you continue your journey, you reflect on the events that transpired during your adventure. You've grown stronger, both individually and as a team. The world is full of mysteries and challenges, and you're eager to face them. The Curse of the Shadow Relic is now a story to be shared and remembered.",
        "options": [
          {
            "id": 'A',
            "description": 'Celebrate your victory with your party.',
            "outcome": {
              "text": 'You and your companions take a moment to celebrate your hard-fought victory. You share stories, laughter, and camaraderie. The bonds between you grow stronger.',
              "event": 'end'
            }
          },
          {
            "id": 'B',
            "description": 'Reflect on the lessons learned and prepare for the next adventure.',
            "outcome": {
              "text": "You take a moment to consider the challenges you've faced and the lessons you've learned. Strengthened by your experiences, you look forward to the adventures that lie ahead.",
              "event": 'end'
            }
          }
        ]
      }
    ]
  },
  { "name": "Flowers on the Horizon", "description": "The 2nd campaign" },
  { "name": "Rivers of Mystery", "description": "The 3rd campaign" },
  { "name": "Another Name", "description": "The 4th campaign" }
]
campaigns.each { |campaign| Campaign.create(info: campaign) }
