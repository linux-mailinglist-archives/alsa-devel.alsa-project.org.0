Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B6D34C3C9
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 08:25:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B91C51655;
	Mon, 29 Mar 2021 08:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B91C51655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616999143;
	bh=wfV7uWFI1CPUNLoHPtkr6VWS8lbprgRedrguQT97aEw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WxAX4BJctbKhanB0fIvZoW4nX2ima2qx4rueK+OszC+HwpfOvAIVi4rFk6I8+zqbX
	 1/08E2ETGUYuKMuNVWH24kkGw7eAO6QtgO3n47YvOSKb9zH15QiipH4ib3CIn5QcX1
	 P8TpRMwy9uog/JKnnBZJFAm34tBoGCv68SgDtw64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C2C7F8016E;
	Mon, 29 Mar 2021 08:24:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BD24F8015A; Mon, 29 Mar 2021 08:24:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F2A1F800B9
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 08:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F2A1F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="B4tS7pmj"
Received: by mail-pj1-x1029.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso5421411pjb.3
 for <alsa-devel@alsa-project.org>; Sun, 28 Mar 2021 23:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tc2Kknjut/IrmaznDTOGIf9yHSgf/06kpGrK3dp0fQI=;
 b=B4tS7pmj/YlxOPQ7QsMTNS1YBIShzXiBS5QgIvnrsTRLYj5lv9mTMnWc1jEklHP4wP
 0Ch2/9Asptf4VFDwbDLrlbq1tMOnxWFvfwNUnMCTSKGneR//RhL3efFEGKQ9D7DkD5mD
 KnBBsRxfbITYoYfHVnHHP6txI0dVix3KYD0cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tc2Kknjut/IrmaznDTOGIf9yHSgf/06kpGrK3dp0fQI=;
 b=jA8TgZvN1iS627ZnBs9q7bTEDrjU0ncwW7W/2ibgbZnB9BixG7cUyIP6OIDC3IUcCV
 SaQhfRR0cNiYKhJcaVEin5rjvGFZo4TD2vlV8v54RpHBMPQMS7mTR10eYWn6Qx8j0VqS
 vR77Ijk2mf/TIbSxsp1jiBuAfXr2lXT0VhJ49X67MIpQ36hBgPT9qPzyvvGIY4U0EIGN
 9fgHulNMG/Mk3gGEjjrtjd5AiVeMk5KpA99esUgPm3yUsVMGz60NYO8/IUdC7rOKLBQT
 DXCreTuTwfJVKQQsc978qXiQDFi1A8r1Hj1Pjms1qm5n3bp+Y2aYhTMYw7GdVQQWETBS
 7x/g==
X-Gm-Message-State: AOAM533ULqB5Nc0MWvxE7zYwm0iq+bHIKaCBwgbdmKhc/umZofvzbGQp
 sUzsoi0cx0HYchihJ8I9o6sfbreWiZuepB5eZhlcgg==
X-Google-Smtp-Source: ABdhPJyrd5rM9LIBXCvfPpgsOB+tu/vSbVNplYf6y7i+M/ACB9YVhR28yyfh4uQipaZEu19YUF1rXqjXGbsjire+lVc=
X-Received: by 2002:a17:902:ea0d:b029:e6:f01d:9db5 with SMTP id
 s13-20020a170902ea0db02900e6f01d9db5mr26881495plg.60.1616999043358; Sun, 28
 Mar 2021 23:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210324105153.2322881-1-ikjn@chromium.org>
 <c21de867cf4ccbfcc8cf555c78dc70dd3a47dfe8.camel@infinera.com>
 <CAATdQgDrri-tMtu3AOFRcbGHfL6hONDfdMdZh45BusbdAoWfdw@mail.gmail.com>
 <s5ho8f8ogx8.wl-tiwai@suse.de>
In-Reply-To: <s5ho8f8ogx8.wl-tiwai@suse.de>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Mon, 29 Mar 2021 14:23:52 +0800
Message-ID: <CAATdQgAYrq7sHJQN=_5ipH0N_kbixjac=BLFCYv5jTScH_c+Lw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Apply sample rate quirk to Logitech
 Connect
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Dylan Robinson <dylan_robinson@motu.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Alexander Tsoy <alexander@tsoy.me>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Gregor Pintar <grpintar@gmail.com>, Olivia Mackintosh <livvy@base.nu>,
 open list <linux-kernel@vger.kernel.org>
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

On Wed, Mar 24, 2021 at 8:49 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 24 Mar 2021 13:03:14 +0100,
> Ikjoon Jang wrote:
> >
> > On Wed, Mar 24, 2021, 7:16 PM Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> > wrote:
> >
> >     On Wed, 2021-03-24 at 18:51 +0800, Ikjoon Jang wrote:
> >     > Logitech ConferenceCam Connect is a compound USB device with UVC and
> >     > UAC. Not 100% reproducible but sometimes it keeps responding STALL to
> >     > every control transfer once it receives get_freq request.
> >     >
> >     > This patch adds 046d:0x084c to a snd_usb_get_sample_rate_quirk list.
> >     >
> >     > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=203419
> >     > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> >
> >     Most Logitech USB headset I got needs a delay in snd_usb_ctl_msg_quirk()
> >     Have you tried to add say 20 ms delay in there?
> >
> > I didn't try that. But it sounds reasonable to me.
> >
> > let me try that quirk here. If that is the case, HID might need that delay
> > also. Logitech Group webcam had a similar problem on control xfer of
> > get_report from an another interface for HID.
>
> The Logitech devices with 046d:* should be covered generally in
> snd_usb_ctl_msg_quirk(), so I guess it's a different problem.
> But please check it first.
>
> > And 20ms can be too long if it's applied to every control transfer. I will
> > test the device with shorter delay if you didn't try it before.
>
> Actually the delay applied to Logitech devices is from 1 to 2ms, not
> 20ms.  The 20ms delay is applied for some other devices.  But if
> extending the delay fixes the problem, we need to reconsider the delay
> length.

I tested this Logitech device with various delays 2..20ms
in snd_usb_ctl_msg_quirk() but it didn't help.

Disregarding the delay between control transfers,
This device is always stuck at get_cur, responding STALL to all
control transfers.

[   24.045618] usb 1-1.2.1.1: 1:1: cannot get freq at ep 0x82
[   24.167475] usb 1-1.2.1.1: 2:0: cannot get min/max values for
control 2 (id 2)
[   24.287393] usb 1-1.2.1.1: 6:0: cannot get min/max values for
control 2 (id 6)
[   24.289854] usbcore: registered new interface driver snd-usb-audio
[   24.877073] usb 1-1.2.1.1: 2:1: usb_set_interface failed (-32)

And I've also found that in some other platforms (with the same kernel),
this device fails at get_freq - timeout with NYETs or NAKs (instead of STALL),
and succeeded in following set_interface even without any delays
I've tried but couldn't find any differences between the two. ;-(

So until now, I think this approach of skipping get_rate is the only
one possible
workaround for Logitech Connect.

>
>
> Takashi
