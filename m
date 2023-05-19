Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9803F7096ED
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 13:57:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BD60827;
	Fri, 19 May 2023 13:56:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BD60827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684497432;
	bh=b0vw4/BWWUzYHBzT8kf0bK3WB1iPtl55IGzU8yqtfiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OFlgoVJVOaRz0+1Pdp3OF3/hojjUnf5mTyuFgLGCkI5CXoHQH5bABRgfke8jyZuVa
	 qpVVdeW/ziVcyNh9WUwves6aPfJ5FFcDF2ji/car0sjFJLSKhEdZcpaJdbwhCG9rDa
	 acE6Ci4rHgyzA64rYqDS8S1DaRHiJb2ZNOSr6AS4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2718BF8057C; Fri, 19 May 2023 13:55:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E649F80579;
	Fri, 19 May 2023 13:55:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F4EDF80558; Fri, 19 May 2023 13:55:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38D22F8016D
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 13:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38D22F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J71f1TcR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684497300; x=1716033300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b0vw4/BWWUzYHBzT8kf0bK3WB1iPtl55IGzU8yqtfiA=;
  b=J71f1TcRo1UaVshBz/zRjwY3s1NI8Ug5TL3Dt5+aQqoYMHQZNz5GJwSj
   FVkq6K4az6RSqZILKNbET8/2KDeEM6vTa6pvUTRuOS1XEjke00TKQ0epW
   UptlEcFGB1Fh06s+n3gptMzMEIj+55lf8PyqyPfyDILlMyCLbNYqi8CsK
   eQA1UmqLNBduzdVLzp67dx1HEc76B4wihjkm5G74zaCw9eRUlHb4omojI
   PWe+q0h58M0DTCnDsuSvQhJcD2EgJyfoR+EQMM464f+Tod0gsr46pNjF/
   H93nPwJ9XNwUjf8SXT6dKVscSwGDPvR7fu7aDIlqPUE1BEI3QClyVz39c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="336946024"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="336946024"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 04:54:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="705593793"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="705593793"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga007.fm.intel.com with ESMTP; 19 May 2023 04:54:54 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 1/5] ASoC: topology: Log control load errors in
 soc_tplg_control_load()
Date: Fri, 19 May 2023 21:56:07 +0200
Message-Id: <20230519195611.4068853-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519195611.4068853-1-amadeuszx.slawinski@linux.intel.com>
References: <20230519195611.4068853-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ES7RQRBWRFMN7UF4XCG5FBBP4N7IWMQE
X-Message-ID-Hash: ES7RQRBWRFMN7UF4XCG5FBBP4N7IWMQE
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ES7RQRBWRFMN7UF4XCG5FBBP4N7IWMQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simplify code by logging any errors in function that does the actual
work instead of doing so in its callers.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 47ab5cf99497..242abbd875fa 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -585,11 +585,15 @@ EXPORT_SYMBOL_GPL(snd_soc_tplg_widget_bind_event);
 static int soc_tplg_control_load(struct soc_tplg *tplg,
 	struct snd_kcontrol_new *k, struct snd_soc_tplg_ctl_hdr *hdr)
 {
+	int ret = 0;
+
 	if (tplg->ops && tplg->ops->control_load)
-		return tplg->ops->control_load(tplg->comp, tplg->index, k,
-			hdr);
+		ret = tplg->ops->control_load(tplg->comp, tplg->index, k, hdr);
 
-	return 0;
+	if (ret)
+		dev_err(tplg->dev, "ASoC: failed to init %s\n", hdr->name);
+
+	return ret;
 }
 
 
@@ -691,10 +695,8 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, size_t size)
 
 	/* pass control to driver for optional further init */
 	ret = soc_tplg_control_load(tplg, &kc, &be->hdr);
-	if (ret < 0) {
-		dev_err(tplg->dev, "ASoC: failed to init %s\n", be->hdr.name);
+	if (ret < 0)
 		goto err;
-	}
 
 	/* register control here */
 	ret = soc_tplg_add_kcontrol(tplg, &kc, &sbe->dobj.control.kcontrol);
@@ -776,10 +778,8 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, size_t size)
 
 	/* pass control to driver for optional further init */
 	ret = soc_tplg_control_load(tplg, &kc, &mc->hdr);
-	if (ret < 0) {
-		dev_err(tplg->dev, "ASoC: failed to init %s\n", mc->hdr.name);
+	if (ret < 0)
 		goto err;
-	}
 
 	/* register control here */
 	ret = soc_tplg_add_kcontrol(tplg, &kc, &sm->dobj.control.kcontrol);
@@ -945,10 +945,8 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, size_t size)
 
 	/* pass control to driver for optional further init */
 	ret = soc_tplg_control_load(tplg, &kc, &ec->hdr);
-	if (ret < 0) {
-		dev_err(tplg->dev, "ASoC: failed to init %s\n", ec->hdr.name);
+	if (ret < 0)
 		goto err;
-	}
 
 	/* register control here */
 	ret = soc_tplg_add_kcontrol(tplg, &kc, &se->dobj.control.kcontrol);
@@ -1162,11 +1160,8 @@ static int soc_tplg_dapm_widget_dmixer_create(struct soc_tplg *tplg, struct snd_
 
 	/* pass control to driver for optional further init */
 	err = soc_tplg_control_load(tplg, kc, &mc->hdr);
-	if (err < 0) {
-		dev_err(tplg->dev, "ASoC: failed to init %s\n",
-			mc->hdr.name);
+	if (err < 0)
 		return err;
-	}
 
 	return 0;
 }
@@ -1246,11 +1241,8 @@ static int soc_tplg_dapm_widget_denum_create(struct soc_tplg *tplg, struct snd_k
 
 	/* pass control to driver for optional further init */
 	err = soc_tplg_control_load(tplg, kc, &ec->hdr);
-	if (err < 0) {
-		dev_err(tplg->dev, "ASoC: failed to init %s\n",
-			ec->hdr.name);
+	if (err < 0)
 		return err;
-	}
 
 	return 0;
 }
@@ -1298,11 +1290,8 @@ static int soc_tplg_dapm_widget_dbytes_create(struct soc_tplg *tplg, struct snd_
 
 	/* pass control to driver for optional further init */
 	err = soc_tplg_control_load(tplg, kc, &be->hdr);
-	if (err < 0) {
-		dev_err(tplg->dev, "ASoC: failed to init %s\n",
-			be->hdr.name);
+	if (err < 0)
 		return err;
-	}
 
 	return 0;
 }
-- 
2.34.1

