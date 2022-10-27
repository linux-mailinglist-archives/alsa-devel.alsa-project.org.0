Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3296B60F531
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 12:31:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9C9B1FAB;
	Thu, 27 Oct 2022 12:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9C9B1FAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666866672;
	bh=IIiPbBzLfiQBx8QGGB1f+nXXsVz81oGRwU/3j+iifdo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c7zohFerMWLAOlu7Pi3ZGtU8EBdRJN1OLJE7UDML/MBrOJkAPCAqmGMsQR7xKhUBZ
	 6mqjusXjbiSBwI1TeUMUaImC/uhzPNRrD9x2JZpm/rvcBqwNjXAzgAippaGezHrMBg
	 LZ5tcs9nbbj70h5ydE7N4597blUkehfpW+wHM8VI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EF72F805A9;
	Thu, 27 Oct 2022 12:28:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E92ADF8057C; Thu, 27 Oct 2022 12:27:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CADBF80552
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 12:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CADBF80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kmV7eRAw"
Received: by mail-wr1-x430.google.com with SMTP id bs21so1400141wrb.4
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 03:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8PzGOU3cHi3C/xmeEh0jzvedpAW9sTnCtCJCz/dvKXw=;
 b=kmV7eRAwmX8oQYf73+tBJXu8eVBs3MEay0gi6/jZolwjNmntD04cdJrbfmVKBYB+CV
 r9lpGwwm2qZhvgMLWHLMc2LbSjONA7zBfHof42h3Ri4DgnMaRT06/ORl+SYOupi+jfdP
 4m+yh8AiGtfzvWMiqzIGXu1hDGRWKy/qPaNZ2a9CYqZjyAFczd+78pW0rX+32BrYBmf3
 ql+5TjspKrIkVn79k35TiRprdY9j5r22rErgkm0pksOT7htanoBuY+mnodh+ZgAutGrL
 zYj4tjKGrjebdTjxzsvzUNrAo/7IXblaM3iPc8u3iq6SuS2wChxQDx9Lvi87SLE7HZEp
 f+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8PzGOU3cHi3C/xmeEh0jzvedpAW9sTnCtCJCz/dvKXw=;
 b=8NBuomaRD6LsiFo0sSAxD/8PVdz4v5VTa+vtzbER8BA8POQsSauqNEjpLlzYhy1JUm
 cAQBSzq1IYtHsoga+K7JKRXGU0xR9M/xbnrd3uAkXhRJczcx0VpQXUQVFpk/XlfMNu82
 /faBIX3qjtciAsV99GpN8sk5+FuUMXObE7k5Aq6zvRPagKxvyTCstHLZSttuuM63j63e
 +bvnSW/pDAdL07b43d3ohOl9HPJsvauCyzZMPfCk4KRjfBOZ+lY280+T3YeiFhFBGWIi
 yuVgrKu6DSOagLK70UInTmN9oE2Sq95NflRYsX+DqtEfAyggV8PU6E7zQ72c4ya42drM
 5fxg==
X-Gm-Message-State: ACrzQf1feMTuqI7wZBzXecBBLqXIK159uueRPOCSWEdMiWaCo1XGj57T
 XRDOnkfQS253I7pfzza/YkZKzA==
X-Google-Smtp-Source: AMsMyM4oW1eAyDqgv6Txm8fwAyZp2AlhsWI2Ho4+c1Tv2pcgZRqCElLkiMSTBdHOgDUCMidAwPNocQ==
X-Received: by 2002:a5d:5988:0:b0:236:6e28:a493 with SMTP id
 n8-20020a5d5988000000b002366e28a493mr14754569wri.66.1666866465783; 
 Thu, 27 Oct 2022 03:27:45 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 fc7-20020a05600c524700b003b505d26776sm5088674wmb.5.2022.10.27.03.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 03:27:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 5/9] ASoC: qdsp6: audioreach: simplify module_list sz
 calculation
Date: Thu, 27 Oct 2022 11:27:06 +0100
Message-Id: <20221027102710.21407-6-srinivas.kandagatla@linaro.org>
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

Simplify module_list size calculation by doing inside modules loop.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 0015ec89d90b..87a3fd1f8107 100644
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
@@ -451,6 +450,9 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
 		list_for_each_entry(container, &sgs->container_list, node) {
 			num_containers++;
 			num_modules += container->num_modules;
+			ml_sz = ml_sz + sizeof(struct apm_module_list_params) +
+				APM_MOD_LIST_OBJ_PSIZE(mlobj, container->num_modules);
+
 			list_for_each_entry(module, &container->modules_list, node) {
 				if (module->src_mod_inst_id)
 					num_connections++;
@@ -459,11 +461,11 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
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

