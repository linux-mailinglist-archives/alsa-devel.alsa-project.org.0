Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B3E60F51C
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 12:29:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2438431C5;
	Thu, 27 Oct 2022 12:28:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2438431C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666866567;
	bh=yyO9imkgz8l42nhzr1OSb8CTmz5PEKHI1FaVg+HpUqQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IWO9PtSWH1YPNgHlBMY5JGVBMIJWCJw72SQjhfr2vjAW3Hg1kY/R4HZf3YehKIVLm
	 2UJCIhPJjsCbSzKtfJ7LvhpQmIpG6QmMFGKT7V1CucLPKN34A1wgChG9RyIAgiELcz
	 2x0rxqvXh0RtCjueDgWzwoClMI+l1P/5qGVoQ2IA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B8A9F80559;
	Thu, 27 Oct 2022 12:27:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B7BAF804FE; Thu, 27 Oct 2022 12:27:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5913CF8025A
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 12:27:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5913CF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="r1XOWKOp"
Received: by mail-wm1-x32e.google.com with SMTP id n14so629454wmq.3
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 03:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UKQTPRFu++JOzaQvPKM6EY88nyYcpwHVj06ax0yzQAI=;
 b=r1XOWKOprkHaO8FuW0u5IWId2lIgt3Vo1/lrOuUOcyBn9+EuFrRE8LSNux6ADaZRum
 VLi9zUsaL6CHZHxysp6vPtsxPRP6VXtjyYGXSDunjjjbcsML0DBQaqMykQumfXasesdI
 anr5cPryy9/WlbFYZU1ZHLyD8qh27kqGcXwcQ9016DQoyuPmOMfdjk9gfq7SIfNoPYzr
 oHhac+jl4qBAM1IoTS55RdoX5YW4BAyLN9qPpmq7uk546+slO19MKEsN1diDNBwUzLsE
 sP7oNAsBk/jdqqGXb1SLPu+xG1Yc2c914mgbtuAE12jSxS5U7pJ/rNV/mHttyaPS36Sm
 EJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UKQTPRFu++JOzaQvPKM6EY88nyYcpwHVj06ax0yzQAI=;
 b=b2Da+U5UjHMM2zdso2fz7N3dA4TRVGu94RNP54sJzd6dTw7x+KcJNAOTngzcJ3M+X0
 r16eicdZ5iMkBejOLYnvaZe+60FimwZ6ZbRmnXdH6tVBM2PIorj4X2oE5E1UlDjJwP1f
 ofM0d8kmktuC2LHqtNJll5SVfbfvgsa3qyUGqfWELvbWRxOJTDHVOkKgVvVhRbtEGrAM
 Vm8wQmwCIOPXlYce4hqOoEociCyOZR6AAnLdJ7LR4I/m8qBNRA/1/LFDkMkr1JTaxv9D
 1SDZZMI//1NR4P0iPJ5o6LKrDfuyqzScyxYEg4rkjb527THSQA/Qy9+NF6NuqB/KfwcR
 HchQ==
X-Gm-Message-State: ACrzQf3QjhhK5RqnaysMFlTGCQ/TacK1w78pf0N1Nhiwa2cU1hyuxeWs
 fMhqJEskFLA2bCm3TqSLyL7qIg==
X-Google-Smtp-Source: AMsMyM4sgq73+xWA9Uv5bD23xURnCE6/2JnkcYrZovykm9jGyUOIYV+TPTyNnGDjyOO4hdNUCHgX5A==
X-Received: by 2002:a05:600c:5563:b0:3cf:503c:c759 with SMTP id
 ja3-20020a05600c556300b003cf503cc759mr2107969wmb.30.1666866460613; 
 Thu, 27 Oct 2022 03:27:40 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 fc7-20020a05600c524700b003b505d26776sm5088674wmb.5.2022.10.27.03.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 03:27:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 1/9] ASoC: qdsp6: audioreach: topology use idr_alloc_u32
Date: Thu, 27 Oct 2022 11:27:02 +0100
Message-Id: <20221027102710.21407-2-srinivas.kandagatla@linaro.org>
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

SubGraph and Module Instance ids take 32 bits, so use idr_alloc_u32
instead of idr_alloc to able to accommodate valid ranges.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/topology.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index bd649c232a06..9a3d9e0eae53 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -44,7 +44,7 @@ static struct audioreach_graph_info *audioreach_tplg_alloc_graph_info(struct q6a
 	INIT_LIST_HEAD(&info->sg_list);
 
 	mutex_lock(&apm->lock);
-	ret = idr_alloc(&apm->graph_info_idr, info, graph_id, graph_id + 1, GFP_KERNEL);
+	ret = idr_alloc_u32(&apm->graph_info_idr, info, &graph_id, graph_id, GFP_KERNEL);
 	mutex_unlock(&apm->lock);
 
 	if (ret < 0) {
@@ -53,7 +53,7 @@ static struct audioreach_graph_info *audioreach_tplg_alloc_graph_info(struct q6a
 		return ERR_PTR(ret);
 	}
 
-	info->id = ret;
+	info->id = graph_id;
 
 	return info;
 }
@@ -94,7 +94,7 @@ static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(struct q6apm
 	INIT_LIST_HEAD(&sg->container_list);
 
 	mutex_lock(&apm->lock);
-	ret = idr_alloc(&apm->sub_graphs_idr, sg, sub_graph_id, sub_graph_id + 1, GFP_KERNEL);
+	ret = idr_alloc_u32(&apm->sub_graphs_idr, sg, &sub_graph_id, sub_graph_id, GFP_KERNEL);
 	mutex_unlock(&apm->lock);
 
 	if (ret < 0) {
@@ -103,7 +103,7 @@ static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(struct q6apm
 		return ERR_PTR(ret);
 	}
 
-	sg->sub_graph_id = ret;
+	sg->sub_graph_id = sub_graph_id;
 
 	return sg;
 }
@@ -136,7 +136,7 @@ static struct audioreach_container *audioreach_tplg_alloc_container(struct q6apm
 	INIT_LIST_HEAD(&cont->modules_list);
 
 	mutex_lock(&apm->lock);
-	ret = idr_alloc(&apm->containers_idr, cont, container_id, container_id + 1, GFP_KERNEL);
+	ret = idr_alloc_u32(&apm->containers_idr, cont, &container_id, container_id, GFP_KERNEL);
 	mutex_unlock(&apm->lock);
 
 	if (ret < 0) {
@@ -145,7 +145,7 @@ static struct audioreach_container *audioreach_tplg_alloc_container(struct q6apm
 		return ERR_PTR(ret);
 	}
 
-	cont->container_id = ret;
+	cont->container_id = container_id;
 	cont->sub_graph = sg;
 	/* add to container list */
 	list_add_tail(&cont->node, &sg->container_list);
@@ -181,7 +181,7 @@ static struct audioreach_module *audioreach_tplg_alloc_module(struct q6apm *apm,
 				       AR_MODULE_DYNAMIC_INSTANCE_ID_START,
 				       AR_MODULE_DYNAMIC_INSTANCE_ID_END, GFP_KERNEL);
 	} else {
-		ret = idr_alloc(&apm->modules_idr, mod, module_id, module_id + 1, GFP_KERNEL);
+		ret = idr_alloc_u32(&apm->modules_idr, mod, &module_id, module_id, GFP_KERNEL);
 	}
 	mutex_unlock(&apm->lock);
 
@@ -191,7 +191,7 @@ static struct audioreach_module *audioreach_tplg_alloc_module(struct q6apm *apm,
 		return ERR_PTR(ret);
 	}
 
-	mod->instance_id = ret;
+	mod->instance_id = module_id;
 	/* add to module list */
 	list_add_tail(&mod->node, &cont->modules_list);
 	mod->container = cont;
-- 
2.21.0

