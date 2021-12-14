Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3E94744CB
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 15:24:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFB901FAF;
	Tue, 14 Dec 2021 15:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFB901FAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639491867;
	bh=XRi+0q95dmZXGaog0+ffzL0R9CiKRh7uJgXi0GqoDng=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BeMdaMpI/pRMCHmy+R/eeGb97rkUN/gC3xYGlvk+FZqNUdbgU2pbh0Jo29hJT+GxL
	 5rd8zsSIddBDj9jrkedyzOmpfOCnoZsavnlarRHrYrfD0DFagWiJXUuxeXw+HJMlvU
	 1Sdw8/4mpbi5KQAS3PzgHT99gFE/bCqjB++XN23A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A09AF80271;
	Tue, 14 Dec 2021 15:22:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56B4BF80254; Tue, 14 Dec 2021 15:22:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 425BFF801EC
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 15:22:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 425BFF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="awM/icih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1639491755;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=z2GjOJisdAbabtu8mFVDMyV6/eqKuOCfC207QQYIfb8=;
 b=awM/icih3+mO5ims3FKIACYm9G4aoaBtPRq5PgwE6Eic+I8RojlL9gCLG7aDqCpTIn
 Jjdgbfd9FNIHTiR3FKLZhtMWNglZMKai/CpfoN3CyyL32u6IhB61OinpbapwU3bfc5g9
 KJJqGQ5l62KHGNLrqG25MyangAfXCy0uVRORrNUS8i/soWa30txwwRm7tkBsuzbxNjFa
 7sZXpTNQtjjEqF+E57OzQoOirdk8BAZNXPKef1O3AfsGzMDQg/4OsjROKSX2DRAcXxV3
 +UKqbs8dKieQd6jqOVIieiv8PLxl0jqYEgRo4H7ewSd+gzK5h42fXUZod/SBu3z5wINB
 ktPQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1O/hR"
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.35.3 AUTH)
 with ESMTPSA id x08baexBEEMZ8rX
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 14 Dec 2021 15:22:35 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/4] ASoC: dt-bindings: qcom: sm8250: Document "pin-switches"
 and "widgets"
Date: Tue, 14 Dec 2021 15:20:47 +0100
Message-Id: <20211214142049.20422-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211214142049.20422-1-stephan@gerhold.net>
References: <20211214142049.20422-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Vincent Knecht <vincent.knecht@mailoo.org>
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

Some sound card setups might require extra pin switches to allow
turning off certain audio components. There are two real examples for
this in smartphones/tablets based on MSM8916:

  1. Analog speaker amplifiers connected to headphone outputs.

     The MSM8916 analog codec does not have a separate "Line Out" port
     so some devices have an analog speaker amplifier connected to one
     of the headphone outputs. A pin switch is necessary to allow
     playback on headphones without also activating the speaker.

  2. External speaker codec also used as earpiece.

     Some smartphones have two front-facing (stereo) speakers that can
     be also configured to act as an earpiece during voice calls. A pin
     switch is needed to allow disabling the second speaker during
     voice calls.

There are existing bindings that allow setting up such pin switches in
simple-card.yaml. Document the same for Qcom sound cards.

One variant of example 1 above is added to the examples in the DT
schema: There is an analog speaker amplifier connected to the HPH_R
(right headphone channel) output. Adding a "Speaker" pin switch and
widget allows turning off the speaker when audio should be only played
via the connected headphones.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../devicetree/bindings/sound/qcom,sm8250.yaml   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index e50964c54bb9..4bfda04b4608 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -39,6 +39,14 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description: User visible long sound card name
 
+  pin-switches:
+    description: List of widget names for which pin switches should be created.
+    $ref: /schemas/types.yaml#/definitions/string-array
+
+  widgets:
+    description: User specified audio sound widgets.
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+
   # Only valid for some compatibles (see allOf if below)
   reg: true
   reg-names: true
@@ -251,7 +259,15 @@ examples:
         reg-names = "mic-iomux", "spkr-iomux";
 
         model = "msm8916";
+        widgets =
+            "Speaker", "Speaker",
+            "Headphone", "Headphones";
+        pin-switches = "Speaker";
         audio-routing =
+            "Speaker", "Speaker Amp OUT",
+            "Speaker Amp IN", "HPH_R",
+            "Headphones", "HPH_L",
+            "Headphones", "HPH_R",
             "AMIC1", "MIC BIAS Internal1",
             "AMIC2", "MIC BIAS Internal2",
             "AMIC3", "MIC BIAS Internal3";
-- 
2.34.1

