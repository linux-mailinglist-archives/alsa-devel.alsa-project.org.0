Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C486CE571A
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 01:36:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 333FA18AD;
	Sat, 26 Oct 2019 01:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 333FA18AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572046564;
	bh=1ZSh1t31hAVpLDHv6mShG4n0aXHwDiqxT4xmgZDDGQc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mXDIgiXshZB7k+9x8mh4Y5GweCK3V4WvraBpDwGr9fPQhN608ibX6IKx0uoZgK5bX
	 g2dtrBBLcFIKcOD7diFkG8orXhO5Ih2jhgQRBGGy6IykT4pPaPJ08bkfTsjcbivEWY
	 XzY5vtYpDsAFKPXCN0xifTQy1uXTtojTYEVgGN/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AC03F8036F;
	Sat, 26 Oct 2019 01:34:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47B9BF8036F; Sat, 26 Oct 2019 01:34:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DB54F802A0
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 01:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DB54F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="T/ZeJde1"
Received: by mail-qt1-x841.google.com with SMTP id g50so5817013qtb.4
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 16:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zlPOQs6zM8VQu1dw9v+snKORjpgChv09a9rwUDSw9so=;
 b=T/ZeJde1K0W1trc92Ui1n3fiXvwBWeIVtMqHhq6pQkeH3Cbga7GUTxvdB5q3F77DHU
 w3iDygTok+VapabUBOz1FbV5etWXc/pds9epZV23WDA30u5lYk0iGlLAfnplC9ojAuCx
 lDigSPK5ZL4lrgv+DiO28JbpPy9Ftne6aoGqcz0XG8KtV61UUqowXwAk+hqwvjdeExMg
 9bT5W2yB0TOr6WHIvql0DGQdyHSKybixmiQwLIz4YmDZnsypAILTeMCa8Z5JnBmF9FFK
 cl/87HO0Hcca+aovgEbbC0Hl2PqYomDoJXsflUvhh3Av0oVm4IMmrbMobe7GsxdUvK/I
 ehJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zlPOQs6zM8VQu1dw9v+snKORjpgChv09a9rwUDSw9so=;
 b=FJB+/e3crCdPw3RD6anv3Nr8NzVEhAi76AWrfZ8wJEJFqnP7Vp7AjX9q2nsOqq6XcV
 WWSzoMYndzV++FgapNax9ayQMixga4QBPBKylhUaBwfwi51lEv25LZLixHBx04JjrEc5
 Ly4mHGpSmyRzaODJ1gLlB/pIO/dBFrdm+hZyNRJ80m6Q2d39Wv8NtwaZ2bg0+z0MI3nh
 MmEYDAsKQkwQLu4VQ1p7f+0LrPz2QEtPXNE+QouBpYx/XS4E0eVRSTy3697XhLO0q9/H
 zHDF6M5pvYHf/KNbg26PDDdvxAZfFsHNWrx5Dsq92fjrraNnrfPZU28QT5BSqGYAkxuo
 vx/g==
X-Gm-Message-State: APjAAAX25C+xPftZo5kc9wlMcUZqtsOKimAABHtv13L4RPV1vMIrR75u
 aG7f+1Xb6X6w2JzYUHCDlLaWc2/fbt3ddc5+eTBPQw==
X-Google-Smtp-Source: APXvYqxl7kFW5TJxiJ9i14P33R6UVpgE/2ruprbG5uTPXFCCm7q7tnbjYA/YujaU5aEjO3TsukutynUmRRqjY1KdN0U=
X-Received: by 2002:ac8:7052:: with SMTP id y18mr6179265qtm.24.1572046451828; 
 Fri, 25 Oct 2019 16:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191018200449.141123-1-cujomalainey@chromium.org>
 <20191018200449.141123-3-cujomalainey@chromium.org>
 <20191022161342.GI5554@sirena.co.uk>
 <CAOReqxiMMWjCnTS=bVBs-tvtfz1GSaHsoBf3PFFvpv000aPyOQ@mail.gmail.com>
 <20191022190122.GA5554@sirena.co.uk>
In-Reply-To: <20191022190122.GA5554@sirena.co.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 25 Oct 2019 16:34:00 -0700
Message-ID: <CAOReqxg==6MS1kQSJhjqZe9wOj+db1ssTWLONSLDK78=pxaJWg@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [PATCH v2 02/12] ASoC: rt5677: Load firmware via
 SPI using delayed work
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Oct 22, 2019 at 12:01 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Oct 22, 2019 at 11:28:53AM -0700, Curtis Malainey wrote:
>
> > You are right, I forgot to add that to the dapm paths, got distracted
> > by the race conditions I was fixing. I am thinking the best route is a
> > mux object that the driver turns on but has its route selected by
> > userspace to the various DMICs. Would that suffice?
>
> I *think* so - basically anything that just describes the DSP part of it
> and leaves it up to userspace how to route the audio into the DSP.

Turns out all the routing is available already, I was just forcing
DMIC L1 on unnecessarily. I was able to use DMIC L2 to get the hotword
working, but for some reason I can sound activation levels fluctuate
when I use the right channels but the hotword is never detected.

Example userspace settings to setup for recording form DMIC L1.

amixer -c 1 cset name='Mono DMIC L Mux' DMIC1
amixer -c 1 cset name='Mono ADC2 L Mux' DMIC
amixer -c 1 cset name='Mono ADC Capture Switch' on
amixer -c 1 cset name='Mono ADC Boost Volume' 2,2
amixer -c 1 cset name='Mono ADC MIXL ADC1 Switch' off
amixer -c 1 cset name='Mono ADC MIXL ADC2 Switch' on
amixer -c 1 cset name='IB01 Mux' 'VAD ADC/DAC1 FS'
amixer -c 1 cset name='VAD ADC Mux' 'MONO ADC MIX L'

I will send another patchset with the removal of the DMIC forced on
(the sync has to stay due to race conditions between dapm and the DSP
changing  write modes) and that return fix Cezary requested.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
