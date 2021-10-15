Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DE842F3F6
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 15:40:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A047174B;
	Fri, 15 Oct 2021 15:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A047174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634305212;
	bh=aOlQs0e96aTrLTjrb9/TLCMHTPfyH4Rk1vI0WNtRCdw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V4iGbTPFPqdapbty2eWPsi1XRdzTcUwReCDZs1Nspl4eyRnOAcROHARLOdIiv1KVX
	 5HZ5I3cZBAdS0YMfYASKk+n+ldSRmonvygUggctyPAAzNZEi5cwlToHQ5IljrCD+zh
	 vRRuTnzRQIIc7vOv067++R0tT1AgjXvnlDIbPKZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7521FF80525;
	Fri, 15 Oct 2021 15:36:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A5CAF80508; Fri, 15 Oct 2021 15:36:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADA3DF804E6
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 15:36:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADA3DF804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="oj+gc5d3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19F4c2t4023483; 
 Fri, 15 Oct 2021 08:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=iN4TmPzNM7WWKcRrvkkVC/l//ijLMU3ogxDWJ3EAvxs=;
 b=oj+gc5d3+J5W4ilW+8GN9h06gjML6Lql7J1gD1M+UtCJjnnG8fy11MgTHU7SGnSNOxEr
 HP5RViA/QvI6+SvjyOiYCSFDbLDDJ6/W2htSd2CDGc7C4r++KrXUSuq5DvaGWYw58oeK
 hEEx2woVm9YLdtFX8nspt/xexY41WGsAO/QWCGdZGTE3H+nGRVd+9yxaj3kq3e4ZGjSY
 Fy5wp1qQ75E0i9fNLxTM9TjNYfzFggLBoVS/8c0KxWwxF+csnJ9GB/l6WQQEOYMnWJun
 5qvwCsubWcaG8NspKt9lyK9QWE9dqEa5NDh2bu9M1acP6EKq1Vl/J8L4h8wBJFvjhf3O Cw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bq1gagp5v-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Oct 2021 08:36:28 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 15 Oct
 2021 14:36:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Fri, 15 Oct 2021 14:36:25 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.254])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C7F8911D2;
 Fri, 15 Oct 2021 13:36:24 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 11/16] ASoC: cs42l42: Use PLL for SCLK > 12.288MHz
Date: Fri, 15 Oct 2021 14:36:14 +0100
Message-ID: <20211015133619.4698-12-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211015133619.4698-1-rf@opensource.cirrus.com>
References: <20211015133619.4698-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: rLFusWlfX5byiqv4jUQkx-h4bryLu1hf
X-Proofpoint-GUID: rLFusWlfX5byiqv4jUQkx-h4bryLu1hf
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

It isn't possible to switch MCLK between 12MHz and 24MHz rate groups
on-the-fly - this can only be done when cs42l42 is powered-down.

All "normal" SCLK rates use an MCLK in the 12MHz group, so change the
configs for SCLK > 12.288 MHz to use the PLL to generate an MCLK in
the 12MHz group.

As this means MCLK_DIV is always 0 it can be removed from the pll
configuration setup.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index c18f42cc1044..64bcabeb8f57 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -539,7 +539,6 @@ static const struct reg_sequence cs42l42_to_osc_seq[] = {
 
 struct cs42l42_pll_params {
 	u32 sclk;
-	u8 mclk_div;
 	u8 mclk_src_sel;
 	u8 sclk_prediv;
 	u8 pll_div_int;
@@ -556,24 +555,24 @@ struct cs42l42_pll_params {
  * Table 4-5 from the Datasheet
  */
 static const struct cs42l42_pll_params pll_ratio_table[] = {
-	{ 1411200, 0, 1, 0x00, 0x80, 0x000000, 0x03, 0x10, 11289600, 128, 2},
-	{ 1536000, 0, 1, 0x00, 0x7D, 0x000000, 0x03, 0x10, 12000000, 125, 2},
-	{ 2304000, 0, 1, 0x00, 0x55, 0xC00000, 0x02, 0x10, 12288000,  85, 2},
-	{ 2400000, 0, 1, 0x00, 0x50, 0x000000, 0x03, 0x10, 12000000,  80, 2},
-	{ 2822400, 0, 1, 0x00, 0x40, 0x000000, 0x03, 0x10, 11289600, 128, 1},
-	{ 3000000, 0, 1, 0x00, 0x40, 0x000000, 0x03, 0x10, 12000000, 128, 1},
-	{ 3072000, 0, 1, 0x00, 0x3E, 0x800000, 0x03, 0x10, 12000000, 125, 1},
-	{ 4000000, 0, 1, 0x00, 0x30, 0x800000, 0x03, 0x10, 12000000,  96, 1},
-	{ 4096000, 0, 1, 0x00, 0x2E, 0xE00000, 0x03, 0x10, 12000000,  94, 1},
-	{ 5644800, 0, 1, 0x01, 0x40, 0x000000, 0x03, 0x10, 11289600, 128, 1},
-	{ 6000000, 0, 1, 0x01, 0x40, 0x000000, 0x03, 0x10, 12000000, 128, 1},
-	{ 6144000, 0, 1, 0x01, 0x3E, 0x800000, 0x03, 0x10, 12000000, 125, 1},
-	{ 11289600, 0, 0, 0, 0, 0, 0, 0, 11289600, 0, 1},
-	{ 12000000, 0, 0, 0, 0, 0, 0, 0, 12000000, 0, 1},
-	{ 12288000, 0, 0, 0, 0, 0, 0, 0, 12288000, 0, 1},
-	{ 22579200, 1, 0, 0, 0, 0, 0, 0, 22579200, 0, 1},
-	{ 24000000, 1, 0, 0, 0, 0, 0, 0, 24000000, 0, 1},
-	{ 24576000, 1, 0, 0, 0, 0, 0, 0, 24576000, 0, 1}
+	{ 1411200,  1, 0x00, 0x80, 0x000000, 0x03, 0x10, 11289600, 128, 2},
+	{ 1536000,  1, 0x00, 0x7D, 0x000000, 0x03, 0x10, 12000000, 125, 2},
+	{ 2304000,  1, 0x00, 0x55, 0xC00000, 0x02, 0x10, 12288000,  85, 2},
+	{ 2400000,  1, 0x00, 0x50, 0x000000, 0x03, 0x10, 12000000,  80, 2},
+	{ 2822400,  1, 0x00, 0x40, 0x000000, 0x03, 0x10, 11289600, 128, 1},
+	{ 3000000,  1, 0x00, 0x40, 0x000000, 0x03, 0x10, 12000000, 128, 1},
+	{ 3072000,  1, 0x00, 0x3E, 0x800000, 0x03, 0x10, 12000000, 125, 1},
+	{ 4000000,  1, 0x00, 0x30, 0x800000, 0x03, 0x10, 12000000,  96, 1},
+	{ 4096000,  1, 0x00, 0x2E, 0xE00000, 0x03, 0x10, 12000000,  94, 1},
+	{ 5644800,  1, 0x01, 0x40, 0x000000, 0x03, 0x10, 11289600, 128, 1},
+	{ 6000000,  1, 0x01, 0x40, 0x000000, 0x03, 0x10, 12000000, 128, 1},
+	{ 6144000,  1, 0x01, 0x3E, 0x800000, 0x03, 0x10, 12000000, 125, 1},
+	{ 11289600, 0, 0, 0, 0, 0, 0, 11289600, 0, 1},
+	{ 12000000, 0, 0, 0, 0, 0, 0, 12000000, 0, 1},
+	{ 12288000, 0, 0, 0, 0, 0, 0, 12288000, 0, 1},
+	{ 22579200, 1, 0x03, 0x40, 0x000000, 0x03, 0x10, 11289600, 128, 1},
+	{ 24000000, 1, 0x03, 0x40, 0x000000, 0x03, 0x10, 12000000, 128, 1},
+	{ 24576000, 1, 0x03, 0x40, 0x000000, 0x03, 0x10, 12288000, 128, 1}
 };
 
 static int cs42l42_pll_config(struct snd_soc_component *component)
@@ -609,10 +608,6 @@ static int cs42l42_pll_config(struct snd_soc_component *component)
 					24000000)) <<
 					CS42L42_INTERNAL_FS_SHIFT);
 
-			snd_soc_component_update_bits(component, CS42L42_MCLK_SRC_SEL,
-					CS42L42_MCLKDIV_MASK,
-					(pll_ratio_table[i].mclk_div <<
-					CS42L42_MCLKDIV_SHIFT));
 			/* Set up the LRCLK */
 			fsync = clk / cs42l42->srate;
 			if (((fsync * cs42l42->srate) != clk)
-- 
2.11.0

