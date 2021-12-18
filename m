Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E993479B6B
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Dec 2021 15:36:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3B5C1AF4;
	Sat, 18 Dec 2021 15:35:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3B5C1AF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639838190;
	bh=F2/V2zPfl5JI6BlpfHX/GEd9eZfB2v0lyNpixcYf3Og=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LqhwHbMl/pzvZ8x+BT+YRvtlW3CCs9fY8cIUpp3hqXUCLd0s193XfRJeTLB6SAnxP
	 zCI/IwxyGAWi8SzSaMHy6aOAin8YtjhaqtkxvkSynpDJ15wLJnO4ZLwAnrzYsiqZgp
	 R/WPa8F3ClbYoFZOEwYunkPTVI2ubQ9MwBs8Yzxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB590F804CA;
	Sat, 18 Dec 2021 15:34:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A19DFF8047C; Sat, 18 Dec 2021 15:34:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B39A4F80130
 for <alsa-devel@alsa-project.org>; Sat, 18 Dec 2021 15:34:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B39A4F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="ZYbT2IT6"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4JGSzc3VCdzQkBp;
 Sat, 18 Dec 2021 15:34:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1639838074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9c4gpNYB79+7nhkfAcvn/kEQPe3TsDkeCKNXjg70i1o=;
 b=ZYbT2IT6AsvXqUH89Tlki8hOyCDZRHQjWLZ34LzvIoKmc4WGY4I68z94kUgANiX+4XgZ9h
 bUZmcv6cHgLIk3eCAEMDwbTUllRT5VQTESDRxDEM8hSQRovMlf2qM5G+MIsQ2HM6nsD/1S
 UI1Gp4/M78PYxUX6KE71wLltMay46ib2xX7r4aEBBef58uyfa0wNqfgadT2VA9W/NhnJ/Y
 +G2sYFK2+xGzCcvr/92FEaRpSOuuTOnnGKpjEY9laTCj3nhsg99RMKnOTQxU5RXHEShr9p
 WdMXh1RvjD/cyQv9gdhyCpYgvJswe3rAXYFUF6oaZ/7cNCQ9anu9jsD341DTmA==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/3] ASoC: meson: t9015: add missing sound-name-prefix
 property
Date: Sat, 18 Dec 2021 15:34:22 +0100
Message-Id: <20211218143423.18768-2-alexander.stein@mailbox.org>
In-Reply-To: <20211218143423.18768-1-alexander.stein@mailbox.org>
References: <20211218143423.18768-1-alexander.stein@mailbox.org>
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

Changes in v2:
* None

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

