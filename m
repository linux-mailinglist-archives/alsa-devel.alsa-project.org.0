Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0313945AE
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 18:12:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CA0C16E1;
	Fri, 28 May 2021 18:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CA0C16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622218369;
	bh=MjKN+g8FYz0q0Bj42FuA1DLXHalrifpRBpj6IQaHP4k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qrxu6MEVk/YbhowxGN4BTX1oJiYXY3869a9jwL38hqGkPytozLUi/oHZOF5y/Z1oF
	 zcG2ZPxGXu8QRCuRJ3L8/L6Pyx/mseZT657BqODakZ5tII3WS2X9aw8rsKLItTVaKs
	 Yah5t/pAWc8cVQ6R4YnPAqvFM/QduEwLgzU72DOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42036F804B1;
	Fri, 28 May 2021 18:11:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FD4FF802BE; Fri, 28 May 2021 18:11:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBC34F802BE
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 18:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBC34F802BE
IronPort-SDR: vq/ir5DTT5Ju2fRTE/FzKAurjeQrx3L/0q6cx7c5pBytDIECDITfgFC/orIZ0OCy6tQTFFyiTg
 QZ67guM0iMEA==
X-IronPort-AV: E=McAfee;i="6200,9189,9998"; a="203017010"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="203017010"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 09:10:57 -0700
IronPort-SDR: Gpjtk6HXFmCMdZ8tjF8a6jChQ3exhkjHtkDaHrWEB11EePKopcsgIE+SpfIWjljcEiNU2B8C+g
 CLZux0RcsUyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="444058769"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008.jf.intel.com with ESMTP; 28 May 2021 09:10:55 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/2] ASoC: SOF: Intel: hda: don't print ROM status if
 cl_dsp_init() fails
Date: Fri, 28 May 2021 19:05:51 +0300
Message-Id: <20210528160551.10145-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528160551.10145-1-kai.vehmanen@linux.intel.com>
References: <20210528160551.10145-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

cl_dsp_init() dumps the ROM status if it fails after max
attempts before powering off the DSP. Remove the duplicate
log to print the ROM status and error in
hda_dsp_cl_boot_firmware(). These values are invalid anyway
as the DSP is already powered off.

Co-developed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index fc25ee8f68dc..6f4771bf9de3 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -385,11 +385,6 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	if (i == HDA_FW_BOOT_ATTEMPTS) {
 		dev_err(sdev->dev, "error: dsp init failed after %d attempts with err: %d\n",
 			i, ret);
-		dev_err(sdev->dev, "ROM error=0x%x: FW status=0x%x\n",
-			snd_sof_dsp_read(sdev, HDA_DSP_BAR,
-					 HDA_DSP_SRAM_REG_ROM_ERROR),
-			snd_sof_dsp_read(sdev, HDA_DSP_BAR,
-					 HDA_DSP_SRAM_REG_ROM_STATUS));
 		goto cleanup;
 	}
 
-- 
2.31.1

