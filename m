Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EC998C6FB
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 22:48:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0B5386F;
	Tue,  1 Oct 2024 22:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0B5386F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727815710;
	bh=JWQmFj28vAA7pfGSgFPser4PWendSu3+yh/XwPZ7QDU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MzsvcpuMBNKiZdku9JkVBRd7rX1JSlTKiRBtWk/F1NHM7/42PT1+49ayJzl6l+R5v
	 UA7z9MPdBSmb7wWhng++hFO9jYqElcF82qP9hGwaktQmzUMZdRcIifDxo0Ss6TpsBx
	 m7BGHK+AHyWrpx7Ndj7328TghbcH7QEQXrc1RYJM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1767DF80528; Tue,  1 Oct 2024 22:47:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0C8EF80508;
	Tue,  1 Oct 2024 22:47:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 451E9F80517; Tue,  1 Oct 2024 22:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F563F80104
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 22:47:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F563F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cZEyP7Bf
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4434420003;
	Tue,  1 Oct 2024 20:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727815671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7K/Eugdwj8fUKd8disrVXoOxjLjfRgm10Zw7MAU2ris=;
	b=cZEyP7BfbsdDIRYXFoW85KZoxgrkUFjYoHO06PgZTSGhNOxcfza4NwQ+tvIn60v1P7YlSk
	FaK7AQUpxUHaCEIYq362WRBmmENU7UW1RmZFYiX5AJ+cmTg1lRMagXYAZnFi0z8S4QVNoP
	ZQFhevSmzKPWpVbGdTQV8Ne8sg2ORASSHX/EtcyPTO49LpaE4wCAWQR5p2/zuffnGqrepS
	hhzdm+g9DseFRnYFL89H1Ml2RceZPPH/3AybFwLrCld2F2ItzB1aDbT8dUJ4faP9sHmtEm
	ibOGyHl8vWXd3jbxFbD+YDeHhEg7KZDDIX208FRoEHLXqAZ4iS4EMChD9EpSoA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupts property
Date: Tue,  1 Oct 2024 22:47:49 +0200
Message-ID: <20241001204749.390054-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: FCBEVKV2DV562SVAVW5LGBTJEGFQWP5L
X-Message-ID-Hash: FCBEVKV2DV562SVAVW5LGBTJEGFQWP5L
X-MailFrom: miquel.raynal@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FCBEVKV2DV562SVAVW5LGBTJEGFQWP5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

My understanding of the interrupts property is that it can either be:
1/ - TX
2/ - TX
   - RX
3/ - Common/combined.

There are very little chances that either:
   - TX
   - Common/combined
or even
   - TX
   - RX
   - Common/combined
could be a thing.

Looking at the interrupt-names definition (which uses oneOf instead of
anyOf), it makes indeed little sense to use anyOf in the interrupts
definition. I believe this is just a mistake, hence let's fix it.

Fixes: 8be90641a0bb ("ASoC: dt-bindings: davinci-mcasp: convert McASP bindings to yaml schema")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
---
 .../devicetree/bindings/sound/davinci-mcasp-audio.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
index 7735e08d35ba..ab3206ffa4af 100644
--- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
@@ -102,7 +102,7 @@ properties:
     default: 2
 
   interrupts:
-    anyOf:
+    oneOf:
       - minItems: 1
         items:
           - description: TX interrupt
-- 
2.43.0

