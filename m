Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCF92177DF
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:24:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22F52169B;
	Tue,  7 Jul 2020 21:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22F52169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594149890;
	bh=xBUASslxjSyhTFK6h+nWFMq+LULqrshfcg1w85dLBf4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XHUcEhi3wEZvg+urG58ZKWYXxnPr9wvoPjpHvVKCi/7PA4I3uQGa/9sPwp65hd+/2
	 rhZmiZf0SYJcPTAV6Ui+blgQE3DiKl4KRlwZWfuqpPmTVj2zK217yfu11Ovi6BrSop
	 vVxFE0FgJjiJ5aHRtlTrrDHkfWHWESmqpk7T6o2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7386F8025A;
	Tue,  7 Jul 2020 21:23:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8783AF80274; Tue,  7 Jul 2020 21:23:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B624FF8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:23:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B624FF8011F
IronPort-SDR: Sd4oKXIo8jmdF2/GbZCcBeRrZd3a6B1Vn9dkLprpZwJ7I1JLDnW+9/Bx3oU6fCKh5tyAMgfee9
 7L0y85ZPxrsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="145187058"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="145187058"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:23:26 -0700
IronPort-SDR: nZd1XNfBgSexdEI+Op9MoJXOk1LmIOxOGcG1+OVzQaZ0IqMS97VDSWk6TLGuC8zKrF4+G5dR8+
 mVMUiSDNd3cg==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="266915972"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:23:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: Intel: Skylake: remove comparison always false
 warning
Date: Tue,  7 Jul 2020 14:23:08 -0500
Message-Id: <20200707192310.98663-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707192310.98663-1-pierre-louis.bossart@linux.intel.com>
References: <20200707192310.98663-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, broonie@kernel.org,
 Piotr Maziarz <piotrx.maziarz@intel.com>, Lee Jones <lee.jones@linaro.org>
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

Fix W=1 warnings:

skl-sst-dsp.c: In function ‘skl_dsp_get_enabled_cores’:
include/linux/bits.h:26:28: warning: comparison of unsigned expression
< 0 is always false [-Wtype-limits]

cast the core number to a long to avoid checking if an unsigned value
is lower than zero.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/skylake/skl-sst-dsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-sst-dsp.c b/sound/soc/intel/skylake/skl-sst-dsp.c
index 225706d148d8..cb83b395f210 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.c
+++ b/sound/soc/intel/skylake/skl-sst-dsp.c
@@ -52,7 +52,7 @@ unsigned int skl_dsp_get_enabled_cores(struct sst_dsp *ctx)
 	unsigned int core_mask, en_cores_mask;
 	u32 val;
 
-	core_mask = SKL_DSP_CORES_MASK(skl->cores.count);
+	core_mask = SKL_DSP_CORES_MASK((long)skl->cores.count);
 
 	val = sst_dsp_shim_read_unlocked(ctx, SKL_ADSP_REG_ADSPCS);
 
-- 
2.25.1

