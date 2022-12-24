Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95902655989
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Dec 2022 10:00:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 399CFA9A9;
	Sat, 24 Dec 2022 09:59:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 399CFA9A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671872409;
	bh=OWn0iyjXQA4osiRZXNzPvFeyEY2peMtzlmChCk/B1AE=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qvD5Zyq4DcSv6SEzkM/F6aoz/YR/i0BaqXfR1QPjcdYzdws5fBHhSqfacF5AtYbxx
	 dhKfcBzGFjKDVMODXyy+GW2fTfVWsYUWYlc1BIUYM9DaawOX1WUGVdgfigPE1Wt0Oi
	 VEpvHnViME6A+Z/y7qTY+u0n9G+0OG0IpZc6QWIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFB55F80423;
	Sat, 24 Dec 2022 09:59:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC5D7F8032B; Sat, 24 Dec 2022 09:59:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9BD3F80245
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 09:59:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9BD3F80245
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=BSM+RJb0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9ADA6B8219B;
 Sat, 24 Dec 2022 08:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC371C433D2;
 Sat, 24 Dec 2022 08:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1671872344;
 bh=OWn0iyjXQA4osiRZXNzPvFeyEY2peMtzlmChCk/B1AE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BSM+RJb0WFZjgsl6DnOps+gPMkSjyGJ3HZ9ToI6Q570dArlOPMXDs9XUkcaNVe9+y
 zunC7x6Yj1WhFxiozY8o5u2f3k5Y+PgffAnr4TF879V7fuzvHVvP2poQ/tw5V8EEAp
 iHCn5AIpnijkg4h0eWQWsn6Se1CDvO98RkZX3CXk=
Date: Sat, 24 Dec 2022 09:59:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [RFC PATCH 10/14] sound: usb: card: Check for support for
 requested audio format
Message-ID: <Y6a/VWOg4mBMtUOr@kroah.com>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-11-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223233200.26089-11-quic_wcheng@quicinc.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, bgoswami@quicinc.com, mathias.nyman@intel.com,
 Thinh.Nguyen@synopsys.com, andersson@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Dec 23, 2022 at 03:31:56PM -0800, Wesley Cheng wrote:
> Allow for checks on a specific USB audio device to see if a requested PCM
> format is supported.  This is needed for support for when playback is
> initiated by the ASoC USB backend path.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/card.c | 19 +++++++++++++++++++
>  sound/usb/card.h |  3 +++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 396e5a34e23b..9b8d2ed308c8 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -133,6 +133,25 @@ int snd_usb_unregister_vendor_ops(void)
>  }
>  EXPORT_SYMBOL_GPL(snd_usb_unregister_vendor_ops);
>  
> +struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
> +			struct snd_pcm_hw_params *params, int direction)
> +{
> +	struct snd_usb_stream *as;
> +	struct snd_usb_substream *subs = NULL;
> +	const struct audioformat *fmt;
> +
> +	if (usb_chip[card_idx] && enable[card_idx]) {
> +		list_for_each_entry(as, &usb_chip[card_idx]->pcm_list, list) {
> +			subs = &as->substream[direction];
> +			fmt = find_substream_format(subs, params);
> +			if (fmt)
> +				return as;
> +		}
> +	}

Where is the locking here?  How can you walk a list that can be changed
as you walk it?

And what about reference counting?  You are returning a pointer to a
structure, who now "owns" it?  What happens if it is removed from the
system after you return it?

> +	return 0;

Didn't sparse complain about this?  You can't return "0" as a pointer,
it should be NULL.

Always run basic tools like sparse on code before submitting it so that
we don't have to find errors like this.

thanks,

greg k-h
