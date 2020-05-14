Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 747231D3198
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 15:44:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DCA8167E;
	Thu, 14 May 2020 15:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DCA8167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589463885;
	bh=gjUlD/lRnqEmJx87EdZHbW6yAizeTdTaFklB0owA6lQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UYfaHmwFUfhZzevjmJPuTRxJKofzj+JiCvlQAK/DT+dTgaMCKLhlircgF8Vq/noZP
	 PWOgx7JveZ5EOhMyKtHMenifA8ydgo4OZm5q3g67E+8/xcTjhuoZ9R08TgYcJTni9F
	 YDa49vBoIHlT0xCHzRZ/tWiDZ9IuqQ1kfXTSLbk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B1F1F80158;
	Thu, 14 May 2020 15:43:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 209E8F80158; Thu, 14 May 2020 15:43:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8224DF80101
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 15:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8224DF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SLTbnJtf"
Received: by mail-oi1-x230.google.com with SMTP id 19so24543560oiy.8
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 06:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gjUlD/lRnqEmJx87EdZHbW6yAizeTdTaFklB0owA6lQ=;
 b=SLTbnJtffgqgcngdxn06ZHmxHp0dxStSZM0h4LgdbyH5vStAba3RGu4HLooR27spJk
 q02Rn7JOA1QCzwn5O7jMbUwHi1TzPFtLoe/anvQjozBJ2xn9Ox0E5/zCXyc5QUjpnC5z
 tt8n+LRwyZqtdrX9/gQ2dmiMn06V4GIJ6cc0ZDGjYoNarzXoA9v8Ca6W+WlvmSAW2Obu
 y1M3c90XOf7C+AjfNb+TJZgXFPAWcVthjwINfaeXdDyLOjiMipXvVbJdYaBiGHE//eAg
 KtiR7h4Rs2iaRqpWpsYrJDzRdewyWE4eQE0u+2sQfEtjb4I4Gi+1VbKO9ogzfMs9EPXQ
 gYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gjUlD/lRnqEmJx87EdZHbW6yAizeTdTaFklB0owA6lQ=;
 b=mz31sY2RkBu5Jd7uhiry145U9idpuNuzek7udyT3aUhIZCItarVvgKo9WxNFlu8rc9
 WIslrYQv6HDcUpaZVfTYlDJtOxipQGRd0k7bmqcouO4wN/jOtIh13fBczOFEGDRW0fpj
 IxaktgY0aQdouBkh8rKeeEwhGNp7V4XEjpR2n6Q6+6QvPFQ0nWTC0xI/ZqWVGgD+eFSG
 bvnstgf+JmdSaW4joYvKeRDC7JAkznjmAvAyQGEnCmeUWQP0tFbRarfmj0B9CWHP4cns
 cnYUQdZmRBRnarwdkqJDe1V7HxJX1Ofi5JHu8VULV4EmtS1gxEgKfFTyBzyTvJ9wwpEu
 gvOw==
X-Gm-Message-State: AGi0PuZVySh8QlRLvKZS/BIWEK0YmYY86vpeq44MCcgMXlVwVGK5XCFG
 cjHk62vsJY0pPnchP7W28NYHMOTPMmoY5gBEDAU=
X-Google-Smtp-Source: APiQypL1zD4vVMSFeXn2iXspdTdkoGitfCmSknBPAOcwWQ8kuxnzLGLFJm44lBmtFBKQp/+RCjKvDetd7ur11GamiOA=
X-Received: by 2002:aca:cc0d:: with SMTP id c13mr22529645oig.125.1589463768470; 
 Thu, 14 May 2020 06:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY=qRRFV4SpNO5pb9vF=U95dbA_gN2ngP+vm34884NMk5q8gQ@mail.gmail.com>
 <bb16e374-3d9f-427c-8470-3542dc697fdb@www.fastmail.com>
In-Reply-To: <bb16e374-3d9f-427c-8470-3542dc697fdb@www.fastmail.com>
From: Subhashini Rao Beerisetty <subhashbeerisetty@gmail.com>
Date: Thu, 14 May 2020 19:12:35 +0530
Message-ID: <CAPY=qRRDCqdOOhV2TkyuBV7N-ab7e5110ZQ4u6cfT5dQk=TVnQ@mail.gmail.com>
Subject: Re: sound over USB
To: Sid Spry <sid@aeam.us>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 kernelnewbies <kernelnewbies@kernelnewbies.org>
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

On Wed, May 13, 2020 at 8:53 PM Sid Spry <sid@aeam.us> wrote:
>
> On Tue, May 12, 2020, at 11:43 AM, Subhashini Rao Beerisetty wrote>
> >
> > How do I use it for playing and recording an audio?
> >
> > Basically first I want to gain knowledge on set of test cases I can
> > run on ALSA and then learn ALSA kernel modules stuff including
> > snd_usb_audio mdule.
> >
> > So please guide me by providing related documentation/Steps.
> >
>
> Hi, searching for an ALSA tutorial will get you far. However on a modern Linux distribution you will likely want to target pulseaudio. There are other libraries like RtAudio or PortAudio that may be easier to use and are cross platform.
>
> ALSA seems to give the most reliable results when enumerating audio devices. This can be done when pulseaudio is installed. The pulseaudio results are harder to interpret.
>
> In my experience, and not necessarily targeted at you, I have experienced massive difficulties getting RtAudio and PortAudio working in a reproducible way. ALSA is the most reliable but an unusual configuration, and pulseaudio is a hot complicated mess.
>
>
> For what it's worth, the sound API on Linux is so pointlessly complex that I have, in the past, created a custom USB driver to avoid going through the sound API. It was easier to use libusb and get raw samples.
Great. Does the custom USB driver is available in public repository?
