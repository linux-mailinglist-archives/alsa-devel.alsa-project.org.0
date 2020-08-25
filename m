Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 116B825247B
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 01:54:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACFA41677;
	Wed, 26 Aug 2020 01:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACFA41677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598399668;
	bh=RgBP+SwZvow1vbbuRkxisJfGFhWxkbDcn0FOQU2+s+g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eC4sgRF1Pr9IxpTxBGkXio6sOg+i0AA8sfOsm9sAI+x902U/5WALywTmMKNaeyngr
	 E7kjA8vkxKi77VTyXGVKkk9Mgb2dfk0+36+cm+5IJd8etVaKMElwm92lj+XQGc8wRC
	 ibJ/dkx7z0aexBsyxBll9JaW0uxJg+oqgAGITrzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4896F802C3;
	Wed, 26 Aug 2020 01:51:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DAEEF80269; Wed, 26 Aug 2020 01:51:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A429F80269
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 01:51:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A429F80269
IronPort-SDR: a8UvJixPOt/K4J8K32QcEoZVDegm8wKziA0mAFMsjpAZKRVJNZHtygj5zazISjQErBFCLtJY8o
 CMtQCYxzsxzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="157253465"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="157253465"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:50:58 -0700
IronPort-SDR: FjVCICnznrfIMKCGsCKv05+1L/B4wFO3EjJBEVzXaIYWQOsFrAV3hzZd7cwIyKzqibcM/LFtSH
 0yDhJ275nedA==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="443818998"
Received: from cdurvasu-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.42.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:50:58 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/7] ASoC: SOF: topology: fix the ipc_size calculation for
 process component
Date: Tue, 25 Aug 2020 16:50:37 -0700
Message-Id: <20200825235040.1586478-5-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
References: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Jaska Uimonen <jaska.uimonen@intel.com>, tiwai@suse.de,
 Keyon Jie <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org
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

The topology private struct is used for token parsing and its size
should not be included to the ipc_size, fix it here though it didn't
cause any real issue as the Firmware won't use this wrong-added data.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Jaska Uimonen <jaska.uimonen@intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/topology.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 707fbac3e64f..95e63d138326 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2114,9 +2114,7 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 			goto out;
 	}
 
-	ipc_size = sizeof(struct sof_ipc_comp_process) +
-		le32_to_cpu(private->size) +
-		ipc_data_size;
+	ipc_size = sizeof(struct sof_ipc_comp_process) + ipc_data_size;
 
 	/* we are exceeding max ipc size, config needs to be sent separately */
 	if (ipc_size > SOF_IPC_MSG_MAX_SIZE) {
-- 
2.25.1

