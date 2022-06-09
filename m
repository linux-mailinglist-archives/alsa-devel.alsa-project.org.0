Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9775446D8
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 11:01:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3FFC1FB2;
	Thu,  9 Jun 2022 11:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3FFC1FB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654765261;
	bh=bRybRqfXspTvgp/ZNTVf05qskzckdMEuYrCR/vCZnxQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QDFr7Owh0GbXnYTuw4QbxH06ewdyj7sWU/Vb+uWv3tvBJohSg1VUzgw2HWXIfeyVI
	 tehPvqF95cg/SYS5XaLk/3STItiw1vHbXcwkW2oWN9Z8d6T0JO/M+++FOc6b58dgbw
	 ejeDDc+fZ6d9Z9oxYcgh4hDyDJCDRYa13MPQ7pjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00FF7F80528;
	Thu,  9 Jun 2022 10:59:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 253DDF8051E; Thu,  9 Jun 2022 10:59:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 429A3F8012F
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 10:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 429A3F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Whwa+XTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654765168; x=1686301168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bRybRqfXspTvgp/ZNTVf05qskzckdMEuYrCR/vCZnxQ=;
 b=Whwa+XTh5fa/cOQT7nwSWk0J1msVok9JrWwYYdNuYjxKP1Ku8u70wWaD
 4VWJJQ6Lllv4WHYTmVkTOy9HOa0ntnF4cefUVczMY/TkilMXPlgOdzz2Z
 COaIUU1BCyovx8TOPbmXuGnLb+BW9SImlzHbCu/NRH0Tj4RukXlWY1vOK
 wGFaO7kUjAuaOdKXchEUFlQ52eYqZJKtZ2jcuh7vuqmPxNuDjkOdl0sRR
 SlBbSAnLEFqYL91GnwD7fNcNcLQPS38ZM+xve17KtE+MK//cR0T7PN3PO
 k6Y1ythf2PtP8lifi6juqIVM+gSEGcig5UZlZ2UatHsd9e/DXzMvJOhnb w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="274732394"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="274732394"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 01:59:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="637369169"
Received: from ekoledex-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.94])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 01:59:19 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 2/3] ASoC: SOF: Intel: hda-loader: Make sure that the fw load
 sequence is followed
Date: Thu,  9 Jun 2022 11:59:48 +0300
Message-Id: <20220609085949.29062-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220609085949.29062-1-peter.ujfalusi@linux.intel.com>
References: <20220609085949.29062-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

The hda_dsp_enable_core() is powering up _and_ unstall the core in one
call while the first step of the firmware loading  must not unstall the
core.
The core can be unstalled only after the set cpb_cfp and the configuration
of the IPC register for the ROM_CONTROL message.

Complements: 2a68ff846164 ("ASoC: SOF: Intel: hda: Revisit IMR boot sequence")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 64290125d7cd..103e62bcfa82 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -110,7 +110,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 	int ret;
 
 	/* step 1: power up corex */
-	ret = hda_dsp_enable_core(sdev, chip->host_managed_cores_mask);
+	ret = hda_dsp_core_power_up(sdev, chip->host_managed_cores_mask);
 	if (ret < 0) {
 		if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev, "error: dsp core 0/1 power up failed\n");
-- 
2.36.1

