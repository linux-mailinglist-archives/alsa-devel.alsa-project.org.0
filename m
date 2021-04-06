Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB8A355149
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 12:53:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 813C31685;
	Tue,  6 Apr 2021 12:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 813C31685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617706420;
	bh=Q1u9QjM+l4dqA9S0YjgwjlOIVHX0SRZfMlpbrlAwDW4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eA5jx+ToPpwpHpSyGRDwHVnN2vCUtBiH1KrmfgBkgzw95YP4Rrh8PrXoVQFU4qspW
	 /g8dF0XbmOtFqQUzIkDWtjKWJ/lvdBFY72i2MSECM6rtMR0HfITSPriT1VKER/nBBg
	 4vyOQir6bNxmShic5exsVSjbGKJC6H5ehWU/hOX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6128F804AB;
	Tue,  6 Apr 2021 12:50:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EB23F8032D; Tue,  6 Apr 2021 12:50:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A7FEF80246
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 12:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A7FEF80246
Received: from localhost (localhost [127.0.0.1])
 by router.aksignal.cz (Postfix) with ESMTP id 297B13FA3D;
 Tue,  6 Apr 2021 12:50:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
 by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id blPEyJEeNNAh; Tue,  6 Apr 2021 12:50:26 +0200 (CEST)
Received: from pc-gameroom.prchals.tk (unknown [83.240.30.185])
 (Authenticated sender: jiri.prchal@aksignal.cz)
 by router.aksignal.cz (Postfix) with ESMTPSA id 716873FA2B;
 Tue,  6 Apr 2021 12:50:23 +0200 (CEST)
From: Jiri Prchal <jiri.prchal@aksignal.cz>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] SOC Codecs: TLV320AIC3X add SPI: configuration and compile
Date: Tue,  6 Apr 2021 12:50:18 +0200
Message-Id: <20210406105018.59463-6-jiri.prchal@aksignal.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406105018.59463-1-jiri.prchal@aksignal.cz>
References: <20210406105018.59463-1-jiri.prchal@aksignal.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Jiri Prchal <jiri.prchal@aksignal.cz>, Liam Girdwood <lgirdwood@gmail.com>
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

Adds configuration option for SPI.
Compile new sources.

Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
---
 sound/soc/codecs/Kconfig  | 11 +++++++++++
 sound/soc/codecs/Makefile |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 1c87b42606c9..d1fecf3b17c6 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -215,6 +215,8 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_TLV320AIC32X4_I2C
 	imply SND_SOC_TLV320AIC32X4_SPI
 	imply SND_SOC_TLV320AIC3X
+	imply SND_SOC_TLV320AIC3X_I2C
+	imply SND_SOC_TLV320AIC3X_SPI
 	imply SND_SOC_TPA6130A2
 	imply SND_SOC_TLV320DAC33
 	imply SND_SOC_TSCS42XX
@@ -1420,7 +1422,16 @@ config SND_SOC_TLV320AIC32X4_SPI
 
 config SND_SOC_TLV320AIC3X
 	tristate "Texas Instruments TLV320AIC3x CODECs"
+
+config SND_SOC_TLV320AIC3X_I2C
+	tristate "Texas Instruments TLV320AIC3x audio CODECs - I2C"
 	depends on I2C
+	select SND_SOC_TLV320AIC3X
+
+config SND_SOC_TLV320AIC3X_SPI
+	tristate "Texas Instruments TLV320AIC3x audio CODECs - SPI"
+	depends on SPI_MASTER
+	select SND_SOC_TLV320AIC3X
 
 config SND_SOC_TLV320DAC33
 	tristate
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 81357dc62ea0..022b3801d964 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -233,6 +233,8 @@ snd-soc-tlv320aic32x4-objs := tlv320aic32x4.o tlv320aic32x4-clk.o
 snd-soc-tlv320aic32x4-i2c-objs := tlv320aic32x4-i2c.o
 snd-soc-tlv320aic32x4-spi-objs := tlv320aic32x4-spi.o
 snd-soc-tlv320aic3x-objs := tlv320aic3x.o
+snd-soc-tlv320aic3x-i2c-objs := tlv320aic3x-i2c.o
+snd-soc-tlv320aic3x-spi-objs := tlv320aic3x-spi.o
 snd-soc-tlv320dac33-objs := tlv320dac33.o
 snd-soc-tlv320adcx140-objs := tlv320adcx140.o
 snd-soc-tscs42xx-objs := tscs42xx.o
@@ -548,6 +550,8 @@ obj-$(CONFIG_SND_SOC_TLV320AIC32X4)     += snd-soc-tlv320aic32x4.o
 obj-$(CONFIG_SND_SOC_TLV320AIC32X4_I2C)	+= snd-soc-tlv320aic32x4-i2c.o
 obj-$(CONFIG_SND_SOC_TLV320AIC32X4_SPI)	+= snd-soc-tlv320aic32x4-spi.o
 obj-$(CONFIG_SND_SOC_TLV320AIC3X)	+= snd-soc-tlv320aic3x.o
+obj-$(CONFIG_SND_SOC_TLV320AIC3X_I2C)	+= snd-soc-tlv320aic3x-i2c.o
+obj-$(CONFIG_SND_SOC_TLV320AIC3X_SPI)	+= snd-soc-tlv320aic3x-spi.o
 obj-$(CONFIG_SND_SOC_TLV320DAC33)	+= snd-soc-tlv320dac33.o
 obj-$(CONFIG_SND_SOC_TLV320ADCX140)	+= snd-soc-tlv320adcx140.o
 obj-$(CONFIG_SND_SOC_TSCS42XX)	+= snd-soc-tscs42xx.o
-- 
2.25.1

