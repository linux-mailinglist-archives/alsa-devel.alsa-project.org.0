Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5674D4410F6
	for <lists+alsa-devel@lfdr.de>; Sun, 31 Oct 2021 22:12:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC53A1699;
	Sun, 31 Oct 2021 22:11:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC53A1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635714766;
	bh=LNkreUhiu43JsXeeJiApozKI0sEfD92k9YXF89qjvq8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nT0qymXKMZLv5J4jTPifJdSy8TnrVC/t5S1G5q/bZCoeasCdKjVC4SvURHK164pNH
	 QOKvhQKM32KiLW/BQLzfd8/sCvlNV3kbPp7bjEzSVtfvDn5h1Cx3eHk9klpcOvYoD1
	 tAPIgNzPoGsoy7UNcqHaNPOB3kzYv07jLeCtfvzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3F9DF804B2;
	Sun, 31 Oct 2021 22:11:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8A8BF804E5; Sun, 31 Oct 2021 22:11:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from msg-6.mailo.com (ip-16.mailobj.net [213.182.54.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FFEAF804B2
 for <alsa-devel@alsa-project.org>; Sun, 31 Oct 2021 22:11:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FFEAF804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="J9LcOBca"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1635714614; bh=LNkreUhiu43JsXeeJiApozKI0sEfD92k9YXF89qjvq8=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding;
 b=J9LcOBcaGVZ3x6+YTvtJnp3prkvfKX4WAtnjbgeZiEVyPar+Q92bAILUF4noRKOIE
 TrZBdCVSrAwGD+MWSP1X/E8RVYsdQsoFGCrrNOZ/dbAaXnUXat6HHLc8bXO5sh2XK8
 r5RrUuG1eGZxj/VVv5D9ZdTZIaaskk1F3GYqUARk=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Sun, 31 Oct 2021 22:10:14 +0100 (CET)
X-EA-Auth: td5AK5cFG4jHZ8IYXJbkHQS/M3KoPeaMR30Ppnd5l2BXyJrvpMEKFA6z6aV9haR/yFAZHKmUKs2lPEag3uk80vfpIYkWlYJhr8Ia5eg/DMk=
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: stephan@gerhold.net, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 1/2] ASoC: dt-bindings: nxp,
 tfa989x: Add rcv-gpios property for tfa9897
Date: Sun, 31 Oct 2021 22:09:55 +0100
Message-Id: <20211031210956.812101-2-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211031210956.812101-1-vincent.knecht@mailoo.org>
References: <20211031210956.812101-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Vincent Knecht <vincent.knecht@mailoo.org>, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
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

Add optional rcv-gpios property specific to tfa9897 receiver mode.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 .../bindings/sound/nxp,tfa989x.yaml           | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
index 7667471be1e4..b9b1dba40856 100644
--- a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
+++ b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
@@ -24,11 +24,23 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  rcv-gpios:
+    description: optional GPIO to be asserted when receiver mode is enabled.
+
   sound-name-prefix: true
 
   vddd-supply:
     description: regulator phandle for the VDDD power supply.
 
+if:
+  not:
+    properties:
+      compatible:
+        const: nxp,tfa9897
+then:
+  properties:
+    rcv-gpios: false
+
 required:
   - compatible
   - reg
@@ -55,3 +67,32 @@ examples:
         #sound-dai-cells = <0>;
       };
     };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      speaker_codec_top: audio-codec@34 {
+        compatible = "nxp,tfa9897";
+        reg = <0x34>;
+        vddd-supply = <&pm8916_l6>;
+        rcv-gpios = <&msmgpio 50 GPIO_ACTIVE_HIGH>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&speaker_top_default>;
+        sound-name-prefix = "Speaker Top";
+        #sound-dai-cells = <0>;
+      };
+
+      speaker_codec_bottom: audio-codec@36 {
+        compatible = "nxp,tfa9897";
+        reg = <0x36>;
+        vddd-supply = <&pm8916_l6>;
+        rcv-gpios = <&msmgpio 111 GPIO_ACTIVE_HIGH>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&speaker_bottom_default>;
+        sound-name-prefix = "Speaker Bottom";
+        #sound-dai-cells = <0>;
+      };
+    };
-- 
2.31.1



