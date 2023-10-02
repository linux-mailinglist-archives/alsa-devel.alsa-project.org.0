Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C62007B9B82
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:49:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37745E89;
	Thu,  5 Oct 2023 09:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37745E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492191;
	bh=lx526Rcn15uO715tPiN6irOnrYwVf8b0ODwF1k/aBNA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B/E/PYyRNEKXNgAzqakSIg2cipg9h51ELDAs0gnhC44HfwXiK3LJbXoHVbPMVYA4o
	 MGV/9wwp2gHH4sPhIp8AkvWzUvVO3/OaWfp9m0cSx4NJRlh8VjLE5vyhNLYL8z7L0v
	 9UAcLaQliMMC1l1lp07ouJ6nM/2gBbNHNbRRXCK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D364F805C9; Thu,  5 Oct 2023 09:47:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FB3BF805C3;
	Thu,  5 Oct 2023 09:47:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BB27F80549; Mon,  2 Oct 2023 16:00:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 56D56F801EB
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 16:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56D56F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=fGTt31vw
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so21667777a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 02 Oct 2023 07:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1696255215; x=1696860015;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHDvd7zBG9q3cQ18ekHgB5reLeuG+/B7KcSObggrkM4=;
        b=fGTt31vwTuNzEFyMsN2MMZXewXpzTHv9C5oE/ihEoASqqpwjI3ftl35zsqfXEvBtmp
         tYXkrmy7s8AptAqkUX8nBr5BG9Pvz2Xns/7giyYSt1RLaGb2IwbwNPx9TISthh45l0tN
         BycedhELkAdb4afxQNn5OWcNg1ZYxKxQZMfl/c5djU5YORoLtYh+dNIs3Sjx4vo4za7B
         5LdUzr0KJsrJwGaZMeg4mbEJlS35/C/wy4n/IAiYliDSxhx6J3GxFHzA6e8lLKRLTZtq
         QDZ7frxH29xIWqbyutj5gWCiNWrKccPZhCtDn2QRTnn43WPHzePnnCIolSUD0m2auBpX
         lfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696255215; x=1696860015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHDvd7zBG9q3cQ18ekHgB5reLeuG+/B7KcSObggrkM4=;
        b=BcRQZIaF12pPV3ORg0uwu0wophzrJm0asKo+NQcqQLjDz9LOrKBLuhPLmdMVizCl0D
         ztAmGf3xPXm4dAshk9o7K9YidRRt8NkOBTXxtr6xIV+J4xEphVbmOb4/9bqdeIaeFtxU
         GkO4HiTAbcMXFLb3fKkp7Q6X8ukT1DvjMQ9zOxaLICjDOulHZzcHrUa1a1ShWen2h06u
         NoqibCNrY/0d9BQbNupAL2XFy8H1XU5oy5rtbn29BNCCRiqmUGVZkN9jiiJihWsYlAsD
         5n6wZq/G46hdYqYvf2VIJYS6S1+DfeeLB1/7JCTLdMWNqeT2CSjzehMy38v6sNraeaxj
         ZElA==
X-Gm-Message-State: AOJu0YxTY6zD1K6M6qL2kTTTJ9S27dS6y1WXe8mRVGqolrx5Uzv/9NUR
	QYtvpjiiPEfUHsb9Df9hOPZ6rA==
X-Google-Smtp-Source: 
 AGHT+IEqousXbP5TTb7EJHs1BpXBUU8/Elaw2Sux5vGT5VflP/hLFD6ub63JjLQUdQbLqXFQKsz1/Q==
X-Received: by 2002:a05:6402:160b:b0:531:3e89:1bef with SMTP id
 f11-20020a056402160b00b005313e891befmr10451516edv.32.1696255215247;
        Mon, 02 Oct 2023 07:00:15 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a056402518d00b005346925a474sm9350377edd.43.2023.10.02.07.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:00:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 02 Oct 2023 16:00:11 +0200
Subject: [PATCH v2 1/2] ASoC: dt-bindings: awinic,aw88395: Remove
 reset-gpios from AW88261
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231002-aw88261-reset-v2-1-837cb1e7b95c@fairphone.com>
References: <20231002-aw88261-reset-v2-0-837cb1e7b95c@fairphone.com>
In-Reply-To: <20231002-aw88261-reset-v2-0-837cb1e7b95c@fairphone.com>
To: Weidong Wang <wangweidong.a@awinic.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7V4CJM6D7AXKYA4VLD24EITDFZHHH7BG
X-Message-ID-Hash: 7V4CJM6D7AXKYA4VLD24EITDFZHHH7BG
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:46:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7V4CJM6D7AXKYA4VLD24EITDFZHHH7BG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The AW88261 chip doesn't have a reset GPIO, so disallow providing
reset-gpios.

At the same time also don't keep reset-gpios required for AW88395. This
is both because the Linux driver has it optional, and it also simplifies
the bindings by not introducing another conditional.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/sound/awinic,aw88395.yaml        | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
index b977d3de87cb..5d5ebc72b721 100644
--- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
+++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
@@ -14,9 +14,6 @@ description:
   digital Smart K audio amplifier with an integrated 10.25V
   smart boost convert.
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   compatible:
     enum:
@@ -49,9 +46,20 @@ required:
   - compatible
   - reg
   - '#sound-dai-cells'
-  - reset-gpios
   - awinic,audio-channel
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - awinic,aw88261
+    then:
+      properties:
+        reset-gpios: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.42.0

