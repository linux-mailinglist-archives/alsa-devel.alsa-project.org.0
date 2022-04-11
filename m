Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5564FC5AB
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 22:21:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED0A51760;
	Mon, 11 Apr 2022 22:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED0A51760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649708466;
	bh=aXtxGAK2A/K9CKdbIo37X8KFqxLnfPL4qWmdVJBCT38=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N0JVAInnmABd4/3R6BQvBlALjWbWbH2HUpBfVFiOPT3/yAfUbEFWjXhV4McmySRDq
	 /nS2DfgRHkQ1kfRtOHAm21/tENmF1y5XeOSkQ03jyXSTCyf4AgnZ38qNytsHqr/YgS
	 2RPrhGd3zd1HBfuZO+4GDwCLMBp2U1Wky48lv7RM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50437F80544;
	Mon, 11 Apr 2022 22:18:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E8E8F804E6; Mon, 11 Apr 2022 22:18:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69A19F804EC
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 22:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69A19F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Rz2PK4A8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649708281; x=1681244281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aXtxGAK2A/K9CKdbIo37X8KFqxLnfPL4qWmdVJBCT38=;
 b=Rz2PK4A8W8jlA1NLJEy8fKAL7qiqOPkV3J4ClworywsO6H5vUC0dmQje
 AimtnbwLwL6Mnr7oq3m6xpgmwILk3MpJU4yyzH5HfYggUQexKDX6Z14a5
 ch8R83Pn52hzPFtlUXN4dfZDqJ2l9dIloCh5HKvIA8Xf7QRI9zcjuM/52
 R1+iDSNZTXq0/jp9ykBLlv0olrg61stfbm6qF7V8P6TxaZ/IKPw79sjs6
 HNt+p8AnIbHMLnmDV8cqI/JVUDanavnDLX6lU1h6LWWQ8oXNen2ixtbpz
 ErNESpmY/JefAocvz7SvR7LnvP0xi7KOR3HiM+0G7OTUL55R9SqdjYAP3 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244090837"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="244090837"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="526135668"
Received: from prposam-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.162.151])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/16] ASoC: SOF: sof-audio: preserve topology filename
 override in nocodec mode
Date: Mon, 11 Apr 2022 15:17:18 -0500
Message-Id: <20220411201727.77971-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
References: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Paul Olaru <paul.olaru@oss.nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

If the topology filename is modified at a higher level, be it with a
DMI quirk or a kernel module parameter, we don't want to use the
default 'nocodec' topology name extracted from descriptors.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 49fdfe06a9a3..6c08b5f4ffa6 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -698,7 +698,8 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 		return -ENOMEM;
 
 	mach->drv_name = "sof-nocodec";
-	sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
+	if (!sof_pdata->tplg_filename)
+		sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
 
 	sof_pdata->machine = mach;
 	snd_sof_set_mach_params(mach, sdev);
-- 
2.30.2

