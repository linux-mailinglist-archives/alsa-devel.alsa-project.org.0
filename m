Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 002D04CDEF1
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 22:00:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 964911F6B;
	Fri,  4 Mar 2022 21:59:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 964911F6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646427626;
	bh=NL+cAusQIcG3vgSYbLPekRpXmWyOfn4IygYUiusEByw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cWVYDG34gK4lkEanxAYtktQ83qn5RrtMfYatafJ7S5Fs6sFqU7Ct62NAKhL9oJ68P
	 7kNDvZ4l8bg2ubY5gULBy/jt2xQW7LvUqtQHKiwQ0JT6S1Jf8MbVIXX2sth0aC1JVe
	 iIkH6DfcTpDvXNOeMdUJ2R+njmrj5Kn10c2Gas1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22ED0F8051E;
	Fri,  4 Mar 2022 21:57:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA255F8051E; Fri,  4 Mar 2022 21:57:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2965CF80311
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 21:57:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2965CF80311
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QkQofnAX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646427470; x=1677963470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NL+cAusQIcG3vgSYbLPekRpXmWyOfn4IygYUiusEByw=;
 b=QkQofnAXQeUAfmLiMs6QuvmFn50YQk2XXK0PG/pRxybAEtSutMEFToXB
 wDfC3kNWyu/+8Kda0q9d4cheyUCIASK0e0U6IiJ7qffoBFokpuGG6ybpO
 wY5pDt649aZHBeeOK0fAfBbZ3KO4t/i2lfLcHrpvDtEcDarUYiI8wqs6A
 2N6J1yy+lyXwUumM9CwmxRthQF0I7Uh2XJmi/qmovtZN2w4uRFN2HflNt
 atGtGgh665kZ+UDsTG7k/Tn+KlS7K2hQk8KS0lc8HkKD52mewn9itKjPl
 0ZwYiJx2cD5zyvCSDHg+BI3lZs/ay9aA2lsZpSCmiOdvlG2SUapQWfdO3 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="340492553"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="340492553"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="631271294"
Received: from grmundad-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.115.48])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:45 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/10] ASoC: SOF: amd: Increase ACP_HW_SEM_RETRY_COUNT value
Date: Fri,  4 Mar 2022 14:57:30 -0600
Message-Id: <20220304205733.62233-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
References: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

Host is trying to acquire semaphore lock based on HW_SEM_RETRY_COUNT
value which is set to 10 by default. So host will loop for 10 times
trying to acquire lock before giving error msg "Failed to acquire HW
lock". Though this loop count of 10 is good enough with most of the
times but we have observed such failure msg in very few cases(~5 %).

Increase ACP_HW_SEM_RETRY_COUNT to avoid such issue and loop for a
significant time period before throwing error. We're setting newer
loop count to quite higher value of 10K but it's very unlikely that
it will loop for this count, since for most of the cases lock will
get acquired at much lesser loop iterations.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index db1030d36811..f550a5010a91 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -17,7 +17,7 @@
 
 #define ACP_DSP_BAR	0
 
-#define ACP_HW_SEM_RETRY_COUNT			10
+#define ACP_HW_SEM_RETRY_COUNT			10000
 #define ACP_REG_POLL_INTERVAL                   500
 #define ACP_REG_POLL_TIMEOUT_US                 2000
 #define ACP_DMA_COMPLETE_TIMEOUT_US		5000
-- 
2.30.2

