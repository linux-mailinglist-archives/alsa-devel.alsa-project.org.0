Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C7E60F518
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 12:29:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62E0231BD;
	Thu, 27 Oct 2022 12:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62E0231BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666866545;
	bh=GbGqGWjautlyUMBdNp2VsjtFNe5O+51aNQ7ONjB1S1s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cPWD2Kmz77KHQL8oxf5WuPUyjMIIZmcisVMrMwFDFQEUwLBQljoNL2wQpUsn5/1MY
	 6DJoX29lzVuj53erYcr0t5p5nL5jYIIyg9oA54Cxce2sOoBH+dvqSBkdcdVfSKuIjl
	 q8pmpcCEcBEzbBUGOR6FeEirAKpU1QIiWThPJZEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AA05F8054A;
	Thu, 27 Oct 2022 12:27:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5224F804FE; Thu, 27 Oct 2022 12:27:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A217BF8016C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 12:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A217BF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OfmcnN2A"
Received: by mail-wr1-x435.google.com with SMTP id bk15so1357740wrb.13
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 03:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cF5Zvj+Kzci/ADALngKgDuePH0r1ubNxIDC6FLO5nXI=;
 b=OfmcnN2ATMaOpm5S6kmUIuDgV9Frpxx46brWhLZxI1dy82qO45G2ZGVowls6lCKTWO
 HAqZnnXtVgJrIQP/DUGZqt5mFCCzx5Y7lSMkGOKJx4WW+LGu2Z5nZLcssfuyNcnuC/4k
 JFWkhSpO/CZyeaaJLrou68ss3ypdAP9sZSA71qq9jpwCWmnUFM6zok3vylJKFKDyQgXI
 liThdInxxTImzhJIjRlZIFwJ9f7kMtwXuT2rlaeZRCqkIBy+ig4gi0rACnSq5I4y+ZPI
 Yfr5/Vg57Vhc0aKaSaZ3vLERuUNXYS4R8dZ+9EPd1xc3aShX3CvfmTJvYpSUZt0R5FmB
 x7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cF5Zvj+Kzci/ADALngKgDuePH0r1ubNxIDC6FLO5nXI=;
 b=Ofk8xb1KdnsFfYuEoMPse/qhvjlysXJTWN2ChulAnbRqPj/hfnVJGJsizqcrnlKioY
 Oli88+7MhK6/81pEAc16LW3wUb/I/gloJFfeujYoAkCgYjERTHo5aOmb57h+QdE1BSGY
 8+yLr3P8TgPT2VZjg3UNMd+zJ4WjczytIBAanwEbClKpxMT0n4nLoH9ftzXO1YAKqe82
 DcrIjz/tefAUs3NaFw+keNfbVkz7/e74mATjbTSi/kRnOWPO6S6mkkdkg0DT2JlUlXQ1
 aqTX+vusO9F3V+XaBmnNvG/f70PPSoBZpU8qCAwvjL2C2RzCLJyl/Mmtoshy50rbz3PF
 vRKg==
X-Gm-Message-State: ACrzQf3qrh/ct7YWsg+lhXrUhfY4uXaCsNS0CZs6iU1trfc6LWnO5+ZQ
 KD+bOtgUWb5CIjEZHUb1jTddVQ==
X-Google-Smtp-Source: AMsMyM6DoyMFwCAihYX8DnGbkz/UnKKCrN0y33wb+sh9AQ/ZFnMVkmJJ8x01wwKJnoT+Hxu81BRRZw==
X-Received: by 2002:adf:e7c8:0:b0:236:6a30:cb2e with SMTP id
 e8-20020adfe7c8000000b002366a30cb2emr15899887wrn.12.1666866461938; 
 Thu, 27 Oct 2022 03:27:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 fc7-20020a05600c524700b003b505d26776sm5088674wmb.5.2022.10.27.03.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 03:27:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 2/9] ASoC: qdsp6: audioreach: remove unused connection_list
Date: Thu, 27 Oct 2022 11:27:03 +0100
Message-Id: <20221027102710.21407-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221027102710.21407-1-srinivas.kandagatla@linaro.org>
References: <20221027102710.21407-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bgoswami@quicinc.com, linux-kernel@vger.kernel.org
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

Remove unused connection_list parameter.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 3ee8bfcd0121..36779ad1952d 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -595,7 +595,6 @@ struct audioreach_graph_info {
 	int id;
 	uint32_t num_sub_graphs;
 	struct list_head sg_list;
-	struct list_head connection_list;
 };
 
 struct audioreach_sub_graph {
-- 
2.21.0

