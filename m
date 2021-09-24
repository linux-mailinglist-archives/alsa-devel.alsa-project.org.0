Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4527C416D4A
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Sep 2021 10:04:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B547B1654;
	Fri, 24 Sep 2021 10:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B547B1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632470665;
	bh=NWajiXxwQOb4vj2mt3a6nI6d/BdkAzWPLf+oeRbq+m8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JWTGArbfapQE7kn07eXsgS6XQY7/55fxQFp2+LUXmxP5qnGl9YFTmArqtDVz1u2q+
	 +4RSiMrYST/5JNbAosU27V16rfwxbdVqDfUqAnP1uQ5he6Nk9phL5DBbZHOfqr+cvg
	 ApfihnQDHRJcfmJ4HgZGjdrvdL3LyWnYIfFNs1RM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68A45F8025D;
	Fri, 24 Sep 2021 10:03:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C1A3F802A0; Fri, 24 Sep 2021 10:03:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25230F80246
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 10:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25230F80246
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:5dd8:9bc4:3752:5710])
 by laurent.telenet-ops.be with bizsmtp
 id xk2s2500U2gynNa01k2sJU; Fri, 24 Sep 2021 10:02:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mTgAW-008WUw-6o; Fri, 24 Sep 2021 10:02:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mTgAV-007MJd-MA; Fri, 24 Sep 2021 10:02:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: dt-bindings: wlf,wm8978: Fix I2C address in example
Date: Fri, 24 Sep 2021 10:02:50 +0200
Message-Id: <0409470fbe6bba69ec74a3f30681b5fe93a372ba.1632470464.git.geert+renesas@glider.be>
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
 Documentation/devicetree/bindings/sound/wlf,wm8978.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml
index 944e5859c962e634..0b80ac3a7106658c 100644
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
+            reg = <1a>;
         };
     };
 
-- 
2.25.1

