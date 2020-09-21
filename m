Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 717FF27217A
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:51:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 024EA16BA;
	Mon, 21 Sep 2020 12:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 024EA16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600685472;
	bh=5SIA/HiJGrwJLI4bwpLAHnpA2Qi5GTuRwDs+OFe3aDM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nG+VYGMGyp0hVED8+tT1hesmqpB9alsORoL1C6hqjDbs04cs/cFeKoLnxe4Kf2cQ+
	 QfahP4Wvxwb9gIPWfbs6MbuTt1/ByQLrGWMfKPl0+2EQ+2y3bhKg5VXdwaMyA8teR5
	 St1Fc9FWhKvQrgSZBZiH94NIa9dTyIkRCbfVOIzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A3EAF800B2;
	Mon, 21 Sep 2020 12:49:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DEEFF8015F; Mon, 21 Sep 2020 12:49:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4878F8015F
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4878F8015F
IronPort-SDR: oItLsAgaiNCztrnq3A8wWrzLmoeRFZUbUacpx39e7jaabAGBm5ymMKM20C59AIkeJA0oU/bfhD
 mxqZuqkRd/RA==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="178425109"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="178425109"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 03:49:18 -0700
IronPort-SDR: yCFW5uQlMo5ZvPTtjLqjD4sTnQGRSED6Kl6kefdLU5lTEDXc/tqVJVrWDtdXv7CCjMDhCVoJec
 MK4TJ4XNMKqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="289873314"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga007.fm.intel.com with ESMTP; 21 Sep 2020 03:49:16 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: imx: add missing MODULE_LICENSE() for imx-common
Date: Mon, 21 Sep 2020 13:47:46 +0300
Message-Id: <20200921104746.2903507-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Baluta <daniel.baluta@gmail.com>, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

Fix build warning:
WARNING: modpost: missing MODULE_LICENSE() in sound/soc/sof/imx/imx-common.o

Fixes: 18ebffe4d043 ("ASoC: SOF: imx: Add debug support for imx platforms")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/imx/imx-common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 63d8a5d7bc44..5fee637834c2 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -4,6 +4,7 @@
 //
 // Common helpers for the audio DSP on i.MX8
 
+#include <linux/module.h>
 #include <sound/sof/xtensa.h>
 #include "../ops.h"
 
@@ -70,3 +71,5 @@ void imx8_dump(struct snd_sof_dev *sdev, u32 flags)
 			   IMX8_STACK_DUMP_SIZE);
 }
 EXPORT_SYMBOL(imx8_dump);
+
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.27.0

