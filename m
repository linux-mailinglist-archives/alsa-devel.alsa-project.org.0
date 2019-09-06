Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F775ABAE5
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 16:31:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0736615F8;
	Fri,  6 Sep 2019 16:30:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0736615F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567780280;
	bh=CPUb4nKKc/G67i4eEuCtrSyvORmGUyjKoVEJ7REtKa8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YOfLr13VrSX5gk1sVAQg1yJ8Ee6GwBiLRygPHo5XB4c4uZrXqrTx9sbQw+GnYIfvt
	 B1vaUrQeUmFlBlR4nmyb8ytctTLz7wakY+9bHr40Ivl/rJ4zOkWqNriZ7YUYfNv5h4
	 y3z/L8ZZsPSTIAJ8+h7lsBiVfwxGc1uSM+pXT0gI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0877F80447;
	Fri,  6 Sep 2019 16:29:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C92AF803A6; Fri,  6 Sep 2019 16:29:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C30D0F80214
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 16:29:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C30D0F80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 07:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,473,1559545200"; d="scan'208";a="384228392"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2019 07:29:17 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Fri,  6 Sep 2019 17:29:03 +0300
Message-Id: <20190906142909.770-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [RFC PATCH v2 0/6] adapt SOF to use snd-hda-codec-hdmi
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,
here's a second RFC round for this series that adapts SOF (and one
example machine driver) to use snd-hda-codec-hdmi (patch_hdmi.c) codec
driver instead of hdac_hdmi (soc/codecs/hdac_hdmi.c). The primary goal
is to unify the HDMI codec implementation between DSP and non-DSP HDA
configurations, offer same interface to user-space and reduce
maintenance load for all.

If the approach looks ok, I'll remove RFC from v3 and update
the remaining machine drivers (this v2 still changes only one machine
driver and thus the RFC tag).

v2 changes:
- Codec selection via module parameter. Concerns were raised that a Kconfig
  option will not be sufficient as the patch changes user-space mixer
  controls. Distro kernels will want to use same kernel config for all
  platforms and a kconfig control would apply to all drivers.

  To address this, a combination of a module parameter, and a default
  value set via kconfig, was added to the patchset. This allows distros
  to support different combinations with a single kernel build. To switch
  codecs for a specific machine, UCM file update can be deployed together
  with a change to modprobe parameter. This is somewhat complicated, so
  further feedback is very welcome whether this is enough.

- In machine drivers that are shared with SST and SOF, added
  runtime detection for which codec is used. For SST, the old hdac-hdmi
  is always used.

- One patch dropped from series. This patch is no longer needed (pcm
  handles now passed to codec driver).

Feature and testing info:

 - Tested on multiple Intel platforms supported by SOF.
 - Tested with ALSA console tools as well as with Pulseaudio.
      - requires Pulseaudio 12.x or newer, see
        https://lists.freedesktop.org/archives/pulseaudio-discuss/2019-August/031358.html
 - HDMI, DP, DP-MST with multi-monitor use-scenarios work ok.
 - New feature for SOF: ELD /proc fs works just like in
   DSP-less mode.
 - New feature for SOF: jack detection works out-of-the-box
   with Pulseaudio (no need for card specific UCM for HDMI)
 - Pre-reviews at:
   https://github.com/thesofproject/linux/pull/1155

Kai Vehmanen (6):
  ALSA: hda - add mst_no_extra_pcms flag to hda_codec
  ASoC: Intel: skl-hda-dsp-generic: use snd-hda-codec-hdmi
  ASoC: hdac_hda: add support for HDMI/DP as a HDA codec
  ALSA: hda/hdmi - implement mst_no_extra_pcms flag
  ALSA: hda/hdmi - allow control creation without a linked pcm
  ASoC: SOF: Intel: add support for snd-hda-codec-hdmi

 include/sound/hda_codec.h                    |  1 +
 sound/pci/hda/patch_hdmi.c                   | 23 +++--
 sound/soc/codecs/hdac_hda.c                  | 95 +++++++++++++++++---
 sound/soc/codecs/hdac_hda.h                  | 12 ++-
 sound/soc/intel/boards/skl_hda_dsp_common.c  | 28 +++++-
 sound/soc/intel/boards/skl_hda_dsp_common.h  | 69 ++++++++++++++
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  7 --
 sound/soc/sof/intel/Kconfig                  | 10 +++
 sound/soc/sof/intel/hda-codec.c              | 14 ++-
 sound/soc/sof/intel/hda.h                    |  6 +-
 10 files changed, 231 insertions(+), 34 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
