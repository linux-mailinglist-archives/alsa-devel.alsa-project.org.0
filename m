Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C8C77763A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 12:49:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E25F0852;
	Thu, 10 Aug 2023 12:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E25F0852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691664550;
	bh=1NMdXUOC58+tcXZ9Q7r2MNWfwM6LYQNW8X+6AqBoqyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NMm7SRwvfEMGG7CrOzRbiH2PmEdglsS44Ynj060fzWhO6nk7EMNMD2/fwZ7JXK46C
	 FT7Fn0fGUaQNPPTdpgkpJ5hlMPlhBV0KMNkpTTLK+rX44mAWHp2eE9BkNACiuCz4r/
	 l+suZaxjJTtyxMgTSE2XlfLaAt+gOvZXseUHHQeE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7BABF8057D; Thu, 10 Aug 2023 12:48:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39AF0F8055C;
	Thu, 10 Aug 2023 12:48:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94FC0F801EB; Thu, 10 Aug 2023 12:48:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FFA4F800EE
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 12:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FFA4F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=L+pJzrZz
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so922872a12.1
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Aug 2023 03:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691664478; x=1692269278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpZqgVo2zkbi2B7sOh6o48YWO5812KC5/SRbTNsfhC4=;
        b=L+pJzrZz5LiodQRp/U/kbzpSYWnuq6UUxyeRItM6/VS+qn+D1PDLrcfAJlUCmks3Kz
         Licj4R5ZhYqFNIyGDXQpyL/zv+UQqLViDrfb5AQ5Lk0yh0s8tkC9JT5Wi4Rz2sWltvfD
         24dwksZBWyf0htE1vPBy9QBmrbo+qPRzH8EaHBcvW31pMM5faimC9YDi9d+PxB0L0IKN
         RvDGD0ECUskqfPBcVKcp9DdgIhUjd4a6DuzkmtbPY6Y/FFnK61k2qicYoEsqIRuuzPtV
         5rb0itHN4h2ptsZeSrFedln9PwV3C4sILAvNxBhujef01IdBWcivSBYg3FU8C6qUz/HA
         Y3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691664478; x=1692269278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpZqgVo2zkbi2B7sOh6o48YWO5812KC5/SRbTNsfhC4=;
        b=RfvzZHdyOpdDeavBrmsPl2F7D0yza9skMzg/yMmyhUzrxKbZEhgGxx3QTzUxLATo6+
         5WUkD8ZQ/4k2a5eLY72rTM63dYs8o/MSR+2GQmC5Yx+x2VEpfsLmdrzgqq1K+mIvEgi9
         Gbw5g4Nfz/0hmhbJ9d8tZ6EzgqJFvvbXVD6svdGN7gM1H7ostjeebopb04UWIcd54B6f
         wzsUdmw9HUFoL6CS2o94+uXdLwhpBjrCdMtdkSItwshr4JpwgKA/RaZbQIUV50qo1eJP
         KrMlt9iL1QCTihnEqsY4FNQdtxDceDSmbjCFaomYT6oCdoHGI4jOb5XU2Hd/Kh4dcUBE
         r2dA==
X-Gm-Message-State: AOJu0Yw7Aq4HkXzeh2qdllkbPGuPcOqR8LBDjm0fcgbMJ5fxcEWYWsoW
	s4xCaF80sfDhAOR3KsVG+BxcVg==
X-Google-Smtp-Source: 
 AGHT+IFi6mpqtjPUZgkNME8tljPZsCKLpCa4i79mEQYjX4KcyxYg/CD19QBrJpMdXKSWYT3AtUshSw==
X-Received: by 2002:a50:fc09:0:b0:522:2d1b:5a38 with SMTP id
 i9-20020a50fc09000000b005222d1b5a38mr1688860edr.10.1691664478219;
        Thu, 10 Aug 2023 03:47:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 x20-20020aa7cd94000000b0051dfa2e30b2sm653854edv.9.2023.08.10.03.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:47:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	llvm@lists.linux.dev
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] ASoC: codecs: wm8904: fix Wvoid-pointer-to-enum-cast
 warning
Date: Thu, 10 Aug 2023 12:47:46 +0200
Message-Id: <20230810104749.164827-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
References: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7AKZXFSQ2JCAFU5YPTI7DLDDWGIBQFZD
X-Message-ID-Hash: 7AKZXFSQ2JCAFU5YPTI7DLDDWGIBQFZD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7AKZXFSQ2JCAFU5YPTI7DLDDWGIBQFZD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

'devtype' is an enum, thus cast of pointer on 64-bit compile test with
W=1 causes:

  wm8904.c:2205:21: error: cast to smaller integer type 'enum wm8904_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wm8904.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 60319b468fb2..829bf055622a 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -2202,7 +2202,7 @@ static int wm8904_i2c_probe(struct i2c_client *i2c)
 		match = of_match_node(wm8904_of_match, i2c->dev.of_node);
 		if (match == NULL)
 			return -EINVAL;
-		wm8904->devtype = (enum wm8904_type)match->data;
+		wm8904->devtype = (uintptr_t)match->data;
 	} else {
 		const struct i2c_device_id *id =
 			i2c_match_id(wm8904_i2c_id, i2c);
-- 
2.34.1

