Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4071F1E99
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 19:51:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A7F81671;
	Mon,  8 Jun 2020 19:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A7F81671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591638693;
	bh=3uPFmibQSNdLfJAus6uDw1XPUOlavwMFx6F/rsz6XnY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gFi1nBuV85Tz/9L6VkPRhIPT4afRXONOq8ifHfSwR3FQgGM1nyf1KMvd8WfdWoLkI
	 UK651EvRf17sJ6b5lBUG7mhyTY36NB6aEYCtIYzooYA84EwXVp4dOmTO2KPoXC5sdS
	 LOhQ9V1S8sPUbvwJeOVoYTwTnB7N5/8jxYV+7W/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCAD5F80124;
	Mon,  8 Jun 2020 19:49:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F08B5F8021C; Mon,  8 Jun 2020 19:49:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 422DBF80124
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 19:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 422DBF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="P5tmP3Ly"
Received: by mail-yb1-xb41.google.com with SMTP id n123so9645230ybf.11
 for <alsa-devel@alsa-project.org>; Mon, 08 Jun 2020 10:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AI4csu3OgcvWHV91QGF2PfG+wAliZMEPRt10u0gpkYU=;
 b=P5tmP3Lyo6j8Cy98hDV4Yjyh9++a4+Q6PQhlC5ONEIqWlB1B+TtLxu0TcoLeUgp752
 gmg433PMCjPPg8vl9pGlQKE0oWRQlxeIrKu8eC8CIvmw4IkBnkhis8qlTqGWY5uqWxEX
 V9PHjl4CdEKfe0jG4a5MXK/ZL4kkB1got1H8tWz8e7nYBY3ihCL5NKsLq8fepkN7SWgh
 8eiqwD20GA4nQDJ4Em+WPx7lDZJccBU1eqPN6ZupPu+Unvy+a9QTo+ut4tgLsV4Hs3dm
 HfhVdvK8cdmp8ntt3H8gt4+7Hm9o7s80NfuTGgWncfNqH+zgWVu9DZjZob1A66r61Bem
 j1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AI4csu3OgcvWHV91QGF2PfG+wAliZMEPRt10u0gpkYU=;
 b=lSzv5gcsKCeyf9TDa2D5AiTjmKufKhP0tj2cOuilqJRNf41lWBsrVf4FJAGQW6rGc/
 cNX32U2Z7jNsxEsJZWkeYp5wOVDzxzv8Isxa+RHvxPJiBAtc1KJe7YrqezQPVyr5Bpg8
 a/xeUnhdIh0PLD7qk1LxNXQK25SbtGvva8nUROhz8Br6WViijP1J/zD09PFaqJCmt3ns
 U+Pj2Lt2t0+MNPbgVNT+BUdd3/E7Wt/WGK7is2XrocRyRUCO4esCQMmQxgNhDi/fsm5N
 aKum+m3oGGpk41SthAsShGyfzEAW9zOo5+9xiHT4NwMmqGKZsNOPo26W5r2sesGsB1eY
 BWsA==
X-Gm-Message-State: AOAM532ygsSbUDysCUcwcYDhp5WlxrqMCJimpxWQ0DqX8bat1wRYh92N
 DwtswB0QOuu+jtaJtrKLh11p09Z8MRUssGt5YksEaw==
X-Google-Smtp-Source: ABdhPJyDa3dYQ/+i1J/aMSQsh1tMnRJeeB9/v5t2PxDB7YXzYoeS/vg2mpNC9Fl8WFDYkMDZR+HxLB6bWO9idjXvgyw=
X-Received: by 2002:a25:b8c:: with SMTP id 134mr4421205ybl.428.1591638583128; 
 Mon, 08 Jun 2020 10:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190204093910.23878-1-perex@perex.cz>
 <20190326140928.GC10898@sirena.org.uk>
 <s5hva0567vs.wl-tiwai@suse.de>
 <CACL=Q7we61BwO81W7tQFvb9ohkBZkk34DSXL2B-Ky2B6zfWk1A@mail.gmail.com>
 <f5b429c6-803c-b624-6d39-5001c76e892f@perex.cz> <s5hd0lcppbn.wl-tiwai@suse.de>
 <CACL=Q7xSpeqyQzDyexCr+Nxs+nf3o9doaHGxiu-y8biK9w_9YQ@mail.gmail.com>
 <20200608134546.GG4593@sirena.org.uk>
In-Reply-To: <20200608134546.GG4593@sirena.org.uk>
From: Phil Burk <philburk@google.com>
Date: Mon, 8 Jun 2020 10:49:31 -0700
Message-ID: <CACL=Q7x43Udp_KA0C-N4+vcQ1MZ4NQt_xvf-nn6fRERRuz1tRg@mail.gmail.com>
Subject: Re: [PATCH 0/2 v4] ALSA: pcm: anonymous dup implementation
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Baolin Wang <baolin.wang@linaro.org>, Takashi Iwai <tiwai@suse.de>,
 Zach Riggle <riggle@google.com>, Leo Yan <leo.yan@linaro.org>
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

Hello Mark,

Thank you for keeping this moving forward.

We sent the patches out to several SOC vendors for Android last year.
They thanked us and said they would send feedback but never did.
I pinged them again.

If we cannot get the changes tested by partners then I will try to get them
tested internally.

For reference, this is being tracked internally at b/119712034

Thanks,
Phil Burk



On Mon, Jun 8, 2020 at 6:45 AM Mark Brown <broonie@kernel.org> wrote:

> On Tue, Apr 23, 2019 at 01:11:50PM -0700, Phil Burk wrote:
> > Hello Takashi,
> >
> > Sorry for the late reply. I got pulled off on some other projects.
> >
> > We will try to test this in-house but we will need Qualcomm's help.
> > I will also try to get some of our SOC partners to help with testing.
>
> Did anything ever happen with this testing?  These anonymous mmap
> patches never got merged.
>
