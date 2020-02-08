Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5701567F3
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Feb 2020 23:09:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C48B16A5;
	Sat,  8 Feb 2020 23:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C48B16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581199758;
	bh=qngwTkn8kyrAIeXjKQNhrZt2mrpMOwpeV7aJcMBfBHg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lyG6KwLz2oe/ptkNdQps2fihzv3z/+myZFu2LmUosFcb/BNu79JiHbNB5mluy1ROX
	 W0O38AR/6nVj36AdbF5Sx0XXFcyoA4gMX18kd74BmZxsd75/M4WPoxa7TO2d5nyKDl
	 uVGIaQOW1/WJxRCHu5CtykYrNVMjICptTLa/TO44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF5B4F80085;
	Sat,  8 Feb 2020 23:07:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EF23F80162; Sat,  8 Feb 2020 23:07:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93C23F80085
 for <alsa-devel@alsa-project.org>; Sat,  8 Feb 2020 23:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93C23F80085
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1j0YG1-0008Qa-6Q; Sat, 08 Feb 2020 22:07:21 +0000
From: Colin King <colin.king@canonical.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>,
 "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>,
 alsa-devel@alsa-project.org
Date: Sat,  8 Feb 2020 22:07:20 +0000
Message-Id: <20200208220720.36657-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: Intel: mrfld: return error codes when an
	error occurs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Colin Ian King <colin.king@canonical.com>

Currently function sst_platform_get_resources always returns zero and
error return codes set by the function are never returned. Fix this
by returning the error return code in variable ret rather than the
hard coded zero.

Addresses-Coverity: ("Unused value")
Fixes: f533a035e4da ("ASoC: Intel: mrfld - create separate module for pci part")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/intel/atom/sst/sst_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst/sst_pci.c b/sound/soc/intel/atom/sst/sst_pci.c
index d952719bc098..5862fe968083 100644
--- a/sound/soc/intel/atom/sst/sst_pci.c
+++ b/sound/soc/intel/atom/sst/sst_pci.c
@@ -99,7 +99,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
 	dev_dbg(ctx->dev, "DRAM Ptr %p\n", ctx->dram);
 do_release_regions:
 	pci_release_regions(pci);
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.25.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
