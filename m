Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3287A65C304
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 16:32:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F156E49F;
	Tue,  3 Jan 2023 16:32:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F156E49F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672759970;
	bh=9swvvw+hk1mG9Nvazv+vhGMbP6YP1dLBxbqe0a7T1ww=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DExVqGKuoAAgoYBo4Uky8EGPEZltoMh+ljfM4TgzwsbNGdx7vMEV59cnGH4JippQK
	 E0bbD+FHJIdwYgHG7FMrjmAXuutcJhNeE/LblfybbZL+UsGL4N3fT0rKUj9/Ujts+q
	 LdMp203ruJKu22bnzhkL3Bjzvy5Mg0hO2a58RreM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88374F804AD;
	Tue,  3 Jan 2023 16:31:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6945AF804CB; Tue,  3 Jan 2023 16:31:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B2D8F8003C
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 16:31:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B2D8F8003C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ralston.id.au header.i=@ralston.id.au
 header.a=rsa-sha256 header.s=google header.b=Fc6VGYbi
Received: by mail-oi1-x232.google.com with SMTP id c133so27381427oif.1
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 07:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ralston.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lTt2HVuMFa2TLmTHW8vOAw3rFh8HzfGuBaR9NVmmAtM=;
 b=Fc6VGYbiL286Tp2aTPQ1Y4uy6LqcwL0sIPrVQvzVTfOG7G1huEiiKzAg3cTJAoyCPm
 fCHjO88ck0ApBg592ZP+eHdcqwWR1OLNOIfCwUu8pyOmz9Kp1H+vzmG20/Itr/jlq7sx
 yZHIYIREV1AoTOLSMt+owH2v8OetsWHuLKcOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lTt2HVuMFa2TLmTHW8vOAw3rFh8HzfGuBaR9NVmmAtM=;
 b=8FPgdhuSCMlzDnRaOQwQhln5ftJ7AJEOsB3q8sbYNKmzhlWaOzhoOyihBzgNh+2S5T
 Ijo6arB2AuXmiN7qVUGl6+xVBc+6u44IwV/sNWBsiUJJEBa9nwTCw+BuxJi75/sDBtFQ
 Nun4l08jmifslcF3d68Xe1q/OV7WF0pYeoUYQQREQ+ZFz3IdKcrULnmeacPzLMjKJLD6
 GsBAU+EIWaYL8GNpcBZhr6BSd6fro5Y50uWGDKgoZj/zgBX6OiXYBiO/fEbvjrHO+/CB
 zRKWyQqiH7XG2ounU0rifASKwIgfa2ZNxgetUX5a+4tncUpLYnkWPFGoRpAzZ7zflkG6
 S2zg==
X-Gm-Message-State: AFqh2kqWU5QKB7S6nic66Jxj7d/qLuEGu3S/FLB1Wj/gQPaPuiRkay3h
 Ff0vtNslcCTyTjzqKh5r+78RkyIjz28esKqtzl347nvnQkreGx7rG0k=
X-Google-Smtp-Source: AMrXdXugs7NnramkR5sSAo5zuOcfLDjrPK+0AmLNkuGRdZrUMmNgwV8uOgj669JUpvxLzg9XHbXkAGPI1+/F9sE2mMA=
X-Received: by 2002:a05:6808:609:b0:35c:dee:db96 with SMTP id
 y9-20020a056808060900b0035c0deedb96mr3117471oih.235.1672759909221; Tue, 03
 Jan 2023 07:31:49 -0800 (PST)
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
In-Reply-To: <878rijr6dz.wl-tiwai@suse.de>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 02:31:13 +1100
Message-ID: <CAC2975+Ybz2-jyJAwAUEu5S1XKfp0B-p4s-gAsMPfZdD61uNfQ@mail.gmail.com>
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

On Wed, 4 Jan 2023 at 02:21, Takashi Iwai <tiwai@suse.de> wrote:
>
> Hrm...  Try to reload snd_usb_audio module with the dyndbg=+p option,
> e.g.
>
>   # modprobe -r snd-usb-audio
>   # modprobe snd_usb_audio dyndbg=+p
>
> Or you can try to put your own debug printk(); we need to make sure
> whether it's really the right code you're testing at first.
>

Ok, it looks like it was ignoring the kernel command line for some
reason. modprobing it with the option brought up debug messages again.

I'm still running kernel 6.1.2 vanilla with the revert and the patches.

aplay hung again when I ran it, the kernel was stuck on:
Jan 04 02:25:59 leatherback kernel: usb 1-4: 1:1 Start Playback PCM

and didn't output another line until I ctrl+c aplay.

Jan 04 02:25:27 leatherback kernel: mc: Linux media interface: v0.10
Jan 04 02:25:27 leatherback kernel: usb 1-3: Found last interface = 1
Jan 04 02:25:27 leatherback kernel: usb 1-4: Set quirk_flags 0x20010
for device 1397:0509
Jan 04 02:25:27 leatherback kernel: usb 1-4: Found last interface = 4
Jan 04 02:25:27 leatherback kernel: usb 1-4: 1:1: added playback
implicit_fb sync_ep 88, iface 2:1
Jan 04 02:25:27 leatherback kernel: usb 1-4: 1:1: add audio endpoint 0x8
Jan 04 02:25:27 leatherback kernel: usb 1-4: Creating new data endpoint #8
Jan 04 02:25:27 leatherback kernel: usb 1-4: Creating new data endpoint #88
Jan 04 02:25:27 leatherback kernel: usb 1-4: 2:1: add audio endpoint 0x88
Jan 04 02:25:27 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Switch] ch = 4, val = 0/1/1
Jan 04 02:25:27 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Switch] ch = 1, val = 0/1/1
Jan 04 02:25:27 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Volume] ch = 4, val = -32512/0/256
Jan 04 02:25:27 leatherback kernel: usb 1-4: [10] FU [PCM Playback
Volume] ch = 1, val = -32512/0/256
Jan 04 02:25:27 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Switch] ch = 4, val = 0/1/1
Jan 04 02:25:27 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Switch] ch = 1, val = 0/1/1
Jan 04 02:25:27 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Volume] ch = 4, val = -32512/0/256
Jan 04 02:25:27 leatherback kernel: usb 1-4: [11] FU [Mic Capture
Volume] ch = 1, val = -32512/0/256
Jan 04 02:25:27 leatherback kernel: usbcore: registered new interface
driver snd-usb-audio
Jan 04 02:25:59 leatherback kernel: usb 1-4: Open EP 0x8, iface=1:1, idx=0
Jan 04 02:25:59 leatherback kernel: usb 1-4:   channels=4, rate=48000,
format=S32_LE, period_bytes=96000, periods=4, implicit_fb=1
Jan 04 02:25:59 leatherback kernel: usb 1-4: Open EP 0x88, iface=2:1, idx=0
Jan 04 02:25:59 leatherback kernel: usb 1-4:   channels=4, rate=48000,
format=S32_LE, period_bytes=96000, periods=4, implicit_fb=0
Jan 04 02:25:59 leatherback kernel: usb 1-4: Setting params for data
EP 0x88, pipe 0x40580
Jan 04 02:25:59 leatherback kernel: usb 1-4: Set up 12 URBS, ret=0
Jan 04 02:25:59 leatherback kernel: usb 1-4: Setting params for data
EP 0x8, pipe 0x40500
Jan 04 02:25:59 leatherback kernel: usb 1-4: Set up 12 URBS, ret=0
Jan 04 02:25:59 leatherback kernel: usb 1-4: Setting usb interface 2:0
for EP 0x88
Jan 04 02:25:59 leatherback kernel: usb 1-4: 2:1 Set sample rate 48000, clock 40
Jan 04 02:25:59 leatherback kernel: usb 1-4: Setting usb interface 2:1
for EP 0x88
Jan 04 02:25:59 leatherback kernel: usb 1-4: Setting usb interface 1:0
for EP 0x8
Jan 04 02:25:59 leatherback kernel: usb 1-4: Setting usb interface 1:1
for EP 0x8
Jan 04 02:25:59 leatherback kernel: usb 1-4: Starting data EP 0x8 (running 0)
Jan 04 02:25:59 leatherback kernel: usb 1-4: 12 URBs submitted for EP 0x8
Jan 04 02:25:59 leatherback kernel: usb 1-4: Starting data EP 0x88 (running 0)
Jan 04 02:25:59 leatherback kernel: usb 1-4: 12 URBs submitted for EP 0x88
Jan 04 02:25:59 leatherback kernel: usb 1-4: 1:1 Start Playback PCM
Jan 04 02:26:20 leatherback kernel: usb 1-4: Stopping data EP 0x88 (running 1)
Jan 04 02:26:20 leatherback kernel: usb 1-4: Stopping data EP 0x8 (running 1)
Jan 04 02:26:20 leatherback kernel: usb 1-4: 1:1 Stop Playback PCM
Jan 04 02:26:20 leatherback kernel: usb 1-4: Closing EP 0x8 (count 1)
Jan 04 02:26:20 leatherback kernel: usb 1-4: Setting usb interface 1:0
for EP 0x8
Jan 04 02:26:20 leatherback kernel: usb 1-4: EP 0x8 closed
Jan 04 02:26:20 leatherback kernel: usb 1-4: Closing EP 0x88 (count 1)
Jan 04 02:26:20 leatherback kernel: usb 1-4: Setting usb interface 2:0
for EP 0x88
Jan 04 02:26:20 leatherback kernel: usb 1-4: EP 0x88 closed
