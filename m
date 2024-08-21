Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 937CA95AF5B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 09:33:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14C6C836;
	Thu, 22 Aug 2024 09:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14C6C836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724312007;
	bh=piXbiGVvY4Z7McD5MuSb1uPg8CaOYhJJ02CXfa8WQVo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vWE0UxDUjjr20iLCvJmjOBAHPte8fZEV/kKQxyDFA9AkaRWSBQ80h+DQiobkuUbf6
	 +B+9ep3JDUBR3iM67MaGl7URnA3G+PGu/36AvZ0P+Ai3CMjwrVkBZDbUxzKMeKZVlX
	 17fyV84qBjj3g9Vl1UQtKTO47ucSC3b/KG/iJeA4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E7F1F806CC; Thu, 22 Aug 2024 09:31:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F713F8069D;
	Thu, 22 Aug 2024 09:31:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4097F80580; Wed, 21 Aug 2024 09:03:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C50A0F800F0
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 09:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C50A0F800F0
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WpcdJ2HyVzpTMd;
	Wed, 21 Aug 2024 14:59:16 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 7636518006C;
	Wed, 21 Aug 2024 15:00:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 Aug
 2024 15:00:47 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <peter.ujfalusi@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH -next 2/5] sound/soc remove unused substream in macro
 soc_component_mark_pop
Date: Wed, 21 Aug 2024 15:08:12 +0800
Message-ID: <20240821070815.2326534-3-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821070815.2326534-1-lihongbo22@huawei.com>
References: <20240821070815.2326534-1-lihongbo22@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-MailFrom: lihongbo22@huawei.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JFUNM6WK65BYDIAHZE56OZHJEGIYZWA7
X-Message-ID-Hash: JFUNM6WK65BYDIAHZE56OZHJEGIYZWA7
X-Mailman-Approved-At: Thu, 22 Aug 2024 07:28:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFUNM6WK65BYDIAHZE56OZHJEGIYZWA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The soc_component_mark_pop don't need substream, and also
substream is not used in this macro, so we can remove it.
This is detected by macro_checker.py script.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 sound/soc/soc-component.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index b3d7bb91e294..b67ef78f405c 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -58,7 +58,7 @@ static inline int soc_component_field_shift(struct snd_soc_component *component,
  * In such case, we can update these macros.
  */
 #define soc_component_mark_push(component, substream, tgt)	((component)->mark_##tgt = substream)
-#define soc_component_mark_pop(component, substream, tgt)	((component)->mark_##tgt = NULL)
+#define soc_component_mark_pop(component, tgt)	((component)->mark_##tgt = NULL)
 #define soc_component_mark_match(component, substream, tgt)	((component)->mark_##tgt == substream)
 
 void snd_soc_component_set_aux(struct snd_soc_component *component,
@@ -339,7 +339,7 @@ void snd_soc_component_module_put(struct snd_soc_component *component,
 		module_put(component->dev->driver->owner);
 
 	/* remove the mark from module */
-	soc_component_mark_pop(component, mark, module);
+	soc_component_mark_pop(component, module);
 }
 
 int snd_soc_component_open(struct snd_soc_component *component,
@@ -370,7 +370,7 @@ int snd_soc_component_close(struct snd_soc_component *component,
 		ret = component->driver->close(component, substream);
 
 	/* remove marked substream */
-	soc_component_mark_pop(component, substream, open);
+	soc_component_mark_pop(component, open);
 
 	return soc_component_ret(component, ret);
 }
@@ -515,7 +515,7 @@ void snd_soc_component_compr_free(struct snd_soc_component *component,
 		component->driver->compress_ops->free(component, cstream);
 
 	/* remove marked substream */
-	soc_component_mark_pop(component, cstream, compr_open);
+	soc_component_mark_pop(component, compr_open);
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_compr_free);
 
@@ -1210,7 +1210,7 @@ void snd_soc_pcm_component_hw_free(struct snd_pcm_substream *substream,
 		}
 
 		/* remove marked substream */
-		soc_component_mark_pop(component, substream, hw_params);
+		soc_component_mark_pop(component, hw_params);
 	}
 }
 
@@ -1254,7 +1254,7 @@ int snd_soc_pcm_component_trigger(struct snd_pcm_substream *substream,
 			r = soc_component_trigger(component, substream, cmd);
 			if (r < 0)
 				ret = r; /* use last ret */
-			soc_component_mark_pop(component, substream, trigger);
+			soc_component_mark_pop(component, trigger);
 		}
 	}
 
@@ -1294,7 +1294,7 @@ void snd_soc_pcm_component_pm_runtime_put(struct snd_soc_pcm_runtime *rtd,
 		pm_runtime_put_autosuspend(component->dev);
 
 		/* remove marked stream */
-		soc_component_mark_pop(component, stream, pm);
+		soc_component_mark_pop(component, pm);
 	}
 }
 
-- 
2.34.1

