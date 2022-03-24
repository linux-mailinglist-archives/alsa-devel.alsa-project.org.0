Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8924E606C
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 09:35:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19C3A17DB;
	Thu, 24 Mar 2022 09:34:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19C3A17DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648110901;
	bh=l7p+lzVuxSNaywoNSXcl3ZMeNQOe1Z3EcdoxDxqSA5A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B/3u1Yo0blhhPaIH3gKB95hukPV4k3drmKHxlRoP8Cuf1zowF8Qk/tq+bF21mB7g5
	 yADCZQtjdcZGtrhzZn5N6b49+Cjn00Ylg783fR6AcJVT6ZeU97irQm6mGxxe5y+DlZ
	 7/yWnBp8L7AvGGGdRvle6ynjDYJjyz/ciOGeW9cs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98432F80139;
	Thu, 24 Mar 2022 09:33:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6D02F80139; Thu, 24 Mar 2022 09:33:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97323F80139
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 09:33:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97323F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="u65XJ496"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6416A61725;
 Thu, 24 Mar 2022 08:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D8CC340EC;
 Thu, 24 Mar 2022 08:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1648110823;
 bh=l7p+lzVuxSNaywoNSXcl3ZMeNQOe1Z3EcdoxDxqSA5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u65XJ496YyPFCe0kGzD3+E80pvKbjzpOl2ZkXKk1lGHOZnw6J2MXaEIbBd692wc6n
 Qk5dFHTWg6U2NHJdaws0VjXp/ZYgvOZW0Mc0QxmJdDjIN7nnxxll3XzcLkdbPpvLQV
 Oaf9O7fqP0e9SBygVx7gFJp1aIBSCNK72NvjHfbk=
Date: Thu, 24 Mar 2022 09:33:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oh Eomji <eomji.oh@samsung.com>
Subject: Re: [PATCH v1 1/3] sound: usb: Add vendor's hooking interface
Message-ID: <Yjws5IhAqos5LDM+@kroah.com>
References: <1648109444-196321-1-git-send-email-eomji.oh@samsung.com>
 <CGME20220324081212epcas2p4d2ed1f3a1bb020606cf65016efec085b@epcas2p4.samsung.com>
 <1648109444-196321-2-git-send-email-eomji.oh@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1648109444-196321-2-git-send-email-eomji.oh@samsung.com>
Cc: alsa-devel@alsa-project.org, JaeHun Jung <jh0801.jung@samsung.com>,
 Leon Romanovsky <leon@kernel.org>, Pavel Skripkin <paskripkin@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>
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

On Thu, Mar 24, 2022 at 05:10:42PM +0900, Oh Eomji wrote:
> In mobile, a co-processor can be used with USB audio to improve power
> consumption.  To support this type of hardware, hooks need to be added
> to the USB audio subsystem to be able to call into the hardware when
> needed.
> 
> The main operation of the call-backs are:
>   - Initialize the co-processor by transmitting data when initializing.
>   - Change the co-processor setting value through the interface
>     function.
>   - Configure sampling rate
>   - pcm open/close
>   - other housekeeping
> 
> Known issues:
>   - This only supports one set of callback hooks, meaning that this only
>     works if there is one type of USB controller in the system.  This
>     should be changed to be a per-host-controller interface instead of
>     one global set of callbacks.
> 
> Signed-off-by: JaeHun Jung <jh0801.jung@samsung.com>
> Signed-off-by: Oh Eomji <eomji.oh@samsung.com>
> ---
>  sound/usb/card.c     | 119 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  sound/usb/card.h     |  20 +++++++++
>  sound/usb/usbaudio.h |  45 +++++++++++++++++++
>  3 files changed, 184 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 3769622..bd59311 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -117,6 +117,117 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
>  static DEFINE_MUTEX(register_mutex);
>  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>  static struct usb_driver usb_audio_driver;
> +static struct snd_usb_audio_vendor_ops *usb_vendor_ops;
> +
> +int snd_vendor_set_ops(struct snd_usb_audio_vendor_ops *ops)
> +{
> +	if ((!ops->connect) ||
> +	    (!ops->disconnect) ||
> +	    (!ops->set_interface) ||
> +	    (!ops->set_rate) ||
> +	    (!ops->set_pcm_buf) ||
> +	    (!ops->set_pcm_intf) ||
> +	    (!ops->set_pcm_connection) ||
> +	    (!ops->set_pcm_binterval) ||
> +	    (!ops->usb_add_ctls))
> +		return -EINVAL;
> +
> +	usb_vendor_ops = ops;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_vendor_set_ops);
> +
> +struct snd_usb_audio_vendor_ops *snd_vendor_get_ops(void)
> +{
> +	return usb_vendor_ops;
> +}

This is the function you need to fix up, and add proper reference
counting to, in order to solve your "this breaks with multiple USB
controllers" problem.  So this really should not be all that difficult
of a task.  Why has it taken years to do so?

thanks,

greg k-h
