Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F17F215349C
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 16:52:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A69D1683;
	Wed,  5 Feb 2020 16:51:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A69D1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580917920;
	bh=oYprbzM2U5N8PeYsayy4qmjkMxyjy5390JsM9ahCp+s=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A7UJ+Ffx/+U8Gu90WifHyA72EWgok1B8sjiPv9QDJXb3ZkRBd3syq+EaN7GvYq7K7
	 +co38m1DYIrS+tWArdD5vPF+uFzrDoVBgvyMjyZz5aCK8usqrTLrZnqT8LbMuRLbPu
	 35r+Xpde/xPh/R3KUF81IdyBye12BE0Wf73B0wEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 544AEF80142;
	Wed,  5 Feb 2020 16:50:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37434F80148; Wed,  5 Feb 2020 16:50:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2103F80051
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 16:50:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2103F80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nmGxKmVU"
Received: by mail-oi1-x242.google.com with SMTP id p125so1158444oif.10
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 07:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2aqjudvMlvh0oAgf6gAKgM5a6NLakebVIMf7FzqBKbA=;
 b=nmGxKmVUA2OhLkQUbH6y2A7L06mm6SHPFb68R7f3pP4pUroSQH0JWbkZCM7M8Xhzs+
 +Htv1A8a2S84oshAAOnk/7bkqKnm7ylp92krajzLWAS9G5pu10T39Ux6iwLeVkN4mJdB
 0VCyIVrZMcoqfv4qqGFqViNnTEwo3SmTWVIeSX5M7ge0xtltBr3zaVwUPjRdThyKsJX1
 vcZKJyLSe74nml8RTTTXuG/60HF1a3f3IrNPUWpMNJADbyZWp2NnUVA0D+G1r727Q59w
 XLsKAB8vuCKg09pT9dI0TzxQohaZD0qTPWLGuftRmd5u0y1v7EumeME6ehfp4VKHwqBe
 8/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2aqjudvMlvh0oAgf6gAKgM5a6NLakebVIMf7FzqBKbA=;
 b=ZSce9FGbifm6HVtHEkgPRCiUw45R1PV+nDBbtJWI5pRtwTuUp1hRYqJyNWe9VbFpK/
 rWMPYarQov5kM9iIUKrb6WWtQRt9oMz5vTPZs0rebIXhbZT6C6GNMwcrOm0412A4rzN2
 Z4TuEd3u/7oVCjPZy6wZnGBAhTr8FRzmz6vFDqKrnYqgdTW77qbiV653AZpCyA+SVkfl
 Q+hFTY0McvIGQZoI65+bhjbBwu5jxl/TEZH43PD9sm+HcWeJjPGqRPQ8tIq0EecDimFf
 bKGFs2YSFb4TMtEwTitubbI8/xD6j4KBTxuR8/cL/y2AopqAC4PFE9EU/JzKH0A/r9+x
 /RAg==
X-Gm-Message-State: APjAAAX38bNGup8+JxJo19VhaZRwPIvhYxbspNTRxsdhuePgfS0j5Cfi
 h4IbwvBsi2Ck+uyX+96H3EM=
X-Google-Smtp-Source: APXvYqyH/Bh0UsG1tQvvd7e5fjWDvkq6XoCFinipCyy/2s0bOgj8HY487C4+pGeW9f4qVxfOvreIHg==
X-Received: by 2002:a05:6808:b1c:: with SMTP id
 s28mr3416836oij.2.1580917809086; 
 Wed, 05 Feb 2020 07:50:09 -0800 (PST)
Received: from ubuntu-x2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id v25sm1349otk.51.2020.02.05.07.50.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Feb 2020 07:50:08 -0800 (PST)
Date: Wed, 5 Feb 2020 08:50:06 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200205155006.GA21667@ubuntu-x2-xlarge-x86>
References: <20200204060143.23393-1-natechancellor@gmail.com>
 <20200204100039.GX3897@sirena.org.uk>
 <20200204193215.GA44094@ubuntu-x2-xlarge-x86>
 <20200205102238.GG3897@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205102238.GG3897@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: wcd934x: Remove some unnecessary
	NULL checks
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

On Wed, Feb 05, 2020 at 10:22:38AM +0000, Mark Brown wrote:
> On Tue, Feb 04, 2020 at 12:32:15PM -0700, Nathan Chancellor wrote:
> > On Tue, Feb 04, 2020 at 10:00:39AM +0000, Mark Brown wrote:
> 
> > > I'm not convincd this is a sensible warning, at the use site a
> > > pointer to an array in a struct looks identical to an array
> > > embedded in the struct so it's not such a bad idea to check and
> > > refactoring of the struct could easily introduce problems.
> 
> > Other static checkers like smatch will warn about this as well (since I
> > am sure that is how Dan Carpenter found the same issue in the wcd9335
> > driver). Isn't an antipattern in the kernel to do things "just in
> > case we do something later"? There are plenty of NULL checks removed
> > from the kernel because they do not do anything now.
> 
> I'm not convinced it is an antipattern - adding the checks would
> be a bit silly but with the way C works the warnings feel like
> false positives.  If the compiler were able to warn about missing
> NULL checks in the case where the thing in the struct is a
> pointer I'd be a lot happier with this.

Yes, that would definitely be nice. I am not entirely sure that this is
possible with clang due to its architecture but I am far from a clang
internal expert.

> > I'd be fine with changing the check to something else that keeps the
> > same logic but doesn't create a warning; I am not exactly sure what that
> > would be because that is more of a specific driver logic thing, which I
> > am not familiar with.
> 
> I've queued the change to be applied since it's shuts the
> compiler up but I'm really not convinced the compiler is helping
> here.

Thank you :)

Cheers,
Nathan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
