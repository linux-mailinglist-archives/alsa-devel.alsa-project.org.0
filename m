Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C8021A4DA
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 18:32:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F52986F;
	Thu,  9 Jul 2020 18:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F52986F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594312366;
	bh=tGwiR11julnBb9Kfa0X/quEZ26ymozrKptRBM6VK5XE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lWCv4aqEXwinbORxOI0aZSMdoLeXrXrY32Gdj5aEEKCdKeHCBkizUuKLVN6XUFj6O
	 Br+FnXc+Nhsw3RQdQLG1S7T6h/bBEQmBgJUurBU30Yf4oAC1arz1U/v8zKlOOSP+7I
	 kYKVlRdRzpfJSoR+YWkrLewPyU8utKZ6cFgrvY74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2616F8025A;
	Thu,  9 Jul 2020 18:27:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A25BF802A0; Thu,  9 Jul 2020 18:27:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E869F80264
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 18:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E869F80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dZvzRlSZ"
Received: from embeddedor (unknown [201.162.245.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4C9B207DD;
 Thu,  9 Jul 2020 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594312054;
 bh=tGwiR11julnBb9Kfa0X/quEZ26ymozrKptRBM6VK5XE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dZvzRlSZC66QgHT5W6VDdFjA61XIFOVyDYAqM9sUnA+V2AY9i3/pQWmr5FcWDz9oN
 AZ7KkVj/HtbxSbLZTYqbHOj0HhF5ek5gMV0h9qNbgv7q/YCwweXQxzyHhDRyNYdzIr
 EPsH5Cp6WIhwXdP1Anx6Nkmk+P5d1cNw9mh54vro=
Date: Thu, 9 Jul 2020 11:33:06 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 2/3] ALSA: xen: Remove superfluous fall through comments
Message-ID: <20200709163306.GB15020@embeddedor>
References: <20200709111750.8337-1-tiwai@suse.de>
 <20200709111750.8337-3-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709111750.8337-3-tiwai@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jul 09, 2020 at 01:17:49PM +0200, Takashi Iwai wrote:
> The "fall through" comments found in switch-cases in ALSA xen driver
> are all superfluous.  The kernel coding style allows the multiple
> cases in a row.  Let's remove them.
> 

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/xen/xen_snd_front.c         | 4 ----
>  sound/xen/xen_snd_front_evtchnl.c | 4 ----
>  2 files changed, 8 deletions(-)
> 
> diff --git a/sound/xen/xen_snd_front.c b/sound/xen/xen_snd_front.c
> index e21d0bfafeae..228d82031297 100644
> --- a/sound/xen/xen_snd_front.c
> +++ b/sound/xen/xen_snd_front.c
> @@ -246,11 +246,8 @@ static void sndback_changed(struct xenbus_device *xb_dev,
>  
>  	switch (backend_state) {
>  	case XenbusStateReconfiguring:
> -		/* fall through */
>  	case XenbusStateReconfigured:
> -		/* fall through */
>  	case XenbusStateInitialised:
> -		/* fall through */
>  		break;
>  
>  	case XenbusStateInitialising:
> @@ -289,7 +286,6 @@ static void sndback_changed(struct xenbus_device *xb_dev,
>  		break;
>  
>  	case XenbusStateUnknown:
> -		/* fall through */
>  	case XenbusStateClosed:
>  		if (xb_dev->state == XenbusStateClosed)
>  			break;
> diff --git a/sound/xen/xen_snd_front_evtchnl.c b/sound/xen/xen_snd_front_evtchnl.c
> index 102d6e096cc8..29e0f0ea67eb 100644
> --- a/sound/xen/xen_snd_front_evtchnl.c
> +++ b/sound/xen/xen_snd_front_evtchnl.c
> @@ -46,13 +46,9 @@ static irqreturn_t evtchnl_interrupt_req(int irq, void *dev_id)
>  			continue;
>  		switch (resp->operation) {
>  		case XENSND_OP_OPEN:
> -			/* fall through */
>  		case XENSND_OP_CLOSE:
> -			/* fall through */
>  		case XENSND_OP_READ:
> -			/* fall through */
>  		case XENSND_OP_WRITE:
> -			/* fall through */
>  		case XENSND_OP_TRIGGER:
>  			channel->u.req.resp_status = resp->status;
>  			complete(&channel->u.req.completion);
> -- 
> 2.16.4
> 
