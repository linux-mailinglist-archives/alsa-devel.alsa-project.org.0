Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E8F4D061F
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 19:15:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6130B1760;
	Mon,  7 Mar 2022 19:14:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6130B1760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646676916;
	bh=Cy1f/IJxo+TJxenqriDSLcWF9iUIrrmJzDsoqb5Hhz0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F09KB1JGMASpkQWdYwasEKgzn2FDIBMtE7c6ImH0typTS+AYiuS8AKihL0ZYTGruq
	 3pXD96b1m0SZYO0MOoQHRZazlUo4JS21WPlmSkRMRC5D8vzhJOHbdl7hXOJ3G+c+me
	 9SlApf7b/T2R1ySBi0kKtQBZLirmf8refgwjLeek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5A9DF80536;
	Mon,  7 Mar 2022 19:11:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 259FDF8013F; Mon,  7 Mar 2022 19:11:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6036F80431
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 19:11:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6036F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ANy5w6qj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646676690; x=1678212690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cy1f/IJxo+TJxenqriDSLcWF9iUIrrmJzDsoqb5Hhz0=;
 b=ANy5w6qjjhLT4Kg/50FIN/uCwBVcNjc0rx/4Ph8yEA+3KpUyo7Us24VS
 oFCn0jn5XC0095pJ51WatP9fmNF/zWpIMbHtFyVd2/DFShQnQx9Po73vJ
 WN/hfImZX+kvISg0s8+//Ku6njGCdfmFs8LK1TN6Ois9k7Y8PCQGOj0tM
 PveJBryYREOT7jo2GctEX6dVPNtE1r6/JQc6wY7QcMv+qSgUmhl1LSvIu
 RHdpOc8jAalhYR0dIZyGB4oG9Ur4JVPjvlisLeR2nZA68dj+5A+zj/NdK
 F0K4W1syL/Rw3cP56Qw1ND3w2adywDd+MobTXAbSIRm4twQlHV2VJqyLM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254401314"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254401314"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:26 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="495146663"
Received: from echun1-mobl.amr.corp.intel.com (HELO rsridh2-mobl1.localdomain)
 ([10.251.130.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:25 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/18] ASoC: SOF: sof-audio: removed unused function
Date: Mon,  7 Mar 2022 10:10:57 -0800
Message-Id: <20220307181111.49392-5-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
References: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

cppcheck warning:

sound/soc/sof/sof-audio.c:884:0: style: The function
'snd_sof_find_spcm_pcm_id' is never used. [unusedFunction]

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 14 --------------
 sound/soc/sof/sof-audio.h |  2 --
 2 files changed, 16 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 4816473cfd7d..e39f18e824b4 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -866,20 +866,6 @@ struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_soc_component *scomp,
 	return NULL;
 }
 
-struct snd_sof_pcm *snd_sof_find_spcm_pcm_id(struct snd_soc_component *scomp,
-					     unsigned int pcm_id)
-{
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct snd_sof_pcm *spcm;
-
-	list_for_each_entry(spcm, &sdev->pcm_list, list) {
-		if (le32_to_cpu(spcm->pcm.pcm_id) == pcm_id)
-			return spcm;
-	}
-
-	return NULL;
-}
-
 struct snd_sof_widget *snd_sof_find_swidget(struct snd_soc_component *scomp,
 					    const char *name)
 {
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 107e0ef93e16..f2f32f2065d3 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -220,8 +220,6 @@ struct snd_sof_pcm *snd_sof_find_spcm_name(struct snd_soc_component *scomp,
 struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_soc_component *scomp,
 					   unsigned int comp_id,
 					   int *direction);
-struct snd_sof_pcm *snd_sof_find_spcm_pcm_id(struct snd_soc_component *scomp,
-					     unsigned int pcm_id);
 void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream);
 void snd_sof_pcm_init_elapsed_work(struct work_struct *work);
 
-- 
2.25.1

