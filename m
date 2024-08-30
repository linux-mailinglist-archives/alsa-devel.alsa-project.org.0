Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AAB965E2C
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:14:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47C10843;
	Fri, 30 Aug 2024 12:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47C10843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725012840;
	bh=bKLtZa3cKoK9TzUa9TB+LglNmjaV03FoQ0yzMmzbFmc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RKpQiRlBjAaDiOQkycDJN+5CInZpqQ0jcXe5/sM2xeSMVW7BeTFNfcbx3BFT5sIei
	 eGK/TS/7gaZzxQ4YAc/cKgnOFep5SesgaVv9SqoU1dfiNwEWULzQ7XLNawjsHC0VcP
	 bQ+zAn/iT9d8IoZDM6uSN1JyO9ysPLXe8A6jEUDo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F227F806A3; Fri, 30 Aug 2024 12:12:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5C94F806A7;
	Fri, 30 Aug 2024 12:12:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C20DF805B4; Fri, 30 Aug 2024 12:12:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E470F80631
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E470F80631
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cRyn3hAU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012731; x=1756548731;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bKLtZa3cKoK9TzUa9TB+LglNmjaV03FoQ0yzMmzbFmc=;
  b=cRyn3hAUqcB+PkMYJflg3ckuuZczy4cc+MoGmbRdTsaIik0ZPaMGdYoY
   Zxx5oEdXY+fI9UgogQi/c49bLW9zPfMRH6kNeFvmt1oB27owysKQr2tnQ
   oxnw7vAelKZakhGe7VW/yDPimwvZ42UwR5e8NtAsEmb/p7YsO6JFiMh90
   knHB+I/hEdMXf986qGVnUa5SMW4ko6iEmmZjVeeVmBWhZFshALiwfR0o2
   annNfwBQe8hckwCmb3SpmDCE6jpZWwLelEZIq9pvIHUZHXMhnoHX2iEYl
   5u7vzVieVTmfeLPVNGXkU3lvEpm3ps5SU9F6txk69lk0R5/ADnahH0qKN
   Q==;
X-CSE-ConnectionGUID: X7Zqok+YTaearfIQiI1U+g==
X-CSE-MsgGUID: DAM9TwqSRy+1peNAyv4WYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218819"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="34218819"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:09 -0700
X-CSE-ConnectionGUID: g37nUHMuRiqbqJGTAPN68Q==
X-CSE-MsgGUID: kFlenFfcQeuihxmEkU1Y9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="63481580"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:03 -0700
Message-ID: <522dd841-2060-4e7c-b8ce-7e9ea2fa8498@linux.intel.com>
Date: Fri, 30 Aug 2024 11:03:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 16/33] ASoC: doc: Add documentation for SOC USB
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-17-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-17-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JAV3OLTZI6KBOEKLPXCMHPWQUHGE5FT5
X-Message-ID-Hash: JAV3OLTZI6KBOEKLPXCMHPWQUHGE5FT5
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAV3OLTZI6KBOEKLPXCMHPWQUHGE5FT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> diff --git a/Documentation/sound/soc/index.rst b/Documentation/sound/soc/index.rst
> index e57df2dab2fd..8bed8f8f48da 100644
> --- a/Documentation/sound/soc/index.rst
> +++ b/Documentation/sound/soc/index.rst
> @@ -18,3 +18,4 @@ The documentation is spilt into the following sections:-
>     jack
>     dpcm
>     codec-to-codec
> +   usb
> diff --git a/Documentation/sound/soc/usb.rst b/Documentation/sound/soc/usb.rst
> new file mode 100644
> index 000000000000..bd3d9eb86b07
> --- /dev/null
> +++ b/Documentation/sound/soc/usb.rst
> @@ -0,0 +1,429 @@
> +================
> +ASoC USB support
> +================
> +
> +Overview
> +========
> +In order to leverage the existing USB sound device support in ALSA, the
> +ASoC USB APIs are introduced to allow for the entities to communicate
> +with one another.

nit-pick: entities is rather vague and an overloaded term in USB audio.
Maybe "allow the subsystems to exchange configuration information"

> +One potential use case would be to support USB audio offloading, which is
> +an implementation that allows for an external DSP on the SoC to handle the

nit-pick: not sure about the reference to an 'external DSP'. "external"
would usually to a stand-alone device and there's no real need for DSP
capabilities for USB offload, e.g. a regular embedded core would do just
fine.

maybe "allows for an alternate power-optimized path in the audio
subsystem to handle the transfer of audio data over the USB bus"

> +transfer of audio data over the USB bus.  This would let the main
> +processor to stay in lower power modes for longer duration.  The following
> +is an example design of how the ASoC and ALSA pieces can be connected
> +together to achieve this:

> +	int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
> +					     int direction, long *route)
> +..
> +
> +  - ``dev``: USB device to look up offload path mapping
> +  - ``card``: USB sound card index
> +  - ``pcm``: USB sound PCM device index
> +  - ``direction``: direction to fetch offload routing information
> +  - ``route``: mapping of sound card and pcm indexes for the offload path

nit-pick: again explain how the card and pcm indices are handled.


> +--------------------------------
> +USB devices can be hotplugged into the USB root hub at any point in time.

"root hub" really?

Is this really required? I would think the entire framework would work
just fine if the device is connected to any hub at any level, not just
"the" root hub.


