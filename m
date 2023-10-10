Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A677BF903
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 12:51:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17DF91283;
	Tue, 10 Oct 2023 12:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17DF91283
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696935063;
	bh=TCxtOEOHqePHEFVdddBUAHs1oAZDQvzfb5xAjEMMhLc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KpeKGeBov7k6W4UkY56ctkOAAbwdu0iqdM0d1R2wpmBuOv1wccXRTZJYlbcGoxmfd
	 1vdaRveKm2U/MK5vaayIGeUkgO3wVLXr1CrL/JNkznD1qCYRR2Rt84sxU7IvVrVfQw
	 u9OpaY4gjVb4RrusnBnz3g7I6NmPPQPjOyb2MFJE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 868F6F80130; Tue, 10 Oct 2023 12:50:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B25DF8027B;
	Tue, 10 Oct 2023 12:50:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCC35F802BE; Tue, 10 Oct 2023 12:50:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 817C5F80166;
	Tue, 10 Oct 2023 12:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 817C5F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XRQ9H3oN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696935000; x=1728471000;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TCxtOEOHqePHEFVdddBUAHs1oAZDQvzfb5xAjEMMhLc=;
  b=XRQ9H3oNqTHbJBjmoBX9TTfPL1+PB4K4wx1pBxSS1ks5IGCQE0uhuYhK
   q5P0pwgpneOtGxm6iG028MI7iVmcLgQabxAyyzLh0zKhQdLpJeZX3D8vM
   OY078ndCeC/81lA0duCP7c+/Q10/5VVY+TxINTYA2AIm/9m6Nc/8qZ//2
   9L4arY5HtOHOenmaBXl9Wyvfrbzg+PSnjtl0v+k4vvSwuET1vMlNrr2rE
   1J0elefEwJgXwYP8HdHQsaYKjYnyzkH+FqWUS/kZhVvcILU2WHQj+1Lpo
   +YNPRTu4Yv9dv7R0cf+fo/VWdxYhNyrJFtzqUYISleA2F0HJhoIuEamIn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="374704405"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200";
   d="scan'208";a="374704405"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 03:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="703262298"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200";
   d="scan'208";a="703262298"
Received: from smirnovi-mobl2.ger.corp.intel.com (HELO [10.249.36.74])
 ([10.249.36.74])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 03:49:20 -0700
Message-ID: <fe03aa27-697a-4bfb-bd9c-7866da198f6c@linux.intel.com>
Date: Tue, 10 Oct 2023 13:49:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/13] sound: Use -EPROBE_DEFER instead of i915 module
 loading.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20231009115437.99976-1-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20231009115437.99976-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MDS5HGZMV44BYQK6RENCSHTU6NHYVNCZ
X-Message-ID-Hash: MDS5HGZMV44BYQK6RENCSHTU6NHYVNCZ
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MDS5HGZMV44BYQK6RENCSHTU6NHYVNCZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Maarteen,

On 09/10/2023 14:54, Maarten Lankhorst wrote:
> Explicitly loading i915 becomes a problem when upstreaming the new intel driver
> for Tiger Lake and higher graphics (xe). By loading i915, it doesn't wait for
> driver load of xe, and will fail completely before it loads.
> 
> -EPROBE_DEFER has to be returned before any device is created in probe(),
> otherwise the removal of the device will cause EPROBE_DEFER to try again
> in an infinite loop.
> 
> The conversion is done in gradual steps. First I add an argument to
> snd_hdac_i915_init to allow for -EPROBE_DEFER so I can convert each driver
> separately. Then I convert each driver to move snd_hdac_i915_init out of the
> workqueue. Finally I drop the ability to choose modprobe behavior after the
> last user is converted.
> 
> Compared to previous version, I added the patch
> "ASoC: SOF: Intel: Fix error handling in hda_init()"

Thank you for the updates.

to all:
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

and for sound/soc/sof/ :
Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>


> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-kernel@vger.kernel.org
> Cc: sound-open-firmware@alsa-project.org
> 
> Maarten Lankhorst (11):
>   ASoC: SOF: core: Ensure sof_ops_free() is still called when probe
>     never ran.
>   ASoC: SOF: Intel: Fix error handling in hda_init()
>   ALSA: hda: Intel: Fix error handling in azx_probe()
>   ALSA: hda: i915: Allow override of gpu binding.
>   ALSA: hda: i915: Add an allow_modprobe argument to snd_hdac_i915_init
>   ALSA: hda: i915: Allow xe as match for i915_component_master_match
>   ASoC: Intel: avs: Move snd_hdac_i915_init to before probe_work.
>   ALSA: hda: Intel: Move snd_hdac_i915_init to before probe_work.
>   ASoC: Intel: Skylake: Move snd_hdac_i915_init to before probe_work.
>   ASoC: SOF: Intel: Move binding to display driver outside of deferred
>     probe
>   ALSA: hda: i915: Remove extra argument from snd_hdac_i915_init
> 
> Pierre-Louis Bossart (2):
>   ASoC: SOF: core: Add probe_early and remove_late callbacks
>   ASoC: SOF: Intel: hda: start splitting the probe
> 
>  sound/hda/hdac_i915.c                | 24 ++++++-----
>  sound/pci/hda/hda_intel.c            | 60 ++++++++++++++--------------
>  sound/soc/intel/avs/core.c           | 13 ++++--
>  sound/soc/intel/skylake/skl.c        | 31 +++++---------
>  sound/soc/sof/core.c                 | 17 +++++++-
>  sound/soc/sof/intel/hda-common-ops.c |  2 +
>  sound/soc/sof/intel/hda.c            | 46 +++++++++++++--------
>  sound/soc/sof/intel/hda.h            |  2 +
>  sound/soc/sof/ops.h                  | 16 ++++++++
>  sound/soc/sof/sof-priv.h             |  2 +
>  10 files changed, 129 insertions(+), 84 deletions(-)
> 

-- 
Péter
