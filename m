Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D12855E6E94
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 23:40:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 710FF1E0;
	Thu, 22 Sep 2022 23:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 710FF1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663882823;
	bh=ZNOEjej6TcsHhUzwxTQDRPHpXPMeZ2a8lRbcMAG3jSc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QW1hwcq++XmAF9QopN3QR33OJDKmm9ptBa/5TK5RZ7tHESRKvCmVmu3dhp9emSTKj
	 1pV/aBAmr0XlqL2wA7yU9YRALqth5ULbUQMW2O/UBaqOwTLQ/+84NqoM2pXIEX57Sh
	 o9zTuAdb37+qcGz8Dv1P5zbYLcQRXxQUDushSu3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A87AF8057B;
	Thu, 22 Sep 2022 23:37:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B998F8012A; Thu, 22 Sep 2022 23:37:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E15EF80538
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 23:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E15EF80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="G9g3tART"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663882621; x=1695418621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZNOEjej6TcsHhUzwxTQDRPHpXPMeZ2a8lRbcMAG3jSc=;
 b=G9g3tARTx7dnY55kvLM0JklxCkB/zhJUEZjuSvx+sgpx5vP7wxPuUPYh
 OlMFzA12er3P4LbyCDwjeJDC/h4szhLhfofT0pfEhReAeXb/cl+zKj784
 wwgqUALxChC5BBjawS542M7dcku03zQZAiBCJ0K6n3otKBg1TSM5emEOt
 MjZutxaCRtHpiiNTi5tLRlLO7v0BKiin/qSjfwfHuJCfjUZLbY+MeOaA6
 421TC427wtKRdvQsic0AKXt3Ytb6sBytDBFiJDE/vsbpxU413NFT7rh/C
 Gx+aD0hlSfi01L4TUsFgpT6zL5MsAg+dEOsdxOvLSskiq2wEL64a9+kWe Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386725793"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="386725793"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="745550859"
Received: from jpwarner-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.13.62])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:51 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/10] ASoC: SOF: Intel: MTL: define and set the
 disable_interrupts op
Date: Thu, 22 Sep 2022 14:36:41 -0700
Message-Id: <20220922213644.666315-8-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
References: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Disable the IPC and SDW interrupts in the disable_interrupts op.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 8cc20e617117..107c1f42f421 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -741,6 +741,12 @@ static void mtl_ipc_dump(struct snd_sof_dev *sdev)
 		hipcida, hipctdr, hipcctl);
 }
 
+static int mtl_dsp_disable_interrupts(struct snd_sof_dev *sdev)
+{
+	mtl_disable_ipc_interrupts(sdev);
+	return mtl_disable_interrupts(sdev);
+}
+
 /* Meteorlake ops */
 struct snd_sof_dsp_ops sof_mtl_ops;
 EXPORT_SYMBOL_NS(sof_mtl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
@@ -820,6 +826,7 @@ const struct sof_intel_dsp_desc mtl_chip_info = {
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
 	.cl_init = mtl_dsp_cl_init,
 	.power_down_dsp = mtl_power_down_dsp,
+	.disable_interrupts = mtl_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_ACE_1_0,
 };
 EXPORT_SYMBOL_NS(mtl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
-- 
2.25.1

