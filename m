Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1C6A1E29
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:00:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 480B716AC;
	Thu, 29 Aug 2019 16:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 480B716AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567090816;
	bh=KIHlhzlDS3r2VfVnZjkmcVV4hBhHvXfCUORKmtpuMJY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lt3XWwas2ZLqgJp6jdB57oMLlru6uNd1LL9xkNWXu/upFhV5Q1MAkd5U3SS4EEqRP
	 h7sDA9R+A+ou00byIbKw3DRgBzAZguZWSYoDfO2tGeDccLgAgH0+qJyRntL8axekfc
	 R05eIBvrB8dxkX4Ms6JRc+VJa6FL20YnXwYipDsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A2DFF89883;
	Thu, 29 Aug 2019 15:54:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B372F89881; Thu, 29 Aug 2019 15:54:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26342F8987F
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 15:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26342F8987F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 06:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,443,1559545200"; d="scan'208";a="182349271"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga007.fm.intel.com with ESMTP; 29 Aug 2019 06:53:59 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Thu, 29 Aug 2019 16:53:41 +0300
Message-Id: <20190829135348.23569-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [RFC PATCH 0/7] adapt SOF to use snd-hda-codec-hdmi
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
here's a RFC patch series that adapts SOF (and one example machine
driver) to use snd-hda-codec-hdmi (patch_hdmi.c) codec driver
instead of hdac_hdmi (soc/codecs/hdac_hdmi.c). The primary goal
is unify the HDMI codec implementation between DSP and non-DSP HDA
configurations, offer same interface to user-space and reduce
maintenance load for all.

Main points I'd like your input on:

1) Is the high-level approach ok?
 - SOF already uses pci/hda/ for all others codecs, so HDMI
   has been the sole exception where code has been duplicated.
 - I've tried to keep changes to hda/hdmi minimal.
 - This series implements logic to parse the PCM topology
   in a dynamic fashion, so we do not have to change all
   existing (and future) DSP topologis to use fixed PCM device
   numbers for HDMI, and we avoid need to hardcode PCM
   device numbers in machine driver code.

2) Can we drop hdac_hdmi and its support from machine drivers, or
   do we need to make it optional and keep it around?

 - Current series does not add any Kconfig options, but
   simply switches SOF to use HDA codecs for all, including
   HDMI/DP. This means hdac_hdmi is never used with SOF
   and could be dropped (if SST is ok as well).
 - This may break some usage with SST (input is welcome!)
 - The change is visible to applications. The ALSA mixer
   interface is different (OTOH with the new driver, playback
   works out-of-the-box while with hdac_hdmi you needed to
   set the multiple controls first, to have any audio out).
 - Alternatively I could add a KConfig option and we could
   have a deprecation period for hdac_hdmi, allowing people
   to compile with the old driver during transition time.
   This will require #ifdef'ing in all the machine drivers.

.. once these are addressed, I can proceed to extend the patchset
with all affected machine drivers.

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
 - Pre-reviewed at:
   https://github.com/thesofproject/linux/pull/1155

Kai Vehmanen (7):
  ALSA: hda - add mst_no_extra_pcms flag to hda_codec
  ASoC: Intel: skl-hda-dsp-generic: use snd-hda-codec-hdmi
  ASoC: hdac_hda: add support for HDMI/DP as a HDA codec
  ALSA: hda/hdmi - allow control creation without a linked pcm
  ALSA: hda/hdmi - implement mst_no_extra_pcms flag
  ALSA: hda/hdmi - complete pcm_setup_pin without snd_pcm link
  ASoC: SOF: Intel: load hda codec module also for HDMI/DP

 include/sound/hda_codec.h                    |  1 +
 sound/pci/hda/patch_hdmi.c                   | 31 ++++---
 sound/soc/codecs/hdac_hda.c                  | 95 +++++++++++++++++---
 sound/soc/codecs/hdac_hda.h                  | 10 ++-
 sound/soc/intel/boards/skl_hda_dsp_common.c  | 27 ++----
 sound/soc/intel/boards/skl_hda_dsp_common.h  | 61 +++++++++++++
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  7 --
 sound/soc/sof/intel/hda-codec.c              | 11 +--
 sound/soc/sof/intel/hda.h                    |  5 +-
 9 files changed, 189 insertions(+), 59 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
