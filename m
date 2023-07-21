Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C07C75C6CB
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 14:20:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF54D1EF;
	Fri, 21 Jul 2023 14:19:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF54D1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689942013;
	bh=7j7LwynwL0LMQz3oB6ergd8/nVuyEdhPBGRLEJP6bP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=muBDe+ouOJbjuWpJOW4hlMCraZza04mJSly7vXyY7LV5HZihbRG34dHfqhFP2Amt+
	 b/QBlT/CqdR+iV7y5/XE6kscrSExfk186sWWUE2DS3PpGV68hgLaLbrAfFaJkA+ecq
	 FYgR+G2+t8cevePUKytO9AkMpAB9SwW71lbyj8mM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B50DF80520; Fri, 21 Jul 2023 14:19:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 135ADF8007E;
	Fri, 21 Jul 2023 14:19:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2708F804DA; Fri, 21 Jul 2023 14:19:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AF07F8047D;
	Fri, 21 Jul 2023 14:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AF07F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FKwuaX7o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689941948; x=1721477948;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7j7LwynwL0LMQz3oB6ergd8/nVuyEdhPBGRLEJP6bP0=;
  b=FKwuaX7o8doNiQ4kBPy/wTUzu8QzDLYT61vixRnObKquC9WLU1Cx3oVl
   +KhYxO20hoKgE2Y1g/Xv+E6+0ACvyZ11kaGQCZazUqiYtcWJWuC5gFrCL
   lcwrYv4okm1J0OuF6+m9Vljxx+C6fBSYt47uodoj8nrWr4j+AFFfDGcay
   eDEjPPyPLN0SsoR0NXRYJz9PIlDDFzfOXP25AVqh7lKOWR4oS0LC9GM5k
   18K6isUUp8kQ5iLtA1iNGEM8EPtyqazTnHrrwCkmicBmjjwqs/YLb6b5s
   DnagkUcr8E/uwGItLIHuiFtWuVMeg+13ryWDjQ+5zkR8gRdIPrniuQhxz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="356999016"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="356999016"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 05:19:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="675028754"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="675028754"
Received: from dhardfel-mobl1.ger.corp.intel.com (HELO [10.251.223.78])
 ([10.251.223.78])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 05:18:39 -0700
Message-ID: <9b285ede-eaeb-40a2-086d-30cf74185784@linux.intel.com>
Date: Fri, 21 Jul 2023 15:19:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/9] ALSA: hda/i915: Allow override of gpu binding.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
 <20230719164141.228073-3-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230719164141.228073-3-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VUB5GW4ZATMHUJBFJVQGXUZZVKTOHAQ2
X-Message-ID-Hash: VUB5GW4ZATMHUJBFJVQGXUZZVKTOHAQ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VUB5GW4ZATMHUJBFJVQGXUZZVKTOHAQ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 19/07/2023 19:41, Maarten Lankhorst wrote:
> Selecting CONFIG_DRM selects CONFIG_VIDEO_NOMODESET, which exports
> video_firmware_drivers_only(). This can be used as a first
> approximation on whether i915 will be available. It's safe to use as
> this is only built when CONFIG_SND_HDA_I915 is selected by CONFIG_I915.
> 
> It's not completely fool proof, as you can boot with "nomodeset
> i915.modeset=1" to make i915 load regardless, or use
> "i915.force_probe=!*" to never load i915, but the common case of
> booting with nomodeset to disable all GPU drivers this will work as
> intended.
> 
> Because of this, we add an extra module parameter,
> snd_hda_core.gpu_bind that can be used to signal users intent.
> -1 follows nomodeset, 0 disables binding, 1 forces wait/-EPROBE_DEFER
> on binding.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  sound/hda/hdac_i915.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
> index 161a9711cd63e..c32709fa4115f 100644
> --- a/sound/hda/hdac_i915.c
> +++ b/sound/hda/hdac_i915.c
> @@ -11,6 +11,13 @@
>  #include <sound/hda_i915.h>
>  #include <sound/hda_register.h>
>  
> +#include <video/nomodeset.h>
> +
> +static int gpu_bind = -1;
> +module_param(gpu_bind, int, 0644);
> +MODULE_PARM_DESC(gpu_bind, "Whether to bind sound component to GPU "
> +			   "(1=always, 0=never, -1=on nomodeset(default))");
> +
>  #define IS_HSW_CONTROLLER(pci) (((pci)->device == 0x0a0c) || \
>  				((pci)->device == 0x0c0c) || \
>  				((pci)->device == 0x0d0c) || \
> @@ -121,6 +128,9 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
>  {
>  	struct pci_dev *display_dev = NULL;
>  
> +	if (!gpu_bind || (gpu_bind < 0 && video_firmware_drivers_only()))
> +		return false;
> +
>  	for_each_pci_dev(display_dev) {
>  		if (display_dev->vendor == PCI_VENDOR_ID_INTEL &&
>  		    (display_dev->class >> 16) == PCI_BASE_CLASS_DISPLAY &&

-- 
Péter
