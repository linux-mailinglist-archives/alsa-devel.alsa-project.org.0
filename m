Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C80FA758C3F
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 05:53:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A4921F7;
	Wed, 19 Jul 2023 05:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A4921F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689738799;
	bh=OULYgaMIzvfsYlt7QIAm4kyDlQ87jdqlB7H5C+L+WvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dn3N6bYlfrzNCNaT7SFEXb7HXFCFLIX5C1wJ2Sjfzg4ULUATxH/fCUODj5NzWPv7y
	 dzgDTtvYHhLuABQpC29zmMkRFzuB6SezbZHTaYudK8MaYbX3nE3gCPYaTJChpcZd5q
	 FrsZJltMNkk/C/8/gKq3zyNuROHMMe5Sjfpbvrqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F43AF80520; Wed, 19 Jul 2023 05:52:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2844FF8032D;
	Wed, 19 Jul 2023 05:52:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9C4AF8047D; Wed, 19 Jul 2023 05:52:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8B67F800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 05:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8B67F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=p1BKvdPK
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-55e04a83465so4128139eaf.3
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jul 2023 20:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689738702; x=1692330702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Evxif49+CzbegNPBukfo/diCVfZGBSZ9qAnOArDBgv8=;
        b=p1BKvdPK3SaseEM20onu8q16NTW4Vn+Cvg172HDlnoslX+vb/NCBbIzK7op55jdPOJ
         MxigJS3Ze8di+un/RqL72rOHzZKTn1fR5BHu2TtR9h4RvW39x1q5PPgT42pGXxGCWqA9
         evnd36hc9u/UsNc36HFAg+XZOZJvi/EDPYEeFWTH1KG/LODEQ/HPt+pvffrUEO29ar58
         vN1E6ed6pMEtiPJd/Aj/T5gbrNONxPvNLnG0pqSqzo0P6UmckJsRUy02+KeQqR7AUCFC
         agn0A/OiAM5TiAJh6x6KPnqskvuRud6+mFb0dIE95LJn8M4yZ83WvMQXEWV+GaJ7htwC
         +wXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689738702; x=1692330702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Evxif49+CzbegNPBukfo/diCVfZGBSZ9qAnOArDBgv8=;
        b=hFtcLe/tDszUXoov4MOCB//BsaO0t49S7uqf5K0JG+iaxEdynXNtJGkQTVOdKci9RP
         GoILLm2nCBDtFbGkw53a9q8GtqZkcUbwwAI9f/kLOjOQN9b81T8eJa1n2SVBjuZFkIO8
         U7vSeYr/m4ms4ULbAcFscmEZUhgOhcDnbJu18bfOVGcnXKPC6vbCz6E69HhZ980yPZmi
         deaY7F5ODeLvL+N6W9keH4RLY7RLdqIS0EZ/yhcw3gbF8HZTX+w42nr+ItBidlRGqDgQ
         09zamP1Uhv0vjHFX+8dMICr088tUiW4YUk+uv3QYT3SHL40PbaeAIZY7daPe7mXbZF02
         xqgw==
X-Gm-Message-State: ABy/qLZK4pkSCBfMuDmTOmFWe3HaJjG/U/TYDvoVQETDwdIBoUu8MqR1
	z1uzzAyksCxx/bmqDGEJRKE=
X-Google-Smtp-Source: 
 APBJJlF4aBFXXADSD+kA269nkT9myklYpCE09nxbRcPZBX025B4nRy1oGuX697xApuxqPUVyDvqJcg==
X-Received: by 2002:a4a:5541:0:b0:566:efc4:e4fb with SMTP id
 e62-20020a4a5541000000b00566efc4e4fbmr3663101oob.4.1689738701712;
        Tue, 18 Jul 2023 20:51:41 -0700 (PDT)
Received: from geday ([2804:7f2:8006:a438:f194:617f:f5b4:cc70])
        by smtp.gmail.com with ESMTPSA id
 q7-20020a4aac47000000b005660ed0becesm1355051oon.39.2023.07.18.20.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 20:51:41 -0700 (PDT)
Date: Wed, 19 Jul 2023 00:51:35 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Ico Bukvic <ico@vt.edu>
Cc: alsa-devel@alsa-project.org
Subject: Re: Fwd: Odd issue with ALSA connecting directly to HDMI audio output
Message-ID: <ZLddxy5Bxgudk9vi@geday>
References: 
 <CAJrgGbZfPYHhf+p1TJO_LQe=pxkxDtAMPsY6sXOh1xVxq0b69w@mail.gmail.com>
 <CAJrgGbbg-WQ1iAqsG9fe559FvOQUz-hmxj08wcP1oDPTXUyeqQ@mail.gmail.com>
 <ZLbH+qC2j9FQ5pTE@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLbH+qC2j9FQ5pTE@geday>
Message-ID-Hash: 36D5D2G7KD3ZRTSHDIG4FL6NYI3LIJHY
X-Message-ID-Hash: 36D5D2G7KD3ZRTSHDIG4FL6NYI3LIJHY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36D5D2G7KD3ZRTSHDIG4FL6NYI3LIJHY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 18, 2023 at 02:12:31PM -0300, Geraldo Nascimento wrote:
> On Tue, Jul 18, 2023 at 12:22:35PM -0400, Ico Bukvic wrote:
> > Hi all,
> 
> Hi Ico and friends,
> 
> > 
> > I have a consumer-level setup audio question. My research project uses a
> > Raspberry Pi in conjunction with a small portable monitor that has built-in
> > loudspeakers that are to be used via HDMI connection. The goal here is
> > portability and minimal cost.
> > 
> > Curiously, when trying to connect to monitor's loudspeakers (via HDMI)
> > using ALSA, no matter what settings I pick, at worst I cannot get
> > audio out, and at best, get a buzzy sound whose waveform is in the attached
> > image. The sound is clearly periodic and impulse-like. It happens every 59
> > samples. Changing sample rate increases pitch, suggesting 59 samples remain
> > constant regardless of the sampling rate. When playing the actual audio,
> > you can hear it in the background, but this buzz is easily overpowering it.
> > 
> 
> Ico, just a wild guess but are you sure you are not capturing the raw SPDIF
> signal going through HDMI instead of Linear PCM audio signal?

Here's a comment from the VC4 HDMI driver:

 * HDMI audio is implemented entirely within the HDMI IP block.  A
 * register in the HDMI encoder takes SPDIF frames from the DMA engine
 * and transfers them over an internal MAI (multi-channel audio
 * interconnect) bus to the encoder side for insertion into the video
 * blank regions.

And there's this perhaps closely related old issue with the vendor
kernel and Android:
https://github.com/raspberrypi/linux/issues/4654

> 
> > Changing sample rate or bit depth, or buffering, makes no difference.
> > Selecting 8 channels for output (one of HDMI's standards, as far as I can
> > tell), sometimes manages to output a tiny chunk of a good audio sample, and
> > then goes silent.
> > 
> > Now, even more curiously, when using the portaudio backend and connecting
> > to the default pulseaudio sink, works just fine. What could be causing this
> > discrepancy?
> 
> Perhaps PortAudio is forcing the Linear PCM bits on the underlying ALSA
> backend somehow, see for example:
> https://fossies.org/linux/alsa-lib/src/conf/pcm/iec958.conf
> But this is just wild speculation, it may or may not be the case with
> your report. It's best if you ask Takashi Iwai and Jaroslav Kysela
> directly through the list with Cc: in case nobody else has any more
> ideas of what could be the root cause of your report.

You're probably sending PCM data to HDMI, which expects SPDIF frames
instead, and PortAudio + PulseAudio seems to be aware of this. That's my
theory at least. Setting the necessary bits and necessary IEC958 format
on your ALSA playback may resolve your issue.

> 
> Good luck,
> Geraldo Nascimento
> 
> > 
> > Best,
> > 
> > Ico
> > 
> > -- 
> > Ivica Ico Bukvic, D.M.A.
> > Director, Creativity + Innovation
> > Director, Human-Centered Design iPhD
> > Institute for Creativity, Arts, and Technology
> > 
> > Virginia Tech
> > Creative Technologies in Music
> > School of Performing Arts – 0141
> > Blacksburg, VA 24061
> > (540) 231-6139
> > ico@vt.edu
> > 
> > ci.icat.vt.edu
> > l2ork.icat.vt.edu
> > ico.bukvic.net
> 
> 
