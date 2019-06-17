Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 322CE478DB
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 05:57:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C746179A;
	Mon, 17 Jun 2019 05:56:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C746179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560743847;
	bh=I5ydMtuO3ODe1d7ejaUSxHUsOTngU7Hygae9HuaKl30=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RWarg6YbuROtv/BTT6G+8Xv1ReCgbc3+JiFo8p3H7DNsiTRFQUjVmOePiDVM74FC2
	 Xyz3SIyyK/u1pTQ6GCXbdWIkYTVQlj8oiHus8XSFooiD5SqmExu9Pubs8CpLwLVybv
	 5Y6MV16Sba4eMtlef2ImRio1GJ3WjfPDicA4DoqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05261F896DF;
	Mon, 17 Jun 2019 05:55:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BCE9F896C7; Mon, 17 Jun 2019 05:55:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E123F8075C
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 05:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E123F8075C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="QNNfyl42"
Received: by mail-pg1-x542.google.com with SMTP id n2so4975956pgp.11
 for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2019 20:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vqJC7xd4cP2xpAKX8G95YoEsmqVNCEblRXgdAkHCapM=;
 b=QNNfyl42w6byYynB7rie9EzAzYFuxbsJrA50fJY8WM5bonPLS23f4e7cxoAkvfq/lX
 0nZrdjylhTEbzuFVWupwnQVBibKxgttbTeD2/H9tbj/p4yGeWUdQhXYG7Zy8us880YD9
 0TseLImsZsc9wISY/IKOoeeZUBRgekmFvLRCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vqJC7xd4cP2xpAKX8G95YoEsmqVNCEblRXgdAkHCapM=;
 b=EOoXLvNY/FvUbVPrO2k9Ok4Iw9wufpt5J2QxMEFW3CUgryN4T9XJnyYlaMgSPWNT7p
 qV9VaU1PQ4MNzhwa3SJKcUMOQDbn23oCDV5+s1Jd1JlRoeNtpmojFk2nHgsw8RyvjEJG
 fsvw2Rv4KT++BOEVnBBGKToeJ6Qk+fxRkfZQ1aUMjfpee8UPPtiN5RVltDihcjBmsf70
 PdUpVFplWvIbomo4usZEeCdGdMWzREY7KWmr78iAP14U+S5GBTPo0giKCO8rF14+gM9F
 XuZ0LYzt1KaH+Iga2rRmGomQ9JDlzxC8mAOyXkvMkuHGQ2ZXccaxeJ35qVqvZK9LENFv
 1R7A==
X-Gm-Message-State: APjAAAU2a0x31ZmOwpcjj4ZReoTRM8N+8VuXlAiDo0z9ZS9EKPDeJ5Dc
 7tLyKGQLXhltGLUPRwTdvBDvdw==
X-Google-Smtp-Source: APXvYqzMcJGvPCzd3KYYEdzBOyrQBsmuYJagogI+c0tD6CSvNL8goYmfenj4fCeIdCvv3A9NE5ZTDg==
X-Received: by 2002:a17:90b:8d2:: with SMTP id
 ds18mr24710251pjb.132.1560743733942; 
 Sun, 16 Jun 2019 20:55:33 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:845f:e35d:e30c:4b47])
 by smtp.gmail.com with ESMTPSA id a3sm9720214pfo.49.2019.06.16.20.55.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Jun 2019 20:55:33 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Mon, 17 Jun 2019 11:55:26 +0800
Message-Id: <20190617035526.85310-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 dgreid@chromium.org, cychiang@chromium.org
Subject: [alsa-devel] [PATCH v5] ASoC: max98090: remove 24-bit format
	support if RJ is 0
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

The supported formats are S16_LE and S24_LE now. However, S24_LE is
not supported when TDM is 0 and it is not in the right justified mode.
We should remove 24-bit format in that situation to avoid triggering
error.

Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
The datasheet said that when TDM=0 and RJ=0, S24_LE is not supported.
So I added a constraint to check TDM. Please take a look. Thanks!

 sound/soc/codecs/max98090.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 7619ea31ab50..d118cf80b6b2 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1909,6 +1909,26 @@ static int max98090_configure_dmic(struct max98090_priv *max98090,
 	return 0;
 }
 
+static int max98090_dai_startup(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
+	unsigned int fmt = max98090->dai_fmt;
+
+	/*
+	 * When TDM = 0, remove 24-bit format support if it is not in right
+	 * justified mode.
+	 */
+	if (!max98090->tdm_slots &&
+		(fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_RIGHT_J) {
+		substream->runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
+		snd_pcm_hw_constraint_msbits(substream->runtime, 0, 16, 16);
+	}
+
+	return 0;
+}
+
 static int max98090_dai_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params,
 				   struct snd_soc_dai *dai)
@@ -2316,6 +2336,7 @@ EXPORT_SYMBOL_GPL(max98090_mic_detect);
 #define MAX98090_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
 static const struct snd_soc_dai_ops max98090_dai_ops = {
+	.startup = max98090_dai_startup,
 	.set_sysclk = max98090_dai_set_sysclk,
 	.set_fmt = max98090_dai_set_fmt,
 	.set_tdm_slot = max98090_set_tdm_slot,
-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
