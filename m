Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6FD3943ED
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 16:15:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D04F16CD;
	Fri, 28 May 2021 16:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D04F16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622211357;
	bh=9JK10uQeYMeMHToAz0WaBXwWutFWBudOHA4z0pMnuqk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BLys9GGIRKRegI8W7HxcyNRQyeQ+ApC0Q6xF4LvgplXdOEcLktXZaCwIY3tRfBp7a
	 M15oLLQa6qHmWHT6nOQJnQcEEWOzT59GLd0H+cbu/W4lEJDE1agIdztajcpPJw4A3U
	 nA4o1hcIgplVgTfgviSofC7qavwA9TWt8OSuXPyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBF15F804AD;
	Fri, 28 May 2021 16:14:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3446F800B6; Wed, 26 May 2021 00:15:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BEF1F800B6
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 00:15:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BEF1F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=philpotter-co-uk.20150623.gappssmtp.com
 header.i=@philpotter-co-uk.20150623.gappssmtp.com header.b="HiiwB5vF"
Received: by mail-wm1-x334.google.com with SMTP id h3so4814803wmq.3
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 15:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lwWvg+8eBSUrALdD90b3evPDsvDCWlcbDSlk/RnjE4I=;
 b=HiiwB5vFM/WlazygqEXLUp6F9b2XjW1GlGXYxdLPHmuxzY+oPyrI62Zjbt1H/+Wkay
 u1TOebUXzsbpGqNQWMtnFUUr8KYgWBH5FUP6KUIhAs5UWloevmL6Q3/qOGt+gtahZsUQ
 0biPoOWIYu90sydoep9XF1SkGoa1TJLdO9Ps+mE3ztY8K92NZP4j6hhFGsfX+Bp1hLoO
 K5dZAmts+aqXkkfNb0VVJdxNz98ExbxoLdtjbdJJSsHoytGC07b/riApoJrveg+YsKYa
 z63jKmJblDbnbRhaIqytDk2abj2a/9fXWPFQEQmwm53yAPxrrZ1LRYUjMX9lj/85XlVH
 KVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lwWvg+8eBSUrALdD90b3evPDsvDCWlcbDSlk/RnjE4I=;
 b=fZfgtdkvC7XRKPAEf/bmMgnOq9INpAUoXB+zm4FYbKBfFgfHvdAQMzx/6vKYXERbpg
 4RG3EyZyxKkNHyMdlHk/WT0h6dMel3W5IXdrUKyPI2ET4zDNzZhBqMTJUupv68BdHWTY
 90nZ009CpDa/7szo03nwEjrEWfGfKUHRLyT4apHmoyDBz7IlPrEFmBUVvp6M2wXmDNx1
 4X28GptnLsvJXavMZPE/Wi2yWnPgbeV2uFiQtRDqT4H+DqqJJxX3R+Noe3ihaOqP96an
 qODjG02/c/CMDdNWXqJm4CCyHJ8Exv4KUSLeZbMyBs9oaqZiPI1Z3TRJX9YUTDWInFAw
 0+yw==
X-Gm-Message-State: AOAM532mVIEI7FSDcYFKPPKP1JI2GWtUJIeCajqYSrbGOiwd7cWYr9OU
 J4qGg2wcHMyiC2nntGwwjcEFeg==
X-Google-Smtp-Source: ABdhPJzGaRvaacHgysu3rMF2tlSe+VL6zv8JVFKVEjR3CD82uVhWkcNFMEg0rz44pjAhIiolMSN4dw==
X-Received: by 2002:a1c:e243:: with SMTP id z64mr4165947wmg.126.1621980919891; 
 Tue, 25 May 2021 15:15:19 -0700 (PDT)
Received: from equinox
 (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:dfde:e1a0::2])
 by smtp.gmail.com with ESMTPSA id 10sm4134722wmi.7.2021.05.25.15.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:15:19 -0700 (PDT)
Date: Tue, 25 May 2021 23:15:17 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.10 30/62] ASoC: rt5645: add error checking to
 rt5645_probe function
Message-ID: <YK129caVtNBthNDG@equinox>
References: <20210524144744.2497894-1-sashal@kernel.org>
 <20210524144744.2497894-30-sashal@kernel.org>
 <YK1w+H70aqLGDaDl@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YK1w+H70aqLGDaDl@sirena.org.uk>
X-Mailman-Approved-At: Fri, 28 May 2021 16:14:26 +0200
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Tue, May 25, 2021 at 10:49:44PM +0100, Mark Brown wrote:
> On Mon, May 24, 2021 at 10:47:11AM -0400, Sasha Levin wrote:
> > From: Phillip Potter <phil@philpotter.co.uk>
> > 
> > [ Upstream commit 5e70b8e22b64eed13d5bbebcb5911dae65bf8c6b ]
> > 
> > Check for return value from various snd_soc_dapm_* calls, as many of
> > them can return errors and this should be handled. Also, reintroduce
> > the allocation failure check for rt5645->eq_param as well. Make all
> 
> Now I've looked at the patch I don't think it's appropriate for
> stable, it's essentially equivalent to a patch that adds -Werror
> - the changes in it are upgrading things from error messages that
> would be generated by what are essentially static checks (even
> though we do do them at runtime they're on hard coded strings) to
> probe failures which would be a regression.  Unfortunately people
> do ignore warnings like that in shipping stuff so it's possible
> it's happening, we could do an audit to see if it is but it seems
> like more effort than it's worth.
> 
> The only case I can think where it might help is if we're
> managing to OOM during probe() but that feels very unlikely to
> happen, and improved handling unlikely to make substantial
> difference compared to the risk that the routing warnings are
> triggering but being ignored so someone's sound stops working due
> to a stable update.  Otherwise it won't do much so why risk it?

Dear Mark,

So I frankly don't have the experience to disagree with you :-) Your
reasoning certainly seems sound to me. My original motivation for the
patch (after discussion with others within the mentorship process) was
that some other sound SoC drivers do this, an example being the Ux500. I
defer to the decision of the community as a whole of course, and am
happy with whatever is decided.

Regards,
Phil
