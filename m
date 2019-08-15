Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0789B8F1EE
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:18:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93CE61675;
	Thu, 15 Aug 2019 19:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93CE61675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889490;
	bh=pPqSp1Cu8uE710JIO/BOPyk8SbjtYN39EqbZndI1Syw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jfHqJ+N9DGYzH+15RyQiB/N8L91N+f49Zoa3D+2/2Ib8RptyhtO+sWt6+8AICJGKv
	 7Xuza7rFivmkEMhC7fRqLk+fH1VqfkcadxQ5AEM8TobEzDN6ap9E0J2xKrQceacNph
	 I4HUl242OlKLg97ZEaL5x7Ckr6dS9HFuV6XOdL/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E45CF80274;
	Thu, 15 Aug 2019 19:14:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 264DEF8063D; Thu, 15 Aug 2019 19:14:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f98.google.com (mail-wr1-f98.google.com
 [209.85.221.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51349F804CA
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51349F804CA
Received: by mail-wr1-f98.google.com with SMTP id g17so2869321wrr.5
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=qovknBoKtVI0RTqSEtazh/DeoHQ6VEX0soV/hE572Po=;
 b=HEqqgiPtpX2RVIfAqyw4Hp7oYdezpP0XzG5vRQYZFsg3YzyBiwlXsLCSyBPIPDBekA
 xntSGcQVbrEDFV3GciCK0VarNRwXv0rClrFGKZ5b0uwdMlA3Wxvp/kLQUfdTmHAM0Duz
 NS4QOCCbn4IuTFgLudw1B2jAbgUy1CMVdmtGXx0cm7tTSd46w5A1dKfZdWz1ASVn+juC
 NIdsEtH97x85b6FkSgP6bZJ6qa3pFBtMI8eamVfIawugfr8PCVUDvQEoJ/hlHcc0Y+KY
 caz/MlHRTg7vzkbFQpO9eiS5pSzmUCN+hC6ilVhKoXYL21amf/7nVrxFYPIi6XelCxQn
 q2dQ==
X-Gm-Message-State: APjAAAVnMW1dYMapTgBwh8DeZBVIpIMOoFNwnPnJn+h722ucaxM1c4uz
 NEtgpjXXPViCIxOryxyZd7yLjTsFo8zZ7aT3QM5X6YsGPLaq6NVy6nTnVYvEG/VnBw==
X-Google-Smtp-Source: APXvYqybw93ta4b+RPK07+rB4C4lUSDM+YPhjy1BY+u+bpMfB8ECRx2wugyWxHtLkI0dSr7g13tXxPdZyyXr
X-Received: by 2002:a5d:678a:: with SMTP id v10mr6334633wru.116.1565889263262; 
 Thu, 15 Aug 2019 10:14:23 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id 35sm68304wri.7.2019.08.15.10.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:23 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKQ-00051D-UT; Thu, 15 Aug 2019 17:14:23 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 69F812742BD6; Thu, 15 Aug 2019 18:14:22 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190815092547.29564-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171422.69F812742BD6@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:22 +0100 (BST)
Cc: kstewart@linuxfoundation.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>,
 tglx@linutronix.de
Subject: [alsa-devel] Applied "ASoC: 88pm860x: remove unused variables
	'pcm_switch_controls' and 'aif1_mux'" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: 88pm860x: remove unused variables 'pcm_switch_controls' and 'aif1_mux'

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 12f0bfadf69bb154052722e7e4e5cd1639044c76 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Aug 2019 17:25:47 +0800
Subject: [PATCH] ASoC: 88pm860x: remove unused variables 'pcm_switch_controls'
 and 'aif1_mux'

sound/soc/codecs/88pm860x-codec.c:533:38: warning:
 pcm_switch_controls defined but not used [-Wunused-const-variable=]
sound/soc/codecs/88pm860x-codec.c:560:38: warning:
 aif1_mux defined but not used [-Wunused-const-variable=]

They are never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190815092547.29564-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/88pm860x-codec.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
index e982722b448e..00b2c43d28a1 100644
--- a/sound/soc/codecs/88pm860x-codec.c
+++ b/sound/soc/codecs/88pm860x-codec.c
@@ -529,10 +529,6 @@ static const struct snd_kcontrol_new pm860x_snd_controls[] = {
  * DAPM Controls
  */
 
-/* PCM Switch / PCM Interface */
-static const struct snd_kcontrol_new pcm_switch_controls =
-	SOC_DAPM_SINGLE("Switch", PM860X_ADC_EN_2, 0, 1, 0);
-
 /* AUX1 Switch */
 static const struct snd_kcontrol_new aux1_switch_controls =
 	SOC_DAPM_SINGLE("Switch", PM860X_ANA_TO_ANA, 4, 1, 0);
@@ -549,17 +545,6 @@ static const struct snd_kcontrol_new lepa_switch_controls =
 static const struct snd_kcontrol_new repa_switch_controls =
 	SOC_DAPM_SINGLE("Switch", PM860X_DAC_EN_2, 1, 1, 0);
 
-/* PCM Mux / Mux7 */
-static const char *aif1_text[] = {
-	"PCM L", "PCM R",
-};
-
-static SOC_ENUM_SINGLE_DECL(aif1_enum,
-			    PM860X_PCM_IFACE_3, 6, aif1_text);
-
-static const struct snd_kcontrol_new aif1_mux =
-	SOC_DAPM_ENUM("PCM Mux", aif1_enum);
-
 /* I2S Mux / Mux9 */
 static const char *i2s_din_text[] = {
 	"DIN", "DIN1",
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
