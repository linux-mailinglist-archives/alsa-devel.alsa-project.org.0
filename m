Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8A7B3E50
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 18:01:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0858B1672;
	Mon, 16 Sep 2019 18:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0858B1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568649661;
	bh=5UzGyvT1ydD6jrRvwUBmXc4X/TuyohGFvb1iX9gD0So=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jOeurLrGQroTM5NpGJOZFnwRvZRyd441BzSRattuFdVP+Yk+GEvPt+p4R6cMA6eZJ
	 1tusAgjbT8wihuc1LS5F8VqCoYk6xejFA+zSGD5owafbWoa/k3av/sUqgtchQyf24x
	 AcDqfj2R22U7ayK+4nK5L+PHZ+SCicv+BrGz0zVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F5F9F80506;
	Mon, 16 Sep 2019 17:59:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3246EF80506; Mon, 16 Sep 2019 17:59:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FF61F80148
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 17:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FF61F80148
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 08:59:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,513,1559545200"; d="scan'208";a="386243666"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 16 Sep 2019 08:59:07 -0700
Received: from pbossart-mac01.local (unknown [10.251.11.91])
 by linux.intel.com (Postfix) with ESMTP id E04A8580882;
 Mon, 16 Sep 2019 08:59:06 -0700 (PDT)
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 tiwai@suse.de
References: <20190912142200.8031-1-kai.vehmanen@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5579b62d-d949-ec62-0a85-45d0842af38f@linux.intel.com>
Date: Mon, 16 Sep 2019 10:59:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912142200.8031-1-kai.vehmanen@linux.intel.com>
Content-Language: en-US
Cc: Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v4 0/9] adapt SOF to use snd-hda-codec-hdmi
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 9/12/19 9:21 AM, Kai Vehmanen wrote:
> Hi all,
> 
> here's the 4th round for this series that adapts SOF to use
> snd-hda-codec-hdmi (patch_hdmi.c) codec driver instead of hdac_hdmi
> (soc/codecs/hdac_hdmi.c). The primary goal is to unify the HDMI codec
> implementation between DSP and non-DSP HDA configurations, offer same
> interface to user-space and reduce maintenance load for all.

The series looks good to me so

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

I would recommend that we have a matching change for the Skylake driver 
and validation that both SOF and cAVS/SST drivers can operate with this 
mode set. Our goal is still to have coexistence between the two drivers 
in a single build/distro, e.g. cAVS for SKL/KBL/APL and SOF for newer 
platforms. This can be done in a follow-up patch but it needs to be done 
before distros start selecting this common HDMI mode.

The other concern I have is that we have other changes coming for 
soc-acpi and machine drivers to deal with SoundWire, so it'd be nice to 
have the changes mirrored between Mark and Takashi trees e.g. with the 
merge of a fixed branch.

> 
> v4 changes:
> - Change order of patches to not break bisect (Pierre's feedback).
> - Improve the explanation in commit message for
>    mst_no_extra_pcms, patch 1. (Pierre's feedback).
> - Fix errors in PCM constraints for HDMI (Pierre's feedback).
> - Fix an issue on Ice Lake platforms (patch 3).
> 
> Feature and testing info:
>   - Tested on multiple Intel platforms supported by SOF.
>   - Tested with ALSA console tools as well as with Pulseaudio.
>        - requires Pulseaudio 12.x or newer, see
>          https://lists.freedesktop.org/archives/pulseaudio-discuss/2019-August/031358.html
>   - HDMI, DP, DP-MST with multi-monitor use-scenarios work ok.
>   - New feature for SOF: ELD /proc fs works just like in
>     DSP-less mode.
>   - New feature for SOF: jack detection works out-of-the-box
>     with Pulseaudio (no need for card specific UCM for HDMI)
> 
> Kai Vehmanen (9):
>    ALSA: hda/hdmi - implement mst_no_extra_pcms flag
>    ASoC: hdac_hda: add support for HDMI/DP as a HDA codec
>    ASoC: Intel: skl-hda-dsp-generic: use snd-hda-codec-hdmi
>    ASoC: Intel: skl-hda-dsp-generic: fix include guard name
>    ASoC: SOF: Intel: add support for snd-hda-codec-hdmi
>    ASoC: Intel: bxt-da7219-max98357a: common hdmi codec support
>    ASoC: Intel: glk_rt5682_max98357a: common hdmi codec support
>    ASoC: intel: sof_rt5682: common hdmi codec support
>    ASoC: Intel: bxt_rt298: common hdmi codec support
> 
>   include/sound/hda_codec.h                     |   1 +
>   include/sound/soc-acpi.h                      |   2 +
>   sound/pci/hda/patch_hdmi.c                    |  19 +++-
>   sound/soc/codecs/hdac_hda.c                   | 100 +++++++++++++++---
>   sound/soc/codecs/hdac_hda.h                   |  12 ++-
>   sound/soc/intel/boards/bxt_da7219_max98357a.c |  11 ++
>   sound/soc/intel/boards/bxt_rt298.c            |  11 ++
>   sound/soc/intel/boards/glk_rt5682_max98357a.c |  11 ++
>   sound/soc/intel/boards/hda_dsp_common.h       |  93 ++++++++++++++++
>   sound/soc/intel/boards/skl_hda_dsp_common.c   |  10 +-
>   sound/soc/intel/boards/skl_hda_dsp_common.h   |  27 ++++-
>   sound/soc/intel/boards/skl_hda_dsp_generic.c  |   1 +
>   sound/soc/intel/boards/sof_rt5682.c           |  11 ++
>   sound/soc/sof/intel/Kconfig                   |  10 ++
>   sound/soc/sof/intel/hda-codec.c               |  19 +++-
>   sound/soc/sof/intel/hda.c                     |   6 ++
>   sound/soc/sof/intel/hda.h                     |   6 +-
>   17 files changed, 323 insertions(+), 27 deletions(-)
>   create mode 100644 sound/soc/intel/boards/hda_dsp_common.h
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
