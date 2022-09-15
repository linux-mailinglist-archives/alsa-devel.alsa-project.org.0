Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CA55B9B15
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 14:41:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F281B1A2D;
	Thu, 15 Sep 2022 14:40:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F281B1A2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663245698;
	bh=wo3FLRfBWMinJOAiI4masYGSLfHUDawS3Sf595Oqz7o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L4mFMPetuBh0FVUtwy6X41zhG0725tsL3qVl3UJTB347GdItVXldcLlDypop7sPks
	 5prejDkrhyhnzgmM1NkEAnNoUicZTQH7ctEHZ6DGiaY7i0P+8/u/AL36PoBqBxzJ3S
	 ZfxSb+enhOhGQztlA0UO+seI614EQFHU0UGhFcJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40C70F80564;
	Thu, 15 Sep 2022 14:39:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EB3CF80552; Thu, 15 Sep 2022 14:39:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF34DF80528
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 14:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF34DF80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LNyn9+De"
Received: by mail-wm1-x329.google.com with SMTP id
 u15-20020a05600c19cf00b003b4acef34b1so1119582wmq.4
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 05:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Sr1UfmKo/5TRBZLXzJD4DkSvxdVH2UE4dAA9W8/Rm7A=;
 b=LNyn9+DedkSAToLvnrmjcql1/S8NkLjO237hXw6w1zKKGlOvLTOrya5b9etSFFiK5a
 a2IIZDxLWWfmN6gGpPRe4O8czWW4MAUj1SNVfzfSQrnUtVNTyzNs5lskjd7PRyLxS9up
 uHJJZlLYjmV15Gf1gRYT4Xd4/EY68prTPyi+QIJQHQwQXt4a8W3GHFnooq6+yIbknbWf
 SCP6cI1nVSbhZObQlHFB/glvq72I5D6lkY54rhkCjbeHP68HjxpH4O4TqpkjwcKpQvSm
 n6lYbe8TzKVjHpXZKyzuyM96lC590CARoBR/M1/8B6iOD0PZTRLImprsjxkSsL4JV2De
 cbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Sr1UfmKo/5TRBZLXzJD4DkSvxdVH2UE4dAA9W8/Rm7A=;
 b=YA3ZEJK8AYMqrCw5LZAe9Of1IQj5zmKoWZFe7vomoGeEZ03JY/3s0YGcjRhldXbAB4
 4udCtjUUae0fMJB5cQjAIVXcB6tTHQ1jBcT/6fx8VBj2J5sUbcd49jq3PdHgPVDiS9IL
 j4HYiJYlXLaiaM4Ele/lfCAkXBJzG4cnpRRlUh0V8dOBOUns7FCXAOqWPRwUpa1gNQ9W
 2Cl88mcHb+J1FsbwS8aEGk1nv8pOjkKOyeS7QNfU/RvzGsx5T3aaqM2KVqYtJAEAFLu0
 Ei+yTCqlFfNbflYtnMlFoKkvcuxILqcd+ZU3q4czSieAc2C0s9YslQrebBl4OfQmy/Ke
 qtcw==
X-Gm-Message-State: ACgBeo0MAk5l2hGZf69vznmEeEnL3GMiYuCS67ho2BCQGYUIxgA7Bs/7
 ReaH/mCOE8rRs7WJeN7gtHhx0Q==
X-Google-Smtp-Source: AA6agR5Y5Tg5yO67Rm0vAjfIHvHG/133jBAHaRJ1ZsbyyWLUrzJn1JVpCiUVBeXD1C3AYA+KIkj65w==
X-Received: by 2002:a05:600c:a43:b0:3b4:9250:781f with SMTP id
 c3-20020a05600c0a4300b003b49250781fmr6757885wmq.110.1663245535995; 
 Thu, 15 Sep 2022 05:38:55 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 bg13-20020a05600c3c8d00b003a5f4fccd4asm3112559wmb.35.2022.09.15.05.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 05:38:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 5/9] ASoC: qdsp6: audioreach: simplify module_list sz
 calculation
Date: Thu, 15 Sep 2022 13:38:33 +0100
Message-Id: <20220915123837.11591-6-srinivas.kandagatla@linaro.org>
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

Simplify module_list size calcuation by doing inside modules loop.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 783211fc0d87..bae0b7f67e0b 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -430,7 +430,6 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
 	struct audioreach_sub_graph *sgs;
 	struct apm_mod_list_obj *mlobj;
 	struct list_head *sg_list;
-	int num_modules_per_list;
 	int num_connections = 0;
 	int num_containers = 0;
 	int num_sub_graphs = 0;
@@ -453,6 +452,9 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
 		list_for_each_entry(container, &sgs->container_list, node) {
 			num_containers++;
 			num_modules += container->num_modules;
+			ml_sz = ml_sz + sizeof(struct apm_module_list_params) +
+				APM_MOD_LIST_OBJ_PSIZE(mlobj, container->num_modules);
+
 			list_for_each_entry(module, &container->modules_list, node) {
 				if (module->src_mod_inst_id)
 					num_connections++;
@@ -461,11 +463,11 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
 	}
 
 	num_modules_list = num_containers;
-	num_modules_per_list = num_modules/num_containers;
 	sg_sz = APM_SUB_GRAPH_PSIZE(sg_params, num_sub_graphs);
 	cont_sz = APM_CONTAINER_PSIZE(cont_params, num_containers);
-	ml_sz =	ALIGN(sizeof(struct apm_module_list_params) +
-		num_modules_list * APM_MOD_LIST_OBJ_PSIZE(mlobj,  num_modules_per_list), 8);
+
+	ml_sz = ALIGN(ml_sz, 8);
+
 	mp_sz = APM_MOD_PROP_PSIZE(mprop, num_modules);
 	mc_sz =	APM_MOD_CONN_PSIZE(mcon, num_connections);
 
-- 
2.21.0

