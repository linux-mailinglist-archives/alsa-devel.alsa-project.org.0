Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 558F788A097
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 13:58:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 038B02317;
	Mon, 25 Mar 2024 13:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 038B02317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711371505;
	bh=KAkp6ZG1HJCNBKpK+cV58ymlaJFEhxPoBcSPFRGnSJY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fe8AH5HP3ga2LobAItSEU0DSGiq4rqIpbwB7//LMvIKpl41lhz5ncsy+ZtnEIkERX
	 pty6SwAqWXXPqTKxwqatyMc4GnG3pkAXrfazyiA2aHTHqNUd+ZgN6MYddmRfIQSvj3
	 XJq2jT75G9xuRh4mhniiFrA+1XcBB4rMrRQZaffk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36A78F80609; Mon, 25 Mar 2024 13:57:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A01CF80605;
	Mon, 25 Mar 2024 13:57:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B71EF805FD; Mon, 25 Mar 2024 13:57:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26356F80074
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 13:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26356F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=YfmoFQrY
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42P3wbgE000927;
	Mon, 25 Mar 2024 07:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=nAB0dJ2HdORX8jURp4dgpK3+AvV+URUyc6m6FRYVQOM=; b=
	YfmoFQrYRhMINhsbtAl7p6TirD7zEQIl45EUwiCy+/5f6xXrvKrOQoyrhmkmbW3e
	BUH2TjEViLVIZPMAtLy54qjQvmYYtrrfhsetgqpQDBHVM+f+Ii8VgoG6Mk2GO+QN
	/34pT26I95MZ63/3sMdITZS6vyEGWHC4aOksUTLD1y+p9E800CIYWnXEBBRKRsQ6
	DjrOKeVAMib6IHGq/Dw2wum1gKKs7JQfwLfu5AQjCwmwwU5z62fmdvU2TnJiKE8k
	FNuCDz+RVLgBCVMrSkL8MXo3mD+JhYYONr7kRrwUxckomEhjG0UVK8jPFwhAtLpg
	amQdB1Lay8amDDkMFxRFCQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x1vfyba74-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 07:56:54 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 25 Mar
 2024 12:56:50 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Mon, 25 Mar 2024 12:56:50 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 4C46B820257;
	Mon, 25 Mar 2024 12:56:50 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 3/3] ASoC: soc-card: Add KUnit test case for
 snd_soc_card_get_kcontrol
Date: Mon, 25 Mar 2024 12:56:50 +0000
Message-ID: <20240325125650.213913-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325125650.213913-1-rf@opensource.cirrus.com>
References: <20240325125650.213913-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: s_bda96Oe7HkM5FUO0OTdFoQT2BGSnAo
X-Proofpoint-GUID: s_bda96Oe7HkM5FUO0OTdFoQT2BGSnAo
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VHL3ZGWJAM4YX6QHB2YOLH53UHAX2KJB
X-Message-ID-Hash: VHL3ZGWJAM4YX6QHB2YOLH53UHAX2KJB
X-MailFrom: prvs=081491209a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VHL3ZGWJAM4YX6QHB2YOLH53UHAX2KJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a new snd-soc-card KUnit test with a simple test case for
snd_soc_card_get_kcontrol() and snd_soc_card_get_kcontrol_locked().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/Kconfig         |   8 ++
 sound/soc/Makefile        |   4 +
 sound/soc/soc-card-test.c | 191 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 203 insertions(+)
 create mode 100644 sound/soc/soc-card-test.c

diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index 439fa631c342..a52afb423b46 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -66,6 +66,14 @@ config SND_SOC_TOPOLOGY_KUNIT_TEST
 	  userspace applications such as pulseaudio, to prevent unnecessary
 	  problems.
 
+config SND_SOC_CARD_KUNIT_TEST
+	tristate "KUnit tests for SoC card"
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  If you want to perform tests on ALSA SoC card functions say Y here.
+	  If unsure, say N.
+
 config SND_SOC_UTILS_KUNIT_TEST
 	tristate "KUnit tests for SoC utils"
 	depends on KUNIT
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index 8376fdb217ed..f90f5300b36e 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -12,6 +12,10 @@ ifneq ($(CONFIG_SND_SOC_TOPOLOGY_KUNIT_TEST),)
 obj-$(CONFIG_SND_SOC_TOPOLOGY_KUNIT_TEST) += soc-topology-test.o
 endif
 
+ifneq ($(CONFIG_SND_SOC_CARD_KUNIT_TEST),)
+obj-$(CONFIG_SND_SOC_CARD_KUNIT_TEST) += soc-card-test.o
+endif
+
 ifneq ($(CONFIG_SND_SOC_UTILS_KUNIT_TEST),)
 # snd-soc-test-objs := soc-utils-test.o
 obj-$(CONFIG_SND_SOC_UTILS_KUNIT_TEST) += soc-utils-test.o
diff --git a/sound/soc/soc-card-test.c b/sound/soc/soc-card-test.c
new file mode 100644
index 000000000000..48c71bd1b6b1
--- /dev/null
+++ b/sound/soc/soc-card-test.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2024 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+#include <kunit/device.h>
+#include <kunit/test.h>
+#include <linux/module.h>
+#include <sound/control.h>
+#include <sound/soc.h>
+#include <sound/soc-card.h>
+
+struct soc_card_test_priv {
+	struct device *card_dev;
+	struct snd_soc_card *card;
+};
+
+static const char * const test_control_names[] = {
+	"Fee", "Fi", "Fo", "Fum",
+	"Left Fee", "Right Fee", "Left Fi", "Right Fi",
+	"Left Fo", "Right Fo", "Left Fum", "Right Fum",
+};
+
+static const struct snd_kcontrol_new test_card_controls[] = {
+	SOC_SINGLE(test_control_names[0], SND_SOC_NOPM, 0, 1, 0),
+	SOC_SINGLE(test_control_names[1], SND_SOC_NOPM, 1, 1, 0),
+	SOC_SINGLE(test_control_names[2], SND_SOC_NOPM, 2, 1, 0),
+	SOC_SINGLE(test_control_names[3], SND_SOC_NOPM, 3, 1, 0),
+	SOC_SINGLE(test_control_names[4], SND_SOC_NOPM, 4, 1, 0),
+	SOC_SINGLE(test_control_names[5], SND_SOC_NOPM, 5, 1, 0),
+	SOC_SINGLE(test_control_names[6], SND_SOC_NOPM, 6, 1, 0),
+	SOC_SINGLE(test_control_names[7], SND_SOC_NOPM, 7, 1, 0),
+	SOC_SINGLE(test_control_names[8], SND_SOC_NOPM, 8, 1, 0),
+	SOC_SINGLE(test_control_names[9], SND_SOC_NOPM, 9, 1, 0),
+	SOC_SINGLE(test_control_names[10], SND_SOC_NOPM, 10, 1, 0),
+	SOC_SINGLE(test_control_names[11], SND_SOC_NOPM, 11, 1, 0),
+};
+static_assert(ARRAY_SIZE(test_control_names) == ARRAY_SIZE(test_card_controls));
+
+static void test_snd_soc_card_get_kcontrol(struct kunit *test)
+{
+	struct soc_card_test_priv *priv = test->priv;
+	struct snd_soc_card *card = priv->card;
+	struct snd_kcontrol *kc;
+	struct soc_mixer_control *mc;
+	int i, ret;
+
+	ret = snd_soc_add_card_controls(card, test_card_controls, ARRAY_SIZE(test_card_controls));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* Look up every control */
+	for (i = 0; i < ARRAY_SIZE(test_control_names); ++i) {
+		kc = snd_soc_card_get_kcontrol(card, test_control_names[i]);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL_MSG(test, kc, "Failed to find '%s'\n",
+						 test_control_names[i]);
+		if (!kc)
+			continue;
+
+		/* Test that it is the correct control */
+		mc = (struct soc_mixer_control *)kc->private_value;
+		KUNIT_EXPECT_EQ_MSG(test, mc->shift, i, "For '%s'\n", test_control_names[i]);
+	}
+
+	/* Test some names that should not be found */
+	kc = snd_soc_card_get_kcontrol(card, "None");
+	KUNIT_EXPECT_NULL(test, kc);
+
+	kc = snd_soc_card_get_kcontrol(card, "Left None");
+	KUNIT_EXPECT_NULL(test, kc);
+
+	kc = snd_soc_card_get_kcontrol(card, "Left");
+	KUNIT_EXPECT_NULL(test, kc);
+
+	kc = snd_soc_card_get_kcontrol(card, NULL);
+	KUNIT_EXPECT_NULL(test, kc);
+}
+
+static void test_snd_soc_card_get_kcontrol_locked(struct kunit *test)
+{
+	struct soc_card_test_priv *priv = test->priv;
+	struct snd_soc_card *card = priv->card;
+	struct snd_kcontrol *kc, *kcw;
+	struct soc_mixer_control *mc;
+	int i, ret;
+
+	ret = snd_soc_add_card_controls(card, test_card_controls, ARRAY_SIZE(test_card_controls));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* Look up every control */
+	for (i = 0; i < ARRAY_SIZE(test_control_names); ++i) {
+		down_read(&card->snd_card->controls_rwsem);
+		kc = snd_soc_card_get_kcontrol_locked(card, test_control_names[i]);
+		up_read(&card->snd_card->controls_rwsem);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL_MSG(test, kc, "Failed to find '%s'\n",
+						 test_control_names[i]);
+		if (!kc)
+			continue;
+
+		/* Test that it is the correct control */
+		mc = (struct soc_mixer_control *)kc->private_value;
+		KUNIT_EXPECT_EQ_MSG(test, mc->shift, i, "For '%s'\n", test_control_names[i]);
+
+		down_write(&card->snd_card->controls_rwsem);
+		kcw = snd_soc_card_get_kcontrol_locked(card, test_control_names[i]);
+		up_write(&card->snd_card->controls_rwsem);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL_MSG(test, kcw, "Failed to find '%s'\n",
+						 test_control_names[i]);
+
+		KUNIT_EXPECT_PTR_EQ(test, kc, kcw);
+	}
+
+	/* Test some names that should not be found */
+	down_read(&card->snd_card->controls_rwsem);
+	kc = snd_soc_card_get_kcontrol_locked(card, "None");
+	up_read(&card->snd_card->controls_rwsem);
+	KUNIT_EXPECT_NULL(test, kc);
+
+	down_read(&card->snd_card->controls_rwsem);
+	kc = snd_soc_card_get_kcontrol_locked(card, "Left None");
+	up_read(&card->snd_card->controls_rwsem);
+	KUNIT_EXPECT_NULL(test, kc);
+
+	down_read(&card->snd_card->controls_rwsem);
+	kc = snd_soc_card_get_kcontrol_locked(card, "Left");
+	up_read(&card->snd_card->controls_rwsem);
+	KUNIT_EXPECT_NULL(test, kc);
+
+	down_read(&card->snd_card->controls_rwsem);
+	kc = snd_soc_card_get_kcontrol_locked(card, NULL);
+	up_read(&card->snd_card->controls_rwsem);
+	KUNIT_EXPECT_NULL(test, kc);
+}
+
+static int soc_card_test_case_init(struct kunit *test)
+{
+	struct soc_card_test_priv *priv;
+	int ret;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	test->priv = priv;
+
+	priv->card_dev = kunit_device_register(test, "sound-soc-card-test");
+	priv->card_dev = get_device(priv->card_dev);
+	if (!priv->card_dev)
+		return -ENODEV;
+
+	priv->card = kunit_kzalloc(test, sizeof(*priv->card), GFP_KERNEL);
+	if (!priv->card)
+		return -ENOMEM;
+
+	priv->card->name = "soc-card-test";
+	priv->card->dev = priv->card_dev;
+	priv->card->owner = THIS_MODULE;
+
+	ret = snd_soc_register_card(priv->card);
+	if (!ret)
+		return ret;
+
+	return 0;
+}
+
+static void soc_card_test_case_exit(struct kunit *test)
+{
+	struct soc_card_test_priv *priv = test->priv;
+
+	if (priv->card)
+		snd_soc_unregister_card(priv->card);
+
+	if (priv->card_dev)
+		put_device(priv->card_dev);
+}
+
+static struct kunit_case soc_card_test_cases[] = {
+	KUNIT_CASE(test_snd_soc_card_get_kcontrol),
+	KUNIT_CASE(test_snd_soc_card_get_kcontrol_locked),
+	{}
+};
+
+static struct kunit_suite soc_card_test_suite = {
+	.name = "soc-card",
+	.test_cases = soc_card_test_cases,
+	.init = soc_card_test_case_init,
+	.exit = soc_card_test_case_exit,
+};
+
+kunit_test_suites(&soc_card_test_suite);
+
+MODULE_DESCRIPTION("ASoC soc-card KUnit test");
+MODULE_LICENSE("GPL");
-- 
2.39.2

