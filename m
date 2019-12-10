Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C632117CBF
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 01:55:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89C6686F;
	Tue, 10 Dec 2019 01:54:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89C6686F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575939335;
	bh=a62rvLtIWiWnVImmZaR5jsL5O0UPFQL0kJvJ7e8vMHg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X89LnhP4HGpikFbbSKRKAu+lanLA94LGONfwBsN0ofbOjuNlaH8cLVzZj5CnWaG2W
	 7zHY7z4SF8xcmQHNmoWQAEy/JvpS03Qq0rqRjbZTtpOZQG3FLZKp9IKvMRGmXEciQa
	 3amapEDzd2vsJh+PnJIYDyQrDj1HCucQMKKMzJYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05A79F80292;
	Tue, 10 Dec 2019 01:49:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9225FF8025F; Tue, 10 Dec 2019 01:49:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20A76F80234
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 01:49:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20A76F80234
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 16:49:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,297,1571727600"; d="scan'208";a="215398960"
Received: from sneuhier-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.188.78])
 by orsmga003.jf.intel.com with ESMTP; 09 Dec 2019 16:49:07 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 18:48:51 -0600
Message-Id: <20191210004854.16845-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210004854.16845-1-pierre-louis.bossart@linux.intel.com>
References: <20191210004854.16845-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 5/8] ASoC: SOF: Intel: add codec_mask module
	parameter
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Add a module parameter 'codec_mask' to filter out unwanted
HDA codecs from driver probe. E.g. on most systems,
codec_mask=4 will limit to HDMI audio and exclude any
external HDA codecs.

Similar to 'probe_mask' module parameter of snd-hda-intel.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index df1909e1d950..871b71a15a63 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -15,11 +15,18 @@
  * Hardware interface for generic Intel audio DSP HDA IP
  */
 
+#include <linux/module.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
 #include "../ops.h"
 #include "hda.h"
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+static int hda_codec_mask = -1;
+module_param_named(codec_mask, hda_codec_mask, int, 0444);
+MODULE_PARM_DESC(codec_mask, "SOF HDA codec mask for probing");
+#endif
+
 /*
  * HDA Operations.
  */
@@ -206,6 +213,12 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 		bus->codec_mask = snd_hdac_chip_readw(bus, STATESTS);
 		dev_dbg(bus->dev, "codec_mask = 0x%lx\n", bus->codec_mask);
 	}
+
+	if (hda_codec_mask != -1) {
+		bus->codec_mask &= hda_codec_mask;
+		dev_dbg(bus->dev, "filtered codec_mask = 0x%lx\n",
+			bus->codec_mask);
+	}
 #endif
 
 	/* clear stream status */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
