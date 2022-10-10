Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 153A95F9E1A
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 13:56:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A00C2931;
	Mon, 10 Oct 2022 13:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A00C2931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665402968;
	bh=1B2hUD1j7bRc11+vDf5SX1yy256UWJMaQb7ipbR3I5g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QiowQPycExOe20MRCc3vAUEu20m7RHoMF0buCcaNmUAKmvtELdTFfaD9QkVX51hc0
	 XP5P8gpwa9Z04hcXAhAxBrRySixCMWrVZydUW7muvgwneSfGLSP7VTsGHS/vaGwR6u
	 3hevSEW1e4bVy4tLIhTIPOiAzPkde3oIv3kA7Qwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71C45F804E5;
	Mon, 10 Oct 2022 13:52:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 914B6F805BD; Mon, 10 Oct 2022 13:52:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DFB4F805AF
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 13:52:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DFB4F805AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UYhPrYgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665402722; x=1696938722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1B2hUD1j7bRc11+vDf5SX1yy256UWJMaQb7ipbR3I5g=;
 b=UYhPrYgtrkO90+z81KwIoMkEAcHJ1iOtyz5QEivpGCKXMl6oRNG+Hgty
 aqa4/3LjooZY6yr0+nDckTBCjz7F6hFvz5ON8PqVH+yhskr3t7aTTSt0o
 j3qu0HpNpWwBTqdkc5JJ5cDAvXJ1lHqm5SQ+cZZXW7+i8vOo9cJJds+l8
 RS7cNXDJYMHZy2+jgdOfGItbJal19t9R9oYre/uF736i4qTJqtQW+Qtjb
 rFbWxUDWGa1YMrZii+lxgd7LbQOqoHb4GHp14kI2EY/tEFQqmpG09OGnJ
 7tZDLPL074FoTjS5Ovku8BewdXA0xhWHxXthD04GTU7lWBAy5GElxB1LS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="390513262"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="390513262"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 04:52:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="954889118"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="954889118"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2022 04:51:59 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 13/15] ASoC: Intel: avs: Simplify ignore_fw_version description
Date: Mon, 10 Oct 2022 14:07:47 +0200
Message-Id: <20221010120749.716499-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010120749.716499-1-cezary.rojewski@intel.com>
References: <20221010120749.716499-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Reword the parameter description to drop any confusion regarding its
purpose.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 9e3f8ff33a87..2d80a271eb50 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -43,7 +43,7 @@
 /* Occasionally, engineering (release candidate) firmware is provided for testing. */
 static bool debug_ignore_fw_version;
 module_param_named(ignore_fw_version, debug_ignore_fw_version, bool, 0444);
-MODULE_PARM_DESC(ignore_fw_version, "Verify FW version 0=yes (default), 1=no");
+MODULE_PARM_DESC(ignore_fw_version, "Ignore firmware version check 0=no (default), 1=yes");
 
 #define AVS_LIB_NAME_SIZE	8
 
-- 
2.25.1

