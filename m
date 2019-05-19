Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5569D2282E
	for <lists+alsa-devel@lfdr.de>; Sun, 19 May 2019 20:01:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E15E61669;
	Sun, 19 May 2019 20:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E15E61669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558288880;
	bh=MfcFg6HWQp6V3KxN3d7t/ohtbCOwlxOwxxYCLv0LZfA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r3QV58raE1Y/4+yYCq+bpdFLL1CBC6vJNst219TvpkF1DqNBSXgAcdcBv8hjWJab6
	 60Lk4m895gVpO3/t9SYf7P/chZX05cegmmGvPGUYZkR6y3M5wApaUwnkjSOkQoa3vV
	 x2UkKAdr+fFN4nluUhjlP1BAiunqDTbIFC6zYhJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F52EF89735;
	Sun, 19 May 2019 19:57:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04D12F8972A; Sun, 19 May 2019 19:57:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C9A5F89670
 for <alsa-devel@alsa-project.org>; Sun, 19 May 2019 19:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C9A5F89670
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a1Om4Lg2"
Received: by mail-ed1-x541.google.com with SMTP id l25so19910490eda.9
 for <alsa-devel@alsa-project.org>; Sun, 19 May 2019 10:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hSaFCnfR2bfpWEW9+IDASa3q4Pa8ivn5CKtNahd44Kw=;
 b=a1Om4Lg2C4tZiOySg407er5np9/4sFg5OyicTgChtep3koC5J4Tq5ZOCeAdArP4JR8
 qJWUcrttMW0Sxm4FGjhIZY0RbgRIkszIDnSvKEXWtx0iyKeaCOSCFE/i8RCX5qASIjZp
 9eheKazLMp2cN10t+brNYq+fiVTdjdIIIZCmEwX6XCWEreYVF3KELUiVRpe//V1bnKek
 eTa5zqObwT3B8jMtczMbR0tIFovKr0E+I/EDjxVcTbJxgTa3w2QsslPcVeCH1iX6BXLj
 9iN3A/kkj5nIqcZA0DzO4Ifi7Ub9G03q7WJOsSG8ms9023GUxugT6Uo9wI1KiD/GpE1U
 qdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hSaFCnfR2bfpWEW9+IDASa3q4Pa8ivn5CKtNahd44Kw=;
 b=rG3oYrl6s7hii5pmnAP0vFMLgFa3ZNe+zMSJAl0qb1jb2ARNpEwqE3MnDv+usxrs5g
 rI4em/bwbe9L47E2dvf1vY31Edvs4QVWJ6DHAEqt1hZGi2xk/FY/T9912fYc1Paqabkt
 BuZnhMBRzva4lfzY00Pk7TawDKAQb5WUagSLgFnRS6eBSNlP2dd1joAfSbb7fwM+xpBb
 81j/nXvrP5Dljt1dHWE1cf36xonlsGyi+P78q7EUXJxqcjwBubV2sw0+KIHfhzk5+2ee
 0htnkvDIc4wgKtfJe5t7/YUIgFLIaUcwg6+QJPkSnaQSX7qeo9oWypEQhc20KuJG7S0X
 +qxw==
X-Gm-Message-State: APjAAAWj2Tt9G99lOCnQPxyYuHxXKJ6gkXr3ah8y0swNhaUgxYu56dFr
 fZmtj2tFLxs82D4/bh99Bcw=
X-Google-Smtp-Source: APXvYqyPTzo5wN45lTEMnmrBzu4K9xsaODSRQIEWRmXE+7IyXmsFj5WvAzAKwjjPXJD3Yr7suxsa+w==
X-Received: by 2002:aa7:c4d2:: with SMTP id p18mr70897008edr.232.1558288648755; 
 Sun, 19 May 2019 10:57:28 -0700 (PDT)
Received: from elitebook-localhost (84-106-70-146.cable.dynamic.v4.ziggo.nl.
 [84.106.70.146])
 by smtp.gmail.com with ESMTPSA id x22sm5000877edd.59.2019.05.19.10.57.27
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 19 May 2019 10:57:28 -0700 (PDT)
From: nariman <narimantos@gmail.com>
To: broonie@kernel.org, hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Date: Sun, 19 May 2019 19:57:05 +0200
Message-Id: <20190519175706.3998-3-narimantos@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519175706.3998-1-narimantos@gmail.com>
References: <20190519175706.3998-1-narimantos@gmail.com>
MIME-Version: 1.0
Cc: Erik Bussing <eabbussing@outlook.com>,
 Nariman Etemadi <narimantos@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: Intel: bytcr_5640.c: refactored
	codec_fixup
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Erik Bussing <eabbussing@outlook.com>

Remove code duplication in byt_rt5640_codec_fixup

Signed-off-by: Erik Bussing <eabbussing@outlook.com>
Signed-off-by: Nariman Etemadi <narimantos@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 64 ++++++++++-----------------
 1 file changed, 23 insertions(+), 41 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index a22366ce33c4..679be55418bf 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -939,6 +939,7 @@ static int byt_rt5640_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_interval *channels = hw_param_interval(params,
 						SNDRV_PCM_HW_PARAM_CHANNELS);
 	int ret;
+	int bits;
 
 	/* The DSP will covert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
@@ -949,53 +950,34 @@ static int byt_rt5640_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 
 		/* set SSP0 to 16-bit */
 		params_set_format(params, SNDRV_PCM_FORMAT_S16_LE);
-
-		/*
-		 * Default mode for SSP configuration is TDM 4 slot, override config
-		 * with explicit setting to I2S 2ch 16-bit. The word length is set with
-		 * dai_set_tdm_slot() since there is no other API exposed
-		 */
-		ret = snd_soc_dai_set_fmt(rtd->cpu_dai,
-					SND_SOC_DAIFMT_I2S     |
-					SND_SOC_DAIFMT_NB_NF   |
-					SND_SOC_DAIFMT_CBS_CFS
-			);
-		if (ret < 0) {
-			dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
-			return ret;
-		}
-
-		ret = snd_soc_dai_set_tdm_slot(rtd->cpu_dai, 0x3, 0x3, 2, 16);
-		if (ret < 0) {
-			dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
-			return ret;
-		}
-
+	bits = 16;
 	} else {
 
 		/* set SSP2 to 24-bit */
 		params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
+		bits = 24;
+	}
 
-		/*
-		 * Default mode for SSP configuration is TDM 4 slot, override config
-		 * with explicit setting to I2S 2ch 24-bit. The word length is set with
-		 * dai_set_tdm_slot() since there is no other API exposed
-		 */
-		ret = snd_soc_dai_set_fmt(rtd->cpu_dai,
-					SND_SOC_DAIFMT_I2S     |
-					SND_SOC_DAIFMT_NB_NF   |
-					SND_SOC_DAIFMT_CBS_CFS
-			);
-		if (ret < 0) {
-			dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
-			return ret;
-		}
 
-		ret = snd_soc_dai_set_tdm_slot(rtd->cpu_dai, 0x3, 0x3, 2, 24);
-		if (ret < 0) {
-			dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
-			return ret;
-		}
+	/*
+	 * Default mode for SSP configuration is TDM 4 slot, override config
+	 * with explicit setting to I2S 2ch 24-bit. The word length is set with
+	 * dai_set_tdm_slot() since there is no other API exposed
+	 */
+	ret = snd_soc_dai_set_fmt(rtd->cpu_dai,
+		SND_SOC_DAIFMT_I2S     |
+		SND_SOC_DAIFMT_NB_NF   |
+		SND_SOC_DAIFMT_CBS_CFS
+	);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_tdm_slot(rtd->cpu_dai, 0x3, 0x3, 2, bits);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
+		return ret;
 	}
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
