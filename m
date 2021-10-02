Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D482541F9E1
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 06:47:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D3A31700;
	Sat,  2 Oct 2021 06:46:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D3A31700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633150029;
	bh=DexafnZ7ZpFrcb/ESfoCtV4x03KnXSAQxval/wsexEA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UB5lgRa9yCzXp19iwxIdVEPhLlQVXBM09XTIYCyL7sILyF8eCBREbYCR3m0vGwrcU
	 D9hKmcDldLksQDtk96efvWRKHWYNPXz6KH/U7IGEwA2JlQutWwqPXiANiBA7dltrDE
	 8oOY328WnQncJlb0oCNqkq0CeSRG/mIB8sI3tk04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98574F800D8;
	Sat,  2 Oct 2021 06:45:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38AB5F80227; Sat,  2 Oct 2021 06:45:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61710F800EF
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 06:45:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61710F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VYLBkE0h"
Received: by mail-vs1-xe2f.google.com with SMTP id f2so12789872vsj.4
 for <alsa-devel@alsa-project.org>; Fri, 01 Oct 2021 21:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QzS5xZx3tfg52Jlpte5KPpXOVhOT9SlIpZwbLAtuRME=;
 b=VYLBkE0hTlvBsdnJEclSi5uECDaikeWKiQLV4q3YhEPwqsDQLBJBTe8i4xhDxex2jo
 3K0aoWs6gWBSoevJm/Bt1ksvzUysKEnoqZVV5pWTvcoafWRYOXLR/udwXybC6Gk5vxJ1
 8tPbknuQbKV8xZWbDNA/P8gT2zzdR9lAGexRXwoFVt4rDb6P2OA944PKbU6MPZPJ7un5
 cwLAR6yR3Jbrzomx/LFw+8Oi6VSHc9FH2SP7sBGQrMYWUk9la9LnWG3AoB7l75mlwe9V
 8mv9vQmYxL6+K3LeEsZgS6VbfNRjxX88/mTp4t3tKXrF9+TQ2tZl5pc0bsaLsXEHt+wl
 WLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QzS5xZx3tfg52Jlpte5KPpXOVhOT9SlIpZwbLAtuRME=;
 b=Sjb65GXrfg7tQvd/NzgAHLiJjzkqohyqoQY3cBKs3HKG9LbSjXEF8awcwzerb0v5aY
 pbUqlIjJX/Td/Tz/qbl1VzzGZ3a5Rm2CauO1oE/63WqzORl6r6WROZ9vH46QepvgZii9
 urPscvXt4tdyJpqUQPoKsukW0aKatLkaULdj2CEVz3qlpBNzpcRJPFfdb38XrO24UEY/
 C0mIchZTmoPf/EY07vyEhYNOSYYHa6MQ7ReEKVnnLXi7J3LxtiuowPMwmWjHXM+sZda0
 EFfkAJrbCaJ/rTj+xL0Wd0udFDwF2DVuaFSQ02d1jYq/EorQpZpiV4QcGEMIGX0YQdi1
 R9XQ==
X-Gm-Message-State: AOAM532Z9l+fakFxnSgfwkgu49kUQMxv7T65mZ/rwS15WJJBhK5cnDcE
 VAZTNzJSL+VFyM5OXlzdsnM=
X-Google-Smtp-Source: ABdhPJzHKXWzgV0zhV+crRebC+sXSjNEheG7/4Z2l0Yt0HUnkZvX9pC8vNNwC+J4+yfD7VdeBZpl7g==
X-Received: by 2002:a05:6102:22d6:: with SMTP id
 a22mr7147809vsh.16.1633149936222; 
 Fri, 01 Oct 2021 21:45:36 -0700 (PDT)
Received: from geday ([2804:7f2:8280:6c81:98f0:31ff:fe93:2dc7])
 by smtp.gmail.com with ESMTPSA id n4sm4231355vsq.32.2021.10.01.21.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 21:45:35 -0700 (PDT)
Date: Sat, 2 Oct 2021 01:45:33 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Zhang Boyang <zhangboyang.id@gmail.com>
Subject: Re: [BUG?] Setting (start_threshold > stop_threshold) makes
 snd_pcm_writei(a_small_buffer) XRUN immediately
Message-ID: <YVfj7SA4uhYKWTH6@geday>
References: <0b00ad37-41a3-f078-6600-d3580ad903a1@gmail.com>
 <YVeawIksIf1wKa2s@geday> <YVevasDJYHjIxwjg@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVevasDJYHjIxwjg@geday>
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

On Fri, Oct 01, 2021 at 10:01:34PM -0300, Geraldo Nascimento wrote:
> On Fri, Oct 01, 2021 at 08:33:23PM -0300, Geraldo Nascimento wrote:
> > On Sat, Oct 02, 2021 at 01:31:12AM +0800, Zhang Boyang wrote:
> > > Hello,
> > 
> > Hello, Zhang!
> > 
> > > 
> > >    I'm using ALSA to develop an audio-streaming application. I try to 
> > > use start_threshold and stop_threshold in combination with small 
> > > buffers. However, I think I probably found a bug about this.
> > >    I'm setting start_threshold=100 and stop_threshold=50. I'm also using 
> > > a buffer of 44 frames. When I call 
> > > snd_pcm_writei(the_small_44_frames_buffer), pcm state came to XRUN from 
> > > PREPARED directly. I think this is a bug because the stream hasn't 
> > > started. It's hard to say a xrun occurred while stream not started.
> > >    I'm wondering if this is a ALSA-bug or a misuse of ALSA. A simple bug 
> > > test program is attached.
> > 
> > No, I don't think it's a bug. You're bound to run into problems with a
> > period size of only 44 frames.
> > 
> > Moreover, working with the code you provided, I was able to get a RUNNING
> > state without XRUNs with a period size of 4410 frames (100 milliseconds of
> > audio) but I had to comment out snd_pcm_sw_params_set_stop_threshold() for
> > it to work or I'd have those instant XRUNs.
> > 
> > That's how snd_pcm_sw_params_set_stop_threshold() is supposed to work by
> > the way. It creates a XRUN once the threshold is hit.
> 
> Oh, and snd_pcm_sw_params_set_stop_threshold() is a little
> counter-intuitive. The threshold you give the function is compared to
> the available free space in the ring buffer, not the filled space.
> 
> That's why lowering the stop threshold makes XRUNs more likely...
> 
> Thanks,
> Geraldo Nascimento

Zhang,

I was able to make your code work in the end, even with 44 frames
writes, which is unadvisable since it eats too much CPU specially if
they are low-end like the ARM64 box I'm writing you from.

The trick was to use high values such as 500000. Lower values such as
250000 were enough to trigger XRUNs in my machine. Of course you can set
it to -1 and it will ignore XRUNs but that's a bit like setting it to
16777216 or 4096 * 4096 which is a hardcoded limit in alsa-lib, I
believe.

And plainly ignoring XRUNs may sound bad under load, believe me.

Thank you,
Geraldo Nascimento


