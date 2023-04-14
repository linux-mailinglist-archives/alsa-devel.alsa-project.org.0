Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C666E3000
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Apr 2023 11:13:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1328FAEA;
	Sat, 15 Apr 2023 11:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1328FAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681549990;
	bh=jDp+4kx/mgr+MUj12kztMcarzZvN6nKgqfQPrS9nCgo=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=gWKVrqedmIGknEYy3B+6c8uIKe6NHuC/LrJc+cWoDHI1R6/nTDUft/zrBYt4KG4Oz
	 VhYfpnusmv+ko4wXCoAAm0ihFuHF149ylNvI5RqsJ3uP0P0zwXmbMSDaPiwTV6NrK8
	 6Mo36CffP0hyP/H3GodFMEi7BhfjJWQLtTYPx09I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A845F8057B;
	Sat, 15 Apr 2023 11:09:37 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 8/9] dt-bindings: ASoC: Add mute-gpio to ssm2602
Date: Fri, 14 Apr 2023 16:02:02 +0200
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:09:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFGRN3NLNKW4257JAZNNAKSL66BUQ7TC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168154977673.26.4507407360180995918@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C21F1F8025E; Fri, 14 Apr 2023 16:03:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 656B8F8032B
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 16:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 656B8F8032B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=SB1cVRyW
Received: by mail-lj1-x232.google.com with SMTP id l7so4745165ljq.11
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 07:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1681480973; x=1684072973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76axTl8cbJUBy7OLAwyWyTtD7GTYfsTJiThiXMDIx3s=;
        b=SB1cVRyWZbrKZUFHSptgTkU1gCg6LU7UXA+761173EAj6Vq0hW3AwJe9c1WFRia95a
         y0/8K8hQMEDHSv7dvOdub+XGJE4Og/J8gc3u+1c4ZCYsBgtuq6vbexJ53O3gINqltJev
         CA5R5tLb85MQ+wtym2dYzB10QlkOI++8ifVF6o5z0LOG70v8JVdgoLFO+SVSGLZkONoi
         GMFrh22TWgY0MJFeT5YRpgnePigt/z8Lxd+XVKVpwXSHUDDJICe9h2ZWnh5aqTiLRB26
         LzfR+GRmY+4c9Vh3opEtGsC5KlBNPtKojYkByTTCIgb+mc3gn/NtI9g5zL/s0D8yZ8hy
         E+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681480973; x=1684072973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76axTl8cbJUBy7OLAwyWyTtD7GTYfsTJiThiXMDIx3s=;
        b=iKCHiDoog0lCct1Tf8f3Q2ETCoMaQrMdeJzpTqrarfOhf+aWg7nH/fs0mkcaml1GiA
         V6ehUlyBGU/jdfX0ko9btGvREA2+BNgeapmI9WKVwkpzsEa/LTnnJFJKUGVKjIriDSkh
         LlRqe+OdUkq0vopWBDkn5WfmeZfIneJnSVH8RGZxPeLwhTCgtbbPtYf6CIybaYxr86Tv
         GlZ8M6ow53xIlWekfEDvni7QTk9WVzvY8uO0oAh+2l0fod5MkQpM3HGfKECxPi+WMD/d
         9kVfKOj77YW4xmMr/gKgL5hKATGtvxMthSk2Y60xp4JoC1FRhvCkHZCSJJD94vwsd2T7
         d38A==
X-Gm-Message-State: AAQBX9fYRiT+/LuMuJOhSnra/+Gl99tj7UOC4P2gBL8mFZfRk+T9LGbW
	WhWETBIln9OLe8mT5azaPMKZhgZYJYG8jqJcXkonNg==
X-Google-Smtp-Source: 
 AKy350ZzWs16uKXN2YB3yLTeEJy4YSzcbJzgsMuyu+FmMB5GC0CIO/mMbAp72GN1rsJ9oQhuSxCppg==
X-Received: by 2002:a2e:9b49:0:b0:2a8:ae90:83d6 with SMTP id
 o9-20020a2e9b49000000b002a8ae9083d6mr584641ljj.48.1681480972484;
        Fri, 14 Apr 2023 07:02:52 -0700 (PDT)
Received: from panikiel.roam.corp.google.com
 (staticline-31-182-201-26.toya.net.pl. [31.182.201.26])
        by smtp.gmail.com with ESMTPSA id
 15-20020a2eb2cf000000b002a76e2dedbcsm828684ljz.139.2023.04.14.07.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:02:52 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 8/9] dt-bindings: ASoC: Add mute-gpio to ssm2602
Date: Fri, 14 Apr 2023 16:02:02 +0200
Message-ID: <20230414140203.707729-9-pan@semihalf.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230414140203.707729-1-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HFGRN3NLNKW4257JAZNNAKSL66BUQ7TC
X-Message-ID-Hash: HFGRN3NLNKW4257JAZNNAKSL66BUQ7TC
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:09:07 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFGRN3NLNKW4257JAZNNAKSL66BUQ7TC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add mute-gpio to ssm2602

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 Documentation/devicetree/bindings/sound/adi,ssm2602.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/adi,ssm2602.txt b/Documentation/devicetree/bindings/sound/adi,ssm2602.txt
index 3b3302fe399b..132aa9668e7e 100644
--- a/Documentation/devicetree/bindings/sound/adi,ssm2602.txt
+++ b/Documentation/devicetree/bindings/sound/adi,ssm2602.txt
@@ -11,6 +11,10 @@ Required properties:
   - reg : the I2C address of the device for I2C, the chip select
           number for SPI.
 
+Optional properties:
+
+- mute-gpios: GPIO specifier for the mute pin
+
  Example:
 
 	ssm2602: ssm2602@1a {
-- 
2.40.0.634.g4ca3ef3211-goog

