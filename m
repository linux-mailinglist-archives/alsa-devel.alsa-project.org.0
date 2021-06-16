Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 756DA3A9634
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 11:31:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA1571677;
	Wed, 16 Jun 2021 11:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA1571677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623835916;
	bh=nrfbYjfulZoAPaUf06R8qWjrWQRQRK0shPKxqFHChZ8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gHMWXKeySQc7/7ZgcZvI6A+ewEiDK2nbK7Jgoc8o/6JgxwOniP81L+DV4QMX9UhPl
	 rhr70y5rlJ1W4hhNjoM7rp4+ocMWe1r+oo8LW5h1WUp3DyFv93sDLt8koVzpmhNoyD
	 IIUN1PNU4PNpKhLjDDEyes/gMqwyWc4WDVR6zaeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E7E7F80424;
	Wed, 16 Jun 2021 11:30:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11C56F80423; Wed, 16 Jun 2021 11:30:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF541F8028B
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 11:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF541F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="xudoE7cL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 59F67611CA;
 Wed, 16 Jun 2021 09:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623835814;
 bh=nrfbYjfulZoAPaUf06R8qWjrWQRQRK0shPKxqFHChZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xudoE7cLEMoRRo8mEPJY4STJdULAnwguMtuX0NnvGBLS1tcFa+wPRebbUhss7HUbw
 d0XrmG+sDITKRKitnXl2DpdsxQUjL5LzAQQMT0iukeVWr9xsQNmnGZGPPWItIJzMbs
 x5zyIwgdrISLtZXL8+poI0pkDG3M1ZNtmiRRfJpY=
Date: Wed, 16 Jun 2021 11:30:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daehwan Jung <dh10.jung@samsung.com>
Subject: Re: ALSA: usb-audio: Fix rate on Ozone Z90 USB headset
Message-ID: <YMnEo73bQt+mvEXn@kroah.com>
References: <CGME20210616091516epcas2p2111c9b941d0e60fb0a6ae9646fb80d26@epcas2p2.samsung.com>
 <1623834063-108482-1-git-send-email-dh10.jung@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623834063-108482-1-git-send-email-dh10.jung@samsung.com>
Cc: Lukasz Halman <lukasz.halman@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
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

On Wed, Jun 16, 2021 at 06:01:01PM +0900, Daehwan Jung wrote:
> It mislabels its 96 kHz altsetting and that's why it causes some noise
> 
> Signed-off-by: Daehwan Jung <dh10.jung@samsung.com>
> ---
>  sound/usb/format.c | 2 ++
>  1 file changed, 2 insertions(+)

I am not the sound/usb/ maintainer, so I do not know why you sent this
"To:" me.

Also, can you resend and add a cc: stable to the signed-off-by: area to
let this get backported properly?

thanks,

greg k-h
