Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C8FD3E78
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 13:29:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BE7C1615;
	Fri, 11 Oct 2019 13:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BE7C1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570793386;
	bh=C/sovhuL3fde9fhwccAzPWMEDhxyVQxt941OwZmweAA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e6XltrAz/xbVwXK6qEI/1oZctX5lgn3iOiK3Kh/crs37uFdZ5ldEiGW5Tx/G19n5C
	 bs9pdRj+l+HqTNwXHBELyqMXDwFh8l6lo/i9HwTIoZAPSAlV8IQLurILFsnw0SuipD
	 B6Mtjqev2o6ArLXn/CqqppZtnBME/CxEknoshW4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04F4BF80308;
	Fri, 11 Oct 2019 13:28:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3C80F802BE; Fri, 11 Oct 2019 13:27:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB3FCF8026F
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 13:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB3FCF8026F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 04:27:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,283,1566889200"; d="scan'208";a="394382725"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga005.fm.intel.com with ESMTP; 11 Oct 2019 04:27:51 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Fri, 11 Oct 2019 14:27:36 +0300
Message-Id: <20191011112745.25800-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH v6 0/9] adapt SOF to use snd-hda-codec-hdmi
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

Hey,
here's the 6th round for this series that adapts SOF to use
snd-hda-codec-hdmi (patch_hdmi.c) codec driver instead of hdac_hdmi
(soc/codecs/hdac_hdmi.c). The primary goal is to unify the HDMI codec
implementation between DSP and non-DSP HDA configurations, offer same
interface to user-space and reduce maintenance load for all.

v6 changes:
- Since v5, changes in patches 002, 003 and 005.
- Fixed a bug with S3 suspend/resume during HDMI playback on Intel ICL
  platforms. As part of the bug fix, cleaned up the new display power
  control code added in v5.

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

Kai Vehmanen (9):
  ALSA: hda/hdmi - implement mst_no_extra_pcms flag
  ASoC: hdac_hda: add support for HDMI/DP as a HDA codec
  ASoC: Intel: skl-hda-dsp-generic: use snd-hda-codec-hdmi
  ASoC: Intel: skl-hda-dsp-generic: fix include guard name
  ASoC: SOF: Intel: add support for snd-hda-codec-hdmi
  ASoC: Intel: bxt-da7219-max98357a: common hdmi codec support
  ASoC: Intel: glk_rt5682_max98357a: common hdmi codec support
  ASoC: intel: sof_rt5682: common hdmi codec support
  ASoC: Intel: bxt_rt298: common hdmi codec support

 include/sound/hda_codec.h                     |   1 +
 include/sound/soc-acpi.h                      |   2 +
 sound/pci/hda/patch_hdmi.c                    |  19 ++-
 sound/soc/codecs/hdac_hda.c                   | 114 ++++++++++++++++--
 sound/soc/codecs/hdac_hda.h                   |  13 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c |  11 ++
 sound/soc/intel/boards/bxt_rt298.c            |  11 ++
 sound/soc/intel/boards/glk_rt5682_max98357a.c |  11 ++
 sound/soc/intel/boards/hda_dsp_common.h       |  97 +++++++++++++++
 sound/soc/intel/boards/skl_hda_dsp_common.c   |  10 +-
 sound/soc/intel/boards/skl_hda_dsp_common.h   |  27 ++++-
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |   1 +
 sound/soc/intel/boards/sof_rt5682.c           |  11 ++
 sound/soc/sof/intel/Kconfig                   |  10 ++
 sound/soc/sof/intel/hda-codec.c               |  22 +++-
 sound/soc/sof/intel/hda.c                     |   6 +
 sound/soc/sof/intel/hda.h                     |   6 +-
 17 files changed, 345 insertions(+), 27 deletions(-)
 create mode 100644 sound/soc/intel/boards/hda_dsp_common.h

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
