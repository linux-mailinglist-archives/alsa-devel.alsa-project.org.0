Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04648217434
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 18:40:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A624F1663;
	Tue,  7 Jul 2020 18:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A624F1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594140028;
	bh=OUWzDcuVY+yeBdYHgxu5A3ys+vhzUyAAAbYfSCUWKF8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O5SW8fbk7uZDRWk72/QJBo92sdyjoZNVn+YHevziJLjqIeM0UreQe6TGwO3I567ov
	 I3Mt4lUCJhPhwBY+8an6F47JkkNwsgATW47eWYPRmni4xTEUlCXzttIx0a62cFq7xm
	 oxQW7sXwHjxpcfRZNxINfYVuS/7iWfbnZt3rcwp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80B48F802DC;
	Tue,  7 Jul 2020 18:37:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AB1CF802DC; Tue,  7 Jul 2020 18:37:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7CCBF80257
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 18:36:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7CCBF80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZsW+8Box"
Received: by mail-wm1-x344.google.com with SMTP id o8so43977947wmh.4
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XmFQ91h0GZrG5WahISB8fgmLlciVJglL2OXgg5eRNY4=;
 b=ZsW+8Boxa13kHK1Io/7C/Qx4f3hBk5gCVaHvi2diVxi26KWFdEomSGsr6if93QX/Mj
 h68Z8KrjuRufXLc6w5UouylgX6FE21GeVnZ8cpkPDMwtRV3zSjjHFmuuLhZqpPaNXI2V
 q/tWQr/9vu+88l934fMrIlK/CE2L5lWS28VHQKoV9btv26AC5AIcm65XRbGXHIM5L3YQ
 XGXCYvoj2AuKEbXZuA++4g64j1EHYn4tIFpPRKFyXvKiQedojX7huwiRe0AJzsSJUteH
 LGQFjTRjPbyxLfPS730FojyXp0Hp966NVq5ZDLctgxZDmzyOgeu+eMcY7S/C72mincda
 tK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XmFQ91h0GZrG5WahISB8fgmLlciVJglL2OXgg5eRNY4=;
 b=mdmmJCCZ6/RhwH0yLgKnM4QpH9wU7ir9jXxZBtPXGc/WUQ12vCHGnWF61Vo4VIgpxY
 1v9vCbIMpb6xtKD31c4I6FkuA4ESujRQydYBWiwFZZTyCbc/QgUEh1FadelcNbhxBnCe
 ijsLH98Xh/Rpf+N2TmLvz0WTNaRE6nFhUUU+LnSkucoJ6D550HFY9ntr4aCGVSR81uMs
 rnJhG/ynqFLC1v8BYhZBrXwOvycDb8K3BhcCHtApfGEKCXdBSliemNGwaxoAVb9mtFZW
 L8z1oEWNdHKFXSUYhAbe+tD3d88GWW+fJW+QZhdGuWdr6Xu55zDybLVMcd3Op8DMGEUu
 iyjw==
X-Gm-Message-State: AOAM533RLOnFsDylPfyL6grI4J3NXkj7WREhCOip0bfAToTxcPU1SE7y
 swlbZqM2j7jhLPQW657Br1Lt8Q==
X-Google-Smtp-Source: ABdhPJzwTYKGlQdJRYeYWGRtVqh6B7nk+3FVEG7vYDvxmBd9jW0ooL1Mt+lKPtC3tqpo/xy4Q1OeCQ==
X-Received: by 2002:a1c:3c83:: with SMTP id j125mr5022283wma.65.1594139812201; 
 Tue, 07 Jul 2020 09:36:52 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p14sm1925874wrj.14.2020.07.07.09.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 09:36:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 02/11] ASoC: q6asm: rename misleading session id variable
Date: Tue,  7 Jul 2020 17:36:32 +0100
Message-Id: <20200707163641.17113-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, vkoul@kernel.org,
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

Each q6asm session can have multiple streams, mixing usage of these
names in variable are bit misleading to reader, so rename them accordingly.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index e0983970cba9..51da3717a6a6 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -828,21 +828,21 @@ EXPORT_SYMBOL_GPL(q6asm_get_session_id);
  * @dev: Pointer to asm child device.
  * @cb: event callback.
  * @priv: private data associated with this client.
- * @stream_id: stream id
+ * @session_id: session id
  * @perf_mode: performace mode for this client
  *
  * Return: Will be an error pointer on error or a valid audio client
  * on success.
  */
 struct audio_client *q6asm_audio_client_alloc(struct device *dev, q6asm_cb cb,
-					      void *priv, int stream_id,
+					      void *priv, int session_id,
 					      int perf_mode)
 {
 	struct q6asm *a = dev_get_drvdata(dev->parent);
 	struct audio_client *ac;
 	unsigned long flags;
 
-	ac = q6asm_get_audio_client(a, stream_id + 1);
+	ac = q6asm_get_audio_client(a, session_id + 1);
 	if (ac) {
 		dev_err(dev, "Audio Client already active\n");
 		return ac;
@@ -853,9 +853,9 @@ struct audio_client *q6asm_audio_client_alloc(struct device *dev, q6asm_cb cb,
 		return ERR_PTR(-ENOMEM);
 
 	spin_lock_irqsave(&a->slock, flags);
-	a->session[stream_id + 1] = ac;
+	a->session[session_id + 1] = ac;
 	spin_unlock_irqrestore(&a->slock, flags);
-	ac->session = stream_id + 1;
+	ac->session = session_id + 1;
 	ac->cb = cb;
 	ac->dev = dev;
 	ac->q6asm = a;
-- 
2.21.0

