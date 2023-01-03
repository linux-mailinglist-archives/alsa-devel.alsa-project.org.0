Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6BE65C74E
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 20:18:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67FCA63AA;
	Tue,  3 Jan 2023 20:17:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67FCA63AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672773524;
	bh=1gZCuDVhDiI4OhyB1qdRgnCbjuxd6rQBSiT4gcHk7vI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aXwWpUouCF9BRSNV6cQb0nAdF0Q+7ASuI8g+eR7/QzKUpnrkEMNj8N2UXoETDAiKM
	 HwUMyKKGKXjpwl2wxqxPA8POmgL5+fZE0N4HdMJvTzEIhcuq3DaJp7r3rvVXK6eM19
	 N6GoN0ungLjeCxVytFrV49WHzHtWYeTe5LSxtHRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A13D9F8973C;
	Tue,  3 Jan 2023 20:10:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26420F8973B; Tue,  3 Jan 2023 20:10:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C0BCF89738
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 20:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C0BCF89738
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ralston.id.au header.i=@ralston.id.au
 header.a=rsa-sha256 header.s=google header.b=kYD3G6Uz
Received: by mail-ot1-x331.google.com with SMTP id
 r2-20020a9d7cc2000000b006718a7f7fbaso19611724otn.2
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 11:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ralston.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C08OceEXw18iUGGiRS1+CrnOaGSBY8Ykajf+8A9hXvc=;
 b=kYD3G6UzTOkhCT7szVoyh5/v+2TIehuj/B8XGShsIbzhGPau8MXrHebfzJpslSxwdE
 aCuer2gXgiyk6lIm3Vp9fh0cu5rxdFdujtRUixA2gOwi3HRrWroXjpcLJX7D8lJs5JJW
 OlWxKzEEvl04KM62QncHE+dl2oYp6ZB46V9NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C08OceEXw18iUGGiRS1+CrnOaGSBY8Ykajf+8A9hXvc=;
 b=35ePmurbVjaoE90+4y6PrAIWUD8TLYdLq41FtuFJEiRIu+HTuiJVlgE+2mDcrccPyH
 /d/N3BdhuwQDwsAFJ4T/+Gln2mKncM4G1y495prZ2OCq+otwuXyRCR5g6by/nDsoKO7x
 I4IqCWvUFeLT2XFUtFcoVgP1vmpvpp5egKTUVLljZUd1s2x9IIrfDZjPXjlGOtCPGBsl
 jW/dNg4a73tZtxCL1m+7zVvx93efZctzfrX2ASEOYEFqzjcmEgdmDHsVhW5VAgnP0NQc
 lIDv0BjpUMU0nnmwQsRyTcZg6DzbARzWcvllNN7j5zsvZ02DILivxjy/5klI21pZq8Oq
 Stsw==
X-Gm-Message-State: AFqh2kosUiOOU8RyYU0+sSiERxKzd1hpy5UGb7skfzVcZdL0zFPLpk8c
 BHBwP3wjpSUgARTHMQjr6vztyB11lDy476JI9mnBnA==
X-Google-Smtp-Source: AMrXdXthw5dKhojJxrUcr3e0JejicQ9XapnRXcqB2mBfdyuH37vcqnRI/Qf2oo1aqqCbWTWVxwFKdNXKtxVzvdNCU7g=
X-Received: by 2002:a05:6830:3747:b0:66a:8bca:86d9 with SMTP id
 bm7-20020a056830374700b0066a8bca86d9mr2572880otb.358.1672772992979; Tue, 03
 Jan 2023 11:09:52 -0800 (PST)
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
In-Reply-To: <87zgazppuc.wl-tiwai@suse.de>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 06:09:16 +1100
Message-ID: <CAC2975+476CHDL3YM=uExHu96UB2rodAng9PVYHX+vGnSCppGA@mail.gmail.com>
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

On Wed, 4 Jan 2023 at 03:03, Takashi Iwai <tiwai@suse.de> wrote:
>
> OK, thanks.  Then it's not about the USB interface reset.
> It must be subtle and nasty difference.
>
> Could you apply the change below on the top?
> It essentially reverts the hw_params/prepare split again.
>

Very sorry to say this still hasn't fixed the problem :(

Jan 04 06:05:12 leatherback kernel: mc: Linux media interface: v0.10
Jan 04 06:05:12 leatherback kernel: usb 1-3: Found last interface = 1
Jan 04 06:05:12 leatherback kernel: usb 1-4: Set quirk_flags 0x20010
for device 1397:0509
Jan 04 06:05:12 leatherback kernel: usb 1-4: Found last interface = 4
Jan 04 06:05:12 leatherback kernel: usb 1-4: 1:1: added playback
implicit_fb sync_ep 88, iface 2:1
Jan 04 06:05:12 leatherback kernel: usb 1-4: 1:1: add audio endpoint 0x8
Jan 04 06:05:12 leatherback kernel: usb 1-4: Creating new data endpoint #8
Jan 04 06:05:12 leatherback kernel: usb 1-4: Creating new data endpoint #88
Jan 04 06:05:12 leatherback kernel: usb 1-4: 2:1: add audio endpoint 0x88
Jan 04 06:05:12 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Switch] ch = 4, val = 0/1/1
Jan 04 06:05:12 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Switch] ch = 1, val = 0/1/1
Jan 04 06:05:12 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Volume] ch = 4, val = -32512/0/256
Jan 04 06:05:12 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Volume] ch = 1, val = -32512/0/256
Jan 04 06:05:12 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Switch] ch = 4, val = 0/1/1
Jan 04 06:05:12 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Switch] ch = 1, val = 0/1/1
Jan 04 06:05:12 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Volume] ch = 4, val = -32512/0/256
Jan 04 06:05:12 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Volume] ch = 1, val = -32512/0/256
Jan 04 06:05:12 leatherback kernel: usbcore: registered new interface
driver snd-usb-audio
Jan 04 06:06:07 leatherback kernel: usb 1-4: Open EP 0x8, iface=1:1, idx=0
Jan 04 06:06:07 leatherback kernel: usb 1-4:   channels=4, rate=48000,
format=S32_LE, period_bytes=96000, periods=4, implicit_fb=1
Jan 04 06:06:07 leatherback kernel: usb 1-4: Open EP 0x88, iface=2:1, idx=0
Jan 04 06:06:07 leatherback kernel: usb 1-4:   channels=4, rate=48000,
format=S32_LE, period_bytes=96000, periods=4, implicit_fb=0
Jan 04 06:06:07 leatherback kernel: usb 1-4: Setting params for data
EP 0x88, pipe 0x40580
Jan 04 06:06:07 leatherback kernel: usb 1-4: Set up 12 URBS, ret=0
Jan 04 06:06:07 leatherback kernel: usb 1-4: Setting params for data
EP 0x8, pipe 0x40500
Jan 04 06:06:07 leatherback kernel: usb 1-4: Set up 12 URBS, ret=0
Jan 04 06:06:07 leatherback kernel: usb 1-4: Setting usb interface 2:0
for EP 0x88
Jan 04 06:06:07 leatherback kernel: usb 1-4: 2:1 Set sample rate 48000, clock 40
Jan 04 06:06:07 leatherback kernel: usb 1-4: Setting usb interface 2:1
for EP 0x88
Jan 04 06:06:07 leatherback kernel: usb 1-4: Setting usb interface 1:0
for EP 0x8
Jan 04 06:06:07 leatherback kernel: usb 1-4: Setting usb interface 1:1
for EP 0x8
Jan 04 06:06:07 leatherback kernel: usb 1-4: Starting data EP 0x8 (running 0)
Jan 04 06:06:07 leatherback kernel: usb 1-4: 12 URBs submitted for EP 0x8
Jan 04 06:06:07 leatherback kernel: usb 1-4: Starting data EP 0x88 (running 0)
Jan 04 06:06:07 leatherback kernel: usb 1-4: 12 URBs submitted for EP 0x88
Jan 04 06:06:07 leatherback kernel: usb 1-4: 1:1 Start Playback PCM
Jan 04 06:06:30 leatherback kernel: usb 1-4: Stopping data EP 0x88 (running 1)
Jan 04 06:06:30 leatherback kernel: usb 1-4: Stopping data EP 0x8 (running 1)
Jan 04 06:06:30 leatherback kernel: usb 1-4: 1:1 Stop Playback PCM
Jan 04 06:06:30 leatherback kernel: usb 1-4: Closing EP 0x8 (count 1)
Jan 04 06:06:30 leatherback kernel: usb 1-4: Setting usb interface 1:0
for EP 0x8
Jan 04 06:06:30 leatherback kernel: usb 1-4: EP 0x8 closed
Jan 04 06:06:30 leatherback kernel: usb 1-4: Closing EP 0x88 (count 1)
Jan 04 06:06:30 leatherback kernel: usb 1-4: Setting usb interface 2:0
for EP 0x88
Jan 04 06:06:30 leatherback kernel: usb 1-4: EP 0x88 closed
