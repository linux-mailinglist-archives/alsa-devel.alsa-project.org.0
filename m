Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2376D6D5BC5
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 11:23:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 469FD839;
	Tue,  4 Apr 2023 11:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 469FD839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680600238;
	bh=qfoTi3uPX7I6WDVUKZfHcuyekAw81NM6si9NWTw3/gk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XhSsAOif1P5CtCJVxWuHiDKqd0MiSd3IBCOAdiNs4+sejQEDzaMo5t26gKVu3Dhv/
	 UEQw5pOIs0QKClq+qoaa1/ocFyMTGy0FWubkpMJYqa8lfvUyn22XXkaDL4x56ya/L2
	 gZsjxKcBenR9FBKsSJ1NuaJ69e2O18p5rTp3lOHY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 029B5F80578;
	Tue,  4 Apr 2023 11:21:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 439CCF80542; Tue,  4 Apr 2023 11:21:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7877F801C0
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 11:21:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7877F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=V3BoEz69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680600067; x=1712136067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qfoTi3uPX7I6WDVUKZfHcuyekAw81NM6si9NWTw3/gk=;
  b=V3BoEz69coSTb52q17tvgDk83W/PuddmpoEDMZwouCpakJPXf/EQV4QF
   jq2Bo90AmcGs6bUAmUpiTu3CXw3L5bj+Nx8aJhaoimq4ODVBbrM035C1m
   EaiAhfQRmDXTKfu/zwczAEOZdeiRQI9ETBP3tMdRxHXmPDIpQngObo9sh
   k6yFEVCzYDWa+cnqTsP+EKJ6vKx5kxx2acTOEhTI9PySFZc4vkXYs3+3F
   qKVRfo9Qhkn6gOT+9+gXMFxbivb9a0nFZUhy3/8p32vFxoOweClotRqzo
   9unmEldhpMaExzS6upLvtk4BvRVrJcuz7+NStvhA0uUjJUY2CW31pBNBH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339620665"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="339620665"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="688820124"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="688820124"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:21:03 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 10/12] ASoC: SOF: Intel: pci-mtl: Allow DSPless mode
Date: Tue,  4 Apr 2023 12:21:13 +0300
Message-Id: <20230404092115.27949-11-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
References: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LJDCR6LY4WMDM3WZOZOLXTHJVWABJL53
X-Message-ID-Hash: LJDCR6LY4WMDM3WZOZOLXTHJVWABJL53
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LJDCR6LY4WMDM3WZOZOLXTHJVWABJL53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

set the dspless_mode_supported flag to true for mtl family to allow
DSPless mode.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/pci-mtl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
index b183dc0014b4..e276e1e37fed 100644
--- a/sound/soc/sof/intel/pci-mtl.c
+++ b/sound/soc/sof/intel/pci-mtl.c
@@ -31,6 +31,7 @@ static const struct sof_dev_desc mtl_desc = {
 	.chip_info = &mtl_chip_info,
 	.ipc_supported_mask	= BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_INTEL_IPC4,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_INTEL_IPC4] = "intel/sof-ipc4/mtl",
 	},
-- 
2.40.0

