TEMPLATE = aux

TRANSLATIONS = qfield_de.ts

QMAKE_EXTRA_COMPILERS += lrelease
lrelease.input         = TRANSLATIONS
lrelease.output        = ${QMAKE_FILE_BASE}.qm
lrelease.commands      = $$[QT_INSTALL_BINS]/lrelease ${QMAKE_FILE_IN} -qm ${QMAKE_FILE_BASE}.qm
lrelease.CONFIG       += no_link target_predeps


INSTALLS += translations

translations.path = /i18n
translations.files = qfield_de.qm
