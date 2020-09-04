Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E25525DA0B
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 15:37:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E55BC1887;
	Fri,  4 Sep 2020 15:36:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E55BC1887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599226665;
	bh=nUNNGqewp27MH9mfSJNBlyC1t35xCYDgPhmW8UoDKQ0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oh0AsfWgQ/qWN2sQPB1SrbWBkpEBI0zInSF0ZJpeN907d0z9qVGe38QwyzQXQXK3h
	 AfiHgfmKLDEqdw0NNvB8ZQgbyE7r59IvkiTtgers46V+MdansDa41nkUkKNVXXe+5e
	 KHJkvF3l6AyEDRYHE/NHPqH6+fy9JyO7n8K4a+2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2AA6F8033E;
	Fri,  4 Sep 2020 15:30:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5583F80336; Fri,  4 Sep 2020 15:30:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45251F802EB
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 15:29:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45251F802EB
IronPort-SDR: soi+oUufZR77eV1kqER2C6WzV52uO64iaaoBanCkfaFy0Rlqvln70MgQMp1VRoouPcEhdXJ2OL
 TSn+LeJX7vfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="157002867"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="157002867"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:29:53 -0700
IronPort-SDR: i6i4AZKxFYPbHKlePS6WHhz6sPK2yXNXfGBBmmNNPGkTWrnqntDYYi1Dj4bdsZmM7O8euV0tTu
 i81aKrYqjHHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284416745"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2020 06:29:51 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 11/16] ASoC: SOF: append extended data to sof_ipc_comp_src
Date: Fri,  4 Sep 2020 16:27:39 +0300
Message-Id: <20200904132744.1699575-12-kai.vehmanen@linux.intel.com>
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

Append the extended data to the end of the struct sof_ipc_comp_src,
construct the ipc for COMP_NEW during the topology load stage.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/topology.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 5cf4497a4338..84f332de8b0d 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1950,19 +1950,16 @@ static int sof_widget_load_src(struct snd_soc_component *scomp, int index,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_src *src;
+	size_t ipc_size = sizeof(*src);
 	int ret;
 
-	src = kzalloc(sizeof(*src), GFP_KERNEL);
+	src = (struct sof_ipc_comp_src *)
+	      sof_comp_alloc(swidget, &ipc_size, index, core);
 	if (!src)
 		return -ENOMEM;
 
 	/* configure src IPC message */
-	src->comp.hdr.size = sizeof(*src);
-	src->comp.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_NEW;
-	src->comp.id = swidget->comp_id;
 	src->comp.type = SOF_COMP_SRC;
-	src->comp.pipeline_id = index;
-	src->comp.core = core;
 	src->config.hdr.size = sizeof(src->config);
 
 	ret = sof_parse_tokens(scomp, src, src_tokens,
@@ -1990,7 +1987,7 @@ static int sof_widget_load_src(struct snd_soc_component *scomp, int index,
 	swidget->private = src;
 
 	ret = sof_ipc_tx_message(sdev->ipc, src->comp.hdr.cmd, src,
-				 sizeof(*src), r, sizeof(*r));
+				 ipc_size, r, sizeof(*r));
 	if (ret >= 0)
 		return ret;
 err:
-- 
2.27.0

