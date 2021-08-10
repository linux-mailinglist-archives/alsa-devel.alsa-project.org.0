Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6453E7C7E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 17:39:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECD471684;
	Tue, 10 Aug 2021 17:39:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECD471684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628609997;
	bh=8lsHgP/2fcJauERlzPMaYhcHKmoebTpN0XBWa+oIrhI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kxF+0Ds8r+Oc08EHWuJDOVZOyk5FNHFkEcsGDSJLrwMoJ8bGEew4gO6Fe+aebjwOK
	 JT3/WiQybaBLau5v8JV4B6Z5s5cXo2qTrwQ8YBU8PQQCGVe+WspwGdclU5W8Mp3CBV
	 W7aR9u3yU4njN2hj/vjop57G+M/voUcUmPqPzQKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32DC6F804CF;
	Tue, 10 Aug 2021 17:38:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89AD9F804E6; Tue, 10 Aug 2021 17:38:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F0C0F800C8
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 17:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F0C0F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AHuetJTX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17A75fJO008310; 
 Tue, 10 Aug 2021 10:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=9DPotfwIzYywdeGvIB7eXkdPSmLg7rO736KRYuYLAv4=;
 b=AHuetJTX8uWGZptJy3esQJBGVbq7mHmbQdy/77Bj2z1wKVWTc7/8h4sMSC1MivRFHGf2
 JoP+6+l4WMHwkU9n/GZIEBCY1ib2bxeSORUDT92zPDROUlnBXeM5vmb3QfcG98WZOLjN
 wCn7UekBemMjwE0q+32fifY8fxZvSH6SHrHrEQxbBPDrlWxbXY6rblbYTg7RzCB+2R4p
 xBDcXiAlqufPyeH+HTT/Gr8iUW8hPOD9L/fJuPuFE7RqyJ4EoMgITh5FJ0KktSz/vJp8
 Rte0vFpyXQxJ7dNGPA9MZF3eDTxIb3vyjyZ9OCGrNmyWNSO0PXrGmPfLv2f7yH6hA6xh Pg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3abmrkgkf6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Aug 2021 10:38:05 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 10 Aug
 2021 16:38:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 10 Aug 2021 16:38:02 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.221])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AE63346E;
 Tue, 10 Aug 2021 15:38:02 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 01/12] ASoC: cs42l42: Use PLL for SCLK > 12.188MHz
Date: Tue, 10 Aug 2021 16:37:48 +0100
Message-ID: <20210810153759.24333-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210810153759.24333-1-rf@opensource.cirrus.com>
References: <20210810153759.24333-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: GgyJM2g7ZwDLc8oiW3cBC349vml2yMU6
X-Proofpoint-ORIG-GUID: GgyJM2g7ZwDLc8oiW3cBC349vml2yMU6
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108100099
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
index fb1e4c33e27d..3c1609865440 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -569,7 +569,6 @@ static const struct reg_sequence cs42l42_to_osc_seq[] = {
 
 struct cs42l42_pll_params {
 	u32 sclk;
-	u8 mclk_div;
 	u8 mclk_src_sel;
 	u8 sclk_prediv;
 	u8 pll_div_int;
@@ -586,24 +585,24 @@ struct cs42l42_pll_params {
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
@@ -631,10 +630,6 @@ static int cs42l42_pll_config(struct snd_soc_component *component)
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

