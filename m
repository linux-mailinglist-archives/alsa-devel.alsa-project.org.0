Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D42DEE12
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Dec 2020 10:55:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A638617E2;
	Sat, 19 Dec 2020 10:49:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A638617E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608371413;
	bh=IU6Bk8mVYpHBV2VbJj/fdLl94+HIag6wMbrlV7vLLbc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U/xvhKSIHWlCqQlkQhEWSOecQS60iLk/5xWuPoKyCQnK3K1cy697u/GtiGzvmpv73
	 EYQDyJ4kIlBc/eTcvYBzQUh/+Cof2W/HQGLr9xnFzj0cm0ZuVFbfYKM8mNd9JNTFx8
	 DWD7sK8EmVSppiq5di61Opa1HsqC734PQuS+gaik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1334EF8011B;
	Sat, 19 Dec 2020 10:48:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AD4CF80260; Sat, 19 Dec 2020 10:48:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90F95F80103
 for <alsa-devel@alsa-project.org>; Sat, 19 Dec 2020 10:48:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90F95F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pUrueJvW"
Received: by mail-pf1-x431.google.com with SMTP id x126so3058027pfc.7
 for <alsa-devel@alsa-project.org>; Sat, 19 Dec 2020 01:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KUox93+V05ymwhdM9Gg/OPzlTfeRKR4O+GR7K+AAOx4=;
 b=pUrueJvWgOZ0M0fl8r0zp9rvumJwJBiSA285NONnCV45Gd8MUFSBb8AGCc3uLCkcT8
 YmaNry8z0bCfLAGLeIo5LARbm63Lrsfk9KNrWYmS0u8OwZW5QTSaeLqyQNTwxssIzJc4
 w0kz/arThf6tV67QK7yh0KVNrjpreczyCY0Apcs1WiYBz1m05/M0q2lS1X6zTviQgd8f
 YwGh2jDFlZY4bk201a2qX0eN30+7ZV+wM2AZKaAzFPzt/3FxrR55Jwm6iTKA2b/Xz9Yn
 1yrMnweKEm2vX7Ew+R9yGonlbYtxSj3ym/vhQXE8YlR7DC4DjqsE78UUw3d0OEV8NDCY
 sp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KUox93+V05ymwhdM9Gg/OPzlTfeRKR4O+GR7K+AAOx4=;
 b=hVh5+av95iK0ggGb5MnpyLYHUy2gHvFXW7u3SlrlPykTNzoak5eSDn0q962V2f+APk
 htKIMca6TlVRSunY+TWwDlItD0YRGRckOWkwLhREK88xcbW/TqCK7V2IPEAafb9L0Acp
 1B/EXj3iWRdFQdsTXqtfBi81ROBBQi6HozQwrrlWl5D8Hlu/TonW0VuQCpl6MrMzx2TN
 Z4dpN870+WXUyL048GgUux2ZH5SbtrtV7b4rmZj3G2EVR6wjFzJrJqTKhi3+3NJT6oNO
 x2aI7RXO5kuyLu3iH+ELUkK+rfonev/mNwrLw/jwEvn0Ks1K2x183haFgdlmX+63kDeH
 JBsw==
X-Gm-Message-State: AOAM530WtEGQlamhva2ZvrI/NW7MW78c/Em+edATUPK+Vgs+WdqThG32
 O/CnWpyiqqJMiJ/Wp4ObiAdrpiLOHKwQTDbfLhQ=
X-Google-Smtp-Source: ABdhPJxSmDX0piP0IKrsfAL/3clqRAUIQuqfJkMIxiWQHAn/HQUbS70a9Vs/AXtkzImrQCO4iRd8lDmoB6dyvZ8i1Tk=
X-Received: by 2002:a63:5c52:: with SMTP id n18mr7649877pgm.404.1608371305073; 
 Sat, 19 Dec 2020 01:48:25 -0800 (PST)
MIME-Version: 1.0
References: <CAE5BBpTEw2pTzDhLxaQiGwAvnH_q6aChLkuDXxEQrZFvS6wVyQ@mail.gmail.com>
 <s5h8s9wn4lr.wl-tiwai@suse.de>
 <CAE5BBpTbyjkd--Nfcqpv01wYyScEgXJSQETYhWyUH9-qPKYw+g@mail.gmail.com>
 <s5h8s9wlj86.wl-tiwai@suse.de>
 <CAE5BBpQpWkLqVFbPDjiOEqA85Pht_g+YEkpnhpdAepQkpLMfEQ@mail.gmail.com>
 <s5hy2hwjzcs.wl-tiwai@suse.de>
 <CAE5BBpQKbmzift4SZShcG7oSh1ZQwj6Fo_1eDUko153V8WTQHw@mail.gmail.com>
 <s5ha6ubi11k.wl-tiwai@suse.de>
In-Reply-To: <s5ha6ubi11k.wl-tiwai@suse.de>
From: Marco Giunta <giun7a@gmail.com>
Date: Sat, 19 Dec 2020 10:48:13 +0100
Message-ID: <CAE5BBpQAfxXqFPgUU+37YF3L1i3Q_J+XFeg8QzDBh5+Xe8UTcQ@mail.gmail.com>
Subject: Re: [PATCH] Fix mic sound on Jieli webcam
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org
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

On Fri, Dec 18, 2020 at 4:31 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> OK, the patch for suppressing the rate errors was submitted and will
> be merged to upstream later.  Now let's hunt Minions.
>
> Just as a blind shot, could you try the following?
>

nope, Minion voice is still there ;-P
I've tried to record at any rate (8k, 16k, 44,1k and 48k), but no
luck. Moreover, there are a lot of new error messages:

 kernel: usb 1-6.2: 3:3: usb_set_interface failed (-19)
 kernel: usb 1-6.2: 3:3: usb_set_interface failed (-19)
 kernel: usb 1-6.2: 3:3: usb_set_interface failed (-19)
kernel: usb 1-6.2: 3:3: usb_set_interface failed (-19)
 pulseaudio[2818]: Failed to find a working profile.
pulseaudio[2818]: Failed to load module "module-alsa-card" (argument:
"device_id="1" name="usb-Jieli_Technology_USB_PHY_2.0-02"
card_name="alsa_card.usb-Jieli_Technology_USB_PHY_2.0-02"
namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no
deferred_volume=yes use_ucm=yes avoid_resampling=no
card_properties="module-udev-detect.discovered=1""): initialization
failed.
 pulseaudio[2818]: Failed to get card object.
 pulseaudio[2818]: Failed to find a working profile.
 pulseaudio[2818]: Failed to load module "module-alsa-card" (argument:
"device_id="1" name="usb-Jieli_Technology_USB_PHY_2.0-02"
card_name="alsa_card.usb-Jieli_Technology_USB_PHY_2.0-02"
namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no
deferred_volume=yes use_ucm=yes avoid_resampling=no
card_properties="module-udev-detect.discovered=1""): initialization
failed.
kernel: usb 1-6.2: cannot submit urb (err = -19)
 kernel: usb 1-6.2: cannot submit urb 0, error -19: no device

Thanks,
  Marco
