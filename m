Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7C5602B5A
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:11:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A458E9C7A;
	Tue, 18 Oct 2022 14:10:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A458E9C7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095098;
	bh=kClnyz+/XLXFkhPWxjnHPsrvjW08rjas+159ibmc/0I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ChVAwdkUMCMosUSabdQZpm4YbTmaB1UU615uhVyqP1da6jLG/FPW5CDiKKjTGKuK0
	 +LEv8oMhOzbXwNg3y5jzxIJfxgj71r8eNOOQ/2g4ZqUQgDc+7DhsvuKiXQNMDGu3W4
	 +wFHA4ldVybcB+vv+T0UZ2376lUOlfFAETk6P2t0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80889F80563;
	Tue, 18 Oct 2022 14:09:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03EF4F8054A; Tue, 18 Oct 2022 14:09:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D3C2F80535
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D3C2F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iLa0oVGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094950; x=1697630950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kClnyz+/XLXFkhPWxjnHPsrvjW08rjas+159ibmc/0I=;
 b=iLa0oVGfe8wqWehgpThqYYOXHKbqB+BaOdAVtk5Ru/KTK7/p15GY+jWT
 QDlYaAg3Ie/orFY3tTTZIsp2yKWgUeyexllDDriTGylMNf+jPsCGNVCX5
 U3WD5qS1Xu7PTmc6ZHpwJ5On9+jChnlm9gzf7TTa93iBm98lene4vCVgn
 yMiFFj52WxXTpElQOOT+KEqGNTOnbo4GTFPt1K6QwlU1AWdZdTOJmhItM
 FPEJ+hlJLtYnjElBN467MRPnpXrFSFz41ZcAiYDq5qglfHmgedWSPTq9d
 R1n2UhwqAt8fwnoHEAYg2wpp5IfhdbqEVsDaZAT/Qo/YYq9PuNLegtQ99 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="303697480"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="303697480"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579757866"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579757866"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:04 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 05/19] ASoC: SOF: Intel: hda-loader-skl: Use the basefw
 firmware container directly
Date: Tue, 18 Oct 2022 15:09:02 +0300
Message-Id: <20221018120916.19820-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
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

Switch to access to the firmware struct via sdev->basefw container to
unblock the removal of the firmware information from plat_data.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader-skl.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader-skl.c b/sound/soc/sof/intel/hda-loader-skl.c
index 0193fb3964a0..3211f561db29 100644
--- a/sound/soc/sof/intel/hda-loader-skl.c
+++ b/sound/soc/sof/intel/hda-loader-skl.c
@@ -494,14 +494,13 @@ static int cl_copy_fw_skl(struct snd_sof_dev *sdev,
 			  struct snd_dma_buffer *dmab)
 
 {
-	struct snd_sof_pdata *plat_data = sdev->pdata;
-	const struct firmware *fw =  plat_data->fw;
+	const struct firmware *fw =  sdev->basefw.fw;
 	struct firmware stripped_firmware;
 	unsigned int bufsize = HDA_SKL_CLDMA_MAX_BUFFER_SIZE;
 	int ret;
 
-	stripped_firmware.data = plat_data->fw->data + plat_data->fw_offset;
-	stripped_firmware.size = plat_data->fw->size - plat_data->fw_offset;
+	stripped_firmware.data = fw->data + sdev->basefw.payload_offset;
+	stripped_firmware.size = fw->size - sdev->basefw.payload_offset;
 
 	dev_dbg(sdev->dev, "firmware size: %#zx buffer size %#x\n", fw->size, bufsize);
 
-- 
2.38.0

