Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E702719693F
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Mar 2020 21:40:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 775BE166B;
	Sat, 28 Mar 2020 21:39:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 775BE166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585428002;
	bh=rbUoQ23dTCg6cByib7LP8r2l5E77joa+6xKOEk0f/l8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LnoD0m/gDNwGvUXLX1GCziyRW59bESYbjgrrVIbBJYtmg5L/YRT8/vMkbp79nPzLV
	 LvK6xFtrFmHx5i5Z67nlk66xlF8aAPyOmj+s5Dae0KmuPPdNcs3oiWVW5NXq/Nzh8b
	 r6IMB3PAKYVQP7vAxCpVb74df5P24bjfM1KkTfJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EB39F80249;
	Sat, 28 Mar 2020 21:38:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA45EF80234; Sat, 28 Mar 2020 21:38:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 294C7F80146
 for <alsa-devel@alsa-project.org>; Sat, 28 Mar 2020 21:38:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 294C7F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jLEsVJ6N"
Received: by mail-wm1-x342.google.com with SMTP id z18so15398994wmk.2
 for <alsa-devel@alsa-project.org>; Sat, 28 Mar 2020 13:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YZun/LdY5Z7WhVMAoAIg3AxOSNX8DP0RQecMPvgrkMw=;
 b=jLEsVJ6NxLmtjxKlPqwk44E/a88Do8YJ++z16ywUoz2mskDf1Lne/iSoizR4EsxUp0
 xr7xMfJpHBrEMVc/Zxese1GYzxXBSwjy4mhlMZtHdNRIOG/uUslQI0UW0j9YMHesfyuz
 zZDD+GR6JOvxcglBClh5TBP8ESXeEF8EDxKa6BO3XQMjw/fB9gmi/6Cw63qt2sqKPvCq
 6xQwYgA0dv1wRJVNnjSqjqENo0ACgdukPqoZ3wQ/1+OThtMqYHoYMb8BfhoOu/PVNcZh
 vKDYFINLI7Gd++jb8f4zje53UXNYAxIUmW43h8l77Xfi+ggkR2LqrCudlEqV1D8MA8DA
 tY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YZun/LdY5Z7WhVMAoAIg3AxOSNX8DP0RQecMPvgrkMw=;
 b=i4jvUUXRG6ssLYYuuzvcm3awmUm2zQZ9Hiy47fCHGpfrNBZ/Bo3nUvJHUdmhE2DvAN
 S3/DQJhZ6ehjoHyxgrzSw3A3xjQdb4lNubTv7tQzCjQMtjZG2I/wRXrx0nKjk8ofFjMD
 o0i5J0ET9pkQ4SwX5towPMm9IJ2ieYOYtva0rv513GFTqMUjr7YUjHX3Fi2vHNx+UOVo
 PSb1kdeH+XP3Ej/Ehhsf3Tlut73fJmFtQaBVLV3HpnEWIitfZMCTbGidUNQXj7GNYvT3
 6j0saRVKZfRmClv3HGMxUCs5vqcVwF/A+K8+mSoY08pTSbM2rsdYnt+Hkt+DU3P1RLDl
 36AA==
X-Gm-Message-State: ANhLgQ1Pqz4cTopP0rNIwxOZwJDLsCUY7lGknITIQ5bl/x4KfA5aU2LT
 Yx8JFOwtLQgtKvfPsOhs5As=
X-Google-Smtp-Source: ADFU+vujAGr6pOiFKZCB7jFfOKRxpAR9iYQfu8B2dJ256q1SeUxrLCmB0eEFQKyrIY3+bj6VwfqsUg==
X-Received: by 2002:a1c:1f14:: with SMTP id f20mr5341242wmf.61.1585427889618; 
 Sat, 28 Mar 2020 13:38:09 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id i21sm14573954wmb.23.2020.03.28.13.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 13:38:09 -0700 (PDT)
Date: Sat, 28 Mar 2020 20:37:44 +0000
From: sylvain.bertrand@gmail.com
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: sw_params for a direct-ed(dmix) hw pcm
Message-ID: <20200328203744.GA2398@freedom>
References: <20200321155303.GB357@freedom> <20200325174419.GA1224@freedom>
 <alpine.DEB.2.21.2003261350380.2957@eliteleevi.tm.intel.com>
 <9d986c48-184a-1d6e-4c5b-172a7ecd98a8@perex.cz>
 <20200326200415.GA1321@freedom> <s5hlfnmfcdt.wl-tiwai@suse.de>
 <0b0f5117-3b4b-0c25-cd4b-0ecc72479635@perex.cz>
 <20200328182624.GA775@freedom>
 <1baab0fd-d802-3707-645f-d5dc4bf6c32c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1baab0fd-d802-3707-645f-d5dc4bf6c32c@linux.intel.com>
User-Agent: Mutt/ (2018-04-13)
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Sat, Mar 28, 2020 at 02:15:34PM -0500, Pierre-Louis Bossart wrote:
> I don't think it's possible unless the timestamps are taken really close to
> each other. There was some work some by Chris Hall in 2016 to revisit how
> the conversions were done and the past taken into account is a couple of ms,
> see ("time: Add history to cross timestamp interface supporting slower
> devices").
> 
> if your device is "shared", which implies a mixer, the notion of precise
> timestamps is rather questionable so you might be able to get-by with local
> interpolation in your plug-ins. Trying a full-blown conversion of the
> kernel-reported time is not really useful if the mixing granularity is in
> the ms range or more.
> 
> FWIW you also want to take MONOTONIC_RAW with a grain of salt. In a corner
> case w/ long tests lasting 48 hours we saw the timestamps reported by the
> kernel drift over time. the drift was minor (double-digit ppb - yes parts
> per billion) but the fixed-point math for the counters at some point impacts
> the results. Reading directly the TSC from userspace and doing
> floating-point math bypassed the rounding errors.

This is how I got into this: I was writting a naive audio application and
arrived at the point I needed timing information to do exactly that, a rough,
but enough, audio linear interpolation (with ffmpeg timestamp). I naively
configured alsa to use monotonic_raw, because avoiding ntp for audio timing was
a good idea, and when I did sample on my side the monotonic raw clock, I
realised that everything was off 100s of ms (alsa defaults to monotonic and
ignores monotonic_raw setting in the case of a shared device). I followed the
white rabbit, and here I stand. The cherry on top was the inconsistency about
the trigger timestamp (which is not meant to be close to the other timestamps).

This pushes to fix snd_pcm_sw_params_set_tstamp_type(): recursive along a pcm
plugin "pipeline" and return an error in the case of a setting difference from
the one chosen by dmix.
I am not confident at all since I have only a minimal perspective on alsa.

-- 
Sylvain
