Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D89479B55
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Dec 2021 15:26:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B577B1A40;
	Sat, 18 Dec 2021 15:26:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B577B1A40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639837618;
	bh=zLVJztFkl9v9+6ypBA82TQjgRSN75qFlqLNaVgVMJis=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ATM0xrvvYzmNHHUTbGnO2D5Zmlzmood/LteU9UaKn3cG6cf6gAy6aCF+ptoj8mNAN
	 R/kx3PpJMqFM9hRj91rDPRS6Sk6gxpjCKy+rBL5opNNWuhZ6sW9zjda9ZaCiDpN4ab
	 /lmsohLuUHWWfSBwnW05V0wZ3V9L2dJHDA3jZ7Nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D6F4F80311;
	Sat, 18 Dec 2021 15:25:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB1CDF8013A; Sat, 18 Dec 2021 15:25:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4A3BF800E9
 for <alsa-devel@alsa-project.org>; Sat, 18 Dec 2021 15:25:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4A3BF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="f/PSuR+g"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4JGSmf3njJzQjmd;
 Sat, 18 Dec 2021 15:25:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1639837504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a82+gK2rB6t07imGZfJORXTa3UcfNJMk0KbEGpLUQcA=;
 b=f/PSuR+gs/kW41cdMk5VUKE8nTFGAebH0DRZ9Cy72Xk42fzOjCRF5sHtc/7E8oaGPKhp/h
 cWM1L8KOMXsxyruqRBudhWEYK01dOIGX+5/45SKvb8n1J2EoxnpjUJwrQ59iCTzYKfmUt9
 aksOSjKJ26BBbzXI7wm+6FIZTc2dajt0eFbipCxoXi0PPz7x8LJF6J1c5571eZGNcBRP4J
 yqU4YZtzpY/YKPuZOL5woUfmqf964kPN1N1BxwvyS3uy8IlJITZ5Kjks5N9xp7WDGRi0qA
 SOM7wK15a2ejCNbdljtmPa4uOTwQYC1LUCQWT5qDmIwGo3SmHOTHvK5sT0zf0w==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/3] ASoC: meson: t9015: add missing sound-name-prefix property
Date: Sat, 18 Dec 2021 15:24:50 +0100
Message-Id: <20211218142451.15010-2-alexander.stein@mailbox.org>
In-Reply-To: <20211218142451.15010-1-alexander.stein@mailbox.org>
References: <20211218142451.15010-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is used in meson-gxl and meson-g12-common .dtsi. Add the property to
the binding.
This fixes the dtschema warning:
audio-controller@32000: 'sound-name-prefix' does not match any of the
regexes: 'pinctrl-[0-9]+'

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
All users have set this to "ACODEC", but I am not sure if this value is
mandatory, so I opted to not set a pattern for this property.

 Documentation/devicetree/bindings/sound/amlogic,t9015.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
index db7b04da0b39..580a3d040abc 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
@@ -9,6 +9,9 @@ title: Amlogic T9015 Internal Audio DAC
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
+allOf:
+  - $ref: name-prefix.yaml#
+
 properties:
   $nodename:
     pattern: "^audio-controller@.*"
@@ -38,6 +41,8 @@ properties:
     description:
       Analogue power supply.
 
+  sound-name-prefix: true
+
 required:
   - "#sound-dai-cells"
   - compatible
-- 
2.34.1

