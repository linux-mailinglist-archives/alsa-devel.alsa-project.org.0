Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 805BA6196AD
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 13:57:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27E851664;
	Fri,  4 Nov 2022 13:57:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27E851664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667566676;
	bh=XKlb2jcWfVJnjIFMeDNH4bjJ4sd9I/JknSJojvq83WE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mcmWDr53Lq2ePg/MtxgTerLqwqYQJVP+UYFphcjBJi3alxt689hTEYTIOLBVeQOeU
	 cI+IIX+nZaJhwS8Hg9qZYyuMrNxeFbHZ1GKxRJS/FqgDScFBP6hdjgtlKH2RMvhz0G
	 +WuRqPq8cD7zXdBVwFGGbh8RIi3aSs6FwOggn+ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E0D3F804AC;
	Fri,  4 Nov 2022 13:56:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5C49F80553; Fri,  4 Nov 2022 13:56:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADF14F80155
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 13:56:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADF14F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gHWyjgJ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667566575; x=1699102575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XKlb2jcWfVJnjIFMeDNH4bjJ4sd9I/JknSJojvq83WE=;
 b=gHWyjgJ9K+snFdlPHUwei+v4PplgpIjNS9t0t9Yg0cXNW//GC+xRM9FT
 MwiN6ghNTKxi7VMMkywrIBxusMUc0LOaef0NDTRLSrKrSFN2a7AHfbhdY
 bmm/kvVYLBBFxBJ2F0i8uaqpWW9FdGNgsldbujkSwO2kmGHvLtPx4lfQe
 c+9yKkJWQJWYD9+9lDRC/Vq5ONjMPilUgpEPmdIKFVTCfyb1hROA6dB/y
 dfEC7ev0rgG2Z34WQI+yjppzt4qHtDl4O9L7KabhV3priga42oqeDPOh0
 Zf1ucO0ea6V7+S/foGq44JEk+OZ+5cAcwWXbq3AZX9lriDM+80+ZUHzpo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="290347662"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="290347662"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 05:55:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="666357639"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="666357639"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga008.jf.intel.com with ESMTP; 04 Nov 2022 05:55:52 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/3] ASoC: core: Propagate component suspend/resume errors
Date: Fri,  4 Nov 2022 14:12:44 +0100
Message-Id: <20221104131244.3920179-4-cezary.rojewski@intel.com>
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

In case there is a failure during component suspend/resume, error should
be propagated back to callers.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-core.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 5f7e0735f0c1..931b4dc95234 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -550,6 +550,7 @@ int snd_soc_suspend(struct device *dev)
 	struct snd_soc_card *card = dev_get_drvdata(dev);
 	struct snd_soc_component *component;
 	struct snd_soc_pcm_runtime *rtd;
+	int ret = 0;
 	int i;
 
 	/* If the card is not initialized yet there is nothing to do */
@@ -623,7 +624,14 @@ int snd_soc_suspend(struct device *dev)
 				fallthrough;
 
 			case SND_SOC_BIAS_OFF:
-				snd_soc_component_suspend(component);
+				ret = snd_soc_component_suspend(component);
+				if (ret) {
+					dev_err(component->dev,
+						"ASoC: Suspend component %s failed: %d\n",
+						component->name, ret);
+					goto exit;
+				}
+
 				if (component->regmap)
 					regcache_mark_dirty(component->regmap);
 				/* deactivate pins to sleep state */
@@ -639,7 +647,8 @@ int snd_soc_suspend(struct device *dev)
 
 	snd_soc_card_suspend_post(card);
 
-	return 0;
+exit:
+	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_suspend);
 
@@ -648,6 +657,7 @@ int snd_soc_resume(struct device *dev)
 {
 	struct snd_soc_card *card = dev_get_drvdata(dev);
 	struct snd_soc_component *component;
+	int ret = 0;
 
 	/* If the card is not initialized yet there is nothing to do */
 	if (!card->instantiated)
@@ -671,8 +681,14 @@ int snd_soc_resume(struct device *dev)
 	snd_soc_card_resume_pre(card);
 
 	for_each_card_components(card, component) {
-		if (snd_soc_component_is_suspended(component))
-			snd_soc_component_resume(component);
+		if (snd_soc_component_is_suspended(component)) {
+			ret = snd_soc_component_resume(component);
+			if (ret) {
+				dev_err(component->dev, "ASoC: Resume component %s failed: %d\n",
+					component->name, ret);
+				goto exit;
+			}
+		}
 	}
 
 	soc_dapm_suspend_resume(card, SND_SOC_DAPM_STREAM_RESUME);
@@ -691,7 +707,8 @@ int snd_soc_resume(struct device *dev)
 	/* userspace can access us now we are back as we were before */
 	snd_power_change_state(card->snd_card, SNDRV_CTL_POWER_D0);
 
-	return 0;
+exit:
+	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_resume);
 
-- 
2.25.1

