Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE10A13070F
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 11:32:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22B1D175B;
	Sun,  5 Jan 2020 11:31:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22B1D175B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578220331;
	bh=PrhBcYIrBEUIMLXonM5zdimcVnWxWebDxGO1Sel1JyQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Trnyp0qCYK3rB2fcQo76AjVGUkZoW0Tjs3TjBbFa/UuC5XxNkQZuLy+WotFZRH4qG
	 WsPz+YZBRpa98IZpTR25BlobWEOQy2lHC5j12L2TCE6h3OKRZxebkMGbP1B3pUJIcu
	 CeyTq7B3po8vlJoXPrFtOnWaX3yOPpmP8+6h+31o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46145F80140;
	Sun,  5 Jan 2020 11:30:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07E6EF8014A; Sun,  5 Jan 2020 11:30:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21AC8F80116
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 11:30:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21AC8F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="YZEUAcn0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578220218;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=gQC4SVtvG3w+YvT0dKEUIxZ7DERKWyeqx0P+BgLZnic=;
 b=YZEUAcn0y1L9UeZouiol6tEYgzjxWioc7eqxN8jWtiTP7dOYlUW5PjiwFT1wVMNO9h
 ZY+xg/EFe4asOjLX3VRCt/tcfIXtBSa/BYVz11Y7FSpX99UjjZ68IvjDtpoPCBet2oZJ
 55eMxbRtTWZT04Wb/LG9A8qEJ2mBxjPW3hp7f8LQyT7ESAdei9R8NuThJsGYPdO5RogA
 FVUPftUzTyR2yx2LrUlxdGNf268lWDBXT/TmJNuBWkxHKbt0B0+lcw/Sa6N8en2Z6gcd
 pA4wzyGqpgTxFinp15yE0ZDzhKnQpb/kyzu/1C+mSNQSNEoOAwMWMN6jhZrL2N5Tx6oK
 +PLg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXs8/vtBE1"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.1.3 AUTH)
 with ESMTPSA id z012abw05AUFikw
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 5 Jan 2020 11:30:15 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Date: Sun,  5 Jan 2020 11:27:53 +0100
Message-Id: <20200105102753.83108-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: [alsa-devel] [PATCH] ASoC: msm8916-wcd-digital: Reset RX
	interpolation path after use
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

For some reason, attempting to route audio through QDSP6 on MSM8916
causes the RX interpolation path to get "stuck" after playing audio
a few times. In this situation, the analog codec part is still working,
but the RX path in the digital codec stops working, so you only hear
the analog parts powering up. After a reboot everything works again.

So far I was not able to reproduce the problem when using lpass-cpu.

The downstream kernel driver avoids this by resetting the RX
interpolation path after use. In mainline we do something similar
for the TX decimator (LPASS_CDC_CLK_TX_RESET_B1_CTL), but the
interpolator reset (LPASS_CDC_CLK_RX_RESET_CTL) got lost when the
msm8916-wcd driver was split into analog and digital.

Fix this problem by adding the reset to
msm8916_wcd_digital_enable_interpolator().

Fixes: 150db8c5afa1 ("ASoC: codecs: Add msm8916-wcd digital codec")
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Tested on msm8916-samsung-a5u:
  - qdsp6 does no longer stop working after playing audio a few times
  - lpass-cpu is still working fine (no difference)
---
 sound/soc/codecs/msm8916-wcd-digital.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
index 58b2468fb2a7..09fccacadd6b 100644
--- a/sound/soc/codecs/msm8916-wcd-digital.c
+++ b/sound/soc/codecs/msm8916-wcd-digital.c
@@ -586,6 +586,12 @@ static int msm8916_wcd_digital_enable_interpolator(
 		snd_soc_component_write(component, rx_gain_reg[w->shift],
 			      snd_soc_component_read32(component, rx_gain_reg[w->shift]));
 		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component, LPASS_CDC_CLK_RX_RESET_CTL,
+					      1 << w->shift, 1 << w->shift);
+		snd_soc_component_update_bits(component, LPASS_CDC_CLK_RX_RESET_CTL,
+					      1 << w->shift, 0x0);
+		break;
 	}
 	return 0;
 }
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
