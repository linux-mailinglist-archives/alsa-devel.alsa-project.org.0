Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E696D241A0B
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 13:00:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 835261616;
	Tue, 11 Aug 2020 12:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 835261616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597143624;
	bh=Dawxd9glr6dCk0Vwqj8fSr3gM5YokkGMjiR18uMIyzI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aalu6IpFf/g3M0pMiZNFucKLiKCC5w89XhCKeb0vTUxIFFx5bSi9MjS70EBPO03mk
	 FJCf/m9XVjCHrl8qzWOH24LqRxpt/yBt1+ByJd2p29W6pq1ZBkM8yM2FC++rpQRVEj
	 9WDMlDLQtr80q6Koj4RhnbFvMLAC83OKYrBYcllM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DC4DF80161;
	Tue, 11 Aug 2020 12:58:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DF34F8014C; Tue, 11 Aug 2020 12:58:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 646BCF800D3
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 12:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 646BCF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZHQtGDX2"
Received: by mail-ej1-x641.google.com with SMTP id a26so12626432ejc.2
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 03:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Mdhgy2g8j34bV9EDBbB+YPJSYmiPaq1UApYM7OjSXk=;
 b=ZHQtGDX2EI+RREM5Bwzv6uSg1CEk5rSCRfXufWT0l75+UU8uz+ajv0/nWK3vdtsBut
 zNNjX9B83cd2u7uT8+7qM9EE6aNoItCD8TQEuAdk99OVg8Os7o8XYrZoreK48bPCDi+R
 8AHS4gOov1ma8bOQWNS3MEIoQ8e7wEA2Zp1VEGMQzOQfJHV73JSR9/bvUC/UJoc6N6Av
 VNJdxF6vgIiIDGPXzfG3rVXhQOhUo6I0zQdT4fusEXgr07FsCQhYv+oKER8mAGSiavU9
 ZR2cyFCvkmAUYeKoFmQvdsZlU1GQgIZkIhaOFIzLNz0Urb9vVE89qtfqEmy0qnNwKVRA
 SfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Mdhgy2g8j34bV9EDBbB+YPJSYmiPaq1UApYM7OjSXk=;
 b=VryO41+k81oQbVMq1XcqIB4JQoxp9arL6/DtaI+ua35R67l0gMVtzP9s291zbTv9tR
 zgtprRIZr0VV4rdKgEDtSdmQJ3RElhMUCMsYdw7pDnsUSBPfA0NjjlEIwtPROpZztFMn
 ofEWQqitGdYr9MyrEUk0QV+sgIoVFRIIif3aOFEgOaXRBb5fdHoK+5k68nqLIy00Flt9
 DraIfdS/c7gIbM9gbVCj4BN7hmphrml1Q+i/DCEJnDDTWN/b8IU9sszmw5x+QvJfnRoH
 ID4gO9K9+IHvkkYVynUVGwTa44I1KVvYU7WLKBO4l6X6pR1CeFC3/Lmo9ChpDtnT4lay
 jeug==
X-Gm-Message-State: AOAM532F1FYIcearDPixTOro5WQ+6LsrzHuu1H3lExQwavD6V1Efrd+k
 Tsog3hCHLCX3QqalwL/Z7Nzc+izWK0w=
X-Google-Smtp-Source: ABdhPJwaUA9aebRz4I71p+CtFQOyjlyFO6qO7PpLBsUyccpKKuLHPYricqFnO59v9/xWlARFGEzN6Q==
X-Received: by 2002:a17:907:4064:: with SMTP id
 nl4mr25602875ejb.342.1597143510319; 
 Tue, 11 Aug 2020 03:58:30 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id e14sm14248436edl.86.2020.08.11.03.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 03:58:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: qcom: add a dedicated menuconfig
Date: Tue, 11 Aug 2020 11:58:18 +0100
Message-Id: <20200811105818.7890-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, john.stultz@linaro.org
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

Currently list of Qualcomm drivers is growing, so put them in to a
proper menu so that it does not mix up with other ASOC configs in menuconfig.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/Kconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 5d6b2466a2f2..be6b8d0e2f70 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -1,11 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SND_SOC_QCOM
+menuconfig SND_SOC_QCOM
 	tristate "ASoC support for QCOM platforms"
 	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Say Y or M if you want to add support to use audio devices
 	  in Qualcomm Technologies SOC-based platforms.
 
+if SND_SOC_QCOM
+
 config SND_SOC_LPASS_CPU
 	tristate
 	select REGMAP_MMIO
@@ -26,7 +28,6 @@ config SND_SOC_LPASS_APQ8016
 
 config SND_SOC_STORM
 	tristate "ASoC I2S support for Storm boards"
-	depends on SND_SOC_QCOM
 	select SND_SOC_LPASS_IPQ806X
 	select SND_SOC_MAX98357A
 	help
@@ -35,7 +36,6 @@ config SND_SOC_STORM
 
 config SND_SOC_APQ8016_SBC
 	tristate "SoC Audio support for APQ8016 SBC platforms"
-	depends on SND_SOC_QCOM
 	select SND_SOC_LPASS_APQ8016
 	select SND_SOC_QCOM_COMMON
 	help
@@ -110,3 +110,5 @@ config SND_SOC_SDM845
 	  To add support for audio on Qualcomm Technologies Inc.
 	  SDM845 SoC-based systems.
 	  Say Y if you want to use audio device on this SoCs.
+
+endif #SND_SOC_QCOM
-- 
2.21.0

