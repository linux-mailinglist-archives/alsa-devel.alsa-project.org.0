Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D66322E93E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 11:40:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC765169C;
	Mon, 27 Jul 2020 11:39:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC765169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595842847;
	bh=OUWzDcuVY+yeBdYHgxu5A3ys+vhzUyAAAbYfSCUWKF8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L7qb04nr46s5RwejWnhSPL1WddN913Ndt4vC5Uycn6zAOh8J3qMxciEob1OE+huQv
	 8HBCSC8MI0wAOG7SSZbZFzIF4xeElhK1Yk5+C7GkTgyMUhbGC157nPKYQaf6UEu3db
	 K0/62cUoRY+DpEIHtA3Ekq2U0NT054YAiEHfmEB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59C80F802BE;
	Mon, 27 Jul 2020 11:38:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8892F8027B; Mon, 27 Jul 2020 11:38:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67D8AF800DE
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 11:38:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67D8AF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="iRS7vofa"
Received: by mail-wr1-x442.google.com with SMTP id a14so14177098wra.5
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 02:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XmFQ91h0GZrG5WahISB8fgmLlciVJglL2OXgg5eRNY4=;
 b=iRS7vofa4J8zmxsEDII42gfJgszCaqgth1nT6MJzl/o2Ne/5UFf5Aw8ZigFDURPIyZ
 V3kQCYXrPr/G8X3l0hdpr6yDnxzEdK5l6IcxZjJl8NqaL4rdPtO/0bjiElIzmnITRAAs
 a0T3l2cQxquXvuEZXLqA4purNnP7Zw55/SXIY1GmzJXo9cp9GyXX6pE1VNi0b4dYMtyG
 YngNIQKPzu0J/ZyHp94WUQXsm3DLdNgyd+Of3w+/CPHdLNCvUdEvRfvv2ig5axxivImg
 3LlQz0fwM0iVymO208cBo6wJX1qMpacvMlSxCbF/GxNH7UlPBvcJfjCFdfJx+DeEAyek
 MDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XmFQ91h0GZrG5WahISB8fgmLlciVJglL2OXgg5eRNY4=;
 b=DZYhCNWZroPHKY7BALQD3M2GVcSZVwVDG2CeNK9jD27FBsOeUUMhsjeLm05yvYdEIW
 p96H+2pBQsrs+6xEccjqcifHqg5DgpMIT49bN3hgSGDCMIrsnQOvRuvutm67ja4gAIHu
 Enxa6yY8q2yu37RfymTTU6k59Jz+kGclUA+L1edeenz6UobP161KGD08GU+YxtmHHT8G
 5cgx7j4rlWSTHMlaY/UTJC75xP1h1vSffXgiNCzRNtVUax8fVUstt3VA6YHWKQTGdK0L
 hgand5ut5/zxrkfrlMkzYGitYLp2oyxBl/iO7pyuot/HqreXpBDZOT8saAsm72fbD0LU
 s07A==
X-Gm-Message-State: AOAM530Watblrmq7synNTPvj8lpx/2xUPRy3Ovd/tjionSnnFXh1Woai
 EZ6o3zCX9vpgEjF1+7uDXf8TzQ==
X-Google-Smtp-Source: ABdhPJwFZJgNsmBQxchH9gOwIzssFTkFWdmxFcOb7dHoHRFPfVpfia0IZSSV2YRgdXbwBgOihXQc4A==
X-Received: by 2002:a5d:6401:: with SMTP id z1mr16219109wru.272.1595842694746; 
 Mon, 27 Jul 2020 02:38:14 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id y189sm20566099wmd.27.2020.07.27.02.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 02:38:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 01/10] ASoC: q6asm: rename misleading session id variable
Date: Mon, 27 Jul 2020 10:37:57 +0100
Message-Id: <20200727093806.17089-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200727093806.17089-1-srinivas.kandagatla@linaro.org>
References: <20200727093806.17089-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
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

