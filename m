Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFC56C6E0D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 17:46:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A99B3EE7;
	Thu, 23 Mar 2023 17:45:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A99B3EE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679589989;
	bh=2WBtzGjqEmIJfSg18+w1dSZ4eolJ4kxqD96gfvLErd0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=otELF5WQ+WbyVvd83thmllfkiakTDfo/tkhkK7RlKjxhNbRJY0Tp5NzSClmt9GSKl
	 XV64XOWG0Zz3phwFtwpQx+8w5wm3i6/DCzBk+DDB4wAw0pbLi3BBxOp9fGpoNboaN4
	 byja4G6stM2xMhvwlZl+x/hROy9sQF8WXUAtvABI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8300EF8052E;
	Thu, 23 Mar 2023 17:44:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF7F1F80482; Thu, 23 Mar 2023 17:44:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33FDBF80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 17:44:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33FDBF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gR+HrEbS
Received: by mail-ed1-x529.google.com with SMTP id b20so56542143edd.1
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 09:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679589859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/ixaKYCINrc8PZNvIv/BmX3oT7UL3hRYGh8CvIW67w=;
        b=gR+HrEbSGNaBPXyDWCKFxXDo8N8eJof0wkZfcPSoIFUybYbdbDk7TQ50jIYpTPg1Mu
         7iUSc/JXUV5V2uo6O3W5pCXzqXrByLxMX5Stnh03QSQfvHQQv0Y4y7V0MIBYQscWcpjp
         mSLEFwG0h7sUfUq76wecIuaYUoC3IoMoK0a5F8Y9CXY88+Bjn07Jee7XkQ1reJ/TFS1l
         vquOdwHsm8w3ytV1TkaeX/IycPc8k4Q6nbDFFZ/Ll20wE2tL/k68mTeom7TaPPoMLAnf
         18n656Li66Q7oHf+7SAmOEqoZS1R8eXyPolMfaltUhxm2dX0WJRSryEFQYkh7PS4fOZz
         iMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679589859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/ixaKYCINrc8PZNvIv/BmX3oT7UL3hRYGh8CvIW67w=;
        b=LZXYeY37/d3OuQUD5WJtTAhAJYW2I5Lq/wRY68SK+XDBmcFBwLqnfv+HoRJr9zFB9P
         wXBH7VCz9v+9H3KW1pGvJbrSHab3dGxjWdWDSFfv0elthg15aSSNN55BtBc4xX5PTyBN
         qX2aWiMuMd1DOKXyxR4ZIzUbUUsxeXtIrVH8w4gemB1MWz8YBRup7tJ0fD7PvZ8fWprY
         9PJUebu07CSMbA+bharlYRO3ABu0vCVybKb3+KtYLAlqSr+ucIazubYjZUGJhlwEbrbw
         rlO+oWYWAqV5uGU3FsJer3xB7T7sFpiVAAbDtLP26yAKopATzeZgVFMuA9N6Bhq9OyOY
         dJYw==
X-Gm-Message-State: AO0yUKXAz7CUoDXW/kfwPJZN/xbNDPBACFPMVdfo9Ds8yktRjN0+cK3w
	myZ3G4ULubxWDX6o9n/ZP/3H+g==
X-Google-Smtp-Source: 
 AK7set/vy+gzeXZ1o5gE0FO2a65HuiXtu0JMZsOOtsd+Qb317JBUb4yMNlyBnCpcSiQd8mGZ+rWzSA==
X-Received: by 2002:a17:906:1b15:b0:8b1:7ae9:647 with SMTP id
 o21-20020a1709061b1500b008b17ae90647mr10473349ejg.76.1679589859734;
        Thu, 23 Mar 2023 09:44:19 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a50998a000000b004e48f8df7e2sm9542187edb.72.2023.03.23.09.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 09:44:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 4/4] ASoC: codecs: wsa881x: mute/unmute PA in correct sequence
Date: Thu, 23 Mar 2023 16:44:03 +0000
Message-Id: <20230323164403.6654-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
References: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B2LHLCXDPKM3U6BJ3ECZF7IREZCGFF7V
X-Message-ID-Hash: B2LHLCXDPKM3U6BJ3ECZF7IREZCGFF7V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2LHLCXDPKM3U6BJ3ECZF7IREZCGFF7V/>
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
 sound/soc/codecs/wsa881x.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index f709231b1277..4ce72a7f01b6 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1033,11 +1033,39 @@ static int wsa881x_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static int wsa881x_trigger(struct snd_pcm_substream *s, int cmd,
+			   struct snd_soc_dai *dai)
+{
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		wsa881x_digital_mute(dai, false, 0);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		wsa881x_digital_mute(dai, true, 0);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int wsa881x_startup(struct snd_pcm_substream *stream,
+			   struct snd_soc_dai *dai)
+{
+	return wsa881x_digital_mute(dai, true, 0);
+}
+
 static const struct snd_soc_dai_ops wsa881x_dai_ops = {
+	.startup = wsa881x_startup,
 	.hw_params = wsa881x_hw_params,
 	.hw_free = wsa881x_hw_free,
-	.mute_stream = wsa881x_digital_mute,
 	.set_stream = wsa881x_set_sdw_stream,
+	.trigger = wsa881x_trigger,
 };
 
 static struct snd_soc_dai_driver wsa881x_dais[] = {
-- 
2.21.0

