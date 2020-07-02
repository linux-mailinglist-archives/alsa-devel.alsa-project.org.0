Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CA3212B2C
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 19:25:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5E48168A;
	Thu,  2 Jul 2020 19:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5E48168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593710738;
	bh=KfsVHSKhteMDnZK+Fu/9TroDTxGppX+oaRsqLzNOWpc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b+HAYgJG5+BmDCL/Jp6JraFVFKTxCTfPI52+9fn7/qO5pQb95WCQXftAVTPMNqwuK
	 cYQLWbUyYfl3Oe7KGCRcoQSobKNUMTj9favxVlpF30eu+1SwYs4fWKsybDlfr/CNFe
	 sEtb8E/e30U/FvCZhYOFueYUdn5nkhwtQzhBT5j8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42EEAF802C2;
	Thu,  2 Jul 2020 19:22:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1FE3F802BD; Thu,  2 Jul 2020 19:22:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29BF7F80245
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 19:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29BF7F80245
IronPort-SDR: YwfG+rti/rSC/RVTMiI3WKtF2/2rpN187S4kzDr6nBI6su5FZk9cvgFVNaxvOwHuzgbHj+odwW
 GgPXjHPoyAHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="144480301"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="144480301"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 10:22:48 -0700
IronPort-SDR: mAjwL2tKlw+8j+DkGoWVLnlP8CIn6QoiOCfJJKopCnLuikTcm3HZo/+RhJsu9GbTHbE/l9bvp0
 GBUyMbj0BL5A==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="356521253"
Received: from nzbastur-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.182])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 10:22:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/6] ASoC: fsl: fsl-asoc-card: fix kernel-doc
Date: Thu,  2 Jul 2020 12:22:24 -0500
Message-Id: <20200702172227.164474-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 tiwai@suse.de,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 broonie@kernel.org, Fabio Estevam <festevam@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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

Fix W=1 warnings. Kernel-doc syntax was not properly used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 57ea1b072326..91220b96e043 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -33,8 +33,7 @@
 #define DAI_FMT_BASE (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF)
 
 /**
- * CODEC private data
- *
+ * struct codec_priv - CODEC private data
  * @mclk_freq: Clock rate of MCLK
  * @mclk_id: MCLK (or main clock) id for set_sysclk()
  * @fll_id: FLL (or secordary clock) id for set_sysclk()
@@ -48,11 +47,10 @@ struct codec_priv {
 };
 
 /**
- * CPU private data
- *
- * @sysclk_freq[2]: SYSCLK rates for set_sysclk()
- * @sysclk_dir[2]: SYSCLK directions for set_sysclk()
- * @sysclk_id[2]: SYSCLK ids for set_sysclk()
+ * struct cpu_priv - CPU private data
+ * @sysclk_freq: SYSCLK rates for set_sysclk()
+ * @sysclk_dir: SYSCLK directions for set_sysclk()
+ * @sysclk_id: SYSCLK ids for set_sysclk()
  * @slot_width: Slot width of each frame
  *
  * Note: [1] for tx and [0] for rx
@@ -65,9 +63,8 @@ struct cpu_priv {
 };
 
 /**
- * Freescale Generic ASOC card private data
- *
- * @dai_link[3]: DAI link structure including normal one and DPCM link
+ * struct fsl_asoc_card_priv - struct Freescale Generic ASOC card private data
+ * @dai_link: DAI link structure including normal one and DPCM link
  * @pdev: platform device pointer
  * @codec_priv: CODEC private data
  * @cpu_priv: CPU private data
@@ -94,8 +91,8 @@ struct fsl_asoc_card_priv {
 	char name[32];
 };
 
-/**
- * This dapm route map exsits for DPCM link only.
+/*
+ * This dapm route map exits for DPCM link only.
  * The other routes shall go through Device Tree.
  *
  * Note: keep all ASRC routes in the second half
-- 
2.25.1

