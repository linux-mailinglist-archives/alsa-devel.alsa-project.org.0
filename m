Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DBA601A9B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Oct 2022 22:51:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29AD08AC7;
	Mon, 17 Oct 2022 22:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29AD08AC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666039882;
	bh=E09SRbz4vBuAa84CL2MW6hIRtPdHq2/QWfpLM1uwHco=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vq/vC16kuO+xushrIPe2o5VOXov+ob43mdQQ5sZfBTB3luN+sgbIcdO/4DR6RBNX5
	 Pu+wjvOQtP6Cplv56/iKgUUDy2swBhSa3vqZMJAJzycdyaG8Rgb0tbHutCMOvMg5ro
	 21djsfVkpN4snmx39p1CfX6wqJmekNkTrhIP8loQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0315F8025E;
	Mon, 17 Oct 2022 22:50:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1128F80533; Mon, 17 Oct 2022 22:50:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AB66F8025E
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 22:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AB66F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SRD4Oh4K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666039798; x=1697575798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E09SRbz4vBuAa84CL2MW6hIRtPdHq2/QWfpLM1uwHco=;
 b=SRD4Oh4KGR7LT4NXRAu6I6QHUi4qV3rd923AI5MD/402u15DI1/QyUYT
 fm/z0V9etj3JRAy6HyxxfINp6Av6sVFUV3GCKdvbdTB1rjOx8cTV6gopc
 hhnE0KxLYPiFNCssofnKc8d/M/VRPmrOKTUF/Bup61A5y7W80uGe2VHcf
 qKOOkhwCp9njVz2UQOPi7OOarh+bZS9N45yJOuXjgEsPQURJPF21beKqn
 fXfSuDeNsbysn5DJMQmgE8XBOBfuAMe416KHywsBm261/KceANUqQAVL1
 Jn1w8xntKHxd7AdJQVm5Bt7cts3/H4Sa4kfK14O7jM+HxZN5MdSYl5UcV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293286375"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="293286375"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:49:54 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="717633055"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="717633055"
Received: from cmontgom-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.54.140])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:49:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: Intel: avs: simplify S3 resume flows
Date: Mon, 17 Oct 2022 15:49:45 -0500
Message-Id: <20221017204946.207986-3-pierre-louis.bossart@linux.intel.com>
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

The same code was directly copied from the skylake driver where it was
already questionable. Remove and simplify the flow.

Tested-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/avs/core.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index bb0719c58ca49..58a51361c4b11 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -580,7 +580,6 @@ static int __maybe_unused avs_suspend_common(struct avs_dev *adev)
 static int __maybe_unused avs_resume_common(struct avs_dev *adev, bool purge)
 {
 	struct hdac_bus *bus = &adev->base.core;
-	struct hdac_ext_link *hlink;
 	int ret;
 
 	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
@@ -595,16 +594,6 @@ static int __maybe_unused avs_resume_common(struct avs_dev *adev, bool purge)
 		return ret;
 	}
 
-	/* turn off the links that were off before suspend */
-	list_for_each_entry(hlink, &bus->hlink_list, list) {
-		if (!hlink->ref_count)
-			snd_hdac_ext_bus_link_power_down(hlink);
-	}
-
-	/* check dma status and clean up CORB/RIRB buffers */
-	if (!bus->cmd_dma_state)
-		snd_hdac_bus_stop_cmd_io(bus);
-
 	return 0;
 }
 
-- 
2.34.1

