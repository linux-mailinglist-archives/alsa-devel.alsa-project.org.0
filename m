Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 911176718B7
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 11:14:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D30923C0E;
	Wed, 18 Jan 2023 11:13:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D30923C0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674036871;
	bh=ZaTfT/TzpnziENBD0LGWp+bLkuEkhKUfAkz7DfPjrrw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bHYDh+1dQL1ipN/g8KISzmJq0Pk2RLyK0cf5YWvmXobtpcexl4DSDMgIYJKeBBfsF
	 2LrvAzXAp64NPCtun84Kr4/74TNqCp/jFpNk1xbrJbID5O1k32SdzLL/qfxPimttPa
	 6rsRcK66rHXwt5KXuTWbmx/FtDBWrMWAI2uNsbhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E2F9F804BC;
	Wed, 18 Jan 2023 11:13:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E295F80482; Wed, 18 Jan 2023 11:13:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27A19F8026D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 11:13:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27A19F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=I49RcDmz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674036782; x=1705572782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZaTfT/TzpnziENBD0LGWp+bLkuEkhKUfAkz7DfPjrrw=;
 b=I49RcDmzl/qHH3KXmdYpRl4omQsRJDZASpgWApCko7x2BcU6kjopk9DN
 r5Lp5U40CyFlC/t8mle4dcPtyG5/55y7yUofjZSotvFJh1RZJ8l9PbLAm
 ny/ChiL3S+1gwxqI6oTDtsazmgPa7r+gFfkCG//wvjAVOD08gTvm3QE14
 rUwiWPVmAbg2yQ+AZPdwAl/jBhpz1gzXKFIJsHcjB30O2ngHfUQHjRITy
 1v935LxAsyr4G0c/GhGbCRu0CIeTuzH314odCECu9IT1jvJ0rsjJ4X86E
 cd/5JOU94iOC2SSQY5fW63PuNBIrfnW0rzPG73E0or/1iceddoKHbWGV6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="304630440"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="304630440"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 02:12:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="661653795"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="661653795"
Received: from kevinkeo-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.26.150])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 02:12:53 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v3 1/3] ASoC: SOF: sof-audio: unprepare when
 swidget->use_count > 0
Date: Wed, 18 Jan 2023 12:12:53 +0200
Message-Id: <20230118101255.29139-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118101255.29139-1-peter.ujfalusi@linux.intel.com>
References: <20230118101255.29139-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We should unprepare the widget if its use_count = 1.

Fixes: 9862dcf70245 ("ASoC: SOF: don't unprepare widget used other pipelines")
Cc: <stable@vger.kernel.org> # 6.1
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 7306a2649857..e52ef62ce7a3 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -272,7 +272,7 @@ sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widg
 	struct snd_soc_dapm_path *p;
 
 	/* return if the widget is in use or if it is already unprepared */
-	if (!swidget->prepared || swidget->use_count > 1)
+	if (!swidget->prepared || swidget->use_count > 0)
 		return;
 
 	if (widget_ops[widget->id].ipc_unprepare)
-- 
2.39.0

