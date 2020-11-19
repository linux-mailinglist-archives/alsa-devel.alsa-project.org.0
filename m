Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2372E2B9291
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 13:33:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B4671709;
	Thu, 19 Nov 2020 13:32:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B4671709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605789223;
	bh=ZAZ9/2tIK2Pt/ejTfqJ1Opv4hGPNlQie8a2sR6KJClM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OAfdoEIZnhOO634IUhM2816hW83Ep0DOFvMxtA3xS72F58x6yXEotM2WXJbtJ9NqM
	 631FzBm/uI97EaYNmAufpkvx7F1bc6BikyOPd75kCh6sAUsJ7+b/b6UjM7kDsZnYiE
	 msg1/Jto9dXwxXe9GtSh0hiuURxDQym4S6KiEGgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BA0FF801F5;
	Thu, 19 Nov 2020 13:32:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1A81F8015A; Thu, 19 Nov 2020 13:32:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15414F8015A
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 13:31:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15414F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="B/MIgCpu"
Received: by mail-lf1-x143.google.com with SMTP id v144so7930164lfa.13
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 04:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CzGCpiN8DDCXB/TDfvykQudKt+j67A7n1K8JxIu4JHI=;
 b=B/MIgCpuCvn1TPuZ/1KshVQ/w0EICGlUb/sM/OzYnYXJBjKsxjOt9fXEw9fnJ9uBrj
 0TjkQWyIUMem3xj7jg58MOdqi0GpFXBRuwDDiMdapcosnOtAVUF4Rw1kG4tvVyftokf2
 6FPgQabmxCqduNSqKaigr9YoU5B+dU8oIOSNnqKvl5FZuaGwb4uaVIvIhir9xP2Fb2ji
 cLVPJnbA/1G+kgGyndzwORq6FJ2NDL8pQOPue12/N4mR6Eh3aa7tojJArH3d6u6YojRG
 giVxQuHwue5m3sjSm4hBNUtwJlBiyNkTYl3Q5xjwq5OZ9FjR6iqmPgklBCjZVR++1gh8
 nM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CzGCpiN8DDCXB/TDfvykQudKt+j67A7n1K8JxIu4JHI=;
 b=EdodlG8q0dF+ubiVpP/ImBS1eBAX4qzINTIgZI9pT5GE9evUr3RXg47WbNG4cItjIF
 Tq74M95UXLUYblFVbOQ2Xvy91ZzYSNrr7CIsvHnVaUHvDdKaB+MJjfM67Tf3aWNlNpDj
 T0sLnNQiEUpbgqRXQ5e78miIq2oMbBEwbjrZX9xJCQVAzv2S2llDIEVh/CeFH3sM73db
 V8GOHeo2/ymtbEqVWCt20S9WtiLzc6XVXBb4N+hrFpme7X5jOq6St1Jic2Ddlp6kwKZW
 kBX0iJTQI6ShQK7DcgYsOwb2R61HVWptACfW1+7X4T+KSGTOx5JkPyBpZPaBVKCUWzYq
 ZRRg==
X-Gm-Message-State: AOAM532NQjAq8ib7Pj054rrFih5aFH5fGLJVnYEA1sjEjagLb0ISo/XM
 +e7azUuw7eFMl/KKaJrxaui+bQ==
X-Google-Smtp-Source: ABdhPJzgtIm/m55OCqiC93oYLiHLfdCfcgaiKk5l5vbCYmhMJIL2aGDS3Vp96XgOt/V/iqjKB1gj/Q==
X-Received: by 2002:ac2:563a:: with SMTP id b26mr5462533lff.596.1605789108951; 
 Thu, 19 Nov 2020 04:31:48 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.108])
 by smtp.gmail.com with ESMTPSA id u28sm3962495lfn.102.2020.11.19.04.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 04:31:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: qcom: sm8250: fix HDMI audio playback
Date: Thu, 19 Nov 2020 15:31:45 +0300
Message-Id: <20201119123145.709891-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
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

Current code does not setup CPU dai (causing -EIO errors on playback)
and does not pass SND_SOC_DAIFMT_I2S to codec fmt (causing i2s-hifi
errors). Fix both errors to enable HDMI audio playback on SM8250. Tested
on RB5 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: aa2e2785545a ("ASoC: qcom: sm8250: add sound card qrb5165-rb5 support")
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sm8250.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 35c9ad11edff..314e3e566d6d 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -36,6 +36,7 @@ static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 
 static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 {
+	unsigned int fmt = SND_SOC_DAIFMT_CBS_CFS;
 	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBS_CFS;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
@@ -43,10 +44,11 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 
 	switch (cpu_dai->id) {
 	case TERTIARY_MI2S_RX:
-		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF;
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		snd_soc_dai_set_sysclk(cpu_dai,
 			Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
 			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	default:
-- 
2.29.2

