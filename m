Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D676358911
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 17:58:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96322843;
	Thu,  8 Apr 2021 17:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96322843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617897509;
	bh=MhPMEw9dF+Cxd3VsA/Q64HaCj+4qAYIJ8sUgweT8tAs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rwrBnKo5dmZVALiJpFhOrLOr/1Ff3m5nW4sowEZkRXkuvO0+cvFhLut/j1HEcl5x5
	 U0QggieSgVB90zQ5xk7j/92IN1ddKwN2h1Oi4VFACqAL+QuUCZ2mieFhwrEi0x3m7y
	 8lwLX8cVTPGK+64KLUDH0m68i/zBaCCw7t0ij/vs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04575F80246;
	Thu,  8 Apr 2021 17:57:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3B84F8020B; Thu,  8 Apr 2021 17:57:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EAD5F800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 17:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EAD5F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="tD9kDmOA"
Received: by mail-yb1-xb29.google.com with SMTP id x189so3255390ybg.5
 for <alsa-devel@alsa-project.org>; Thu, 08 Apr 2021 08:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yj5fujlEed/xhWOfYiPDGk/QU1qBQCR+mRgAD+imNI8=;
 b=tD9kDmOAOUN9dor8ZIv4f9zzrsZyBG2Zt8si3mjfFlxqYrQTZZLxr8LK8OXnvPSf6c
 rdnwTrjERQSX4sY5qwSu1EABBwTwlpcwTYtSR0K8LKqvS2L6xB0cwLejlR5mFKNWfnHb
 Tt8umv8DzIZYEKul5T8xc9YevDPjYnuf84AqPKu+0AfaNBsbZzadN7kcNsc8A6LsXfHx
 OkfpZKyIePtllNZMuu87x1xK0cnTrUl3UZ4XtC6V62rjuFWW8NvIU4WXYxkMCoXaLuNg
 cuvDrGxLXi+ejwK4jrZMUdq8VZAR/traAWUw8ed4VPHqRHZU0ksnuLxHCye8ju7h7yDN
 YmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yj5fujlEed/xhWOfYiPDGk/QU1qBQCR+mRgAD+imNI8=;
 b=cl2rFHYtiCIZnPSdVRMrDdA0kqhDfgnsptKGikCmNa/dqtxKTSoTvnxjfvYPKu40i8
 UsHgmSzne8NLoFaMkhJbhLZZ48XVswbjUcvTgRIkGzGR07Ff4x2brHmMap76Ak+C6moh
 q8ICF9/meN7+7xzBHIEK+88NOaRCEezU3Wv+AF39rzx+SlkfCTKch5rZ8IIka3JLOdEy
 Uy++kkxkIxqXRAvWnWt99fMtjZ+p7jzDDfldqEiES3iJmI8gaTPEJG6zntc/zhTC3DR7
 +T9/6hGNnHv5SEO8fh6MCSCac5T/3IBtdn4hIyuDTOwgCv7f2TsJYfbiPdgsq8vG03HK
 KOCQ==
X-Gm-Message-State: AOAM533rQasRDEu1/7ry866Fu2MymDT2hm6dek0DrkqrE/tqCXgLByWj
 /+e2AlejxlFTpJ8qEZfjGDooGUESN71Jq/1hbP/LEg==
X-Google-Smtp-Source: ABdhPJxTPuSKmoj99CA8YiI825Z2IqUwB87GDClBjN7gQtZVGbsUWXhSQGMK2XuzSEU7N0InU8LoKrQxMrUX3YHyYwI=
X-Received: by 2002:a25:5004:: with SMTP id e4mr12230469ybb.144.1617897414208; 
 Thu, 08 Apr 2021 08:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
 <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
 <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
 <CAHXb3bfD_YivP3r4wOeb8bcXmAU+_+eeZwudW6f1pxfYtpnq1g@mail.gmail.com>
 <CAEsQvcsCJUi8eP_t8MGUKf0zSf7Zmqiof8b0fmk-XhZtUScbmg@mail.gmail.com>
 <CAEsQvcspNZFS4gbS=dQ1enkshVnG+-=xvoc8kskmoweTQjQhRw@mail.gmail.com>
 <CAOsVg8raD8enyWELM4w17dZCe=1Vy2s+7RLszVko4aRLmj7jDA@mail.gmail.com>
In-Reply-To: <CAOsVg8raD8enyWELM4w17dZCe=1Vy2s+7RLszVko4aRLmj7jDA@mail.gmail.com>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Thu, 8 Apr 2021 08:56:45 -0700
Message-ID: <CAHXb3bc0XSc4g8p-Fd-c80p=o+ZNeP=QAf5tKF=3VvXS1q5+Ew@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Lucas <jaffa225man@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Geraldo Nascimento <geraldogabriel@gmail.com>
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

Lucas - great to hear that the endpoint patch fixed your crackles!

I'm curious if you get any different results enabling feedback on the
capture endpoint. I'm also curious about the output from "lsusb -v" for
your device and whether the implicit feedback setup looks like the GT-1.

I'm not exactly sure what it even means to have the capture endpoint set up
with implicit feedback as most of the implicit feedback code seems to deal
only with playback. The bit of code in endpoint.c that I patched out, for
example, only runs on playback endpoints.

I *think* the existing code may effectively just be completely turning off
implicit feedback for these devices. This results in audio playback/capture
that "works", but is susceptible to pops/crackles due to small timing
mismatches.

Mike

On Wed, Apr 7, 2021 at 10:36 PM Lucas <jaffa225man@gmail.com> wrote:

> Well, I just got back from testing Mike's suggestion of setting the Roland
> Boutique D-05 as a playback quirk, disabling its capture quirk, and setting
> that endpoint test section to always be skipped.  Sure, enough, the D-05's
> playback is now perfectly crystal clear without the crackles associated
> with an LP record.
>
> This is just a guess until I recompile again, but my capture from the D-05
> reports a read error, seemingly just as the vanilla mainline kernel does,
> and I think it's because I disabled its capture quirk line.  So, it seems
> to me that the D-05 needs both quirk table entries, whether or not the GT-1
> does.
>
