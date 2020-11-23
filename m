Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B28E52C0E4E
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 16:00:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 249791670;
	Mon, 23 Nov 2020 15:59:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 249791670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606143615;
	bh=vuOHi/y8u6QSKR6SCnYgkpsUMJQAcY+h65WrNUfY5eo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cQ8MkxrqKKXmv0fR/daJvqhP4LwGwwqMCN3gjS+NNunMHPJ+YAGs8A2OlyYC08SaH
	 a0KjAuwv2W8HIcgrIsOC9KSydVp9woshgjxY8wZjVEKxrncli8Lk0GrstTnQ8ElXRQ
	 9YLQB6mZaNKpDgTkt5bmSl3SJTv17ReDubyR/TVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F1C9F80113;
	Mon, 23 Nov 2020 15:58:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 040D4F80255; Mon, 23 Nov 2020 15:58:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2206DF80113
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 15:58:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2206DF80113
Received: by mail-ed1-f66.google.com with SMTP id q16so17386919edv.10
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 06:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8PYxqUct+Q9mNYdM8wqPvnUwdPo92AiSu9RZ/r3u+qk=;
 b=qINoak6+rdeBw/Aezvv03L6sG+dgN328fbtPxiu11C0WCWX+dE2YQgOy4FjhMV/x5d
 6KV2q+M5u1GyGUu38cxJBUZO5mM0EP1iUbspFmaE9+8VuArQdIJPokiLoL1CKULgzXkA
 wVap425LTsFUCq4mhgO7OdlqXO3UQgStWPzsishsMm8TlgeWALMZLJeaxTY0w5Y7dn4q
 niSyu2FWJkApxz2SZK/mkseFyOuyJ9WsmAMQJn2wqIlF6SDdRy5KzayfMH6EbNRaKfnU
 9nc/aY+v37RvFWPBzrUgdckH7FOtUUnXlPOBzI4ZWygg85U/661tK2s+UY17/5O3qk7I
 3z2g==
X-Gm-Message-State: AOAM530o1PJB0g+BoD+HHwfKyM4Pq3pKCb491YFhQLnXQQAWxYbxcWi0
 EXPcbrr+hASOnxdL9KIYaIE=
X-Google-Smtp-Source: ABdhPJy5lpwJxRHqEXprOoNPlghH8kM6ItxjLvP3djlOBLJEk6uuQ6S56QVwCwPzAi/JZKe2jkr+6g==
X-Received: by 2002:a50:a40f:: with SMTP id u15mr48456599edb.307.1606143514524; 
 Mon, 23 Nov 2020 06:58:34 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id g20sm5224076ejk.3.2020.11.23.06.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 06:58:32 -0800 (PST)
Date: Mon, 23 Nov 2020 15:58:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 01/38] ASoC: ak5558: drop of_match_ptr from of_device_id
 table
Message-ID: <20201123145831.GA202597@kozik-lap>
References: <20201120161653.445521-1-krzk@kernel.org>
 <20201120165202.GG6751@sirena.org.uk>
 <20201120194245.GA2925@kozik-lap>
 <20201120200429.GJ6751@sirena.org.uk>
 <20201122105813.GA3780@kozik-lap>
 <20201123104832.GY4077@smile.fi.intel.com>
 <20201123123731.GA6322@sirena.org.uk>
 <20201123124129.GA170000@kozik-lap>
 <20201123135006.GE6322@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201123135006.GE6322@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On Mon, Nov 23, 2020 at 01:50:06PM +0000, Mark Brown wrote:
> On Mon, Nov 23, 2020 at 01:41:29PM +0100, Krzysztof Kozlowski wrote:
> > On Mon, Nov 23, 2020 at 12:37:31PM +0000, Mark Brown wrote:
> 
> > > That feels like something that should be done with Kconfig dependencies
> > > like a direct OF dependency (possibly a !PRP0001 dependency?) for the
> > > driver or possibly with having a variant of_match_ptr() for things that
> > > really don't want to support PRP0001.  Just removing all the use of
> > > of_match_ptr() is both noisy and confusing in that it looks like it's
> > > creating issues to fix, it makes it hard to understand when and why one
> > > should use the macro.
> 
> > For the OF-only drivers (without other ID table), there is no point to
> > use the macro. Driver can bind only with DT, so what is the point of
> > of_match_ptr? To skip the OF table when building without OF? Driver
> > won't be usable at all in such case. So maybe for compile testing?
> > There is no need to remove OF table for simple build tests.
> 
> If nothing else it means you don't have to check if the driver is OF
> only or not.  I can see not bothering to add it but actively going round
> removing some instances of it doesn't seem great, and it seems like
> people will constantly be adding new uses on the basis that it's just
> such an obviously correct thing to do.

If my patch was not changing anything, I would agree that it might be
just a churn. But the patch fixes a real warning.

The other way of fixing warning is the one you proposed at beginning -
adding maybe_unused. Here we go to the second reason:

Having these of_match_ptr() for OF-only drivers is not the correct way
but rather something which is copied from existing drivers into new
ones. This is another reason for removing them - people will stop
copying this code all over again.

Best regards,
Krzysztof

