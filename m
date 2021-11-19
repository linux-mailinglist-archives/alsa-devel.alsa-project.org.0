Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C97458995
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Nov 2021 08:04:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FC0116A2;
	Mon, 22 Nov 2021 08:03:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FC0116A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637564671;
	bh=/j1Khmk+xAoa6WH5TgCgRh8Xp688O0Js+hvu1H7OLVU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JnCIe4S3ycxo063tGiem7RFquBTifZO46u/E9xw2FUpwoj7eHwGaeC4XfdOr4/Rus
	 KJ2oqQ3t+RuSuxHyRR+gebyC/WbJfLvz2UmfumWGh6njwWDWnQTahUYYv9QhwGn+m9
	 bmCPudc599x+N/GcaaXGoMyydKmUQiuGE2uJNyww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EAE9F804F3;
	Mon, 22 Nov 2021 08:02:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6408BF80217; Fri, 19 Nov 2021 16:34:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20C4CF8010B
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 16:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20C4CF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="d+lwMZvf"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 945381F47558
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637336055; bh=/j1Khmk+xAoa6WH5TgCgRh8Xp688O0Js+hvu1H7OLVU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d+lwMZvfqtD7JWjErprTZ8RbBg6cZcwRfv3GXE9H0CgwDTT3WlofiRmZNQKoXzDAD
 2/7vaylU0erR6KVPwTovBsf3q2tpjrHFAHrQPboHEPXCEeRy5CeQoMJvaqXg1RkQ5C
 U0wmRfT7K9ohgNq7D2fMlBPoiAjP9WqgmffN0qMX2C4zfLRk7Oqri7faoZZHGMoT+g
 K/u0/xULQ7o98zNFycw2uixMf7Oe/ZX6Ts8nLDRtct1XEfGW9dx0ZIr8Muqgtz3558
 EmRog9FiwA7PXy4sBn+3zEiAN6oTbHL/xBCDD5yHHIeNlKH7Nw4ZZ1/yFRq4VTUiJi
 9e5Ay8wfHT3hg==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [RFC patch 2/5] ASoC: tlv320aic31xx: Add support for pll_r coefficient
Date: Fri, 19 Nov 2021 12:32:45 -0300
Message-Id: <20211119153248.419802-3-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 22 Nov 2021 08:01:48 +0100
Cc: bkylerussell@gmail.com, ariel.dalessandro@collabora.com,
 kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com,
 tiwai@suse.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com,
 broonie@kernel.org, michael@amarulasolutions.com, festevam@gmail.com
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

When the clock used by the codec is BCLK, the operation parameters need
to be calculated from input sample rate and format. Low frequency rates
required different r multipliers, in order to achieve a higher PLL
output frequency.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 sound/soc/codecs/tlv320aic31xx.c | 71 ++++++++++++++++----------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 52d2c968b5c0..1aec03d834d0 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -180,6 +180,7 @@ struct aic31xx_priv {
 struct aic31xx_rate_divs {
 	u32 mclk_p;
 	u32 rate;
+	u8 pll_r;
 	u8 pll_j;
 	u16 pll_d;
 	u16 dosr;
@@ -192,51 +193,51 @@ struct aic31xx_rate_divs {
 
 /* ADC dividers can be disabled by configuring them to 0 */
 static const struct aic31xx_rate_divs aic31xx_divs[] = {
-	/* mclk/p    rate  pll: j     d        dosr ndac mdac  aors nadc madc */
+	/* mclk/p    rate  pll: r  j     d     dosr ndac mdac  aors nadc madc */
 	/* 8k rate */
-	{12000000,   8000,	8, 1920,	128,  48,  2,	128,  48,  2},
-	{12000000,   8000,	8, 1920,	128,  32,  3,	128,  32,  3},
-	{12500000,   8000,	7, 8643,	128,  48,  2,	128,  48,  2},
+	{12000000,   8000,	1, 8, 1920,	128,  48,  2,	128,  48,  2},
+	{12000000,   8000,	1, 8, 1920,	128,  32,  3,	128,  32,  3},
+	{12500000,   8000,	1, 7, 8643,	128,  48,  2,	128,  48,  2},
 	/* 11.025k rate */
-	{12000000,  11025,	7, 5264,	128,  32,  2,	128,  32,  2},
-	{12000000,  11025,	8, 4672,	128,  24,  3,	128,  24,  3},
-	{12500000,  11025,	7, 2253,	128,  32,  2,	128,  32,  2},
+	{12000000,  11025,	1, 7, 5264,	128,  32,  2,	128,  32,  2},
+	{12000000,  11025,	1, 8, 4672,	128,  24,  3,	128,  24,  3},
+	{12500000,  11025,	1, 7, 2253,	128,  32,  2,	128,  32,  2},
 	/* 16k rate */
-	{12000000,  16000,	8, 1920,	128,  24,  2,	128,  24,  2},
-	{12000000,  16000,	8, 1920,	128,  16,  3,	128,  16,  3},
-	{12500000,  16000,	7, 8643,	128,  24,  2,	128,  24,  2},
+	{12000000,  16000,	1, 8, 1920,	128,  24,  2,	128,  24,  2},
+	{12000000,  16000,	1, 8, 1920,	128,  16,  3,	128,  16,  3},
+	{12500000,  16000,	1, 7, 8643,	128,  24,  2,	128,  24,  2},
 	/* 22.05k rate */
-	{12000000,  22050,	7, 5264,	128,  16,  2,	128,  16,  2},
-	{12000000,  22050,	8, 4672,	128,  12,  3,	128,  12,  3},
-	{12500000,  22050,	7, 2253,	128,  16,  2,	128,  16,  2},
+	{12000000,  22050,	1, 7, 5264,	128,  16,  2,	128,  16,  2},
+	{12000000,  22050,	1, 8, 4672,	128,  12,  3,	128,  12,  3},
+	{12500000,  22050,	1, 7, 2253,	128,  16,  2,	128,  16,  2},
 	/* 32k rate */
-	{12000000,  32000,	8, 1920,	128,  12,  2,	128,  12,  2},
-	{12000000,  32000,	8, 1920,	128,   8,  3,	128,   8,  3},
-	{12500000,  32000,	7, 8643,	128,  12,  2,	128,  12,  2},
+	{12000000,  32000,	1, 8, 1920,	128,  12,  2,	128,  12,  2},
+	{12000000,  32000,	1, 8, 1920,	128,   8,  3,	128,   8,  3},
+	{12500000,  32000,	1, 7, 8643,	128,  12,  2,	128,  12,  2},
 	/* 44.1k rate */
-	{12000000,  44100,	7, 5264,	128,   8,  2,	128,   8,  2},
-	{12000000,  44100,	8, 4672,	128,   6,  3,	128,   6,  3},
-	{12500000,  44100,	7, 2253,	128,   8,  2,	128,   8,  2},
+	{12000000,  44100,	1, 7, 5264,	128,   8,  2,	128,   8,  2},
+	{12000000,  44100,	1, 8, 4672,	128,   6,  3,	128,   6,  3},
+	{12500000,  44100,	1, 7, 2253,	128,   8,  2,	128,   8,  2},
 	/* 48k rate */
-	{12000000,  48000,	8, 1920,	128,   8,  2,	128,   8,  2},
-	{12000000,  48000,	7, 6800,	 96,   5,  4,	 96,   5,  4},
-	{12500000,  48000,	7, 8643,	128,   8,  2,	128,   8,  2},
+	{12000000,  48000,	1, 8, 1920,	128,   8,  2,	128,   8,  2},
+	{12000000,  48000,	1, 7, 6800,	 96,   5,  4,	 96,   5,  4},
+	{12500000,  48000,	1, 7, 8643,	128,   8,  2,	128,   8,  2},
 	/* 88.2k rate */
-	{12000000,  88200,	7, 5264,	 64,   8,  2,	 64,   8,  2},
-	{12000000,  88200,	8, 4672,	 64,   6,  3,	 64,   6,  3},
-	{12500000,  88200,	7, 2253,	 64,   8,  2,	 64,   8,  2},
+	{12000000,  88200,	1, 7, 5264,	 64,   8,  2,	 64,   8,  2},
+	{12000000,  88200,	1, 8, 4672,	 64,   6,  3,	 64,   6,  3},
+	{12500000,  88200,	1, 7, 2253,	 64,   8,  2,	 64,   8,  2},
 	/* 96k rate */
-	{12000000,  96000,	8, 1920,	 64,   8,  2,	 64,   8,  2},
-	{12000000,  96000,	7, 6800,	 48,   5,  4,	 48,   5,  4},
-	{12500000,  96000,	7, 8643,	 64,   8,  2,	 64,   8,  2},
+	{12000000,  96000,	1, 8, 1920,	 64,   8,  2,	 64,   8,  2},
+	{12000000,  96000,	1, 7, 6800,	 48,   5,  4,	 48,   5,  4},
+	{12500000,  96000,	1, 7, 8643,	 64,   8,  2,	 64,   8,  2},
 	/* 176.4k rate */
-	{12000000, 176400,	7, 5264,	 32,   8,  2,	 32,   8,  2},
-	{12000000, 176400,	8, 4672,	 32,   6,  3,	 32,   6,  3},
-	{12500000, 176400,	7, 2253,	 32,   8,  2,	 32,   8,  2},
+	{12000000, 176400,	1, 7, 5264,	 32,   8,  2,	 32,   8,  2},
+	{12000000, 176400,	1, 8, 4672,	 32,   6,  3,	 32,   6,  3},
+	{12500000, 176400,	1, 7, 2253,	 32,   8,  2,	 32,   8,  2},
 	/* 192k rate */
-	{12000000, 192000,	8, 1920,	 32,   8,  2,	 32,   8,  2},
-	{12000000, 192000,	7, 6800,	 24,   5,  4,	 24,   5,  4},
-	{12500000, 192000,	7, 8643,	 32,   8,  2,	 32,   8,  2},
+	{12000000, 192000,	1, 8, 1920,	 32,   8,  2,	 32,   8,  2},
+	{12000000, 192000,	1, 7, 6800,	 24,   5,  4,	 24,   5,  4},
+	{12500000, 192000,	1, 7, 8643,	 32,   8,  2,	 32,   8,  2},
 };
 
 static const char * const ldac_in_text[] = {
@@ -888,7 +889,7 @@ static int aic31xx_setup_pll(struct snd_soc_component *component,
 
 	/* PLL configuration */
 	snd_soc_component_update_bits(component, AIC31XX_PLLPR, AIC31XX_PLL_MASK,
-			    (aic31xx->p_div << 4) | 0x01);
+			    (aic31xx->p_div << 4) | aic31xx_divs[i].pll_r);
 	snd_soc_component_write(component, AIC31XX_PLLJ, aic31xx_divs[i].pll_j);
 
 	snd_soc_component_write(component, AIC31XX_PLLDMSB,
-- 
2.30.2

