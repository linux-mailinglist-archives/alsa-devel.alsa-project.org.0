Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F576228683
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 18:56:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A42383A;
	Tue, 21 Jul 2020 18:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A42383A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595350578;
	bh=OUWzDcuVY+yeBdYHgxu5A3ys+vhzUyAAAbYfSCUWKF8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Odb1OtWndpThTjFSCbVFZM7luMr6LNpp7X3vcqp4nl2wplbgcOTHRCOLhx4/BcrBM
	 E47I+Rtnlk8y+1TU+AlupIAOtxapRjTXaCqqBU5s6/Jpj2iN+ypPmkK+T0D2XrHm1y
	 1uOxWVNOpFHmrf+PdwcgAmtXMGKSQ/vWWAHJaQZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 414BDF802C4;
	Tue, 21 Jul 2020 18:53:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84F1DF8028C; Tue, 21 Jul 2020 18:53:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C5B9F8024A
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 18:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C5B9F8024A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PdfEQq5Z"
Received: by mail-wm1-x342.google.com with SMTP id j18so3514989wmi.3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 09:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XmFQ91h0GZrG5WahISB8fgmLlciVJglL2OXgg5eRNY4=;
 b=PdfEQq5Z5muq5Isok7PUgCsn76OXXgu5yWQuJDKHk5rZanJoGFa+2qkQOnSDpLRJch
 A4wzPDhUWeVnZBNHj7FiyHadEhZ3rl2my6XEnFCoW8OeMWOQxLxmUiCNV4cx/QS/GsSR
 FpTrDNeSluQ+xAAcfqTh19We5XjkUlWfe3lmSON/EAyVUKYHxuoyxCQfxlSTResOJm01
 CDrM0q0DjcwZw2SvWs3Bo230SiJl4MfN4LVJ2Cr8GqKfM36Lge/GLdMxsVK5SE9zAt5g
 tA9oxD47wNyl/mLB7kN1fRqfDaIDtEpa02TcWQGP5SAnnqrZLfq77KEu0Usp+65dgI02
 u7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XmFQ91h0GZrG5WahISB8fgmLlciVJglL2OXgg5eRNY4=;
 b=N0v0D6ONtdC7QMNSAY6JdYxmtZ3ScmQ8bUsLSX6H6zbh+ED9m5ViOqZRAkEu2KBUj2
 r7Lbr3l5TTMZKzsvG49Oxiw/Jyq+VdjLbp9ogkjF3YR5LfRTNTSYa6rygmMlhgmcQqKZ
 qfj3d1KJTnVwLRe7EYRrtnrqY/i0kjRWL6BnQK6VHssfv24FSrvr4XFvDxq6Y3rMMhQE
 kBY/vkYVGPO+DrAGJXXuTyPKaPBMi51PZI4YN1IkaeFuGNgGmzIczNkwU8rlNyt5wQFC
 9M7m4A8fFay9p0qKttuKPCHijhz7mJz2aCyzcW5kWk0Q744rinvzjtMLTC4tSUs3Qa0s
 CiOw==
X-Gm-Message-State: AOAM533he5VC2Dl/++eIJRvJ96Xl5IH2M/+PzDenNCrG9b789sAK0Sbh
 kLPTJWoWKVc3i450l4nL9MSnEA==
X-Google-Smtp-Source: ABdhPJxeMl1VRzhAfTUwlCTFyw+8lWWqASHdvER9v0OppOghrYq8wBV6Q3RRQp7aF4tBlPkD8CfqMg==
X-Received: by 2002:a7b:cf16:: with SMTP id l22mr5317404wmg.68.1595350402557; 
 Tue, 21 Jul 2020 09:53:22 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id c25sm4058648wml.18.2020.07.21.09.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:53:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 1/9] ASoC: q6asm: rename misleading session id variable
Date: Tue, 21 Jul 2020 17:52:58 +0100
Message-Id: <20200721165306.29082-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200721165306.29082-1-srinivas.kandagatla@linaro.org>
References: <20200721165306.29082-1-srinivas.kandagatla@linaro.org>
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

