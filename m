Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAAD35A49E
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 19:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D927169B;
	Fri,  9 Apr 2021 19:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D927169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617989336;
	bh=6icB+4ryQqi0ch1UQAoviO6sdlVTG/U47uVidxpO71g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ey3vLNrC0p8Skws0NL1ZhyOHLt+dK2DzGWXlbHy6S/rTuBCBS8vLw/Q9g6kQznwLv
	 65GR+LNMY8lgJ60u4sw5fzIZIAWzItWOfFWAzP2kPXHicYYCljDBWxhZhw8fms8htH
	 TrOnLjyic8lQOOpESD+wflnasnLAPINJRp4mJGAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5B95F800EE;
	Fri,  9 Apr 2021 19:27:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D6B2F8016A; Fri,  9 Apr 2021 19:27:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, PRX_BODYSUB_1, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8635DF80162
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 19:27:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8635DF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iFVPsiaY"
Received: by mail-qt1-x835.google.com with SMTP id j7so4747793qtx.5
 for <alsa-devel@alsa-project.org>; Fri, 09 Apr 2021 10:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yE1qMlQpPtcw8G+z+BgAZ1JcGnGkSSf4ne+Q1/Wn5UY=;
 b=iFVPsiaY88AG0RyHPHmyURqMJGzcZfrLPIgMjgC/hUoeSjgBH5FzzqDyVyimAkpTMU
 Wei9UxaxM3usGABcIxngc9URX1HLRhCvWm/vXbeF1l/YVVlNn5JSly/swZ/SMOvHe9eZ
 5aBA6oYt7JDEih8qQ+5f+ilhd6QMhsdrNrT3kBMw8d+vMIdzlLzwo6XORuYthS1cBP1A
 m01pWn4D1sPdWr/cQQUmuSBc6FA7X49BYLyau4ohkTZV1jhgde/I3hLSzJJfbw91LNA2
 SgDVLy4U0h0hUKnLT5IdCIbis5MMMLN/JtAO4OUEnwUJv1omiPRkqTZPNytnKJHbi+we
 9ndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yE1qMlQpPtcw8G+z+BgAZ1JcGnGkSSf4ne+Q1/Wn5UY=;
 b=o/bLJlk+JTVPDUM0E6wnaB3Xmw6fMYG1yBWBBAGYTsfKv7aLqbrHzlQUmvglLlO7gg
 Lks3fNDA8za8Lx/86ucgJBbt4wegLe7Ez4LEsQkuowAkwwuD2iW/WbALYZERGs3J1oW9
 prQSJ2uB+5zrz4BEnzerxHLuGPKYmUipa8FfXMSEQz0yz4SdU1WcKB1Zcejh33MtD5+W
 ZYbKcOX8IDZlXCE8axTDkeZL7MlSvrkVIyvezxcaPDDBc0innVsWVuGtV2W4gjd2g8GS
 018D51+saR+hEINIzQit4/J+G5oj4DZEN179C14K4DZfVW9Gw/KhOfSoYseC5j56DXiv
 +I1w==
X-Gm-Message-State: AOAM533mIgA36/uoS6Jlk4uzC4mBX5G9hoeYXDthxePKJj5esezKaAUy
 2MzTYlB3Akq0fo4lNjFMs/e1LndvQpoeuj0CjbM=
X-Google-Smtp-Source: ABdhPJyST4+g78r6KGzz5Qdiok+xYVRv9AP5teLtg0jEPJO8RK46uGdCCB1ZrjJ61HDXHB7PqZw88YzAJpY+/DdoQXY=
X-Received: by 2002:ac8:5055:: with SMTP id h21mr14174270qtm.142.1617989235357; 
 Fri, 09 Apr 2021 10:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvcs9LcciAYjoB64Kt_VaSww4EAW4-qN0ED5jDA0GeeTtDg@mail.gmail.com>
 <20210409110745.kbr5z2jinsaur2ac@base.nu>
In-Reply-To: <20210409110745.kbr5z2jinsaur2ac@base.nu>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Fri, 9 Apr 2021 14:31:57 -0300
Message-ID: <CAEsQvcuZMprAnZ2gCoT3LxkeWdxU29=8Z7XvmRNir3nwy0yg_Q@mail.gmail.com>
Subject: Re: [PATCH v2] Pioneer devices: engage implicit feedback sync for
 playback
To: Olivia Mackintosh <livvy@base.nu>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi, Olivia, thank you, glad you catched this and are able to test and debug
it. Let me know if I can be of any assistance.

Em Sex, 9 de abr de 2021 08:09, Olivia Mackintosh <livvy@base.nu> escreveu:

> On Mon, Apr 05, 2021 at 10:49:20AM -0300, Geraldo wrote:
> > Dear Linux users of Pioneer gear, please disregard v1 of this patch and
> > test this instead if at all possible.
> >
> > My initial assessment that we needed to let the capture EP be opened
> twice
> > was clearly proven wrong by further testing. This is good because if we
> > really needed that it would require a lot of reengineering inside ALSA.
> >
> > One thing that still boggles my mind though is why we need a special
> > Pioneer case inside snd_usb_parse_implicit_fb_quirk that returns 1 like a
> > capture quirk was found.
> >
> > This is a highly experimental patch on top of 5.12-rc6 that's supposed to
> > engage implicit feedback sync on the playback for Pioneer devices.
> Without
> > implicit feedback sync the inputs started glitching due to clock drift in
> > about an hour in my Pioneer DJ DDJ-SR2.
> >
> > Once again I'd like to thank Takashi Iwai. He's the true author of the
> bulk
> > of this code, I just adapted it and coerced it into working.
> >
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
>
> Thank you Geraldo and Takashi for working on this patch. I'm currently
> in the process of testing with the DJM-750 but it currently does not
> work as expected. I'll debug futher and report back but would like to
> make you aware of this in the meantime. It may not be a a fundamental
> issue with the patch, but rather something incidental.
>
> Kind regards,
> Olivia
>
