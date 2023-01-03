Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDD765C785
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 20:29:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B3A66441;
	Tue,  3 Jan 2023 20:28:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B3A66441
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672774162;
	bh=FD2ZaX2xlNlJZINI+41YojEv2u/dhtIe/1iG7z5+ziU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=j4MTwsvIIFPZCkm020fFbwmCuPuv43MbIpz9eEVO7qolgvkMTzQeFZE1H6iD9nAzK
	 0F2xmaFms3SAtZgt9og/0J77T8mNNWmNlQymDdCnB8weakG4q3FXPfrrpTu3kjngvb
	 1oij6DpZu+ykTToCQhPxk/3xVZ16SyaZ1s3cfgyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3AD0F800F8;
	Tue,  3 Jan 2023 20:28:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCE7EF804AA; Tue,  3 Jan 2023 20:28:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95C9DF800F8
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 20:28:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95C9DF800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ralston.id.au header.i=@ralston.id.au
 header.a=rsa-sha256 header.s=google header.b=UxfExVhN
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-14ffd3c5b15so26401511fac.3
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 11:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ralston.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q7FkXH+HLYkkiLIkG++WmN41rS8wCnFY7c3NQ2brhNE=;
 b=UxfExVhNTzqtD3r49kPu0KJ4JLMh/spcsFzusux4NKHMSWkEgPVo8y3T+xGOdeej7q
 U7JUKmtw/wjXmBuMdMvjd2TyAJiofimRHFHVLycx/WPTGy6bBaSWbnvwiAVuAhYNAIk/
 +LAQxW4vgmemwCGTNb4D3E7K15qC4T3I41M0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q7FkXH+HLYkkiLIkG++WmN41rS8wCnFY7c3NQ2brhNE=;
 b=hevtDWUVsATYYY0mVVTgdLqSOmmUyRhVNMsmmVf3Th4rsQvjmUkYSRub3cAz2mkzdA
 7SMQluVurH7Du/6lacQZXDePyNKiMXKfJGVTU+xMpxt2famLRwo90lEPKoboCQKqNcMu
 DIXQWSXrmE9L5EgDT+r/8HgraAkB47K0KHNQizMQy+IydYgNIckW9X3zh365rXYp5hOk
 51pFljE9v9MyMUxkGFXkNTZwEnmmS/WPkitmbbxPiBVV09o6zgibtTcbRfZekU8wJg07
 sCrwSGQx3ADSvx+yhdPFxXwvGIUSycAF932E+XWHlG1mZeMpTVtU10IapY/0dh0k/2Kz
 fdWA==
X-Gm-Message-State: AFqh2kq5YwKJyWJvxqlkiJtks7vLBQ44QRuv/Bw/vVS0hocJTDVnCs0q
 yz64WsNaG4qp+w5C/BE2ykcqnR3gseZtefk7WMrXAg==
X-Google-Smtp-Source: AMrXdXsr5JqGLy/gQerxGWjdW2dJmjj/bKkvNd+/Bzb9oiK1VgH2DEO9re36zS2VcdGKT4NqC2y5QX3Jcchnro4gHK8=
X-Received: by 2002:a05:6870:8dcf:b0:150:a904:9f9a with SMTP id
 lq15-20020a0568708dcf00b00150a9049f9amr762343oab.235.1672774089369; Tue, 03
 Jan 2023 11:28:09 -0800 (PST)
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info>
 <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de>
 <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
 <87bknfr6rd.wl-tiwai@suse.de>
 <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
 <878rijr6dz.wl-tiwai@suse.de>
 <CAC2975+Ybz2-jyJAwAUEu5S1XKfp0B-p4s-gAsMPfZdD61uNfQ@mail.gmail.com>
 <87zgazppuc.wl-tiwai@suse.de>
 <CAC2975+476CHDL3YM=uExHu96UB2rodAng9PVYHX+vGnSCppGA@mail.gmail.com>
 <CAC2975Ja-o6-qCWv2bUkt3ps7BcKvb96rao_De4SGVW1v8uE=A@mail.gmail.com>
In-Reply-To: <CAC2975Ja-o6-qCWv2bUkt3ps7BcKvb96rao_De4SGVW1v8uE=A@mail.gmail.com>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 06:27:33 +1100
Message-ID: <CAC2975KFqvTitbJHJZ6a4Tuxsq=nPGvW3vjAAtkQxw=sBgeDqw@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, regressions@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Thorsten Leemhuis <regressions@leemhuis.info>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 4 Jan 2023 at 06:24, Michael Ralston <michael@ralston.id.au> wrote:
>
> I did a diff between the sound/usb directory for 6.0.16 and 6.1.2 and
> reverted that entire directory.
>
> It is working with that change, so there must be something else.
>

Logs below...

Jan 04 06:20:27 leatherback kernel: mc: Linux media interface: v0.10
Jan 04 06:20:27 leatherback kernel: usb 1-3: Found last interface = 1
Jan 04 06:20:27 leatherback kernel: usb 1-4: Set quirk_flags 0x20010
for device 1397:0509
Jan 04 06:20:27 leatherback kernel: usb 1-4: Found last interface = 4
Jan 04 06:20:27 leatherback kernel: usb 1-4: 1:1: added playback
implicit_fb sync_ep 88, iface 2:1
Jan 04 06:20:27 leatherback kernel: usb 1-4: 1:1: add audio endpoint 0x8
Jan 04 06:20:27 leatherback kernel: usb 1-4: Creating new data endpoint #8
Jan 04 06:20:27 leatherback kernel: usb 1-4: Creating new data endpoint #88
Jan 04 06:20:27 leatherback kernel: usb 1-4: 1:1 Set sample rate
192000, clock 40
Jan 04 06:20:27 leatherback kernel: usb 1-4: 2:1: add audio endpoint 0x88
Jan 04 06:20:27 leatherback kernel: usb 1-4: 2:1 Set sample rate
192000, clock 40
Jan 04 06:20:27 leatherback kernel: usb 1-4: clock source 41 is not
valid, cannot use
Jan 04 06:20:27 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Switch] ch = 4, val = 0/1/1
Jan 04 06:20:27 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Switch] ch = 1, val = 0/1/1
Jan 04 06:20:27 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Volume] ch = 4, val = -32512/0/256
Jan 04 06:20:27 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Volume] ch = 1, val = -32512/0/256
Jan 04 06:20:27 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Switch] ch = 4, val = 0/1/1
Jan 04 06:20:27 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Switch] ch = 1, val = 0/1/1
Jan 04 06:20:27 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Volume] ch = 4, val = -32512/0/256
Jan 04 06:20:27 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Volume] ch = 1, val = -32512/0/256
Jan 04 06:20:27 leatherback kernel: usbcore: registered new interface
driver snd-usb-audio
Jan 04 06:20:31 leatherback kernel: usb 1-4: Open EP 0x8, iface=1:1, idx=0
Jan 04 06:20:31 leatherback kernel: usb 1-4:   channels=4, rate=48000,
format=S32_LE, period_bytes=96000, periods=4, implicit_fb=1
Jan 04 06:20:31 leatherback kernel: usb 1-4: Open EP 0x88, iface=2:1, idx=0
Jan 04 06:20:31 leatherback kernel: usb 1-4:   channels=4, rate=48000,
format=S32_LE, period_bytes=96000, periods=4, implicit_fb=0
Jan 04 06:20:31 leatherback kernel: usb 1-4: Setting usb interface 2:0
for EP 0x88
Jan 04 06:20:31 leatherback kernel: usb 1-4: 2:1 Set sample rate 48000, clock 40
Jan 04 06:20:31 leatherback kernel: usb 1-4: Setting params for data
EP 0x88, pipe 0x40580
Jan 04 06:20:31 leatherback kernel: usb 1-4: Set up 12 URBS, ret=0
Jan 04 06:20:31 leatherback kernel: usb 1-4: Setting usb interface 2:1
for EP 0x88
Jan 04 06:20:31 leatherback kernel: usb 1-4: Setting usb interface 1:0
for EP 0x8
Jan 04 06:20:31 leatherback kernel: usb 1-4: Setting params for data
EP 0x8, pipe 0x40500
Jan 04 06:20:31 leatherback kernel: usb 1-4: Set up 12 URBS, ret=0
Jan 04 06:20:31 leatherback kernel: usb 1-4: Setting usb interface 1:1
for EP 0x8
Jan 04 06:20:31 leatherback kernel: usb 1-4: Starting data EP 0x8 (running 0)
Jan 04 06:20:31 leatherback kernel: usb 1-4: 12 URBs submitted for EP 0x8
Jan 04 06:20:31 leatherback kernel: usb 1-4: Starting data EP 0x88 (running 0)
Jan 04 06:20:31 leatherback kernel: usb 1-4: 12 URBs submitted for EP 0x88
Jan 04 06:20:31 leatherback kernel: usb 1-4: 1:1 Start Playback PCM
Jan 04 06:20:32 leatherback kernel: usb 1-4: Stopping data EP 0x88 (running 1)
Jan 04 06:20:32 leatherback kernel: usb 1-4: Stopping data EP 0x8 (running 1)
Jan 04 06:20:32 leatherback kernel: usb 1-4: 1:1 Stop Playback PCM
Jan 04 06:20:32 leatherback kernel: usb 1-4: Closing EP 0x8 (count 1)
Jan 04 06:20:32 leatherback kernel: usb 1-4: Setting usb interface 1:0
for EP 0x8
Jan 04 06:20:32 leatherback kernel: usb 1-4: EP 0x8 closed
Jan 04 06:20:32 leatherback kernel: usb 1-4: Closing EP 0x88 (count 1)
Jan 04 06:20:32 leatherback kernel: usb 1-4: Setting usb interface 2:0
for EP 0x88
Jan 04 06:20:32 leatherback kernel: usb 1-4: EP 0x88 closed
