Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1123F77CE28
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 16:34:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C50A9836;
	Tue, 15 Aug 2023 16:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C50A9836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692110045;
	bh=1NMdXUOC58+tcXZ9Q7r2MNWfwM6LYQNW8X+6AqBoqyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GNQ3tKD9Si/kj//L06o/IP87xOMn5//JLc8lgGnLeM5geYpSL4CTc0/FsSqn1Z8n+
	 jdKbUHQ5yiF0x21wUpbGwK0eEzqT9MabV+n6s6xrU+HzNCEkeCiKE0r42kNAFZnbV9
	 F4IXgoQapPFiq9oXAABh4cHa/EXynWmXFuCsu/0I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D967CF80549; Tue, 15 Aug 2023 16:32:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 250EFF80551;
	Tue, 15 Aug 2023 16:32:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1A3FF801EB; Tue, 15 Aug 2023 16:32:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03D15F80027
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 16:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03D15F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AjF7/iSx
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fe5c0e587eso55034235e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 15 Aug 2023 07:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692109933; x=1692714733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpZqgVo2zkbi2B7sOh6o48YWO5812KC5/SRbTNsfhC4=;
        b=AjF7/iSx//xv+IXbPrL7byl1tK/SI6NcdK7rZc73VtoiGg7V7Sah6expliUD2+bF87
         lzbiBreVfmGWFKUAAvYpVUu5NjpfNgvYtUKTZfW4u/g7Fqp1OWlCIO6GI3wNGlMfsShu
         QaCMlMbRWVfdrBzrcf837XmCmiNlNcoREEI0n1r+JXFcjIuTNOL/wPsp4n5ZyekJgREy
         hcf8GsOJcMcDkYSbZ7hjiuaWK/Kdflgiv65As/HmePDlqJjG36NaQcJrTaxIju2YZ1+H
         S73dQldaf8Um/soORXdpTCTPCxIEu2h3wMSJjpCoLYWdX4EuhzlrSCaMqv358l+yIyhr
         c8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692109933; x=1692714733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpZqgVo2zkbi2B7sOh6o48YWO5812KC5/SRbTNsfhC4=;
        b=VLQVBxgIbvybruE8Shl8Te/fkAsDV7IyIpdTZjRd72WVnG/7SPLByY2nNjWna1Epeq
         Pkk/Dz0MC1lrdJazNgjyxEVMw5Pu67VwJpn9U5f7jJTQVo81mRhL3xlh5TBc+2GJg5br
         hXjvuXaJ1dVN5+YsJJWmGnd/khv7K7172ZUs9y9qYJPLUAs3GYUcn61eUOALFYM3v6gD
         9nVWMCq4EAZX1G8HyKf0UUWOjg55qMjUhiuUYAFz2eQiocMG57Oz3nZT/wAyOSEspb5P
         ZS81XgKb7BhMIAbmJ17tiiHOeTRdkLNtyzm+bomIUy12+inRfkSCaM92wxI+ubxOO9ok
         bsUg==
X-Gm-Message-State: AOJu0Yz/Tq0yHk0exbkwyJuRjb8kpIdMFWpSLBMgOOOoBBminPZ+zqMB
	9kxQGqoRLweJPJ5AuKL/QcrHBA==
X-Google-Smtp-Source: 
 AGHT+IHtM12tZqB/uARbgqLwol3KwbEzc5BSEYMRqCDwwlrAIrZkQ/bVwv4A6dHrGW9OOEqZ0i1fRA==
X-Received: by 2002:a05:600c:5121:b0:3fe:1b4e:c484 with SMTP id
 o33-20020a05600c512100b003fe1b4ec484mr10756757wms.5.1692109932920;
        Tue, 15 Aug 2023 07:32:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id
 l11-20020a05600012cb00b003177f57e79esm5851481wrx.88.2023.08.15.07.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 07:32:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND 2/3] ASoC: codecs: wm8904: Fix
 Wvoid-pointer-to-enum-cast warning
Date: Tue, 15 Aug 2023 16:32:03 +0200
Message-Id: <20230815143204.379708-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815143204.379708-1-krzysztof.kozlowski@linaro.org>
References: <20230815143204.379708-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LYQ2HJKRVE4DEMGVNXMWGKX35CENHJXM
X-Message-ID-Hash: LYQ2HJKRVE4DEMGVNXMWGKX35CENHJXM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYQ2HJKRVE4DEMGVNXMWGKX35CENHJXM/>
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

