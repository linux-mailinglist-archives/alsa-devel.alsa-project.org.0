Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B43FC759684
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 15:22:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE1281F6;
	Wed, 19 Jul 2023 15:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE1281F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689772929;
	bh=nhDtT66urv6j+1iAMm5alY4A4UU+8lPBsE5nNPyABDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HcOn5CKEjg0b7dOENICkautcZiTjrktzO/f931kMGqhN0zUVr62kOrON5aQEleVMI
	 nCzPnw2lIpEi5Ky7ZHBLIhvVBd1a+ySsyw5z7FE5up5/mHEVWCuk+J4C2y+foJEgnY
	 WCfUUR04wtfo9DTvXZY7EAD/GySxy1coj4WNXA1E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBF58F80494; Wed, 19 Jul 2023 15:21:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73143F8032D;
	Wed, 19 Jul 2023 15:21:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 824F8F800D2; Wed, 19 Jul 2023 15:21:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40413F800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 15:21:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40413F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=ae6fRop9
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6b9defb36a2so2026325a34.2
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jul 2023 06:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689772866; x=1692364866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ql6hMIj8o/PVbOQtvLSuTczzzXne3ShLX5+9XETdRV4=;
        b=ae6fRop9/rqf11JSBIjcGGu9Fpl3xv3a7Ksf4lWmsfEo5dz1Q0fAnYJRsM+U5AlSIG
         5agmc7KfOjMqrFqYMMT+RaM9oo4rM0kHN++NB89waCl6t5CTSgQZivC4VCyW+RhznRLS
         0TbBwZZY3g97Cg6DcRz5LUxDrEj8RfAuY4F6REpYUEtvWMEVTUgq1gimYGrcrVLsVlsw
         dXIahwQStAqVu3f5YArstC+SRYDecHCTjkI/3zKB2/ywckoXhl57i/vOP9SVDk5npKDe
         tJFNu8RLtciu2FQg7w3CQQ784GiLsGOhe1qQGqqe1lo2ZwBBPMugNBxsvZpuWcOaDmME
         Y8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689772866; x=1692364866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ql6hMIj8o/PVbOQtvLSuTczzzXne3ShLX5+9XETdRV4=;
        b=TI8NcoP0oc5DrFRm0i8WAp5nRclN2F3384r6bASKLH0265ckstWQpP11Ee0OtpJlZo
         mz+VlaEb1F9rWip9E/zHgEB9mlf6MZra2SrTsbmnsIikFSNieelq392+N4JBvu057JMG
         meGotzD7KgFGXQ9QWPa1Ahwj8BRYHcZXpzAVyKySQqMVadrTfcJdEoaix1rPn/7x1UkN
         HU4M6AHnywxJqCDLWIONu9FRe5qEc/pe64H6/myrrafWEWqP0xrfrzSgxMA10/C9SMDn
         TuSUd5lJ3OupVfG1dveCCftIBMPNNWEE3P9YdrUm72sWcilnqrWaJxaKQZGAnCQhtBat
         JOAQ==
X-Gm-Message-State: ABy/qLY85vz165759AezZ6NfM9khldQL3S7r72lph1UDwCSSstmaghR8
	tLHpZnsZPmwCFSFQeNwbm+o=
X-Google-Smtp-Source: 
 APBJJlG5c61qqprqfXiuTXgkvvpo4AR+QmpvS6HMP+5nz//Y3q/5XZh7jEVNSEHzRYJh1swqpvAlYA==
X-Received: by 2002:a9d:6c02:0:b0:6b7:53df:1db3 with SMTP id
 f2-20020a9d6c02000000b006b753df1db3mr17012512otq.0.1689772865664;
        Wed, 19 Jul 2023 06:21:05 -0700 (PDT)
Received: from geday ([2804:7f2:8006:a438:f194:617f:f5b4:cc70])
        by smtp.gmail.com with ESMTPSA id
 r24-20020a056830135800b006b98fe3b5c9sm1754114otq.1.2023.07.19.06.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 06:21:05 -0700 (PDT)
Date: Wed, 19 Jul 2023 10:21:01 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Ico Bukvic <ico@vt.edu>, alsa-devel@alsa-project.org
Subject: Re: Fwd: Odd issue with ALSA connecting directly to HDMI audio output
Message-ID: <ZLfjPcIRb0Bn3KlY@geday>
References: 
 <CAJrgGbZfPYHhf+p1TJO_LQe=pxkxDtAMPsY6sXOh1xVxq0b69w@mail.gmail.com>
 <CAJrgGbbg-WQ1iAqsG9fe559FvOQUz-hmxj08wcP1oDPTXUyeqQ@mail.gmail.com>
 <ZLbH+qC2j9FQ5pTE@geday>
 <ZLddxy5Bxgudk9vi@geday>
 <CAJrgGbbe5rmCS0UK7_Qc=+PR1LCBSU-oRRX2zB_Ljsq2J15oFw@mail.gmail.com>
 <87r0p4l3x7.wl-tiwai@suse.de>
 <CAJrgGbZm+haEO-_mpu6Sf45UPRYzuNZzVxQT27ZzAfH7VWPoHQ@mail.gmail.com>
 <87cz0o13e7.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cz0o13e7.wl-tiwai@suse.de>
Message-ID-Hash: 4HJHKI7TJ4JGTCJH37K7CZK37FWSDX74
X-Message-ID-Hash: 4HJHKI7TJ4JGTCJH37K7CZK37FWSDX74
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4HJHKI7TJ4JGTCJH37K7CZK37FWSDX74/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 19, 2023 at 02:39:44PM +0200, Takashi Iwai wrote:
> On Wed, 19 Jul 2023 14:27:21 +0200,
> Ico Bukvic wrote:
> > 
> > 
> > Thank you, Takashi.
> > 
> > On Raspberry Pi 400 (one with built-in keyboard, although any RPi or Linux
> > computer with HDMI monitor with loudspeakers will do), open pd-l2ork (a
> > variant of pure-data available at http://bit.ly/pd-l2ork; pure-data also has
> > this same problem) and enable DSP. Do the same after changing audio settings
> > via the Preferences window (Edit->Preferences), where you can switch among
> > backends (ALSA vs Portaudio, vs JACK; JACK does not work with any setting). If
> > you have proper audio settings (0 in, 2 out, and a supported SR, r.g.
> > 44,1kHz), you will hear the buzz, and will also hear the desired audio
> > produced (e.g. by running Media->Audio Tester) faintly, with buzz bring at the
> > forefront. Or, you will hear everything OK (default Pulse settings), or
> > nothing. ALSA and PortAudio settings are default Raspbian(RPi)/Ubuntu
> > (desktop). Thank you.
> 
> Well, the question is how the ALSA PCM device is opened, how
> configured and how played.  As Geraldo already suggested, VC4 HDMI on
> RPi has a special format with IEC958 encoding.  Also it has IEC958
> status bit setups.  So, for example, if you'd need to play a normal
> PCM stream with aplay, you'd need to open the device with "hdmi:$CARD"
> device -- then the rest is done in alsa-lib's plugin, and that's
> almost equivalent with what PA does.

Hi Takashi, thanks for taking Ico's report. Perhaps the right
configuration that he needs to use aplay could be:
https://github.com/alsa-project/alsa-lib/blob/master/src/conf/cards/vc4-hdmi.conf

That is, if I understand correctly?

Thanks,
Geraldo Nascimento
