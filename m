Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A39B7601A9E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Oct 2022 22:51:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A5168ACB;
	Mon, 17 Oct 2022 22:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A5168ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666039902;
	bh=9fgWs/EI3IVdQXFklmFduZe6R0awE7BsvexEGlGKXhY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S79JPhSeNRJzaQ2uV8IRlnpZ1uQfx2NQnzSDL+HdL1TuZ8VHJrxZYY6UwVZv4JPNO
	 LC/OiCIGa0u+FEuD+qEOLyxnVAJRIrQoaWGixe56LNBW5SZREMLuuRxNHLK8MCxW62
	 k3aOuf5aP7wfGACw76HUmwr1b16W8h/2mysJz8xY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F007F8053D;
	Mon, 17 Oct 2022 22:50:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A01AF804D9; Mon, 17 Oct 2022 22:50:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23399F800AA
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 22:49:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23399F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NyuG8f9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666039798; x=1697575798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9fgWs/EI3IVdQXFklmFduZe6R0awE7BsvexEGlGKXhY=;
 b=NyuG8f9O5PcvPmSjw59/iUtDEUHA1EQofroZhfuT9v86THWjHGc28vws
 3WBjsgl5hKSnJ7XpnEUWFzz0QEMIRz1pGqSkyh2Vrq/pEcFfJ39kPJODo
 3A7mQ/RMPgg9H/xlFMIHShGxA7CbHDS4HxE1GDg1NTOE3KloOE7LMiHDi
 1G5CtsSk6rRQI2smUBa1bqEvJxSjc3QSn3BMR9FfOAjOYUuyuEWEilZYp
 odUdhsX0/+UNAR0ogOCoM4VIIo7Gky+nVCivXZEUgynSWUpQ4ruiGgNpI
 woZXl44dxU3Sndsqiz4FzipgGfVo8O65oARVD5FGt9H4SWdKjaN0oRKvV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293286373"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="293286373"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:49:53 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="717633050"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="717633050"
Received: from cmontgom-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.54.140])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:49:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: Intel: Skylake: simplify S3 resume flows
Date: Mon, 17 Oct 2022 15:49:44 -0500
Message-Id: <20221017204946.207986-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017204946.207986-1-pierre-louis.bossart@linux.intel.com>
References: <20221017204946.207986-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

Commit cce6c149eba3a ("ASoC: Intel: Skylake: add link management")
added a perfectly logical/symmetrical link handling for
'suspend_active' aka S0ix

However that commit also added a less obvious part, where during S3
resume the code will "turn off the links which are off before suspend"
as well as stop the cmd_io which is not started.

This sequence looks completely unnecessary and possibly wrong, remove it.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/skylake/skl.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index bbba2df33aaf0..1cfdb04f589fe 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -387,15 +387,6 @@ static int skl_resume(struct device *dev)
 			snd_hdac_bus_init_cmd_io(bus);
 	} else {
 		ret = _skl_resume(bus);
-
-		/* turn off the links which are off before suspend */
-		list_for_each_entry(hlink, &bus->hlink_list, list) {
-			if (!hlink->ref_count)
-				snd_hdac_ext_bus_link_power_down(hlink);
-		}
-
-		if (!bus->cmd_dma_state)
-			snd_hdac_bus_stop_cmd_io(bus);
 	}
 
 	return ret;
-- 
2.34.1

