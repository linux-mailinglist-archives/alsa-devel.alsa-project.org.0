Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F106196AE
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 13:58:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B54A1167E;
	Fri,  4 Nov 2022 13:57:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B54A1167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667566682;
	bh=fcJRCq8vFAi69iV9pIYexezI37DVzt5sEIIONHErmt8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EMWeLb+L8s0pD+3ljGJRlBMbJMadujfDVhHL5Jt5uaRFvKnu+0pEwv1Vxql+S4WoO
	 jNlsgD+N3k3coCAAyqbymQiMlP5h4fVtHlIgTQc6zrO2ToD/XJqW1phZAnqx2VJUHW
	 j9iq9FmKA4650CGSIfSfkCjsg+ij7CnJ2hdK+x18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4484F8055B;
	Fri,  4 Nov 2022 13:56:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07EC8F80553; Fri,  4 Nov 2022 13:56:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CA2CF804AC
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 13:56:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CA2CF804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="e6K1l1Rk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667566574; x=1699102574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fcJRCq8vFAi69iV9pIYexezI37DVzt5sEIIONHErmt8=;
 b=e6K1l1RkHwUvwuZpqY0cZjFfm/+4dgp0hbQ1CqKE4m9X2vEHKxlKW60F
 Pwbo5p+OD10Gt8JrbtYFRVPk1CxSkDKiaSElvFKSZYwCqo6Ln3XrNGyWt
 DIBg2+oA2lO1hov+nY+CDXOeDuskai7T+oEkVSuo+qjhDcmkvtaEA6elp
 a7972rP88Ms4yNtx+RM+uYkw5b06c/8oxo7NbjaUI/THtYYVYGJZR7dix
 36iZ0BxLMRnxiZBDMxfglLTX56NuyC0olx3a3kj1NGJn5wtPvKomgMb09
 ePonnOB7jI8BOoqMKQ//YU+9OaVrbneBPCH5jAvbkdy8PW/3FuAIvZ+TS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="290347658"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="290347658"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 05:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="666357632"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="666357632"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga008.jf.intel.com with ESMTP; 04 Nov 2022 05:55:50 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/3] ASoC: core: Inline resume work back to resume function
Date: Fri,  4 Nov 2022 14:12:43 +0100
Message-Id: <20221104131244.3920179-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104131244.3920179-1-cezary.rojewski@intel.com>
References: <20221104131244.3920179-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Commit 6ed2597883b1 ("ALSA: ASoC: Don't block system resume") introduced
deferred_resume_work for ASoC subsystem. While this allows for potential
speed up during boot on some slow devices, it doesn't allow to properly
propagate return values in case something failed during system resume.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h  |  3 ---
 sound/soc/soc-core.c | 48 +++++++++++---------------------------------
 2 files changed, 12 insertions(+), 39 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 37bbfc8b45cb..3465aa075afe 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1005,9 +1005,6 @@ struct snd_soc_card {
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_card_root;
-#endif
-#ifdef CONFIG_PM_SLEEP
-	struct work_struct deferred_resume_work;
 #endif
 	u32 pop_time;
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a409fbed8f34..5f7e0735f0c1 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -643,17 +643,21 @@ int snd_soc_suspend(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_soc_suspend);
 
-/*
- * deferred resume work, so resume can complete before we finished
- * setting our codec back up, which can be very slow on I2C
- */
-static void soc_resume_deferred(struct work_struct *work)
+/* powers up audio subsystem after a suspend */
+int snd_soc_resume(struct device *dev)
 {
-	struct snd_soc_card *card =
-			container_of(work, struct snd_soc_card,
-				     deferred_resume_work);
+	struct snd_soc_card *card = dev_get_drvdata(dev);
 	struct snd_soc_component *component;
 
+	/* If the card is not initialized yet there is nothing to do */
+	if (!card->instantiated)
+		return 0;
+
+	/* activate pins from sleep state */
+	for_each_card_components(card, component)
+		if (snd_soc_component_active(component))
+			pinctrl_pm_select_default_state(component->dev);
+
 	/*
 	 * our power state is still SNDRV_CTL_POWER_D3hot from suspend time,
 	 * so userspace apps are blocked from touching us
@@ -686,40 +690,14 @@ static void soc_resume_deferred(struct work_struct *work)
 
 	/* userspace can access us now we are back as we were before */
 	snd_power_change_state(card->snd_card, SNDRV_CTL_POWER_D0);
-}
-
-/* powers up audio subsystem after a suspend */
-int snd_soc_resume(struct device *dev)
-{
-	struct snd_soc_card *card = dev_get_drvdata(dev);
-	struct snd_soc_component *component;
-
-	/* If the card is not initialized yet there is nothing to do */
-	if (!card->instantiated)
-		return 0;
-
-	/* activate pins from sleep state */
-	for_each_card_components(card, component)
-		if (snd_soc_component_active(component))
-			pinctrl_pm_select_default_state(component->dev);
-
-	dev_dbg(dev, "ASoC: Scheduling resume work\n");
-	if (!schedule_work(&card->deferred_resume_work))
-		dev_err(dev, "ASoC: resume work item may be lost\n");
 
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_resume);
 
-static void soc_resume_init(struct snd_soc_card *card)
-{
-	/* deferred resume work */
-	INIT_WORK(&card->deferred_resume_work, soc_resume_deferred);
-}
 #else
 #define snd_soc_suspend NULL
 #define snd_soc_resume NULL
-static inline void soc_resume_init(struct snd_soc_card *card) { }
 #endif
 
 static struct device_node
@@ -1968,8 +1946,6 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 
 	soc_init_card_debugfs(card);
 
-	soc_resume_init(card);
-
 	ret = snd_soc_dapm_new_controls(&card->dapm, card->dapm_widgets,
 					card->num_dapm_widgets);
 	if (ret < 0)
-- 
2.25.1

