Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE8DBB92
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 05:03:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55655166E;
	Fri, 18 Oct 2019 05:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55655166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571367785;
	bh=z4XcEYx2IMrgJwQHpEYI8hzmyv2i4sYKI9hzuN5cg+s=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u0rXqND2h7+hexzNaB105IXziVikqoOlU62KhuPK+4ui1g2WReMBhxRFiL1nIF+cO
	 ZyM45NC6zyVaVBcD5ectBJYOxjyFI5cLJ/YorscWVysU8eORJe090qIC9Hdi92BXiv
	 l3yC8t77/wpJvH2KABcOqLEcyN7zFvqjiYoBmiiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAB42F800D0;
	Fri, 18 Oct 2019 05:01:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74FF5F80362; Fri, 18 Oct 2019 05:01:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, ENV_AND_HDR_SPF_MATCH, HTML_MESSAGE,
 RCVD_IN_MSPIKE_H2, 
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8889F800F3
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 05:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8889F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="XyATqCCX"
Received: by mail-ed1-f51.google.com with SMTP id f20so3400689edv.8
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 20:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wUvtxFJQSkLF6CI/LPwEWa21oOaMMRd3HyWk7Up1eg4=;
 b=XyATqCCXmpM/EWJRQ9mHMPjKIRTUmd4OBlGcHg8Ba6ZetdGeNeSR31hJpDlOvP3zyN
 sQN/+XVlakeV1tZOK/c8drXPpcl7DXkPIf4h7XA0vptGtCWK8pldQAj8likYTWGKdANK
 jqKkAfcotiyT9ZElAWVPpeVM4LYKGpMCh6ll7TezFhtKeeXlKWK/3ow/q6oZjy6HUi1e
 JNrxM51Z1UgD0RsQZ+NBrZzahwOXYqjEUyGt76B44S4Ouqu2mVgRpUATO2QNZnVoYc0w
 r3nPiR7AXnBxgBsOFmx8AVlHbxvwYqaBGn/GcciUy26t3fMMwH7bsT/q8bMJrctOw+F7
 K7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wUvtxFJQSkLF6CI/LPwEWa21oOaMMRd3HyWk7Up1eg4=;
 b=FGXG1IRXh2ZTy+FQGtw+QD+tM2BFLowH0KBZLQBA4gTy/1CDlN4m5VAEhdLSfv285s
 30V0VWKMi+eVmTS8Vyg1aYGxnQsaRB2ZvLwPGD2PuQJeVGglJiS6jIXj4V4GVtcfU9cu
 zJJCmEOFLA0UHg6Yp5jDIeFACAJ6LAUWaWtLMJfdpivmzJW+bueoNgxbJvZJQkLCjoHb
 oGPCdvnVLPEcbIxGCzj5kyFEhEfP12ItacYhkeaHPUJz5hsEOpB7Sr/5tBVxcTZXUXNx
 rLui/BuPYb/khRTahWDzST2q4Gya1JwgQFKrpXkOulqR8fHxAGV/cmZD6z/bjJ8Jv7TI
 awfg==
X-Gm-Message-State: APjAAAV8Ij8pmryiPoaDL2wfniNxOU5grdYA7J804fA/0hpJ83AcNcVk
 NcaCh+jwEKgTuU/UO9VcIfwEKpMmOgDIZbUjOA4Idw==
X-Google-Smtp-Source: APXvYqwW0yX0Xx8qHedNMTgHq97WXiKmKB6ALNQmGhn3fVbWL/OcX050Y/NNjBaKvBgIBAqPzyvFcHVdIQU7HJHhFmA=
X-Received: by 2002:a50:8dc9:: with SMTP id s9mr7255880edh.168.1571367611203; 
 Thu, 17 Oct 2019 20:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <2146461867.4835752.1571321696465@mail.yahoo.com>
In-Reply-To: <2146461867.4835752.1571321696465@mail.yahoo.com>
From: Yu-hsuan Hsu <yuhsuan@google.com>
Date: Fri, 18 Oct 2019 10:59:59 +0800
Message-ID: <CAEy1m_CXrhr15RZz_Q+TiMGj4DMBbUV8sCobmmkhguYJWCw03Q@mail.gmail.com>
To: htl10@users.sourceforge.net
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Yu-Hsuan Hsu <yuhsuan@chromium.org>
Subject: Re: [alsa-devel] alsa conformance test fails to run for playback
	(and works for capture)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Hin-Tak,

How about using index instead? You should find the card index and device
index by running "aplay -l" command. The pcm format
is hw:{CARD_INDEX},{DEVICE_INDEX}.
See example part in
https://chromium.googlesource.com/chromiumos/platform/audiotest/+/refs/heads/master/alsa_conformance_test.md
for
more information.

Best,
Yu-Hsuan

On Thu, Oct 17, 2019 at 10:14 PM Hin-Tak Leung <htl10@users.sourceforge.net>
wrote:

> Hi Yu-Hsuan,
>
> I have encountered another problem with the alsa conformance test. It
> works for capture, but not for playback.
>
> The device is -
>
>
> http://wiki.seeedstudio.com/ReSpeaker_6-Mic_Circular_Array_kit_for_Raspberry_Pi/
>
> and running on a pi / raspbian buster.
>
> The actual message is:
>
> Fail - ALSA lib pcm_hw.c:1822:(_snd_pcm_hw_open) Invalid value for card
> snd_pcm_open hw:CARD=seeed8micvoi: No such device
>
> I think the truncation is harmless .
>
> The actual device name according to aplay -L is
> "hw:CARD=seeed8micvoicec,DEV=0" and as I noted earlier, arecord -L shows it
> as "hw:CARD=seeed8micvoicec,DEV=0" also, and the comformance test running
> in CAPTURE mode works, just not in PLAYBACK mode.
>
> Is there anything I can do to look further?
>
> Since it says "invalid value", I tried deleting the parameters around line
> 190 of src/alsa_conformance_helper.c, but perhaps I should do something
> else?
>
> src/alsa_conformance_helper.c-191-    conformance_timer_start(timer,
> SND_PCM_OPEN);
> src/alsa_conformance_helper.c:192:    rc = snd_pcm_open(handle,
> src/alsa_conformance_helper.c-193-                      dev_name,
> src/alsa_conformance_helper.c-194-                      stream,
> src/alsa_conformance_helper.c-195-                      SND_PCM_NONBLOCK |
> src/alsa_conformance_helper.c-196-
> SND_PCM_NO_AUTO_RESAMPLE |
> src/alsa_conformance_helper.c-197-
> SND_PCM_NO_AUTO_CHANNELS |
> src/alsa_conformance_helper.c-198-
> SND_PCM_NO_AUTO_FORMAT);
> src/alsa_conformance_helper.c-199-    conformance_timer_stop(timer,
> SND_PCM_OPEN);
>
>
> Regards,
> Hin-Tak
>
>
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
