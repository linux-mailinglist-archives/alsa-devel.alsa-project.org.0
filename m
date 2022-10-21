Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE292607CEC
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 18:55:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 632B0B0AB;
	Fri, 21 Oct 2022 18:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 632B0B0AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666371321;
	bh=GbGqGWjautlyUMBdNp2VsjtFNe5O+51aNQ7ONjB1S1s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BB5bee8IZCZrDRE0Nypiv/jvm6YcES/WzJ232Gyq/ToVRnrVb5+8PPRn7ZexJhORA
	 s9kIZlvpv1ePgDN2IN+uZ7To2txbBauI5Rx39+B71cRkR8ME6ILq/0tDdt/NFQGDj9
	 gtI5qWOqSjxZpwpdTzRP9Nw2fCLKDs+msvbmTTR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63B6CF80570;
	Fri, 21 Oct 2022 18:53:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73544F80570; Fri, 21 Oct 2022 18:53:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C384DF802E8
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 18:53:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C384DF802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TZiNQE3X"
Received: by mail-wr1-x435.google.com with SMTP id u10so5939668wrq.2
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cF5Zvj+Kzci/ADALngKgDuePH0r1ubNxIDC6FLO5nXI=;
 b=TZiNQE3XOaoDBX4SGKjXJnsnREkA/Fg8Z+lZBP851P+khMnJWvm5pwsMg3gW4Nu+kv
 yi/ilKE+4pQpSnPy9Fqi3UUUtvr51QKSuFo69OcDKVQGSoxwDcWdaPiRsz1Tf7rfMpLU
 eSU01OyMfnU2y5Fm3UP+jUqRCP1NJqMOfztW+MqBsJmkihO/bfqs4rQYiflQxt4cZycI
 aZ/rrAe7sX9qLQgXYnJ1LEFNH598L8hifJMiav5DxAfiLEhH1JLlcO8BhWxwxN+eBXz6
 xjhygwwSpq2uGXjZmTrKRdgCY1EZ0ZqhQjjIGWht3MZuYoTiDBR67Y6KRYLC0a+ma8B3
 n9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cF5Zvj+Kzci/ADALngKgDuePH0r1ubNxIDC6FLO5nXI=;
 b=a/oWPeH62Hmko4/JcNOIDNNfuWvzY43ERVc3jk4JiXMrsXBVqcTfesZo23Fb27Q9ab
 VXmWHqO72S4cqYEX4xSbRu1sCah2ROUNXYQXUBz110zEVFaVxGuvzuj3U9jqmRutdu0B
 Wl5PsS179Ccxrxynb4/AKIYGLD0aw4Hdp1pgNjPHL08/5MKqVWNhqp1q1MPQRB/6KNcl
 EDVuIWPd8315yfjGumBZ/dV2Ml37nRD83YjU8LzVObupxXMjyqJAUyBn1DqKvgRXpijy
 iWQwoq/sfBAbe1joRqFAvW7o55YOEU//d0GgpNhKFbSB1DeXsbY72RnQ6ZEXJgcjJz5l
 2U7A==
X-Gm-Message-State: ACrzQf3udfI+3ggHKuVo1BiqsO6o92RWEo/XSNyKkIwRhc8LNDODWCBr
 G7dudbwRjDWVvR/yYat1F1TvLw==
X-Google-Smtp-Source: AMsMyM7RMk9WjIX1PpFSeoepvlaVRwPBQ71LL5x0bYoQ1ZwIPDc+gwEiUrmdSb4AwWh7mL7wo6Fb0w==
X-Received: by 2002:a05:6000:144c:b0:230:816f:3167 with SMTP id
 v12-20020a056000144c00b00230816f3167mr12832842wrx.532.1666371185752; 
 Fri, 21 Oct 2022 09:53:05 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a5d400e000000b0022ae401e9e0sm19541773wrp.78.2022.10.21.09.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:53:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 2/9] ASoC: qdsp6: audioreach: remove unused connection_list
Date: Fri, 21 Oct 2022 17:52:00 +0100
Message-Id: <20221021165207.13220-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
References: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
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

