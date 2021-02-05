Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D09311062
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 19:52:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6322F1695;
	Fri,  5 Feb 2021 19:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6322F1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612551163;
	bh=MyiE8AeKXgrp+TVg0WmzdAWrVMKcH6ggl1noBfX7KUI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yz/wVLh2rstwhmKFpQx05tDLdPE5fd3KNvb15Zrr1BHOL5YudIWwiENGJThvEb8Tx
	 o7Gdcky2/QFgxpSjLYuuficGFL8YBi0iRUgvvyOykt7aBgiBTNBYadsd5go6kEbauk
	 EjiOipncEqL5PLqYd+JBuZTGPRn6CkkdmthlE4ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 320F4F802D2;
	Fri,  5 Feb 2021 19:50:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A864F802CA; Fri,  5 Feb 2021 19:50:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E555FF80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 19:50:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E555FF80139
IronPort-SDR: yZU3nvl6dihQM4T94OIoF4maD8+FplrzRuEeMNUIhcHq4QpTiEmYoKGU9ZE7mdoZoQ5j1KRCkn
 oFFMYGRroFNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="178914219"
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="178914219"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 10:50:08 -0800
IronPort-SDR: PyTYflEMgSsTeMMiMA6ZFSHC6bwmKzK3HqTl6H6GFnJI3FfMxIhutgIPb1heeVGFI+PcCzQ1CO
 1deiUYsfFHLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="508632710"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 05 Feb 2021 10:50:07 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH v2 3/3] ASoC: SOF: Intel: hda: release display power at
 link_power
Date: Fri,  5 Feb 2021 20:46:30 +0200
Message-Id: <20210205184630.1938761-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205184630.1938761-1-kai.vehmanen@linux.intel.com>
References: <20210205184630.1938761-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

The i915 display power is requested both by controller (for init
and link reset) as well as by codec driver (for codec control).

There's an additional constraint that on some platforms frequent changes
to display power state may cause visible flicker. To avoid this, the SOF
hda controller requests display power whenever it is active and only
releases it when runtime suspended.

This patch utilizes the new hdac_bus link_power op to plug
into HDA link state changes. By monitoring link state changes,
we can keep the controller side display power wakeref until
the codec driver has completed its work, and only release
the wakeref when codec driver is suspended.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-bus.c | 25 ++++++++++++++++++++++++-
 sound/soc/sof/intel/hda.h     |  3 ++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
index 1ac6e79d7e62..30025d3c16b6 100644
--- a/sound/soc/sof/intel/hda-bus.c
+++ b/sound/soc/sof/intel/hda-bus.c
@@ -9,6 +9,7 @@
 
 #include <linux/io.h>
 #include <sound/hdaudio.h>
+#include <sound/hda_i915.h>
 #include "../sof-priv.h"
 #include "hda.h"
 
@@ -20,10 +21,32 @@
 #endif
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+static void sof_hda_bus_link_power(struct hdac_device *codec, bool enable)
+{
+	struct hdac_bus *bus = codec->bus;
+	bool oldstate = test_bit(codec->addr, &bus->codec_powered);
+
+	snd_hdac_ext_bus_link_power(codec, enable);
+
+	if (enable == oldstate)
+		return;
+
+	/*
+	 * Both codec driver and controller can hold references to
+	 * display power. To avoid unnecessary power-up/down cycles,
+	 * controller doesn't immediately release its reference.
+	 *
+	 * If the codec driver powers down the link, release
+	 * the controller reference as well.
+	 */
+	if (codec->addr == HDA_IDISP_ADDR && !enable)
+		snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, false);
+}
+
 static const struct hdac_bus_ops bus_core_ops = {
 	.command = snd_hdac_bus_send_cmd,
 	.get_response = snd_hdac_bus_get_response,
-	.link_power = snd_hdac_ext_bus_link_power,
+	.link_power = sof_hda_bus_link_power,
 };
 #endif
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index a3b6f3e9121c..1d9b38e6ed40 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -388,7 +388,8 @@
 #define SSP_SET_SFRM_SLAVE	BIT(24)
 #define SSP_SET_SLAVE		(SSP_SET_SCLK_SLAVE | SSP_SET_SFRM_SLAVE)
 
-#define HDA_IDISP_CODEC(x) ((x) & BIT(2))
+#define HDA_IDISP_ADDR		2
+#define HDA_IDISP_CODEC(x) ((x) & BIT(HDA_IDISP_ADDR))
 
 struct sof_intel_dsp_bdl {
 	__le32 addr_l;
-- 
2.29.2

