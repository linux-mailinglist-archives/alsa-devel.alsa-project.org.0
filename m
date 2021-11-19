Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A31B5458997
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Nov 2021 08:05:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3925D16BE;
	Mon, 22 Nov 2021 08:04:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3925D16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637564714;
	bh=oRI81qODQfEJ663yl3lbyzEbdUf5G6FtXTTtsMOhnZQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fI8//jWg3hNz4mwkDiWyaZ/8F/OeiNYBzNW8UOVLzepm0YiHyXNa7SeIz08wHNHVn
	 PYgUWO1iDGx2T98eQLMl/YsKI6PFfxYkVQySry/DqRu5B5BjrLfPm2A8/gpHdPVwoA
	 5FJ1Wxmj4ltYBuzH/ms0wyxl/cgtc/EAuSe/FT7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB0CBF80510;
	Mon, 22 Nov 2021 08:02:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECA4BF8026D; Fri, 19 Nov 2021 16:34:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8041BF80217
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 16:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8041BF80217
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="BHgQA+Ze"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id ACE3C1F4755E
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637336064; bh=oRI81qODQfEJ663yl3lbyzEbdUf5G6FtXTTtsMOhnZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BHgQA+ZeKvvoPLbEsSijKakWD/VMNBAwlsrox6vI3l5W9wzdBgdfCoW7MLj4CKrkc
 DNoeAwiwZ+qkwSwXCY3WMFdEtkKvwgWdh1ymyotJgcXcYR73RUu38k0bEDxl+mPwEu
 KRjVHnW303E/9BbBrQ+Rwx4T9L+Ah586iRL1swBEORPOchISBD0OfydF2I6i6B6wNF
 5qEZNTev8iBLnMRbswL4DC6i3C9kTbdqAxGt5uubKauxlGfkUuIIfzA5/WWf0zOVdp
 DEfK++6HHIFjt02E30ajh85ugmKVEExjgGTk/4gEP9uCt3NpQfFhjrxaPt6OMC3rH5
 vS5xE1/IOlmnA==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [RFC patch 4/5] ASoC: tlv320aic31xx: Handle BCLK set as PLL input
 configuration
Date: Fri, 19 Nov 2021 12:32:47 -0300
Message-Id: <20211119153248.419802-5-ariel.dalessandro@collabora.com>
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

If BCLK is used as PLL input, the sysclk is determined by the hw
params. So it must be updated here to match the input frequency, based
on sample rate, format and channels.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 sound/soc/codecs/tlv320aic31xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index e8307f0737f2..4224b4b3cae6 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
@@ -169,6 +170,7 @@ struct aic31xx_priv {
 	struct regulator_bulk_data supplies[AIC31XX_NUM_SUPPLIES];
 	struct aic31xx_disable_nb disable_nb[AIC31XX_NUM_SUPPLIES];
 	struct snd_soc_jack *jack;
+	u32 sysclk_id;
 	unsigned int sysclk;
 	u8 p_div;
 	int rate_div_line;
@@ -962,6 +964,7 @@ static int aic31xx_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	struct aic31xx_priv *aic31xx = snd_soc_component_get_drvdata(component);
 	u8 data = 0;
 
 	dev_dbg(component->dev, "## %s: width %d rate %d\n",
@@ -993,6 +996,16 @@ static int aic31xx_hw_params(struct snd_pcm_substream *substream,
 			    AIC31XX_IFACE1_DATALEN_MASK,
 			    data);
 
+	/*
+	 * If BCLK is used as PLL input, the sysclk is determined by the hw
+	 * params. So it must be updated here to match the input frequency.
+	 */
+	if (aic31xx->sysclk_id == AIC31XX_PLL_CLKIN_BCLK) {
+		aic31xx->sysclk = params_rate(params) * params_width(params) *
+				  params_channels(params);
+		aic31xx->p_div = 1;
+	}
+
 	return aic31xx_setup_pll(component, params);
 }
 
@@ -1177,6 +1190,7 @@ static int aic31xx_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	snd_soc_component_update_bits(component, AIC31XX_CLKMUX, AIC31XX_PLL_CLKIN_MASK,
 			    clk_id << AIC31XX_PLL_CLKIN_SHIFT);
 
+	aic31xx->sysclk_id = clk_id;
 	aic31xx->sysclk = freq;
 
 	return 0;
-- 
2.30.2

