Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5B287DCB0
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 10:03:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2D94238E;
	Sun, 17 Mar 2024 10:03:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2D94238E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710666190;
	bh=GJ6RQynym7IzkN8dzvjBnAbZl2m4Fk+buwOjBvEbpkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ccBAEXkaoZcSmCwlv0zOPrGZFUh5kH2bkAp3yHqqyQNnragWY3Mlm556ZkOKWcnpF
	 UNAjHuCv7P9VxMXug0GnKZz7pMSA/bkKMjymKtX2oKexnLQF+wT6Hbp6rnP08hGlwH
	 lePEO4vNdQCqhgXLyycT6ETgGIM6kyVb3Ra2qAlg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B3AFF805F2; Sun, 17 Mar 2024 10:02:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAC38F805F6;
	Sun, 17 Mar 2024 10:02:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A266F8028D; Fri, 15 Mar 2024 12:28:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A3EEF80579
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 12:28:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A3EEF80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zqxffvng
Received: by mail.gandi.net (Postfix) with ESMTPA id 33F01E0004;
	Fri, 15 Mar 2024 11:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710502090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DhTP6U7YQJjOZYBiRpOBKkfxCerw/wQuu637FFjp5+0=;
	b=ZqxffvngtPIBKD+Q365GPXDXcCEySntYVgEaGJfhHtFvP/SdOYvT1OBsnbdFulFs0LIlmM
	ZaSjafSuv2ZYiSsK+uGZU7yzeKef6E+XLkywp5FfEKjKm2LAA3qz/Q8tlzhCWKXeGJarOu
	V8VjZBEP0ELy8lGq/xq4rwpvfoXYeqvrq4HNTFahENT0S8B2HReBiu3AXl5/dbZdsyaRSL
	ylXW0eFB5VCaqAFREh/iCYyfrl2V+SNAH3mZH+QqAmiBPYBAU0NZJ6vuj3XA/GCNhn1n6A
	hUEdaqstr3TuIu1ayKQRJb/KrImGpzxZs1QDtoXJ4Xx+MAyt5j2bnwq1uSlmTw==
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
Subject: [PATCH 12/13] ASoC: dt-bindings: davinic-mcbsp: Add the 'ti,drive-dx'
 property
Date: Fri, 15 Mar 2024 12:27:44 +0100
Message-ID: <20240315112745.63230-13-bastien.curutchet@bootlin.com>
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
Message-ID-Hash: HXXPCFIGYRJZ53Q7MZADXXSNP3X7SKQ5
X-Message-ID-Hash: HXXPCFIGYRJZ53Q7MZADXXSNP3X7SKQ5
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:56:02 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HXXPCFIGYRJZ53Q7MZADXXSNP3X7SKQ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

McBSP is able to handle capture and playback stream.
The McBSP's DX pins that outputs serial data during playback streams can
be used to output a chosen pattern during capture streams. For instance,
this can be useful to drive an active-low signal during capture streams
(by choosing <0> as pattern)

Add a 'ti,drive-dx' property that can be used to repeatedly output a
chosen pattern on DX pin while capture stream is ON.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
index d8d4e7ea6e02..f4d1fc6bcd61 100644
--- a/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
+++ b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
@@ -80,6 +80,13 @@ properties:
       Enable synchronisation error detections when an unexpected frame pulse is
       received. If not present, unexpected frame pulses are ignored.
 
+  ti,drive-dx:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      If the property is present, McBSP will repeatedly output the selected
+      value on DX pin during capture streams. For instance, if set to 0, this
+      can be used to drive an active-low signal.
+
 required:
   - "#sound-dai-cells"
   - compatible
-- 
2.43.2

