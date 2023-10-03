Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ED87B6D7E
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 17:55:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9059E845;
	Tue,  3 Oct 2023 17:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9059E845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696348538;
	bh=dlac5JEdOn3iSC+QHcakCchDr09xqsWChEI96yUxEGE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=s3ewKuXFDkmNT+2psnQW2nfU5GXs2npxtAWOC0SGk0M7zyuBV5FRwTYSmPQWrIqIg
	 0YwfgZA8B4ZOirFq4iWolNJqT03QL3TC+5Ni11xrQwvj4Q6lfnQ0DeLdNOuOrMkiVM
	 jlNZQtHxAVCQN6TZyhcg2lmfwAPmoG8h8fpnjtQ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88CFEF8047D; Tue,  3 Oct 2023 17:54:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF0ABF80310;
	Tue,  3 Oct 2023 17:54:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B07C1F8047D; Tue,  3 Oct 2023 17:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC1C7F80166
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 17:54:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC1C7F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HS3nqi9u
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9ad8bf9bfabso204528266b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 03 Oct 2023 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696348465; x=1696953265;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9qwggqM5g4H2kMBZ1deteV2yt6E9yc4Vqh+Tp6Hnvgo=;
        b=HS3nqi9u2LRAlIFp1fQYAt5K8RYMK0OWRAUTYUt7YiaemvIzeATIgv/g7l8eiaLYsq
         KpVYzxosBaFDDWn00/Fg4C92L0ifAh4aLljbXvE4Cjgjnk0BZMo8lbk2snqC7QStCG1H
         WbAm+SgQJHMe3QxrFWfTZgqmiYgI/1tALB9jwrPxGL46AeK+cFMFNXpMd8rW04UPPuxk
         AoZnl/J0oVd1TCIOZZHNkkpFY0TM0NjuSXy1egCFAWj9oAUDpPKRm7GzsOcpxHtuAiFo
         hLEvK0CzuicX9DTQnLGMCxq8PI4IiZet5mndV0TOx72JwXBTxsUIfSPYC9RIDQwaHj2A
         2iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696348465; x=1696953265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qwggqM5g4H2kMBZ1deteV2yt6E9yc4Vqh+Tp6Hnvgo=;
        b=GZf7KkhdyhxxFnLLEY2IW+Eeocsx/IIOJUGGk9qOBXo9UdGIttnyuwEWj94dq8AvZA
         WVVCPr3LaIHyYj/2d+55iN1jtimdrfeBtvHw632lXqGkfBWaL+X5YCBXin5hzmhhwumy
         45dYkh3ouUPg++hYUfm/7+nM3jwgB0JUwSJXMg2D59guHEFbeo3b4EiAENRelJzlzUlA
         zYCXMhPOMxunpUtHtpM3FOyXd1wh+3zdhx9UkmC334lELp0W2AE7+EfHd/dPpc30MhXp
         4E3Hp2o5CsGdi++aAWqwqriDffh6FaBp61bT2lUDm5Sl6k2UtH/HYyFMQUyNv0UHH4gP
         tV2Q==
X-Gm-Message-State: AOJu0YzUP2RCmytGfHxOuEh8pW5+7h7hGj5qqJVhHMNRe/L4ax/4tCAD
	Re6TLQ6XZSmwGA4K2QI/e6tDrw==
X-Google-Smtp-Source: 
 AGHT+IH09d6DTdcKc37AqByhCIppHQNpciXplK+DYeKcZhmAvum3wYCeGF8amKbOLfAWBgKm2xynPQ==
X-Received: by 2002:a17:906:5349:b0:9b2:9a0e:9973 with SMTP id
 j9-20020a170906534900b009b29a0e9973mr13823175ejo.42.1696348465487;
        Tue, 03 Oct 2023 08:54:25 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id
 sa18-20020a170906edb200b0098733a40bb7sm1268948ejb.155.2023.10.03.08.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 08:54:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wsa-macro: fix uninitialized stack variables
 with name prefix
Date: Tue,  3 Oct 2023 17:54:22 +0200
Message-Id: <20231003155422.801160-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NFEHRW3NSAYBHGF6T32UGCRXR6KYKONM
X-Message-ID-Hash: NFEHRW3NSAYBHGF6T32UGCRXR6KYKONM
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NFEHRW3NSAYBHGF6T32UGCRXR6KYKONM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver compares widget name in wsa_macro_spk_boost_event() widget event
callback, however it does not handle component's name prefix.  This
leads to using uninitialized stack variables as registers and register
values.  Handle gracefully such case.

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This is a fix only for uninitialized values case.  The fix for including
name prefixes will be sent separate, because I think it is not a stable
material.  Happy to combine patches if needed.
---
 sound/soc/codecs/lpass-wsa-macro.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index ec6859ec0d38..ea6e3fa7e9e1 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1685,6 +1685,9 @@ static int wsa_macro_spk_boost_event(struct snd_soc_dapm_widget *w,
 		boost_path_cfg1 = CDC_WSA_RX1_RX_PATH_CFG1;
 		reg = CDC_WSA_RX1_RX_PATH_CTL;
 		reg_mix = CDC_WSA_RX1_RX_PATH_MIX_CTL;
+	} else {
+		dev_warn(component->dev, "Incorrect widget name in the driver\n");
+		return -EINVAL;
 	}
 
 	switch (event) {
-- 
2.34.1

