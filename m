Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C83C150296
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 09:30:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EFD61698;
	Mon,  3 Feb 2020 09:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EFD61698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580718604;
	bh=hfGcwF3hCb6AvpMEAc2GMl5KvVuuGjZZnxRdrz8F2lk=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FWXq8E1ehS4hoqcRIWUunVVoLUUO3KZdaLT92259ob2+C8ETI7sM6VbhOuU0Zq7as
	 baNH9YHY373NbDT8cQEQY7pha0F9/4MbxEn/ydeZQ7GeqIDcmVUNJDhR0n8GYCl6Xb
	 gG+sdSQ+JnQcyNIfQzckUFkkXtBl9AbPDoPumB9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 459CDF8011D;
	Mon,  3 Feb 2020 09:27:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8FEAF80233; Mon,  3 Feb 2020 09:27:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B01C0F8014C
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 09:27:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B01C0F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="dHmF7fcp"
Received: by mail-pl1-x649.google.com with SMTP id 71so4299977plb.18
 for <alsa-devel@alsa-project.org>; Mon, 03 Feb 2020 00:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=nv/gWXMm1LPjD6+In1LaHObzpkMiIoBLQHOZAKjhzFo=;
 b=dHmF7fcp26TaKEWfqy4GWMSgHDMVu6lP0xdNny1b7CZgldNeXkOvf5w6bNk4yVDynI
 hz/uJi4LUTbyMBW8vvc5d9ZQEfAnukG0AsM8FXEt2TSV07U9jxwG6sKXH+Xwi+sOazo+
 KtC7R7l68Pv4UhE+G9uDMNzpfhs/HgtnAUCD+J8jvuJVY+w1xGWgpZQEyBusrV1FtGr0
 5CWDAgjL87EdKTt3vpa3TToMsgP5zAMqGf1hTc+azjqSydE+4KFfLTX2zteZCxXAPVsF
 nQK/MTzoyQ6C6TVFRhp038P5Fw5I/XmsZmsXQKbWFd9P/aLif2JmZeYdozHV2zcEURWt
 M4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=nv/gWXMm1LPjD6+In1LaHObzpkMiIoBLQHOZAKjhzFo=;
 b=cP7E/e33WXYtZFpbXgf6+SNTGZJkCCkT3TnHgVKq4Q6bjQRqwYdW8bqqMRthPjGwJ3
 UVwvRsNqlI6WhJ7/e+b0Eukzi1aUMaOdUjU7b81J9IcnZpDeDPtmP3h8WIooT8w14rFH
 qnuJlGcMm2ytOJa+AswPZ87v6KZmkgyc2dqf8n8FCNr2usC/zmNqB7acWgI1lO0wDHXC
 MZrqTVw8J/azvYlBFZnREwoh5WTYEZkbeNcZ3Thn20l7+wQt6Z38QWysrXGtCJU7Ouuz
 JTTQRHC4lQEg4kQuq+ADVVv6PgTBLCqLjIRrj6Hd+YXyYX3orqLsYLoj7F/cb00wfG5e
 4bbw==
X-Gm-Message-State: APjAAAUeb4xoFdfZriL7OQyLRkuSEG+LBuQgjekNe0RAoL5QB9BWKx1l
 QWieUruD7aFzRgHlRamItCoY3Qoyo5W0
X-Google-Smtp-Source: APXvYqzyHmoXCfgMHVHFR6gT9T8Azz/oAlmKEtSegXV43hookvRACho2AUKsE8tr7Kh9t3HI6jjViWjXp/D1
X-Received: by 2002:a63:1e1d:: with SMTP id e29mr24493750pge.347.1580718454675; 
 Mon, 03 Feb 2020 00:27:34 -0800 (PST)
Date: Mon,  3 Feb 2020 16:27:15 +0800
In-Reply-To: <20200203082718.59614-1-tzungbi@google.com>
Message-Id: <20200203151250.1.Ie5aedb9d34ebfc7f05ceb382bfe346c45331cd63@changeid>
Mime-Version: 1.0
References: <20200203082718.59614-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 1/4] ASoC: mediatek: mt8183-da7219: change
 supported formats of DL2 and UL1
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

DL2 and UL1 are for BTSCO.  Provides only 16-bit, mono, 8kHz and
16kHz to userspace.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index c65493721e90..b7d4bfd04b37 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -116,6 +116,46 @@ static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static int
+mt8183_da7219_max98357_bt_sco_startup(
+	struct snd_pcm_substream *substream)
+{
+	static const unsigned int rates[] = {
+		8000, 16000
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_rates = {
+		.count = ARRAY_SIZE(rates),
+		.list  = rates,
+		.mask = 0,
+	};
+	static const unsigned int channels[] = {
+		1,
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_channels = {
+		.count = ARRAY_SIZE(channels),
+		.list = channels,
+		.mask = 0,
+	};
+
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	snd_pcm_hw_constraint_list(runtime, 0,
+			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
+	runtime->hw.channels_max = 1;
+	snd_pcm_hw_constraint_list(runtime, 0,
+			SNDRV_PCM_HW_PARAM_CHANNELS,
+			&constraints_channels);
+
+	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
+	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
+
+	return 0;
+}
+
+static const struct snd_soc_ops mt8183_da7219_max98357_bt_sco_ops = {
+	.startup = mt8183_da7219_max98357_bt_sco_startup,
+};
+
 /* FE */
 SND_SOC_DAILINK_DEFS(playback1,
 	DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
@@ -222,6 +262,7 @@ static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		.ops = &mt8183_da7219_max98357_bt_sco_ops,
 		SND_SOC_DAILINK_REG(playback2),
 	},
 	{
@@ -240,6 +281,7 @@ static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		.ops = &mt8183_da7219_max98357_bt_sco_ops,
 		SND_SOC_DAILINK_REG(capture1),
 	},
 	{
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
