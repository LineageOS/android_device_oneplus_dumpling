#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)
from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)

namespace_imports = [
    'hardware/oneplus',
    'hardware/qcom-caf/msm8998',
    'vendor/oneplus/msm8998-common',
]

blob_fixups: blob_fixups_user_type = {
    (
        'vendor/lib/hw/fingerprint.goodix.so',
        'vendor/lib64/hw/fingerprint.goodix.so',
    ): blob_fixup()
        .binary_regex_replace(b'\x00goodix.fingerprint\x00', b'\x00fingerprint\x00\x00\x00\x00\x00\x00\x00\x00'),
}  # fmt: skip

module = ExtractUtilsModule(
    'dumpling',
    'oneplus',
    blob_fixups=blob_fixups,
    namespace_imports=namespace_imports,
    add_firmware_proprietary_file=True,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'msm8998-common', module.vendor
    )
    utils.run()
