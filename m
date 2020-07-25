Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2846322D545
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jul 2020 07:50:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C01C168A;
	Sat, 25 Jul 2020 07:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C01C168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595656237;
	bh=DpwtEy6sOMsNxwTeeKHQRNVX06XPQPg+rvgHwtaGcYw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZGRn5EEgr2Xm47rugVP9eEDAIqKFHm6ttUS/D+UkR4AGqKnWY4onJ2P3hZMaTIHwc
	 1s+mIPnnm461ENn5J3k9RzQ9/gHrISfb8iuLHkN53WC2z6MrKNSc3xOLxWJE1sdJ3t
	 BWIBIAsrlrpQ+ALqkTBAGdw+wyzkbsC0CiHKkcyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B12A4F8020D;
	Sat, 25 Jul 2020 07:48:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55268F80212; Sat, 25 Jul 2020 07:48:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BC32F800DE
 for <alsa-devel@alsa-project.org>; Sat, 25 Jul 2020 07:48:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BC32F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GX6NrcPZ"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0F432065F;
 Sat, 25 Jul 2020 05:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595656124;
 bh=DpwtEy6sOMsNxwTeeKHQRNVX06XPQPg+rvgHwtaGcYw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GX6NrcPZmMyqL+AUc//69uSY/N8aM4DXZDsz/B1blMZAd5HSHuXrbeg2rBMizdCNF
 p3vM5dnRQrcZ0Wh9Tq4FFA8nqiYWxH5jqkZtR6f7mgStB69s7MnS2w8APx9Ne6ZkZm
 muJ8te/2zG6qkbNvkz3LOlzromIPIb6RPSUpj7zY=
Date: Sat, 25 Jul 2020 07:48:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: penghao <penghao@uniontech.com>
Subject: Re: [PATCH 14216/14216] ALSA: usb-audio: This patch for prevent auto
 wakeup from s3 trig by usb disconnect signal from Lenovo Thinkcentre
 TI024Gen3  USB-audio.
Message-ID: <20200725054844.GA1045868@kroah.com>
References: <20200725040155.27648-1-penghao@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200725040155.27648-1-penghao@uniontech.com>
Cc: alsa-devel@alsa-project.org, "penghao@deepin.com" <penghao@deepin.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, phz0008@163.com
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

On Sat, Jul 25, 2020 at 12:01:55PM +0800, penghao wrote:
> From: "penghao@deepin.com" <penghao@deepin.com>
> 
>  TI024Gen3 USB-audio is controlled by TI024Gen3,when TI024Gens
>  enter sleep mode, USB-audio will disconnect from USB bus port,
>  so disabled the /sys/bus/usb/*/power/wakeup Fixesimmediately
>  wakup form s3 state

Why the indentation?

> 
> Signed-off-by: penghao@uniontech.com <penghao@uniontech.com>
> Signed-off-by: penghao@deepin.com <penghao@deepin.com>

We need a name, not just an email address.

And where are the 14215 other patches in this patch series?


> ---
>  sound/usb/card.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 2644a5ae2b75..969c3809e051 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -640,6 +640,12 @@ static int usb_audio_probe(struct usb_interface *intf,
>  		}
>  	}
>  	dev_set_drvdata(&dev->dev, chip);
> +	/*
> +	 * ALSA: usb-audio: Add prevent wakeup from s3 state trig by lenovo
> +	 * ThinkCentre TI024Gen3 USB-audio
> +	 */
> +	if ((usb_id->idVendor == 0x17ef) && (usb_id->idProduct == 0xa012))
> +		device_set_wakeup_enable(&dev->dev, 0);

Shouldn't there be a quirk for this type of device that can be used
instead?

thanks,

greg k-h
