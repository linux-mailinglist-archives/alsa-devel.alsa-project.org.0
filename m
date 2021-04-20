Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC06A365C63
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 17:44:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B41E1684;
	Tue, 20 Apr 2021 17:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B41E1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618933466;
	bh=ReH1vzzjU8qna3qbnKi2884KLDhjkD7mYWiu6CLfim8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d539qmhcNh568GJN97KPkjr6EU6SbCk8n+M70plPAcy/zLLOIuY/CZsYIjKCv3vM9
	 5h/E4RyYrW39qw1nuW5El+iFG+C/Az9i6g0UMQvXoXHisNXJpcBgSqVR951FKfvGIK
	 yD+FZdosgaTQFxl2M0D3qdRwLZ1Oix0PO3DYsrvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03A90F80168;
	Tue, 20 Apr 2021 17:42:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 455C2F80253; Tue, 20 Apr 2021 17:42:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EE81F8014D
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 17:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EE81F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jbveMRAo"
Received: by mail-ed1-x52d.google.com with SMTP id z5so9148325edr.11
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 08:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y/JByQa6Cc/e/OtsXLFh1k3impg7WneYZd37+JABYS0=;
 b=jbveMRAo0ouVE0RSasrBToluWLviF8oNTKo0Atn6e+Dte7kCsI8LXsmTp5ZAhFrsGc
 w+FjkD1smmBjWZpmLfFjoxsKQtDYvZguSqrX4rketzDluP9gzkdC6xHKxFG+BeRU/Ec+
 DvTCZSdzJ93H7yW9yfU6kVRZlwE0wfjUAy/yQSGfMNVg4y9RYIoikqOZhLEGx6ecy1E4
 dMUpTIc54jkzSz/XI1+st8T+1HzSFyPzkZZs+5xfIliMcYKGULHxcD9508PRiD2xrsDC
 ve1TQiTziWtrBefWzZCt6/eREbuBBe5SibDS8DppLvn9b57jd9+voPdn4wP00FoGCf8q
 TyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y/JByQa6Cc/e/OtsXLFh1k3impg7WneYZd37+JABYS0=;
 b=Ri2m2iYrTdwh1dr3/VNhpC+i25qRhRzSdrRxkESRx4wvkOqCpc1ISzsI+qsMXtw/OB
 5tymVXPT1+cEGWvjDi5Iuu9fhKLeQepJzMWq8tLcnIhjzMvWyVqStlpqJb1VzuOvIrYt
 5fq7ThPvtbNqGlCHIH4IUflI6/k9DpYm+ZbeOS0RoXSBOxPZYwa8vdXPXG9Afa26chr9
 JgyIVkZsI5rSNK+DooBrhbybjKx1f+UHvWelHOLKaFRaI/tnbuTK3EUN9gBm6l79ocv7
 BTvP9FHdp5YfmqjLRXBNLDn/a03ZjsuhmfZ5BRDHIK6NoevkZaq5PQVjk7Dr4X2+8v64
 kAFg==
X-Gm-Message-State: AOAM531yVY2KeyZ61fmED2dqjG385n+Ols7N9zlOi+T4PTta0gO52Eah
 MJ51SyL/LP/WGZ8X8KNRQdyx/NhVRJNID2XSSjmYzalID+4=
X-Google-Smtp-Source: ABdhPJzD5st6iALXKDZIzxtc66O1dejVI9s44FHIzYluq/GO5bOLTFj1YmLTDiJaO0+pHrHdOjTvS3E1fI+J0IWCCe4=
X-Received: by 2002:a05:6402:1cb9:: with SMTP id
 cz25mr21079011edb.163.1618933370965; 
 Tue, 20 Apr 2021 08:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210414083255.9527-1-tiwai@suse.de>
 <CAHXb3beNczUn-KWfO9P1Pa5+3piR8fDYHvoH5G08GmcvgR4Lxw@mail.gmail.com>
 <5949663.lOV4Wx5bFT@kam-desktop>
 <CAOsVg8p=yikaRQ-=RWdO8nWdC70tnw4kQ17KM-smShQvujrRJg@mail.gmail.com>
In-Reply-To: <CAOsVg8p=yikaRQ-=RWdO8nWdC70tnw4kQ17KM-smShQvujrRJg@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Tue, 20 Apr 2021 10:42:39 -0500
Message-ID: <CAOsVg8pY80Vgi1XhzzFmQ4bBxK+1boksw7RM7_avMd4hqE0ERQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Apply implicit feedback mode for BOSS
 devices
To: "Keith A. Milner" <maillist@superlative.org>
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

Sorry, in my haste, I mistakenly wrote:

> For me, silence due to the wrong line takes the form of unheard output
> playback, while still working for input capture, so I'm not sure this has
> any bearing on your issue.
>
Output playback silence occurred in one device (Roland INTEGRA-7 on higher
sample rates) which had the line IMPLICIT_FB_FIXED_DEV and needed
IMPLICIT_FB_BOTH_DEV.  So it's the opposite situation.  Capture issues,
such as yours, with arecord were exactly what I saw when a device used
IMPLICIT_FB_BOTH_DEV while needing IMPLICIT_FB_FIXED_DEV instead.

Here's one of my previous examples of a device not compatible with
IMPLICIT_FB_BOTH_DEV:

> Roland VG-99 doesn't capture, but plays well:
> arecord -D hw:VG99 -f S24_3LE -r 44100 -c 2 ./file.wav
> Recording WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
> 44100 Hz, Stereo
> arecord: xrun:1672: read/write error, state = PREPARED
>
> aplay -D hw:VG99 -f S24_3LE -r 44100 -c 2 ./other-file.wav
> Playing WAVE './other-file.wav' : Signed 24 bit Little Endian in 3bytes,
> Rate 44100 Hz, Stereo
>

I'm sorry if that caused confusion.  It does seem your issue could be the
very same as the VG-99's above.  That is, a device without "Asynchronous"
"Synch Type" for either of its "IN" or "OUT" endpoints.  In that case,
IMPLICIT_FB_FIXED_DEV should work.

Thanks, and sorry,

  Lucas
