Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DEA67E46A
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:02:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5FE1EAE;
	Fri, 27 Jan 2023 13:01:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5FE1EAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674820924;
	bh=5yvFZt+LuISUfxj7udrcr3X4NtTxM9Mzz/F7j8/WCdE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qqfSS80NGFh7iQ5ga0/DjwHnvyJssum9z/SGXe+55QI2hhRnW3hztwmNsKvTRNiVJ
	 GphgC844lmneL/iEy2amITtBVqf3fPUkK9bm1Y0UgIfdIrpVuaQmY7gA6rARrtbp5Y
	 i4ae7df0G+YnehK3mRcu1kWFYA+ql71iEuNoPk/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76640F80508;
	Fri, 27 Jan 2023 13:00:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A739F80424; Fri, 27 Jan 2023 13:00:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F33AFF80424
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F33AFF80424
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=L1WDBqMq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820833; x=1706356833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5yvFZt+LuISUfxj7udrcr3X4NtTxM9Mzz/F7j8/WCdE=;
 b=L1WDBqMqTWwaoVFrhMLV/ZDfBFxLqI6TZTWBYipSTLkG36zQE4ea+u1b
 M7BQkhxjfjN4bmH1EC3q4EjOmPSFFAExbgRueEeZCCws6+9pK3qbr0zwX
 mlFAPhndG+z0q2vTD5prJM5HDhTZxqzwra60o22wV5LPHqLL1+kJyAn1k
 dAGFWSVfX29Nd6mpdiuxEQt9xZz62AaKZnJxecFBnzYmFNAWLuxi7U3+Q
 tesrklaOTSuTToSCrLmpcC2gEK9MysY4h5A6vKIVtMxeLRUilX/JZCAVh
 DzYA8E1MPZD14GC2Spr+FEX3mcqnKiXBnNqdA35sS/QEIPlVtV3+lL/hK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091796"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091796"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782094"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782094"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:29 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 02/18] ASoC: soc-pcm: Export widget_in_list()
Date: Fri, 27 Jan 2023 14:00:15 +0200
Message-Id: <20230127120031.10709-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
References: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Export the widget_in_list() function to be used by other modules.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/soc-dpcm.h | 2 ++
 sound/soc/soc-pcm.c      | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index 2864aed72998..1e7d09556fe3 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -162,6 +162,8 @@ int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream);
 int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
 	int event);
 bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget, enum snd_soc_dapm_direction dir);
+int widget_in_list(struct snd_soc_dapm_widget_list *list,
+		   struct snd_soc_dapm_widget *widget);
 
 #define dpcm_be_dai_startup_rollback(fe, stream, last)	\
 						dpcm_be_dai_stop(fe, stream, 0, last)
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 579a44d81d9a..f6caa55ef322 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1337,7 +1337,7 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 	return NULL;
 }
 
-static int widget_in_list(struct snd_soc_dapm_widget_list *list,
+int widget_in_list(struct snd_soc_dapm_widget_list *list,
 		struct snd_soc_dapm_widget *widget)
 {
 	struct snd_soc_dapm_widget *w;
@@ -1349,6 +1349,7 @@ static int widget_in_list(struct snd_soc_dapm_widget_list *list,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(widget_in_list);
 
 bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget, enum snd_soc_dapm_direction dir)
 {
-- 
2.39.1

