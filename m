Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BA61AD939
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 10:59:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C3321672;
	Fri, 17 Apr 2020 10:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C3321672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587113940;
	bh=PS4FV4N33pcy6INuFdG+Ux1KYeVwiajQKZmLOf4qLk4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ARlC1EDQydXsmwjQjWGkerGO+ymNA+ZllNJwcOzuHpNNGliPdW9ZUyDhJSz8NBtPv
	 dRXnIbCMbz/C2+XVDPxFAu2SLoL6HqhXeaIqKi844zpqvhHft1mjLpnZZgakplGQfO
	 wncng2oPio4bpCbaaohKrzcjSsGbynYjEoYkCQMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 625C7F80229;
	Fri, 17 Apr 2020 10:57:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A709AF80264; Fri, 17 Apr 2020 10:57:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BAEAF80229
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 10:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BAEAF80229
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EF823D445A7E116B46C7;
 Fri, 17 Apr 2020 16:57:26 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 16:57:18 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <cezary.rojewski@intel.com>, <pierre-louis.bossart@linux.intel.com>,
 <liam.r.girdwood@linux.intel.com>, <yang.jie@linux.intel.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <hdegoede@redhat.com>, <tglx@linutronix.de>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: Intel: atom: remove unused 'sst_mix_voip_controls'
Date: Fri, 17 Apr 2020 17:23:44 +0800
Message-ID: <20200417092344.14301-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Cc: Hulk Robot <hulkci@huawei.com>, Jason Yan <yanaijie@huawei.com>
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

Fix the following gcc warning:

sound/soc/intel/atom/sst-atom-controls.c:710:30: warning:
‘sst_mix_voip_controls’ defined but not used [-Wunused-const-variable=]
 SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_voip_controls);
                              ^

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 sound/soc/intel/atom/sst-atom-controls.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 69f3af4524ab..541f0059ba7a 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -707,7 +707,6 @@ SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_pcm2_controls);
 SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_sprot_l0_controls);
 SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_media_l1_controls);
 SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_media_l2_controls);
-SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_voip_controls);
 SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_codec0_controls);
 SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_codec1_controls);
 SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_modem_controls);
-- 
2.21.1

