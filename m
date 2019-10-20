Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1A6DDF2A
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Oct 2019 17:34:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A8D5165F;
	Sun, 20 Oct 2019 17:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A8D5165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571585672;
	bh=4bmKz5lqGIW3bdPnIBsFSf1/3uhO/wXlhAnEyp0h8Z4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MNh5owjuIOWOKln1eEw8Uo617WuXg0+CIiDuHr7Rp3gSNeDtsWDC2nnnTL8n9+sTj
	 bw8FZ3T+sBWKPs1QxuYGR+JA9yozTxpMZVXdR1o587DXZPDPc3gWmu+o837DxiTKuz
	 W3se/cny/KGAmmF+APYtGbSWVXk0hu3aLytCrG68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BB93F802FB;
	Sun, 20 Oct 2019 17:32:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50ABDF80322; Sun, 20 Oct 2019 17:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D531EF800C0
 for <alsa-devel@alsa-project.org>; Sun, 20 Oct 2019 17:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D531EF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="QocdKwiH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571585558;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=e/fpoIgjF5iBN328o9VuYHPqVfdp6jIVztdhvMe5KCY=;
 b=QocdKwiHkJ4b3s/9bHfJK33p23r+Lp3J/DdIT6T98F8mGy693SPYlGHzrDFnV0E0j5
 4MA3bxJ/5f1HJ5ytjQfdNHVSdhlL2dMJTFjp/6629F0arrnSUQIUkDPdp7CMYzkPFsEz
 DueWuSKvzW7UKrCw+fOmZS3S6YCTeEZq8xtbIzfrMQAXoAV0CAh3TCcyuGICgJXXedDW
 09MK9iGR+JGvRmnVd58yFnsssXl55HXaXURJuYi8dEAPjVTCtTgeEmW6Gbx2zUDB0OPf
 eNy6IeZRm9+QAbDzdR7QPrPdZ5NHCGCJfXUox7GX2rePCTUbLUBqJCMv6OPP2FJQnn/x
 6HrA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQr4OGUPX+1NiWA3IrA=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
 with ESMTPSA id 409989v9KFWXK6b
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Sun, 20 Oct 2019 17:32:33 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Date: Sun, 20 Oct 2019 17:30:06 +0200
Message-Id: <20191020153007.206070-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH 1/2] ASoC: msm8916-wcd-analog: Fix RX1
	selection in RDAC2 MUX
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

According to the PM8916 Hardware Register Description,
CDC_D_CDC_CONN_HPHR_DAC_CTL has only a single bit (RX_SEL)
to switch between RX1 (0) and RX2 (1). It is not possible to
disable it entirely to achieve the "ZERO" state.

However, at the moment the "RDAC2 MUX" mixer defines three possible
values ("ZERO", "RX2" and "RX1"). Setting the mixer to "ZERO"
actually configures it to RX1. Setting the mixer to "RX1" has
(seemingly) no effect.

Remove "ZERO" and replace it with "RX1" to fix this.

Fixes: 585e881e5b9e ("ASoC: codecs: Add msm8916-wcd analog codec")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 667e9f73aba3..e3d311fb510e 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -306,7 +306,7 @@ struct pm8916_wcd_analog_priv {
 };
 
 static const char *const adc2_mux_text[] = { "ZERO", "INP2", "INP3" };
-static const char *const rdac2_mux_text[] = { "ZERO", "RX2", "RX1" };
+static const char *const rdac2_mux_text[] = { "RX1", "RX2" };
 static const char *const hph_text[] = { "ZERO", "Switch", };
 
 static const struct soc_enum hph_enum = SOC_ENUM_SINGLE_VIRT(
@@ -321,7 +321,7 @@ static const struct soc_enum adc2_enum = SOC_ENUM_SINGLE_VIRT(
 
 /* RDAC2 MUX */
 static const struct soc_enum rdac2_mux_enum = SOC_ENUM_SINGLE(
-			CDC_D_CDC_CONN_HPHR_DAC_CTL, 0, 3, rdac2_mux_text);
+			CDC_D_CDC_CONN_HPHR_DAC_CTL, 0, 2, rdac2_mux_text);
 
 static const struct snd_kcontrol_new spkr_switch[] = {
 	SOC_DAPM_SINGLE("Switch", CDC_A_SPKR_DAC_CTL, 7, 1, 0)
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
