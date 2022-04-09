Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B691F4FAB0F
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Apr 2022 00:25:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51580174D;
	Sun, 10 Apr 2022 00:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51580174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649543134;
	bh=RUuRD6V8/XqfvCNAv+MggW35TGRulqWorCU8SYDVksU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lpOFkKxbVj791aWhEcBejMDagt0uKktcCld224cufKqIwI3o3KIq+sv4BDT51xA2W
	 wuUxpoTzHCEWPgfBJJWvydjJ9G1qXz1e9YKSvmaEDAJbIrqM2ZJMmQyQGoJJ9qxPZf
	 xR9eM2jpeT0SKjP/+1OuHuXaavg5WiTqYBYVmEVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7E5EF80054;
	Sun, 10 Apr 2022 00:24:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD239F80253; Sun, 10 Apr 2022 00:24:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 520E7F8011C
 for <alsa-devel@alsa-project.org>; Sun, 10 Apr 2022 00:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 520E7F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Uj9AOvO1"
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-e2442907a1so12994406fac.8
 for <alsa-devel@alsa-project.org>; Sat, 09 Apr 2022 15:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CwYnrhN3dE6jLLfm3963KeoGySYQ9Lj4YmkSpF4Gn6A=;
 b=Uj9AOvO18aHUMkL4Me4vMT/HVsQYDrfvZW5poYc/HBsPFA1iDFJKXaZ1bYTuDPw+cR
 GubkAtknXRz2A2F+O4i1jUbc/TMTEXsd3n2OxRKH+dCj/KKOvXVdLZYXbgnitoMXXPj1
 6Y4uFWGdr4SkWbW1pC/aujU0wFhoQfK7nHF7lSzDjaJqJpBQmQPYwqLWiWYYq3dI1lMp
 KSNB1OtpNpC2DUNwJw5TSUhbwSj+IKE5EV6CYmafKcIq39T/WHIpOGYVli/WYfi53068
 xcQH1aoNXrk4T/PGC3l626WBGeHJGiuH0ScMg6WgT6dQkzT7dQLPTISP4TSLIjq5eLau
 HJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CwYnrhN3dE6jLLfm3963KeoGySYQ9Lj4YmkSpF4Gn6A=;
 b=d5cQ0RN1bXkL+vw5140wetFgIBB3NV4VxsPfV5JkMg97Acf7hBt6/ZQeUopXn9oR0i
 psPw7gFG8p41LOXL36maLvZuT4wI59WiVylffjDB56rdE/xZXMZMAG0/vurlTuzLNd6N
 UaQ6ttwnd8CXIjxpxceHyA8v89MC29dmza8ujqo1QijG5svQXZ9rre6zvAu2fafvV5BO
 U69F+aZUV5nsUnhpPnqgVt9WRepBxSFbabQvjOe+CwbVH8Fm9ZCUcvNKSlAGGg8NTi2Q
 J346q4OOO1A4H05fNZ2JcoVpWQM6XoQG03IXJyq7Hj90GnT88O1F7LU+F3L8pBl9PKqh
 C6RQ==
X-Gm-Message-State: AOAM5337/3QvECvix2AM3lT0XO7skGV2pmjnCceKXvE/yNWzPXCuUvU9
 KphA2eltjLID/QRF0bRHu2g=
X-Google-Smtp-Source: ABdhPJxjLU1eOpAC3TnuUnOhGEINr1lXThYubE7s45ntbrR1jK+jlaDmf7bBf3fNIWtOG+EcBYn7uQ==
X-Received: by 2002:a05:6870:580e:b0:e2:7e06:e785 with SMTP id
 r14-20020a056870580e00b000e27e06e785mr5346059oap.38.1649543062833; 
 Sat, 09 Apr 2022 15:24:22 -0700 (PDT)
Received: from geday ([2804:7f2:8006:103:60b1:f833:388a:391])
 by smtp.gmail.com with ESMTPSA id
 nd8-20020a056871440800b000e2b75759f1sm446551oab.38.2022.04.09.15.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 15:24:22 -0700 (PDT)
Date: Sat, 9 Apr 2022 19:24:32 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: usb-audio: Increase max buffer size
Message-ID: <YlIHoJwA5c7F35Kq@geday>
References: <20220407212740.17920-1-tiwai@suse.de> <YlHuQWqGM+3T3HUP@geday>
 <dee9ff0a-4d99-1ae3-4f37-15107ab40637@perex.cz>
 <YlH2k2GCb+R7VT3w@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlH2k2GCb+R7VT3w@geday>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

Hi Takashi and Jaroslav,

On Sat, Apr 09, 2022 at 06:11:54PM -0300, Geraldo Nascimento wrote:
> On Sat, Apr 09, 2022 at 10:43:13PM +0200, Jaroslav Kysela wrote:
> > On 09. 04. 22 22:36, Geraldo Nascimento wrote:
> > > On Thu, Apr 07, 2022 at 11:27:40PM +0200, Takashi Iwai wrote:
> > >> The current limit of max buffer size 1MB seems too small for modern
> > >> devices with lots of channels and high sample rates.
> > >> Let's make bigger, 4MB.
> > > 
> > > Hi Takashi,
> > > 
> > > I did some math and 4MB is still too little for some extreme hardware
> > > like the Behringer Wing, which is USB 2.0 by the way. According to my
> > > calculations, at 192 KHz and 48 channels, even with this 4MB patch, we
> > > would still have only 151.7 ms of buffer for the Wing.


This is wrong by the way. The Wing goes up to 48 KHz. They claim A/D
Conversion of up to 192 KHz but doing that sample rate though USB 2.0
would be exceeding known physical limits :)

Sorry about that,
Geraldo Nascimento

> > > 
> > > Therefore my suggestion is to expose the MAX_BUFFER_BYTES as Kconf.
> > > 
> > > Do you think this is plausible?
> > 
> > I think that much better behaviour may be to calculate and limit the max 
> > buffer size at runtime depending on the max channels / rate / sample bits 
> > obtained from the USB descriptors by default.
> 
> Hi Jaroslav,
> 
> Yes, I agree, your approach seems to be the most cost-effective way of
> dealing with extreme USB sound hardware, plus if it's calculated at
> runtime the users won't need to recompile their kernels for new devices
> and the whole thing is painless from the perspective of the end-user.
> 
> > For standard hardware, those big 
> > buffers do not make much sense and there's usually a mix of the USB sound 
> > hardware in the system.
> 
> That is true, thanks for pointing it out.
> 
> Thank you,
> Geraldo Nascimento
> 
> > 
> > 					Jaroslav
> > 
> > > 
> > > Thanks,
> > > Geraldo Nascimento
> > > 
> > >>
> > >> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > >> ---
> > >>   sound/usb/pcm.c | 2 +-
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> > >> index 6a460225f2e3..37ee6df8b15a 100644
> > >> --- a/sound/usb/pcm.c
> > >> +++ b/sound/usb/pcm.c
> > >> @@ -659,7 +659,7 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
> > >>   #define hwc_debug(fmt, args...) do { } while(0)
> > >>   #endif
> > >>   
> > >> -#define MAX_BUFFER_BYTES	(1024 * 1024)
> > >> +#define MAX_BUFFER_BYTES	(4 * 1024 * 1024)
> > >>   #define MAX_PERIOD_BYTES	(512 * 1024)
> > >>   
> > >>   static const struct snd_pcm_hardware snd_usb_hardware =
> > >> -- 
> > >> 2.31.1
> > >>
> > 
> > 
> > -- 
> > Jaroslav Kysela <perex@perex.cz>
> > Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
