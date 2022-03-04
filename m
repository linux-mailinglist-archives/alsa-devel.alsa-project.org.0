Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 169EE4CD263
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 11:28:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5DC01A74;
	Fri,  4 Mar 2022 11:27:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5DC01A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646389721;
	bh=jPY8I6XhnSbRavha8/M8WzNJjUlx3xTHVnake9+h4q0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SYerHRDePTAsautKclLLx4AoBhXueWzJxkwgawmWIuuyegjIEAsDIsD9qJ9v2203O
	 MwkdPvyNwZZdJPI7eO5ot7sAgwhkl1/2EYaU15VO5lhRixmLIO0Zj6SE3H3de2VN9X
	 PBdRcfFJNWoh391oXsQgmQO2LM+cryl/I+Zo93rY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E5DEF80507;
	Fri,  4 Mar 2022 11:27:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14282F804E4; Fri,  4 Mar 2022 11:27:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE19CF800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 11:26:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE19CF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="DpqODdD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646389612;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=Iqm1fpwUrmgjEvUGxc9v780M6SwTcyGfZQ5pzdpBkTg=;
 b=DpqODdD+uC0r6yxbd22i5n+1nANHB1y4KLVKumhK4BTkdY5Q+4UblsHJloiVf6xGQf
 bAwSCr9d6o/pGE3bRm40/8ULVsv5qt1PfwWo6mugnND4+E1pb+THdiI80pXlM3Nt2EaM
 KyZshBQoazzEPOdE5CQtFQfcNrNjHHjEyjv26iqW4zCnUXY4hpG0hEG4nr3nFx0vczsv
 /4tVor1WstvC7u6MO1LFfsO/4fZ3J6JiezSvm7JdPsU5LgNaUu8XyKepqQ9oAI8BDoG/
 oEcR1RpnfDiOAd02x3B77f14DJocvUJKnkrOgUV1EtkHH6AjT1+W0P+83N7dd7RB9aEm
 kh4Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyL2muE="
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.40.1 AUTH)
 with ESMTPSA id 2c4d58y24AQq4vD
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 4 Mar 2022 11:26:52 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: Add schema for "awinic,aw8738"
Date: Fri,  4 Mar 2022 11:24:51 +0100
Message-Id: <20220304102452.26856-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304102452.26856-1-stephan@gerhold.net>
References: <20220304102452.26856-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Jonathan Albrieux <jonathan.albrieux@gmail.com>
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

Add a DT schema for describing Awinic AW8738 audio amplifiers. They are
fairly simple and controlled using a single GPIO. The number of pulses
during power up selects one of a few pre-defined operation modes. This
can be used to configure the speaker-guard function (primarily the
power limit for the amplifier).

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2:
  - Rename "enable-gpios" -> "mode-gpios" as an attempt to better
    reflect its true purpose. Add description to prevent confusion.
  - Rewrite all descriptions to be more clear about the purpose of
    the amplifier operation modes.
  - Add maximum for "awinic,mode"
---
 .../bindings/sound/awinic,aw8738.yaml         | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw8738.yaml

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw8738.yaml b/Documentation/devicetree/bindings/sound/awinic,aw8738.yaml
new file mode 100644
index 000000000000..dce86dafe382
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/awinic,aw8738.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/awinic,aw8738.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic AW8738 Audio Amplifier
+
+maintainers:
+  - Stephan Gerhold <stephan@gerhold.net>
+
+description:
+  The Awinic AW8738 is a simple audio amplifier with different operation modes
+  (set using one-wire pulse control). The mode configures the speaker-guard
+  function (primarily the power limit for the amplifier).
+
+allOf:
+  - $ref: name-prefix.yaml#
+
+properties:
+  compatible:
+    const: awinic,aw8738
+
+  mode-gpios:
+    description:
+      GPIO used for one-wire pulse control. The pin is typically called SHDN
+      (active-low), but this is misleading since it is actually more than
+      just a simple shutdown/enable control.
+    maxItems: 1
+
+  awinic,mode:
+    description: Operation mode (number of pulses for one-wire pulse control)
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 7
+
+  sound-name-prefix: true
+
+required:
+  - compatible
+  - mode-gpios
+  - awinic,mode
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    audio-amplifier {
+        compatible = "awinic,aw8738";
+        mode-gpios = <&msmgpio 114 GPIO_ACTIVE_HIGH>;
+        awinic,mode = <5>;
+        sound-name-prefix = "Speaker Amp";
+    };
-- 
2.35.1

