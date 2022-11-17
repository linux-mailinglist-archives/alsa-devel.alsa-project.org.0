Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC4862DB01
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 13:34:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B95B516C1;
	Thu, 17 Nov 2022 13:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B95B516C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668688486;
	bh=mriXUUv4YdVpJ92OHSjzRqvTpbgG5OABDyze4/Hv4to=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j+5AIJ4Zhbj+wQ43zcsXoN4ONzSXk17zVIuFez52VPH9zChE6q0kpO2IrlphNjmBh
	 gtAcbC6yMUGElU9gNXebRQMMpatXvbXwHCDWaO26mRn0suUjGpHfEhe0tXX36h2zhN
	 ObVSFm9dWFttBc7hVpDqndMLuT6kdMraYqK9jRW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7783F8051D;
	Thu, 17 Nov 2022 13:33:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95653F80526; Thu, 17 Nov 2022 13:33:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B93DF800B5
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 13:33:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B93DF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="Qgk9D3Xi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1668688400; x=1700224400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mriXUUv4YdVpJ92OHSjzRqvTpbgG5OABDyze4/Hv4to=;
 b=Qgk9D3Xiz7o7F5B92Y838hCf4oVVCx83RxnmBkaGeDWmF2daBJFFMMHm
 h7eY4RJXYKe8ElUUHiXv1Iagim302GIKSF7y0l1fMIhmfDefgdK/49fB0
 yYNDOGK17Q96RBC19kEuHdaQivDqQhJIjqvz+GBwztNQkNdEkBJnwHlri
 2awalvPEkYLO30WvHX4TNv62UJ5KBv9/iPJc7cTvbY1JlnFD8DTF+OxRE
 IF5/Lt8umYOS4tKa+8DciPLZj80JANUt53bO5UpTXRwW4MyV2d3rYU0n8
 mlycEGe0c5OjWd77sqpIr9vJXcXWoRReELlV0ygHmbqh8o47eylr6kdg8 w==;
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="183977381"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Nov 2022 05:33:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 17 Nov 2022 05:33:06 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 17 Nov 2022 05:33:03 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/3] ASoC: mchp-spdiftx: simplify locking around ctrl->ch_stat
Date: Thu, 17 Nov 2022 14:37:48 +0200
Message-ID: <20221117123750.291911-2-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20221117123750.291911-1-claudiu.beznea@microchip.com>
References: <20221117123750.291911-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
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

Use a temporary variable to keep the AES3 value. With this a
spin_unlock_irqrestore() call has been removed from the final code.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index ab2d7a791f39..4e231cec9045 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -355,6 +355,7 @@ static int mchp_spdiftx_hw_params(struct snd_pcm_substream *substream,
 	struct mchp_spdiftx_mixer_control *ctrl = &dev->control;
 	u32 mr;
 	unsigned int bps = params_physical_width(params) / 8;
+	unsigned char aes3;
 	int ret;
 
 	dev_dbg(dev->dev, "%s() rate=%u format=%#x width=%u channels=%u\n",
@@ -440,48 +441,48 @@ static int mchp_spdiftx_hw_params(struct snd_pcm_substream *substream,
 
 	mr |= SPDIFTX_MR_BPS(bps);
 
-	spin_lock_irqsave(&ctrl->lock, flags);
-	ctrl->ch_stat[3] &= ~IEC958_AES3_CON_FS;
 	switch (params_rate(params)) {
 	case 22050:
-		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_22050;
+		aes3 = IEC958_AES3_CON_FS_22050;
 		break;
 	case 24000:
-		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_24000;
+		aes3 = IEC958_AES3_CON_FS_24000;
 		break;
 	case 32000:
-		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_32000;
+		aes3 = IEC958_AES3_CON_FS_32000;
 		break;
 	case 44100:
-		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_44100;
+		aes3 = IEC958_AES3_CON_FS_44100;
 		break;
 	case 48000:
-		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_48000;
+		aes3 = IEC958_AES3_CON_FS_48000;
 		break;
 	case 88200:
-		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_88200;
+		aes3 = IEC958_AES3_CON_FS_88200;
 		break;
 	case 96000:
-		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_96000;
+		aes3 = IEC958_AES3_CON_FS_96000;
 		break;
 	case 176400:
-		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_176400;
+		aes3 = IEC958_AES3_CON_FS_176400;
 		break;
 	case 192000:
-		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_192000;
+		aes3 = IEC958_AES3_CON_FS_192000;
 		break;
 	case 8000:
 	case 11025:
 	case 16000:
 	case 64000:
-		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_NOTID;
+		aes3 = IEC958_AES3_CON_FS_NOTID;
 		break;
 	default:
 		dev_err(dev->dev, "unsupported sample frequency: %u\n",
 			params_rate(params));
-		spin_unlock_irqrestore(&ctrl->lock, flags);
 		return -EINVAL;
 	}
+	spin_lock_irqsave(&ctrl->lock, flags);
+	ctrl->ch_stat[3] &= ~IEC958_AES3_CON_FS;
+	ctrl->ch_stat[3] |= aes3;
 	mchp_spdiftx_channel_status_write(dev);
 	spin_unlock_irqrestore(&ctrl->lock, flags);
 
-- 
2.34.1

