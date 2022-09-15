Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DF95B9B0F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 14:40:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 706951959;
	Thu, 15 Sep 2022 14:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 706951959
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663245637;
	bh=GbGqGWjautlyUMBdNp2VsjtFNe5O+51aNQ7ONjB1S1s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cjiAYyr4Yft6hj+Bml0XHULC6cgogJEnZ6iPHwPgi4SLFFYyH5ZE2fahcUmOgqOTq
	 akxzxCafSy9pz8ZdLlOCfS8JPa+bMl/uRvD5UAdVngXTIe6Z2qXrKU1fA6gZQxCk4J
	 b/boFQOBvs0VhTRHf2cZ746/J65IKkiIqaAy+19E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98710F8053C;
	Thu, 15 Sep 2022 14:39:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81E72F80495; Thu, 15 Sep 2022 14:39:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 092EAF80424
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 14:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 092EAF80424
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xRntcD65"
Received: by mail-wr1-x435.google.com with SMTP id z12so12356370wrp.9
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 05:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cF5Zvj+Kzci/ADALngKgDuePH0r1ubNxIDC6FLO5nXI=;
 b=xRntcD65ImZt0Qvcy5pgORY8i31L4sVZXe4AvYM+9j8OpHdQxrbHMOiDRsipUHWcCd
 l5AhGGwxRmY+PMQ9DE8rpupkzkthHuG83aHtPMhws4f4NK/xi5uMFP5XOoKW3DFoLC8f
 kz//kloxDtoXlbLKruVBhpBrOJ/0is+k0tZMz6kH2JfWaPWy3awtygdjC+J1Mk5PNpdm
 uxFOVftD1ukCEMga7GQc2mQ1u39oOCHPSCe2O9L/4vvacTP/+ma2gRwko/OzE+TkBscy
 gcOOeMdO1eCw+/p85RqzmwAo3uJB4qwBShSGAW58mIB6Qc8OcqZ7N8NND00Ty9i/Pec8
 /uHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cF5Zvj+Kzci/ADALngKgDuePH0r1ubNxIDC6FLO5nXI=;
 b=KYi563twt7iF0Ef/tGe/Jta0sTBumXNUarzcXKAZg2/Ax8gUIYQ1lquOnXeOSLYN0x
 rAUgfSf0Fi7kDxqN0Fguvi1gBzjbvSI/dmIAxyqYpSKadiK9KredcPju3Eh3qIeGeQ/p
 mTPdn3J7zKzDcViYJBS60oBH9UzmMvpyCIyCgWP+eJfJxr3jADvNqdFv2jg64wMhSZro
 05Skwna33KGn5xIbMw6IQLFlBADjrE3qWyXwpWJswuPuOF39VbfolIxDDPjoTXWGeYU7
 0PlwFTcb60wdm5vuPhB2Xjo/8fACqSFo+JZoYJJRjfcB0Feqls74ILOgvW0chinPm3jn
 52OQ==
X-Gm-Message-State: ACgBeo0jMvslpxb6m5en6OtXygp/+JZao2xW6MBsGdngxshSlOi50vOK
 7/dAtXuVpG/tGDYCfUN9tXGHxQ==
X-Google-Smtp-Source: AA6agR6BXpa+AHGkWqlwHEYogbX1by5tJVRtrI+F2Bpc7XdH5DCzlDtGbU/IgmNpyapi98wEYpw7aQ==
X-Received: by 2002:a05:6000:1a8a:b0:22a:43ef:94f0 with SMTP id
 f10-20020a0560001a8a00b0022a43ef94f0mr17546728wry.279.1663245531516; 
 Thu, 15 Sep 2022 05:38:51 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 bg13-20020a05600c3c8d00b003a5f4fccd4asm3112559wmb.35.2022.09.15.05.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 05:38:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/9] ASoC: qdsp6: audioreach: remove unused connection_list
Date: Thu, 15 Sep 2022 13:38:30 +0100
Message-Id: <20220915123837.11591-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
References: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
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

