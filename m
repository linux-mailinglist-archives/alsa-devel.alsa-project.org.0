Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3984067E4A3
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:06:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09D60EDB;
	Fri, 27 Jan 2023 13:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09D60EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674821192;
	bh=g2HxaHZv6nAGmwGq/ZGWCFp+VKkPfC+vYOfDP21maiQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ECzouop+i1Zwy4eDaSk5lRJLUye13m+Kwkk/HJOM3bj67BUxIQ0OSdh2fNa/o7VCL
	 Xr8tnfJZfEDl0iKQQUI+TJxXCCRp9BzMm/IUGjSbGBsf837I5t0S6mprAMassoEeQs
	 B7EKK+CRUInOh1I1R/gYIhRoLRgmG7GIjFdp5Ouc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4DC6F8053A;
	Fri, 27 Jan 2023 13:01:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E826F805B3; Fri, 27 Jan 2023 13:01:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11113F805B1
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:01:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11113F805B1
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Xb50swOy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820873; x=1706356873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g2HxaHZv6nAGmwGq/ZGWCFp+VKkPfC+vYOfDP21maiQ=;
 b=Xb50swOyiEJPc31zw8fNafo72PtZvfnU8pnQCClw0rVJcwHw/7q1+sj+
 1tuZQ2A54SRoktgZlFmOylZSJbydlXilfULogJrErcHsTlOA+vOuPaiBL
 ZZvTBqAaDazpbvIV8a5zeZ/V9ju28/P3RtsSYPCuwNKVc5sabjl4TGTa8
 qitaDaWSQpzRUZAu0Bt51kyT+77CTfIvGeQ2HCHrQ8SQTVtjSTQbY/hhW
 Z9puMaIQsYizC4qXzjFUZpi4I4YPLE+abvAqMJAJxnTaDCRfAHLl2FhIw
 8dz0OG1U9TXKxdQw+iiGF/rDo9qno7w94ZU5TmSSPt1sEHnbAG9P8HYfV w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091992"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091992"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:01:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782380"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782380"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:01:09 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 18/18] ASoC: SOF: ipc4-pcm: Do not run the trigger pipelines
 if no spipe is stored
Date: Fri, 27 Jan 2023 14:00:31 +0200
Message-Id: <20230127120031.10709-19-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
References: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
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
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

If the pipeline setup fails at the first widget/pipeline then we will have
no spipe stored under the pipeline_list->pipelines, the
pipeline_list->count is 0.

If this is the case we would have a NULL pointer dereference if the
execution is allowed to proceed.

Check for this condition along with the pipeline_list->pipelines check

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 2d89d3708ed0..521090d4498d 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -213,7 +213,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	pipeline_list = &spcm->stream[substream->stream].pipeline_list;
 
 	/* nothing to trigger if the list is empty */
-	if (!pipeline_list->pipelines)
+	if (!pipeline_list->pipelines || !pipeline_list->count)
 		return 0;
 
 	/* allocate memory for the pipeline data */
-- 
2.39.1

