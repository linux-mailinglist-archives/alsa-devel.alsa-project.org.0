Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E5F52D97F
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:56:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C37741727;
	Thu, 19 May 2022 17:55:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C37741727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975770;
	bh=hlvOgU6w4gDCeZb2YXAaFIhg7vhossQr/uTS5t/DPv4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J+Dp854fzR6xQdmzTX7UmP66mQFWccZ/+pGYw0ZwVb/ChTAdQUOG+BvGDTl409Sgk
	 1aYolHAEtf6UTPEga45foBbWPwtPNnjB2njGkeF1VOAHl2y46BXVsAdbyjkH9nB1D1
	 MvoApbVzoCkqDEo/LAr/1C1UDC2fsTuRJOaQByf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 654B1F8065D;
	Thu, 19 May 2022 17:44:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60E30F80618; Thu, 19 May 2022 17:44:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48D86F80558
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48D86F80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="IY+dZad0"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k122002261;
 Thu, 19 May 2022 10:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=hhhdDytXwyq/2wQL6ouDd0l2imZhUv86FKrd+RhIEOM=;
 b=IY+dZad0v5waNf6cw45HaFxE+WWzgqyhg7GjkKbqQXIOwb8H8JqVqImStzrmNprqLRVv
 3WdBe+eyh6gaUpyIbGSqmlZqvWjc26+xQ4nRh8iv3wpajkG4Dupk2yooJWbzA8u0ugVU
 7Yw5zmghE9Q8Hek36hkrvI5x+e8uhbUm2Ogs703SWPiE5ifQj9YDtrOkkW5aNXJl2JO5
 R044Iw7FPaFWz9UMjVDxotxCXz0q3zxqFeh5jAqonDuSCozfIcF+pgI1KoqPHI3yyxt/
 D9KvWWI0o+5+XJd+2Q5nXMUMGo3f795ly4fgp1ZgyQpgz/aKCduVoByRW3PViZGgt33S jg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B923E11DA;
 Thu, 19 May 2022 15:43:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 33/56] ASoC: ep93xx: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:42:55 +0100
Message-ID: <20220519154318.2153729-34-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: eigh1Lk0El9WcmDf-3oKXztbc3yf72e8
X-Proofpoint-ORIG-GUID: eigh1Lk0El9WcmDf-3oKXztbc3yf72e8
X-Proofpoint-Spam-Reason: safe
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
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

Now the core has been migrated across to the new direct clock
specification we can move the drivers back to the normal set_fmt
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/cirrus/ep93xx-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 2c8b1c76b834c..47959794353a7 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -398,7 +398,7 @@ static const struct snd_soc_dai_ops ep93xx_i2s_dai_ops = {
 	.shutdown	= ep93xx_i2s_shutdown,
 	.hw_params	= ep93xx_i2s_hw_params,
 	.set_sysclk	= ep93xx_i2s_set_sysclk,
-	.set_fmt_new	= ep93xx_i2s_set_dai_fmt,
+	.set_fmt	= ep93xx_i2s_set_dai_fmt,
 };
 
 #define EP93XX_I2S_FORMATS (SNDRV_PCM_FMTBIT_S32_LE)
-- 
2.30.2

