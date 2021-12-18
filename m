Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A816479B56
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Dec 2021 15:27:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EAAD1A98;
	Sat, 18 Dec 2021 15:26:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EAAD1A98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639837623;
	bh=aXmpcP1Jfc2jKvTiihT0ExdB8OlFUBKR27UeksxKHrU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iakonmJhLQeRaCfhP21VvD65zyofpeDPCeCSNQaYKQYNUi5X/kCKKnagONfJ3/9zw
	 /LCdMlYK8LG2vdErMHaBzYQidKbOnRqqVOVBSgc4vKdVH2Lx5rWdDhFTOfgPXSiEv3
	 L0PkmPZtDv4lDhYhBE7X6I1G3MSHToeT9yRRWn4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 265DDF8047C;
	Sat, 18 Dec 2021 15:25:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EDAEF80130; Sat, 18 Dec 2021 15:25:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050::465:102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B144FF80130
 for <alsa-devel@alsa-project.org>; Sat, 18 Dec 2021 15:25:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B144FF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="tMDwMwcv"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4JGSmd619vzQl4q;
 Sat, 18 Dec 2021 15:25:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1639837504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4JqT8IhtmC32jWTRrRPC1aHkPla/SvCjwUq+HPQfzAg=;
 b=tMDwMwcvhno5O8rJ6uTOHJFmiDhNeeKBiWnFIRu1Tu8BNyvLsL6qJc9yYwD5AnusC+aRHB
 GzFad1e/kHrgLgxA8seA2oGT7VucoGqdI9UR3zBovSFgxeyY5C36P87w8R0cbUymQpLqCj
 3P5KVTDYrtxIYgGAnfQlBbNI12OGYS0BG9LUeLdvnwqAAVN42JaLNaLFGbVSlIYd+N4CSI
 0D1/RZ0Sf2tL2SpBpR/fgAg80frt+5ZQ9+1wUxHqZowAhq4eDlYAaX7KIZW+NJHla4u7R1
 QxmF4D80KqEDD5ZpEIh7O0KVGiE71hKs/glVQIBez2d8w6In1rvUYMptP2/WCw==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/3] ASoC: dt-bindings: Use name-prefix schema
Date: Sat, 18 Dec 2021 15:24:49 +0100
Message-Id: <20211218142451.15010-1-alexander.stein@mailbox.org>
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

name-prefix.txt does not exist anymore, just reference the schema instead.

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 .../devicetree/bindings/sound/simple-audio-amplifier.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/simple-audio-amplifier.yaml b/Documentation/devicetree/bindings/sound/simple-audio-amplifier.yaml
index 26379377a7ac..1f0327474744 100644
--- a/Documentation/devicetree/bindings/sound/simple-audio-amplifier.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-audio-amplifier.yaml
@@ -9,6 +9,9 @@ title: Simple Audio Amplifier Device Tree Bindings
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
+allOf:
+  - $ref: name-prefix.yaml#
+
 properties:
   compatible:
     enum:
@@ -22,10 +25,7 @@ properties:
     description: >
       power supply for the device
 
-  sound-name-prefix:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: >
-      See ./name-prefix.txt
+  sound-name-prefix: pass
 
 required:
   - compatible
-- 
2.34.1

