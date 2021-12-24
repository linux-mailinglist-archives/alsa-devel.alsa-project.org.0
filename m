Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B71D47EA86
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 03:13:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AD9918D0;
	Fri, 24 Dec 2021 03:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AD9918D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640312004;
	bh=alLTBXDy3O+6GzU4DwFSKQ3fIJ/zBnApQ/F3BpD6psQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QeUwylRAUcvXx3PTJtmgTyLy5WksknIsrumCnI7VtEZJfSiYdnl8XO8gk01hX7yU+
	 t4N9L28w3TIIs4boRFyz3xGsqm3+G3+mHlsvCp/r60I5vLZyfYgdQxb7OWut/6iN4c
	 JgFiq6fMi24bKnUlhLB8+VfS+n6xhZqZVPhZoWsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B901FF80515;
	Fri, 24 Dec 2021 03:11:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23E43F804FE; Fri, 24 Dec 2021 03:11:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E55BF80121
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 03:11:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E55BF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BsvPkG+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640311886; x=1671847886;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=alLTBXDy3O+6GzU4DwFSKQ3fIJ/zBnApQ/F3BpD6psQ=;
 b=BsvPkG+Y4mQjVJ82rcyGHN4FMwvT7cKE7NoRKMQaO/dSoyasrjFGWlzf
 X5SfTJIl6437+uws84hYGT/Udd1jtazIt5OerAD7y4UqpETnfQaEft/kd
 w73+WFhbA7q0cxm9hDTUK9YAgA17FPX2LoMl/KrsBq0M/Yt9ZMANH66mP
 A2/ff0OT9wOslMUSUrF6dInFF+D1lPVF9ZzxLjLn6pOEizRPod3KGUGC5
 UfPJv8TE1nIUgQzdzFccaZ2tICTML7V1q5jRVA+1QK8kk4hCWXXLOEtzy
 sQlnAEjirjZsd4yAED8dSc0wBueoqfFWufbVJ2PmWcCpZkmQYzS/LUNve A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="265127375"
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="265127375"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 18:11:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="467156195"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 18:10:48 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 1/7] ASOC: SOF: Intel: use snd_soc_dai_get_widget()
Date: Fri, 24 Dec 2021 10:10:28 +0800
Message-Id: <20211224021034.26635-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211224021034.26635-1-yung-chuan.liao@linux.intel.com>
References: <20211224021034.26635-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 bard.liao@intel.com
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

We have a helper, use it to simplify widget lookup

Suggested-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 18abbd13d593..99255028d3fe 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -189,10 +189,7 @@ static int sdw_params_stream(struct device *dev,
 	struct snd_soc_dai *d = params_data->dai;
 	struct snd_soc_dapm_widget *w;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		w = d->playback_widget;
-	else
-		w = d->capture_widget;
+	w = snd_soc_dai_get_widget(d, substream->stream);
 
 	return sdw_dai_config_ipc(sdev, w, params_data->link_id, params_data->alh_stream_id,
 				  d->id, true);
@@ -206,10 +203,7 @@ static int sdw_free_stream(struct device *dev,
 	struct snd_soc_dai *d = free_data->dai;
 	struct snd_soc_dapm_widget *w;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		w = d->playback_widget;
-	else
-		w = d->capture_widget;
+	w = snd_soc_dai_get_widget(d, substream->stream);
 
 	/* send invalid stream_id */
 	return sdw_dai_config_ipc(sdev, w, free_data->link_id, 0xFFFF, d->id, false);
-- 
2.17.1

