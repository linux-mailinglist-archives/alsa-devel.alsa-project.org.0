Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC4B2ED4D1
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 17:54:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04A1216A2;
	Thu,  7 Jan 2021 17:53:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04A1216A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610038467;
	bh=mLOwDjLO1lqEx9Ucq3B3agP9XbEDIePWBOGu2yRJU08=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A4VAI5HQ/WSRLu9RpteusDzcl05UV1yWbnM/71R4554/PQJBm3Espr7mLOoiNBDzC
	 KsVtceX/Wz7frFTXZrmUTnexNxEp9owhaPv3KAYdnfUDjglDqYCHWnqwrEbceVe+mm
	 4l3sMxRv9a9LQqvPkh+rj0JaO5YFOAjc8SnOpZp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85462F80268;
	Thu,  7 Jan 2021 17:52:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0499FF80258; Thu,  7 Jan 2021 17:52:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52D44F800FD
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 17:52:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52D44F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="mnu/KX/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610038364;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
 bh=RC6LXZjHBesuyu3f6IHE2ALIoaQ4uWLoUTmD0oDXzBw=;
 b=mnu/KX/fOGGbiGC/5UVP0oskcjDANKD0pcx4vNGUbdv8KPeJb8qcPM7PPImznzqP/c
 UbuzJPd5ajwzFI7whAiwbQNYeMM5TB6KO8CdFyBrB/aHAh04Eu+q7TyuGkjAxVuMkx7D
 lyWV4u0lCV6VOIgOFBDJmUuqquabj/m+mgQiD5sOyC4jWBDXBozpJDRKw2e/HVVXjjTf
 /zDwUeGmEKDAFIJdK8lFlD/hdmFRo8d0VbV7Eq/v8TviUmc/+wUbPIXtkKyE/EhF8ZBL
 DoTDlYQak/YB/TFqVqryqWB/bruRdD+Du1/XStx2BtExcJgHtC0keEh1MPPNcTxcuB1t
 UdPw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB6m6NPwkA"
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id R0a218x07Gqg6Dg
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 7 Jan 2021 17:52:42 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] ASoC: hdmi-codec: Fix return value in hdmi_codec_set_jack()
Date: Thu,  7 Jan 2021 17:51:31 +0100
Message-Id: <20210107165131.2535-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, Cheng-Yi Chiang <cychiang@chromium.org>
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

Sound is broken on the DragonBoard 410c (apq8016_sbc) since 5.10:

  hdmi-audio-codec hdmi-audio-codec.1.auto: ASoC: error at snd_soc_component_set_jack on hdmi-audio-codec.1.auto: -95
  qcom-apq8016-sbc 7702000.sound: Failed to set jack: -95
  ADV7533: ASoC: error at snd_soc_link_init on ADV7533: -95
  hdmi-audio-codec hdmi-audio-codec.1.auto: ASoC: error at snd_soc_component_set_jack on hdmi-audio-codec.1.auto: -95
  qcom-apq8016-sbc: probe of 7702000.sound failed with error -95

This happens because apq8016_sbc calls snd_soc_component_set_jack() on
all codec DAIs and attempts to ignore failures with return code -ENOTSUPP.
-ENOTSUPP is also excluded from error logging in soc_component_ret().

However, hdmi_codec_set_jack() returns -E*OP*NOTSUPP if jack detection
is not supported, which is not handled in apq8016_sbc and soc_component_ret().
Make it return -ENOTSUPP instead to fix sound and silence the errors.

Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Fixes: 55c5cc63ab32 ("ASoC: hdmi-codec: Use set_jack ops to set jack")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2:
  - Replace -EOPNOTSUPP check with -ENOTSUPP in imx-hdmi.c
---
 sound/soc/codecs/hdmi-codec.c | 2 +-
 sound/soc/fsl/imx-hdmi.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index d5fcc4db8284..0f3ac22f2cf8 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -717,7 +717,7 @@ static int hdmi_codec_set_jack(struct snd_soc_component *component,
 			       void *data)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
-	int ret = -EOPNOTSUPP;
+	int ret = -ENOTSUPP;
 
 	if (hcp->hcd.ops->hook_plugged_cb) {
 		hcp->jack = jack;
diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index ede4a9ad1054..dbbb7618351c 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -90,7 +90,7 @@ static int imx_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	ret = snd_soc_component_set_jack(component, &data->hdmi_jack, NULL);
-	if (ret && ret != -EOPNOTSUPP) {
+	if (ret && ret != -ENOTSUPP) {
 		dev_err(card->dev, "Can't set HDMI Jack %d\n", ret);
 		return ret;
 	}
-- 
2.30.0

