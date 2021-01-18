Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E02E12FA6A3
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 17:48:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AE52172B;
	Mon, 18 Jan 2021 17:47:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AE52172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610988507;
	bh=lpEBtkolrEzfkpxXgheQktqQ1M3+aNPvetuqHZAXJu8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pnpC7Z+ZD1bnd0RT+X3LNvKhcO44KrqYt6NUt+SoGoUqJCiBNLRFHJLH6QJEd1DHp
	 I/MixNuahU78V9GHSfvvpL/THNYE47jVtIJqOdQ3wUn2PdOj0mALd/87VcGcgwIB9J
	 VpRooslt5vF1QuL2sxkmPLwl+GsPF6mybvCN7g18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80FD6F804C3;
	Mon, 18 Jan 2021 17:46:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D68BF804C2; Mon, 18 Jan 2021 17:46:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AF1EF80137
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 17:46:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AF1EF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jgD9+UKj"
Received: by mail-wm1-x32c.google.com with SMTP id 190so14188001wmz.0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 08:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=afHQlupgwlBpTXZFCKDQz5rJ89ZJvr2SG2zTDycFeRQ=;
 b=jgD9+UKjYT/U+m/KnMBNETAdIz0CuCjB9shFN4bJz6oUqgcRoD73LbP6BpBffTRr2f
 I+2nwQukdyAcXZ6ft1T63+z7I8Vi8Tagd1mIJXpWrkWqMXVNU44kPlIZSmLlmJMm0N8E
 WUyQHWNUluOLe3+k0PRXnP63NZD9BTojofjz9z2PVprv5oU7VMG6iUw/jlzvCdhX+X9i
 A/Ix46ZMw5+9q7hXCfmps3mvbpCjaUpbddacD8FD+gCHkP0Zqc23wZ9MdQ+M6hwB58gN
 t2cVX5ZA/07w+WAvM3pXNRB2mxhYlmxTk0g8TqctgyX6j+OY6t0bBMmXB9/3X0QdtD2K
 QzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=afHQlupgwlBpTXZFCKDQz5rJ89ZJvr2SG2zTDycFeRQ=;
 b=eDvs4PloSQgQXIofOcahncziAYRgxg9Wwoom9dN71WXq5n/C8Uk5XHLQbQ5kRI4IBy
 1WZdA+Pc1ae76z1ePsu2I9X2N//RVXjZLaXA1pJoRhvcV1jxTIFPs9OEZ/BdzA7FztFW
 uKRlDJlKfhpqflIJxwLlBQzBJzCHMXcowfhQOFpmSwy6fwy5xKmUv0nBHlNMa9ed+Txb
 yg4ycFqWjQiNOlfKT5cCQ/bpYI4RM2nJxoZSuSfZ/Zpov40VySFnIgyFrKoUUj9L8LTp
 F6KmQLpa4KQ6uDrEKVjMIYOf3zmxnVRA0fnz//MelSs5IXU9IHQSqjQkhQmCv8+swo1i
 t2ng==
X-Gm-Message-State: AOAM533vtrxFPCiL4s/K3EJZAWnpKsRQPURpKaJf/0BaA8wWwHnycmFg
 QRrVyO52zefetAxd71qZzYo1Dw==
X-Google-Smtp-Source: ABdhPJwyrnPvJAns+vFXJpm0yqo57dVdHYU5dDVyEJT1tkLHeWPUwEZEGrkTe7VWBefVClx59Nh4pw==
X-Received: by 2002:a1c:790f:: with SMTP id l15mr243443wme.188.1610988358349; 
 Mon, 18 Jan 2021 08:45:58 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t25sm21247218wmj.39.2021.01.18.08.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 08:45:57 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: qcom: Fix broken support to MI2S TERTIARY and
 QUATERNARY
Date: Mon, 18 Jan 2021 16:45:09 +0000
Message-Id: <20210118164509.32307-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210118164509.32307-1-srinivas.kandagatla@linaro.org>
References: <20210118164509.32307-1-srinivas.kandagatla@linaro.org>
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
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c      | 22 ++++++++++++++++++++++
 sound/soc/qcom/lpass-platform.c | 12 ++++++++++++
 sound/soc/qcom/lpass-sc7180.c   |  6 +++---
 sound/soc/qcom/lpass.h          |  2 +-
 4 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index af684fd19ab9..02441021a13d 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -356,8 +356,30 @@ int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai)
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
index 80b09dede5f9..e27443e520de 100644
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
@@ -519,6 +522,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 			break;
 		case MI2S_PRIMARY:
 		case MI2S_SECONDARY:
+		case MI2S_TERTIARY:
+		case MI2S_QUATERNARY:
+		case MI2S_QUINARY:
 			map = drvdata->lpaif_map;
 			reg_irqclr = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_irqclr = LPAIF_IRQ_ALL(ch);
@@ -573,6 +579,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 			break;
 		case MI2S_PRIMARY:
 		case MI2S_SECONDARY:
+		case MI2S_TERTIARY:
+		case MI2S_QUATERNARY:
+		case MI2S_QUINARY:
 			map = drvdata->lpaif_map;
 			reg_irqen = LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_mask = LPAIF_IRQ_ALL(ch);
@@ -670,6 +679,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
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
index 85db650c2169..eff5de918e3a 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -20,7 +20,7 @@
 #include "lpass.h"
 
 static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
-	[MI2S_PRIMARY] = {
+	[0] = {
 		.id = MI2S_PRIMARY,
 		.name = "Primary MI2S",
 		.playback = {
@@ -46,7 +46,7 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 	},
 
-	[MI2S_SECONDARY] = {
+	[1] = {
 		.id = MI2S_SECONDARY,
 		.name = "Secondary MI2S",
 		.playback = {
@@ -61,7 +61,7 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
 		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 	},
-	[LPASS_DP_RX] = {
+	[2] = {
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

