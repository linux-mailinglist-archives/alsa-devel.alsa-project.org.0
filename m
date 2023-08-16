Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC6F77E6F5
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 18:51:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD99E84B;
	Wed, 16 Aug 2023 18:50:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD99E84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692204671;
	bh=01OEeKR4plrdiY/vl6iR4fXTUBaB0LX5RajQ3JqVlFQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FzofUNBEUf5PD0ZxN23ajHoyWuDnzSY6SIbyCgGdjrIZ18L16+H9iAetZC8ZHVLtb
	 WhHnEyO3qBZwffMOiKMYeIgMHXhQzwWJSC3fxKVPfAJeflUn5eUOIKyZQeM5NmDZit
	 TcmUG2XXFbaB2zEvREPLvRgkaTk2hKItf33bzg+U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBDF7F8055C; Wed, 16 Aug 2023 18:49:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B963FF80563;
	Wed, 16 Aug 2023 18:49:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7227F80551; Wed, 16 Aug 2023 18:49:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2163BF80074
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 18:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2163BF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=GCt+VPzR
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G5L6Uk023417;
	Wed, 16 Aug 2023 11:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=UUPGKPIvg91WsHyFvxHJWoMkr53Ll949FGnSoWu7Ngs=; b=
	GCt+VPzRQ1Fd7IpBJkb/gZ52PqMIr3WLoJ98064D0f7Mtr3uvOSuDJcSPMwiFTSS
	ZZYaQz4Gdf7YQi4OVEe73kMYkWSbBkrDy462IAHuf6Xsf0tN3h/xF/uMUQ8G7I5+
	N5jMsBQ8cbIxPAj1O3TFsnsMS5V15xOSrk24fAdFgoLI5k1HgEN2ZZghdLAGsvHj
	cNLnhUP+Zp23wiTDWo5SUnq9XXniieXX4y/qYLlRa/VnGlTw4GY3YwiujusblmwM
	SeDPIAGZ4sWx9JrOhLvs9cz8XYgGsNsJx7USwkm2IcGDYAa40n1tJeJbylJXWocO
	4+JDTSGuXsNETgXlflR/lA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3se8kqw8gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 11:49:11 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 16 Aug
 2023 17:49:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Wed, 16 Aug 2023 17:49:09 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.68])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E1086357C;
	Wed, 16 Aug 2023 16:49:08 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 1/2] ASoC: cs35l56: Add an ACPI match table
Date: Wed, 16 Aug 2023 17:49:05 +0100
Message-ID: <20230816164906.42-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230816164906.42-1-rf@opensource.cirrus.com>
References: <20230816164906.42-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: pFMkl0uwKaYpL1etsocYnaH0oALP3Lat
X-Proofpoint-GUID: pFMkl0uwKaYpL1etsocYnaH0oALP3Lat
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: QXAB4WGZJSSSK4XULRUHMW7S6OHZDNEU
X-Message-ID-Hash: QXAB4WGZJSSSK4XULRUHMW7S6OHZDNEU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QXAB4WGZJSSSK4XULRUHMW7S6OHZDNEU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

An ACPI ID has been allocated for CS35L56 ASoC devices so that they can
be instantiated from ACPI Device entries.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-i2c.c | 9 +++++++++
 sound/soc/codecs/cs35l56-spi.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index 888fdfa5f5db..9f4f2f4f23f5 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -62,10 +62,19 @@ static const struct i2c_device_id cs35l56_id_i2c[] = {
 };
 MODULE_DEVICE_TABLE(i2c, cs35l56_id_i2c);
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id cs35l56_asoc_acpi_match[] = {
+	{ "CSC355C", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, cs35l56_asoc_acpi_match);
+#endif
+
 static struct i2c_driver cs35l56_i2c_driver = {
 	.driver = {
 		.name		= "cs35l56",
 		.pm = &cs35l56_pm_ops_i2c_spi,
+		.acpi_match_table = ACPI_PTR(cs35l56_asoc_acpi_match),
 	},
 	.id_table	= cs35l56_id_i2c,
 	.probe		= cs35l56_i2c_probe,
diff --git a/sound/soc/codecs/cs35l56-spi.c b/sound/soc/codecs/cs35l56-spi.c
index 2057fce435be..9962703915e1 100644
--- a/sound/soc/codecs/cs35l56-spi.c
+++ b/sound/soc/codecs/cs35l56-spi.c
@@ -59,10 +59,19 @@ static const struct spi_device_id cs35l56_id_spi[] = {
 };
 MODULE_DEVICE_TABLE(spi, cs35l56_id_spi);
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id cs35l56_asoc_acpi_match[] = {
+	{ "CSC355C", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, cs35l56_asoc_acpi_match);
+#endif
+
 static struct spi_driver cs35l56_spi_driver = {
 	.driver = {
 		.name		= "cs35l56",
 		.pm = &cs35l56_pm_ops_i2c_spi,
+		.acpi_match_table = ACPI_PTR(cs35l56_asoc_acpi_match),
 	},
 	.id_table	= cs35l56_id_spi,
 	.probe		= cs35l56_spi_probe,
-- 
2.30.2

