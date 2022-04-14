Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD70501B64
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 20:53:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D8D118D1;
	Thu, 14 Apr 2022 20:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D8D118D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649962394;
	bh=iO/oV/XAQw/WOIOFY2DdfwfKnxTAu0Lc+seRw6IAvIU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P3acdvKtfL+bF+UTn5UCrwkzEB7hR/xIq3CRdU0DBWJL67KvfUKNyal+AQOApjZg0
	 09DWI59vr0qrW5GEFFzW0rNDtQKPg6mWAsri4lMmehJA9i4iikh4p6R4L21xpP8F3k
	 5Nu3R8fjh2p2edfA8+K2YVCc5ngUfG3NyWd18Gw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0981FF8057C;
	Thu, 14 Apr 2022 20:49:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAD47F80557; Thu, 14 Apr 2022 20:49:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A081F80535
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 20:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A081F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RJ/nPowh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962140; x=1681498140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iO/oV/XAQw/WOIOFY2DdfwfKnxTAu0Lc+seRw6IAvIU=;
 b=RJ/nPowht0ZRMBcvillQS+YS47WuLXhq+oBbo814BgRShQ2rqZs2ZYnO
 Ac/binlL08UAFABWs8vH+ITnZ7TGLslGlj8N7LlGv77UtCgniB1/cIn8h
 ncui8ExvwiedVeiwD5elywyptOzyoXp887M9XDdevQWZXf8k0JpRyDmiD
 vEcALvmc4FoztL7RTQ3KPKVBrRvDB6eYeRVV0Z5nRF9Kuu3G5K5hy9p9g
 O1pye1w/MsUV63O36yr2afh4xcBY1Px1avB2tmrj4qxORsEv6pEpycSiB
 iW6gM4UDyS02PDi3yRe6Yx9ktUQJnXj0FXTe15xZGm+HB2XpNHKeFfqpB w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="349442357"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="349442357"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:43 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="560304649"
Received: from rrsolima-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.130.212])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 11/15] ASoC: SOF: Intel: hda: use BIT() macros for
 consistency
Date: Thu, 14 Apr 2022 13:48:13 -0500
Message-Id: <20220414184817.362215-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
References: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

BIT() macros should be used for all ADSPIC/IS registers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index cc55439ab187..f7a93012b811 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -223,8 +223,8 @@
 #define HDA_DSP_REG_POLL_INTERVAL_US		500	/* 0.5 msec */
 #define HDA_DSP_REG_POLL_RETRY_COUNT		50
 
-#define HDA_DSP_ADSPIC_IPC			1
-#define HDA_DSP_ADSPIS_IPC			1
+#define HDA_DSP_ADSPIC_IPC			BIT(0)
+#define HDA_DSP_ADSPIS_IPC			BIT(0)
 
 /* Intel HD Audio General DSP Registers */
 #define HDA_DSP_GEN_BASE		0x0
@@ -268,8 +268,8 @@
 /* HIPCTE */
 #define HDA_DSP_REG_HIPCTE_MSG_MASK	0x3FFFFFFF
 
-#define HDA_DSP_ADSPIC_CL_DMA		0x2
-#define HDA_DSP_ADSPIS_CL_DMA		0x2
+#define HDA_DSP_ADSPIC_CL_DMA		BIT(1)
+#define HDA_DSP_ADSPIS_CL_DMA		BIT(1)
 
 /* Delay before scheduling D0i3 entry */
 #define BXT_D0I3_DELAY 5000
-- 
2.30.2

