Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC8E137A6D
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jan 2020 01:03:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F97216CD;
	Sat, 11 Jan 2020 01:02:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F97216CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578701001;
	bh=tXlGX68zrXI8OLfz6nJX0nv8+E2VV0sEiobIea5C0j8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H9T2lZ0117CSbQXyssAxASvQ9sjLnftfcPT2yYrjfRWRhfsGnvDuU/2tAU6m3P5Kc
	 9asazeOsq3YoYGt2VjzukjkZaBVv2SjqGkW9QvBrKdkYo/yC8AwfF/9gWQDRJUpbmy
	 S+Qz9E5qHE0SOGcxKeYmI/1wpBzADdXjtUcJRgEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C13CF80292;
	Sat, 11 Jan 2020 00:58:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8F6EF80161; Sat, 11 Jan 2020 00:58:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6983AF8010B
 for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2020 00:58:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6983AF8010B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 15:58:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,418,1571727600"; d="scan'208";a="224345301"
Received: from jrderube-mobl5.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.155.251])
 by orsmga003.jf.intel.com with ESMTP; 10 Jan 2020 15:58:09 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 10 Jan 2020 17:57:48 -0600
Message-Id: <20200110235751.3404-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110235751.3404-1-pierre-louis.bossart@linux.intel.com>
References: <20200110235751.3404-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 5/8] ASoC: SOF: Intel: lower print level to dbg
	if we will reinit DSP
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

From: Bard liao <yung-chuan.liao@linux.intel.com>

We will reinit DSP in a loop when it fails to initialize the first
time, as recommended. So, it is not an error before we finally give
up. And reorder the trace to make it more readable.

Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 1782f5092639..8852184a2569 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -328,13 +328,13 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 		if (!ret)
 			break;
 
-		dev_err(sdev->dev, "error: Error code=0x%x: FW status=0x%x\n",
+		dev_dbg(sdev->dev, "iteration %d of Core En/ROM load failed: %d\n",
+			i, ret);
+		dev_dbg(sdev->dev, "Error code=0x%x: FW status=0x%x\n",
 			snd_sof_dsp_read(sdev, HDA_DSP_BAR,
 					 HDA_DSP_SRAM_REG_ROM_ERROR),
 			snd_sof_dsp_read(sdev, HDA_DSP_BAR,
 					 HDA_DSP_SRAM_REG_ROM_STATUS));
-		dev_err(sdev->dev, "error: iteration %d of Core En/ROM load failed: %d\n",
-			i, ret);
 	}
 
 	if (i == HDA_FW_BOOT_ATTEMPTS) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
