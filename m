Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDE046A6A6
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 21:15:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 093CA222A;
	Mon,  6 Dec 2021 21:14:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 093CA222A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638821718;
	bh=CtmMGncifZRdTw+ZgEH6bFySCtb5jQvlORnJQu2c/7w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WJ/0x8rGKomv6npALWy/wR73mrfuXuiEjpRC3298LfHT6HUBZzVdh5cvjkk7x3ax7
	 quxekNe5FzN97WQPPSNfTcJqeMq1akZafhjd+uUI2+BhNrCVBYgtDCuXxQhcs1qINA
	 KhvPOR30oIdR8CZ9/xo7oJLmP3Xz3NbsCe0uJ1Hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 556B1F804ED;
	Mon,  6 Dec 2021 21:14:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9316AF804EC; Mon,  6 Dec 2021 21:13:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11B22F80118
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 21:13:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11B22F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jeeXkZan"
Received: by mail-ua1-x92b.google.com with SMTP id p2so22052822uad.11
 for <alsa-devel@alsa-project.org>; Mon, 06 Dec 2021 12:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wVkLNPOLCoBWVuso40Oxym7T+40LGMNkPvTBNlIihiY=;
 b=jeeXkZanlMTn2pq2nun1Kp+chDM7l4kVw/7dWeonjXH3AzfHs6VIXPcEjzABa7T8XL
 aqho5I3ljpGYRSElKtDjNI8hDuHCOTczJmBYoI9vRnfAkL8ATHyu+/Fa+2SVo1S8f6OO
 tFWcb22EhE+RX35s6VRIXwZNG5ToLmOWKPyn/SOYZNr3lxl3WKaNWJIwd6yFyNYRMOGy
 CJL6aWlL/JPn61kk+xevRrebVlw/Jus1tcm8RoopgHOM9bPGazLwqh2ItCr+0Kpq96vF
 MWRsyLBLTwDCGycyBZ/VH7naB2mz1V2899jiPuFSilvMh11CRGDKikBC3ozMvkL+bFQi
 ieRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wVkLNPOLCoBWVuso40Oxym7T+40LGMNkPvTBNlIihiY=;
 b=bdyudNek12zk1jkVmrKSuShcn+TNgXN4Q5/aUJsbA3Xo/zs7hFmv8grs5JSh1+C6LE
 4GvjmwU3tWB4yWV/+yY/2k050sNPtVIA5r7KcgCoaXxAN/3v6oL8mccQArjQBHCtG5ha
 qb60yck2sAi3lOxSl/8/lvG6637itIvgYttFVPWW4173zJ51P0NlIzgk9DQOljKjJayR
 wKipndw7oXF3F+Tpxr+y9JjKuQZSwqw8HH6rk/OSPIPJcw+/FdBguRC/1HSVgqxD7Uzu
 aif31nYG0GOHkU1sUpZ4KtIdGnSQYgFY7+sD9a41lcQsbk1xubEL9nAK0krX2b2/BTII
 +Jzg==
X-Gm-Message-State: AOAM531XvG1OmoPqdN3ZehtEzOLnFGfjl3opawwDiTp0w/R7C3Pr0EoU
 IFqTyY+KOIJYiZU2aaXFqp/BWfHrGbg=
X-Google-Smtp-Source: ABdhPJx+QmTVS1vpfvr/F1VMtHLd0DjgKUboWYD7YzOvwVpToladTTgLXbnRjFSOlHvea4gesUemLA==
X-Received: by 2002:a05:6102:736:: with SMTP id
 u22mr26287252vsg.21.1638821629907; 
 Mon, 06 Dec 2021 12:13:49 -0800 (PST)
Received: from geday ([2804:7f2:8006:9290:f481:1c3e:161e:f26d])
 by smtp.gmail.com with ESMTPSA id y7sm4966834uac.3.2021.12.06.12.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 12:13:49 -0800 (PST)
Date: Mon, 6 Dec 2021 17:13:49 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Theodore Kilgore <kilgota@att.net>
Subject: Re: GLK board with ESSX8336 sound. Would like to get sound working
 on this system
Message-ID: <Ya5u/WxSb5D1g2Ju@geday>
References: <0a98323-e429-ea9b-fb8d-6eceddd9215c.ref@att.net>
 <0a98323-e429-ea9b-fb8d-6eceddd9215c@att.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a98323-e429-ea9b-fb8d-6eceddd9215c@att.net>
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

On Sat, Dec 04, 2021 at 05:35:52PM -0600, Theodore Kilgore wrote:
> 
> Hello,
>

Hi, Theodore,

> I assume that someone is already working on this but I do not know 
> who. I have some experience with coding and kernel stuff (see 
> drivers/media/usb/gspca). Not experienced with doing sound support.
> 

There's a Windows driver for the ESSX8336, isn't there? What I'd
do is I'd pull out Ghidhra and try to reverse engineer it...

If you choose to do it this way, be prepared to spend long stretches
of time elucidating what struct is that pointer math pointing out to,
etc.

Once you have plugged in all necessary information into Ghidhra, that
will surely be missing because the driver most likely was stripped of
debugging symbols, you'll still have to port it from Windows to Linux.

Nightmarish for sure, sorry if I can't propose an easier route.

Thanks,
Geraldo Nascimento

> Theodore Kilgore
