Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB57803359
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 13:48:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EA0D820;
	Mon,  4 Dec 2023 13:48:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EA0D820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701694137;
	bh=jcskp8bYdET0mSh8F04wbmedTl0NWod2/AT6Yc2rhOY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gPFvu8m1+AjHsJBoqlaPWypEo+sQzxF903BWFyoF4blfFsyGDjOH2A/aOyVQTdY6l
	 vY98h70cJ51mV20MEe67irmExcxJS16SXACOk8taFQEAJKImdFtD43ZPOj6RCvS3p+
	 pkoTchh6ZZkg3o7OSm60cWb5TRLv0QiJreYH03Jg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A17AEF805C4; Mon,  4 Dec 2023 13:48:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DFF0F805DF;
	Mon,  4 Dec 2023 13:48:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86A65F805BA; Mon,  4 Dec 2023 13:48:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE478F80588
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 13:47:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE478F80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gl2YUU8e
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-54cb4fa667bso1428260a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Dec 2023 04:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701694063; x=1702298863;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KY0JnJRKpd3/EUynN0UwcoxBlBhaBotyx7RxLf0wHWk=;
        b=gl2YUU8eKd9/sbmA84jxibnGat9ZAaxpv4BYp5Js/d8bc1SGFWnrn++i4RzHp/FHie
         dJcNigfYXwhIZYOpQCYzp/WiHT1/WXJXKPZDknxp/n3F7e5msww1oUBrljXNtE1xkuvl
         ur2b76Ma9gzLFcD/0zLiRvrF6HRe+biFfZI9mfymLWSpKU/oY/XWA2DJucNtp4ek0mcV
         9+QihOPWK5lw5kPcNJEwwqZXQ1/SgPWcxcDNL5P0+4Ko0D4Y9TP/kUXIewv9/jAmUNkL
         MFL2UxnoSxvdUCUna60jghxbgB16hIalRWeffMNZ5QGR1ED46bS/tRpL5D8G9YUtwZue
         MfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694063; x=1702298863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KY0JnJRKpd3/EUynN0UwcoxBlBhaBotyx7RxLf0wHWk=;
        b=NALp1zainczZ9PoUd92Tb0faP7jvP+14hPThe0UDszizdqg11ECTYO17bggFK1aHhq
         7zIMilXoJMXtZvmg616FlXD863PmEUaVj4lKktfDBSptjQlYJtefwuw4vSDFwr8N0mzv
         kl8rHWyaD7iuOihvrsp/u8Aj9P3dMqrpPgFrHqy9LumaLhyQb0ieU/3LR/NV5ysH5LBu
         dhC83dsZQ2/yETXaGqs/IS3xJwAf3U8X8x4y9i7DBa8QuxLdeoAR49XSaReBe9W1uZ5Z
         jvvBH50IB8XQ8CrqBv694IX7wb6ChHyNoJWz8Xpfz+RNBL0ryVajO7dUV3OW0Nh1eaS4
         N1DA==
X-Gm-Message-State: AOJu0YzDKEvO1dkgFJ4KpSpmzHb2Ww2KGV1X7gVjdAUqWhWjttYouXrT
	8+gcXLierVqAu+vKJJWb6HY4PA==
X-Google-Smtp-Source: 
 AGHT+IFhu/InStD612XpzFwPv9bBK0nLIg+7JO9nMW2ZvtutTmDe1Q3IXR3v2X7PDbYWSph/4G/iGg==
X-Received: by 2002:a05:6402:17dc:b0:54c:a21b:8088 with SMTP id
 s28-20020a05640217dc00b0054ca21b8088mr1192577edy.63.1701694063127;
        Mon, 04 Dec 2023 04:47:43 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 dc15-20020a056402310f00b0054ced65bd26sm457017edb.41.2023.12.04.04.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:47:42 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] ASoC: qcom: sc8280xp: Limit speaker digital volumes
Date: Mon,  4 Dec 2023 12:47:36 +0000
Message-Id: <20231204124736.132185-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
References: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OEGD637L4TX2OJFIHZHLDGPUMCOKZVUO
X-Message-ID-Hash: OEGD637L4TX2OJFIHZHLDGPUMCOKZVUO
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OEGD637L4TX2OJFIHZHLDGPUMCOKZVUO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Limit the speaker digital gains to 0dB so that the users will not damage them.
Currently there is a limit in UCM, but this does not stop the user form
changing the digital gains from command line. So limit this in driver
which makes the speakers more safer without active speaker protection in
place.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 249a43e1dee3..1e8f9452cd28 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -25,6 +25,23 @@ struct sc8280xp_snd_data {
 static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+
+	switch (cpu_dai->id) {
+	case WSA_CODEC_DMA_RX_0:
+	case WSA_CODEC_DMA_RX_1:
+		/*
+		 * set limit of 0dB on Digital Volume for Speakers,
+		 * this can prevent damage of speakers to some extent without
+		 * active speaker protection
+		 */
+		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 84);
+		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 84);
+		break;
+	default:
+		break;
+	}
 
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
-- 
2.25.1

