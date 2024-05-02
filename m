Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADA98B99B6
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2024 13:06:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A84A2E82;
	Thu,  2 May 2024 13:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A84A2E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714647982;
	bh=EluTdDMIMNhKZ/EkpupaemH1PZsrZoO5k/Ow1fEItns=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gtXuUpgSsfVHLwmbNZPBrMdzjnjUi3Ffj+0s+QDS7/au8YLh5FCGjOdA9a76GS4/2
	 1vH48ro7Fg4tuZ9iqWCtHQ9kbeHiL0T8q2Yhx8AFZLLVUnZD4nD2m0+kzV4/j3yu+K
	 s7PyPHQrRiY11eMHScnKDEVALOZhn+684Xfp4P1E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E606DF80587; Thu,  2 May 2024 13:05:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22A6BF805A0;
	Thu,  2 May 2024 13:05:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A61BF80266; Thu,  2 May 2024 13:05:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97BEDF800AE
	for <alsa-devel@alsa-project.org>; Thu,  2 May 2024 13:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97BEDF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PRbpjJ4X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714647943; x=1746183943;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=EluTdDMIMNhKZ/EkpupaemH1PZsrZoO5k/Ow1fEItns=;
  b=PRbpjJ4XFSGSxyr+dRLME3Cy0ClMV0o8P5TSSkNSRQt4Kdnndp18v7uW
   cdxekPRTm7HHqANYqGxyGG/ehZFTG5i3KONgmF9MI7KWXUQxQZ5biZa1P
   DWw/vztjwaeLE5aVGRbDcPjXajH/wPPzG+jVhL3170vwdkoPJhFhrWeRu
   HpylF5r1TNcHDjjZjE+FR8y1dVvb/a97y7yBSCOLY9t02ZvsC6xEaJwaD
   52SShIIQWB+tuZlpd0FKQDgTJX74fGS7xr0Es9gn+cl8GUS/JCTAGhe65
   mSaYoyPtuX5CvQjrRXv3RPZF77+y8Grf8BqzHDXATRiIbTSxoDh74ujNZ
   g==;
X-CSE-ConnectionGUID: f+Shp6eGT4+Kh5iXsY3+CQ==
X-CSE-MsgGUID: Q0diREg0QPCOmHl/hSsibg==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21813499"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000";
   d="scan'208";a="21813499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 04:05:39 -0700
X-CSE-ConnectionGUID: RNrykgpXQNOhcPL/BW4gnA==
X-CSE-MsgGUID: 8wdqEQM1TVOscvvgR0xz0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000";
   d="scan'208";a="50280954"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 02 May 2024 04:05:34 -0700
Message-ID: <ddd682da-5cfd-db09-e316-3c54939caf90@linux.intel.com>
Date: Thu, 2 May 2024 14:07:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 tiwai@suse.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240425215125.29761-1-quic_wcheng@quicinc.com>
 <20240425215125.29761-7-quic_wcheng@quicinc.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v20 06/41] usb: host: xhci-sideband: Expose a sideband
 interrupter enable API
In-Reply-To: <20240425215125.29761-7-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HZIEWPF3RTAKVOXCQP2NRXT34WH6QGOU
X-Message-ID-Hash: HZIEWPF3RTAKVOXCQP2NRXT34WH6QGOU
X-MailFrom: mathias.nyman@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZIEWPF3RTAKVOXCQP2NRXT34WH6QGOU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26.4.2024 0.50, Wesley Cheng wrote:
> Some use cases maybe require that the secondary interrupter's events to
> be handled by the OS.  In this case, configure the IMOD and the
> skip_events property to enable the interrupter's events.  By default,
> assume that the secondary interrupter doesn't want to enable OS event
> handling.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   drivers/usb/host/xhci-sideband.c  | 28 ++++++++++++++++++++++++++++
>   include/linux/usb/xhci-sideband.h |  2 ++
>   2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
> index 255feae33c6e..6fdae9840c11 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -237,6 +237,30 @@ xhci_sideband_get_event_buffer(struct xhci_sideband *sb)
>   }
>   EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
>   
> +/**
> + * xhci_sideband_enable_interrupt - enable interrupt for secondary interrupter
> + * @sb: sideband instance for this usb device
> + * @imod_interval: number of event ring segments to allocate
> + *
> + * Enables OS owned event handling for a particular interrupter if client
> + * requests for it.  In addition, set the IMOD interval for this particular
> + * interrupter.
> + *
> + * Returns 0 on success, negative error otherwise
> + */
> +int xhci_sideband_enable_interrupt(struct xhci_sideband *sb, u32 imod_interval)
> +{
> +	if (!sb || !sb->ir)
> +		return -ENODEV;
> +
> +	xhci_set_interrupter_moderation(sb->ir, imod_interval);

Is there a need to adjust the moderation after initial setup?

If not then maybe we could pass the imod_interval as a parameter to
xhci_create_secondary_interrupter(), and avoid exporting
xhci_set_interrupter_moderation()


> +	sb->ir->skip_events = false;
> +	xhci_enable_interrupter(sb->ir);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_enable_interrupt);

I can't find the place where xhci_sideband_enable_interrupt() is called in
this series. How is it planned to be used?

Thanks
Mathias
