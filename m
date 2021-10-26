Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAE243DBF2
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 09:26:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C92D9169E;
	Thu, 28 Oct 2021 09:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C92D9169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635405989;
	bh=IqOzMaEIcRsCLB8HfuR5pnAHFnk0pnusfSJHR6k3R8c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qbGPeg02DNUTFUcwfc4tMXUqxIba6U2Flo1Faz5uAHuJJltQ+vzW9Ggfhp3U3Pk+F
	 lYKFLbJhnr+Nt66+JVO7dfZkY9Qr9NvGPjSf4wiqxnSPVXTOKdtljrJz2/vQ4NCg8b
	 Fy2frl8xS8x4zbu7twRXzz/Sax/ccHMu0F16pAHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A15EF802E7;
	Thu, 28 Oct 2021 09:25:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03D44F802C8; Tue, 26 Oct 2021 20:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43F60F8014D
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 20:28:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43F60F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="hM0uB/Rx"; 
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mailbox.org header.i=@mailbox.org header.b="qF9JqanH"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Hf0gW0Z9fzQkjH;
 Tue, 26 Oct 2021 20:28:07 +0200 (CEST)
Authentication-Results: spamfilter01.heinlein-hosting.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1635272885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=AZ7CvNRkNKSZRoioIP12odIg8mncuskljJovSNkajjY=;
 b=hM0uB/RxVQUkW+8hELuC72BRLCpspj5OMgptIaHb63QKFAiv1eLhlHQ3kpShDqcy1jFxa6
 0+b7Unw5Md6sGQx7lH4CsGvrHSzi521Zlspw46fbDBRfGce0vdJODc6LzN1HHeu7KqGI2i
 Hr7U+xusbZ++WM6/nCXgDEvOoegYnIr4bYPVPcQ03EctEspvWZ/xju0GhbhVF88XvMPoS/
 DMOT5j9ESlDAoJKmpuwPZdWWlZa5TULpqcon2KSmuAKPyk1uHOXjSKOtnCydUoI89Yk9mR
 Cdk9cOdgJ6Rs6bIe01t5hMfI2EwtQdlEXj7oTZM04imFcRDwcCSuUplAZf7lYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received; s=mail20150812; t=
 1635272884; bh=IqOzMaEIcRsCLB8HfuR5pnAHFnk0pnusfSJHR6k3R8c=; b=q
 F9JqanHWTutwGdGOaGWFdSoBgHN3GEu1FI33QIvw/XOYMKQ4a2m2zR3GaRk+48q2
 JL0IBeyAjV2KH10pZyLxKdeqdOF/eM7rCKg8fQ0H5PjV/XQazPGHwCICvHgo+3NR
 LWu5gAqAFacOQHywd3ROS642NeZzubYYsmXMEyCPIthEyh8YY2WPEsOYCRa9rENY
 EYC0meZ4kFWuNnth2ZxgeOhhRV0MiDjB8XmZ96zpsoSCizdzSRQDxLj1OWLlut2L
 haJXMxOihIW2ZviYiOuSiGWEiT6pO2y4+Z0rmawpHeaZs2f9YpVa0j1ay8tibu59
 T6GGgF8/yD6IrIZk4eD1Q==
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 1/1] ASoC: meson: t9015: Add missing AVDD-supply property
Date: Tue, 26 Oct 2021 20:27:54 +0200
Message-Id: <20211026182754.900688-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1A666130F
X-Mailman-Approved-At: Thu, 28 Oct 2021 09:25:10 +0200
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Jerome Brunet <jbrunet@baylibre.com>
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

Fixes the schema check warning "audio-controller@32000: 'AVDD-supply'
do not match any of the regexes: 'pinctrl-[0-9]+'"

Fixes: 5c36abcd2621 ("ASoC: meson: add t9015 internal codec binding documentation")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
Thanks all for their review. Here is v2 with the following changes:
v2:
* Separated from other meson DT patches (2/4 - 4/4)
* Adjusted recipients
* Added missing property in example
* Adjusted commit message subject
* Added Reviewed-by: Jerome Brunet tag

 Documentation/devicetree/bindings/sound/amlogic,t9015.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
index c7613ea728d4..db7b04da0b39 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
@@ -34,6 +34,10 @@ properties:
   resets:
     maxItems: 1
 
+  AVDD-supply:
+    description:
+      Analogue power supply.
+
 required:
   - "#sound-dai-cells"
   - compatible
@@ -41,6 +45,7 @@ required:
   - clocks
   - clock-names
   - resets
+  - AVDD-supply
 
 additionalProperties: false
 
@@ -56,4 +61,5 @@ examples:
         clocks = <&clkc CLKID_AUDIO_CODEC>;
         clock-names = "pclk";
         resets = <&reset RESET_AUDIO_CODEC>;
+        AVDD-supply = <&vddao_1v8>;
     };
-- 
2.33.1

