Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B91FC89AF0A
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:18:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A961227E;
	Sun,  7 Apr 2024 09:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A961227E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474298;
	bh=MDsLsFHtLslxvPtCs/nUPioPhXfjVy6AZnDa713pFfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rrbvVoDdZd7s65kxWdONSRM8rimvvPBQLIJeqJgc/+LxvzwwYGJACn8/vrYJA91S6
	 Xe2ecN93vruqCKzG81CRjmO55K7JQ5qvsSBjnEims0T+LHkVtQHHlczx2SzyIA0m7P
	 JJAXIjXMs0YDyeS54uAkiP9Gq3iimR40WMprEe/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 091CBF805FF; Sun,  7 Apr 2024 09:17:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88BE0F805E0;
	Sun,  7 Apr 2024 09:17:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68613F80589; Tue,  2 Apr 2024 09:12:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5427F8056F
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 09:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5427F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f3bX7Jpc
Received: by mail.gandi.net (Postfix) with ESMTPA id 10E9BFF80A;
	Tue,  2 Apr 2024 07:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712041940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kjMah6RzWU9Pw9jrFvPJ1cd8OwCxOXg5IsWRlfB0YHk=;
	b=f3bX7Jpc6sXcyKJnYTY182aCDhlFJ78Bq9bDoCqL3Q4wpQw6nArUE4pWQr6S5iLlThLMtC
	40CGAijuVr7Dsjcfisy4N4kQFIvibJXT041zmdssqolQ0p06rxlHB6NRjnX0UvOY5B2SNf
	33D+47Val3gVaOcSmDuXBQ6tneJrOqRJyyIZT5tNeTbFL6EmiFfpJpB7IPvvWfMqz4P6Fl
	fan3UFGtnsh5CbWHpJWdfjz/Jc7njZoqV7Uy6IlY8bbfeML2r1eH3csi227NZqC5QXTYLp
	X9JT26fUsKT75D2Y7TT9D/82uqY4tAXwW5gbbufgxbxZjC7GuhN8m3fG323JdA==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v2 02/13] ASoC: dt-bindings: davinci-mcbsp: Add optional clock
Date: Tue,  2 Apr 2024 09:12:02 +0200
Message-ID: <20240402071213.11671-3-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
References: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7MXKNXKMUOQ6HLMTDNGKJTOQPGRPIA2I
X-Message-ID-Hash: 7MXKNXKMUOQ6HLMTDNGKJTOQPGRPIA2I
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:14:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7MXKNXKMUOQ6HLMTDNGKJTOQPGRPIA2I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The McBSP uses an internal sample rate generator to provide bit clock
or frame clock. This sample rate generator can be programmed to be
driven by McBSP's internal clock source or by an external clock source
(located on CLKS pin). The external clock source is not described in
the bindings.

Add an optional clock item that allows to select an external clock as
sample rate generator's input.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
index 139b594dd192..0c2b1936c6a1 100644
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
     maxItems: 1
-- 
2.44.0

