Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA9CE8ACC
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 15:32:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F56A2259;
	Tue, 29 Oct 2019 15:31:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F56A2259
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572359531;
	bh=fjzldddvRvWQixi5i3hVzoRmcIyPTIkpth3F8DOwdYA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H+eICe7cykI3kXr0uzvlbvC69OoFvKT68h0hRYDw9SM5nSQZac9fLhFNLC8c20hmE
	 rgRMZZipkNueIj9YVvgY5saY0UR7I/cvBT0oTO9qCab7qIRzvzddLXBpYyI4QU+ZJt
	 qNYoqDRCtW/xiSt5wpuGb+kzDJ8RkFCA3NWVdqBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F3B6F803D7;
	Tue, 29 Oct 2019 15:20:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14156F80392; Tue, 29 Oct 2019 15:20:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE4AFF8015A
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 15:20:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE4AFF8015A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 07:20:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,244,1569308400"; d="scan'208";a="193618670"
Received: from vtungala-mobl3.amr.corp.intel.com (HELO [10.254.109.225])
 ([10.254.109.225])
 by orsmga008.jf.intel.com with ESMTP; 29 Oct 2019 07:20:37 -0700
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20191029134017.18901-1-kai.vehmanen@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <850db27b-34a3-09d5-bd88-3db08ea28baf@linux.intel.com>
Date: Tue, 29 Oct 2019 09:20:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191029134017.18901-1-kai.vehmanen@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, libin.yang@intel.com, julia.lawall@lip6.fr
Subject: Re: [alsa-devel] [PATCH v8 0/9] adapt SOF to use snd-hda-codec-hdmi
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



On 10/29/19 8:40 AM, Kai Vehmanen wrote:
> Hey,
> here's the 8th round for this series that adapts SOF to use
> snd-hda-codec-hdmi (patch_hdmi.c) codec driver instead of hdac_hdmi
> (soc/codecs/hdac_hdmi.c). The primary goal is to unify the HDMI codec
> implementation between DSP and non-DSP HDA configurations, offer same
> interface to user-space and reduce maintenance load for all.
> 
> Intended to go in via Mark's ASoC tree.

For the series

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Kai for this major plumbing rework.

> 
> v8 changes:
> - rebased on top of Mark's for-next (50484b6a523a)
> - addressed Takashi's review comment to patch 5
> - addressed two sparse warnings in patch 3 reported by
>    kbuild test robot <lkp@intel.com>
> - fixed itnull.cocci warning in patch 3 reported by
>    Julia Lawall <julia.lawall@lip6.fr> and
>    kbuild test robot <lkp@intel.com>
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
>   sound/pci/hda/patch_hdmi.c                    |  19 ++-
>   sound/soc/codecs/hdac_hda.c                   | 114 ++++++++++++++++--
>   sound/soc/codecs/hdac_hda.h                   |  13 +-
>   sound/soc/intel/boards/Makefile               |  10 +-
>   sound/soc/intel/boards/bxt_da7219_max98357a.c |  11 ++
>   sound/soc/intel/boards/bxt_rt298.c            |  11 ++
>   sound/soc/intel/boards/glk_rt5682_max98357a.c |  11 ++
>   sound/soc/intel/boards/hda_dsp_common.c       |  85 +++++++++++++
>   sound/soc/intel/boards/hda_dsp_common.h       |  32 +++++
>   sound/soc/intel/boards/skl_hda_dsp_common.c   |   6 +
>   sound/soc/intel/boards/skl_hda_dsp_common.h   |  27 ++++-
>   sound/soc/intel/boards/skl_hda_dsp_generic.c  |   1 +
>   sound/soc/intel/boards/sof_rt5682.c           |  11 ++
>   sound/soc/sof/intel/Kconfig                   |  10 ++
>   sound/soc/sof/intel/hda-codec.c               |  22 +++-
>   sound/soc/sof/intel/hda.c                     |   6 +
>   sound/soc/sof/intel/hda.h                     |   6 +-
>   19 files changed, 367 insertions(+), 31 deletions(-)
>   create mode 100644 sound/soc/intel/boards/hda_dsp_common.c
>   create mode 100644 sound/soc/intel/boards/hda_dsp_common.h
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
