Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BB5138280
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jan 2020 17:44:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6EF16AF;
	Sat, 11 Jan 2020 17:43:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6EF16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578761079;
	bh=3aTTo1HQEXuIE5VfKGuqtyelaM7nKlndZEbSyZjoXAw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HOqn+6TzmRAxS4I+k3o5ZXj8/JajUB5mSuqC5naf7JGdKNpeX/MJsQG3esFTDxP+l
	 SOHC+kctB4zgqod4QEgnwLZqAumgOMEhlMMUwV1dmFoMbPzOjSQuLZQ5WkT5gicNJ1
	 dCGv9V8M0VcRZi24lWy9w2Hddke5N1EEbgTxhU6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9473FF8027C;
	Sat, 11 Jan 2020 17:41:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CCC3F8024A; Sat, 11 Jan 2020 17:40:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBF84F801F4
 for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2020 17:40:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBF84F801F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="XFde+TPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578760853;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=xH96kE6CwyN0d8hXUq28tZUl/whMxiw0O/Lxh4Ihb0M=;
 b=XFde+TPyCi7rtxaS2FhoUl4MB6YUMETxf2RQAZmap7SgTshRAeBMa2GF8OMXr04R74
 jGThGhq3FnlvsxPelsZxPNNSik64yZz0x653W/yPJNe1ml/oB3JuQjIDc23Z/S63N0Vd
 2M50oNh3onK3ROFb4IMlD0kZ6gtDIOyObj55qQqy83WZ7jjU0Mlbg9qM/ymSl+5e/dsj
 un0ApBLdv/P0D7AfiIZkPX3UuTbW077pOmVUe902/GEMiThSINVl6Z3SqbZn+dBtjtXP
 leAuEc3FsGyYfIlpI9erddFltktTKvfP/Qv3T5i3l4GSq1yNBAdKWheHILtDuEKuakli
 lZBQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXsMv5qxJRCe0="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.1.4 AUTH)
 with ESMTPSA id h048a6w0BGepFqB
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 11 Jan 2020 17:40:51 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Date: Sat, 11 Jan 2020 17:40:06 +0100
Message-Id: <20200111164006.43074-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200111164006.43074-1-stephan@gerhold.net>
References: <20200111164006.43074-1-stephan@gerhold.net>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Nikita Travkin <nikitos.tr@gmail.com>
Subject: [alsa-devel] [PATCH 4/4] ASoC: msm8916-wcd-analog: Add MIC BIAS
	Internal3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PM8916 has three TX inputs that each have an (optional) internal
RBIAS resistor. MIC BIAS Internal1/2 (for TX1/2) are already supported.
TX3 does not have its own MIC BIAS supply, instead it is also supplied
from MIC BIAS1.

Now that we have simplified the MIC BIAS Internal* implementation
we can easily add support for it:

Add a MIC BIAS Internal3 supply that enables the internal RBIAS
resistor on TX3, and make sure to enable MIC BIAS External1.

Tested-by: Nikita Travkin <nikitos.tr@gmail.com> # longcheer-l8150
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 930baae6eff5..5e452b2457b2 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -852,6 +852,7 @@ static const struct snd_soc_dapm_route pm8916_wcd_analog_audio_map[] = {
 
 	{"MIC BIAS Internal1", NULL, "MIC BIAS External1"},
 	{"MIC BIAS Internal2", NULL, "MIC BIAS External2"},
+	{"MIC BIAS Internal3", NULL, "MIC BIAS External1"},
 	{"MIC BIAS External1", NULL, "INT_LDO_H"},
 	{"MIC BIAS External2", NULL, "INT_LDO_H"},
 	{"MIC BIAS External1", NULL, "vdd-micbias"},
@@ -914,6 +915,9 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
 			    pm8916_wcd_analog_enable_micbias_int2,
 			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
 			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal3", CDC_A_MICB_1_INT_RBIAS, 1, 0,
+			    pm8916_wcd_analog_enable_micbias_int,
+			    SND_SOC_DAPM_PRE_PMU),
 
 	SND_SOC_DAPM_SUPPLY("MIC BIAS External1", CDC_A_MICB_1_EN, 7, 0,
 			    pm8916_wcd_analog_enable_micbias_ext1,
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
