Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A72D98939EC
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:03:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3472218B;
	Mon,  1 Apr 2024 12:03:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3472218B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711965795;
	bh=ImXU1s+ziaP2Z40BfdA5X2xpNVe3p9EN+iG/UF6M7pY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gh6xHsARg6+sbiKGV3qIbkzMZvywcwlygVumTmixrNZRWpXhSbzrqmGyE7k2AFJE3
	 81lLwTSR7h9sGPEuKGsmAGN81X+7HPtg2aVudieU3RyC/2hDBRzOcQgoOBpyMnFDQr
	 wWytZXgdoH3WUysTURGIiZFFLbR1OFp0lPsl8Gas=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5047F805D3; Mon,  1 Apr 2024 12:02:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFB0BF805C9;
	Mon,  1 Apr 2024 12:02:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBF27F805AC; Mon,  1 Apr 2024 12:02:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37A17F8020D
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37A17F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=IECkVOhi
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4315mEb3029960;
	Mon, 1 Apr 2024 05:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=BsjfU2++YD2KMtQsHziYmhBOdrFvAcXQOjckWGQdiCY=; b=
	IECkVOhisZ8akWVbju5r4GLAZCv6pwUaoSJSzljfnBvXf8EAoJUAbtTVJsJu8i4y
	i30+dk+1MsqgUZsfIyFIke/sE6Vr0yi/B0TWLGuWJFZmCC5xnX62peLzX/1XiqsH
	n85WCD+xxo/j2jFZWxKlKDEQikphYdQFjSMk2fwaq0nYWSbMsjOJlNIdznECePCF
	Fdb7Wt09FiPFT3o9yWdEmPU0fvCjMA4PpIUcjjEW1OLoGbS4738QoISFMDrVSSXC
	E4yKkYeIVQCV6lirvxS5gw/j6CvDPIKQ3NVEKZnxHLjHiwHc9sbHTnkX8JdSNYVj
	zrONt9flIr9+YsJRmNtOBw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x6g4xhtw6-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 05:02:14 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Apr 2024
 11:02:10 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Mon, 1 Apr 2024 11:02:10 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 43DD7820271;
	Mon,  1 Apr 2024 10:02:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH v2 3/3] ASoC: soc-card: Add KUnit test case for
 snd_soc_card_get_kcontrol
Date: Mon, 1 Apr 2024 10:02:10 +0000
Message-ID: <20240401100210.61277-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240401100210.61277-1-rf@opensource.cirrus.com>
References: <20240401100210.61277-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UmITU5UMEQXXuzPm6VTxcYNBRm-NEamv
X-Proofpoint-GUID: UmITU5UMEQXXuzPm6VTxcYNBRm-NEamv
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OO7Y5LIY46DD3MYKK4MDQJNRQGIAV4FR
X-Message-ID-Hash: OO7Y5LIY46DD3MYKK4MDQJNRQGIAV4FR
X-MailFrom: prvs=1821bd3749=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OO7Y5LIY46DD3MYKK4MDQJNRQGIAV4FR/>
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
 sound/soc/soc-card-test.c | 184 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 196 insertions(+)
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
index 000000000000..075c52fe82e5
--- /dev/null
+++ b/sound/soc/soc-card-test.c
@@ -0,0 +1,184 @@
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
+static const struct snd_kcontrol_new test_card_controls[] = {
+	SOC_SINGLE("Fee", SND_SOC_NOPM, 0, 1, 0),
+	SOC_SINGLE("Fi", SND_SOC_NOPM, 1, 1, 0),
+	SOC_SINGLE("Fo", SND_SOC_NOPM, 2, 1, 0),
+	SOC_SINGLE("Fum", SND_SOC_NOPM, 3, 1, 0),
+	SOC_SINGLE("Left Fee", SND_SOC_NOPM, 4, 1, 0),
+	SOC_SINGLE("Right Fee", SND_SOC_NOPM, 5, 1, 0),
+	SOC_SINGLE("Left Fi", SND_SOC_NOPM, 6, 1, 0),
+	SOC_SINGLE("Right Fi", SND_SOC_NOPM, 7, 1, 0),
+	SOC_SINGLE("Left Fo", SND_SOC_NOPM, 8, 1, 0),
+	SOC_SINGLE("Right Fo", SND_SOC_NOPM, 9, 1, 0),
+	SOC_SINGLE("Left Fum", SND_SOC_NOPM, 10, 1, 0),
+	SOC_SINGLE("Right Fum", SND_SOC_NOPM, 11, 1, 0),
+};
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
+	for (i = 0; i < ARRAY_SIZE(test_card_controls); ++i) {
+		kc = snd_soc_card_get_kcontrol(card, test_card_controls[i].name);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL_MSG(test, kc, "Failed to find '%s'\n",
+						 test_card_controls[i].name);
+		if (!kc)
+			continue;
+
+		/* Test that it is the correct control */
+		mc = (struct soc_mixer_control *)kc->private_value;
+		KUNIT_EXPECT_EQ_MSG(test, mc->shift, i, "For '%s'\n", test_card_controls[i].name);
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
+	for (i = 0; i < ARRAY_SIZE(test_card_controls); ++i) {
+		down_read(&card->snd_card->controls_rwsem);
+		kc = snd_soc_card_get_kcontrol_locked(card, test_card_controls[i].name);
+		up_read(&card->snd_card->controls_rwsem);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL_MSG(test, kc, "Failed to find '%s'\n",
+						 test_card_controls[i].name);
+		if (!kc)
+			continue;
+
+		/* Test that it is the correct control */
+		mc = (struct soc_mixer_control *)kc->private_value;
+		KUNIT_EXPECT_EQ_MSG(test, mc->shift, i, "For '%s'\n", test_card_controls[i].name);
+
+		down_write(&card->snd_card->controls_rwsem);
+		kcw = snd_soc_card_get_kcontrol_locked(card, test_card_controls[i].name);
+		up_write(&card->snd_card->controls_rwsem);
+		KUNIT_EXPECT_NOT_ERR_OR_NULL_MSG(test, kcw, "Failed to find '%s'\n",
+						 test_card_controls[i].name);
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

