Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F5F62EDA3
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 07:32:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF73316BA;
	Fri, 18 Nov 2022 07:32:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF73316BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668753177;
	bh=bTFq1oiqjVgyZgKLLJ1pevo/xpEoI2RvSWdY+1HTHgM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kIYyuYWYy0YJ6QTSg9uaJwTbwsdVGqMkIRmkhPnG32v8W9vOraQ0j6pbvfzOEuq57
	 7XtFnsD971j1a7FPksR8citExsv7yvVXVwvqrLfrz92YyHrFiJx8lRQBpVVARfAVTK
	 XOpdoFupScuzumYm9cG5bu2H3EGJ6bcHagjkxFC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45209F8020D;
	Fri, 18 Nov 2022 07:32:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC7B6F801D8; Fri, 18 Nov 2022 07:32:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FSL_HELO_FAKE,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10B46F800B8
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 07:31:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10B46F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cDvyxai/"
Received: by mail-pg1-x52b.google.com with SMTP id o13so4195576pgu.7
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 22:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2NYDcOh5n1h0+3JmFt6OBHp8y607KAymyMlNfD86cHQ=;
 b=cDvyxai/no61jb0OqF0aMtz6WqFdoA6s+9a4NZgMCjxROG/jJZSE/hHUeLHWTKGAZF
 U1niJ0U/5ezYtDmASd0UvyFkxpX15Y3t0Wy5bj75gbHdMU4ZrMwzEGf4pVXoVXUUzImM
 KrmQy6ZtItcY1Q9Mx1JljRcT5q/Y1Na7yqgaPFGX6QotwvKs2HyyoVEk8/jjhyi6NsPQ
 GKNFi81b/z8RzK5EafYt3Hy2jCWd7+sW/PVsCdsqvsZ706/SQZmqvO7CHCl9n6bK/FaM
 dRw3+P8FOauBcnwMknptIMnnZ4GjOzoO4fmvBvg5HTOCYPDccnm0G8PHo9E14BN2rvp0
 vMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2NYDcOh5n1h0+3JmFt6OBHp8y607KAymyMlNfD86cHQ=;
 b=vpPh4WhiJrX1q0PrXwW0Dy0HIWC8F0mzMdJp12TrD8m2eK8enkp0X4k+btmj/51CZz
 h5LPKzgQQ5N1s07e85E2GslQPsBrz6bi6Tm/mZWiFVZWdmYJFWK7FDgV+IoxcoMWHl61
 N6sB1+4zkYhejr19LzIefQEdsPZEHavKEENSqVQ7OT5xOGszzih8yQ8PQh9QWmTNeJk5
 s5XotPX37Hd84OL7xxXQkX472zyk6lrS0fgxNGarqOdvdodVyq88zbBuvQAobnfH10vM
 aS6MS5lv65GssOW/m+v/6x97zobI0Uj8pJmk4L0fKyzB3WMQC0O3z5nRRub53hYSm2ig
 L96A==
X-Gm-Message-State: ANoB5pmo0tzQ1sKJaJeLB61PdrUmAvBh3Bab3KFPpcBmxQSf1x7IFVQH
 b2BGk5mPejBmCbEhGF57Bco=
X-Google-Smtp-Source: AA0mqf5DR/Q9FiW5k+t7mdG5PItHqfyZV5K8uA3eiba29lpUhIJc47LTBFEz1d+DDTWuFtxQvpzDSA==
X-Received: by 2002:a63:5c1e:0:b0:46e:96ba:494d with SMTP id
 q30-20020a635c1e000000b0046e96ba494dmr5365390pgb.404.1668753113281; 
 Thu, 17 Nov 2022 22:31:53 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e4c5:c31d:4c68:97a0])
 by smtp.gmail.com with ESMTPSA id
 nd13-20020a17090b4ccd00b0020de216d0f7sm1981661pjb.18.2022.11.17.22.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 22:31:52 -0800 (PST)
Date: Thu, 17 Nov 2022 22:31:49 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 01/11] ASoC: ak5386: switch to using gpiod API
Message-ID: <Y3cm1eeDN+n3tbpG@google.com>
References: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
 <Y3S9KzTE1/UQDmJl@sirena.org.uk> <Y3U1BJAPOJTLw/Zb@google.com>
 <Y3YcLulaebidYYsg@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3YcLulaebidYYsg@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
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

On Thu, Nov 17, 2022 at 11:34:06AM +0000, Mark Brown wrote:
> On Wed, Nov 16, 2022 at 11:07:48AM -0800, Dmitry Torokhov wrote:
> > On Wed, Nov 16, 2022 at 10:36:27AM +0000, Mark Brown wrote:
> 
> > > How are we ensuring that people have described signals as active
> > > low/high in existing DTs, and are we positive that the signal is
> > > described as active low for all devices?  In particular if the
> > > signal is described as a reset signal then it's active high even
> > > if we want it low while the device is actually in use.
> 
> > I have been going through in-kernel DTSes and adjusting ones that are
> > incorrect. For external ones I think we should take a pragmatic approach
> > and say that if driver has last non-mechanical update in 2014 and there
> > are no users submitted to mainline since then (as this one), then it is
> > highly unlikely that devices currently using this component/codec will
> > be updated to the 6.2+ kernel even if they are still in service. And if
> > this does happen the breakage will be immediately obvious as we'll keep
> > the codec in reset state.
> 
> > But if you really want to I can add quirk(s) to gpiolib forcing this
> > line to be treated as active-low regardless of what specified in DTS.
> > This kind of negates benefit of going to gpiod though.
> 
> That doesn't address the bit about checking that the device
> describes the signal as active low in hardware - it's assuming
> that the signal is described by the device as an active low
> reset and not for example as a shutdown signal.

Huh? If we add a quirk to gpiolib to treat the signal as active low
(i.e. preserve current driver behavior - I am talking about this
particular peripheral here, not treating everything as active low of
course).

> 
> TBH I'm not thrilled about just randomly breaking ABI
> compatibility for neatness reasons, it's really not helping
> people take device tree ABI compatibility seriously.

Yes, I freely admit I do not take device tree ABI compatibility
seriously. IMO, with the exception of a few peripherals, it is a
solution in search of a problem, and we declared stability of it too
early, before we came up with reasonable rules for how resources should
be described. I strongly believe that in vast majority of cases devices
with out-of-tree DTs will not be updated to upstream kernels as this
requires significant engineering effort and vendors usually not
interested in doing that.

Thanks.

-- 
Dmitry
