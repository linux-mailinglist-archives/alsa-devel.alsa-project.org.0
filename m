Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEDE25D9DA
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BC431EDA;
	Fri,  4 Sep 2020 15:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BC431EDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599226527;
	bh=FR/wYsUBu8MVT2v+136ShFbLIN5ow4Ah9j7ejIUhrnE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tLwv4580fwlV/rNFcKYgLGJ2nc3uJ6c4ZAbWONnyZEJ1Uxf7vZ8BXsDrWk6Qy5nXu
	 3ogPnl2eXneSG9KXt2JIyrOaYjtYTFNq0x98jtUgeIy2ie5Ao3uywdWVmx8xK9KhmZ
	 UPOmWca149pKsTGX67913KgS7LMjo2S5Ex/MJqrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20D80F801DA;
	Fri,  4 Sep 2020 15:30:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 667E4F8031A; Fri,  4 Sep 2020 15:30:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59567F8025E
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 15:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59567F8025E
IronPort-SDR: VeDEJDEDoHE6KIFVkpCEe5mI1gB81SL4MQ6Z9L0yv+9S3+l+qT8L/8sDUa5Q3wZsOfB59Z/p2D
 cvhCkIQDxbIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="157002858"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="157002858"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:29:49 -0700
IronPort-SDR: lYk9sM+9OHyTxSylqa+QCm91IG4W+yHqKDsP4Ut9jP0RdPlhrqED56rWX/+6I9JOIF+i3shxxn
 QIbxEYCStsVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284416739"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2020 06:29:48 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 09/16] ASoC: SOF: append extended data to sof_ipc_comp_volume
Date: Fri,  4 Sep 2020 16:27:37 +0300
Message-Id: <20200904132744.1699575-10-kai.vehmanen@linux.intel.com>
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

Append the extended data to the end of the struct sof_ipc_comp_volume,
construct the ipc for COMP_NEW during the topology load stage.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/topology.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index eaad7a60f4b2..c908dbbe284a 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1878,11 +1878,13 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_volume *volume;
 	struct snd_sof_control *scontrol;
+	size_t ipc_size = sizeof(*volume);
 	int min_step;
 	int max_step;
 	int ret;
 
-	volume = kzalloc(sizeof(*volume), GFP_KERNEL);
+	volume = (struct sof_ipc_comp_volume *)
+		 sof_comp_alloc(swidget, &ipc_size, index, core);
 	if (!volume)
 		return -ENOMEM;
 
@@ -1894,12 +1896,7 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 	}
 
 	/* configure volume IPC message */
-	volume->comp.hdr.size = sizeof(*volume);
-	volume->comp.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_NEW;
-	volume->comp.id = swidget->comp_id;
 	volume->comp.type = SOF_COMP_VOLUME;
-	volume->comp.pipeline_id = index;
-	volume->comp.core = core;
 	volume->config.hdr.size = sizeof(volume->config);
 
 	ret = sof_parse_tokens(scomp, volume, volume_tokens,
@@ -1936,7 +1933,7 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 	}
 
 	ret = sof_ipc_tx_message(sdev->ipc, volume->comp.hdr.cmd, volume,
-				 sizeof(*volume), r, sizeof(*r));
+				 ipc_size, r, sizeof(*r));
 	if (ret >= 0)
 		return ret;
 err:
-- 
2.27.0

