Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4001BAB85
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 19:42:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54C9E1687;
	Mon, 27 Apr 2020 19:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54C9E1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588009340;
	bh=yMzo42yeEro+v+ptQHQmoa4KojG+ZOu6yWFRDTR+T4A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B1U49vTLJs0P0LXSUAchStF1CfCipO0GsZL0zuoYP5PPrEFmeWfLSXMwtq/KoCJ7C
	 /zxUuvpMGzziFibEZj5/7foZNH6DA5V5TaJrk35SsawCTn5xAv2FDuCkOkxMbB/pYH
	 H+b6kNb+IYZjwaCtoMM5ad54p3fxZ4dO5LJCyOB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 168BEF802E2;
	Mon, 27 Apr 2020 19:29:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CCD3F802E1; Mon, 27 Apr 2020 19:29:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C8F3F80247
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 19:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C8F3F80247
IronPort-SDR: f5U7EqekrC4IhHByrPjpL9Kdh0vFW8ItpJLZ/hMAQ44csRPUf9lGEk7gZUlmubNnlh1qxCJ3yZ
 OD3eCV73X0vg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 10:29:40 -0700
IronPort-SDR: PItZYp/D2hoFzCJ8gDaNx2c8NIcxm/qVcboiM9GXyogi9bVFyPFM1COVSsmHfK3Fuwkx9OxgfW
 WrHCVeUXhkxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="458935997"
Received: from dbombien-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.51.189])
 by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2020 10:29:39 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: topology: set component dai_index to ipc dai config
 dai_index
Date: Mon, 27 Apr 2020 10:29:37 -0700
Message-Id: <20200427172939.25848-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427172939.25848-1-ranjani.sridharan@linux.intel.com>
References: <20200427172939.25848-1-ranjani.sridharan@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The ipc dai config dai_index is from topology. However, the same dai
config will be applied to all DAIs in the same dai link. We have to
ensure that the ipc dai config's dai_index match to the component's
dai_index.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/topology.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 0b15b4055f32..0ed3ab35e9f9 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2693,6 +2693,14 @@ static int sof_set_dai_config(struct snd_sof_dev *sdev, u32 size,
 			struct sof_ipc_reply reply;
 			int ret;
 
+			/*
+			 * the same dai config will be applied to all DAIs in
+			 * the same dai link. We have to ensure that the ipc
+			 * dai config's dai_index match to the component's
+			 * dai_index.
+			 */
+			config->dai_index = dai->comp_dai.dai_index;
+
 			/* send message to DSP */
 			ret = sof_ipc_tx_message(sdev->ipc,
 						 config->hdr.cmd, config, size,
-- 
2.17.1

