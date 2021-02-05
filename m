Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EF0311061
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 19:52:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C892168C;
	Fri,  5 Feb 2021 19:51:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C892168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612551153;
	bh=fCPEcINiGiC/Snp1RqGxxFOxQNAY78sFdgD+9NfKR1A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KOhwivM6R1AEyeIzcQAce7J73/4RL3xOM2E6NS2VViV8O+htYLWfPIWFU8Lpve5YJ
	 yQ/5HPEm5Nr0Rt6al7S6zs3I7/hsPFu+LR1LENLrP3G7IAtE9mUwU8QVTCHbMii7Lh
	 UBxUhUK6YEVX9ROOIls+bEFCF8vrjCapqvLaG5CE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64123F802C8;
	Fri,  5 Feb 2021 19:50:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2BAAF80264; Fri,  5 Feb 2021 19:50:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7DF5F800C0
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 19:50:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7DF5F800C0
IronPort-SDR: CH3P79WG1W4K8T29ubUyZnmnXCOll938nUX/uq3P86dxjQlSlI7FmKbO5KQVMloTwEuTG8+q56
 DWm9P/loKqsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="178914216"
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="178914216"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 10:50:06 -0800
IronPort-SDR: vElIgUU+wll7Gu0Z7q/Oy3V+Pq02awTrzO83oUcycG6sHTeQyuhRXGALG57ugssYW8NdJ+2oyC
 ypts9UpWWh+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="508632701"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 05 Feb 2021 10:50:04 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH v2 2/3] ASoC: SOF: Intel: hda: use hdac_ext fine-grained link
 management
Date: Fri,  5 Feb 2021 20:46:29 +0200
Message-Id: <20210205184630.1938761-3-kai.vehmanen@linux.intel.com>
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

Opt-in to use snd_hdac_ext_bus_link_power() to manage HDA link
power up/down events.

This allows to reduce power consumption in cases where some HDA codecs
are suspended, but other child devices (HDA or non-HDA codecs) remain
active and controller itself remains in active state.

By using snd_hdac_ext_bus_link_power(), the individual HDA links can be
powered off and if all HDA codecs are powered down, the command DMA can
also be shut down.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-bus.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
index 789148e5584b..1ac6e79d7e62 100644
--- a/sound/soc/sof/intel/hda-bus.c
+++ b/sound/soc/sof/intel/hda-bus.c
@@ -19,13 +19,21 @@
 #define sof_hda_ext_ops	NULL
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+static const struct hdac_bus_ops bus_core_ops = {
+	.command = snd_hdac_bus_send_cmd,
+	.get_response = snd_hdac_bus_get_response,
+	.link_power = snd_hdac_ext_bus_link_power,
+};
+#endif
+
 /*
  * This can be used for both with/without hda link support.
  */
 void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev)
 {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	snd_hdac_ext_bus_init(bus, dev, NULL, sof_hda_ext_ops);
+	snd_hdac_ext_bus_init(bus, dev, &bus_core_ops, sof_hda_ext_ops);
 #else /* CONFIG_SND_SOC_SOF_HDA */
 	memset(bus, 0, sizeof(*bus));
 	bus->dev = dev;
-- 
2.29.2

