Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DE52FBD52
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 18:18:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C596618C6;
	Tue, 19 Jan 2021 18:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C596618C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611076691;
	bh=2Nm3OhJd7SqwgowW/wgUOnsdCQ6I3skmiZCS1brxuME=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ONUb8Y8dik/KEtWpA7ZxDqcBEw8hztMpgDvqDCryBsJWcWnUArkpp2fgW4AnpNOG8
	 SexqHSsh8G3UTV4KfNGJ4uaPvl1VzEQChnuzDcnEKStFPOjQU+8aSok0HlG3yhjqQS
	 ofva9N49wEH14YozZ9ZCvdARwS4x2eTtH+DaTEpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37AA2F804C2;
	Tue, 19 Jan 2021 18:15:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 587ABF80272; Tue, 19 Jan 2021 18:15:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69512F80117
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69512F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="k0p5MJow"
Received: by mail-wr1-x430.google.com with SMTP id y17so20498677wrr.10
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 09:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4UPEBqfaefkPq1YYF/lxiReSr4VDehjPvW+E069OjHM=;
 b=k0p5MJow6DmxYg7E8SrqHlPpxHer3kS4GJyXukAg+c9jcxyNp5B+neAVxsRD8cCD2H
 IGDmk+GnPRhZvaX6ty4QfChzd3xZ+AC87q95T+SQcS/Z/zNbdZ7CAyakO3HoNKZBc8kQ
 LOuJjlWECA09sZoRqRyUGep8tp4dByDPJzeoWJghHhyEgGf8dEYpMzFMDVt/wNws+3lq
 XZUZm/GiZ+4oidO1yl9hB118214oKIsOGhDp3JMyMrCXLR8pebnGko268CtHBQf+2jwx
 BPCiTnjMdSby6GwILd7C4ApUSlgS28quhZuuN+/OQNEVZaxk5lHIsrs2lfONocj6SUgH
 8nxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4UPEBqfaefkPq1YYF/lxiReSr4VDehjPvW+E069OjHM=;
 b=lhRWLK3lxHm/O8rtyH56on2/F1+o3bm6RdWhfivOd+oWp/th8imQ8CtA4GrbK8wctI
 asv3K9H4cocruIWcNb23dRx1Ro1bJ+3eX/m/Kakg6UuWqBPQVU3X/uLr1WJJyjceNSik
 KIknrACcBKUuTGEZyGSAVpw5VbvNETcYj2t+jV3VVCnlcs51fAMNFNgOc5A/SrJgb8yA
 2EwnCPTnnEBxFHr/ZKtZMS1OYZIXGyKF80JrE9fSh+ZAv3iIhHy08uDkiAkGc1kdXpwY
 Gw5+RldbkuSfvUO8bwH+qGN1WFh7hWYrbVE6080YXqweK+KvVSyG5AbG2F4EQJegptwp
 7lTQ==
X-Gm-Message-State: AOAM530CO3vn+mH5YhA7ajSma130b6dKSV8bXmhq4arERbzHUM4ZMtSd
 9W/j+LbbcsWRN+EUB2fHLvCX+A==
X-Google-Smtp-Source: ABdhPJxZ6bkSJFnjIvSc9ba5CZO+PNNJP+Ua40XsQOS6FjIVIj2lzcCfAbAk6x2YYG3ZnjhBab1zng==
X-Received: by 2002:a5d:4241:: with SMTP id s1mr5385455wrr.269.1611076541494; 
 Tue, 19 Jan 2021 09:15:41 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x18sm41649358wrg.55.2021.01.19.09.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:15:39 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 2/2] ASoC: qcom: Fix broken support to MI2S TERTIARY and
 QUATERNARY
Date: Tue, 19 Jan 2021 17:15:27 +0000
Message-Id: <20210119171527.32145-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210119171527.32145-1-srinivas.kandagatla@linaro.org>
References: <20210119171527.32145-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 srivasam@codeaurora.org, stephan@gerhold.net, lgirdwood@gmail.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jun Nie <jun.nie@linaro.org>
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

lpass hdmi support patch totally removed support for MI2S TERTIARY
and QUATERNARY.

One of the major issue was spotted with the design of having
separate SoC specific header files for the common lpass driver.
This design is prone to break as an when new SoC header is added
as the common DAI ids of other SoCs will be overwritten by the
new ones.

Having a common header qcom,lpass.h should fix the issue and any new
DAI ids should be added to the common header.

With this change lpass also needs a new of_xlate function to resolve
dai name.

Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
Reported-by: Jun Nie <jun.nie@linaro.org>
Reported-by: Stephan Gerhold <stephan@gerhold.net>
Tested-by: Srinivasa Rao <srivasam@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c      | 22 ++++++++++++++++++++++
 sound/soc/qcom/lpass-platform.c | 12 ++++++++++++
 sound/soc/qcom/lpass-sc7180.c   |  9 +++------
 sound/soc/qcom/lpass.h          |  2 +-
 4 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index af539e0d7e56..ae8efbc89af2 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -344,8 +344,30 @@ int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai)
 }
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_probe);
 
+static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
+				   struct of_phandle_args *args,
+				   const char **dai_name)
+{
+	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
+	struct lpass_variant *variant = drvdata->variant;
+	int id = args->args[0];
+	int ret = -EINVAL;
+	int i;
+
+	for (i = 0; i  < variant->num_dai; i++) {
+		if (variant->dai_driver[i].id == id) {
+			*dai_name = variant->dai_driver[i].name;
+			ret = 0;
+			break;
+		}
+	}
+
+	return ret;
+}
+
 static const struct snd_soc_component_driver lpass_cpu_comp_driver = {
 	.name = "lpass-cpu",
+	.of_xlate_dai_name = asoc_qcom_of_xlate_dai_name,
 };
 
 static bool lpass_cpu_regmap_writeable(struct device *dev, unsigned int reg)
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index d1c248590f3a..0074b7f2dbc1 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -257,6 +257,9 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 		break;
 	case MI2S_PRIMARY:
 	case MI2S_SECONDARY:
+	case MI2S_TERTIARY:
+	case MI2S_QUATERNARY:
+	case MI2S_QUINARY:
 		ret = regmap_fields_write(dmactl->intf, id,
 						LPAIF_DMACTL_AUDINTF(dma_port));
 		if (ret) {
@@ -507,6 +510,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 			break;
 		case MI2S_PRIMARY:
 		case MI2S_SECONDARY:
+		case MI2S_TERTIARY:
+		case MI2S_QUATERNARY:
+		case MI2S_QUINARY:
 			reg_irqclr = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_irqclr = LPAIF_IRQ_ALL(ch);
 
@@ -559,6 +565,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 			break;
 		case MI2S_PRIMARY:
 		case MI2S_SECONDARY:
+		case MI2S_TERTIARY:
+		case MI2S_QUATERNARY:
+		case MI2S_QUINARY:
 			reg_irqen = LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_mask = LPAIF_IRQ_ALL(ch);
 			val_irqen = 0;
@@ -655,6 +664,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	break;
 	case MI2S_PRIMARY:
 	case MI2S_SECONDARY:
+	case MI2S_TERTIARY:
+	case MI2S_QUATERNARY:
+	case MI2S_QUINARY:
 		map = drvdata->lpaif_map;
 		reg = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
 		val = 0;
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index 85db650c2169..8c168d3c589e 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -20,7 +20,7 @@
 #include "lpass.h"
 
 static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
-	[MI2S_PRIMARY] = {
+	{
 		.id = MI2S_PRIMARY,
 		.name = "Primary MI2S",
 		.playback = {
@@ -44,9 +44,7 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
 		},
 		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
-	},
-
-	[MI2S_SECONDARY] = {
+	}, {
 		.id = MI2S_SECONDARY,
 		.name = "Secondary MI2S",
 		.playback = {
@@ -60,8 +58,7 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
 		},
 		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
-	},
-	[LPASS_DP_RX] = {
+	}, {
 		.id = LPASS_DP_RX,
 		.name = "Hdmi",
 		.playback = {
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 0195372905ed..2d68af0da34d 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -12,7 +12,7 @@
 #include <linux/compiler.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <dt-bindings/sound/sc7180-lpass.h>
+#include <dt-bindings/sound/qcom,lpass.h>
 #include "lpass-hdmi.h"
 
 #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
-- 
2.21.0

