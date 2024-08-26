Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5167B95F0B9
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2024 14:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9731983B;
	Mon, 26 Aug 2024 14:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9731983B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724674228;
	bh=CNlgUOIhnZS0GrsQng07UAMdA7zQHT5HyZ7gwUjR7Rk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BvVNe4OOuGe8EnaLWottQTPt2hJjZmUVks7aPEysf6JuzLQZ9waIf7zz6RfQ4VeoL
	 4s/zdn68rc3WwU8LPFedIiJBIuZNa1NKfz8drgtwnwC3hvcL1q67Li6g4l469KpTfJ
	 ge7H8SP/5suRQZKqEe8sGP21EApzl3cn15KSShI0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81C85F805B0; Mon, 26 Aug 2024 14:09:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BEF9F805A9;
	Mon, 26 Aug 2024 14:09:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 226B7F80423; Mon, 26 Aug 2024 14:04:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DE5AF8025E
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 14:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DE5AF8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=b8zo5yxS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724673836; x=1756209836;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CNlgUOIhnZS0GrsQng07UAMdA7zQHT5HyZ7gwUjR7Rk=;
  b=b8zo5yxSWMKMZ3mmng6IUhl4Q0RK0/a+BfLvhTLcDyj3cA6QYbTVWho4
   DK+s98aOSqnW4oLq01NlcygMf5/LE6TxqtMOCiF+45RjWwB9MtAp7hpH6
   KvomTK5UKA8Iv2wKTrnyIsC3Z9nAjfbevQnQpZFRjdqvlem3itU3Xz1U+
   bSnNixdKkaNPKb3T12MuV7eDU2FXccIxhvIqkHWmo6MXBMXnjpsT+5oKx
   HPbfBF2Sqt1f9KUI8b3JK2Hwy+Ov2jUtMER7fUiTyeyvtiCn3Z3n59HeA
   HJMVwQUaAEKHz8hXL6f2+k5oqaNHtt7nm2j9nHRElGHi8cLuEma4AG15P
   Q==;
X-CSE-ConnectionGUID: /8QQ4k52RcmAPh4jWqHExw==
X-CSE-MsgGUID: /uUkJiq4Sqyfp5npUjpCVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25967065"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600";
   d="scan'208";a="25967065"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 02:32:55 -0700
X-CSE-ConnectionGUID: wdvPnAEPTqmZhETgD1WLmA==
X-CSE-MsgGUID: RKvQAKVwRa24HsNafnwANQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600";
   d="scan'208";a="62134672"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.246.121])
 ([10.245.246.121])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 02:32:49 -0700
Message-ID: <9f25b900-ae1c-41af-a380-ac5e00860283@linux.intel.com>
Date: Mon, 26 Aug 2024 10:48:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 01/33] xhci: add helper to stop endpoint and wait for
 completion
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org,
 Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
 <20240823200101.26755-2-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240823200101.26755-2-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NIR5OHUM7QO6LEGWIEWTIB4AFHINXAGR
X-Message-ID-Hash: NIR5OHUM7QO6LEGWIEWTIB4AFHINXAGR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NIR5OHUM7QO6LEGWIEWTIB4AFHINXAGR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/23/24 22:00, Wesley Cheng wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Expose xhci_stop_endpoint_sync() which is a synchronous variant of
> xhci_queue_stop_endpoint().  This is useful for client drivers that are
> using the secondary interrupters, and need to stop/clean up the current
> session.  The stop endpoint command handler will also take care of cleaning
> up the ring.
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  drivers/usb/host/xhci.c | 39 +++++++++++++++++++++++++++++++++++++++
>  drivers/usb/host/xhci.h |  2 ++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 37eb37b0affa..3a051ed32907 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -2784,6 +2784,45 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
>  	return -ENOMEM;
>  }
>  
> +/*
> + * Synchronous XHCI stop endpoint helper.  Issues the stop endpoint command and
> + * waits for the command completion before returning.
> + */
> +int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int suspend,
> +			    gfp_t gfp_flags)
> +{
> +	struct xhci_command *command;
> +	unsigned long flags;
> +	int ret;
> +
> +	command = xhci_alloc_command(xhci, true, gfp_flags);
> +	if (!command)
> +		return -ENOMEM;
> +
> +	spin_lock_irqsave(&xhci->lock, flags);
> +	ret = xhci_queue_stop_endpoint(xhci, command, ep->vdev->slot_id,
> +				       ep->ep_index, suspend);
> +	if (ret < 0) {
> +		spin_unlock_irqrestore(&xhci->lock, flags);
> +		goto out;
> +	}
> +
> +	xhci_ring_cmd_db(xhci);
> +	spin_unlock_irqrestore(&xhci->lock, flags);
> +
> +	wait_for_completion(command->completion);
> +
> +	if (command->status == COMP_COMMAND_ABORTED ||
> +	    command->status == COMP_COMMAND_RING_STOPPED) {
> +		xhci_warn(xhci, "Timeout while waiting for stop endpoint command\n");

nit-pick: is this really a timeout? In that case you would have used
wait_for_completion_timeout(), no?

> +		ret = -ETIME;
> +	}
> +out:
> +	xhci_free_command(xhci, command);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(xhci_stop_endpoint_sync);
>  
>  /* Issue a configure endpoint command or evaluate context command
>   * and wait for it to finish.
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 30415158ed3c..1c6126ed55b0 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1914,6 +1914,8 @@ void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
>  void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
>  void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
>  unsigned int count_trbs(u64 addr, u64 len);
> +int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
> +			    int suspend, gfp_t gfp_flags);
>  
>  /* xHCI roothub code */
>  void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,

