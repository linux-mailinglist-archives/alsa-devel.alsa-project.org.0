Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 285151416C5
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jan 2020 10:25:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73D3C17BF;
	Sat, 18 Jan 2020 10:24:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73D3C17BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579339517;
	bh=RyMtshAdB8YP4H5b8o64uX7yoy4QFOTfBJCbRZ+OrI8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vPgtDme3Xm6xZQ9RjwmmHqITMD6P7ECu2NZ5HjifCLei0QNHa6DJ8myxM3Uuknc85
	 tg/hFfeWHiF72jzLY31ikn+OIEZ/qcnoCLfdlh622mOfmpDAp3gMlWQ9uKBXd+7wuN
	 fraOZ5yVyKC0zGnNs3eNzN9gkioWDNGaS3qqVg9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6C34F801F2;
	Sat, 18 Jan 2020 10:23:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 829AEF8016F; Sat, 18 Jan 2020 10:23:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5168F800AA
 for <alsa-devel@alsa-project.org>; Sat, 18 Jan 2020 10:23:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5168F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.b="SMUce4J8"
Received: by mail-ed1-x52f.google.com with SMTP id v28so24593963edw.12
 for <alsa-devel@alsa-project.org>; Sat, 18 Jan 2020 01:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tEv3CQeWt5hgTO0fdyyZhcvyQnL+294XMDPWLhPD0R4=;
 b=SMUce4J8PyOnFUcMTF2ulvGT7HqcEyboIZ3KRX7jYrCBEgNZz+iFoIlg4VsZa6SyMc
 086ujzTghpMkQffnqvRdTAFDcGjL7QJQobuR1yAQqvgiBrnxbdfCjT/ImBMSz6Jy1yUj
 ziYtTh3HDbM2B0CIiIFQdk7BitRo/ldAfzU5WO0ANJRbU4qHSNfl81Sp//EBvjhyQdWe
 JKOyR7AWS/h5ON/7JIwjPVsZkRN3gWjhxKFvzD9eX5mNTIQ/bGwljs6Mc6UCN3MVHEua
 6gLQxK425u4sX1X1OLOH5L28vGlWgYt9fQh1YAoerrWGXHnYertUyBepmLVynHWmo21I
 Fsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tEv3CQeWt5hgTO0fdyyZhcvyQnL+294XMDPWLhPD0R4=;
 b=jKFgdJHsjWzl4ePXJ3sn9NM5XoC1C3bwREAH2gY0ed8vlDP2eK6uOwfGikfUzbd06/
 4ESr7/pV2sbZ5+Gz82qsvW4c91pG4aV2hHZ/DJhz6MNLNHKY4StMhQj4Aj7hK9g+buJI
 YNFtenyNVoJrNX6dV4QJwRBCmPrayR7baLqDDbqjZdYf7ja3DdRPDLqULRU937NX/+no
 IV1VuHos4KLqnEGYhTDMFG4slelv+elOJPEAv36p5CTRRMUfq1BsGczzl0o2dKBzm8TI
 GZoqUQB+bCBFYg2oRwp+ObzyALwuW56OIkH1Obx+zI5l1vExoBO0bvzU5jYAdgeqs2D0
 99Cg==
X-Gm-Message-State: APjAAAW9NcPzaX8K0Ix+dO6S6UW4VcG+aQfJMBvZSN7/0GMzxYJibJNn
 7hTbYp27/qWmwols2ZWYRQTokuFeYJY=
X-Google-Smtp-Source: APXvYqx9Kth68jmU6ZU3PMNsEVaG87MpswBkVRsp/aKO6HUfEFpig+CaMPfYXrx4zig/ZT9lckSpTw==
X-Received: by 2002:a17:906:5586:: with SMTP id
 y6mr11686039ejp.336.1579339405582; 
 Sat, 18 Jan 2020 01:23:25 -0800 (PST)
Received: from Abby.home (10.20-136-217.adsl-dyn.isp.belgacom.be.
 [217.136.20.10])
 by smtp.googlemail.com with ESMTPSA id s19sm1057402edr.55.2020.01.18.01.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2020 01:23:25 -0800 (PST)
From: Charles-Antoine Couret <charles-antoine.couret@essensium.com>
To: alsa-devel@alsa-project.org
Date: Sat, 18 Jan 2020 10:23:15 +0100
Message-Id: <20200118092315.10384-2-charles-antoine.couret@essensium.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200118092315.10384-1-charles-antoine.couret@essensium.com>
References: <20200118092315.10384-1-charles-antoine.couret@essensium.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Charles-Antoine Couret <charles-antoine.couret@essensium.com>
Subject: [alsa-devel] [PATCH 2/2] ASoC: tas5756m: Add DT binding document
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Document the bindings for the tas5756m driver.
---
 .../devicetree/bindings/sound/tas5756m.txt    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas5756m.txt

diff --git a/Documentation/devicetree/bindings/sound/tas5756m.txt b/Documentation/devicetree/bindings/sound/tas5756m.txt
new file mode 100644
index 000000000000..293eaf20d008
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas5756m.txt
@@ -0,0 +1,25 @@
+TAS5756M audio CODEC
+
+Required properties:
+
+  - compatible: should be one of the following:
+    - "ti,tas5756m"
+    - "ti,tas5754m"
+  - reg: the I2C address of the device for I2C.
+
+Optional properties:
+
+  - mute-gpio : GPIO wired to the mute pin.
+  - hybridflow : an integer between 1 and 9 to select the HybridFlow program.
+      if not supplied default DSP program is used.
+
+Example:
+
+	tas5756m: tas5756m@4c {
+		compatible = "ti,tas5756m";
+		reg = <0x4c>;
+		#sound-dai-cells = <0>;
+
+		hybridflow = <6>;
+		mute-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
+	};
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
