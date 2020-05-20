Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B161DBA83
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 19:04:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A9DD17EF;
	Wed, 20 May 2020 19:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A9DD17EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589994242;
	bh=rQLY5OGQWianGR9AISL8Ulv85IIlX0a4ZdSr+/6a9mc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HqG6k4n4sBBHfQCn4De4Pumok6XwuOkAT1dbZQfxXvNTAek8W/dr4TT5ZTPZqCnIw
	 wxzqK59UA1x4Qrq300ZwIULM7gEcEk67DwFie5VMYylJlMlV/Vaiqqt4uoWTvZJJHZ
	 iP2t+YydXOblr8Z8GaA749ekuNKmUP4kvrd/TCaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BA9FF802A2;
	Wed, 20 May 2020 18:59:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7A4DF8026F; Wed, 20 May 2020 18:59:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9958F80216
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 18:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9958F80216
IronPort-SDR: kKk/DgmWuQGE3V6RmjLrqZm090oLE+PFRq5ftGFHXgaH/ThIoCSRl1n3bUQzvY2BVur3WQA3KJ
 cFAxeWBpK/jA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 09:59:18 -0700
IronPort-SDR: ipf1thPuIUxNC9V+xZ8E9QqPUbuskCGT4qqcgYgNv+0tG4DJrFOqQBMIZaQNtpAsEDI4DBbe3T
 LDGWvV+kYqDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; d="scan'208";a="412085889"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 20 May 2020 09:59:17 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/5] ASoC: SOF: loader: Adjust validation condition for
 fw_offset
Date: Wed, 20 May 2020 19:59:07 +0300
Message-Id: <20200520165911.21696-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520165911.21696-1-kai.vehmanen@linux.intel.com>
References: <20200520165911.21696-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

From: Karol Trzcinski <karolx.trzcinski@linux.intel.com>

Condition in if statement should be same as trace message
and FW size equal to zero (after skipping offset) should
be marked as invalid.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 2 +-
 sound/soc/sof/loader.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index d762b3e1ce4a..441d05cda604 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -293,7 +293,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 
 	chip_info = desc->chip_info;
 
-	if (plat_data->fw->size < plat_data->fw_offset) {
+	if (plat_data->fw->size <= plat_data->fw_offset) {
 		dev_err(sdev->dev, "error: firmware size must be greater than firmware offset\n");
 		return -EINVAL;
 	}
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 4a5b57ecf359..eed3d1e65685 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -385,7 +385,7 @@ static int check_header(struct snd_sof_dev *sdev, const struct firmware *fw,
 	struct snd_sof_fw_header *header;
 	size_t fw_size = fw->size - fw_offset;
 
-	if (fw->size < fw_offset) {
+	if (fw->size <= fw_offset) {
 		dev_err(sdev->dev, "error: firmware size must be greater than firmware offset\n");
 		return -EINVAL;
 	}
-- 
2.26.2

