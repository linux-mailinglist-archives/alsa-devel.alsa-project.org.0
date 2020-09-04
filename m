Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E7B25DA10
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 15:38:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A874216F2;
	Fri,  4 Sep 2020 15:37:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A874216F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599226728;
	bh=TA1R0r1BFIWF34F/7Gn8pM3C9xTDMoz8Atozxjt9iMI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AKtlEjHykEPny9EqPo6A5izAopequx3jxMQtUxIkIKBffM3QlnsGyxjkglHRs17Iu
	 e1FsThw3o1ltSH+rLLkn55+5IzWjWgDPY4lll220tTB1cEajOkx10+5BaI07S5AR2/
	 Us/LQpZfrh5Kr/xkUeTpKXSSnyHCIrNhQ1Eslu5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B86FF80345;
	Fri,  4 Sep 2020 15:30:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EA17F80336; Fri,  4 Sep 2020 15:30:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10866F802FF
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 15:29:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10866F802FF
IronPort-SDR: /BDGD1G/AtO/RMXBhR4pjl3xWfZDTDTAu/NWfqMbB4+lHqkZNif1lZy02YOI3XIxshlHruZiQH
 H87lNAJy+Cdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="157002877"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="157002877"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:29:57 -0700
IronPort-SDR: wFnYG8sXq0GcX27Cq1I7E7bTalYl2CT1KtCU8kMrfA6GMvScw+8pfZpNn973pWgjghElrcae1T
 B7wGNWhi834g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284416771"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2020 06:29:55 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 13/16] ASoC: SOF: append extended data to sof_ipc_comp_tone
Date: Fri,  4 Sep 2020 16:27:41 +0300
Message-Id: <20200904132744.1699575-14-kai.vehmanen@linux.intel.com>
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

Append the extended data to the end of the struct sof_ipc_comp_tone,
construct the ipc for COMP_NEW during the topology load stage.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/topology.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 476f78839fa8..c61f46350def 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2066,19 +2066,16 @@ static int sof_widget_load_siggen(struct snd_soc_component *scomp, int index,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_tone *tone;
+	size_t ipc_size = sizeof(*tone);
 	int ret;
 
-	tone = kzalloc(sizeof(*tone), GFP_KERNEL);
+	tone = (struct sof_ipc_comp_tone *)
+	       sof_comp_alloc(swidget, &ipc_size, index, core);
 	if (!tone)
 		return -ENOMEM;
 
 	/* configure siggen IPC message */
-	tone->comp.hdr.size = sizeof(*tone);
-	tone->comp.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_NEW;
-	tone->comp.id = swidget->comp_id;
 	tone->comp.type = SOF_COMP_TONE;
-	tone->comp.pipeline_id = index;
-	tone->comp.core = core;
 	tone->config.hdr.size = sizeof(tone->config);
 
 	ret = sof_parse_tokens(scomp, tone, tone_tokens,
@@ -2106,7 +2103,7 @@ static int sof_widget_load_siggen(struct snd_soc_component *scomp, int index,
 	swidget->private = tone;
 
 	ret = sof_ipc_tx_message(sdev->ipc, tone->comp.hdr.cmd, tone,
-				 sizeof(*tone), r, sizeof(*r));
+				 ipc_size, r, sizeof(*r));
 	if (ret >= 0)
 		return ret;
 err:
-- 
2.27.0

