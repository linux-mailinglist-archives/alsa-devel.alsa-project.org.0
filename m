Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D0825D9B0
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 15:34:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B2B31AEB;
	Fri,  4 Sep 2020 15:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B2B31AEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599226463;
	bh=P8U1g1JyqTMPO5WpuaLJjgv3e9stRtUxvVkyrE6cTTI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hIRzn2DKoGPecnp7UFwhtqs/l5Yda+XIm15yx21Qyq2aKggIwHehxxaNZsPCemNUQ
	 N7E7m0qYJerjnEVkXHx7//9y7kc6qYXMM3LO6g95eB8gnaqVdjbtmYrGaYUAKO82GE
	 Sx0T7mnolc4RAjClUOAgo0ZMcanDo4W0wncFFRSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 990B9F80305;
	Fri,  4 Sep 2020 15:29:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CE13F802E8; Fri,  4 Sep 2020 15:29:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A72B1F80212
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 15:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A72B1F80212
IronPort-SDR: ohNFeBqMgk6j3tFkdAa1uDwwPbZmY9yYSiUYpnt4lLkIVbseMeqpuN9mWs5hWUA1VkrpW1FF1i
 rHoBZTx0NuYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137259558"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="137259558"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:29:37 -0700
IronPort-SDR: nxFbgzr3PcCiQAaYokgyFVQCWAc2FwHRA0Ou5KIBT59b1eau3eJxWSr5rnomQDM8/TP1QS/E1P
 CAvMG3yZ1aAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284416711"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2020 06:29:35 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 04/16] ASoC: SOF: topology: parse comp_ext_tokens for all
 widgets
Date: Fri,  4 Sep 2020 16:27:32 +0300
Message-Id: <20200904132744.1699575-5-kai.vehmanen@linux.intel.com>
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

Parse comp_ext_tokens in the common sof_widget_ready(), and the
swidget->comp_ext will be used to construct the COMP_NEW ipc in the
subsequent commits.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/topology.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 0ba0c3921cf0..7d1013e315fc 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2401,6 +2401,16 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		return ret;
 	}
 
+	ret = sof_parse_tokens(scomp, &swidget->comp_ext, comp_ext_tokens,
+			       ARRAY_SIZE(comp_ext_tokens), tw->priv.array,
+			       le32_to_cpu(tw->priv.size));
+	if (ret != 0) {
+		dev_err(scomp->dev, "error: parsing comp_ext_tokens failed %d\n",
+			ret);
+		kfree(swidget);
+		return ret;
+	}
+
 	/* handle any special case widgets */
 	switch (w->id) {
 	case snd_soc_dapm_dai_in:
-- 
2.27.0

