Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 796E087DCAA
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 09:59:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC7072391;
	Sun, 17 Mar 2024 09:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC7072391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710665974;
	bh=Vqa6QA158MoJJhfEt2Iy0wh9/kNKE3uYlMHDc5V99h4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iaP0ddRWHa801F+hyzwgLRvmTINEif2Ysnce7xN2RTO6j/xah3Csq1MQORtvXxN7g
	 KHiiCXuHzpPbHqmQTnmJVgRndllHoxvzqM2yZoE25mWby/xZFQhh63NxRintZpHIfj
	 +ejLpk0mHpQlvi4xSfacFUQTj1OzGeDbunu48a40=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49727F805D8; Sun, 17 Mar 2024 09:58:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95110F805C4;
	Sun, 17 Mar 2024 09:58:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21C91F8025F; Fri, 15 Mar 2024 12:28:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3DA9F8028D
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 12:27:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3DA9F8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ohc8rMAZ
Received: by mail.gandi.net (Postfix) with ESMTPA id B465DE0005;
	Fri, 15 Mar 2024 11:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710502077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6wAImaMrQQgDt9yLO+ckEgLXUzk4/YE6uy/Vm+UgWI=;
	b=Ohc8rMAZZQx0N2dF+PKKTV4O9wDsMc5dVw6E/m4mHYRavO52U//ZROTrJgthdMmQqkJKQZ
	4YTOOU1vpC8MGeWcaFJmfQIfoiZrBvrsYPFA2ZJ6D5PsIuVPDZ85dKj0KR8tI2ZtpCh4vv
	5IW2+I4vm30iSb1BZDnRu6boyg2It16Ebims7bIzVmx9uW60OohG3Wad2WEn99v5cpKNR4
	ePZkxJlQomAPo4tckYT8XnDBRir76ecEKH9m3Lli6ivMlVGcYWIgB1JIFC2BGjp9tkFNHj
	kjrZHgd3IPs51zP3/tFI5lbTx1RZ1JyZ4NHzG0c9Ht/g++MAnlE07DbYYRYazA==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca
Subject: [PATCH 02/13] ASoC: dt-bindings: davinci-mcbsp: Add new properties
Date: Fri, 15 Mar 2024 12:27:34 +0100
Message-ID: <20240315112745.63230-3-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RH4UVYQJ5MC5NUI2W4A2ENAWFYZGBPYR
X-Message-ID-Hash: RH4UVYQJ5MC5NUI2W4A2ENAWFYZGBPYR
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:55:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Following features are not described in the bindings:
 - The McBSP uses an internal sample rate generator to provide bit clock
   or frame clock. This sample rate generator can be programmed to be
   driven by McBSP's internal clock source or by an external clock source
   (located on CLKS pin).
 - McBSP can be configured in 'free-running' mode so that its serial
   clocks will continue to run during emulation halt.
 - McBSP can generate a SYNCERR when unexpected frame pulses are detected

Add an optional clock item that allows to select an external clock as
sample rate generator's input.

Add a 'ti,disable-free-run' flag to disable the free-running mode. This
mode is selected by default by the driver that's why I add a disabling
flag instead of an enabling one.

Add a 'ti,enable-sync-err' flag to enable SYNCERR generation when
unexpected frame pulses are detected.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 .../devicetree/bindings/sound/davinci-mcbsp.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
index 8b0e9b5da08f..d8d4e7ea6e02 100644
--- a/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
+++ b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
@@ -50,12 +50,16 @@ properties:
       - const: tx
 
   clocks:
+    minItems: 1
     items:
       - description: functional clock
+      - description: external input clock for sample rate generator.
 
   clock-names:
+    minItems: 1
     items:
       - const: fck
+      - const: clks
 
   power-domains:
     description: phandle to the corresponding power-domain
@@ -64,6 +68,18 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  ti,disable-free-run:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Disable free-running mode. If not present, serial clocks continue to run
+      during emulation halt.
+
+  ti,enable-sync-err:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Enable synchronisation error detections when an unexpected frame pulse is
+      received. If not present, unexpected frame pulses are ignored.
+
 required:
   - "#sound-dai-cells"
   - compatible
-- 
2.43.2

