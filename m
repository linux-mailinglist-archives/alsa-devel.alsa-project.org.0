Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B3E70263A
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 09:41:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6757B1E3;
	Mon, 15 May 2023 09:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6757B1E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684136498;
	bh=AvDWxpTNJ8X3TdSJOPXdzq30a8FfOGXe9rfQOXEKOz4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NIQNBlJbe7hJCCCVDC/qTVUuqoHNTa/3d/VEYUBjdx9bdOm9JCYjz1JP22tWo2Zcj
	 WTVkm7zjmuYbQ6ia+Bu/MYgQ5eo3XW7tmUod6ZS3p837Yd+7T9hIkVeT4rXNdpUHLL
	 OljEF75Ed6T3YqwsCBV81s2O+Pp/huJLhdgvfNcg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBF20F80548; Mon, 15 May 2023 09:40:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C994F8025A;
	Mon, 15 May 2023 09:40:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C78FF80431; Mon, 15 May 2023 09:40:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DA54F8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 09:40:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DA54F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Uk5lEy8j
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f42ba32e24so44477405e9.3
        for <alsa-devel@alsa-project.org>;
 Mon, 15 May 2023 00:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684136426; x=1686728426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9M/xlGjj8uezUUI5VU+MiWkSI0a+AM38qzNIvvv+aI=;
        b=Uk5lEy8jAy6CqyhPyvb7mqv6z8FznUUWvUp7CocpKcoWwZsily3Ef6JdAwnEj+QW6s
         rSV1lWYh6uFC5tNgrqMMhWl4vepk+Fbeda776wsRgbbouw/mAKyjLrWYzHXct8c9INVk
         GH30GV4fI8h+SHkml5mPDjuuEsdsNxIiv1ifZsyLHlQOWjtMHV+dkiE0G7g+zFE0Cm8h
         Ce2zkvC+F1MR8RxR30JhW8ThGz6mzxsfHBwmCUbejORLxwGyGxQ0IK1y9PBY1zA4re8x
         HgAu1aaVkKVH8b5GTj3MpdTl6UgetHxwjTw84/a85FDGoGr8dQeLX1J0i2hGfapQx8kO
         8VOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684136426; x=1686728426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9M/xlGjj8uezUUI5VU+MiWkSI0a+AM38qzNIvvv+aI=;
        b=kcBHZBwbjoTvZ24XpOwBHjDLq8F5q038yAw69wYmLmoCCmdCAKEDKG+9kKebbnATuc
         UkN7+FWinMjQcEbq4ULQ0Q7EwyvgimZJ7ZZEsApVu7wZUAvaZfsmvBY45wXvTRc6IVT4
         I7lE+BR6+HWpUPwuZ7IHTp5fitY++TYEB1RjhPks+csGMUtm5AWIQEUxcZNVF+H3tTfw
         BDhtvAGoX57IFti3qM+4SzrDwL2E8xW5xxP34IHy0+4YClGH0iNvsn+yyeVzkH84Nopn
         94FNVvU/35KO4sRhmgqbbf6XdtKmEBdNeHxJSSTi+l9zBysW9MIA8SYPwkIpQWeaH22h
         ez0Q==
X-Gm-Message-State: AC+VfDwi2G043A+WYMKf6BugAUccfBM7hdEuSY1mdAyd32lIxmIfwydP
	6krJcGF0Mau9KNZBFfEWXHY=
X-Google-Smtp-Source: 
 ACHHUZ4ncHlBCVI7q+Rc6+IFosohfQINR4EVgYffbNmugjX/8tQE1/uxTttYptQO/BuZfuWzXJ5gBw==
X-Received: by 2002:a05:6000:100a:b0:304:77a0:4ccb with SMTP id
 a10-20020a056000100a00b0030477a04ccbmr21980975wrx.2.1684136426023;
        Mon, 15 May 2023 00:40:26 -0700 (PDT)
Received: from localhost ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id
 z8-20020adfec88000000b003062675d4c9sm31476370wrn.39.2023.05.15.00.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 00:40:25 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: vendor-prefixes: Add ESS Technology
 vendor prefix
Date: Mon, 15 May 2023 08:40:20 +0100
Message-Id: <20230515074021.31257-2-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20230515074021.31257-1-aidanmacdonald.0x0@gmail.com>
References: <20230515074021.31257-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O7IOVFLNXAZ74CQSDZX6NGOBYHFZEZRZ
X-Message-ID-Hash: O7IOVFLNXAZ74CQSDZX6NGOBYHFZEZRZ
X-MailFrom: aidanmacdonald.0x0@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7IOVFLNXAZ74CQSDZX6NGOBYHFZEZRZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add prefix "ess" for ESS Technology <https://www.esstech.com>.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---

Notes:
    v1->v2
    
    Add Krzysztof's Acked-By

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 82d39ab0231b..95c42e32e02e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -438,6 +438,8 @@ patternProperties:
     description: Seiko Epson Corp.
   "^esp,.*":
     description: Espressif Systems Co. Ltd.
+  "^ess,.*":
+    description: ESS Technology, Inc.
   "^est,.*":
     description: ESTeem Wireless Modems
   "^ettus,.*":
-- 
2.39.2

