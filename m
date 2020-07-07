Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99225217432
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 18:39:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D08F11660;
	Tue,  7 Jul 2020 18:38:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D08F11660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594139973;
	bh=xdwW81u7IxxoNmesNocO0hbzyu8brea2mHr1aIB4hYo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jnAOCy0a/78WxedEuxa+Az+jVIKnvjCPZoGOYNqDcIqNPew8GlGAeemG6pt+77+qa
	 yZjlu8mrgT9z3ncyYoavre3M6/BmCNQgyJ3gPfEGupqaEGLV+78b7s9e6h7cLbvdF+
	 FNjG95HFsDufP2Sxjk2CAEPJXoYNUZW00nZuL9W8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C89D8F802C4;
	Tue,  7 Jul 2020 18:37:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 197D3F80274; Tue,  7 Jul 2020 18:37:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A571F800D0
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 18:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A571F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uLrJ/B+z"
Received: by mail-wr1-x441.google.com with SMTP id o11so45929221wrv.9
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eXFmux5X1whu1JBdcynlDddC5+sJq/4aA7zZPxnTZOA=;
 b=uLrJ/B+zL3ZjyzHkLvOuGvamrzrBzDHge6qjBz/hFLcTSxqdbrcuzOcLI+n8bLwE2f
 TZBi7a3z8Oj81fJyTn6QjU8mpe/0mz0GyxyFfPXRsWAiRMCLnAtkgb8sAxnn+2iNIJWI
 WfkBlPRU3WhTZgGKvanFhJstFplDxkrjAzhsanUcgaYsqhPxZx1xN8NsONZSvXx2uqi/
 UbtJtTNv7Bo43yJ/Z8wMZG0vccKp0XnQklb4ab9ZZKRvBsug4azlvVWNTz0VjK7p4Djg
 xwPe24SOwRLtWXtyDp8syBrAA01me3ase+Do2AlKkp4L7PMVR5GHA56hSPNZC6iCQa2C
 yy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eXFmux5X1whu1JBdcynlDddC5+sJq/4aA7zZPxnTZOA=;
 b=St8unv5lhhN6yYm3JKxqVIPi2ThDYtGuMHnsDKGZaPXfJjxnjrwvCClsM5npDh0yiu
 aDDj/HJpar3r2nFuKeuqTL51qyDThWnt9cdQhe7FIGiRVGD8Pw0Eqao24kxG+dfm27dI
 JzRHQxUCAZeb6eqI+g+f0rHbHLVYzZBZQO0/hk+q7mXYpj2Wu+If+61MTcRuCkS2Jagw
 QZ1+fRJ4igDmMYFiVU0UG1XYj5uBCREHriPqaEbzT/bTUdfBX95sPWVCAwCIdM0DOHTg
 4034w61Ck2z3ZmFItanhoLyg6yfP+sXdhR2IVMovSxB/fRjv8EeSy8w6r2KKhY6t/0ty
 ohrA==
X-Gm-Message-State: AOAM533pZDLBkTqgiGGVGoLKxrJv7nK1Spy2ghjROryM3rssXF9ZXwb7
 7S1sC8ZMrKbs/WdYZt7LnY6/yA==
X-Google-Smtp-Source: ABdhPJwQUC2lPy1B1jfVkVhjQrvBloYN9Zm6x0E4go8cfkV/wUheZl/QcmCcBOwbz/t4/v0q0FPbBw==
X-Received: by 2002:a5d:4649:: with SMTP id j9mr52303665wrs.270.1594139810886; 
 Tue, 07 Jul 2020 09:36:50 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p14sm1925874wrj.14.2020.07.07.09.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 09:36:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 01/11] ASoC: q6asm: add command opcode to timeout error report
Date: Tue,  7 Jul 2020 17:36:31 +0100
Message-Id: <20200707163641.17113-2-srinivas.kandagatla@linaro.org>
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

Make the error reporting more useful by adding opcode to it.
Without this its almost impossible to say which command actually
timed out.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index ae4b2cabdf2d..e0983970cba9 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -311,7 +311,7 @@ static int q6asm_apr_send_session_pkt(struct q6asm *a, struct audio_client *ac,
 					5 * HZ);
 
 	if (!rc) {
-		dev_err(a->dev, "CMD timeout\n");
+		dev_err(a->dev, "CMD %x timeout\n", hdr->opcode);
 		rc = -ETIMEDOUT;
 	} else if (ac->result.status > 0) {
 		dev_err(a->dev, "DSP returned error[%x]\n",
@@ -891,7 +891,7 @@ static int q6asm_ac_send_cmd_sync(struct audio_client *ac, struct apr_pkt *pkt)
 	rc = wait_event_timeout(ac->cmd_wait,
 				(ac->result.opcode == hdr->opcode), 5 * HZ);
 	if (!rc) {
-		dev_err(ac->dev, "CMD timeout\n");
+		dev_err(ac->dev, "CMD %x timeout\n", hdr->opcode);
 		rc =  -ETIMEDOUT;
 		goto err;
 	}
-- 
2.21.0

