Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 871B83F9BD6
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 17:41:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 024261715;
	Fri, 27 Aug 2021 17:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 024261715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630078888;
	bh=kNJSbFlCehepjwfQ+Pqp0pkzZNiQMG9KMYwYHHkOJQU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XF4CHVV/3lVmcZdx/XbRL95GsiXa5qLjnco1VzlHQcbR8L+l4YlSs9Hi/fLyGbGxY
	 vAcJby7MMlyYYWQVZDnRBJuPW2rgEfBEpxT7XhnOf0Np4KtXw0YHTuRGQj4o40Uvm6
	 w2jxMdz7A6ORaxnJWHrNTTrg6XbNOeDoz0VwFeLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86E11F80054;
	Fri, 27 Aug 2021 17:40:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DAB4F80129; Fri, 27 Aug 2021 17:40:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1E4FF800FD
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 17:39:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1E4FF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="dWX0eNZz"
Received: by mail-pj1-x1032.google.com with SMTP id
 oc2-20020a17090b1c0200b00179e56772d6so9141405pjb.4
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hMuWH5EcDyaVARhDQbZOccIQ+VjBBxiLtLIni/BW1kA=;
 b=dWX0eNZzXXimz0SyRiCP5fUZ9A720kHKv0KmP1ScSImOfn4aLL10wRRZ9YuMeQOrrQ
 82jw9FlvSBemaOu9odYXearzlnJaXXEI7UzGwHNynQAACwOsuDOQNhC7ryq+6SToM9GU
 EejAnRP75MSp4rcco0OH37oSQW6Anwu6AFJgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hMuWH5EcDyaVARhDQbZOccIQ+VjBBxiLtLIni/BW1kA=;
 b=p2EY5pT6DtEWsYuKzCR+Kd7t20XWpMp29aS8ZXngmiP8nlNnZAwbSOS80aAeAl9N5H
 CsM+7MvBKqJYxvhmFjyUBlvGSSSwclbLt02gnErlFqOHrZDbiLmW92AJU0HZ1+TWyQqA
 OlPvnmR15P4hQPKE4jInwT/9pKYLCq9GORMzjzfV1RbNQMjTrqUpsjHlmZNSQxPYVmJ8
 jsz2jr20TTqlYeUPacMxKb3gd7A7VIp9QXWUSCayTGaKworH6pgd93KU82BHHPtKam3I
 kGYFLfcbvRm+8tNH6eHl4YmwoH9X3jb79++qaLd+OUIktQ6EqMXycHkqMkQ2oQFtTApR
 OFhQ==
X-Gm-Message-State: AOAM531sPjHdIiC3aloUaaBDarWY10vM9HFhN09IVew+zsffDkIsECeg
 t8tl41ObroF3+Q51+lmxp3O/Kw==
X-Google-Smtp-Source: ABdhPJzFokkTsbhLDyuDu/TTYkx4iDytznSen4Jp2AAcCTfjAlWV0k3q7niIhbn7cER6SHebF1k24w==
X-Received: by 2002:a17:90b:188f:: with SMTP id
 mn15mr23921207pjb.154.1630078792860; 
 Fri, 27 Aug 2021 08:39:52 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:48c6:7176:3bae:a573])
 by smtp.googlemail.com with ESMTPSA id 10sm7165381pjc.41.2021.08.27.08.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 08:39:52 -0700 (PDT)
Date: Fri, 27 Aug 2021 08:39:48 -0700
From: Zubin Mithra <zsm@chromium.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: pcm: fix divide error in snd_pcm_lib_ioctl
Message-ID: <YSkHRKoP0s9REufk@google.com>
References: <20210827004821.3658015-1-zsm@chromium.org>
 <s5hk0k7toc3.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hk0k7toc3.wl-tiwai@suse.de>
Cc: groeck@chromium.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

On Fri, Aug 27, 2021 at 08:05:00AM +0200, Takashi Iwai wrote:
> On Fri, 27 Aug 2021 02:48:21 +0200,
> Zubin Mithra wrote:
> > 
> > Syzkaller reported a divide error in snd_pcm_lib_ioctl. fifo_size
> > is of type snd_pcm_uframes_t(unsigned long). If frame_size
> > is 0x100000000, the error occurs.
> > 
> > Fixes: a9960e6a293e ("ALSA: pcm: fix fifo_size frame calculation")
> > Signed-off-by: Zubin Mithra <zsm@chromium.org>
> > ---
> >  sound/core/pcm_lib.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> > index 7d5883432085..e41b4e01aa37 100644
> > --- a/sound/core/pcm_lib.c
> > +++ b/sound/core/pcm_lib.c
> > @@ -1746,7 +1746,7 @@ static int snd_pcm_lib_ioctl_fifo_size(struct snd_pcm_substream *substream,
> >  		channels = params_channels(params);
> >  		frame_size = snd_pcm_format_size(format, channels);
> >  		if (frame_size > 0)
> > -			params->fifo_size /= (unsigned)frame_size;
> > +			params->fifo_size /= (unsigned long)frame_size;
> 
> I guess we can drop the cast completely, instead?
> It'd be less ugliness.

Sounds good, thanks, I've sent out a v2.

> 
> 
> Thanks!
> 
> Takashi
