Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AD34462A4
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 12:25:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB2951684;
	Fri,  5 Nov 2021 12:25:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB2951684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636111553;
	bh=mWhOrMi8w0CNcuTWCuFbGk8VVI7icxsmZgtHydhdcTk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RnKBEr7y7XkiGelnsn9AuTtDE48VHoapWmMt+sf1mhVr+u/JoFThOE2fcsBGA8dpa
	 aXxWR2tsvoj8RRqqZvYjCJyKXUpWn3FzJXgjRu/yC8PjA0Txp/Hkn2LrXwPGeWdeLy
	 vmsXYtDEzxkY1ZiOGxCytFFfr0jAot3YUNE6zw+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C743F8012A;
	Fri,  5 Nov 2021 12:24:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88498F8026A; Fri,  5 Nov 2021 12:24:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3FBCF80224
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 12:24:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3FBCF80224
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="292716638"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="292716638"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 04:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="668214402"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 05 Nov 2021 04:24:22 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: hda: fix hotplug when only codec is
 suspended
Date: Fri,  5 Nov 2021 13:16:55 +0200
Message-Id: <20211105111655.668777-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Hui Wang <hui.wang@canonical.com>, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

If codec is in runtime suspend, but controller is not, hotplug events
are missed as the codec has no way to alert the controller. Problem does
not occur if both controller and codec are active, or when both are
suspended.

An easy way to reproduce is to play an audio stream on one codec (e.g.
to HDMI/DP display codec), wait for other HDA codec to go to runtime
suspend, and then plug in a headset to the suspended codec. The jack
event is not reported correctly in this case. Another way to reproduce
is to force controller to stay active with
"snd_sof_pci.sof_pci_debug=0x1"

Fix the issue by reconfiguring the WAKEEN register when powering up/down
individual links, and handling control events in the interrupt handler.

Fixes: 87fc20e4a0cb ("ASoC: SOF: Intel: hda: use hdac_ext fine-grained link management")
Reported-by: Hui Wang <hui.wang@canonical.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-bus.c | 17 +++++++++++++++++
 sound/soc/sof/intel/hda-dsp.c |  3 +--
 sound/soc/sof/intel/hda.c     | 16 ++++++++++++++++
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
index 30025d3c16b6..0862ff8b6627 100644
--- a/sound/soc/sof/intel/hda-bus.c
+++ b/sound/soc/sof/intel/hda-bus.c
@@ -10,6 +10,8 @@
 #include <linux/io.h>
 #include <sound/hdaudio.h>
 #include <sound/hda_i915.h>
+#include <sound/hda_codec.h>
+#include <sound/hda_register.h>
 #include "../sof-priv.h"
 #include "hda.h"
 
@@ -21,6 +23,18 @@
 #endif
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+static void update_codec_wake_enable(struct hdac_bus *bus, unsigned int addr, bool link_power)
+{
+	unsigned int mask = snd_hdac_chip_readw(bus, WAKEEN);
+
+	if (link_power)
+		mask &= ~BIT(addr);
+	else
+		mask |= BIT(addr);
+
+	snd_hdac_chip_updatew(bus, WAKEEN, STATESTS_INT_MASK, mask);
+}
+
 static void sof_hda_bus_link_power(struct hdac_device *codec, bool enable)
 {
 	struct hdac_bus *bus = codec->bus;
@@ -41,6 +55,9 @@ static void sof_hda_bus_link_power(struct hdac_device *codec, bool enable)
 	 */
 	if (codec->addr == HDA_IDISP_ADDR && !enable)
 		snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, false);
+
+	/* WAKEEN needs to be set for disabled links */
+	update_codec_wake_enable(bus, codec->addr, enable);
 }
 
 static const struct hdac_bus_ops bus_core_ops = {
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 623cf291e207..262a70791a8f 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -623,8 +623,7 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 	hda_dsp_ipc_int_disable(sdev);
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	if (runtime_suspend)
-		hda_codec_jack_wake_enable(sdev, true);
+	hda_codec_jack_wake_enable(sdev, runtime_suspend);
 
 	/* power down all hda link */
 	snd_hdac_ext_bus_link_power_down_all(bus);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index f60e2c57d3d0..ef92cca7ae01 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -696,6 +696,20 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static void hda_check_for_state_change(struct snd_sof_dev *sdev)
+{
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	unsigned int codec_mask;
+
+	codec_mask = snd_hdac_chip_readw(bus, STATESTS);
+	if (codec_mask) {
+		hda_codec_jack_check(sdev);
+		snd_hdac_chip_writew(bus, STATESTS, codec_mask);
+	}
+#endif
+}
+
 static irqreturn_t hda_dsp_interrupt_handler(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
@@ -737,6 +751,8 @@ static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 	if (hda_sdw_check_wakeen_irq(sdev))
 		hda_sdw_process_wakeen(sdev);
 
+	hda_check_for_state_change(sdev);
+
 	/* enable GIE interrupt */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 				SOF_HDA_INTCTL,

base-commit: 5d03907bbf9ccf10e0d2cfb4f4d312b7cc4274f4
-- 
2.33.0

