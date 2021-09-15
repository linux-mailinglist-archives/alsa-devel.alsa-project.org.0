Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FFE40C647
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 15:21:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1366A1898;
	Wed, 15 Sep 2021 15:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1366A1898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631712099;
	bh=9K+E+SK+vqoojgaPu5KBpOFt1eYjOH0PyEpX/wx2YH8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s0idewgSP0/9yeDAMOoASEZlWEKUcokUg7joYPPWIOH91KI4i44iZ0BqPy7k0qEBM
	 K3TnoRNjR+GmpUQmZlIGqUTB4Fzq6Gcl0inyqpvNSJ9Iguc1qbpGn/WW60hgizLzA6
	 Ixy9WVoMyQkkxeejrYbmCmVNBTaPkdvi4Td6dWig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 855BAF80539;
	Wed, 15 Sep 2021 15:15:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB505F8055A; Wed, 15 Sep 2021 15:15:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAFC4F80524
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 15:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAFC4F80524
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KDZC78CT"
Received: by mail-wr1-x434.google.com with SMTP id t8so3861156wrq.4
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 06:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZbocYYAT3Bv95I3T0qjmMa3P6s7bL467iC3FMXh3uYY=;
 b=KDZC78CTZMz8tkTc8orpMm1VU96DrHY2yyf/Nxs9/k3HXIdrFJ6YGeygsHaU03at6M
 RIwXyWCt/tuKPlrGCwC9SUOBqMzJ0xAK327YmydqREIapcIAqUBZDYHnV7+GNzRTNpyQ
 WTXz7OB2e42+cHSg509DWSdtphNuDsOhhRzTqUZGvety+m56mUJVZztrT1/l3WcluqzA
 EY7HQ/LtY2yIkcMCApr8+GVia/m5RsnMjxYf7n6HJYckSI4aT8JaZiDFXM9WC9m59cSY
 kw5ecdqhyTNlvgjL/7PGFUTgwmnhGZG3+B8bS/GxCZA3jTWu9pcTzJQXaxz/r8pzYu1U
 ia4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZbocYYAT3Bv95I3T0qjmMa3P6s7bL467iC3FMXh3uYY=;
 b=ItHb5vmLwqc6tHWJiwWmwmRCfKgvevB8Ys8zWfNw868uXGbgTbtcgylnP8+0ciZRU4
 tYg9t2RS+8hT2RRel95tDXzS7xJMcCxlkUZCuWqwNKNYbvFJOnnuzVkIK/azk5oFVqNQ
 ZTzigTclzw3l0ngwhOoOIw2anjBFaVDmGR4pJES/9QDlhuujAxegGvV/dqZSUc+GKFyG
 pIdZtaKCOvPUuo98JDjhw3Fg20Z/KLj5ca+r0LtuuajgqM5+ybUG8s/+yRhRVBZAuu9/
 F+xURfOgGjlhyGo+nDnBHDvl9eIljVNqTefiYe6DxR03UD+roK1pZcaA0DzUv1WNL58G
 jPMA==
X-Gm-Message-State: AOAM531YwpgWn5HNpEVPC4uDMbHovQwtBepESY+l9bcwK2nINCtTlBFw
 2qhzp5JUm5RgK13NttPOS4TkTg==
X-Google-Smtp-Source: ABdhPJxVhiXjcD2NUcgK1N9wks3hqpRTdLC5VtX218bO9z9ugvbEt3IXSaWUpQaM0ZQkfufGBkaWpw==
X-Received: by 2002:adf:f789:: with SMTP id q9mr5018181wrp.367.1631711702873; 
 Wed, 15 Sep 2021 06:15:02 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m29sm14501717wrb.89.2021.09.15.06.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 06:15:02 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v6 17/22] ASoC: qdsp6: audioreach: add Kconfig and Makefile
Date: Wed, 15 Sep 2021 14:13:28 +0100
Message-Id: <20210915131333.19047-18-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
References: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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

Now that all the code for audioreach and q6apm are in at this point to be
able to compile, start adding Kconfig and Makefile changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/Kconfig        | 4 ++++
 sound/soc/qcom/qdsp6/Makefile | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index cc7c1de2f1d9..5a693f83fd6c 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -84,6 +84,9 @@ config SND_SOC_QDSP6_ASM_DAI
 	select SND_SOC_COMPRESS
 	tristate
 
+config SND_SOC_QDSP6_APM
+	tristate
+
 config SND_SOC_QDSP6
 	tristate "SoC ALSA audio driver for QDSP6"
 	depends on QCOM_APR
@@ -97,6 +100,7 @@ config SND_SOC_QDSP6
 	select SND_SOC_QDSP6_ROUTING
 	select SND_SOC_QDSP6_ASM
 	select SND_SOC_QDSP6_ASM_DAI
+	select SND_SOC_QDSP6_APM
 	help
 	 To add support for MSM QDSP6 Soc Audio.
 	 This will enable sound soc platform specific
diff --git a/sound/soc/qcom/qdsp6/Makefile b/sound/soc/qcom/qdsp6/Makefile
index a4191d395557..1a0803d97eec 100644
--- a/sound/soc/qcom/qdsp6/Makefile
+++ b/sound/soc/qcom/qdsp6/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 snd-q6dsp-common-objs := q6dsp-common.o q6dsp-lpass-ports.o q6dsp-lpass-clocks.o
+snd-q6apm-objs := q6apm.o audioreach.o
 
 obj-$(CONFIG_SND_SOC_QDSP6_COMMON) += snd-q6dsp-common.o
 obj-$(CONFIG_SND_SOC_QDSP6_CORE) += q6core.o
@@ -10,3 +11,5 @@ obj-$(CONFIG_SND_SOC_QDSP6_ADM) += q6adm.o
 obj-$(CONFIG_SND_SOC_QDSP6_ROUTING) += q6routing.o
 obj-$(CONFIG_SND_SOC_QDSP6_ASM) += q6asm.o
 obj-$(CONFIG_SND_SOC_QDSP6_ASM_DAI) += q6asm-dai.o
+
+obj-$(CONFIG_SND_SOC_QDSP6_APM) += snd-q6apm.o
-- 
2.21.0

