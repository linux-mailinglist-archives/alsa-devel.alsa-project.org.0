Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3194C41EBC4
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 13:24:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA10A16D6;
	Fri,  1 Oct 2021 13:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA10A16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633087449;
	bh=FIrwnpe++EGHNPiyQcrvTpB4LFVut3+I5RpKa2RBXNQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hyHCc9TMiUgoMaJMPloO/WdZEbKQmT1mzilw09AaBGKhxZ2EOfhELkebEKzJ7gQPp
	 hdOwyQbz2F+WvlF39NIrTKdjWxXsoTKMWp4i7C0dyIAq4YKb6N4HaXEaExWQ8Lq4Q9
	 AJnqiktrpLWlRXFEczhtc795aajqfgi1148zllso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 242BAF80272;
	Fri,  1 Oct 2021 13:22:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1596FF804E4; Fri,  1 Oct 2021 13:22:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ABCBF80272
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 13:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ABCBF80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="OWR6PXHQ"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633087329; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=QeUkJeA0Y6v00mxPcn2GZRasqxJIahhbF+hSrtj9etg=;
 b=OWR6PXHQk8DSXaC1QjfAOm3MqQJI4StoqNePudeMod/gw1EkX94IqPpS/b1mV/xLJ7NqWjFr
 6KmrI2YvRWROGv1XQ55XsDEtrxDFnnakdPAspqvFfJ47zERsRi3yTR6rcp42aPFGqvqGvSDS
 Nwlr/hiW8eFMqXum1Vfahgnrt2k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6156ef6047d64efb6d22f8e1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 11:22:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 85450C43617; Fri,  1 Oct 2021 11:22:08 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A6D20C43618;
 Fri,  1 Oct 2021 11:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A6D20C43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH 3/8] ASoC: qcom: Add register definition for codec rddma and
 wrdma
Date: Fri,  1 Oct 2021 16:51:27 +0530
Message-Id: <1633087292-1378-4-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org>
References: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org>
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

This patch adds register definitions for codec read dma and write dma
lpass interface.

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-lpaif-reg.h | 103 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 97 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
index 2eb03ad..697a11f 100644
--- a/sound/soc/qcom/lpass-lpaif-reg.h
+++ b/sound/soc/qcom/lpass-lpaif-reg.h
@@ -74,6 +74,16 @@
 #define LPAIF_IRQSTAT_REG(v, port)	LPAIF_IRQ_REG_ADDR(v, 0x4, (port))
 #define LPAIF_IRQCLEAR_REG(v, port)	LPAIF_IRQ_REG_ADDR(v, 0xC, (port))
 
+/* LPAIF RXTX IRQ */
+#define LPAIF_RXTX_IRQ_REG_ADDR(v, addr, port, dai_id) \
+		((dai_id == LPASS_CDC_DMA_RX0 || dai_id == LPASS_CDC_DMA_TX3) ? \
+		(v->rxtx_irq_reg_base + (addr) + v->rxtx_irq_reg_stride * (port)) : \
+		(v->va_irq_reg_base + (addr) + v->va_irq_reg_stride * (port)))
+
+#define LPAIF_RXTX_IRQEN_REG(v, port, dai_id) LPAIF_RXTX_IRQ_REG_ADDR(v, 0x0, port, dai_id)
+#define LPAIF_RXTX_IRQSTAT_REG(v, port, dai_id) LPAIF_RXTX_IRQ_REG_ADDR(v, 0x4, port, dai_id)
+#define LPAIF_RXTX_IRQCLEAR_REG(v, port, dai_id) LPAIF_RXTX_IRQ_REG_ADDR(v, 0xC, port, dai_id)
+
 
 #define LPASS_HDMITX_APP_IRQ_REG_ADDR(v, addr)  \
 	((v->hdmi_irq_reg_base) + (addr))
@@ -139,12 +149,93 @@
 		(LPAIF_INTFDMA_REG(v, chan, reg, dai_id)) : \
 		LPAIF_WRDMA##reg##_REG(v, chan))
 
-#define LPAIF_DMACTL_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, CTL, dai_id)
-#define LPAIF_DMABASE_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, BASE, dai_id)
-#define	LPAIF_DMABUFF_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, BUFF, dai_id)
-#define LPAIF_DMACURR_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, CURR, dai_id)
-#define	LPAIF_DMAPER_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, PER, dai_id)
-#define	LPAIF_DMAPERCNT_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, PERCNT, dai_id)
+#define LPAIF_DMACTL_REG(v, chan, dir, dai_id)  \
+	(((dai_id == LPASS_CDC_DMA_RX0) || \
+	(dai_id == LPASS_CDC_DMA_TX3) || \
+	(dai_id == LPASS_CDC_DMA_VA_TX0)) ? \
+	__LPAIF_CDC_DMA_REG(v, chan, dir, CTL, dai_id) : \
+	__LPAIF_DMA_REG(v, chan, dir, CTL, dai_id))
+#define LPAIF_DMABASE_REG(v, chan, dir, dai_id) \
+	((dai_id == LPASS_CDC_DMA_RX0 || \
+	dai_id == LPASS_CDC_DMA_TX3 || \
+	dai_id == LPASS_CDC_DMA_VA_TX0) ? \
+	__LPAIF_CDC_DMA_REG(v, chan, dir, BASE, dai_id) : \
+	__LPAIF_DMA_REG(v, chan, dir, BASE, dai_id))
+#define LPAIF_DMABUFF_REG(v, chan, dir, dai_id) \
+	((dai_id == LPASS_CDC_DMA_RX0 || \
+	dai_id == LPASS_CDC_DMA_TX3 || \
+	dai_id == LPASS_CDC_DMA_VA_TX0) ? \
+	__LPAIF_CDC_DMA_REG(v, chan, dir, BUFF, dai_id) : \
+	__LPAIF_DMA_REG(v, chan, dir, BUFF, dai_id))
+#define LPAIF_DMACURR_REG(v, chan, dir, dai_id) \
+	((dai_id == LPASS_CDC_DMA_RX0 || \
+	dai_id == LPASS_CDC_DMA_TX3 || \
+	dai_id == LPASS_CDC_DMA_VA_TX0) ? \
+	__LPAIF_CDC_DMA_REG(v, chan, dir, CURR, dai_id) : \
+	__LPAIF_DMA_REG(v, chan, dir, CURR, dai_id))
+#define LPAIF_DMAPER_REG(v, chan, dir, dai_id)  \
+	((dai_id == LPASS_CDC_DMA_RX0 || \
+	dai_id == LPASS_CDC_DMA_TX3 || \
+	dai_id == LPASS_CDC_DMA_VA_TX0) ? \
+	__LPAIF_CDC_DMA_REG(v, chan, dir, PER, dai_id) : \
+	__LPAIF_DMA_REG(v, chan, dir, PER, dai_id))
+#define LPAIF_DMAPERCNT_REG(v, chan, dir, dai_id) \
+	((dai_id == LPASS_CDC_DMA_RX0 || \
+	dai_id == LPASS_CDC_DMA_TX3 || \
+	dai_id == LPASS_CDC_DMA_VA_TX0) ? \
+	__LPAIF_CDC_DMA_REG(v, chan, dir, PERCNT, dai_id) : \
+	__LPAIF_DMA_REG(v, chan, dir, PERCNT, dai_id))
+
+#define LPAIF_CDC_RDMA_REG_ADDR(v, addr, chan, dai_id) \
+	((dai_id == LPASS_CDC_DMA_RX0 || dai_id == LPASS_CDC_DMA_TX3) ? \
+	(v->rxtx_rdma_reg_base + (addr) + v->rxtx_rdma_reg_stride * (chan)) : \
+	(v->va_rdma_reg_base + (addr) + v->va_rdma_reg_stride * (chan)))
+
+#define LPAIF_CDC_RDMACTL_REG(v, chan, dai_id) LPAIF_CDC_RDMA_REG_ADDR(v, 0x00, (chan), dai_id)
+#define LPAIF_CDC_RDMABASE_REG(v, chan, dai_id) LPAIF_CDC_RDMA_REG_ADDR(v, 0x04, (chan), dai_id)
+#define LPAIF_CDC_RDMABUFF_REG(v, chan, dai_id) LPAIF_CDC_RDMA_REG_ADDR(v, 0x08, (chan), dai_id)
+#define LPAIF_CDC_RDMACURR_REG(v, chan, dai_id) LPAIF_CDC_RDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
+#define LPAIF_CDC_RDMAPER_REG(v, chan, dai_id) LPAIF_CDC_RDMA_REG_ADDR(v, 0x10, (chan), dai_id)
+
+#define LPAIF_CDC_RDMA_INTF_REG(v, chan, dai_id) \
+	LPAIF_CDC_RDMA_REG_ADDR(v, 0x50, (chan), dai_id)
+
+#define LPAIF_CDC_WRDMA_REG_ADDR(v, addr, chan, dai_id) \
+	((dai_id == LPASS_CDC_DMA_RX0 || dai_id == LPASS_CDC_DMA_TX3) ? \
+	(v->rxtx_wrdma_reg_base + (addr) + \
+	v->rxtx_wrdma_reg_stride * (chan - v->rxtx_wrdma_channel_start)) : \
+	(v->va_wrdma_reg_base + (addr) + \
+	v->va_wrdma_reg_stride * (chan - v->va_wrdma_channel_start)))
+
+#define LPAIF_CDC_WRDMACTL_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x00, (chan), dai_id)
+#define LPAIF_CDC_WRDMABASE_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x04, (chan), dai_id)
+#define LPAIF_CDC_WRDMABUFF_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x08, (chan), dai_id)
+#define LPAIF_CDC_WRDMACURR_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
+#define LPAIF_CDC_WRDMAPER_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x10, (chan), dai_id)
+#define LPAIF_CDC_WRDMA_INTF_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x50, (chan), dai_id)
+
+#define __LPAIF_CDC_DMA_REG(v, chan, dir, reg, dai_id)  \
+		((dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
+		(LPAIF_CDC_RDMA##reg##_REG(v, chan, dai_id)) : \
+		LPAIF_CDC_WRDMA##reg##_REG(v, chan, dai_id))
+
+#define LPAIF_CDC_INTF_REG(v, chan, dir, dai_id) \
+		((dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
+		LPAIF_CDC_RDMA_INTF_REG(v, chan, dai_id) : \
+		LPAIF_CDC_WRDMA_INTF_REG(v, chan, dai_id))
+
+#define LPAIF_INTF_REG(v, chan, dir, dai_id) \
+		((dai_id == LPASS_CDC_DMA_RX0 || \
+		dai_id == LPASS_CDC_DMA_TX3 || \
+		dai_id == LPASS_CDC_DMA_VA_TX0) ? \
+		LPAIF_CDC_INTF_REG(v, chan, dir, dai_id) : \
+		LPAIF_DMACTL_REG(v, chan, dir, dai_id))
 
 #define LPAIF_DMACTL_BURSTEN_SINGLE	0
 #define LPAIF_DMACTL_BURSTEN_INCR4	1
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

