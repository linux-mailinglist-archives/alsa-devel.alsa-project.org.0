Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E99913427
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jun 2024 15:13:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8554CE68;
	Sat, 22 Jun 2024 15:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8554CE68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719062024;
	bh=gBxXwvVagI4ftepWbB3zihlaWc8oZrTP1cEGekvDHwE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EfB3Vh7oIM/dpJ7mt9YYq/M+w1Aq0UdryZdNquTFUAh3YAQIBTpLWzSX6aZEXCcFm
	 xPHUJCmXVWaLsEOJkVfitwyfkO+Ej4/4I1Bsp0k2FvZLtDl33CmmCrLcBLuM9iKgJ+
	 LeuoPdkcaooNqRnV0S8B6wUyAfCFEcNRORkcVeqs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34216F805E7; Sat, 22 Jun 2024 15:13:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16333F805BD;
	Sat, 22 Jun 2024 15:13:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47C94F8023A; Sat, 22 Jun 2024 15:12:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65A77F80154
	for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2024 15:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65A77F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NbDdyyvE
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57d280e2d5dso2535574a12.1
        for <alsa-devel@alsa-project.org>;
 Sat, 22 Jun 2024 06:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719061973; x=1719666773;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OS2tNNDMF7Cd9yV7FuF7w+ag2Zr2Tkm/X81pLFNB/r0=;
        b=NbDdyyvERPliMo3rgVUucGaC2b/MnHJ93e6wAJj7PPDMCwi+AFmkq1G8Rwq4nC7aDa
         kEzlIIZylT9KRJq4TSUMGgxDiGmsEVht+l85CNUREGoy22pXz+3h/xKbFIlnYUirmgWs
         ujkZ1OhGU/jncxcHqa+AEmo/U4gb1svg2CGHsJK6rrFf+0QIiK/R92v7pJcNOwrgdQF9
         rQ0UhIpTYJGPa4DuvVMWHzh6iakOnxNV99TBY1/cuyCeE2PLtdfGBQTj3DNzLZ1obMCf
         vCCu1TyyNkEmRWSLMBqxY2UvIwb4SIAQWzFFVRE+vvlCeAiIQ+yX1wu+WnkMfeXztoG8
         wU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719061973; x=1719666773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OS2tNNDMF7Cd9yV7FuF7w+ag2Zr2Tkm/X81pLFNB/r0=;
        b=uVYtP1VTueC2VtTmiKW7HI5z2P6GTXYdOxyy44DoQ8f7VKwyDuOT4ACJFYPmpb+n1w
         Gk5HK836twmINvHpkUIevtFG5cu9XT8oZS746wIoWU4aFsuC8RxyL6bNoWH0I+3Va+I4
         UUs9IfcNOHD0wMID8BmWlUlsKtPwzqSrIuz6MUGo3Jg9764VUwcGJ4SUhh5YRku9/DYw
         ddOeDImjBx44VrjTIu50uGDr9WyFnYu8o7NJ31Mmx9lUiBNQ9w+RDX+/PRneNp4ewf6G
         YOi4M7/A4LdDZC4zbzEDXjkjOJKHen2dl8csFYDDpB3AlNiSKjjis0yg5U6E1EuCmstC
         Ydog==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4SGpBJcF0f5t4xexBTDzCNfxUxggw9NMXaZkw7wssYSTwj5bC/GzMt6dcHK7bU5PmInBU4kYZbKJdjs4LNHueI7I5CiRfjPFIFnw=
X-Gm-Message-State: AOJu0YyzPoIS+f72lH+lfL9PWg1s1CyOvOA880lJNaMN4uaU6QhAHhVn
	MIgQ6DY1hc00cNNoFjC7QcqkPqfFyq1viQYafkTM0b2g9dEznkBd
X-Google-Smtp-Source: 
 AGHT+IFyJGKQbxJh6fK4UgCksg7qrcHYvLLempm3p7GWi7cFtmy4WwyuDhhOjkLx49PwlRpT/DlTYQ==
X-Received: by 2002:a17:907:a4c5:b0:a6f:b5ff:a6fd with SMTP id
 a640c23a62f3a-a6fb5ffab3cmr720166366b.12.1719061973272;
        Sat, 22 Jun 2024 06:12:53 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf42a724sm197708166b.16.2024.06.22.06.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 06:12:53 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] dt-bindings: sound: add ti,pcm5242 to pcm512x
Date: Sat, 22 Jun 2024 13:12:44 +0000
Message-Id: <20240622131245.2607533-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240622131245.2607533-1-christianshewitt@gmail.com>
References: <20240622131245.2607533-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ESH3XTSIC5S7SLPUQJWHPBNSJMWNSY3F
X-Message-ID-Hash: ESH3XTSIC5S7SLPUQJWHPBNSJMWNSY3F
X-MailFrom: christianshewitt@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ESH3XTSIC5S7SLPUQJWHPBNSJMWNSY3F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add ti,pcm5242 to the pcm512x driver file

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Changes since v1:
- s/pcm5424/pcm5242 in patch title and description

 Documentation/devicetree/bindings/sound/pcm512x.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/pcm512x.txt b/Documentation/devicetree/bindings/sound/pcm512x.txt
index 77006a4aec4a..47878a6df608 100644
--- a/Documentation/devicetree/bindings/sound/pcm512x.txt
+++ b/Documentation/devicetree/bindings/sound/pcm512x.txt
@@ -6,7 +6,7 @@ on the board). The TAS575x devices only support I2C.
 Required properties:
 
   - compatible : One of "ti,pcm5121", "ti,pcm5122", "ti,pcm5141",
-                 "ti,pcm5142", "ti,tas5754" or "ti,tas5756"
+                 "ti,pcm5142", "ti,pcm5242", "ti,tas5754" or "ti,tas5756"
 
   - reg : the I2C address of the device for I2C, the chip select
           number for SPI.
-- 
2.34.1

