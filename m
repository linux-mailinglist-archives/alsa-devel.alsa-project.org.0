Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 722DB54EC31
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 23:09:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE5561AFF;
	Thu, 16 Jun 2022 23:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE5561AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655413787;
	bh=AjgHupZHLvE1NZWH87BCLsZEPROzKa/DzGDXxR8Tc/U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TJhSFrgQbsd84GOsa1/J4x2qJYexLl43qRROcPkr9sXAlS2/zeiLJUgbnkTYw0Owt
	 8FPvmnWdHh58bVJeUggSHs7Hy3qcPWvgF6sLvtVY76Gm+y/3OOVALWNVOlhJDD4QJm
	 f97h9/3T2fVxCfF84IuTArmC96+eq2DEQ4oAY1vs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56A66F80310;
	Thu, 16 Jun 2022 23:08:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A543F80310; Thu, 16 Jun 2022 23:08:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A20F6F800F0
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 23:08:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A20F6F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="R6enkrIT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655413719; x=1686949719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AjgHupZHLvE1NZWH87BCLsZEPROzKa/DzGDXxR8Tc/U=;
 b=R6enkrITUVPs3PePY1MXnp67PZGEZ+uLQ3Lp98EVkPf/3ViSXUrwdEsd
 zP0mfAdAThyy+gd6Bsf/LyCoWPdT39vhe+Hw+kw87T2QlOlCtJQjGyknf
 yjRvaI3ucRFLjPb+sxOUBfeqVfGSX/8SQdQPLExQWYsHk1eRPisccIhrr
 vaNIEZ+eAzpO0VzktDu5yrh2zZUCMh7bMxax2Lc7pk5V5Vj+LgcOxKT8Z
 g7yIyKBcv+Pj6kioWoOtQiqtZHYS2Fr1JjIWpPB+cdAbEZqG/hOZ2R0D0
 EboijsqG7PAFMurGaHvvxGwbnsoRwZlvimaCr+/Ks0Nf3yV2QJF7P/R2S A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="276926842"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="276926842"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:08:34 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="831736149"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:08:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: SOF: pcm: use pm_resume_and_get() on component probe
Date: Thu, 16 Jun 2022 16:08:24 -0500
Message-Id: <20220616210825.132093-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616210825.132093-1-pierre-louis.bossart@linux.intel.com>
References: <20220616210825.132093-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Before initiating IPC and/or bus transactions when loading the
topology during a component probe, which happens on card
registration/creation, make sure the device for the SOF driver is
pm_runtime active.

The SOF probe is not necessarily followed by the component probe, such
a timing assumption can be broken in driver bind/unbind tests. This
can be artifially shown if the module for the machine driver is
'blacklisted' and the SOF device becomes pm_runtime_suspended before
manually calling modprobe to register the card.

In an initial experiment, pm_resume_and_get() was called from
soc-component.c, since the current ASoC component model is arguably
missing dependencies between component status and device
status. However this approach proved too invasive and breaks all
existing HDMI playback solutions on Intel platforms.

While this will result in duplication of code, generating pm_runtime
transitions only if strictly required for a given component makes more
sense overall. This patch adds the pm_runtime resume transition for
SOF only.

BugLink: https://github.com/thesofproject/linux/issues/3651
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/pcm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index a76d0b5b2ad95..27504abc5385f 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -604,6 +604,14 @@ static int sof_pcm_probe(struct snd_soc_component *component)
 	const char *tplg_filename;
 	int ret;
 
+	/*
+	 * make sure the device is pm_runtime_active before loading the
+	 * topology and initiating IPC or bus transactions
+	 */
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
 	/* load the default topology */
 	sdev->component = component;
 
@@ -621,6 +629,9 @@ static int sof_pcm_probe(struct snd_soc_component *component)
 		return ret;
 	}
 
+	pm_runtime_mark_last_busy(component->dev);
+	pm_runtime_put_autosuspend(component->dev);
+
 	return ret;
 }
 
-- 
2.34.1

