Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A76754CDF01
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 22:00:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A9391F8F;
	Fri,  4 Mar 2022 21:59:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A9391F8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646427648;
	bh=2JK0mNcu7PUPAwarOyY/Z+yeDnC1ZKF9pTQ519uiz7g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q7DCM1tBYuOQaefbDYohbLEv4qIyHddbUQN9924dbUtvl6WVfPk9tcE1mPs+8WJPk
	 pdUOiBORfiiGJzafAZRNwUs1r7z1zG5EfXBKyVd+AYfg/VnJ0dIKxiBcRXOYdbb7ec
	 uSqB0ZUV+pIRLDPh+GPEB3G8uUce4hj/4ZurVVQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A389DF80517;
	Fri,  4 Mar 2022 21:57:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92AA4F80139; Fri,  4 Mar 2022 21:57:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60492F80519
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 21:57:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60492F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lTkIQbVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646427472; x=1677963472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2JK0mNcu7PUPAwarOyY/Z+yeDnC1ZKF9pTQ519uiz7g=;
 b=lTkIQbVwWmHF76NzbBrYbOKboc4En2L5HkfDnQH2b+xvN9Gs3+8/qT47
 L3HuHNhrtIejDo4NOpFlJL3bWv1hGup1BHRfffLQaN90Qzv4xTJbbxWK5
 dZOvPEO++8mjqOjNx2KMhMC0e1c4FcQ/yk3i60qhGq0Qc9Av5H0wP8irj
 gTVTzBm/hcOx5z+y1TOBDoQwphs1an4B7orihiAKuegqztwmaBxHuQKDo
 HccVePda9Nya6sM1877wfU68GRAmZlhJyo/g43KNKk6kt93woQ9RhIQx8
 wXq55ri7CTUsuCEamK9BnYT0RSs1/Fc/Ck0teIb88CoHdfS8iBcqsQ+cW w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="340492557"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="340492557"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:47 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="631271303"
Received: from grmundad-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.115.48])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:47 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/10] ASoC: SOF: debug: clarify operator precedence
Date: Fri,  4 Mar 2022 14:57:32 -0600
Message-Id: <20220304205733.62233-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
References: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@intel.com>
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

cppcheck warning:

sound/soc/sof/debug.c:398:46: style: Clarify calculation precedence
for '&' and '?'. [clarifyCalculation]
 char *level = flags & SOF_DBG_DUMP_OPTIONAL ? KERN_DEBUG : KERN_ERR;
                                             ^
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 145fd0d1e166..7b1139961a99 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -395,7 +395,7 @@ static void snd_sof_dbg_print_fw_state(struct snd_sof_dev *sdev, const char *lev
 
 void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, const char *msg, u32 flags)
 {
-	char *level = flags & SOF_DBG_DUMP_OPTIONAL ? KERN_DEBUG : KERN_ERR;
+	char *level = (flags & SOF_DBG_DUMP_OPTIONAL) ? KERN_DEBUG : KERN_ERR;
 	bool print_all = sof_debug_check_flag(SOF_DBG_PRINT_ALL_DUMPS);
 
 	if (flags & SOF_DBG_DUMP_OPTIONAL && !print_all)
-- 
2.30.2

