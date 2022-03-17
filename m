Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F34DC2EE
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 10:35:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7735B1A4D;
	Thu, 17 Mar 2022 10:34:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7735B1A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647509711;
	bh=jiX+/NAdjZekLD/b+pYslgbzb9NvPsMhR80p/cU40eo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QQMorRp9GjWumQXBXQdzNtZeEDyM8ukFsvEMxAkCQ6R0Mbgv6toMJOl58ciUSzLMX
	 Qi7Vht8iO+O/bEKKlvFbb4I7y9krFm+ELB0c68MxXmbAzbcGopNcnUnd6rX94XaRCJ
	 1UhFGTmQ/LDd/4CC990aEVpNUIHNGY651YyD4sAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A317F80517;
	Thu, 17 Mar 2022 10:32:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC872F8054A; Thu, 17 Mar 2022 10:31:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9F2AF80510
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 10:31:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9F2AF80510
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="iJXrELyu"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22H7ecZo022935;
 Thu, 17 Mar 2022 04:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=0CFqoZxdKyNJco3f8odaQL1z1+afH8ZrsmpzaVKSkkk=;
 b=iJXrELyuCEa3BT4iXKpDS/JoF16SY7RaVt6gaKP+ZCAiUbiKXPU2/mD5gNO0TNrMD6fk
 MgPjEdYyWs6yIoTz/gwQSqWMfvdNNAMm8lMoB7VYCzRlxRLmv7AYnChWYmkCuYHBJpCe
 Y/5Nj56oGcb7hI6R6DZRLmEMDzm8KH3MKfo503ZEi9BXtf7rM1e/ANsw5ySngzthA09t
 4Rt00DwcPz3dsWNCzPc6PudIQXHPTKFBmDsj88WcHR4nZR8yANssBbOEJz60ZDm1sVod
 9H9bbpMtKgxdDkf3RAll0owoRhszErdbpUDesrf7nLHczfvS3E8/H7vnDnAr1CVhKPNg gw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3et5yp475f-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Mar 2022 04:31:32 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 17 Mar
 2022 09:31:31 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 17 Mar 2022 09:31:31 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EE5697C;
 Thu, 17 Mar 2022 09:31:30 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 04/16] ALSA: hda: cs35l41: Fix I2S params comments
Date: Thu, 17 Mar 2022 09:31:08 +0000
Message-ID: <20220317093120.168534-5-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317093120.168534-1-tanureal@opensource.cirrus.com>
References: <20220317093120.168534-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7dAs1cwPyQAkiXhGR12libgjVmKZq7-e
X-Proofpoint-GUID: 7dAs1cwPyQAkiXhGR12libgjVmKZq7-e
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 devicetree@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Fix clock and slot size comments

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index e00ceaca79c0..d2addae8c085 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -17,11 +17,11 @@
 #include "cs35l41_hda.h"
 
 static const struct reg_sequence cs35l41_hda_config[] = {
-	{ CS35L41_PLL_CLK_CTRL,		0x00000430 }, // 3200000Hz, BCLK Input, PLL_REFCLK_EN = 1
+	{ CS35L41_PLL_CLK_CTRL,		0x00000430 }, // 3072000Hz, BCLK Input, PLL_REFCLK_EN = 1
 	{ CS35L41_GLOBAL_CLK_CTRL,	0x00000003 }, // GLOBAL_FS = 48 kHz
 	{ CS35L41_SP_ENABLES,		0x00010000 }, // ASP_RX1_EN = 1
 	{ CS35L41_SP_RATE_CTRL,		0x00000021 }, // ASP_BCLK_FREQ = 3.072 MHz
-	{ CS35L41_SP_FORMAT,		0x20200200 }, // 24 bits, I2S, BCLK Slave, FSYNC Slave
+	{ CS35L41_SP_FORMAT,		0x20200200 }, // 32 bits RX/TX slots, I2S, clk consumer
 	{ CS35L41_DAC_PCM1_SRC,		0x00000008 }, // DACPCM1_SRC = ASPRX1
 	{ CS35L41_AMP_DIG_VOL_CTRL,	0x00000000 }, // AMP_VOL_PCM  0.0 dB
 	{ CS35L41_AMP_GAIN_CTRL,	0x00000084 }, // AMP_GAIN_PCM 4.5 dB
-- 
2.35.1

