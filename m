Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EBF210013
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 00:32:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A98983E;
	Wed,  1 Jul 2020 00:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A98983E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593556355;
	bh=SGbanoS0lWd18UA2u2+SUyCHsXA1XZaFR/cqs+IzO6s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EyDodJ8FOACn965NOSfbmhRijXA6AyEbbBxnyDHaGbNTh0tQvmZwzhgz7CVp3mnHX
	 oiwzYddVb9YuLek7FJDK0/MeOouHozo8LQbAoFbw4LzOuQ+6RMelbTEkaAhvQS9poN
	 gWH1SwOPxY+P+W3eJw/fL2jR2I2CdSLxQA6F1ksQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9024EF801F2;
	Wed,  1 Jul 2020 00:30:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C46B0F8022D; Wed,  1 Jul 2020 00:30:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A462F801D8
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 00:30:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A462F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ToEIYLPG"
Received: by mail-qk1-x743.google.com with SMTP id b4so20306978qkn.11
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 15:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ayDLVTpqrRWCu2rwzj3x2w0PDrwipYQ4Na/NteQ3Y6I=;
 b=ToEIYLPGzxPgrQ7L3jZflV9PYsDrLwOpsOJOlSXTFMCBPV/SEltqv7XFy1pwdKfnAp
 3cmCK3JmxdGFkymbaOfEbUYcphfmjBVaCwAviummcOtbHwu/0f/9mmZWLbw2wErBTDJr
 fSW1oYCsWGIqEgXehlHZwIoTzvjEcNQ0eNPHAq9FeBpiCwFpyo0A3oOS+PhC59hXS/PX
 O8wTCp3oL6lcsG5p5WLsvbfBDXxTmdjStWLK9P7WuVPpd9NpQyxbHGsKODNK1ZUJobIH
 lEv9qWgbRK5NuLH5IQAg8OxkGXjfGYUIwp2PDySktEJMiJoFRJzUoQVs1bGEbYTryYpE
 kmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ayDLVTpqrRWCu2rwzj3x2w0PDrwipYQ4Na/NteQ3Y6I=;
 b=j0a0F9Xj/t8CBk+JfEF2bZCg4P2AsElL22v8aDThV0U3I4/0XhGj1mupQyerwdqwAP
 ibVijaPkhGMqy2kGrcd/aFoMmu/bbNn0IvZDa3EKTfK+DJYzBExhzIQiLyGb+TzHj2Fw
 1V5+eSU87I3PQhdGoDPyKq71mUmsIhWjaZEngZoyTAj1XH1OC58Y6NCXxUjiHvBOKlR1
 dRJ45nugTxkHc0gMCsndQw7E6q0UJw8V7A7zfNwMG7OIYJ9daAy2y+b7ljz6x+SWBCUr
 MwE5jJY9F2DL0lYaJoEI9ruDIr+Ee+t+4MrSFB5SItrmycotaLDDeeSo2cyJgo4R6Ibo
 DvUQ==
X-Gm-Message-State: AOAM533OsNDZAKqT74JXfRuJJTGpjNDghXnSXKMnTOb0kZKxK63DG06d
 t8VU7QyvKCiN2p36XgtIkEQ=
X-Google-Smtp-Source: ABdhPJwWLjBICbFjUM8eRwUr1PD1j1fUXQS5UUelnMrxQ8PYmYr8AImcgcKzUDv2TX882UPRHMk9tA==
X-Received: by 2002:a37:2c41:: with SMTP id s62mr15987292qkh.165.1593556244486; 
 Tue, 30 Jun 2020 15:30:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:92b:d42f:2bc1:abe3:59f0])
 by smtp.gmail.com with ESMTPSA id
 o21sm4216556qtt.25.2020.06.30.15.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 15:30:43 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: dt-bindings: simple-card: Fix 'make dt_binding_check'
 warnings
Date: Tue, 30 Jun 2020 19:30:20 -0300
Message-Id: <20200630223020.25546-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 Fabio Estevam <festevam@gmail.com>, kuninori.morimoto.gx@renesas.com
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

The following build warnings are seen with 'make dt_binding_check':

Documentation/devicetree/bindings/sound/simple-card.example.dts:209.46-211.15: Warning (unit_address_vs_reg): /example-4/sound/simple-audio-card,cpu@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:213.37-215.15: Warning (unit_address_vs_reg): /example-4/sound/simple-audio-card,cpu@1: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:250.42-261.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:263.42-288.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:270.32-272.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:273.23-275.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@1: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:276.23-278.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@2: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:279.23-281.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@3: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:290.42-303.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@2: node has a unit name, but no reg or ranges property

Fix them all.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/sound/simple-card.yaml  | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 8132d0c0f00a..35e669020296 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -378,6 +378,8 @@ examples:
   - |
     sound {
         compatible = "simple-audio-card";
+        #address-cells = <1>;
+        #size-cells = <0>;
 
         simple-audio-card,name = "rsnd-ak4643";
         simple-audio-card,format = "left_j";
@@ -391,10 +393,12 @@ examples:
                                     "ak4642 Playback", "DAI1 Playback";
 
         dpcmcpu: simple-audio-card,cpu@0 {
+            reg = <0>;
             sound-dai = <&rcar_sound 0>;
         };
 
         simple-audio-card,cpu@1 {
+            reg = <1>;
             sound-dai = <&rcar_sound 1>;
         };
 
@@ -418,6 +422,8 @@ examples:
   - |
     sound {
         compatible = "simple-audio-card";
+        #address-cells = <1>;
+        #size-cells = <0>;
 
         simple-audio-card,routing =
             "pcm3168a Playback", "DAI1 Playback",
@@ -426,6 +432,7 @@ examples:
             "pcm3168a Playback", "DAI4 Playback";
 
         simple-audio-card,dai-link@0 {
+            reg = <0>;
             format = "left_j";
             bitclock-master = <&sndcpu0>;
             frame-master = <&sndcpu0>;
@@ -439,22 +446,23 @@ examples:
         };
 
         simple-audio-card,dai-link@1 {
+            reg = <1>;
             format = "i2s";
             bitclock-master = <&sndcpu1>;
             frame-master = <&sndcpu1>;
 
             convert-channels = <8>; /* TDM Split */
 
-            sndcpu1: cpu@0 {
+            sndcpu1: cpu0 {
                 sound-dai = <&rcar_sound 1>;
             };
-            cpu@1 {
+            cpu1 {
                 sound-dai = <&rcar_sound 2>;
             };
-            cpu@2 {
+            cpu2 {
                 sound-dai = <&rcar_sound 3>;
             };
-            cpu@3 {
+            cpu3 {
                 sound-dai = <&rcar_sound 4>;
             };
             codec {
@@ -466,6 +474,7 @@ examples:
         };
 
         simple-audio-card,dai-link@2 {
+            reg = <2>;
             format = "i2s";
             bitclock-master = <&sndcpu2>;
             frame-master = <&sndcpu2>;
-- 
2.17.1

