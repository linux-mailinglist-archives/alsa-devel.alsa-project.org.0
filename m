Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 740FE861AA8
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 18:53:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED7CF82A;
	Fri, 23 Feb 2024 18:53:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED7CF82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708710794;
	bh=9ZZxPk/a7pO8ytzdAHohcBFzs6TPeMkP0Go5hItHYIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h9Hdn2mqqJR5WDEtil7/GXirvx8VzHOD3lPB2k8DDfSU0v9qUfHsTm7qzvwpncg4B
	 iCmho5NPKMdNYZiayCqmfqd4z0ElVHBpV8KSjuOOAwyyA3bgc2P5VubuQckbojGxgM
	 Si0Vg9pPYPWTm8GtMLiU12PjCbDob9KrJ0tBHMFQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D5F0F80633; Fri, 23 Feb 2024 18:51:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFEABF8061C;
	Fri, 23 Feb 2024 18:51:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F604F805B0; Fri, 23 Feb 2024 18:51:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02013F804CC
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 18:51:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02013F804CC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=taDJnTid
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41241f64c6bso8675225e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 23 Feb 2024 09:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708710684;
 x=1709315484; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeCmmTR4nL1DWlLTvSXW5V8GjozKprjftrRX3BjbH5I=;
        b=taDJnTidGsOPCqnBIOGVvxlugw7oqoDJwrmGgiXfoxSge57GGPtNA+91BfYe2hDpFz
         pqhp0pz6qOA2EAUmB00r0fIylPiyIYXahML2igLA9+85f0fkmdj0cPNejDnIPWS6tTs1
         pKdGq5GWHLjiJbpiF1+bz8SyzTqjt9M8ojRipZlXOys3+SeTJz/TM96RcmEUnxIjujCp
         jBh4ry9IEPiIIdqrWKxAOgotVe9Uditi8Yxgc8ku18xy52E5gdt+cOvUbQcOaLRI1OBJ
         smDyV66xEZAG6t7PJRsg/WYAyE2jXFE12LLbCAoPVU/FBL8XoCJmP9Bv5Fsvi9CU7XH4
         shbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710684; x=1709315484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VeCmmTR4nL1DWlLTvSXW5V8GjozKprjftrRX3BjbH5I=;
        b=L98GaNtyZMkb5hjdozw0dkFy4Eqd1xeczH/5+J9G1qkfLqD+L8LOeWU/B5r6pdPs9y
         eYFvPWtYG10ToZcCdMkGhWJSxH97XE7q3j9NNAievYJjiFJn+mHjrSvsv/u5UvJI8N5Z
         kNRpHVe5dPmYeKv9GKwR9zD0mTse2hRhwi/SwiD0sKOO338X6O30vAI0+hyIBWdlrB/G
         oOHaB3sbvSp+brIWn6Lkihs2L9xSjVoWPAANTy95oYFKUDFxAs9Q4tXWRuKK03vjI2RG
         bKayz4p636h8wtCIcQcGp2uSYx7ysilRWMw4VP+rTl7kAScuo56T5IgmrkBzzAW/4acL
         MZGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4x8h13BbUwh0cZWS7BKblL5iFgeP07gKzIpJ9K4APLA796P77dVWEtIPyhSieoNFvwfqCZQNxYolFHZlBtKfKrblDHBCneKh+EzE=
X-Gm-Message-State: AOJu0YyOhLRF6xz+0xUyoDy4obpa8AlJQNJpCCKVFnD4IpRFq/eb5HrN
	auWyXjhCbfdES8FmRorpgL2pk1SadJfGkzV2Wb4DyAGl32W7iNY4QQgSkcdhmhM=
X-Google-Smtp-Source: 
 AGHT+IFFxDXAmiB4835JX0wNsSNqu2+o3xJ9l2em0tk9z8iXrduKI7NKlIlcZPE8y6hU/3jd20iOCA==
X-Received: by 2002:a05:600c:4f53:b0:412:96f2:2df9 with SMTP id
 m19-20020a05600c4f5300b0041296f22df9mr323815wmq.26.1708710684136;
        Fri, 23 Feb 2024 09:51:24 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e8a0:25a6:d4ec:a7ff])
        by smtp.googlemail.com with ESMTPSA id
 bo10-20020a056000068a00b0033cddadde6esm3711524wrb.80.2024.02.23.09.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:51:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 3/6] ASoC: meson: axg-tdm-interface: update error format error
 traces
Date: Fri, 23 Feb 2024 18:51:09 +0100
Message-ID: <20240223175116.2005407-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223175116.2005407-1-jbrunet@baylibre.com>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7BGAYJUXMDEPEQPANMJLM4ITAOKWQYJU
X-Message-ID-Hash: 7BGAYJUXMDEPEQPANMJLM4ITAOKWQYJU
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7BGAYJUXMDEPEQPANMJLM4ITAOKWQYJU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC stopped using CBS_CFS and CBM_CFM a few years ago but the traces in
the amlogic tdm interface driver did not follow.

Update this to match the new format names

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 2cedbce73837..bf708717635b 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -133,7 +133,7 @@ static int axg_tdm_iface_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	case SND_SOC_DAIFMT_BP_FC:
 	case SND_SOC_DAIFMT_BC_FP:
-		dev_err(dai->dev, "only CBS_CFS and CBM_CFM are supported\n");
+		dev_err(dai->dev, "only BP_FP and BC_FC are supported\n");
 		fallthrough;
 	default:
 		return -EINVAL;
-- 
2.43.0

