Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F99A9077FC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:14:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1CA9E8E;
	Thu, 13 Jun 2024 18:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1CA9E8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295264;
	bh=rY1E63AFRlnvfo6oM5WyAgqbtSr3Iiigk/dvnbD7cdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=flgwErHSkXeddJWBd6H1Gngyp5VKhJM5kmGih7ELX/I3NfVJaQelpu786sTsZlOSQ
	 14d+q6qcJx6JsIk9mR0k3Mk1dn/djIineD8lSrTylpoyKX7Z+8V6Qa/OZ+M+f0HCM0
	 rKGArmm/9jLpTQ0Xct98AXX25vlfOwCQORH+t8HA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9121CF8991D; Thu, 13 Jun 2024 18:05:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48114F80858;
	Thu, 13 Jun 2024 18:05:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B88EF8057A; Tue, 11 Jun 2024 11:48:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C09AF80578
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 11:48:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C09AF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=duP1CaRO
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57c68c3f8adso996070a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 11 Jun 2024 02:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718099325;
 x=1718704125; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3URf1bqoxt6RvPsq+unfHOhtdPyrUcD08+rrLeED5Co=;
        b=duP1CaROKI2ZoGo86aRwcR17FWsOyetgN7A8jcIlfkpYNroakzA55NPDHNjE4RsUYj
         rZFwVJLSQccWbSBcJmfdZ7uDoL5LLoyGRhlhfvGwJJCYf1uT5SsI6DbPpkC8NiSF7e4U
         EdKBhDmIBj8xu2fKlIwvCVdyhNX96MQ+gRbV8YGunMKJGUUVLHh89QYRpiaBix3BxddH
         Nu2SYwT2DF/QP2V2949c0cDgfnO+ZTsV0FPOiSJVCwjCuaa7W1zogh2649IZXNvQQ607
         aTHeH3+BDqjnl+jlkYmIgJCBxSTwuaEuX2UNn1a5LunyMCpimFdrmWQD2fI7ik9LMm+Y
         FtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718099325; x=1718704125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3URf1bqoxt6RvPsq+unfHOhtdPyrUcD08+rrLeED5Co=;
        b=UcvhUvR3Z9FoicbXKjS8lJoX2u+U1kfMPhRMaKVLrTv7JPCQHCTtcSeGHxs6oyfFVu
         F/4UIssK19uE0rEgp+JRpelmz4kvO1Wkygcu4w1I0Eh2G3hZU0XRLxqZQ1xW1zAOQi1m
         hNaWD38UHOmYl6aRwNUaeP+rZozyNCiIAr2rajBYyXe4fV20I7RGM68Dxz5o9aXOlvL0
         j7/pcoswHlHTm3RDLY9i/SD/HTa3ANLTI/NXq0lL+OZokArHPsLQPXs720YOuRBc2rzu
         ujjhzAZm+pX4Y7Nl6oOwecQye+PtuEajseaqmOMTyYiDaDNBFaq3m79vshY3BiWT+jzl
         z3NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyvGI6Ii5bCG8Lors7laOCY9TAEcQZkbvU6jHE94pw8qJmv0ypITLju9pbcYd0+x7bkzjNYXS5+Xf7ByiKue5vA5Rd8haSlxarZBA=
X-Gm-Message-State: AOJu0Yzex0hk5yMqqvp1n1wPnt1UUrTdanBz9q5OWQ8GVn143NgXaUK4
	4gaclNXuiQw0McJcqVN+emWxenJy3RHlYH7K4bAb3y5RYpqCBumiafWY1lJ2ZXY=
X-Google-Smtp-Source: 
 AGHT+IF14ZNnXOfobI/WB8lXVND+Ohqa5JoXFDW/TfmN1pVZr0QdPr6CGSC0zuZrHL1qY/x7lEYXOA==
X-Received: by 2002:a50:d712:0:b0:579:e6ff:c61f with SMTP id
 4fb4d7f45d1cf-57c508fd7f6mr11085689a12.25.1718099325105;
        Tue, 11 Jun 2024 02:48:45 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57aae2340f6sm9059647a12.90.2024.06.11.02.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:48:44 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: 
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Russell King <linux@armlinux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [Patch v2 2/2] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
Date: Tue, 11 Jun 2024 11:47:52 +0200
Message-Id: <20240611094810.27475-2-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
References: <[PATCH] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs>
 <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5LO4WVR4PKRXIXQWP4WNOCX6D624QQLI
X-Message-ID-Hash: 5LO4WVR4PKRXIXQWP4WNOCX6D624QQLI
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:05:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5LO4WVR4PKRXIXQWP4WNOCX6D624QQLI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add nxp,lpc3220-i2s DT binding documentation.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v2:
- Added maintainers field
- Dropped clock-names
- Dropped unused unneded interrupts field

 .../bindings/sound/nxp,lpc3220-i2s.yaml       | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
new file mode 100644
index 000000000000..66e48d8a5a1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nxp,lpc3220-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32XX I2S Controller
+
+description:
+  The I2S controller in LPC32XX SoCs to interface codecs and other audo devices.
+
+maintainers:
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+properties:
+  compatible:
+    enum:
+      - nxp,lpc3220-i2s
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input clock of the peripheral.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+
+    i2s0: i2s@20094000 {
+      compatible = "nxp,lpc3220-i2s";
+      reg = <0x20094000 0x1000>;
+      clocks = <&clk LPC32XX_CLK_I2S0>;
+      clock-names = "i2s_clk";
+      status = "disabled";
+    };
+
+...
-- 
2.25.1

