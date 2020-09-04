Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6AE25DA15
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 15:39:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C85E177E;
	Fri,  4 Sep 2020 15:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C85E177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599226787;
	bh=n242q6FnHFviQfarEmGgurv1Mb9JzuYMCk2oWRQDVaw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SQSyF0dvQMDqvZ3mM2cdsCeNxpD2i7ezM2y3rrSt3AUzZ3hATDVp9Y8AfGXmVvOiQ
	 7LwbECBot4GCiRcKuodo+Xvn/w9UcNr5XS5F19ZlFlvdnpL9QZaglNCBNOrl8k1vka
	 QV5jt0er+f/b/usrZgx0kr1us/G87Pq3msjdGl0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5D81F8034B;
	Fri,  4 Sep 2020 15:30:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4D2AF80339; Fri,  4 Sep 2020 15:30:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F06ECF80308
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 15:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F06ECF80308
IronPort-SDR: 4ZQIo9YpdhHR5DgGcXTOvbbWEOV+mksJRXsT3Nrx9IGFpdZye+mX6E5M8ivbc8jNYGA0JnMVH9
 ZK+7DnW/Dm0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="157002884"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="157002884"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:29:59 -0700
IronPort-SDR: HT0oozUeOxlAIznRJ43SWwU6BPl8T+P63E5Zm67Zm28b8fUAfxj2A7J+9XKQaTXyU4K4kSJ6bw
 xQgjeyMulF2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284416776"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2020 06:29:57 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 14/16] ASoC: SOF: append extended data to sof_ipc_comp_process
Date: Fri,  4 Sep 2020 16:27:42 +0300
Message-Id: <20200904132744.1699575-15-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
References: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Keyon Jie <yang.jie@linux.intel.com>

Append the extended data to the end of the struct sof_ipc_comp_process,
construct the ipc for COMP_NEW during the topology load stage.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/topology.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index c61f46350def..48ea3147124d 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2231,18 +2231,15 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 		ipc_data_size = 0;
 	}
 
-	process = kzalloc(ipc_size, GFP_KERNEL);
+	process = (struct sof_ipc_comp_process *)
+		  sof_comp_alloc(swidget, &ipc_size, index, 0);
 	if (!process) {
 		ret = -ENOMEM;
 		goto out;
 	}
 
 	/* configure iir IPC message */
-	process->comp.hdr.size = ipc_size;
-	process->comp.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_NEW;
-	process->comp.id = swidget->comp_id;
 	process->comp.type = type;
-	process->comp.pipeline_id = index;
 	process->config.hdr.size = sizeof(process->config);
 
 	ret = sof_parse_tokens(scomp, &process->config, comp_tokens,
-- 
2.27.0

