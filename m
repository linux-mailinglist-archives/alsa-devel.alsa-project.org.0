Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFA13430E1
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Mar 2021 05:31:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 832C61672;
	Sun, 21 Mar 2021 05:30:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 832C61672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616301091;
	bh=dmXhVyzLuCHXzB0rEUswg1efVi0+V2Xl0Z96Wiwu/ng=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WkNDKdymcj7Dz4bbS8Ra56Vtg7TnhQIyaHT6p3wKYkioqFHRo586xm+5MSv+aK8f0
	 twmmgcSeV38/iU0yUrFRYe8bI70u9/ATB+Ra73P359DpIM9t0ZG9iLFvU9B5lxw5yB
	 zP4BL5GS2BDSh29nx+u1wmpP8QUpGXQVGJ4SMSnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69C04F80257;
	Sun, 21 Mar 2021 05:30:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 712EEF80254; Sun, 21 Mar 2021 05:29:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF979F8012F
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 05:29:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF979F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="n6I5beFl"
Received: by mail-qk1-x72a.google.com with SMTP id g15so7296138qkl.4
 for <alsa-devel@alsa-project.org>; Sat, 20 Mar 2021 21:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=vfzC1B3jrJcd8/NAxq875jthzGev2HwYrdTTNyJbyuE=;
 b=n6I5beFlteNkGq0+jZeOPrUYOk2UqnBSDFSWrHgwIpBuB+vRVb+Mb1LfVV5ghDcW+t
 xqqQAaTu4I2EFYnDqQyrD4lIwS0ucoRcY1UiVIPOWuq8Ahr2fSb95+qedTO2IE4JxpLA
 1DbLg659kgkQxyp445ELBelgNUo8WIKW5oJQElluEMWwYtCvE2x8BJnqtPak3ZVycwO/
 k0mmcNf5u8i8TVB8xugVJD36ufZrP806oWvWDrDLJMdId0RUkfBZIBuSmc0jf0KGKcDl
 BjIp2hjOAMKQxwiV1UhfWE5VdwYYAv83GRubgKdI++O6zUkC6uC+e6KbfRxYH+K8VX0S
 kpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=vfzC1B3jrJcd8/NAxq875jthzGev2HwYrdTTNyJbyuE=;
 b=clqb8Il/YtsTEoI3Uv3djdDTlFTgBaCWMUfdjnbEeUx6QHrfAj704a+fYBUp3uH2cn
 LnqmWmDxqvhps5/RTJVdNnAJwA/M1jyEMorBm0HrcIyXYH6nuOWpcaZ4Im01D9pZbYI8
 JuLMkf1eHJ1X9NJ311np04Ondq8Oa6ZwAF1DsgQeC5aWTRuTvokp/AVvj0CsZGe1un8f
 5yHuAz7xWV3FJmZg061/bybx3oNpzD4AVnLGxsDmhbeFzDUQQE5ZhjFIKyhpTiaeLF9v
 5VrKtgs2+iu5TYdVHMNqNQAqvWpkPVsRix97pyaW7aWhbMdioxWKcKTNJkY5LI5FarcY
 4UQg==
X-Gm-Message-State: AOAM531BHMAoqHHYX3r3+7pUlmSYi3cDzK1bkaXJX+86GR+yPLUBcWn0
 thsEtqhqtFLmF7ZWVG3zKUTOfIlQzGgwUslJ8TD3vw3Z
X-Google-Smtp-Source: ABdhPJwR/XeGlIbcWyTK2Ifa2tasloZ7mxoV9Sam4oy0dLaAHJ1ck2cli/X/1qjpMFQGwSlSAWBC3vS1mtuN+FVshPQ=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr5520269qki.487.1616300961089; 
 Sat, 20 Mar 2021 21:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvctXrHLXK-oz6Zb38t1D28krqUCf73jMU-QJw=i66KZe8g@mail.gmail.com>
In-Reply-To: <CAEsQvctXrHLXK-oz6Zb38t1D28krqUCf73jMU-QJw=i66KZe8g@mail.gmail.com>
From: Geraldo <geraldogabriel@gmail.com>
Date: Sun, 21 Mar 2021 01:31:11 -0300
Message-ID: <CAEsQvcsePyrd3Xs4hTUmkxzk84nodL40ytGgjM-66SOgv5ybjw@mail.gmail.com>
Subject: Re: Pioneer DJ DDJ-SR2 sound degradation
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Until we manage to engage implicit feedback sync for Pioneer gear I'm
afraid the clock will drift on DUPLEX mode.

I reread the Pioneer related source code and implicit feedback sync was
disabled because it gave Incompatible EP Setup messages. I should know, I
was a reporter on that regression.

Only those messages are fake. They arise because our ALSA code it's not
honoring .ep_attr on quirks-table.h specifically in regards to
USB_ENDPOINT_USAGE_IMPLICIT_FB.

In fact the new improved implicit feedback sync code inside pcm.c that sets
sync upon probe is failing to set implicit_fb to 1. I commented the
conditional for testing and I told endpoint_compatible to always return
true.

Voil=C3=A0, JACK started in duplex mode without nasty Incompatible EP Setup
problems and supposedly with implicit feedback sync on. We are not setting
bits 5..7 of bmAttributes, at least that's what I get from the missing
Usage field in lsusb.

My JACK transport has been rolling for 17 minutes and if it goes for two
complete hours without distortion passing-thru vinyl on Mixxxx I'll provide
the list with a more elegant PATCH and not this gambiarra as we say on
Brazil.

Hopefully their will be implicit feedback sync for Pioneer :-)


On Thu, Mar 18, 2021 at 7:41 PM Geraldo <geraldogabriel@gmail.com> wrote:
>
> Hi everyone,
>
> I'm running stable kernel 5.11.6 together with my Pioneer DJ DDJ-SR2 and
JACK. Mixxx is running on top of JACK.
>
>
> After I start JACK I have about 40 minutes of good sound quality from the
inputs. After this period the sound will begin to degrade slowly until it
is almost pure distortion.
>
> The issue is gone if I restart the JACK server, no need to reboot the
hardware. The description I gave above sounds a lot like soundcard clock
drift (which happens to those using more than one soundcard. You know)
which motivates me to believe we missed a bug somewhere around the recent
changes introduced in implicit feedback sync for Pioneer devices
>
> Dyndbg shows nothing useful I guess. No xruns reported.
>
> I've recorded a 1KHz tone and after 50+ minutes the sound degradation
kicks in. Only problem is even after cutting and encoding to mp3 128kbps
it's still a 10 megabytes file. I suppose I could post it to Soundcloud or
Mixcloud if anyone is interested.
>
> Is anyone else experiencing these symptoms with Pioneer hardware? Note
that the sound degradation kicks in after about an hour, more or less, and
it's for the inputs only. Outputs continue to operate fine without the need
to restart the JACK server every hour.
>
> Thanks everybody,
> Geraldo
