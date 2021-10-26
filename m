Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A3643B126
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 13:22:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83AD2171D;
	Tue, 26 Oct 2021 13:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83AD2171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635247348;
	bh=yh7/jBE/ugWh6oZWpDa5qP4ZeP0z0wdFRiu0hv2Seik=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jLx+NlCMTFdocAev/NPJKQKK4wput8R5eAEjrMFYSPoUIVmL0eNoGhHuABSbZEVVQ
	 8SIIVG+5wt6CNF63XunX1yNNAbfWg1DAYKePdNGTDswVYSgQkoWULbbqUqH08FUjRM
	 XeQcC+ydeMfrAOO1sEZbbUA87xjhVQS0AK+d9oB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E19E0F80552;
	Tue, 26 Oct 2021 13:18:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07304F80536; Tue, 26 Oct 2021 13:17:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEEA0F804E7
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 13:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEEA0F804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EvJuBKvT"
Received: by mail-wm1-x32d.google.com with SMTP id
 136-20020a1c008e000000b0032ccae3b331so1162537wma.0
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 04:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4VxZXnKS9YtNHxd0gj3h59SMAN46hPXrE6hl+KuwiZE=;
 b=EvJuBKvT2o9vy3vGWv+zsps7B+OKCAmCFVaA/wa/6VBQxs00eETwt0nLqqAoMmTbg1
 kjBpijGbyavDO3ers9SE8SUTaFltyFx6HRNlwPgGUvE+3XNROnI1CKH2PT/NwZGNc/w1
 NsJ4Spb0AwCv7xhV1yJCHbvYMcFqwIV6z4QRlsH1L6nnvrGXbXmN5ZvtCq8jskK/SekW
 KeS/QaleLQZn+V5+4jrJYiBQc/EJWTh+WChAlWuXPC45Y/P0dB9D29ff+2L8Lui4S7U8
 J1b1e0/MCwRXiSP3Txw/83tzA4CL2y/iqDwD66WKKhUIN6h6mlmoWl0fBI9Wa7aiBUOp
 XGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4VxZXnKS9YtNHxd0gj3h59SMAN46hPXrE6hl+KuwiZE=;
 b=qj2kLDW1XUIUVaH+aSl5ZqxIhXqYfgMhLxTLjsOuPiPnkb1Mjk01qB5gidBFLd6qED
 MC2EcGKMi/Dih2zb9520oKmu+4E1tUA+wf3PO4r420TPqQFHcK0wHi/fRvA96He1fch2
 FURHUkjkUlWhNLQ4jRfj3TFQ+vuBX29/xM0ljEH10ibLPtTqWR4jqeBtCjw+cHhubTlO
 P6xrILfzo8MXbFD+YmzISpRzjRspYoPthYtebByj4w2wm9ElZhhdoQMg1FfX0aGdqBM7
 lbI/ep7PknfmyLe8Fu7eMrlRcKk8/4eIEe0BMSQ7WMKdpZ6K9LW8+rC3yz7A/c1FgKTp
 5KOw==
X-Gm-Message-State: AOAM5313pafT9Qy++FP35q40oe75NET9dpN5YiHp/yMWHx9TPM/j/rKA
 yDt0S3GpP9CuBypKdXAIB2D5Hw==
X-Google-Smtp-Source: ABdhPJxC5TZkwmleMND8WnXE7E92XE9Zwb9ksYOaRNKAmy7SkXRITJU5raZY0oBzVXhjwUNg7M2YGQ==
X-Received: by 2002:a05:600c:a0b:: with SMTP id
 z11mr58572168wmp.147.1635247045270; 
 Tue, 26 Oct 2021 04:17:25 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id l124sm355483wml.8.2021.10.26.04.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 04:17:24 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [PATCH v11 12/17] ASoC: qdsp6: audioreach: add Kconfig and Makefile
Date: Tue, 26 Oct 2021 12:16:50 +0100
Message-Id: <20211026111655.1702-13-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211026111655.1702-1-srinivas.kandagatla@linaro.org>
References: <20211026111655.1702-1-srinivas.kandagatla@linaro.org>
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
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

