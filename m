Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D10D4CF306
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 08:56:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C177171E;
	Mon,  7 Mar 2022 08:55:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C177171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646639779;
	bh=ftjiV6vEKk1X9wO1Fyhk7bmaXl5AeD+Ymy6D0UqL6JU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UqUnjQdwtAqwGV9S1k5hBW9rSajalVNrbqcV6QxlA1b7fRFLAXCzEMx0Y/fDuq9dV
	 O4MTm9ej79kRjtEDP4e8ZHxklKwzdZtbTRZUf0zjrC4hp/qViSAFXgRB/wiNRTRErT
	 CDtUMuk/0eX+PAz5ckzdyccoWG+60jBoDwtjOrbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C24AF8013F;
	Mon,  7 Mar 2022 08:55:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E21FDF800E9; Mon,  7 Mar 2022 08:55:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7507F800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 08:55:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7507F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="zqL/pDKC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1681BB81028;
 Mon,  7 Mar 2022 07:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698C0C340F3;
 Mon,  7 Mar 2022 07:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646639722;
 bh=ftjiV6vEKk1X9wO1Fyhk7bmaXl5AeD+Ymy6D0UqL6JU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zqL/pDKCeEvQ7qn1CKZllOJe/IJ2nUaGyioCKS6SSL4wRtU16ZzT7DfT8LYWSyrAy
 TqaUYj+b9YPi1kCyhX5rpP3dSGlR4EEjHR4JJuIw+XnRbmKcRMdBRfvbR3uEaCqK4K
 6jJJcGJT5cBn9H4GI9xAG4XmLS1BPQQOILLhyw0o=
Date: Mon, 7 Mar 2022 08:55:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oh Eomji <eomji.oh@samsung.com>
Subject: Re: [PATCH 1/2] sound: usb: Add vendor's hooking interface
Message-ID: <YiW6ZqnINsOSyN+z@kroah.com>
References: <CGME20220307022409epcas2p4a2955a746c87d66564556e18ab94845f@epcas2p4.samsung.com>
 <1646619720-97113-1-git-send-email-eomji.oh@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646619720-97113-1-git-send-email-eomji.oh@samsung.com>
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

On Mon, Mar 07, 2022 at 11:21:59AM +0900, Oh Eomji wrote:
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

Also, this is a non-starter, and not going to work at all, sorry.  Most
devices have more than one USB controller in the system, and we can
never accept changes that break that model.

Nor would you want us to, as it would break many Samsung devices...

thanks,

greg k-h
