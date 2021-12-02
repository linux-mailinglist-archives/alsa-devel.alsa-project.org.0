Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E8466604
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 15:59:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1A8A23E3;
	Thu,  2 Dec 2021 15:58:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1A8A23E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638457158;
	bh=FufBD11jxvosKADl8PdckR33b9uGEwNTsVBiVhsi3qo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AFEiOMcyp2a+GnKdQbrSwC1+yEz7sVbn9MSJja6hdNvTdW6ArNf1Qu+JgqdcjJX8n
	 XSd0L2Afsg7Vbb1seRYA6r8ZMmjCsTk2FLJq/3kn+CZr1JlrPsDtRFFOSBzc2pe7Mv
	 sfocQBhhxqcg+M9ZMn3FAUzTQ4dzkxTL3gyqoUdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AFEFF804F1;
	Thu,  2 Dec 2021 15:57:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AD60F80290; Thu,  2 Dec 2021 15:57:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1040CF80290
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 15:57:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1040CF80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="FoNgeE12"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638457026;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=A5gpLUQWRwoL/TsaFKZHgKW2VXbUq+LuUyss51S4cqM=;
 b=FoNgeE12Vjn82Lr2OBqhdjyEYLDxV+Z1qPDAmV1Woh4+CatoW9uXUZs2d5hihqc6h1
 jrFbPQ/YNhDyYb7tJRkRmCG6WDX2Bs0t6W8iM37XyrthJm8cTG51pJz+tbS0dBbs/rbL
 eoeR65Q8OG/Z+mY6nuxQzlA8gdoOA2Bz9eSBF8jN1X05XuveCa5jgGDPBCYLM+MkkaCi
 +VX34UJZjNHmDWHGQetj3uHjqAbE3HqNa0utW8HIoIDSsJLjUPLopIzEg+byGQ++8mRP
 KRzvr3Thq9l1g5smgtyEzJnzVLt3oX8sR/jfATJv+gILSvTcxFem5f3YztMwrs+Es6Z/
 9Hug==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyLyu9s="
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.34.10 AUTH)
 with ESMTPSA id j03bcbxB2Ev6pxx
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 2 Dec 2021 15:57:06 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/5] ASoC: dt-bindings: qcom: sm8250: Document "aux-devs"
Date: Thu,  2 Dec 2021 15:55:02 +0100
Message-Id: <20211202145505.58852-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211202145505.58852-1-stephan@gerhold.net>
References: <20211202145505.58852-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
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

The sm8250 audio driver uses the common Qualcomm device tree parser and
therefore already supports the "aux-devs" property that allows adding
additional auxiliary devices to the sound card (e.g. analog speaker
amplifiers that can be connected using "audio-routing").

Document the property in the DT schema for sm8250 as well. The description
is taken from simple-card.yaml which has a very similar property.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index a0f1d7340eb5..3123382297b8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -27,6 +27,12 @@ properties:
       being the connection's source. Valid names could be power supplies,
       MicBias of codec and the jacks on the board.
 
+  aux-devs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandles pointing to auxiliary devices, such
+      as amplifiers, to be added to the sound card.
+
   model:
     $ref: /schemas/types.yaml#/definitions/string
     description: User visible long sound card name
-- 
2.34.1

