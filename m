Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D477A1F7B07
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 17:39:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 571CF1680;
	Fri, 12 Jun 2020 17:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 571CF1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591976362;
	bh=zC1RlXUjFL4ErYnGrV8z4rOVC2hccUQKPpcIEKwiVTg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SmqAF4P6VNA8JjJmypy3xoBTezWW70eSn4rWiju/RePb6adahJiTAl8bdIL07yTXl
	 l5K5v8jxGaSDqJeNf5eLHYF4huFaxgDtjYRpw0DJl4Wabgb2kYz2fhURGX6b+PMGTD
	 OvRwDZ4mh2c0cBmwgSuH51T4/F+dOnJvHt6w+sgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C3EFF800C7;
	Fri, 12 Jun 2020 17:37:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0C45F8021C; Fri, 12 Jun 2020 17:37:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5A73F800CC
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 17:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5A73F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OhXfN3AB"
Received: by mail-pf1-x444.google.com with SMTP id 23so4455484pfw.10
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 08:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yeQePqg3uWAwrie1fUmEupGOkhDXHe9EBr4w1yLk0WI=;
 b=OhXfN3AB8RZ9P+/tL0HI8nayoWUxdl956odNAbxbgFNQnDcB0NrFtAFhFM4Dj8pWCM
 t3QKzk7C1GXr731BMbQdOe5yt0G5m8VSAp6wYHBRXLeF6sogLntHKxC4mlVkuQuOCQgB
 fUfHsLR5S7YsIyHs7tWJUQJ7LsGYJXLqT5Ls3P5dqNr6vPBS8tR3GSeq5zzWOHCIOgR8
 bYH5khodwPW6SrRuQ5kYp8N/VkE6StVpyG6Tp2RLdyHTfK5rffkraKb46aQdFQePecyY
 OhLTzwyZpzd5WQU+a3oMkRxZcl4ZLwkWvGyeYflfcs7Crq2X8DBG5UdesonwEFd+35UK
 AlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yeQePqg3uWAwrie1fUmEupGOkhDXHe9EBr4w1yLk0WI=;
 b=ZMb7YNy3mRSS+n0dzLB+abxTvTsbvuCzYrw4a29Pc63I4sUZkyZA61UovH/iT5zsYF
 LBTMz0n6m5NXkYCmoa9YftMVKZkwc9VxKgF7tIH+e4KMpyjvsjGuviQ+ws9aQpOF6bR4
 RBwozs/YSZc/CAJIMK+/DXVK+YkDVwz4itvcMVZtMdRlR++OwoIk7uGaq4tVT4xtEUqC
 kSFFGbB6JuH7sxcqWISB6PxlN/t50IRaKhU1N+zYhyaDtQYmv1d3axQb+OJVd+gZyI3E
 Ehida3mSNdEgGsHYBwjsEmW0yVIJ/dHhIk3B0HJWWXp3t2h+Pi5GC4dqhpMy+XsifMhE
 Qtxw==
X-Gm-Message-State: AOAM531RHkiZ3HJGCev2aNcIcCogmpvK8zvOQi/4BEqeKlykX0930Cll
 +7qemZmQhPrHCo7bRsmY01siV+YjzVwqVFKt
X-Google-Smtp-Source: ABdhPJx3K+XSpLrzivT/rI9+MH+R35M6XFdycVvYMHz1m+33OwfD46jZYe6e76uYodfTAJXUy5H9gQ==
X-Received: by 2002:a63:9347:: with SMTP id w7mr11155653pgm.409.1591976252287; 
 Fri, 12 Jun 2020 08:37:32 -0700 (PDT)
Received: from gmail.com (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id 140sm6457374pfy.95.2020.06.12.08.37.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jun 2020 08:37:31 -0700 (PDT)
Date: Fri, 12 Jun 2020 21:07:24 +0530
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/6] Enable Greybus Audio codec driver
Message-ID: <20200612153722.GB26807@gmail.com>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
 <20200610173711.GK5005@sirena.org.uk>
 <20200610182322.GC21465@gmail.com>
 <20200611082616.GA4671@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611082616.GA4671@sirena.org.uk>
User-Agent: Mutt/1.10.1+3 (f9293d646485) (2018-09-22)
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
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

On Thu, Jun 11, 2020 at 09:26:16AM +0100, Mark Brown wrote:
> On Wed, Jun 10, 2020 at 11:53:24PM +0530, Vaibhav Agarwal wrote:
> 
> > With patch#6 in this series, I'm proposing some of the (dummy) helper 
> > APIs required to link DAPM DAI widgets for the GB Audio modules 
> > added/removed dynamically.
> 
> > Eventually, I would like to propose relevant changes in snd-soc APIs to 
> > enable dynamic linking of DAI widgets for the modules added and 
> > remove/free component controls for the module removed.
> 
> > I'm seeking your opinion on the proposed changes. And as per the 
> > recommendation I'm sharing the changes with ASoC mailing list as well.
> 
> These are proposed incremental changes to an out of tree driver that has
> never been submitted.  I don't know what the current code looks like,
> what it's supposed to be doing or anything like that so I've no idea
> what's going on or why.
> 
> > Kindly suggest me the preferred way to follow on this thread. 
> 
> This is effectively out of tree code, until someone submits it properly
> I'm not sure it's useful to submit incremental patches upstream.

Thanks for the suggestion Mark. I'll create a separate patchset aligned 
to the ASoC tree in next ~2 weeks and share them separately.

Hi Greg,

Do you think the current patchset can be considered for the purpose of 
resolving componentization issue raised by Alexandre?

--
Regards,
Vaibhav
