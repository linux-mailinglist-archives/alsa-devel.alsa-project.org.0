Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4549493F1
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 16:57:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 311F432A2;
	Tue,  6 Aug 2024 16:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 311F432A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722956228;
	bh=v/mPmTlATMsw2ACDeJWfLpDxiG/dYbLwP3blTQDlKWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EuiYdgjOyBRko3eGQgA4Ut8foHbKR/8yBOA94miiWPokwmb4iyXtJ/NOXGSp21qQS
	 ZboSIMsrtwvX0o5PXwcgrPSbmhjAmKoS3xjY5emZewBHylqqsKWWvg55o2eYHLjavH
	 hIv0kd1Nu1LD3VuOkOiz7KOmmpMJRZFto6cNzar0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54845F805A9; Tue,  6 Aug 2024 16:56:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44C86F805AE;
	Tue,  6 Aug 2024 16:56:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCD2BF80448; Tue,  6 Aug 2024 16:50:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20492F800B0
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 16:50:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20492F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kjsnJKn9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722955849; x=1754491849;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=v/mPmTlATMsw2ACDeJWfLpDxiG/dYbLwP3blTQDlKWk=;
  b=kjsnJKn9VKGnFOW6/Vf1+o9aXoRRUXGnhnej/BYZC8+LEm3jnGQoVBEM
   mZlXfXU9JwIBv3YlW/GR0RBzbjX2UiAcIeTTr9Rd/tRAxyzW576nuXqRt
   ry2xrhnatwvEFyoipp/xr/CRnwp7WXSJ7f4P59zAs9Iqhokytry5ceEMN
   4dEnOWO/2/Bw18VSSEHulG2wHz5s/cE5qDlb/xWNFH3eVgzIjW5/I7JD0
   g87tJmpY/1xXlu6MBj7M0sumpeLQsh7G8neKJZTAc6m5FuJ1p3+jmISKY
   uYfitEi9XlFZNbtuA/bTOOsKW2QQFru95580aGJpUYIX/ctLRDSllC5zL
   A==;
X-CSE-ConnectionGUID: WrDs1EFjQiiSfUFDjsCg2A==
X-CSE-MsgGUID: BW2y9rP3QLa5jshheSHkyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21101576"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800";
   d="scan'208";a="21101576"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:50:45 -0700
X-CSE-ConnectionGUID: 3DaEl9/wTaC9GlczUOLDlA==
X-CSE-MsgGUID: qU5jF+H5Sr6pD6f5BxIjrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800";
   d="scan'208";a="87476567"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:50:39 -0700
Message-ID: <01bd74da-6f2d-4cea-81d0-06f8dd95b191@linux.intel.com>
Date: Tue, 6 Aug 2024 16:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 06/34] usb: host: xhci-mem: Allow for interrupter
 clients to choose specific index
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-7-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240801011730.4797-7-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OQK2SGQPN7JNWG667OSUKZRZMQCLZX53
X-Message-ID-Hash: OQK2SGQPN7JNWG667OSUKZRZMQCLZX53
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OQK2SGQPN7JNWG667OSUKZRZMQCLZX53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/1/2024 3:17 AM, Wesley Cheng wrote:
> Some clients may operate only on a specific XHCI interrupter instance.
> Allow for the associated class driver to request for the interrupter that
> it requires.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   drivers/usb/host/xhci-mem.c       | 29 ++++++++++++++++-------------
>   drivers/usb/host/xhci-sideband.c  |  4 ++--
>   drivers/usb/host/xhci.h           |  2 +-
>   include/linux/usb/xhci-sideband.h |  2 +-
>   4 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 60dfc59260d8..997e8f27acb8 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2340,7 +2340,7 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
>   
>   struct xhci_interrupter *
>   xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
> -					u32 imod_interval)
> +					u32 imod_interval, int intr_num)
>   {
>   	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
>   	struct xhci_interrupter *ir;
> @@ -2355,29 +2355,32 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
>   		return NULL;
>   
>   	spin_lock_irq(&xhci->lock);
> -
>   	/* Find available secondary interrupter, interrupter 0 is reserved for primary */
>   	for (i = 1; i < xhci->max_interrupters; i++) {
> -		if (xhci->interrupters[i] == NULL) {
> -			err = xhci_add_interrupter(xhci, ir, i);
> -			break;
> +		if ((intr_num > 0 && i == intr_num) || intr_num <= 0) {
> +			if (xhci->interrupters[i] == NULL) {
> +				err = xhci_add_interrupter(xhci, ir, i);
> +				if (err) {
> +					spin_unlock_irq(&xhci->lock);
> +					goto free_ir;
> +				}
> +				break;
> +			}
>   		}
>   	}

When intr_num is set, you don't really need to iterate to search for 
free slot, as you already know which one you want to use?

Wouldn't something like:
         /* Find available secondary interrupter, interrupter 0 is 
reserved for primary */
         if (!intr_num) {
                 for (i = 1; i < xhci->max_interrupters; i++) {
                         if (xhci->interrupters[i] == NULL) {
                                 err = xhci_add_interrupter(xhci, ir, i);
                                 break;
                         }
                 }
         } else {
                 if (xhci->interrupters[intr_num] == NULL)
                         err = xhci_add_interrupter(xhci, ir, i);
         }
make more sense, also make intr_num unsigned int, as it should never be 
negative as it is index into a table.

> -
>   	spin_unlock_irq(&xhci->lock);
>   
> -	if (err) {
> -		xhci_warn(xhci, "Failed to add secondary interrupter, max interrupters %d\n",
> -			  xhci->max_interrupters);
> -		xhci_free_interrupter(xhci, ir);
> -		return NULL;
> -	}
> -
>   	xhci_set_interrupter_moderation(ir, imod_interval);
> +
>   	xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
>   		 i, xhci->max_interrupters);
>   
>   	return ir;
> +
> +free_ir:
> +	xhci_free_interrupter(xhci, ir);
> +
> +	return NULL;
>   }
>   EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
>   

(...)

