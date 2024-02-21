Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B3285E093
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 16:08:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D17C7BC0;
	Wed, 21 Feb 2024 16:08:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D17C7BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708528112;
	bh=FLDeM9Gn5BRmvPJw4831XzE31NwzjSqXo8OSpfZxOl8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bq5PW/IH5BT8mKzIl0nWkUcrVTDwT10KI8pL5RxaddkIJtFtKXIqsG9ql/NXk4LoW
	 lnK6Ju53/VI8t1e/xo3TdJSj/vDvLvT786FScN4g2xQUqGzN8ksoCrsa0LhoA0mrJG
	 L/VCrZzEtCG02QGl1cp7L7UeVdzThf5lNOjY+1DM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22E01F8072A; Wed, 21 Feb 2024 16:05:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EAE3F80707;
	Wed, 21 Feb 2024 16:05:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DA37F806BC; Wed, 21 Feb 2024 16:05:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 064B2F80568
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 16:05:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 064B2F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=NuEy6yBL
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41L72AP1020807;
	Wed, 21 Feb 2024 09:05:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=lFHHp7Hf86/Y2k2Gbux127+DN+4Y38NV8nInI1CKNKg=; b=
	NuEy6yBL471FUI8+J5QRevhzbswcvNuyug4HvmtzJWHvFQ1e4KIKuM+RiYbBUcyJ
	0UFoJrRiigePbV9CX5PutkJHwHXuNCw4wYC3ZH+jtO+CnwFBmeEo6sBAfuiX6U1y
	fGt3P+OluOr3pHaQ7eDRuJHl78YO9S0ie3rBriNCKz2IXjzaPQqFOOhM/tnaC506
	TE+zOQJKTqDvw/nKUv7YcRvt89uNhCsxl/ERGG7Uodhfm9VqDj+a40fRh8AE2o5H
	XS1NwCEXc5lOs/VeBrId7GMtaYBQUKuTZJFtlykvoMvesSOHJqQKyuNuaQfhrQft
	BT4276LPGHpAEgbWc+WUEQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wd207h58t-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 09:05:11 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 15:05:07 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 21 Feb 2024 15:05:07 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 523DC820270;
	Wed, 21 Feb 2024 15:05:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 9/9] ASoC: cs-amp-lib: Add KUnit test for calibration helpers
Date: Wed, 21 Feb 2024 15:05:07 +0000
Message-ID: <20240221150507.1039979-10-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240221150507.1039979-1-rf@opensource.cirrus.com>
References: <20240221150507.1039979-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: W_kcH0L5JPgoWf4a_gBFHknaAzwmnbAa
X-Proofpoint-ORIG-GUID: W_kcH0L5JPgoWf4a_gBFHknaAzwmnbAa
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZFXGXMKJNQIGSTGGNYIYUNADC4ASPSIQ
X-Message-ID-Hash: ZFXGXMKJNQIGSTGGNYIYUNADC4ASPSIQ
X-MailFrom: prvs=97814b2c7f=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFXGXMKJNQIGSTGGNYIYUNADC4ASPSIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a KUnit test for the cs-amp-lib library. This has test cases
for cs_amp_get_efi_calibration_data() and cs_amp_write_cal_coeffs().

A KUNIT_STATIC_STUB_REDIRECT() has been added to
cs_amp_get_efi_variable() and cs_amp_write_cal_coeff() so that the
KUnit test can redirect these to test harness functions.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs-amp-lib.h         |  14 +
 sound/soc/codecs/Kconfig           |  14 +
 sound/soc/codecs/Makefile          |   2 +
 sound/soc/codecs/cs-amp-lib-test.c | 709 +++++++++++++++++++++++++++++
 sound/soc/codecs/cs-amp-lib.c      |  18 +-
 5 files changed, 755 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/codecs/cs-amp-lib-test.c

diff --git a/include/sound/cs-amp-lib.h b/include/sound/cs-amp-lib.h
index 35f7bd848276..c9055d833bd0 100644
--- a/include/sound/cs-amp-lib.h
+++ b/include/sound/cs-amp-lib.h
@@ -49,4 +49,18 @@ int cs_amp_write_cal_coeffs(struct wm_adsp *dsp,
 			    const struct cirrus_amp_cal_data *data);
 int cs_amp_get_efi_calibration_data(struct device *dev, u64 target_uid, int amp_index,
 				    struct cirrus_amp_cal_data *out_data);
+
+struct cs_amp_test_hooks {
+	efi_status_t (*get_efi_variable)(efi_char16_t *name,
+					 efi_guid_t *guid,
+					 unsigned long *size,
+					 void *buf);
+
+	int (*write_cal_coeff)(struct wm_adsp *dsp,
+			       const struct cirrus_amp_cal_controls *controls,
+			       const char *ctl_name, u32 val);
+};
+
+extern const struct cs_amp_test_hooks * const cs_amp_test_hooks;
+
 #endif /* CS_AMP_LIB_H */
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 15f287784d8b..373d0f6478ae 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -732,6 +732,20 @@ config SND_SOC_CROS_EC_CODEC
 config SND_SOC_CS_AMP_LIB
 	tristate
 
+config SND_SOC_CS_AMP_LIB_TEST
+	tristate "KUnit test for Cirrus Logic cs-amp-lib"
+	depends on KUNIT
+	depends on ACPI || COMPILE_TEST
+	default KUNIT_ALL_TESTS
+	select SND_SOC_CS_AMP_LIB
+	help
+	  This builds KUnit tests for the Cirrus Logic common
+	  amplifier library.
+	  For more information on KUnit and unit tests in general,
+	  please refer to the KUnit documentation in
+	  Documentation/dev-tools/kunit/.
+	  If in doubt, say "N".
+
 config SND_SOC_CS35L32
 	tristate "Cirrus Logic CS35L32 CODEC"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 0fc40640e5d0..7c075539dc47 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -60,6 +60,7 @@ snd-soc-cpcap-objs := cpcap.o
 snd-soc-cq93vc-objs := cq93vc.o
 snd-soc-cros-ec-codec-objs := cros_ec_codec.o
 snd-soc-cs-amp-lib-objs := cs-amp-lib.o
+snd-soc-cs-amp-lib-test-objs := cs-amp-lib-test.o
 snd-soc-cs35l32-objs := cs35l32.o
 snd-soc-cs35l33-objs := cs35l33.o
 snd-soc-cs35l34-objs := cs35l34.o
@@ -454,6 +455,7 @@ obj-$(CONFIG_SND_SOC_CQ0093VC) += snd-soc-cq93vc.o
 obj-$(CONFIG_SND_SOC_CPCAP)	+= snd-soc-cpcap.o
 obj-$(CONFIG_SND_SOC_CROS_EC_CODEC)	+= snd-soc-cros-ec-codec.o
 obj-$(CONFIG_SND_SOC_CS_AMP_LIB)	+= snd-soc-cs-amp-lib.o
+obj-$(CONFIG_SND_SOC_CS_AMP_LIB_TEST)	+= snd-soc-cs-amp-lib-test.o
 obj-$(CONFIG_SND_SOC_CS35L32)	+= snd-soc-cs35l32.o
 obj-$(CONFIG_SND_SOC_CS35L33)	+= snd-soc-cs35l33.o
 obj-$(CONFIG_SND_SOC_CS35L34)	+= snd-soc-cs35l34.o
diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs-amp-lib-test.c
new file mode 100644
index 000000000000..6f9e5755e145
--- /dev/null
+++ b/sound/soc/codecs/cs-amp-lib-test.c
@@ -0,0 +1,709 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// KUnit test for the Cirrus common amplifier library.
+//
+// Copyright (C) 2024 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+#include <kunit/test.h>
+#include <kunit/static_stub.h>
+#include <linux/firmware/cirrus/wmfw.h>
+#include <linux/gpio/driver.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/random.h>
+#include <sound/cs-amp-lib.h>
+#include "wm_adsp.h"
+
+struct cs_amp_lib_test_priv {
+	struct platform_device amp_pdev;
+
+	struct cirrus_amp_efi_data *cal_blob;
+	struct list_head ctl_write_list;
+};
+
+struct cs_amp_lib_test_ctl_write_entry {
+	struct list_head list;
+	unsigned int value;
+	char name[16];
+};
+
+struct cs_amp_lib_test_param {
+	int num_amps;
+	int amp_index;
+};
+
+static void cs_amp_lib_test_init_dummy_cal_blob(struct kunit *test, int num_amps)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	unsigned int blob_size;
+
+	blob_size = offsetof(struct cirrus_amp_efi_data, data) +
+		    sizeof(struct cirrus_amp_cal_data) * num_amps;
+
+	priv->cal_blob = kunit_kzalloc(test, blob_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv->cal_blob);
+
+	priv->cal_blob->size = blob_size;
+	priv->cal_blob->count = num_amps;
+
+	get_random_bytes(priv->cal_blob->data, sizeof(struct cirrus_amp_cal_data) * num_amps);
+}
+
+static u64 cs_amp_lib_test_get_target_uid(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	const struct cs_amp_lib_test_param *param = test->param_value;
+	u64 uid;
+
+	uid = priv->cal_blob->data[param->amp_index].calTarget[1];
+	uid <<= 32;
+	uid |= priv->cal_blob->data[param->amp_index].calTarget[0];
+
+	return uid;
+}
+
+/* Redirected get_efi_variable to simulate that the file is too short */
+static efi_status_t cs_amp_lib_test_get_efi_variable_nohead(efi_char16_t *name,
+							    efi_guid_t *guid,
+							    unsigned long *size,
+							    void *buf)
+{
+	if (!buf) {
+		*size = offsetof(struct cirrus_amp_efi_data, data) - 1;
+		return EFI_BUFFER_TOO_SMALL;
+	}
+
+	return EFI_NOT_FOUND;
+}
+
+/* Should return -EOVERFLOW if the header is larger than the EFI data */
+static void cs_amp_lib_test_cal_data_too_short_test(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	struct cirrus_amp_cal_data result_data;
+	int ret;
+
+	/* Redirect calls to get EFI data */
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_variable_nohead);
+
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, 0, 0, &result_data);
+	KUNIT_EXPECT_EQ(test, ret, -EOVERFLOW);
+
+	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
+}
+
+/* Redirected get_efi_variable to simulate that the count is larger than the file */
+static efi_status_t cs_amp_lib_test_get_efi_variable_bad_count(efi_char16_t *name,
+							       efi_guid_t *guid,
+							       unsigned long *size,
+							       void *buf)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct cs_amp_lib_test_priv *priv = test->priv;
+
+	if (!buf) {
+		/*
+		 * Return a size that is shorter than required for the
+		 * declared number of entries.
+		 */
+		*size = priv->cal_blob->size - 1;
+		return EFI_BUFFER_TOO_SMALL;
+	}
+
+	memcpy(buf, priv->cal_blob, priv->cal_blob->size - 1);
+
+	return EFI_SUCCESS;
+}
+
+/* Should return -EOVERFLOW if the entry count is larger than the EFI data */
+static void cs_amp_lib_test_cal_count_too_big_test(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	struct cirrus_amp_cal_data result_data;
+	int ret;
+
+	cs_amp_lib_test_init_dummy_cal_blob(test, 8);
+
+	/* Redirect calls to get EFI data */
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_variable_bad_count);
+
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, 0, 0, &result_data);
+	KUNIT_EXPECT_EQ(test, ret, -EOVERFLOW);
+
+	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
+}
+
+/* Redirected get_efi_variable to simulate that the variable not found */
+static efi_status_t cs_amp_lib_test_get_efi_variable_none(efi_char16_t *name,
+							  efi_guid_t *guid,
+							  unsigned long *size,
+							  void *buf)
+{
+	return EFI_NOT_FOUND;
+}
+
+/* If EFI doesn't contain a cal data variable the result should be -ENOENT */
+static void cs_amp_lib_test_no_cal_data_test(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	struct cirrus_amp_cal_data result_data;
+	int ret;
+
+	/* Redirect calls to get EFI data */
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_variable_none);
+
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, 0, 0, &result_data);
+	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
+
+	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
+}
+
+/* Redirected get_efi_variable to simulate reading a cal data blob */
+static efi_status_t cs_amp_lib_test_get_efi_variable(efi_char16_t *name,
+						     efi_guid_t *guid,
+						     unsigned long *size,
+						     void *buf)
+{
+	static const efi_char16_t expected_name[] = L"CirrusSmartAmpCalibrationData";
+	static const efi_guid_t expected_guid =
+		EFI_GUID(0x02f9af02, 0x7734, 0x4233, 0xb4, 0x3d, 0x93, 0xfe, 0x5a, 0xa3, 0x5d, 0xb3);
+	struct kunit *test = kunit_get_current_test();
+	struct cs_amp_lib_test_priv *priv = test->priv;
+
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, name);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, guid);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, size);
+
+	KUNIT_EXPECT_MEMEQ(test, name, expected_name, sizeof(expected_name));
+	KUNIT_EXPECT_MEMEQ(test, guid, &expected_guid, sizeof(expected_guid));
+
+	if (!buf) {
+		*size = priv->cal_blob->size;
+		return EFI_BUFFER_TOO_SMALL;
+	}
+
+	KUNIT_ASSERT_GE_MSG(test, ksize(buf), priv->cal_blob->size, "Buffer to small");
+
+	memcpy(buf, priv->cal_blob, priv->cal_blob->size);
+
+	return EFI_SUCCESS;
+}
+
+/* Get cal data block for a given amp, matched by target UID. */
+static void cs_amp_lib_test_get_efi_cal_by_uid_test(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	const struct cs_amp_lib_test_param *param = test->param_value;
+	struct cirrus_amp_cal_data result_data;
+	u64 target_uid;
+	int ret;
+
+	cs_amp_lib_test_init_dummy_cal_blob(test, param->num_amps);
+
+	/* Redirect calls to get EFI data */
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_variable);
+
+	target_uid = cs_amp_lib_test_get_target_uid(test);
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, target_uid, -1, &result_data);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
+
+	KUNIT_EXPECT_EQ(test, result_data.calTarget[0], target_uid & 0xFFFFFFFFULL);
+	KUNIT_EXPECT_EQ(test, result_data.calTarget[1], target_uid >> 32);
+	KUNIT_EXPECT_EQ(test, result_data.calTime[0],
+			      priv->cal_blob->data[param->amp_index].calTime[0]);
+	KUNIT_EXPECT_EQ(test, result_data.calTime[1],
+			      priv->cal_blob->data[param->amp_index].calTime[1]);
+	KUNIT_EXPECT_EQ(test, result_data.calAmbient,
+			      priv->cal_blob->data[param->amp_index].calAmbient);
+	KUNIT_EXPECT_EQ(test, result_data.calStatus,
+			      priv->cal_blob->data[param->amp_index].calStatus);
+	KUNIT_EXPECT_EQ(test, result_data.calR,
+			      priv->cal_blob->data[param->amp_index].calR);
+}
+
+/* Get cal data block for a given amp index without checking target UID. */
+static void cs_amp_lib_test_get_efi_cal_by_index_unchecked_test(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	const struct cs_amp_lib_test_param *param = test->param_value;
+	struct cirrus_amp_cal_data result_data;
+	int ret;
+
+	cs_amp_lib_test_init_dummy_cal_blob(test, param->num_amps);
+
+	/* Redirect calls to get EFI data */
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_variable);
+
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, 0,
+					      param->amp_index, &result_data);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
+
+	KUNIT_EXPECT_EQ(test, result_data.calTime[0],
+			      priv->cal_blob->data[param->amp_index].calTime[0]);
+	KUNIT_EXPECT_EQ(test, result_data.calTime[1],
+			      priv->cal_blob->data[param->amp_index].calTime[1]);
+	KUNIT_EXPECT_EQ(test, result_data.calAmbient,
+			      priv->cal_blob->data[param->amp_index].calAmbient);
+	KUNIT_EXPECT_EQ(test, result_data.calStatus,
+			      priv->cal_blob->data[param->amp_index].calStatus);
+	KUNIT_EXPECT_EQ(test, result_data.calR,
+			      priv->cal_blob->data[param->amp_index].calR);
+}
+
+/* Get cal data block for a given amp index with checked target UID. */
+static void cs_amp_lib_test_get_efi_cal_by_index_checked_test(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	const struct cs_amp_lib_test_param *param = test->param_value;
+	struct cirrus_amp_cal_data result_data;
+	u64 target_uid;
+	int ret;
+
+	cs_amp_lib_test_init_dummy_cal_blob(test, param->num_amps);
+
+	/* Redirect calls to get EFI data */
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_variable);
+
+	target_uid = cs_amp_lib_test_get_target_uid(test);
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, target_uid,
+					      param->amp_index, &result_data);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
+
+	KUNIT_EXPECT_EQ(test, result_data.calTime[0],
+			      priv->cal_blob->data[param->amp_index].calTime[0]);
+	KUNIT_EXPECT_EQ(test, result_data.calTime[1],
+			      priv->cal_blob->data[param->amp_index].calTime[1]);
+	KUNIT_EXPECT_EQ(test, result_data.calAmbient,
+			      priv->cal_blob->data[param->amp_index].calAmbient);
+	KUNIT_EXPECT_EQ(test, result_data.calStatus,
+			      priv->cal_blob->data[param->amp_index].calStatus);
+	KUNIT_EXPECT_EQ(test, result_data.calR,
+			      priv->cal_blob->data[param->amp_index].calR);
+}
+
+/*
+ * Get cal data block for a given amp index with checked target UID.
+ * The UID does not match so the result should be -ENOENT.
+ */
+static void cs_amp_lib_test_get_efi_cal_by_index_uid_mismatch_test(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	const struct cs_amp_lib_test_param *param = test->param_value;
+	struct cirrus_amp_cal_data result_data;
+	u64 target_uid;
+	int ret;
+
+	cs_amp_lib_test_init_dummy_cal_blob(test, param->num_amps);
+
+	/* Redirect calls to get EFI data */
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_variable);
+
+	/* Get a target UID that won't match the entry */
+	target_uid = ~cs_amp_lib_test_get_target_uid(test);
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, target_uid,
+					      param->amp_index, &result_data);
+	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
+
+	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
+}
+
+/*
+ * Get cal data block for a given amp, where the cal data does not
+ * specify calTarget so the lookup falls back to using the index
+ */
+static void cs_amp_lib_test_get_efi_cal_by_index_fallback_test(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	const struct cs_amp_lib_test_param *param = test->param_value;
+	struct cirrus_amp_cal_data result_data;
+	static const u64 bad_target_uid = 0xBADCA100BABABABAULL;
+	int i, ret;
+
+	cs_amp_lib_test_init_dummy_cal_blob(test, param->num_amps);
+
+	/* Make all the target values zero so they are ignored */
+	for (i = 0; i < priv->cal_blob->count; ++i) {
+		priv->cal_blob->data[i].calTarget[0] = 0;
+		priv->cal_blob->data[i].calTarget[1] = 0;
+	}
+
+	/* Redirect calls to get EFI data */
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_variable);
+
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, bad_target_uid,
+					      param->amp_index, &result_data);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
+
+	KUNIT_EXPECT_EQ(test, result_data.calTime[0],
+			      priv->cal_blob->data[param->amp_index].calTime[0]);
+	KUNIT_EXPECT_EQ(test, result_data.calTime[1],
+			      priv->cal_blob->data[param->amp_index].calTime[1]);
+	KUNIT_EXPECT_EQ(test, result_data.calAmbient,
+			      priv->cal_blob->data[param->amp_index].calAmbient);
+	KUNIT_EXPECT_EQ(test, result_data.calStatus,
+			      priv->cal_blob->data[param->amp_index].calStatus);
+	KUNIT_EXPECT_EQ(test, result_data.calR,
+			      priv->cal_blob->data[param->amp_index].calR);
+}
+
+/*
+ * If the target UID isn't present in the cal data, and there isn't an
+ * index to fall back do, the result should be -ENOENT.
+ */
+static void cs_amp_lib_test_get_efi_cal_uid_not_found_noindex_test(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	struct cirrus_amp_cal_data result_data;
+	static const u64 bad_target_uid = 0xBADCA100BABABABAULL;
+	int i, ret;
+
+	cs_amp_lib_test_init_dummy_cal_blob(test, 8);
+
+	/* Make all the target values != bad_target_uid */
+	for (i = 0; i < priv->cal_blob->count; ++i) {
+		priv->cal_blob->data[i].calTarget[0] &= ~(bad_target_uid & 0xFFFFFFFFULL);
+		priv->cal_blob->data[i].calTarget[1] &= ~(bad_target_uid >> 32);
+	}
+
+	/* Redirect calls to get EFI data */
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_variable);
+
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, bad_target_uid, -1,
+					      &result_data);
+	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
+
+	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
+}
+
+/*
+ * If the target UID isn't present in the cal data, and the index is
+ * out of range, the result should be -ENOENT.
+ */
+static void cs_amp_lib_test_get_efi_cal_uid_not_found_index_not_found_test(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	struct cirrus_amp_cal_data result_data;
+	static const u64 bad_target_uid = 0xBADCA100BABABABAULL;
+	int i, ret;
+
+	cs_amp_lib_test_init_dummy_cal_blob(test, 8);
+
+	/* Make all the target values != bad_target_uid */
+	for (i = 0; i < priv->cal_blob->count; ++i) {
+		priv->cal_blob->data[i].calTarget[0] &= ~(bad_target_uid & 0xFFFFFFFFULL);
+		priv->cal_blob->data[i].calTarget[1] &= ~(bad_target_uid >> 32);
+	}
+
+	/* Redirect calls to get EFI data */
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_variable);
+
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, bad_target_uid, 99,
+					      &result_data);
+	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
+
+	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
+}
+
+/*
+ * If the target UID isn't given, and the index is out of range, the
+ * result should be -ENOENT.
+ */
+static void cs_amp_lib_test_get_efi_cal_no_uid_index_not_found_test(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	struct cirrus_amp_cal_data result_data;
+	int ret;
+
+	cs_amp_lib_test_init_dummy_cal_blob(test, 8);
+
+	/* Redirect calls to get EFI data */
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_variable);
+
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, 0, 99, &result_data);
+	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
+
+	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
+}
+
+/* If neither the target UID or the index is given the result should be -ENOENT. */
+static void cs_amp_lib_test_get_efi_cal_no_uid_no_index_test(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	struct cirrus_amp_cal_data result_data;
+	int ret;
+
+	cs_amp_lib_test_init_dummy_cal_blob(test, 8);
+
+	/* Redirect calls to get EFI data */
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_variable);
+
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, 0, -1, &result_data);
+	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
+
+	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
+}
+
+/*
+ * If the UID is passed as 0 this must not match an entry with an
+ * unpopulated calTarget
+ */
+static void cs_amp_lib_test_get_efi_cal_zero_not_matched_test(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	struct cirrus_amp_cal_data result_data;
+	int i, ret;
+
+	cs_amp_lib_test_init_dummy_cal_blob(test, 8);
+
+	/* Make all the target values zero so they are ignored */
+	for (i = 0; i < priv->cal_blob->count; ++i) {
+		priv->cal_blob->data[i].calTarget[0] = 0;
+		priv->cal_blob->data[i].calTarget[1] = 0;
+	}
+
+	/* Redirect calls to get EFI data */
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs_amp_lib_test_get_efi_variable);
+
+	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, 0, -1, &result_data);
+	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
+
+	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
+}
+
+static const struct cirrus_amp_cal_controls cs_amp_lib_test_calibration_controls = {
+	.alg_id =	0x9f210,
+	.mem_region =	WMFW_ADSP2_YM,
+	.ambient =	"CAL_AMBIENT",
+	.calr =		"CAL_R",
+	.status =	"CAL_STATUS",
+	.checksum =	"CAL_CHECKSUM",
+};
+
+static int cs_amp_lib_test_write_cal_coeff(struct wm_adsp *dsp,
+					   const struct cirrus_amp_cal_controls *controls,
+					   const char *ctl_name, u32 val)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	struct cs_amp_lib_test_ctl_write_entry *entry;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctl_name);
+	KUNIT_EXPECT_PTR_EQ(test, controls, &cs_amp_lib_test_calibration_controls);
+
+	entry = kunit_kzalloc(test, sizeof(*entry), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, entry);
+
+	INIT_LIST_HEAD(&entry->list);
+	strscpy(entry->name, ctl_name, sizeof(entry->name));
+	entry->value = val;
+
+	list_add_tail(&entry->list, &priv->ctl_write_list);
+
+	return 0;
+}
+
+static void cs_amp_lib_test_write_cal_data_test(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+	struct cs_amp_lib_test_ctl_write_entry *entry;
+	struct cirrus_amp_cal_data data;
+	struct wm_adsp *dsp;
+	int ret;
+
+	dsp = kunit_kzalloc(test, sizeof(*dsp), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dsp);
+	dsp->cs_dsp.dev = &priv->amp_pdev.dev;
+
+	get_random_bytes(&data, sizeof(data));
+
+	/* Redirect calls to write firmware controls */
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->write_cal_coeff,
+				   cs_amp_lib_test_write_cal_coeff);
+
+	ret = cs_amp_write_cal_coeffs(dsp, &cs_amp_lib_test_calibration_controls, &data);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	kunit_deactivate_static_stub(test, cs_amp_test_hooks->write_cal_coeff);
+
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&priv->ctl_write_list), 4);
+
+	/* Checksum control must be written last */
+	entry = list_last_entry(&priv->ctl_write_list, typeof(*entry), list);
+	KUNIT_EXPECT_STREQ(test, entry->name, cs_amp_lib_test_calibration_controls.checksum);
+	KUNIT_EXPECT_EQ(test, entry->value, data.calR + 1);
+	list_del(&entry->list);
+
+	entry = list_first_entry(&priv->ctl_write_list, typeof(*entry), list);
+	KUNIT_EXPECT_STREQ(test, entry->name, cs_amp_lib_test_calibration_controls.ambient);
+	KUNIT_EXPECT_EQ(test, entry->value, data.calAmbient);
+	list_del(&entry->list);
+
+	entry = list_first_entry(&priv->ctl_write_list, typeof(*entry), list);
+	KUNIT_EXPECT_STREQ(test, entry->name, cs_amp_lib_test_calibration_controls.calr);
+	KUNIT_EXPECT_EQ(test, entry->value, data.calR);
+	list_del(&entry->list);
+
+	entry = list_first_entry(&priv->ctl_write_list, typeof(*entry), list);
+	KUNIT_EXPECT_STREQ(test, entry->name, cs_amp_lib_test_calibration_controls.status);
+	KUNIT_EXPECT_EQ(test, entry->value, data.calStatus);
+}
+
+static void cs_amp_lib_test_dev_release(struct device *dev)
+{
+}
+
+static int cs_amp_lib_test_case_init(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv;
+	int ret;
+
+	KUNIT_ASSERT_NOT_NULL(test, cs_amp_test_hooks);
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	test->priv = priv;
+	INIT_LIST_HEAD(&priv->ctl_write_list);
+
+	/* Create dummy amp driver dev */
+	priv->amp_pdev.name = "cs_amp_lib_test_drv";
+	priv->amp_pdev.id = -1;
+	priv->amp_pdev.dev.release = cs_amp_lib_test_dev_release;
+	ret = platform_device_register(&priv->amp_pdev);
+	KUNIT_ASSERT_GE_MSG(test, ret, 0, "Failed to register amp platform device\n");
+
+	return 0;
+}
+
+static void cs_amp_lib_test_case_exit(struct kunit *test)
+{
+	struct cs_amp_lib_test_priv *priv = test->priv;
+
+	if (priv->amp_pdev.name)
+		platform_device_unregister(&priv->amp_pdev);
+}
+
+static const struct cs_amp_lib_test_param cs_amp_lib_test_get_cal_param_cases[] = {
+	{ .num_amps = 2, .amp_index = 0 },
+	{ .num_amps = 2, .amp_index = 1 },
+
+	{ .num_amps = 3, .amp_index = 0 },
+	{ .num_amps = 3, .amp_index = 1 },
+	{ .num_amps = 3, .amp_index = 2 },
+
+	{ .num_amps = 4, .amp_index = 0 },
+	{ .num_amps = 4, .amp_index = 1 },
+	{ .num_amps = 4, .amp_index = 2 },
+	{ .num_amps = 4, .amp_index = 3 },
+
+	{ .num_amps = 5, .amp_index = 0 },
+	{ .num_amps = 5, .amp_index = 1 },
+	{ .num_amps = 5, .amp_index = 2 },
+	{ .num_amps = 5, .amp_index = 3 },
+	{ .num_amps = 5, .amp_index = 4 },
+
+	{ .num_amps = 6, .amp_index = 0 },
+	{ .num_amps = 6, .amp_index = 1 },
+	{ .num_amps = 6, .amp_index = 2 },
+	{ .num_amps = 6, .amp_index = 3 },
+	{ .num_amps = 6, .amp_index = 4 },
+	{ .num_amps = 6, .amp_index = 5 },
+
+	{ .num_amps = 8, .amp_index = 0 },
+	{ .num_amps = 8, .amp_index = 1 },
+	{ .num_amps = 8, .amp_index = 2 },
+	{ .num_amps = 8, .amp_index = 3 },
+	{ .num_amps = 8, .amp_index = 4 },
+	{ .num_amps = 8, .amp_index = 5 },
+	{ .num_amps = 8, .amp_index = 6 },
+	{ .num_amps = 8, .amp_index = 7 },
+};
+
+static void cs_amp_lib_test_get_cal_param_desc(const struct cs_amp_lib_test_param *param,
+					       char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "num_amps:%d amp_index:%d",
+		 param->num_amps, param->amp_index);
+}
+
+KUNIT_ARRAY_PARAM(cs_amp_lib_test_get_cal, cs_amp_lib_test_get_cal_param_cases,
+		  cs_amp_lib_test_get_cal_param_desc);
+
+static struct kunit_case cs_amp_lib_test_cases[] = {
+	/* Tests for getting calibration data from EFI */
+	KUNIT_CASE(cs_amp_lib_test_cal_data_too_short_test),
+	KUNIT_CASE(cs_amp_lib_test_cal_count_too_big_test),
+	KUNIT_CASE(cs_amp_lib_test_no_cal_data_test),
+	KUNIT_CASE(cs_amp_lib_test_get_efi_cal_uid_not_found_noindex_test),
+	KUNIT_CASE(cs_amp_lib_test_get_efi_cal_uid_not_found_index_not_found_test),
+	KUNIT_CASE(cs_amp_lib_test_get_efi_cal_no_uid_index_not_found_test),
+	KUNIT_CASE(cs_amp_lib_test_get_efi_cal_no_uid_no_index_test),
+	KUNIT_CASE(cs_amp_lib_test_get_efi_cal_zero_not_matched_test),
+	KUNIT_CASE_PARAM(cs_amp_lib_test_get_efi_cal_by_uid_test,
+			 cs_amp_lib_test_get_cal_gen_params),
+	KUNIT_CASE_PARAM(cs_amp_lib_test_get_efi_cal_by_index_unchecked_test,
+			 cs_amp_lib_test_get_cal_gen_params),
+	KUNIT_CASE_PARAM(cs_amp_lib_test_get_efi_cal_by_index_checked_test,
+			 cs_amp_lib_test_get_cal_gen_params),
+	KUNIT_CASE_PARAM(cs_amp_lib_test_get_efi_cal_by_index_uid_mismatch_test,
+			 cs_amp_lib_test_get_cal_gen_params),
+	KUNIT_CASE_PARAM(cs_amp_lib_test_get_efi_cal_by_index_fallback_test,
+			 cs_amp_lib_test_get_cal_gen_params),
+
+	/* Tests for writing calibration data */
+	KUNIT_CASE(cs_amp_lib_test_write_cal_data_test),
+
+	{ } /* terminator */
+};
+
+static struct kunit_suite cs_amp_lib_test_suite = {
+	.name = "snd-soc-cs-amp-lib-test",
+	.init = cs_amp_lib_test_case_init,
+	.exit = cs_amp_lib_test_case_exit,
+	.test_cases = cs_amp_lib_test_cases,
+};
+
+kunit_test_suite(cs_amp_lib_test_suite);
+
+MODULE_IMPORT_NS(SND_SOC_CS_AMP_LIB);
+MODULE_DESCRIPTION("KUnit test for Cirrus Logic amplifier library");
+MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 0e1249342a78..a6ac96ecb176 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -6,6 +6,7 @@
 //               Cirrus Logic International Semiconductor Ltd.
 
 #include <asm/byteorder.h>
+#include <kunit/static_stub.h>
 #include <linux/dev_printk.h>
 #include <linux/efi.h>
 #include <linux/module.h>
@@ -26,6 +27,8 @@ static int cs_amp_write_cal_coeff(struct wm_adsp *dsp,
 	__be32 beval = cpu_to_be32(val);
 	int ret;
 
+	KUNIT_STATIC_STUB_REDIRECT(cs_amp_write_cal_coeff, dsp, controls, ctl_name, val);
+
 	if (IS_REACHABLE(CONFIG_SND_SOC_WM_ADSP)) {
 		ret = wm_adsp_write_ctl(dsp, ctl_name, controls->mem_region,
 					controls->alg_id, &beval, sizeof(beval));
@@ -78,7 +81,7 @@ int cs_amp_write_cal_coeffs(struct wm_adsp *dsp,
 			    const struct cirrus_amp_cal_controls *controls,
 			    const struct cirrus_amp_cal_data *data)
 {
-	if (IS_REACHABLE(CONFIG_SND_SOC_WM_ADSP))
+	if (IS_REACHABLE(CONFIG_SND_SOC_WM_ADSP) || IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST))
 		return _cs_amp_write_cal_coeffs(dsp, controls, data);
 	else
 		return -ENODEV;
@@ -92,6 +95,8 @@ static efi_status_t cs_amp_get_efi_variable(efi_char16_t *name,
 {
 	u32 attr;
 
+	KUNIT_STATIC_STUB_REDIRECT(cs_amp_get_efi_variable, name, guid, size, buf);
+
 	if (IS_ENABLED(CONFIG_EFI))
 		return efi.get_variable(name, guid, &attr, size, buf);
 
@@ -244,13 +249,22 @@ static int _cs_amp_get_efi_calibration_data(struct device *dev, u64 target_uid,
 int cs_amp_get_efi_calibration_data(struct device *dev, u64 target_uid, int amp_index,
 				    struct cirrus_amp_cal_data *out_data)
 {
-	if (IS_ENABLED(CONFIG_EFI))
+	if (IS_ENABLED(CONFIG_EFI) || IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST))
 		return _cs_amp_get_efi_calibration_data(dev, target_uid, amp_index, out_data);
 	else
 		return -ENOENT;
 }
 EXPORT_SYMBOL_NS_GPL(cs_amp_get_efi_calibration_data, SND_SOC_CS_AMP_LIB);
 
+static const struct cs_amp_test_hooks cs_amp_test_hook_ptrs = {
+	.get_efi_variable = cs_amp_get_efi_variable,
+	.write_cal_coeff = cs_amp_write_cal_coeff,
+};
+
+const struct cs_amp_test_hooks * const cs_amp_test_hooks =
+	PTR_IF(IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST), &cs_amp_test_hook_ptrs);
+EXPORT_SYMBOL_NS_GPL(cs_amp_test_hooks, SND_SOC_CS_AMP_LIB);
+
 MODULE_DESCRIPTION("Cirrus Logic amplifier library");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
-- 
2.30.2

