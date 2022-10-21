Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3FC607CDE
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 18:54:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAF8B9DB1;
	Fri, 21 Oct 2022 18:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAF8B9DB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666371270;
	bh=bT/Ak0m2Pii51JcNHTjaFhaS+1CXELbFxbCBdKMfMIA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Git+44XhDbcMQP6Qc0TtSLyoosNse7SoAdEgGfgh8AZBk9PfK/YzoRYHngdyeTRP3
	 IumvyMnXmzGZJw9pPG+Gr5d8jomIyd/fU36gpj4XPEcD1dlw3XqPPk9gLTFhoIcUjb
	 9SGscHkOVVGTlnBjT2/OOTePljFEF8jicdbLk1Nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7DF2F80549;
	Fri, 21 Oct 2022 18:53:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8917F80542; Fri, 21 Oct 2022 18:53:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97A14F80134
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 18:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97A14F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="e5cCay4S"
Received: by mail-wm1-x329.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so5502595wme.5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 09:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S1Wbe703KgwRjRnGYT1UQwDcnhEdqY3xQGpBo/iRxEg=;
 b=e5cCay4SFUrpxbbt6ZxM5tOq2iPJacFUiZ6rBvOTWdwCsnj2o12Egu9+sXict2iThJ
 ARwmWdHIKdw0ja2J5x+9MdEl7cs4f2r0tnXfx+0bwPQmKYfzWEViMmx0gVwa6LpxgoIL
 WMkC12dSMmOSXd4nAN+yjqm4NVbfNmSnJx9z3hxtta+lpbDkYftEQBwblf01wD10mSH2
 WrkQnRZcl9eFD80EwYKR0mOxVxbJ4CyOJKkd1bHnSdF0yPHTns9OfXoqRkulvslnEm8x
 0EACz0O1lrr40AYC+zOnZ6F82clKqRStr2Cy39R+iQaZJxa/9ZSPLMYFKiz8QQvYO4vd
 C+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S1Wbe703KgwRjRnGYT1UQwDcnhEdqY3xQGpBo/iRxEg=;
 b=Vb56Z7ocAjZ3iRAo3aFi8KEgA/NB5iOJHAtVeMSRWM9GRDadV3JcwcdvpzBXhd8WPG
 BcHJTa3g+SFKCddjK9cjeb9wBU3eXgtqi9vs0ilKBoCQKkgPQ8yfTWmJcmmjyNVdFbqz
 TZJTz1Y8RHpMd2WqJqeMcVbnzQokRKN+nvaDr+9rsRO1G5/L5LLCeY4NXgP9j98Xa5uF
 aXaWqjDrhbQFCgpCOOjxARp66DDWdAXc3WckwuEkMAURIXVI47Plu+9/txOZ1GLSQMFT
 YCR43gH/inTN53dv6rA+92H7t1nY2j/j/qmKo3XFQ1/uQAmnCGGGCZlUBUMDUTBy8ZU7
 r73Q==
X-Gm-Message-State: ACrzQf3SvbdBtRef2jjpk+sBEEd/HEI8R1yrfa/LHVtIN7dpxhRz67jL
 DpxrcMhekBjubCYBZUB5XNzDZw==
X-Google-Smtp-Source: AMsMyM4Zi4sKLRFeFhu+rJ2yQZJXndMNf9H1NeWhhIfBoirnv4nK0nEdKX+Zia/7SRN0e3AXMTIHEg==
X-Received: by 2002:a05:600c:1e2a:b0:3c3:d770:1756 with SMTP id
 ay42-20020a05600c1e2a00b003c3d7701756mr14158424wmb.134.1666371183770; 
 Fri, 21 Oct 2022 09:53:03 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a5d400e000000b0022ae401e9e0sm19541773wrp.78.2022.10.21.09.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:53:02 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 1/9] ASoC: qdsp6: audioreach: topology use idr_alloc_u32
Date: Fri, 21 Oct 2022 17:51:59 +0100
Message-Id: <20221021165207.13220-2-srinivas.kandagatla@linaro.org>
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

SubGraph and Module Instance ids take 32 bits, so use idr_alloc_u32
instead of idr_alloc to able to accomdate valid ranges.

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

