Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EAD51054B
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:22:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFF0218DD;
	Tue, 26 Apr 2022 19:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFF0218DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993753;
	bh=WLpR/HI9DAjs+N1BxJ17Z/L9VZqZDFPhv2mjbErXWhI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WsT2R2cqs+PkOCxJb2vFYmu7Chr3B+/9aRAd5xU/g/uDuk/he8smKrYzr+Cpi7Y+Y
	 1YtNpUFf7ySvwSDxQgN0z1Pk53PrNurA9i4NclS2jjX+OovC2pE4UABqhsc/LmG9Fm
	 WvncuhTYznEMRSxxCdUaqgX01TxhMUm9WOG+BpZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3379F80543;
	Tue, 26 Apr 2022 19:18:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99397F80536; Tue, 26 Apr 2022 19:18:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F0A5F8050F
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F0A5F8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lgYbPHRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650993483; x=1682529483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WLpR/HI9DAjs+N1BxJ17Z/L9VZqZDFPhv2mjbErXWhI=;
 b=lgYbPHRjgD6WegLNoqB7x2WUao8blv+TNWv+F0NZh/8rfynVGknZoVda
 KxJiQLA4GoqWkvlijUH7Lr08smPDFaqQ7138wbr07q3i3QI4tVnpQNO13
 ghLddVxhIdtHTE2aDW6vlsrqdJUN+KHvQ9e4BER5tuOOfETMRlJOrk+oH
 Rx8J8t8a7K5PXqqhMNUXRFKLqEIMeUiiZraZbDP7cNqMbE8n8YRitWnIT
 wNKF+36O+XUbDHJ9NmajhHRkfbraPoRZjiu30ECRYCvslTTzlXgzKIuuF
 iZuANKWKUWdtVLUOOzKHhq0ykwig1UJjXYErBiXBtnKH5EvefQb0QdHoJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="290807981"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="290807981"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="558431224"
Received: from shashinx-mobl.gar.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.0.53])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:51 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/11] ASoC: SOF: clarify use of widget complete flag
Date: Tue, 26 Apr 2022 10:17:42 -0700
Message-Id: <20220426171743.171061-11-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
References: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Currently, the complete flag is used only for the snd_soc_dapm_scheduler
type widgets to indicate that the pipeline has been set up. All other
widgets do not need it. Add a comment to clarify its usage and set the
complete flag to false only for the scheduler widget in
sof_widget_free().

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 3 +--
 sound/soc/sof/sof-audio.h | 4 ++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 07576ed3c4fa..f7c9e5db3d9e 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -58,8 +58,6 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 			err = ret;
 	}
 
-	swidget->complete = 0;
-
 	/*
 	 * free the scheduler widget (same as pipe_widget) associated with the current swidget.
 	 * skip for static pipelines
@@ -68,6 +66,7 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 		ret = sof_widget_free(sdev, swidget->pipe_widget);
 		if (ret < 0 && !err)
 			err = ret;
+		swidget->pipe_widget->complete = 0;
 	}
 
 	if (!err)
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 5967d034188a..2db4eb5edcf5 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -327,6 +327,10 @@ struct snd_sof_widget {
 	struct snd_soc_component *scomp;
 	int comp_id;
 	int pipeline_id;
+	/*
+	 * complete flag is used to indicate that pipeline set up is complete for scheduler type
+	 * widgets. It is unused for all other widget types.
+	 */
 	int complete;
 	int use_count; /* use_count will be protected by the PCM mutex held by the core */
 	int core;
-- 
2.25.1

