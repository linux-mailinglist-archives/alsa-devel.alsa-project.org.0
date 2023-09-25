Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6817AE18F
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 00:11:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D51E0AE8;
	Tue, 26 Sep 2023 00:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D51E0AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695679892;
	bh=wrZGhwKs0rxrVrvNQeQFjjkktFc24Ckyd2CV5SBPQrA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aZwQtg8VwP8QrQq+uJer8Yc9SjcqDWv4vjM0cIjJCNB6OFs1kirmR0AaMhn6pdYjn
	 nPiqzJIAugdScH8yshH6K+h20MijVHCO4PTS0EeRPlzcC/xQwnLaUxuYSngh43D0/D
	 pM1vU0J+4WdjCl3M2ebVAkHrqVJVQsEO4CrVHT1I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A61F1F80553; Tue, 26 Sep 2023 00:10:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0503DF80166;
	Tue, 26 Sep 2023 00:10:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D92E3F8016A; Tue, 26 Sep 2023 00:10:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 146E7F800AE
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 00:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 146E7F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HKJjdNu7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 21122B80E7F;
	Mon, 25 Sep 2023 22:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C8AC433C7;
	Mon, 25 Sep 2023 22:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695679798;
	bh=wrZGhwKs0rxrVrvNQeQFjjkktFc24Ckyd2CV5SBPQrA=;
	h=From:To:Cc:Subject:Date:From;
	b=HKJjdNu7I9LITZhQdye8D0M0nnFZYNtbr48LOBgybs4ESmzZ1jinSTTG0X5I3ipM2
	 amIUnjlHqMhCLW2TaN7r84iAgQKrw2MLIkSyYAj7WOTwnMPsFzSV9ga2tWRAR4/+/i
	 svBCPoG48zk80LZfpx3zR9nCSFCnk850xTx2sor61/oeNn0IDUFHmI6n6kffFX91cO
	 fuADG8CXuh/85ckjurBU2qnIrSLr8eZUh2zyH+c1H01fe+/QrMfHKGuyQWqc9jtQ5z
	 wmOccTN4V+AkEuxjeRsOel1AM5GLLTRoKaaAHXpkT3wnhU1vIqFX2/RV91W9WoIzq0
	 XdRGDIkjlYfhg==
Received: (nullmailer pid 2032130 invoked by uid 1000);
	Mon, 25 Sep 2023 22:09:56 -0000
From: Rob Herring <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Herve Codina <herve.codina@bootlin.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>,
 David Rau <David.Rau.opensource@dm.renesas.com>,
 Damien Horsley <Damien.Horsley@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] ASoC: dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Date: Mon, 25 Sep 2023 17:09:28 -0500
Message-Id: <20230925220947.2031536-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6Q4HZ5BICE4KS2G4OQUOXM4OS43J5ZLP
X-Message-ID-Hash: 6Q4HZ5BICE4KS2G4OQUOXM4OS43J5ZLP
X-MailFrom: SRS0=JOOG=FJ=robh_at_kernel.org=rob@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6Q4HZ5BICE4KS2G4OQUOXM4OS43J5ZLP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Just as unevaluatedProperties or additionalProperties are required at
the top level of schemas, they should (and will) also be required for
child node schemas. That ensures only documented properties are
present for any node.

Add unevaluatedProperties or additionalProperties as appropriate.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/dialog,da7219.yaml | 1 +
 Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml | 1 +
 Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml   | 1 +
 3 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
index eb7d219e2c86..19137abdba3e 100644
--- a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
+++ b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
@@ -89,6 +89,7 @@ properties:
 
   da7219_aad:
     type: object
+    additionalProperties: false
     description:
       Configuration of advanced accessory detection.
     properties:
diff --git a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
index ff5cd9241941..b522ed7dcc51 100644
--- a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
@@ -33,6 +33,7 @@ patternProperties:
     description:
       A DAI managed by this controller
     type: object
+    additionalProperties: false
 
     properties:
       reg:
diff --git a/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml b/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
index b6a4360ab845..0b4f003989a4 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
@@ -60,6 +60,7 @@ properties:
 
   ports:
     $ref: audio-graph-port.yaml#/definitions/port-base
+    unevaluatedProperties: false
     properties:
       port@0:
         $ref: audio-graph-port.yaml#
-- 
2.40.1

