Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E17607CED
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 18:55:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 634DD9836;
	Fri, 21 Oct 2022 18:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 634DD9836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666371329;
	bh=KfW1hlHMNgJQypRQCxzdQWW2wwJd9o/e+rt09r2PsYQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WOj+EgZ8GcUDf9eVRNBf5DC3/c+AlXDxTUX5bUV8hourI0hUZoOsWXyriAHch/sd7
	 /SNjvV5NHE0Bd3PwbIn4KwgpAlDNXE0SUXbLr18qLF8IIDmi1iCr0+faRo4y0W+9gu
	 cNvEmjD30imsJRsGnQZbBBEzbstFjwA2g1MWWkVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAB26F80553;
	Fri, 21 Oct 2022 18:53:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B36DCF8056F; Fri, 21 Oct 2022 18:53:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF14BF80548
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 18:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF14BF80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RnL67RMk"
Received: by mail-wm1-x332.google.com with SMTP id
 az22-20020a05600c601600b003c6b72797fdso2424976wmb.5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 09:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JOZVp/Ggs8l86OX0u92Nyg/+QC7QhjHhV1ZLVFPgdYY=;
 b=RnL67RMkA+EJ3Aokp+TMvkQH8J/bZTNsUsG+3rsseURrIibiPD3Zf5PxOiguP7S1CR
 2Jxd3581YdcKRV153AIqR/ys8GrkxkExOkxJsPNh+2p2lsb3X9QbxOYEdNxSSe9hu+aG
 MQMKqAbuDh8wvfHw6AF7I/Jzs2sZ2kzoYzhO0o3o3f/5M3oDynSaxQchvYm3dmqXhHso
 RJG15erItdianrV6fjqWuTKenHcBP9q+umC9i50q/FY4iOIKMrN5fUa52OTB66JD5Amu
 5TbU/qzw7zofHnmW4TPL4nX8444lXIWY5M5KhNoL8IWZLTG5RbIOhKMh4fEum+YVyGvD
 PHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JOZVp/Ggs8l86OX0u92Nyg/+QC7QhjHhV1ZLVFPgdYY=;
 b=Fl0FqOgvkgK2FlJYaS90v2ilzRdyH/Poqi2pvD8uOmh2Azd9Y4mFVBV0mMMiTnJK1H
 M5XYFSCYOTC88hgkQiaXk2xtrzTNDhdfpS3qF/QUlW7U7hAfYrog3cxZMMzAOGNCOREl
 2KzKfg4X6kbckDaSS4mrnPO3GfFZ5I1YyZQBGfccqg5o+7W1wpTZHaeuvCIjE3mL5UpR
 un7QA4vWahjlLWGZZwT60kHV9yWzf6faYedNkr+LXRmfnoJY+P0HZ99zaxcXifjDeBy4
 3MqgyUFMgA4RPMHa9XUgwBaXZmJdvAA1NRqB1vX0B4qwrXUz1Bp/uu4JVmPiYy8oW4aL
 f3xQ==
X-Gm-Message-State: ACrzQf1A320E3BaPSounmjP8lGQqKgYHA9b91dWmtUwFUzmyBHsVbCUf
 yAP7tYuKhwVd15yivI8bfB9aBKoPUTN6RQ==
X-Google-Smtp-Source: AMsMyM6bZ7Fut46UXEJXz3eujYSaD80z2+GiG97gw0xTThTm7k6gES7WQlr3TWe++w7wEw6MgmtBuQ==
X-Received: by 2002:a05:600c:4e50:b0:3c6:faaa:1e7d with SMTP id
 e16-20020a05600c4e5000b003c6faaa1e7dmr14310340wmq.9.1666371191002; 
 Fri, 21 Oct 2022 09:53:11 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a5d400e000000b0022ae401e9e0sm19541773wrp.78.2022.10.21.09.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:53:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 5/9] ASoC: qdsp6: audioreach: simplify module_list sz
 calculation
Date: Fri, 21 Oct 2022 17:52:03 +0100
Message-Id: <20221021165207.13220-6-srinivas.kandagatla@linaro.org>
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

Simplify module_list size calcuation by doing inside modules loop.

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

