Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB2D757916
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 12:15:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50A62DF0;
	Tue, 18 Jul 2023 12:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50A62DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689675341;
	bh=vHkAjAYMiQTesDM1kZJepvkM9ZgBQZAHowlYpE1cHYg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ICgXCnIB6ihhy91x/FyLMvL2ooAHJvRLUhAosN8sj3/o6x9pYElgwRN3Jg/MWzvss
	 SK73PYFyDbsNTOgZosuIHArpFf+Pdh9IPPSectLuWxmiL5flkTdQm6OwcH2PzeMKXX
	 TerFHur9CcBWGJ4LtmNCH/fFqmP3yDmP4HB1Qfjc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46844F80557; Tue, 18 Jul 2023 12:14:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AD2EF80527;
	Tue, 18 Jul 2023 12:14:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2648F80520; Tue, 18 Jul 2023 10:46:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BB83DF8007E;
	Tue, 18 Jul 2023 10:45:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB83DF8007E
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
Subject: [PATCH 0/7] sound: Use -EPROBE_DEFER instead of i915 module loading.
Date: Tue, 18 Jul 2023 10:45:15 +0200
Message-Id: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KZTT7ZFEPEBRGESQNIVTZDVCLRTQVSPN
X-Message-ID-Hash: KZTT7ZFEPEBRGESQNIVTZDVCLRTQVSPN
X-Mailman-Approved-At: Tue, 18 Jul 2023 10:13:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZTT7ZFEPEBRGESQNIVTZDVCLRTQVSPN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Explicitly loading i915 becomes a problem when upstreaming the new intel driver
for Tiger Lake and higher graphics (xe). By loading i915, it doesn't wait for
driver load of xe, and will fail completely before it loads.

-EPROBE_DEFER has to be returned before any device is created in probe(),
otherwise the removal of the device will cause EPROBE_DEFER to try again
in an infinite loop.

The conversion is done in gradual steps. First I add an argument to
snd_hdac_i915_init to allow for -EPROBE_DEFER so I can convert each driver
separately. Then I convert each driver to move snd_hdac_i915_init out of the
workqueue. Finally I drop the ability to choose modprobe behavior after the
last user is converted.

I suspect the avs and skylake drivers used snd_hdac_i915_init purely for the
modprobe, but I don't have the hardware to test if it can be safely removed.
It can still be done easily in a followup patch to simplify probing.

Maarten Lankhorst (7):
  ALSA: hda/i915: Add an allow_modprobe argument to snd_hdac_i915_init
  ALSA: hda/i915: Allow xe as match for i915_component_master_match
  ASoC: Intel: avs: Move snd_hdac_i915_init to before probe_work.
  ASoC: Intel: Skylake: Move snd_hdac_i915_init to before probe_work.
  ALSA: hda/intel: Move snd_hdac_i915_init to before probe_work.
  ASoC: SOF: Intel: Remove deferred probe for SOF
  ALSA: hda/i915: Remove extra argument from snd_hdac_i915_init

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Cc: sound-open-firmware@alsa-project.org

 sound/hda/hdac_i915.c         | 15 +++------
 sound/pci/hda/hda_intel.c     | 58 +++++++++++++++++++----------------
 sound/soc/intel/avs/core.c    | 13 +++++---
 sound/soc/intel/skylake/skl.c | 31 ++++++-------------
 sound/soc/sof/Kconfig         | 19 ------------
 sound/soc/sof/core.c          | 38 ++---------------------
 sound/soc/sof/intel/Kconfig   |  1 -
 sound/soc/sof/intel/hda.c     | 32 +++++++++++--------
 sound/soc/sof/sof-pci-dev.c   |  3 +-
 sound/soc/sof/sof-priv.h      |  5 ---
 10 files changed, 75 insertions(+), 140 deletions(-)

-- 
2.39.2

