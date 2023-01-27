Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7257B67E929
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 16:13:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74206DEE;
	Fri, 27 Jan 2023 16:12:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74206DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674832421;
	bh=DZxShMeDJdCJ9ZWYAt7p149NTuNjLiDi7dB+qw8x9lE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qLveLnwmi9008F+QIFe18Qj+Q6FJ+tfUqfBbXTb1Vm5EBsLX8cfdmH03iczB48WCn
	 EOLEGe7h5IqThZi/kvAyjrlKokqvdENzVraddC2U/ZLsUKwMMbnak8y7ygCME8eSCN
	 SeAh+AUjIA/hg8RuNbGwCtm3oaZY2UackB4lURuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8D80F8057F;
	Fri, 27 Jan 2023 16:10:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20829F80568; Fri, 27 Jan 2023 16:10:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE58BF80543
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 16:10:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE58BF80543
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FugZb2xh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674832227; x=1706368227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DZxShMeDJdCJ9ZWYAt7p149NTuNjLiDi7dB+qw8x9lE=;
 b=FugZb2xhbERBwbC9aBVLtiu9q6l4uZa51v7OR25ksdewblUTjg/Y8ApW
 94IFbcHXUmkGSZOkj2ujtyBXfHhlAk9xTqYhL8Dzd5Y2LcmMSeJSfPb7M
 FNkc1fC15rksqfv70iM52QuUtHYjqRxTq/LHsousXDAMzHd3FFEvzGEGf
 3lsOqQDwUXPIu7HYpKmDKQz05IUWBsSML0BMY2cuDCEty0/6vojNEHefF
 TISmaSV4EvAX/uqcphfgW4f1zOT0pSO0z2nU42Aogk4MgjV5IE8ZZTLkI
 h5Hs7AtceI/lT3xt3gSkZniCM2+7wMtwFIuwwDSIcR5pSnbV2wjhw9rAs g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="324795829"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="324795829"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 07:10:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="908709024"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="908709024"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jan 2023 07:10:23 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 07/11] ASoC: topology: Pass correct pointer instead of casting
Date: Sat, 28 Jan 2023 00:11:07 +0100
Message-Id: <20230127231111.937721-8-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
References: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Instead of passing address of structure, the containing structure is
cast to target structure. While it works - the expected structure is the
first field of containing one - it is bad practice, fix this by passing
pointer to structure field.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 766de161aa4a..c35c0c53a184 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -721,7 +721,7 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, size_t size)
 	}
 
 	/* pass control to driver for optional further init */
-	ret = soc_tplg_control_load(tplg, &kc, (struct snd_soc_tplg_ctl_hdr *)be);
+	ret = soc_tplg_control_load(tplg, &kc, &be->hdr);
 	if (ret < 0) {
 		dev_err(tplg->dev, "ASoC: failed to init %s\n", be->hdr.name);
 		goto err;
@@ -805,7 +805,7 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, size_t size)
 	}
 
 	/* pass control to driver for optional further init */
-	ret = soc_tplg_control_load(tplg, &kc, (struct snd_soc_tplg_ctl_hdr *)mc);
+	ret = soc_tplg_control_load(tplg, &kc, &mc->hdr);
 	if (ret < 0) {
 		dev_err(tplg->dev, "ASoC: failed to init %s\n", mc->hdr.name);
 		goto err;
@@ -973,7 +973,7 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, size_t size)
 	}
 
 	/* pass control to driver for optional further init */
-	ret = soc_tplg_control_load(tplg, &kc, (struct snd_soc_tplg_ctl_hdr *)ec);
+	ret = soc_tplg_control_load(tplg, &kc, &ec->hdr);
 	if (ret < 0) {
 		dev_err(tplg->dev, "ASoC: failed to init %s\n", ec->hdr.name);
 		goto err;
@@ -1189,7 +1189,7 @@ static int soc_tplg_dapm_widget_dmixer_create(struct soc_tplg *tplg, struct snd_
 	}
 
 	/* pass control to driver for optional further init */
-	err = soc_tplg_control_load(tplg, kc, (struct snd_soc_tplg_ctl_hdr *)mc);
+	err = soc_tplg_control_load(tplg, kc, &mc->hdr);
 	if (err < 0) {
 		dev_err(tplg->dev, "ASoC: failed to init %s\n",
 			mc->hdr.name);
@@ -1273,7 +1273,7 @@ static int soc_tplg_dapm_widget_denum_create(struct soc_tplg *tplg, struct snd_k
 	}
 
 	/* pass control to driver for optional further init */
-	err = soc_tplg_control_load(tplg, kc, (struct snd_soc_tplg_ctl_hdr *)ec);
+	err = soc_tplg_control_load(tplg, kc, &ec->hdr);
 	if (err < 0) {
 		dev_err(tplg->dev, "ASoC: failed to init %s\n",
 			ec->hdr.name);
@@ -1325,7 +1325,7 @@ static int soc_tplg_dapm_widget_dbytes_create(struct soc_tplg *tplg, struct snd_
 	}
 
 	/* pass control to driver for optional further init */
-	err = soc_tplg_control_load(tplg, kc, (struct snd_soc_tplg_ctl_hdr *)be);
+	err = soc_tplg_control_load(tplg, kc, &be->hdr);
 	if (err < 0) {
 		dev_err(tplg->dev, "ASoC: failed to init %s\n",
 			be->hdr.name);
-- 
2.25.1

