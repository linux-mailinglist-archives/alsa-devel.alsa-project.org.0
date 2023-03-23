Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F7F6C6E0B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 17:46:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25ECDEDD;
	Thu, 23 Mar 2023 17:45:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25ECDEDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679589969;
	bh=80X+4mShC4K7plRh9ylTinMGuRtbiwnMrpZ1FTSDz9I=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AJ16l8gcnMLuZOJfAH7fPnmcKIegtxE3zLUGUzqRc+m5t+Nx2MKzKqAuoZ9uiBwd/
	 wUxLAK0oaZnrFiLuGUPaRIQYPVV4TU939r6psbA9lZw4UxLnX5GRSQ1h7HKo2vn3sN
	 7V/vjHLqnY77xVQdghhUK56p+Gc5Qe3tPfmV77U0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 668B0F80529;
	Thu, 23 Mar 2023 17:44:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D20C2F804B1; Thu, 23 Mar 2023 17:44:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3AA0F802E8
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 17:44:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3AA0F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dacXY7Bg
Received: by mail-ed1-x52b.google.com with SMTP id ew6so26503806edb.7
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 09:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679589858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ylgpuVGeZBO2/cPigFjTck4l8oNGf5kwYVPeLJ7mYo=;
        b=dacXY7BgXtYyAS8zIpvXAvcqNaLtsWu7+lJTg+KFrpJT1Z5K5gYJ6Y4K6BD2huGCa9
         5vhnXieE415UGVwoecZOfFSqsXshhfWe0aJYOC40tSvBgxuWU7W7QimqqscSY0hOKA1C
         f6B73Y3wVgs2Ck9zYnrKTG9/A2JgGhG/WfrOGxzOUzclZKUb9GAOC0mSYqjcjbWB54IR
         v5g1bq5pz25hcf0I0nckMSeP97SFjcdBMrvximAgZa4ZNKFcCC4KOZgOv1zRYkk2ZEIx
         lofDYwd6dqtHaVtcjzex+63NchJQ9oGh/C9orGbqSyPyTwEX21yljYRSH/KlBeg0JoWE
         HiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679589858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ylgpuVGeZBO2/cPigFjTck4l8oNGf5kwYVPeLJ7mYo=;
        b=KXFqiaCkJLDDbv7ZzitqW0E7WpvwYnaNkdhjdNZyWwxU8tspQuYbMrwhffqWjnsxB6
         +/CGMC3RtQOF99fByYyq2VmxlfzrQIJi6pZz65WSuZYHiWvRUVQHPwlhXvx85EwWm9H+
         7ezvz+HN7nueGqTfAJYhOqhosZFewV8kBapPLj0f6xBv3kTCffUZBupuk7wmrencFAl1
         IFzYAZPAAZvNuQd4UrX8IbJfpRHze39/mksl611TrWf4KRahS8St2osCIDNPVFLka9YF
         R1jplVpgXLs6+33/Va98oLzIatienmGgAQgQ6QDcl6cIDQTvUh9laPVKYmv8t1WwXm2e
         jGEA==
X-Gm-Message-State: AO0yUKXGTEVT/XF/kYkO5CDieZmMUeYkT/IeD1vXj2+pEYxvg1rAkbcx
	aGguZA2SE61KrX+XnUk4AMtjXA==
X-Google-Smtp-Source: 
 AK7set8PJ6DrVeZ74exAstkDNXg0vgDtpg5//VFYMzxKWQ4tvmjHT43tXBzHbo9OovNiaKw/g+ELLw==
X-Received: by 2002:a17:906:b0b:b0:930:f149:7865 with SMTP id
 u11-20020a1709060b0b00b00930f1497865mr10714465ejg.21.1679589858511;
        Thu, 23 Mar 2023 09:44:18 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a50998a000000b004e48f8df7e2sm9542187edb.72.2023.03.23.09.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 09:44:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 3/4] ASoC: codecs: wsa883x: mute/unmute PA in correct sequence
Date: Thu, 23 Mar 2023 16:44:02 +0000
Message-Id: <20230323164403.6654-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
References: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U7FD2O3LFHF55PNU2DARLGPWIK2ZC63O
X-Message-ID-Hash: U7FD2O3LFHF55PNU2DARLGPWIK2ZC63O
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, johan+linaro@kernel.org, steev@kali.org,
 dmitry.baryshkov@linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7FD2O3LFHF55PNU2DARLGPWIK2ZC63O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In the current setup the PA is left unmuted even when the
Soundwire ports are not started streaming. This can lead to click
and pop sounds during start.
There is a same issue in the reverse order where in the PA is
left unmute even after the data stream is stopped, the time
between data stream stopping and port closing is long enough
to accumulate DC on the line resulting in Click/Pop noise
during end of stream.

Moving the mute/unmute to trigger stop/start respectively seems to
help a lot with this Click/Pop issues reported on this Codec.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index c609cb63dae6..b83b5b0d4bab 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1204,9 +1204,6 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 			break;
 		}
 
-		snd_soc_component_write_field(component, WSA883X_DRE_CTL_1,
-					      WSA883X_DRE_GAIN_EN_MASK,
-					      WSA883X_DRE_GAIN_FROM_CSR);
 		if (wsa883x->port_enable[WSA883X_PORT_COMP])
 			snd_soc_component_write_field(component, WSA883X_DRE_CTL_0,
 						      WSA883X_DRE_OFFSET_MASK,
@@ -1219,9 +1216,6 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 		snd_soc_component_write_field(component, WSA883X_PDM_WD_CTL,
 					      WSA883X_PDM_EN_MASK,
 					      WSA883X_PDM_ENABLE);
-		snd_soc_component_write_field(component, WSA883X_PA_FSM_CTL,
-					      WSA883X_GLOBAL_PA_EN_MASK,
-					      WSA883X_GLOBAL_PA_ENABLE);
 
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
@@ -1341,10 +1335,38 @@ static int wsa883x_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static int wsa883x_trigger(struct snd_pcm_substream *s, int cmd,
+			   struct snd_soc_dai *dai)
+{
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		wsa883x_digital_mute(dai, false, 0);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		wsa883x_digital_mute(dai, true, 0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int wsa883x_startup(struct snd_pcm_substream *stream,
+			   struct snd_soc_dai *dai)
+{
+	return wsa883x_digital_mute(dai, true, 0);
+}
+
 static const struct snd_soc_dai_ops wsa883x_dai_ops = {
+	.startup = wsa883x_startup,
 	.hw_params = wsa883x_hw_params,
 	.hw_free = wsa883x_hw_free,
-	.mute_stream = wsa883x_digital_mute,
+	.trigger = wsa883x_trigger,
 	.set_stream = wsa883x_set_sdw_stream,
 };
 
-- 
2.21.0

