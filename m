Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9124FAAEA
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Apr 2022 23:12:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21594174F;
	Sat,  9 Apr 2022 23:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21594174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649538769;
	bh=ZG+nrpK0ofAyEtIlM/ZLY0fJO4koqwruohvZHNTQYA8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nfRvYwxXOttFxrmD14eNUYiR4b+6b1M9YuBOTfO0athm+gKWkC+UZShDcQU9HhuQM
	 gSMOhi/1Vl+04tw8x6+K2cQHnAHMb4KK7Lz9uZZVkXn6bd/wEw/ehA7m9BK8stC01B
	 VNc5WdWCL5+VGnp94ed+NXh2p6Lw7lVzBHwsXIfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8395FF80054;
	Sat,  9 Apr 2022 23:11:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2FD4F80155; Sat,  9 Apr 2022 23:11:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EF93F80128
 for <alsa-devel@alsa-project.org>; Sat,  9 Apr 2022 23:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EF93F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="leLIw06v"
Received: by mail-ot1-x331.google.com with SMTP id
 o20-20020a9d7194000000b005cb20cf4f1bso8600781otj.7
 for <alsa-devel@alsa-project.org>; Sat, 09 Apr 2022 14:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KCch/UKe7kGyOyYjUl6SdJu9W0yofdXirGShYJwOYh8=;
 b=leLIw06vRLmgm869kUR7xqzPUQhKXsVsOzn+Yl7UVKFyzq7rl3CLplss1BSVqk8tvO
 ZhXCAgnLfExj78wAC1M6p0EI7iVOFth5f1iC27g8ufsiRuSwXgFrRhBFRkR17LlwO25U
 hSuWpJoUnhzgAWFsTkCpBq8UR2F/CuogvCln/k9RtaZs+Wc4vW+X1wNJcmOAIRLG1tyn
 JKkhYzUHi5NDLBnxQv5xNDfJv+L6DAOcazfBainIHtN3qoLTpk+cQgVyQC3m1/gTvn0q
 n1fMywRrgWHLHd8vJRxlAtJoVL6TLsHARF7FC42WRa6bVfPnCBNy337wVi7B2TcxuyoW
 lLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KCch/UKe7kGyOyYjUl6SdJu9W0yofdXirGShYJwOYh8=;
 b=Xv7SeZFbY2EVB9bqJD6wtTtfja4G93wTRmQCHqVt2dMU8sfUwx2Ds4Ww5KapsvkTnd
 eWKFqckQFR50p8w2MZgeNcs2Bpl7ASPZs3fdu2eDG68CvoDwMz1WhSrW5ZtFn9zj0YN6
 6e53DSESMAf08Gj1GO5KzuLAnVXnXBtvPPb1Q6kZuPOyAW1j6FvVkq75QiEEARhvoVF8
 jvdBiHa0csOFWeMxNk719s9jqsCFIM1GoJK4L4iePLw5TddJTxEpt5ilNTCXsCHuwLgo
 InSIwpQ1eAwVnhQ7zg4wtTKFM1RKNutA0anc/altR9et53RtIJAjpKU+Tzumpy1fj2TC
 xs9A==
X-Gm-Message-State: AOAM532D5lcxMQaTfwmzDGinofXZydaFo6cQRF6ttPjGSHKt4HedGabF
 PQtdus+G0VojNyvsMTQEdzU=
X-Google-Smtp-Source: ABdhPJwynbnlLx+8Rgs/BZF537U6X25yA8Kl8im5zXrX6QmAlkvcIS0BJqiBrIA5AhpRO7BpigS6kA==
X-Received: by 2002:a9d:6b12:0:b0:5e6:bc04:ea2a with SMTP id
 g18-20020a9d6b12000000b005e6bc04ea2amr4095133otp.119.1649538698689; 
 Sat, 09 Apr 2022 14:11:38 -0700 (PDT)
Received: from geday ([2804:7f2:8006:103:60b1:f833:388a:391])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a4a9e94000000b003291f6ac4b2sm9348223ook.28.2022.04.09.14.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 14:11:38 -0700 (PDT)
Date: Sat, 9 Apr 2022 18:11:47 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: usb-audio: Increase max buffer size
Message-ID: <YlH2k2GCb+R7VT3w@geday>
References: <20220407212740.17920-1-tiwai@suse.de> <YlHuQWqGM+3T3HUP@geday>
 <dee9ff0a-4d99-1ae3-4f37-15107ab40637@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dee9ff0a-4d99-1ae3-4f37-15107ab40637@perex.cz>
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

On Sat, Apr 09, 2022 at 10:43:13PM +0200, Jaroslav Kysela wrote:
> On 09. 04. 22 22:36, Geraldo Nascimento wrote:
> > On Thu, Apr 07, 2022 at 11:27:40PM +0200, Takashi Iwai wrote:
> >> The current limit of max buffer size 1MB seems too small for modern
> >> devices with lots of channels and high sample rates.
> >> Let's make bigger, 4MB.
> > 
> > Hi Takashi,
> > 
> > I did some math and 4MB is still too little for some extreme hardware
> > like the Behringer Wing, which is USB 2.0 by the way. According to my
> > calculations, at 192 KHz and 48 channels, even with this 4MB patch, we
> > would still have only 151.7 ms of buffer for the Wing.
> > 
> > Therefore my suggestion is to expose the MAX_BUFFER_BYTES as Kconf.
> > 
> > Do you think this is plausible?
> 
> I think that much better behaviour may be to calculate and limit the max 
> buffer size at runtime depending on the max channels / rate / sample bits 
> obtained from the USB descriptors by default.

Hi Jaroslav,

Yes, I agree, your approach seems to be the most cost-effective way of
dealing with extreme USB sound hardware, plus if it's calculated at
runtime the users won't need to recompile their kernels for new devices
and the whole thing is painless from the perspective of the end-user.

> For standard hardware, those big 
> buffers do not make much sense and there's usually a mix of the USB sound 
> hardware in the system.

That is true, thanks for pointing it out.

Thank you,
Geraldo Nascimento

> 
> 					Jaroslav
> 
> > 
> > Thanks,
> > Geraldo Nascimento
> > 
> >>
> >> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> >> ---
> >>   sound/usb/pcm.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> >> index 6a460225f2e3..37ee6df8b15a 100644
> >> --- a/sound/usb/pcm.c
> >> +++ b/sound/usb/pcm.c
> >> @@ -659,7 +659,7 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
> >>   #define hwc_debug(fmt, args...) do { } while(0)
> >>   #endif
> >>   
> >> -#define MAX_BUFFER_BYTES	(1024 * 1024)
> >> +#define MAX_BUFFER_BYTES	(4 * 1024 * 1024)
> >>   #define MAX_PERIOD_BYTES	(512 * 1024)
> >>   
> >>   static const struct snd_pcm_hardware snd_usb_hardware =
> >> -- 
> >> 2.31.1
> >>
> 
> 
> -- 
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
