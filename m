Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 241AB140EC
	for <lists+alsa-devel@lfdr.de>; Sun,  5 May 2019 18:00:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B371E18C4;
	Sun,  5 May 2019 17:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B371E18C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557072023;
	bh=3CRmlVB0EyAtr3RNvNUdKG5aV4WzWpKAs0EL6uM4PAE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gu5m1dIfeVZ61vvg3u4TR7n6La16RSG0J481FL4ZUCGjK3QiPJKCrqYFChIGULkZ4
	 U3DlAmqzJJuyd1kz9F0TmLIYpc9TY+p9Lrv/iiqbQvmpgoNghkSBuA5GqGVE2SsTyt
	 hWtU5aBe9Uhqt/FM9x0f4F8isNT6bGDgSnNz9TR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BF29F8973F;
	Sun,  5 May 2019 17:54:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAE92F896E3; Sat,  4 May 2019 17:17:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 879FAF8075A
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 17:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 879FAF8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GkV9CeLH"
Received: by mail-ed1-x543.google.com with SMTP id f37so9671906edb.13
 for <alsa-devel@alsa-project.org>; Sat, 04 May 2019 08:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KKxuf/hi1yYphfQ+88mSEQc9wjYEjbyUrnqcwIgu1rk=;
 b=GkV9CeLHxp45QEwPr7UlPQCxO4xWKkm8OzvxrchpOF1GptdulXMIET8lsMxLk8/H8u
 rLJR57mikKX6OQhxrJczdiTEXxuRyjM0gh4WC14xEj8oYMnT+mTSJAjnDplqvT35I4eo
 CskCdAjugYQgvWJQ350soR5+eFuUWD2W/Xfe+zXflXWPZof3zcfAUQhe/5RGCmjcVif0
 Jvipxb6sdOdS/GtoMs29eQcVa3SRI/yDKOGdG1VOJeB4SajaKpuims8ihZWlGOVkVpS4
 RcBr8d/tzB9WrLMUpdUcRcTZwRMIUhpvqc2XoU19apiTtF5By/tam09gHtqIL47dnUkY
 2+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KKxuf/hi1yYphfQ+88mSEQc9wjYEjbyUrnqcwIgu1rk=;
 b=Dob2o1eb1fPHZ2h7ONH0uNiklo3CQUI6dGGMShwaOphz7c+JMh1CMiQ+7Yw60BHkC7
 KRWfTYihtJm/leS4ZoShnmprS3xBdIFxFSMKThsTdBsDyPflKQJ3W7oTQSTlpwyYBjVb
 Rqsmrg4OICazvUKpu/NQ8MguVEkg55vql8AiDdxEEPlBdPyvuRYw6708FrIBvIhhDFE8
 RNHM9SGUzIe5OErD4RiG6UQmHvS8FTIiVUPplLNzNCEEIDSgFc7fjFpv7s5OBfG413Tu
 q5xKZFPW5hjfXK3XTuSa5cXa2N05ontHdSnu1DuJGlkUMPj+yf/QTU9bMlgRlMBYwuF1
 AcuQ==
X-Gm-Message-State: APjAAAVs7j9ppUY4w5dFddR9BWycLURt45NPedo9BwNQe+YfOs6i+VKH
 90iAHGJb9Ng0k7Q5POxEoAE=
X-Google-Smtp-Source: APXvYqzYI91jwcJvMMaT9G5FwRumk2j9LLyXM+6BB+GxQwFDolbwDkJrK/enUdUkjHQJTDF392fpng==
X-Received: by 2002:a17:906:2583:: with SMTP id
 m3mr11319529ejb.74.1556983021553; 
 Sat, 04 May 2019 08:17:01 -0700 (PDT)
Received: from elitebook-localhost (84-106-70-146.cable.dynamic.v4.ziggo.nl.
 [84.106.70.146])
 by smtp.gmail.com with ESMTPSA id v17sm51489ejj.33.2019.05.04.08.17.00
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 04 May 2019 08:17:00 -0700 (PDT)
From: Nariman <narimantos@gmail.com>
X-Google-Original-From: Nariman <root>
To: linux-kernel@vger.kernel.org
Date: Sat,  4 May 2019 17:16:51 +0200
Message-Id: <20190504151652.5213-3-user@elitebook-localhost>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190504151652.5213-1-user@elitebook-localhost>
References: <20190504151652.5213-1-user@elitebook-localhost>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 05 May 2019 17:54:02 +0200
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, yang.jie@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 hdegoede@redhat.com, broonie@kernel.org, Erik Bussing <eabbussing@outlook.com>
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
