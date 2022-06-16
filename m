Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B87954D9FE
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 07:49:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AF731AC2;
	Thu, 16 Jun 2022 07:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AF731AC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655358588;
	bh=xC8XPtv1Fr2Sz1dKXtd4q4oEn4+t98eK5slHtncLYmE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IChext72DsJBHuLZ5xbp7NH5VIWZcef3yMM7MejsisDmQ5G+yDqlBdKbJMBwKpwsX
	 M6VvgWioymR9dLkcQejZghuSckjU/kTNjnxi7LmS7YmfA758nP5knqxPBflnmIKRup
	 2XwBqQQts+fe+gnxCxYuHifzQPZn3LGt6119RO1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84964F80310;
	Thu, 16 Jun 2022 07:48:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDD36F800D3; Thu, 16 Jun 2022 07:48:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DD7BF800D3
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 07:48:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DD7BF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LYSQX0hd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655358520; x=1686894520;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xC8XPtv1Fr2Sz1dKXtd4q4oEn4+t98eK5slHtncLYmE=;
 b=LYSQX0hd3xIgScrLfGnowwdeBBtu6iFzUQyXBobc+wwCBF7P7E3zLuwm
 Nvskmmkmeb+D040ZLcxlS6m9lm3xOIR4jLV3btcCx/ART3+okxVG96d3v
 F6HKGnq2X3R1+t9zmiu0yaAGe5673ujq22qNddFi2DSGOiBqQBmkkCmOX
 1D85T+/mW3UIHYdfayqJ1BeiY9Ii2N0FvnulpR96MHasq6SYymB3Pn67S
 KC1ysrvFq6+HyHqpG1Umgajh8rgchyF587zR5xlW/W9Z1WQ9abbEP3boP
 eeQ1G1OiT2lO9TWlI9duQ+6C4vN4g8UmXJ5FxMPR1GpcqvZDPrJHO5mMP w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="259635580"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="259635580"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 22:48:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="559585530"
Received: from marlonpr-mobl3.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.228])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 22:48:31 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: IPC4: enable IMR boot
Date: Thu, 16 Jun 2022 08:49:10 +0300
Message-Id: <20220616054910.16690-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
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

IPC4 based firmwares have unconditional support for IMR boot.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 9e99f376f2b3..bca9dc5917f4 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -538,7 +538,8 @@ int hda_dsp_post_fw_run(struct snd_sof_dev *sdev)
 
 		/* Check if IMR boot is usable */
 		if (!sof_debug_check_flag(SOF_DBG_IGNORE_D3_PERSISTENT) &&
-		    sdev->fw_ready.flags & SOF_IPC_INFO_D3_PERSISTENT)
+		    (sdev->fw_ready.flags & SOF_IPC_INFO_D3_PERSISTENT ||
+		     sdev->pdata->ipc_type == SOF_INTEL_IPC4))
 			hdev->imrboot_supported = true;
 	}
 
-- 
2.36.1

