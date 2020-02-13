Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D19615B7C2
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 04:29:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 877791672;
	Thu, 13 Feb 2020 04:29:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 877791672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581564597;
	bh=EkMdrRRynsNeRe/Trho5i7omMZ6ouGb66zX60j0idik=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hS1mEJErtISOwXvTqo64guOm47pHiQ5CIo4rsNrhSZ8TQPS/55NnxGv09RW2ZTeyL
	 ZynPXEbvr/2YsEk4stOox41XVOdtNn9te7renRYdINlm2O0SfXcbzbBMr+MsDoVpHe
	 Z8Dccse31h7zgoG4je8731VRWy9xMdhEkUQ5TWC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B33CAF8013E;
	Thu, 13 Feb 2020 04:28:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43061F80146; Thu, 13 Feb 2020 04:28:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30FC4F80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 04:28:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30FC4F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="ooBiGRaH"
Received: by mail-yb1-xb49.google.com with SMTP id t186so3885184yba.23
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 19:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9L2d+CO6Iyos1YOInxK92sjPkbyLs9BRcpmHv2LXX8g=;
 b=ooBiGRaHF0lQpMx3NrkyYso9Vg9U9LYDN3KdVrDMARpGk8sb5+gaD0qtEjj+1hoWuC
 /ivpNqekvXwf87djXaeyJMNhC6rCJR8PUhEIaynnsvNyAM/67L6ykF4a80A/52PXtdiz
 ruAf9sKaytmBdcjOnsWh1UkIAy7GM9rU4PBjo2MwOgFS4MRxUUqzukAXo8k0tWBYmYDz
 jOXDmliG+BqbURX+CA2jfYVQfPEUI26OzdN3Gy5fMJokl3zVw1em3KRUpLMWrUjla6OT
 pkjzBSyN5pytS6B0cWmlGweUWC4EIm3TLxlCm2pFAvrJDshQLqudH6I+VFEBlh2OYYNN
 4GiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9L2d+CO6Iyos1YOInxK92sjPkbyLs9BRcpmHv2LXX8g=;
 b=XrpG++1IgHfJuz2QBgTCznfMqv2wrIQM/BeIAUPYU3l1u/ToEVNCAhdA5kJVs2R4RV
 8lZhEm2BEykPUbs/MK1LapJKdH4n30r1Fbw7DHW7ihfdV8BrGt9PGHCLpMoxpJ9ys5QW
 L2qtCKW5ZN4LSaMrTHvIMlm04M0jsRDnI+lhpHiQPegQ9xXe77NboiXzZNohc45h8spi
 Th7FkZSK/280eu4CgZLGNgY6sxl4tM6RAJ5yEDM54uaOcVfkYOmFIJELaNWCL+yATfc+
 hppW9p64C8awpjD7sxuFwLpnLkR49hcgtIrW+eJgjMeh5BEXbUk1QsOAoegDoyH7U0tK
 jc+g==
X-Gm-Message-State: APjAAAXNJfRyFmYQpdA1KIbT+6ewqGEaQyepB7q+yJEsjDw/JCtonhSS
 qb1bQgfogH29mdCWwaUr+TYTuaoPeDjk
X-Google-Smtp-Source: APXvYqwbp+7cxC8s8vtORhN0Sl2jZxLQ/2oHq4Pp/mPNcssexkboT1Z7BmlUYSSQ47XnPVS7LDiLc6KIBBH4
X-Received: by 2002:a81:50d6:: with SMTP id
 e205mr11985558ywb.208.1581564486940; 
 Wed, 12 Feb 2020 19:28:06 -0800 (PST)
Date: Thu, 13 Feb 2020 11:27:25 +0800
In-Reply-To: <20200213032728.199462-1-tzungbi@google.com>
Message-Id: <20200213112003.1.Ie5aedb9d34ebfc7f05ceb382bfe346c45331cd63@changeid>
Mime-Version: 1.0
References: <20200213032728.199462-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [RESEND PATCH 1/4] ASoC: mediatek: mt8183-da7219:
 change supported formats of DL2 and UL1
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
index 1626541cc0d6..b52ffed882a7 100644
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
2.25.0.225.g125e21ebc7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
