Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7DB7B3F2A
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:19:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 802E0DF3;
	Sat, 30 Sep 2023 10:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 802E0DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061958;
	bh=5267xrteeJIj4R0JInOg7X/x3Oyz68W6Tdklr66zM8A=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mOsXqoYCjCzKB+nt7jyg63Q+geJR8ejMxT3GgGuVNa6BXWVVLvlnrX7DwZOsPfuHx
	 acQXYmyCHBQI5p2sJS8cy1ONZVa0FdxKYfPRGir2pYgrACBlayXJXvBuNkLJhPP2Kr
	 UYXJ4cOG5Ot6X0CQOiqPvqNMD2fKrXmohC+jzsM8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BE4EF80696; Sat, 30 Sep 2023 10:13:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72802F805C7;
	Sat, 30 Sep 2023 10:13:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C300F801D5; Fri, 29 Sep 2023 17:06:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D649F800AE
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 17:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D649F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jKrzMxXx
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-405524e6769so5127455e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Sep 2023 08:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695999981; x=1696604781;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+HDInQo6A1OIfSQ4kDLBbQAIE/uOQhrvXDem09PR3k=;
        b=jKrzMxXxla7/LkXjr1iTa4RVWGaesUA1WuvszYZhXRjNrsE790fgRpsY2emmbV7ncP
         nypLlOYwVvTWvj5Ff9aeHVi6URgklDYbBgqtxUeg8Vzd5JQKFbjQCtLMMQQNlPsjEFnD
         BTCmoF4AHT8PAVpbgQwUaw9acA03vtzhpqHAi3qzNvRKZi6yVh7DVR8jPbg5qPorEEs/
         bM8AiiEPWXeUva5MuCIzBxuHIJSLo0ZSLv5UYj1z1aPTN9Wvu+n0mf0yvWfOReG1VbX0
         1lWacfJGkIngKiC0NtleLFnotLVeVmMGgUKvDkT4lQ8jHxN5YK4nWPYu5y5F2YbAClgK
         be/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695999981; x=1696604781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+HDInQo6A1OIfSQ4kDLBbQAIE/uOQhrvXDem09PR3k=;
        b=tInQnsxP/n1xO0HHINkjyAPRCi5XDUW/MuQlq7oIJvb5hYjLOYdJCUmOUWi83X6qQB
         JmEzGVlaykRPw3Kfk/v1cFD9q6loY3OskVU79o5prCS9kEvel34sIYkvb1FgkzOnM167
         LIgi6VK2lTaz871k8Pcupsa4k6Yw4BhfKbVJHoVMkkpjeNYL/xSLDtlzoM0C+3Y3yvY9
         k/M63JGEVzHmxMUNVkjcQvFsdsYsRXz0QaMwHav3nCd/EeIn+YhpG8q51XxLWI+jw0/H
         LLBkaxC1fERwLrgXDtuDMCDd8YerDx0dAnvJv2JadOqdqBVL7yNnndTCVHlUVtVR3ukZ
         7Pww==
X-Gm-Message-State: AOJu0YzVfiDm5GTCQR8rEf/gc/WXF/tAip8dC64nbtvcRlXrf2b6Cwec
	sEMkXgRlFyZJtNBICIZVtXk=
X-Google-Smtp-Source: 
 AGHT+IFajsTW5J93K/OzzdCwONkeonYv1BhbbEV7MBCbRDZMmPHOe8BVXYC6nzOe54XQkf98bAaeqA==
X-Received: by 2002:a7b:cd85:0:b0:402:ebe1:7960 with SMTP id
 y5-20020a7bcd85000000b00402ebe17960mr4202891wmj.2.1695999980586;
        Fri, 29 Sep 2023 08:06:20 -0700 (PDT)
Received: from localhost ([2a02:810d:1640:10d8:9259:8ee2:26ea:3669])
        by smtp.gmail.com with ESMTPSA id
 y19-20020a1c4b13000000b00405bbfd5d16sm1606110wma.7.2023.09.29.08.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 08:06:20 -0700 (PDT)
From: Joerg Schambacher <joerg.hifiberry@gmail.com>
To: 
Cc: a-krasser@ti.com,
	joerg@hifiberry.com,
	Joerg Schambacher <joerg.hifiberry@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: pcm512x: Adds bindings for TAS575x devices
Date: Fri, 29 Sep 2023 17:05:55 +0200
Message-Id: <20230929150555.405388-1-joerg.hifiberry@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: joerg.hifiberry@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VZJLKP57WK4OERCGNZ5KLW2ZBEQ3DI6Y
X-Message-ID-Hash: VZJLKP57WK4OERCGNZ5KLW2ZBEQ3DI6Y
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:12:52 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VZJLKP57WK4OERCGNZ5KLW2ZBEQ3DI6Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The TAS5754/6 power amplifiers use the same pcm512x driver with
only minor restictions described in the bindings document.

Signed-off-by: Joerg Schambacher <joerg.hifiberry@gmail.com>
---
 Documentation/devicetree/bindings/sound/pcm512x.txt | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/pcm512x.txt b/Documentation/devicetree/bindings/sound/pcm512x.txt
index 3aae3b41bd8e..77006a4aec4a 100644
--- a/Documentation/devicetree/bindings/sound/pcm512x.txt
+++ b/Documentation/devicetree/bindings/sound/pcm512x.txt
@@ -1,12 +1,12 @@
-PCM512x audio CODECs
+PCM512x and TAS575x audio CODECs/amplifiers
 
 These devices support both I2C and SPI (configured with pin strapping
-on the board).
+on the board). The TAS575x devices only support I2C.
 
 Required properties:
 
-  - compatible : One of "ti,pcm5121", "ti,pcm5122", "ti,pcm5141" or
-                 "ti,pcm5142"
+  - compatible : One of "ti,pcm5121", "ti,pcm5122", "ti,pcm5141",
+                 "ti,pcm5142", "ti,tas5754" or "ti,tas5756"
 
   - reg : the I2C address of the device for I2C, the chip select
           number for SPI.
@@ -25,6 +25,7 @@ Optional properties:
     through <6>.  The device will be configured for clock input on the
     given pll-in pin and PLL output on the given pll-out pin.  An
     external connection from the pll-out pin to the SCLK pin is assumed.
+    Caution: the TAS-desvices only support gpios 1,2 and 3
 
 Examples:
 
-- 
2.34.1

