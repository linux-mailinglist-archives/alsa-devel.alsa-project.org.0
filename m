Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 388E0252AD4
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 11:54:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C158D170A;
	Wed, 26 Aug 2020 11:54:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C158D170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598435697;
	bh=2t3Hrqr7j+fXDhaWsKES2M9AJ4B5o9Ksuv2iONTbqZ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AXW/QfnW1pKDJYy9kAtGtL7Dqa4B7D6U40id+o5Do5ImfG7ZOnS+WN1Dt3MuJE77r
	 y4Qn6ucRp39zCmKJ6XhueW4i2YgBXDSIgmVCpljdbg93CMfQWSPtJAiHX2O8UV2XIE
	 S3hfgKLOlsuoHZKCi1qsgAKkXQZXLT+7c6acCHR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5FBDF802D2;
	Wed, 26 Aug 2020 11:52:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1566F80257; Wed, 26 Aug 2020 11:52:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21D5CF8016F
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 11:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21D5CF8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="Z3ym7lDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1598435545;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=PtOA7FAw/iEqDUeGc5Ioxizj0fv1lckLU2YvxJLvd3o=;
 b=Z3ym7lDfay+AN12IUzITRHTXV1xoO9W1w+3SqMPS++sYwR+xcfWqU6zXlaaYED3SU8
 yQygjAJWsohf8BVimpmvw7cMebIPkqHWmLt8ijf7jlI2K8AotzWsLtb/dhksmGZbCMOW
 Ay4/JYeLbcQG7pQ1kxGIBgWZwbNBk4Hbzejz9deejJ5WnoMzI3s5VBBqUIA9ejMfZL/p
 bKy7o9vIGGPAfVr9N2Od/GuXdTmit7aue46OOoxjz1ZAJU5j6GMnh7wwBwrE57kLnh41
 zi4CIGJn5l8vG1EYnx+i+MFkx+1DvRhz3LWO4KOv2p8QQiWYLntlQ2jrCH7KLA8qAj3e
 0EyQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6NYn8D"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id g0b6c1w7Q9qHl6V
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 26 Aug 2020 11:52:17 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: qcom: Document "aux-devs" property
Date: Wed, 26 Aug 2020 11:51:40 +0200
Message-Id: <20200826095141.94017-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826095141.94017-1-stephan@gerhold.net>
References: <20200826095141.94017-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

In some cases we need to probe additional audio components that do
not appear as part of the DAI links specified in the device tree.
Examples for this are auxiliary devices such as analog amplifiers
or codecs.

To make them work they need to be added as part of "aux-devs"
and connected to some other audio component using the audio routes
configurable using "(qcom,)audio-routing".

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../devicetree/bindings/sound/qcom,apq8016-sbc.txt        | 7 +++++++
 Documentation/devicetree/bindings/sound/qcom,apq8096.txt  | 8 ++++++++
 Documentation/devicetree/bindings/sound/qcom,sdm845.txt   | 8 ++++++++
 3 files changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
index 84b28dbe9f15..23998262a0a7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
@@ -34,6 +34,13 @@ Required properties:
 			  * DMIC
 			  * Ext Spk
 
+Optional properties:
+
+- aux-devs		: A list of phandles for auxiliary devices (e.g. analog
+			  amplifiers) that do not appear directly within the DAI
+			  links. Should be connected to another audio component
+			  using "qcom,audio-routing".
+
 Dai-link subnode properties and subnodes:
 
 Required dai-link subnodes:
diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
index c814e867850f..e1b9fa8a5bf8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
@@ -55,6 +55,14 @@ This binding describes the APQ8096 sound card, which uses qdsp for audio.
 	Value type: <stringlist>
 	Definition: The user-visible name of this sound card.
 
+- aux-devs
+	Usage: optional
+	Value type: <array of phandles>
+	Definition: A list of phandles for auxiliary devices (e.g. analog
+		    amplifiers) that do not appear directly within the DAI
+		    links. Should be connected to another audio component
+		    using "audio-routing".
+
 = dailinks
 Each subnode of sndcard represents either a dailink, and subnodes of each
 dailinks would be cpu/codec/platform dais.
diff --git a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
index ca8c89e88bfa..de4c604641da 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
@@ -24,6 +24,14 @@ This binding describes the SDM845 sound card, which uses qdsp for audio.
 	Value type: <stringlist>
 	Definition: The user-visible name of this sound card.
 
+- aux-devs
+	Usage: optional
+	Value type: <array of phandles>
+	Definition: A list of phandles for auxiliary devices (e.g. analog
+		    amplifiers) that do not appear directly within the DAI
+		    links. Should be connected to another audio component
+		    using "audio-routing".
+
 = dailinks
 Each subnode of sndcard represents either a dailink, and subnodes of each
 dailinks would be cpu/codec/platform dais.
-- 
2.28.0

