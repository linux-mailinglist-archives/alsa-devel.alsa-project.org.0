Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A518204956
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 07:53:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06C59172C;
	Tue, 23 Jun 2020 07:52:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06C59172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592891603;
	bh=Uv22iLVK5q+fxrOtig9o92rxCN4EHvlqvwmEcbdQzng=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YtEEjeSsfIn1MbDkEr4zeh0TPz9gz+RO41sns1LoFJrnm7JXaJ7eM6iYjSFeOlZDm
	 pUOWxll6aHmP8FmcQA5dOWDgN+jQFEQcKmWaMfRgbHfA+WpZ7097GOIPX2NqVGjS6N
	 fuvvu8pav75fBi8ZaTtH3v44vWCXNA1V9ao8I6ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1930AF8023E;
	Tue, 23 Jun 2020 07:51:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B79D9F80234; Tue, 23 Jun 2020 07:51:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0243AF8012F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 07:51:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0243AF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Ts2ad+d8"
Received: by mail-qt1-x849.google.com with SMTP id o11so14875670qti.23
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 22:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=wedjx5jl6M1TtVf63jTcKqbaOkFJVmvFEn5mEMhiWuY=;
 b=Ts2ad+d85RA3nKKDJhSHGdPWTy1RUTJEinw/YH+hcvv2fZwAvazSLXxZUVjeYDvcPX
 /CPzU5+n5WGRW8Ew2O6cOAHXp2gYMA/fqV8EH5MtZPu9ZYKKRpTr0YClUX3sOYevX93l
 sWyHTk2SuxMGjIWlFn966MKJlc73Sj6mzY7uRHap3jjRQxsgBGspLk8n3tH2S6mnj2BU
 NJqZwJCznAhK8LYm11RIvkj4wu2k7t91UhUGeGaTz9zda5AvTxTrbKFB/Y3G67hb1cFQ
 d9SseEHaMasg0O/VNyHRwY4UxqvdgscuLaybsYib6Cf4GCFc+1uMDvzv8EIxxPv5W3qR
 9xZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=wedjx5jl6M1TtVf63jTcKqbaOkFJVmvFEn5mEMhiWuY=;
 b=Jj2EPqIdFO4RdF9MfPVU5nJ8M+P6y++zyrT4cxEVHiS1OBfx593vByd01xtCz7nWWR
 i6F/VGCxOY7MCqd4T/WEd28JHE25Z6wHSBLzHwKbYzGURGNrdKzTCzPVVwvboO0c/86m
 W+wP1jRtyV1cKzNith5P8rqF2ljiuMZNeX7T2QB8m1L9x8CB6jugxje1Mtbx6fDKv4Xi
 MSywf7lI4bE1VPuRTYSu+pXwBKLnWslGCEhaC7d7MK7utqja5NOSIVIfClY/tgPMOIhP
 LPEU3FNNnm9EOebA4qPyatI9gPxI9ryFkCDgvoFzYRBqST+s1ucQIwNz4uyefMjlGgY/
 T4HA==
X-Gm-Message-State: AOAM532/wzUA/EC5TIGXgCCzRsQeafPvnq9NsWcbPdNHReh3gA4dq5PA
 MXKxrJRCaF/mRmupBzXXKPkd+G6xdPir
X-Google-Smtp-Source: ABdhPJzSzui5+KwE67rcx5j7GxexvYx8bxXigpajxIm56sxmzhiAot9iYfEwI0T/zwAsGERr2t/6OoNLnpF8
X-Received: by 2002:a0c:b791:: with SMTP id l17mr25586893qve.44.1592891494350; 
 Mon, 22 Jun 2020 22:51:34 -0700 (PDT)
Date: Tue, 23 Jun 2020 13:51:30 +0800
Message-Id: <20200623055130.159718-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
Subject: [PATCH] ASoC: mediatek: mt8183-da7219: set playback and capture
 constraints
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

Sets playback and capture constraints to S16_LE, stereo, 48kHz.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index ffd7c931e7bb..b61bb2de4ec3 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -119,6 +119,46 @@ static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static int
+mt8183_da7219_max98357_startup(
+	struct snd_pcm_substream *substream)
+{
+	static const unsigned int rates[] = {
+		48000,
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_rates = {
+		.count = ARRAY_SIZE(rates),
+		.list  = rates,
+		.mask = 0,
+	};
+	static const unsigned int channels[] = {
+		2,
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
+	runtime->hw.channels_max = 2;
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
+static const struct snd_soc_ops mt8183_da7219_max98357_ops = {
+	.startup = mt8183_da7219_max98357_startup,
+};
+
 static int
 mt8183_da7219_max98357_bt_sco_startup(
 	struct snd_pcm_substream *substream)
@@ -256,6 +296,7 @@ static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		.ops = &mt8183_da7219_max98357_ops,
 		SND_SOC_DAILINK_REG(playback1),
 	},
 	{
@@ -303,6 +344,7 @@ static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		.ops = &mt8183_da7219_max98357_ops,
 		SND_SOC_DAILINK_REG(capture3),
 	},
 	{
-- 
2.27.0.111.gc72c7da667-goog

