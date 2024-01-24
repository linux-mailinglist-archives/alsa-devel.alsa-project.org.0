Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2295683AED8
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 17:56:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8495384C;
	Wed, 24 Jan 2024 17:56:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8495384C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706115418;
	bh=a1HguVsqtkibfnCsqigz2NZCOqz//9IFy1JRq8o2WdA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cIc+8zLu51HCc6utNiqH3K8mto9CldXdEV10CL7MNj2Unk55RX687W9hCTfO2lbWN
	 rVHPdel6oEeT8ggm0Sbe9rHtuf4ydLwrzu5QYqTttwXhjky22DuGrMmvSV50Tscwo1
	 /9bAsSCXSLQ9IZdIPvpOr7G6zjOFxbkG1F7VCK8I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52A1DF805A8; Wed, 24 Jan 2024 17:56:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3EDAF8057B;
	Wed, 24 Jan 2024 17:56:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79DDFF80520; Wed, 24 Jan 2024 17:56:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9400FF8025F
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 17:56:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9400FF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=cy2iYVnf
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O7L4kt000450;
	Wed, 24 Jan 2024 10:56:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=1
	EeeXooNVx6FHXV/l/u+FrpuJmEB2sYqBuE8cmw6cKI=; b=cy2iYVnfuUaJwNrfg
	o82uQPhCayu+07iUBUxqbk3AKDbRptQr9aN+bD+sMo2RM+BA9Ut1rUCvj5JzisTG
	L/1zE5o9u5vRrk7f5YGDPqkYwx8icZKBZJlZRAGmz6cXw84c02/1d3Us6idhBqpk
	HGtpIj/e2f3sCH/0H9VbDscU7N5U36CedmtbQGmaVD3RV4+p9hKvQ0IGdZSFM1KD
	D32jjUdq1vEcYAQIZk2xZLJIuJhhB+NyPv53GkWGcqqJ2VkE/dVsjiOf5Y2ZO2xT
	QuX6rAEOaZAXuFRGp9hYR9o7N3muPTLaOLwXh/yFCHVK5bNsmxtAoJJakML5rTGY
	x+WqQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhh44s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 10:56:01 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 16:55:59 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 16:55:58 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E09E3820246;
	Wed, 24 Jan 2024 16:55:58 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH 1/7] ASoC: cs42l43: Tidy up header includes
Date: Wed, 24 Jan 2024 16:55:52 +0000
Message-ID: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 0k54TIZoG0mSAqSEBMAJHDWt6DsXDcRu
X-Proofpoint-GUID: 0k54TIZoG0mSAqSEBMAJHDWt6DsXDcRu
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2FJJKIOTQQBXATCRLJTGGC5T5HPUXRAF
X-Message-ID-Hash: 2FJJKIOTQQBXATCRLJTGGC5T5HPUXRAF
X-MailFrom: prvs=8753590469=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FJJKIOTQQBXATCRLJTGGC5T5HPUXRAF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use more forward declarations, move header guards to cover other
includes, and rely less on including headers through other headers.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c |  5 +++++
 sound/soc/codecs/cs42l43-sdw.c  |  1 +
 sound/soc/codecs/cs42l43.c      |  8 ++++++++
 sound/soc/codecs/cs42l43.h      | 19 ++++++++++---------
 4 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 24a598f2ed9a3..1d8d7bf0a6b0d 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -6,19 +6,24 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 
 #include <linux/build_bug.h>
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/irq.h>
 #include <linux/jiffies.h>
 #include <linux/mfd/cs42l43.h>
 #include <linux/mfd/cs42l43-regs.h>
+#include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/workqueue.h>
 #include <sound/control.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc-component.h>
+#include <sound/soc-jack.h>
 #include <sound/soc.h>
 
 #include "cs42l43.h"
diff --git a/sound/soc/codecs/cs42l43-sdw.c b/sound/soc/codecs/cs42l43-sdw.c
index 388f95853b699..60c00c05da055 100644
--- a/sound/soc/codecs/cs42l43-sdw.c
+++ b/sound/soc/codecs/cs42l43-sdw.c
@@ -9,6 +9,7 @@
 #include <linux/mfd/cs42l43.h>
 #include <linux/mfd/cs42l43-regs.h>
 #include <linux/module.h>
+#include <linux/soundwire/sdw.h>
 #include <sound/pcm.h>
 #include <sound/sdw.h>
 #include <sound/soc-component.h>
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 6a64681767de8..f2332f90f8337 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -6,17 +6,25 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 
 #include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/gcd.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/jiffies.h>
 #include <linux/mfd/cs42l43.h>
 #include <linux/mfd/cs42l43-regs.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/string.h>
+#include <linux/workqueue.h>
 #include <sound/control.h>
+#include <sound/cs42l43.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc-component.h>
diff --git a/sound/soc/codecs/cs42l43.h b/sound/soc/codecs/cs42l43.h
index 125e36861d5d5..a491e9254568e 100644
--- a/sound/soc/codecs/cs42l43.h
+++ b/sound/soc/codecs/cs42l43.h
@@ -6,19 +6,14 @@
  *                         Cirrus Logic International Semiconductor Ltd.
  */
 
-#include <linux/clk.h>
+#ifndef CS42L43_ASOC_INT_H
+#define CS42L43_ASOC_INT_H
+
 #include <linux/completion.h>
-#include <linux/device.h>
 #include <linux/mutex.h>
-#include <linux/regmap.h>
-#include <linux/soundwire/sdw.h>
 #include <linux/types.h>
-#include <sound/cs42l43.h>
+#include <linux/workqueue.h>
 #include <sound/pcm.h>
-#include <sound/soc-jack.h>
-
-#ifndef CS42L43_ASOC_INT_H
-#define CS42L43_ASOC_INT_H
 
 #define CS42L43_INTERNAL_SYSCLK		24576000
 #define CS42L43_DEFAULT_SLOTS		0x3F
@@ -37,6 +32,12 @@
 
 #define CS42L43_N_BUTTONS	6
 
+struct device;
+struct cs42l43;
+struct snd_soc_component;
+struct snd_soc_jack;
+struct clk;
+
 struct cs42l43_codec {
 	struct device *dev;
 	struct cs42l43 *core;
-- 
2.30.2

