Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7634858C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 16:35:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 416471714;
	Mon, 17 Jun 2019 16:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 416471714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560782134;
	bh=gY9bagnjYC35ygt8yk8OM1FQRFoKOjsvhDTpb+BPaJg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cPeozVwpfL7BZDGo/Ce0xewkvuK6M3SDhUdG5suEZi+4u3Gvt7xA1V4OtQBVBEWJ+
	 kp8vA3J2sB8ph0qg/1O1ULdHxapeYl7AgGwQyL9AKN/ajtV1AjNFyBNbsE4vrp1n4W
	 L6RJS3mRmXLSrm9yjFLKvBVpVL8A8i4UUsitEppY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A924BF8075C;
	Mon, 17 Jun 2019 16:33:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CED3AF896C7; Mon, 17 Jun 2019 16:33:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DEFAF80764
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 16:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DEFAF80764
Received: from ramsan ([84.194.111.163]) by michel.telenet-ops.be with bizsmtp
 id RqZQ200023XaVaC06qZQyw; Mon, 17 Jun 2019 16:33:34 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hcshH-0002Hv-01; Mon, 17 Jun 2019 16:33:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hcshG-000190-V2; Mon, 17 Jun 2019 16:33:22 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Date: Mon, 17 Jun 2019 16:33:22 +0200
Message-Id: <20190617143322.4332-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net
Subject: [alsa-devel] [PATCH] dt-bindings: Add missing newline at end of file
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

"git diff" says:

    \ No newline at end of file

after modifying the files.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt      | 2 +-
 .../devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt     | 2 +-
 Documentation/devicetree/bindings/regulator/pv88060.txt         | 2 +-
 Documentation/devicetree/bindings/sound/cs42l73.txt             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
index 3538a214fff156d4..352f5e9c759bc3f5 100644
--- a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
+++ b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
@@ -36,4 +36,4 @@ Example:
             kcs_chan = <2>;
             status = "disabled";
         };
-    };
\ No newline at end of file
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
index 83f4bbac94bb19db..a1264cc8660dcd59 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
@@ -213,4 +213,4 @@ pinctrl: pinctrl@f0800000 {
 		groups = "clkreq";
 		function = "clkreq";
 	};
-};
\ No newline at end of file
+};
diff --git a/Documentation/devicetree/bindings/regulator/pv88060.txt b/Documentation/devicetree/bindings/regulator/pv88060.txt
index 10a6dadc008eb38d..6a7c8a92fdb0bf1c 100644
--- a/Documentation/devicetree/bindings/regulator/pv88060.txt
+++ b/Documentation/devicetree/bindings/regulator/pv88060.txt
@@ -121,4 +121,4 @@ Example
 				regulator-max-microvolt = <5000000>;
 			};
 		};
-	};
\ No newline at end of file
+	};
diff --git a/Documentation/devicetree/bindings/sound/cs42l73.txt b/Documentation/devicetree/bindings/sound/cs42l73.txt
index 80ae910dbf6c3880..47b868b5ab011470 100644
--- a/Documentation/devicetree/bindings/sound/cs42l73.txt
+++ b/Documentation/devicetree/bindings/sound/cs42l73.txt
@@ -19,4 +19,4 @@ codec: cs42l73@4a {
 	reg = <0x4a>;
 	reset_gpio = <&gpio 10 0>;
 	chgfreq = <0x05>;
-};
\ No newline at end of file
+};
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
