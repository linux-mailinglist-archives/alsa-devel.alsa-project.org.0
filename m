Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 522A34977C
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 04:26:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D7C4170B;
	Tue, 18 Jun 2019 04:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D7C4170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560824773;
	bh=oMqjsABOU+wBEUCMGhUhCS0m0cpN9x9nLLUQgV/2XeQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UE3bWUkU9OJGQZYb9SUphj9CnjVrNMTOhiTwPsEBAyPyZuFIjyp3TjQVtA9GTBXDt
	 HdU6BWKVODNRJ1UNoAtqrwrJk4YTs72iaE5VNm3F/0EdCXHj+vk5yvz3iiAzdD/VPv
	 reF4gx9qSjwBFGrBlzfK71eMxlrl+13wji0F4QSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85911F896DB;
	Tue, 18 Jun 2019 04:24:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EECD6F896F4; Tue, 18 Jun 2019 04:24:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CDFAF89682
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 04:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CDFAF89682
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="LVk29ML2"
Received: by mail-pl1-x642.google.com with SMTP id f97so5028287plb.5
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 19:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yw03RFVQcw38KaDua5lfZL2d94vDmgCgBzJoqXkOo3o=;
 b=LVk29ML2Mk7TxhTiFLm8J7/YvF/o+CR7DzBBXQPGajlXfqUxXGXJ4EhHkqq5u4Lc16
 YugCinbdUozD6ADaCMon/inXwIx77+du+fQc6e0aD5WwA6cZJQYREkJdz1/MUIWPda3y
 pJkmCgvOHdNqJt9VZoHIq6UaUIKh9IBP8aybQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yw03RFVQcw38KaDua5lfZL2d94vDmgCgBzJoqXkOo3o=;
 b=KC/mAM7JJrmFYKktzWwUo0h0NE5GV4kqWoqj+sa2GwOnKultLxOo4BSlCO4T0w6MSC
 3PXlwVqDuYnItpeqIk8vKV72mAtKOQ3qKJV3uqQ1YT9Y0W7FiP+cxIKMf2TgIIXKVzjh
 c/DEY2GIiquvyjxmyhtVwOMbcNi3f9G7su2/N0uKXWVr9yIhWWg1SquvDNhy//7utv9y
 x8Irc4c907w62OQUy81zsEzjeema1ZVd7fLOyNGGJm95oYWAd0tZfYEUzQGDGRtEXqlm
 VZz1bPIj9KV3Sn/mhXwRrsnpGbV5W9o6zQ0F5FEgxVk8ZigrRUhq2LSRVedlXXiaY/8E
 n3bQ==
X-Gm-Message-State: APjAAAXZjSb800tOEZNtwLjo5dtYPZnrKmSlK+d53WyyRsDAdpuX5CXc
 n13/bWSFS2G952Kq0eZw/D66tw==
X-Google-Smtp-Source: APXvYqw2i5AMM/87XCpRxxTyAuhe6pnkw8RyEuhbtxI/wc3tynKJvEOPZRHYiDLNxEM4jR0p2mVDxA==
X-Received: by 2002:a17:902:1566:: with SMTP id
 b35mr113961401plh.147.1560824660939; 
 Mon, 17 Jun 2019 19:24:20 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:845f:e35d:e30c:4b47])
 by smtp.gmail.com with ESMTPSA id y185sm13173222pfy.110.2019.06.17.19.24.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 19:24:20 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue, 18 Jun 2019 10:24:11 +0800
Message-Id: <20190618022411.208156-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 dgreid@chromium.org, cychiang@chromium.org
Subject: [alsa-devel] [PATCH v6] ASoC: max98090: remove 24-bit format
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
Changed the order of the conditional.
Remove the snd_pcm_hw_constraint_msbits function.
Use removing 24 bits format instead of fixing at 16 bits format.
 sound/soc/codecs/max98090.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 7619ea31ab50..9fbb4c31bcf1 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1909,6 +1909,24 @@ static int max98090_configure_dmic(struct max98090_priv *max98090,
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
+	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_RIGHT_J &&
+			!max98090->tdm_slots)
+		substream->runtime->hw.formats &= ~SNDRV_PCM_FMTBIT_S24_LE;
+
+	return 0;
+}
+
 static int max98090_dai_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params,
 				   struct snd_soc_dai *dai)
@@ -2316,6 +2334,7 @@ EXPORT_SYMBOL_GPL(max98090_mic_detect);
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
