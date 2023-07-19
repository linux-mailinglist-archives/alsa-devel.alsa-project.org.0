Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B60175C0C9
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:06:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 844EE83B;
	Fri, 21 Jul 2023 10:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 844EE83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689926807;
	bh=PrPpN8OiP+t/uEsEZG4BHRzkrLEBiw85I44Bz2ysyY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bS5fF0PZ8a2iEVls8dIiZ05/v29MGUencJVT2KARXdacVyNsKpR9oy4sN62hy3/db
	 JW5HBSMmP/VcOLSGl4ZLTeCoPBt5T/vlS6Imu4lAoCATY0oeVyJsBcQQcxEG0It8Ig
	 laVvusZ55r5ikEi2kkvr9lTYrYM5Dlt0kvd4bZBo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F93DF80553; Fri, 21 Jul 2023 10:05:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85CF9F8047D;
	Fri, 21 Jul 2023 10:05:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD32AF8053B; Wed, 19 Jul 2023 18:41:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEA0EF8047D;
	Wed, 19 Jul 2023 18:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEA0EF8047D
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2 2/9] ALSA: hda/i915: Allow override of gpu binding.
Date: Wed, 19 Jul 2023 18:41:34 +0200
Message-Id: <20230719164141.228073-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GOW45XQN4S3TSTW7OOBS7M2JH3H4M7EP
X-Message-ID-Hash: GOW45XQN4S3TSTW7OOBS7M2JH3H4M7EP
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:05:47 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GOW45XQN4S3TSTW7OOBS7M2JH3H4M7EP/>
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
---
 sound/hda/hdac_i915.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 161a9711cd63e..c32709fa4115f 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -11,6 +11,13 @@
 #include <sound/hda_i915.h>
 #include <sound/hda_register.h>
 
+#include <video/nomodeset.h>
+
+static int gpu_bind = -1;
+module_param(gpu_bind, int, 0644);
+MODULE_PARM_DESC(gpu_bind, "Whether to bind sound component to GPU "
+			   "(1=always, 0=never, -1=on nomodeset(default))");
+
 #define IS_HSW_CONTROLLER(pci) (((pci)->device == 0x0a0c) || \
 				((pci)->device == 0x0c0c) || \
 				((pci)->device == 0x0d0c) || \
@@ -121,6 +128,9 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
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

