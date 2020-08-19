Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E7C249930
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 11:19:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D8B31831;
	Wed, 19 Aug 2020 11:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D8B31831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597828781;
	bh=tJSP5OFOrmLv72YyzMbpihFggnmPdL4eX4KmW6kGvHA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cHg2CCaBwYU2LUuE9sFX/4yiH1ooRuxUCIVhR1CN0pXBPaHzY/DdSI2EfzG7qH55T
	 ljoqq48r1CSsWHL/fymnuLxzhFXBj6v0tlvOzKr57ef05hkT+tVvzKIbuQR88BmK7y
	 1abHozROqHMeqdXHiSpkuZhIcABUJhfXxYlNlZ6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F03DF802C2;
	Wed, 19 Aug 2020 11:17:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF666F802A9; Wed, 19 Aug 2020 11:17:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B21AF8011C
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 11:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B21AF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="hrRCfeuE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597828623;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=O63GLG7sddoCYObzLYc9FbVF3AO3J5EaI5KdyvqBGk8=;
 b=hrRCfeuEGj9Vq4pUDteVYUJXQSA86fFdNkl+ixrqTG+R5p584BN5I33Wp56Og75LCB
 kZuLxujJNiU7NONi6VcGnnZuAAsn7SvdcYSAkosGjqLEnkWvl5Y3xVWJ0VHEXYV9llNT
 eDCjuitbQEAbLML5Tz1jAC9jsp2qil84P5BMYsAfSVRf8HySbHax+LuXL0Ua+doMpMg2
 oTlC55JO9I5X5hoduuIzFfdpmGmZeLmcY6Tii7fW9IboftJRq9a8PdNg3FFoGcaqIZGF
 81sPGBMl5zDgLghoTfzK9Vq014p+w3JAEajmqPDjAuS/WwQ/Vr7JwQ7cXnHQ61NFflqY
 +nAA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NDwQo"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id g0b6c1w7J9Gu0SU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 19 Aug 2020 11:16:56 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: qcom: common: Parse auxiliary devices from device
 tree
Date: Wed, 19 Aug 2020 11:15:33 +0200
Message-Id: <20200819091533.2334-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819091533.2334-1-stephan@gerhold.net>
References: <20200819091533.2334-1-stephan@gerhold.net>
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

The ASoC core provides a way to probe these components by adding
them to snd_soc_card->aux_dev. We can use the snd_soc_of_parse_aux_devs()
function to parse them from the device tree.

As an example for this, some MSM8916 smartphones have an analog
speaker amplifier connected to the HPHR output. With the new property
this can be modelled as follows:

	speaker-amp: audio-amplifier {
		compatible = "simple-audio-amplifier";
		enable-gpios = <&msmgpio 114 GPIO_ACTIVE_HIGH>;
		sound-name-prefix = "Speaker Amp";
	};

	&sound {
		aux-devs = <&speaker_amp>;
		audio-routing = "Speaker Amp IN", "HPHR";
	};

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/qcom/common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 5194d90ddb96..fe6e778c31c0 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -39,6 +39,10 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			return ret;
 	}
 
+	ret = snd_soc_of_parse_aux_devs(card, "aux-devs");
+	if (ret)
+		return ret;
+
 	/* Populate links */
 	num_links = of_get_child_count(dev->of_node);
 
-- 
2.28.0

