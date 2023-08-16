Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CBF77E6F4
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 18:51:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CD28839;
	Wed, 16 Aug 2023 18:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CD28839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692204663;
	bh=16gLVrObP4vq5W99FfW1DXdQufaVekVOpKrl/QWdmaI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tkxQstBQRefB1FhQj6YcEzhMDcrUgURHKaQnvYJU+zx2CDEhHCNkRAMkqzGZ4CFRj
	 a/WxbjLv8R/DCVKzn7UhAjIwScZIaVOGrpV7pOl25l9PmaifMQLAjDYu4HaQWduh2p
	 acggDoQynfhYCW0wIkQc+MBgMA/FqtLa4cOK8mHQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3A56F80558; Wed, 16 Aug 2023 18:49:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E07C6F80549;
	Wed, 16 Aug 2023 18:49:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 317FBF8016A; Wed, 16 Aug 2023 18:49:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94070F8016A
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 18:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94070F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Oap43+jc
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G5L6Ul023417;
	Wed, 16 Aug 2023 11:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=ciRFu0viKeYSMqpvc1bi/uXL1528HUaekAc7k6yN6C0=; b=
	Oap43+jczlrr4NNLqfpyTREjTndSjyqODPj0LSTK3C6u8OyCAZJQhZ9bxwlKlx2G
	oMjaQ4TuLkc4CFZjjadVwAz5WxWeKYUTjw+2rnpc7hJQiU4UhKwsCARAiKBlDBDJ
	TGzPEzV2+xQNxHPDfW6Lhrdg40K5duBfFFo98C3yepFv5l3oOInuEv/6QicVgWNk
	VLIAyyBV0FLqTXpJykkwt1PFqhT6ZKrhiA9ib3Ir/mTwPwxMJDal+fVehmxCe0TL
	nQwyyjOqc6drniYUjVQioR9YReL4yBaMIExswogJSQtqMwkT6t06P/psuzjasDuk
	6AX51qv4airHwKB3VDRUVg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3se8kqw8gb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 11:49:12 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 16 Aug
 2023 17:49:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Wed, 16 Aug 2023 17:49:09 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.68])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 497313578;
	Wed, 16 Aug 2023 16:49:09 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Maciej Strozek
	<mstrozek@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 2/2] ASoC: cs35l56: Read firmware uuid from a device property
 instead of _SUB
Date: Wed, 16 Aug 2023 17:49:06 +0100
Message-ID: <20230816164906.42-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230816164906.42-1-rf@opensource.cirrus.com>
References: <20230816164906.42-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: wppAZtXu97TQCjb-Xmou5E9aPQCOnKkQ
X-Proofpoint-GUID: wppAZtXu97TQCjb-Xmou5E9aPQCOnKkQ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WMG7IXBY3YF4M6BUZKUKMAXKVCFB56FD
X-Message-ID-Hash: WMG7IXBY3YF4M6BUZKUKMAXKVCFB56FD
X-MailFrom: prvs=35925e949a=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WMG7IXBY3YF4M6BUZKUKMAXKVCFB56FD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Use a device property "cirrus,firmware-uid" to get the unique firmware
identifier instead of using ACPI _SUB.

There will not usually be a _SUB in Soundwire nodes. The ACPI can use a
_DSD section for custom properties.

There is also a need to support instantiating this driver using software
nodes. This is for systems where the CS35L56 is a back-end device and the
ACPI refers only to the front-end audio device - there will not be any ACPI
references to CS35L56.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 3a9ec8724cc1..1f4cee097119 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -5,7 +5,6 @@
 // Copyright (C) 2023 Cirrus Logic, Inc. and
 //                    Cirrus Logic International Semiconductor Ltd.
 
-#include <linux/acpi.h>
 #include <linux/completion.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -1029,26 +1028,24 @@ static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
 	return 0;
 }
 
-static int cs35l56_acpi_get_name(struct cs35l56_private *cs35l56)
+static int cs35l56_get_firmware_uid(struct cs35l56_private *cs35l56)
 {
-	acpi_handle handle = ACPI_HANDLE(cs35l56->base.dev);
-	const char *sub;
+	const char *prop;
+	int ret;
 
-	/* If there is no ACPI_HANDLE, there is no ACPI for this system, return 0 */
-	if (!handle)
+	ret = device_property_read_string(cs35l56->base.dev, "cirrus,firmware-uid",
+					  &prop);
+	/*
+	 * If bad sw node property, return 0 and fallback to legacy firmware path
+	 */
+	if (ret < 0)
 		return 0;
 
-	sub = acpi_get_subsystem_id(handle);
-	if (IS_ERR(sub)) {
-		/* If bad ACPI, return 0 and fallback to legacy firmware path, otherwise fail */
-		if (PTR_ERR(sub) == -ENODATA)
-			return 0;
-		else
-			return PTR_ERR(sub);
-	}
+	cs35l56->dsp.system_name = kstrdup(prop, GFP_KERNEL);
+	if (cs35l56->dsp.system_name == NULL)
+		return -ENOMEM;
 
-	cs35l56->dsp.system_name = sub;
-	dev_dbg(cs35l56->base.dev, "Subsystem ID: %s\n", cs35l56->dsp.system_name);
+	dev_dbg(cs35l56->base.dev, "Firmware UID: %s\n", cs35l56->dsp.system_name);
 
 	return 0;
 }
@@ -1095,7 +1092,7 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 		gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 1);
 	}
 
-	ret = cs35l56_acpi_get_name(cs35l56);
+	ret = cs35l56_get_firmware_uid(cs35l56);
 	if (ret != 0)
 		goto err;
 
-- 
2.30.2

