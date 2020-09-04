Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 476A225DA07
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 15:37:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D02F31EE0;
	Fri,  4 Sep 2020 15:36:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D02F31EE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599226631;
	bh=Pp4FnG4IqZSZ3dd69Migc5nXVwnhMb0WYGe2anoX2GU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TiBO2x+uFhLII1fu+ndlBbupBTKNy6XdbvxAXGGVxxPcheXM5Q8uD1Fw7pBzGIQ4t
	 yJ81iRs2mcbfLX7MCFFYqMmYFl/UrLdJ17fFN0P3klRkFZqWo3nsk5IwAR77eB2GRI
	 3sN2b/VH+8czlXhXLJ4wFxGp+0RTyCf+m1B/HpvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1061AF80337;
	Fri,  4 Sep 2020 15:30:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A079F80336; Fri,  4 Sep 2020 15:30:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAF09F802EA
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 15:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAF09F802EA
IronPort-SDR: YYS54sb9ESOQttblKCW7ka/jEKCdzJCXCpWOYcs6cfnkzyigXQdSGNUbNE2N3Id2JN03LHKxb/
 B+q4hXf1iOtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="157002862"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="157002862"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:29:51 -0700
IronPort-SDR: 8osXJKjOFUEHX8zMjBk91hW89u9rfIs1hweBnS8riMq61Cb3aat32FO6VUb84Bbp7unlesGKqD
 U0nUej/Rzhxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284416740"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2020 06:29:50 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 10/16] ASoC: SOF: append extended data to sof_ipc_comp_host
Date: Fri,  4 Sep 2020 16:27:38 +0300
Message-Id: <20200904132744.1699575-11-kai.vehmanen@linux.intel.com>
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

Append the extended data to the end of the struct sof_ipc_comp_host,
construct the ipc for COMP_NEW during the topology load stage.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/topology.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index c908dbbe284a..5cf4497a4338 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1644,19 +1644,16 @@ static int sof_widget_load_pcm(struct snd_soc_component *scomp, int index,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_host *host;
+	size_t ipc_size = sizeof(*host);
 	int ret;
 
-	host = kzalloc(sizeof(*host), GFP_KERNEL);
+	host = (struct sof_ipc_comp_host *)
+	       sof_comp_alloc(swidget, &ipc_size, index, core);
 	if (!host)
 		return -ENOMEM;
 
 	/* configure host comp IPC message */
-	host->comp.hdr.size = sizeof(*host);
-	host->comp.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_NEW;
-	host->comp.id = swidget->comp_id;
 	host->comp.type = SOF_COMP_HOST;
-	host->comp.pipeline_id = index;
-	host->comp.core = core;
 	host->direction = dir;
 	host->config.hdr.size = sizeof(host->config);
 
@@ -1684,7 +1681,7 @@ static int sof_widget_load_pcm(struct snd_soc_component *scomp, int index,
 	swidget->private = host;
 
 	ret = sof_ipc_tx_message(sdev->ipc, host->comp.hdr.cmd, host,
-				 sizeof(*host), r, sizeof(*r));
+				 ipc_size, r, sizeof(*r));
 	if (ret >= 0)
 		return ret;
 err:
-- 
2.27.0

