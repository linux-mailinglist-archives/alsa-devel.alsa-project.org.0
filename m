Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 897094172A0
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Sep 2021 14:49:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD39F1654;
	Fri, 24 Sep 2021 14:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD39F1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632487744;
	bh=KlcqLXP5k4n0aGyz00Dz3fvDFwqA+4rZZbRV236LNhs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fGu898jzBTC9rI6zLkYchKJ1m/e2DwXThsx5zhBUe7mT6D1CyNYYyjbNZs0ln6YYM
	 9OHVZQOyugIPzpsNCuC5IlKy1+Kg1zJouvyccW1Dj0+M1EnFVPU7yWI4sKjaXpvayA
	 VmPKOacCaTU476+sDd5w63VePIrvjuy8wQW4L3k8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76F35F8013F;
	Fri, 24 Sep 2021 14:47:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31AFAF802A0; Fri, 24 Sep 2021 14:47:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64787F8013F
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 14:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64787F8013F
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:5dd8:9bc4:3752:5710])
 by baptiste.telenet-ops.be with bizsmtp
 id xona250042gynNa01onaAF; Fri, 24 Sep 2021 14:47:34 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mTkc1-008aw3-IN; Fri, 24 Sep 2021 14:47:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mTkc0-007gqh-SZ; Fri, 24 Sep 2021 14:47:32 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2] ASoC: dt-bindings: wlf,wm8978: Fix I2C address in example
Date: Fri, 24 Sep 2021 14:47:32 +0200
Message-Id: <c99fc865e3fca6ea623661c52de7dc6a3c36c8b4.1632487554.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, patches@opensource.cirrus.com,
 Maxime Ripard <maxime@cerno.tech>
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

According to the WM8978 datasheet, the address of the device is fixed as
0011010 in 2-wire mode.

Fixes: 5bd5699c494f42a3 ("ASoC: dt-bindings: Add WM8978 Binding")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Fix silly typo (missing 0x prefix).
---
 Documentation/devicetree/bindings/sound/wlf,wm8978.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml
index 944e5859c962e634..96cf9fc9c8b0098b 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml
@@ -48,10 +48,10 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        codec@0 {
+        codec@1a {
             #sound-dai-cells = <0>;
             compatible = "wlf,wm8978";
-            reg = <0>;
+            reg = <0x1a>;
         };
     };
 
-- 
2.25.1

