Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FC178E7F1
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 10:27:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09595827;
	Thu, 31 Aug 2023 10:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09595827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693470433;
	bh=u2Z5LqkjMyoVBdlcTSHSEUmyVqo7HwaJ0MCj50wy3D4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dX02StFzDXnUj55QsBvM1PqMOFWbCKeNCEDrnnI3i+eFQ0hwj3BUqg4OtrVl6DZMJ
	 qEpxIAllHZC8NE9ZO/M7HrEhf6cXyl80p1yP15LCE0qaaQC/G2ZfaV3PqL5HcyLiYD
	 9+zCzRUxLhVnnCyzc+JjiSu61HtHSUhYahF0hpZo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B4B7F805D4; Thu, 31 Aug 2023 10:24:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A60F2F805CB;
	Thu, 31 Aug 2023 10:24:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED45BF8057E; Wed, 30 Aug 2023 17:37:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C471DF80094;
	Wed, 30 Aug 2023 17:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C471DF80094
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: [PATCH v4 04/11] ALSA: hda/i915: Allow override of gpu binding.
Date: Wed, 30 Aug 2023 17:36:45 +0200
Message-Id: <20230830153652.217855-5-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230830153652.217855-1-maarten.lankhorst@linux.intel.com>
References: <20230830153652.217855-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3R3B3X5GTQQD66T7ADXLO2VYEGEIM54R
X-Message-ID-Hash: 3R3B3X5GTQQD66T7ADXLO2VYEGEIM54R
X-Mailman-Approved-At: Thu, 31 Aug 2023 08:22:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3R3B3X5GTQQD66T7ADXLO2VYEGEIM54R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Selecting CONFIG_DRM selects CONFIG_VIDEO_NOMODESET, which exports
video_firmware_drivers_only(). This can be used as a first
approximation on whether i915 will be available. It's safe to use as
this is only built when CONFIG_SND_HDA_I915 is selected by CONFIG_I915.

It's not completely fool proof, as you can boot with "nomodeset
i915.modeset=1" to make i915 load regardless, or use
"i915.force_probe=!*" to never load i915, but the common case of
booting with nomodeset to disable all GPU drivers this will work as
intended.

Because of this, we add an extra module parameter,
snd_hda_core.gpu_bind that can be used to signal users intent.
-1 follows nomodeset, 0 disables binding, 1 forces wait/-EPROBE_DEFER
on binding.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/hdac_i915.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index b428537f284c7..a4a712c795c3d 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -10,6 +10,12 @@
 #include <sound/hdaudio.h>
 #include <sound/hda_i915.h>
 #include <sound/hda_register.h>
+#include <video/nomodeset.h>
+
+static int gpu_bind = -1;
+module_param(gpu_bind, int, 0644);
+MODULE_PARM_DESC(gpu_bind, "Whether to bind sound component to GPU "
+			   "(1=always, 0=never, -1=on nomodeset(default))");
 
 /**
  * snd_hdac_i915_set_bclk - Reprogram BCLK for HSW/BDW
@@ -122,6 +128,9 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
 {
 	struct pci_dev *display_dev = NULL;
 
+	if (!gpu_bind || (gpu_bind < 0 && video_firmware_drivers_only()))
+		return false;
+
 	for_each_pci_dev(display_dev) {
 		if (display_dev->vendor == PCI_VENDOR_ID_INTEL &&
 		    (display_dev->class >> 16) == PCI_BASE_CLASS_DISPLAY &&
-- 
2.39.2

