Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BE95CF22
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 14:09:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC5781699;
	Tue,  2 Jul 2019 14:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC5781699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562069343;
	bh=mtZv9B1fMV12B4Ur4khSFQrHJnqqv4m1mUAdtJqkYgk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TmfzsSJzy5OT3346olcU+opeTI3ijOsjO56eu6HKIuAGtxNaSgjxF4atcowCMgXvk
	 oQ/RLIPUZIW3PPxSqjgEr3eS9mIawaNh7DUbLhB4ru5l9Vs/CSSpPeDA5KIA4HqCMC
	 ZpACdHQRWnm3pDrqYeGyPX9Zz2Yob5wolBKM3JeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7417CF800E6;
	Tue,  2 Jul 2019 14:06:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C03BF800DF; Tue,  2 Jul 2019 14:06:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67A9EF80058
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 14:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67A9EF80058
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jul 2019 05:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,443,1557212400"; d="scan'208";a="362199753"
Received: from keyon-x299.sh.intel.com ([10.239.159.75])
 by fmsmga005.fm.intel.com with ESMTP; 02 Jul 2019 05:06:32 -0700
From: Keyon Jie <yang.jie@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue,  2 Jul 2019 20:11:44 +0800
Message-Id: <20190702121144.7809-2-yang.jie@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702121144.7809-1-yang.jie@linux.intel.com>
References: <20190702121144.7809-1-yang.jie@linux.intel.com>
MIME-Version: 1.0
Cc: marcin.rajwa@intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, Marcin Rajwa <marcin.rajwa@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: SOF: Intel: fix reset of
	host_period_bytes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Marcin Rajwa <marcin.rajwa@linux.intel.com>

This patch prevents the reset of host period bytes.
The parameter has been used to keep information about
completion of period copy. Right now we keep this
information in period_irq.

Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
---
 sound/soc/sof/intel/hda-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 9b730f183529..c7022346aba0 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -116,9 +116,9 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 	/* disable SPIB, to enable buffer wrap for stream */
 	hda_dsp_stream_spib_config(sdev, stream, HDA_DSP_SPIB_DISABLE, 0);
 
-	/* set host_period_bytes to 0 if no IPC position */
+	/* update no_period_irq flag for ipc params */
 	if (hda && hda->no_ipc_position)
-		ipc_params->host_period_bytes = 0;
+		ipc_params->no_period_irq = 1;
 
 	ipc_params->stream_tag = hstream->stream_tag;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
