Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FDB5F9E0A
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 13:54:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3688A2918;
	Mon, 10 Oct 2022 13:53:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3688A2918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665402878;
	bh=OgygjgFOLQ+lJxPo5N6olQTmtthRmOt/SHG8C643xTo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MbFTHnhEgR+yp/sPW/f8IAUrfab9h0t+Kr1pQ7RtHUsawBkgRxw9RofvaaAt1BJRR
	 fvcPkMlPBmb9TJR8LVnmVoH0+4XDE7inbkjif+ObZb7adfx78NQdseAMSm0+He+8iE
	 puDknoWL99lnf6dmWbo/CfBhpeCKsNCyLo4o3M9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBA1EF80578;
	Mon, 10 Oct 2022 13:51:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F23EFF80571; Mon, 10 Oct 2022 13:51:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6E83F80557
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 13:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6E83F80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NdhyEMeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665402711; x=1696938711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OgygjgFOLQ+lJxPo5N6olQTmtthRmOt/SHG8C643xTo=;
 b=NdhyEMeDhK9ccV1V9TPx5+vyp1rNl2tcb2Xewi27by+n+yF1MiGOTtWW
 YaRIwmQlrnp/P/jmtxa/XTwhC+IgGzL9f+b8ptKByUKPJf6ZUSU5QDvHg
 N9N2bNfEIDmyTDp26YKw/uOhrudw6MHyBA9zWXwn/i2iDmRfkgB9coqK4
 JzYL3BlYHTPjFjxg2PsAjZDt2Y9d5/AOoJSGGza6zzZUtz6MwMpTivKy2
 3aq86QC8Ml2jLJXDkq10dilN2Q2BO3hWeWd3FcoYlFWuZIlECj5NsbmAX
 Mbm1t4p1o3wwhxfZsUrDddyWIZqRSH+ZI/nhVYUTwcD2h+9R1eJ2uZotY A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="390513237"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="390513237"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 04:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="954889053"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="954889053"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2022 04:51:45 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 06/15] ASoC: Intel: avs: Support da7219 on both KBL and APL
Date: Mon, 10 Oct 2022 14:07:40 +0200
Message-Id: <20221010120749.716499-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010120749.716499-1-cezary.rojewski@intel.com>
References: <20221010120749.716499-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

KBL and APL devices use same codec but have different clock, so it must
be set appropriately depending on device.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/da7219.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 02ae542ad779..503a967a1c3a 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -6,6 +6,7 @@
 //
 
 #include <linux/module.h>
+#include <linux/platform_data/x86/soc.h>
 #include <linux/platform_device.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
@@ -80,7 +81,10 @@ static int avs_da7219_codec_init(struct snd_soc_pcm_runtime *runtime)
 	int ret;
 
 	jack = snd_soc_card_get_drvdata(card);
-	clk_freq = 19200000;
+	if (soc_intel_is_apl())
+		clk_freq = 19200000;
+	else /* kbl */
+		clk_freq = 24576000;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, clk_freq, SND_SOC_CLOCK_IN);
 	if (ret) {
-- 
2.25.1

