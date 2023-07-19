Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E775C0C7
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:06:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 191331EF;
	Fri, 21 Jul 2023 10:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 191331EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689926802;
	bh=z6h69GluYK7rZ3f48ZDX8mdHy0EcK56C2B/mGh/yiak=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U8pO1jx3q6WINTn8nF1xUussjTtkenE+/asw6oFJvU6ZpRqoUkTaCJbKDlaXqXEZG
	 AGqmSkWJsiwbXNwdp3P1YZq9keuhvlZm5VVIqLC3UlEFWVP8FUZcfMgxG70N+mZ0hB
	 JB9WdbZhAXOywsPabW6Az1l/DZQjK49AJgPWreAc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFEFCF80527; Fri, 21 Jul 2023 10:05:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0DC1F8007E;
	Fri, 21 Jul 2023 10:05:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0A79F80535; Wed, 19 Jul 2023 18:41:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 339C2F8007E;
	Wed, 19 Jul 2023 18:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 339C2F8007E
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
Subject: [PATCH v2 0/9] sound: Use -EPROBE_DEFER instead of i915 module
 loading.
Date: Wed, 19 Jul 2023 18:41:32 +0200
Message-Id: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UPHQSMZUUHCDJY4N657OHNRTR7TLCW7Y
X-Message-ID-Hash: UPHQSMZUUHCDJY4N657OHNRTR7TLCW7Y
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:05:47 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPHQSMZUUHCDJY4N657OHNRTR7TLCW7Y/>
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

---
New since first version:

- snd_hda_core.gpu_bind is added as a mechanism to force gpu binding,
  for testing. snd_hda_core.gpu_bind=0 forces waiting for GPU bind to
  off, snd_hda_core.gpu_bind=1 forces waiting for gpu bind. Default
  setting depends on whether kernel booted with nomodeset.
- Incorporated all feedback review.

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

Maarten Lankhorst (9):
  ALSA: hda/intel: Fix error handling in azx_probe()
  ALSA: hda/i915: Allow override of gpu binding.
  ALSA: hda/i915: Add an allow_modprobe argument to snd_hdac_i915_init
  ALSA: hda/i915: Allow xe as match for i915_component_master_match
  ASoC: Intel: avs: Move snd_hdac_i915_init to before probe_work.
  ASoC: Intel: Skylake: Move snd_hdac_i915_init to before probe_work.
  ALSA: hda/intel: Move snd_hdac_i915_init to before probe_work.
  ASoC: SOF: Intel: Remove deferred probe for SOF
  ALSA: hda/i915: Remove extra argument from snd_hdac_i915_init

 sound/hda/hdac_i915.c         | 25 ++++++++-------
 sound/pci/hda/hda_intel.c     | 60 ++++++++++++++++++-----------------
 sound/soc/intel/avs/core.c    | 13 +++++---
 sound/soc/intel/skylake/skl.c | 31 ++++++------------
 sound/soc/sof/Kconfig         | 19 -----------
 sound/soc/sof/core.c          | 38 ++--------------------
 sound/soc/sof/intel/Kconfig   |  1 -
 sound/soc/sof/intel/hda.c     | 32 +++++++++++--------
 sound/soc/sof/sof-pci-dev.c   |  3 +-
 sound/soc/sof/sof-priv.h      |  5 ---
 10 files changed, 85 insertions(+), 142 deletions(-)

-- 
2.39.2

