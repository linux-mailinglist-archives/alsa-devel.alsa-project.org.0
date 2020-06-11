Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F51D1F6818
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 14:46:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D67E61680;
	Thu, 11 Jun 2020 14:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D67E61680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591879574;
	bh=OUWzDcuVY+yeBdYHgxu5A3ys+vhzUyAAAbYfSCUWKF8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mb0y6K/+YEWgGrX5OWQW7saxVxMY8Nc45g+9L+LLSbsAX0dh7dPPW8ndb9WXR6Mhc
	 X6zjclnIamrIC6gKHK06LOrHJPU5jqif1k9P5ELaGDQS2PjLrnAznHI5GSV3Jz10a7
	 SO/L4RUSigckxJE62APFtUngZuJIYmM2IVbwuZWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0F65F80278;
	Thu, 11 Jun 2020 14:42:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AB2EF802A9; Thu, 11 Jun 2020 14:42:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E198CF80291
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 14:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E198CF80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VdEQrWYs"
Received: by mail-wr1-x443.google.com with SMTP id r7so6032859wro.1
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 05:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XmFQ91h0GZrG5WahISB8fgmLlciVJglL2OXgg5eRNY4=;
 b=VdEQrWYs2Uqc2Ff7VpJtv1mSFf9m6Ugbt1BOFmKKvAN6xEchlHWIOcLuP+mjyslQb9
 foXUJjSZurXBRLrt8jabAIuejWX/fdwZKdtRrawNaGIz4SvUmGyJzHVpHIJh+16Cmdm3
 66pfsdmIG6BgIKMocfQC0niEPRpxZ5W8xB6qJ9Ae2b/O+XP6SgDFEbSyd9PJQWSD7zTm
 9aw9Vyc24x6+eDhFTcPLXyyjRBir5cq3qS5ec5nvz6/1uy6LxBZLYaso4NQ8C+SxYjqA
 7IAUuJyZg9o8SAPF8PodoqQqvnAX512t3lrkTVYYN7qHKjDpBu1gXNH1eIP4l1jOvylo
 L+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XmFQ91h0GZrG5WahISB8fgmLlciVJglL2OXgg5eRNY4=;
 b=cerkb2aweHLZ2ek9CdnAP+qRy0KSeb6bViziSgQ60kj9xOO/cnLLqL/rAjuKAPG5Zm
 YZ9rZRGLmj/Z9yHHcBvhYzysVMFT7endY8weBbuv12OYp1iCTCUCK2m8DvmNg0Brbjf3
 07aEnTOzfV4oGGPV42R0Vk951/6JOxrgNhTBAwTjXbr414IbMSADuVchWckphDJBd37C
 1Ix5i5HbghaJxRqbwpLVdRbPrFe4elJycX5S3a+LOw8zNB7Zg95Ci18l6b743vixKvvD
 UUqYPmdCdXb2dZyMTpNfxLlX1lxMwF6FZSQwsMgc+C+cinigQvjDgw+C3eluVwrpAAB/
 bvXQ==
X-Gm-Message-State: AOAM530GtKtNyKaU5NxL0ZwIsj6KnODS77jbCd9cJ5I8Z/2nlEJ6YHZd
 LRZwrpjl6FpSVEbAjk0uPJxg1oBfhCU=
X-Google-Smtp-Source: ABdhPJxbLRxb3pVa6kGKVQjFbdxlVetJsMnut5Ck76cBOeP9CLWnh9yMeXxDXOKDLBn/O5OnCR4ROA==
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr9137648wrx.214.1591879326516; 
 Thu, 11 Jun 2020 05:42:06 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id q13sm4810355wrn.84.2020.06.11.05.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 05:42:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 3/8] ASoC: q6asm: rename misleading session id variable
Date: Thu, 11 Jun 2020 13:41:54 +0100
Message-Id: <20200611124159.20742-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200611124159.20742-1-srinivas.kandagatla@linaro.org>
References: <20200611124159.20742-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org,
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

