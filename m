Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D8925DA1C
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 15:40:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5F641EF7;
	Fri,  4 Sep 2020 15:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5F641EF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599226829;
	bh=LkxQ3bfb/33evE4/6MYO70HiAHWH04sNmB/8EoL5mks=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E/N7MoWujECobECgg5ikVhSKzuOfMCq+o51etukSyWCcDbBoS4vf7E8l5rvk12IDT
	 nJaddU8wMb9wGX+C6Nn+TUCxkE9+r9zynlJSLFABaX6bUWWmULUZcXTCWS/CxlTYS/
	 xcp4rmRhpQc7HxuVAUP96kthJ1vG8eNdTC4Rj3IU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ACAEF80363;
	Fri,  4 Sep 2020 15:30:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 272E1F80340; Fri,  4 Sep 2020 15:30:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF3AAF8025E
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 15:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF3AAF8025E
IronPort-SDR: 3PzSssTSfAOqi1ryDM1MNgjNnLCAD1AQTjihdfRd3Q1dKRGT7Jf56l0iaJy8c2scsceyC4KBeP
 HncyQQutH1mA==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="157002893"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="157002893"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:30:01 -0700
IronPort-SDR: ulB3nXBBG0j8q2x02ViHigR5MI17HLyP59TlJhWXvNbxiJA6DYKlpFvLuVmUSyRNVjv6O6Pr+e
 6haC9Nyt/65Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284416781"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2020 06:29:59 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 15/16] ASoC: SOF: append extended data to sof_ipc_comp_mux
Date: Fri,  4 Sep 2020 16:27:43 +0300
Message-Id: <20200904132744.1699575-16-kai.vehmanen@linux.intel.com>
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

Append the extended data to the end of the struct sof_ipc_comp_mux,
construct the ipc for COMP_NEW during the topology load stage.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/topology.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 48ea3147124d..69865df60033 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1825,19 +1825,16 @@ static int sof_widget_load_mux(struct snd_soc_component *scomp, int index,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_mux *mux;
+	size_t ipc_size = sizeof(*mux);
 	int ret;
 
-	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
+	mux = (struct sof_ipc_comp_mux *)
+	      sof_comp_alloc(swidget, &ipc_size, index, core);
 	if (!mux)
 		return -ENOMEM;
 
 	/* configure mux IPC message */
-	mux->comp.hdr.size = sizeof(*mux);
-	mux->comp.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_NEW;
-	mux->comp.id = swidget->comp_id;
 	mux->comp.type = SOF_COMP_MUX;
-	mux->comp.pipeline_id = index;
-	mux->comp.core = core;
 	mux->config.hdr.size = sizeof(mux->config);
 
 	ret = sof_parse_tokens(scomp, &mux->config, comp_tokens,
@@ -1855,7 +1852,7 @@ static int sof_widget_load_mux(struct snd_soc_component *scomp, int index,
 	swidget->private = mux;
 
 	ret = sof_ipc_tx_message(sdev->ipc, mux->comp.hdr.cmd, mux,
-				 sizeof(*mux), r, sizeof(*r));
+				 ipc_size, r, sizeof(*r));
 	if (ret < 0)
 		kfree(mux);
 
-- 
2.27.0

