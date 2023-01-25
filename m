Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFE967B1E1
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 12:48:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B904A204;
	Wed, 25 Jan 2023 12:47:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B904A204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674647304;
	bh=25+CLm6DetOtNJ3dCEFBF2Wj/gQVZLnhDxk8ldVyvMQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FCoejo72Kp246wSAR9EZ/m86pbfBxi0R2QgPl/07MBQ/kOdW/YVFAI7ag2J9z4pVJ
	 Wut3WgLzlRwZUuuVgi74+tiR2HUdVJedMKmlwGUN6lhNCx/7/k000d883cWvmrwMAi
	 kq+DOjuum0PbU2EEgBbN5a7hq700zsoaAw4T29Ys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFF76F80557;
	Wed, 25 Jan 2023 12:46:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A71AF8053D; Wed, 25 Jan 2023 12:46:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFC0DF804C2
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 12:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFC0DF804C2
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eda41keX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674647175; x=1706183175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=25+CLm6DetOtNJ3dCEFBF2Wj/gQVZLnhDxk8ldVyvMQ=;
 b=eda41keXL3sFMzfCHyI6LpRxlegByPmSfS1kw1JU5oz4padBlRFAHsdD
 AnVLP8fnT726oq+3xqHl+JNn4jxsubycSUiollDt1eNdx3oNP8ufLDnBV
 c2/VyS7Nb2wgF4ERZ8uqxvwZ3BsBrG0Hk8IRN65loGNEPhW7AtwpSBQD1
 6l9Yl6SeRLiPKJapGC8UK8AkKaeHM/9anhPx88uQqfDRXote5Ynqp3+O9
 +5+/LRMes1LJJpA/qSaue4NS8o7cHsFEmuVUV1Ho/qdHgdzcy4YiokbKY
 OxLTlr8ohqP6Ki5i2o74BknGcwaiIzFTvAd03Bh5e0uKeMvMxshq6zLnh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="324234220"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="324234220"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:46:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="612394026"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="612394026"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga003.jf.intel.com with ESMTP; 25 Jan 2023 03:46:10 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 07/11] ASoC: topology: Pass correct pointer instead of casting
Date: Wed, 25 Jan 2023 20:46:45 +0100
Message-Id: <20230125194649.3485731-8-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
References: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
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
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Instead of passing address of structure, the containg structure is
casted to target structure. While it works - the expected structure is
the first field of containing one - it is bad practice, fix this by
passing pointer to structure field.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
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

