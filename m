Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DC460B247
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:45:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D4A070F3;
	Mon, 24 Oct 2022 18:44:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D4A070F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666629901;
	bh=f+2GoNKcySJDqV6cbjIEM2Cex+obX07TIysn/z0I0wo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kZKrSU0OQeKS+xYNCMi+IobcYtW2GLBTBQHM0DWHe5ijigUY6Yjhm1mPvWxTm9rKe
	 Kk1WE13wfqsZjwtpw3DQ0/eozeIAMlI4kJPr1m5sVX4r1eD5dgCABxGQMQ7KQRaAvC
	 Gj1iPCV8CtaCnHtIHBKQ7yyJ2J2uZ0kT8WbhUdlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B848BF8053D;
	Mon, 24 Oct 2022 18:44:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2934F80240; Mon, 24 Oct 2022 18:44:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97A90F80240
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97A90F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ngVcjd0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666629842; x=1698165842;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f+2GoNKcySJDqV6cbjIEM2Cex+obX07TIysn/z0I0wo=;
 b=ngVcjd0Z594Fc+2zvt767APxzbW2SB3pnxWjoPLS1uUMj17S0GPxMIG9
 DXUgnq/aGvwwnNK6fWNFjxPMhSV11mmYAUQ/yohbheLcgpd6VPXqWABWC
 XeX6Rp+VRPZRQoVN8XbL8MI6RUMkWW1Ce1E+krcBzdPLkFBamSsKkYvCv
 W9jMRUh3c60jAGO71hZIIVGpY41V5EmjsuwuIDQDSZIC/Ii0Fm3noCyHc
 wCD/ws0lXB8KB3aSUH+6vcoSWbliaxzAlt+tDBoafdZCJu4LIiTUdGutc
 BXEQR4b1drV0t64QYubpwfFlNBesIY+X80Ss6C/Vrv/An/2525zzG5nzM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="308561073"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="308561073"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:43:59 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="806367767"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="806367767"
Received: from tdsilva-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.236])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:43:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Intel: MTL: fix comment error
Date: Mon, 24 Oct 2022 11:43:50 -0500
Message-Id: <20221024164350.234830-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

Fix small cut-and-paste error in comment.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 7e8b298786df6..91619036762b4 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -393,7 +393,7 @@ static int mtl_dsp_core_power_down(struct snd_sof_dev *sdev, int core)
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_DSP2CXCTL_PRIMARY_CORE,
 				MTL_DSP2CXCTL_PRIMARY_CORE_SPA_MASK, 0);
 
-	/* Wait for unstable CPA read (1 then 0 then 1) just after setting SPA bit */
+	/* Wait for unstable CPA read (0 then 1 then 0) just after setting SPA bit */
 	usleep_range(1000, 1010);
 
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_DSP2CXCTL_PRIMARY_CORE, dspcxctl,
@@ -422,7 +422,7 @@ static int mtl_power_down_dsp(struct snd_sof_dev *sdev)
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_HFDSSCS,
 				MTL_HFDSSCS_SPA_MASK, 0);
 
-	/* Wait for unstable CPA read (1 then 0 then 1) just after setting SPA bit */
+	/* Wait for unstable CPA read (0 then 1 then 0) just after setting SPA bit */
 	usleep_range(1000, 1010);
 
 	/* poll with timeout to check if operation successful */
-- 
2.34.1

