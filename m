Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE3E554F6F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:36:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DBF21F29;
	Wed, 22 Jun 2022 17:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DBF21F29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912172;
	bh=mngDexp6wCgVRD+P6I+Z+1F8oumIbR2JdIwMty5Rijo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NElnxDUNL+2xKqRTl0zL/IhNbrX2WtiqwT6c+XM8UB8VcFFrCCUKUlZjLQgjaJrLd
	 GzBHtnTHuj4OaIKahchN4849rK0T81EJ6jxnBw8dVPxYA4qtcQHxjqdnPjpKr+JRuf
	 RByw9z+gIADvkyfIHw967INmcFG5hz4LM1eM9w60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4975AF8065A;
	Wed, 22 Jun 2022 17:23:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F143F800E3; Mon, 20 Jun 2022 22:07:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71335F800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71335F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="R2nM9gpV"
Received: by mail-wr1-x42a.google.com with SMTP id o8so16102621wro.3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rE0XsHvuQMGHkh+DWN4I0u4Mry72SZTz94U/AwkKe64=;
 b=R2nM9gpViD7RpxZufBEYDf0sqKPJn+Vqc0jUeZDkwV0e+SnITT7LfK/9yzWVU5IQhu
 aA8WUpzc6J0Qf7iIoRilFZEWo0nV5HsEN4NblRAipOFGBlQ/fSulqH247JQGB+Vbnmz6
 u+j2et5Rf+Emw9sgGoIp8Ua1g6/wgIJuStK0XWLJu64d2gAGwoDQCdtaVYypYAWvkfQX
 jXux0apgjHCpI8qq2XpRhrhdyFsE0YxHMLP8R6wnnvs9dQt5nl7aqrNMv0hrLaXmrugZ
 kyh9aob6sQAuWXwqPokSAhhl/C8pUOash7nUyLmMzRyTrdLb7ZhEwWLRjTGZ/E7DshAW
 tGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rE0XsHvuQMGHkh+DWN4I0u4Mry72SZTz94U/AwkKe64=;
 b=ji1dlTSwFHW7T1C7qTWa3ZvkGUku/8U8gZh6WgEig2/orbqXEJJztYjHlwiZtu6bXm
 HuX13yz40rQUXT9Q8+cUSBip4/a04Dd0wvYre8boLXAIMNegzWAi5dlZNaOl+geUEOmi
 57VlwHfSPAC05H/0EbswbrJFmcmocZVkDeasIbymELpX1kDOBgI+aKZMtOv+zBaihh0t
 CPvihxBzu6iYImvH9TjXKboVmwCtYSRQDDnU5tnLJ1IAnuUsiLfPuOR107TrcpgViWz+
 SRC4soonAClliiaBe9zG/EfIqBiWaKhN5khneqSRTKfmLF89ai2dCArjAjM5+GH2/Uqf
 RlUA==
X-Gm-Message-State: AJIora9dmiq3d46omCULLsa1PwjQz3zd+iH7NxbjLx4WFiUp9XjIXiNn
 CDJwH4bhSiVCmz67eUkAk3c=
X-Google-Smtp-Source: AGRyM1utPBE8XYxoB7U0xnTciGPQVtQTgTqRZ99c6POU/yfZ+JPXfl21N1f7SnJeHKblgblpcXVNWQ==
X-Received: by 2002:a5d:5481:0:b0:21a:3573:def0 with SMTP id
 h1-20020a5d5481000000b0021a3573def0mr23413256wrv.28.1655755646148; 
 Mon, 20 Jun 2022 13:07:26 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a5d48ce000000b0021020517639sm14095785wrs.102.2022.06.20.13.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:25 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 44/49] regmap-irq: Remove broken_mask_unmask flag
Date: Mon, 20 Jun 2022 21:06:39 +0100
Message-Id: <20220620200644.1961936-45-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:18 +0200
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, rafael@kernel.org,
 linus.walleij@linaro.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, myungjoo.ham@samsung.com, lee.jones@linaro.org,
 samuel@sholland.org, maz@kernel.org, brgl@bgdev.pl, mani@kernel.org,
 krzysztof.kozlowski@linaro.org, jernej.skrabec@gmail.com,
 cw00.choi@samsung.com, wens@csie.org, agross@kernel.org, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev, b.zolnierkie@samsung.com,
 linux-arm-msm@vger.kernel.org, tharvey@gateworks.com,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, tiwai@suse.com,
 tglx@linutronix.de, cristian.ciocaltea@gmail.com,
 linux-arm-kernel@lists.infradead.org, rjones@gateworks.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 michael@walle.cc, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
 mazziesaccount@gmail.com
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

Drop broken_mask_unmask flag; no drivers are relying on it anymore.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 9 +--------
 include/linux/regmap.h           | 1 -
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 082a2981120c..8a718615fd09 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -723,15 +723,8 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 
 	/*
 	 * Swap role of mask_base and unmask_base if mask bits are inverted.
-	 *
-	 * Historically, chips that specify both mask_base and unmask_base
-	 * got inverted mask behavior; this was arguably a bug in regmap-irq
-	 * and there was no way to get the normal, non-inverted behavior.
-	 * Those chips will set the broken_mask_unmask flag. They don't set
-	 * mask_invert so there is no need to worry about interactions with
-	 * that flag.
 	 */
-	if (chip->mask_invert || chip->broken_mask_unmask) {
+	if (chip->mask_invert) {
 		d->mask_base = chip->unmask_base;
 		d->unmask_base = chip->mask_base;
 	} else {
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 0cf3c4a66946..a3103c88e936 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1524,7 +1524,6 @@ struct regmap_irq_chip {
 	bool clear_on_unmask:1;
 	bool not_fixed_stride:1;
 	bool status_invert:1;
-	bool broken_mask_unmask:1;
 
 	int num_regs;
 
-- 
2.35.1

