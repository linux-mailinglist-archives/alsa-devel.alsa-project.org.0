Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA204EECCD
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 14:04:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9F611A5E;
	Fri,  1 Apr 2022 14:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9F611A5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648814662;
	bh=ZJ7PZDtj2cJTotXfaME9bXbPIE0eX6Cd3oqrQIJCo4U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kU1tXJD2l1/hhNbX6K9V3RlEMtZkyCVZOcF03v2rLC6pDghe/wXHVea9o/WKqRuyw
	 cdhqBhJ65praVR8Eo7cPeaXUtebZE+cecgW9aDC0PTmoE26rELENDuWT4XW+/i9t4G
	 DXFdI5vElUQzLbLaZ0QLgcAGgrEy8YtbF+7pu+jE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7021EF80528;
	Fri,  1 Apr 2022 14:02:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41CA3F80526; Fri,  1 Apr 2022 14:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F22BF8047D
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 14:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F22BF8047D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FHO1LPGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648814546; x=1680350546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZJ7PZDtj2cJTotXfaME9bXbPIE0eX6Cd3oqrQIJCo4U=;
 b=FHO1LPGtJ+M61YvREbQGVy9RLK09lNu0+pCQk4rZ2glpUwnvafOjEAVv
 sICCcvtTw9X8wasL2szbf680TfQ8URDeBtXa8/gAe9qZoCD7nO1fXdlel
 BefMHxoW07B5stPc2TpUDMqEbwt+uB2UqFc9wAi1ahIVeXfmqhm4jYHKN
 /tKKn08e+iqrDHlNGStNZzpr6UKRB9+6taLH8sfNRTeCENASSWVxGhbfl
 HHfWCGxDfG+yRM9nqf/vyYx2eDgu9pYkZ8GPVZPlmB1ldoA4XafE6wdqY
 9/pyzQbq7Mij4FhjiJ3QLV25g8T6+al1dD5+VuENIIzAC/p/llssHzXJ4 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="240705826"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="240705826"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:02:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="567432098"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 01 Apr 2022 05:02:18 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 6/6] ASoC: topology: Rename soc_tplg_init_kcontrol() function
Date: Fri,  1 Apr 2022 14:02:00 +0200
Message-Id: <20220401120200.4047867-7-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401120200.4047867-1-amadeuszx.slawinski@linux.intel.com>
References: <20220401120200.4047867-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Other functions used for callbacks are named after function they call,
however function calling control_load seems to be an exception. Rename
it to soc_tplg_control_load().

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 3390bf0f8295..ddbc05306a8f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -618,7 +618,7 @@ int snd_soc_tplg_widget_bind_event(struct snd_soc_dapm_widget *w,
 EXPORT_SYMBOL_GPL(snd_soc_tplg_widget_bind_event);
 
 /* optionally pass new dynamic kcontrol to component driver. */
-static int soc_tplg_init_kcontrol(struct soc_tplg *tplg,
+static int soc_tplg_control_load(struct soc_tplg *tplg,
 	struct snd_kcontrol_new *k, struct snd_soc_tplg_ctl_hdr *hdr)
 {
 	if (tplg->ops && tplg->ops->control_load)
@@ -725,7 +725,7 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, size_t size)
 	}
 
 	/* pass control to driver for optional further init */
-	ret = soc_tplg_init_kcontrol(tplg, &kc, (struct snd_soc_tplg_ctl_hdr *)be);
+	ret = soc_tplg_control_load(tplg, &kc, (struct snd_soc_tplg_ctl_hdr *)be);
 	if (ret < 0) {
 		dev_err(tplg->dev, "ASoC: failed to init %s\n", be->hdr.name);
 		goto err;
@@ -809,7 +809,7 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, size_t size)
 	}
 
 	/* pass control to driver for optional further init */
-	ret = soc_tplg_init_kcontrol(tplg, &kc, (struct snd_soc_tplg_ctl_hdr *)mc);
+	ret = soc_tplg_control_load(tplg, &kc, (struct snd_soc_tplg_ctl_hdr *)mc);
 	if (ret < 0) {
 		dev_err(tplg->dev, "ASoC: failed to init %s\n", mc->hdr.name);
 		goto err;
@@ -977,7 +977,7 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, size_t size)
 	}
 
 	/* pass control to driver for optional further init */
-	ret = soc_tplg_init_kcontrol(tplg, &kc, (struct snd_soc_tplg_ctl_hdr *)ec);
+	ret = soc_tplg_control_load(tplg, &kc, (struct snd_soc_tplg_ctl_hdr *)ec);
 	if (ret < 0) {
 		dev_err(tplg->dev, "ASoC: failed to init %s\n", ec->hdr.name);
 		goto err;
@@ -1193,8 +1193,7 @@ static int soc_tplg_dapm_widget_dmixer_create(struct soc_tplg *tplg, struct snd_
 	}
 
 	/* pass control to driver for optional further init */
-	err = soc_tplg_init_kcontrol(tplg, kc,
-				     (struct snd_soc_tplg_ctl_hdr *)mc);
+	err = soc_tplg_control_load(tplg, kc, (struct snd_soc_tplg_ctl_hdr *)mc);
 	if (err < 0) {
 		dev_err(tplg->dev, "ASoC: failed to init %s\n",
 			mc->hdr.name);
@@ -1278,8 +1277,7 @@ static int soc_tplg_dapm_widget_denum_create(struct soc_tplg *tplg, struct snd_k
 	}
 
 	/* pass control to driver for optional further init */
-	err = soc_tplg_init_kcontrol(tplg, kc,
-				     (struct snd_soc_tplg_ctl_hdr *)ec);
+	err = soc_tplg_control_load(tplg, kc, (struct snd_soc_tplg_ctl_hdr *)ec);
 	if (err < 0) {
 		dev_err(tplg->dev, "ASoC: failed to init %s\n",
 			ec->hdr.name);
@@ -1331,8 +1329,7 @@ static int soc_tplg_dapm_widget_dbytes_create(struct soc_tplg *tplg, struct snd_
 	}
 
 	/* pass control to driver for optional further init */
-	err = soc_tplg_init_kcontrol(tplg, kc,
-				     (struct snd_soc_tplg_ctl_hdr *)be);
+	err = soc_tplg_control_load(tplg, kc, (struct snd_soc_tplg_ctl_hdr *)be);
 	if (err < 0) {
 		dev_err(tplg->dev, "ASoC: failed to init %s\n",
 			be->hdr.name);
-- 
2.25.1

