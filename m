Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DE0565A64
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 17:53:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBB9B82B;
	Mon,  4 Jul 2022 17:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBB9B82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656950006;
	bh=Mk/4V26I7vu+jHQhzSTcKsB6Lw6hbuNjfMnZojzg6yw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d1LfEUIvE1D9HBH7WaOQLjCzZ18Tl2FJD/SPBojm18mIWTJliSQni2SjO/SxK2kvM
	 7WhqBCBJzF4mYeNRqL01knSoKTiv8KxwAfBUmUh8d37zXc8LsRaHvdwgmkAX0ZCnnZ
	 tcUIJJqNkG2SJPpXQNDFKOB0ReRIc0alUAohOJZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E27B1F80139;
	Mon,  4 Jul 2022 17:52:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DA2EF8014E; Mon,  4 Jul 2022 17:52:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A053F80139
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 17:52:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A053F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fa54uDdQ"
Received: by mail-yb1-xb2f.google.com with SMTP id o2so12292536yba.7
 for <alsa-devel@alsa-project.org>; Mon, 04 Jul 2022 08:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Y7yqX1cbV1646q3K9Ft2egbDGUJ77Hov7j9FTrq1iU=;
 b=fa54uDdQ3h8ry+kyjo15Cn70Eo6X+1pC8bHe8W+DJcPlJbogbPXRxZ6D+Anfz2OBAm
 mkixd2BcOBBezNqy1f7ezHOcLqPCpioc+uYN153VvQUywZD6B9unizzBEq6in3USFvOX
 XfdD2eKzWe2FG8E+S6g6OuDnWP4Am6ejwinJOej/FYeeTwN/TuzBBk/lhjYLil4R94Kn
 GzOCOLaa+ek2PScnIpMbu4AC9UAGobvTHIdCHWiYfLatGgJJ+/zGnt/M8SuZgkkhbOi2
 jk0wUs2gFicR2P79JWI2d42P6YtncXjnEUphLOWuJv9Ol1t6guAfDwyBCG2Nrnqgq3tv
 o+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Y7yqX1cbV1646q3K9Ft2egbDGUJ77Hov7j9FTrq1iU=;
 b=Xjo65+vDnIesFw83jIspU31AI9lT5Ko58dnge7ZQUNeFFslT4YcVulaPu7tT3RRGww
 6lnl7nTPTmE0N2pN55bJ6qaQ9jsSeIdTqE9jgfvyxXIBl6El2wwgSx9+hn0NsEtUBIiM
 5+lZVXMYjmQi8IQo+6Mi+uZcpMsA4ZGZ6sfM43hIYuUv0KmzNO8S0VyQ0YR+O0yQFQgo
 URk+ZXJ2zmd6DVUDVjaXT8QKtrkU+renveghcRGr71oAt1GtUqxrfD+hSVF6Oz0+SRXP
 lXvWpB4qCQVFF0ZYW4587B0h+l2qj3ebnv4DmmT+TjLYAFaeodAhmJjf0R8rdMddBRJ8
 swPw==
X-Gm-Message-State: AJIora+Pwh+2HcMSRhPiuHCUNvp2HQnOjMBnJnxyGgkSqI5Z+2vxm3Rf
 w9vmYiYKF6Az2sRaikmp7HPWC4CfLaNl9kIGj0I=
X-Google-Smtp-Source: AGRyM1v309HvkBZWheHRQN8mTgFLzJL/uGtk+1ooEgIccncixXa8bf91mGZJFBJnLchr77/Vlp0bXIdA8sSyh4AfLfU=
X-Received: by 2002:a25:858e:0:b0:66e:4898:63e2 with SMTP id
 x14-20020a25858e000000b0066e489863e2mr7053017ybk.296.1656949940625; Mon, 04
 Jul 2022 08:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220603170707.48728-1-andriy.shevchenko@linux.intel.com>
 <1b5ba014-44ca-e753-141a-d8ff5fd248bb@opensource.cirrus.com>
 <YsG3kKwmoqF2MxU2@smile.fi.intel.com> <YsLCwQM0gbhFhSke@sirena.org.uk>
 <CAHp75VeCTEE4-O1LLYNunf_ZU164i8rnqeRf9dvp=R=_eEC=ig@mail.gmail.com>
 <YsMIzz6JkTLw7heY@sirena.org.uk>
In-Reply-To: <YsMIzz6JkTLw7heY@sirena.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Jul 2022 17:51:44 +0200
Message-ID: <CAHp75VfkOndCsu9S3M-ftKAtVntsPkRKUuaOo2xOa2w5c3xZkg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ASoC: madera: Replace kernel.h with the necessary
 inclusions
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
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

On Mon, Jul 4, 2022 at 5:35 PM Mark Brown <broonie@kernel.org> wrote:
> On Mon, Jul 04, 2022 at 05:30:41PM +0200, Andy Shevchenko wrote:
> > On Mon, Jul 4, 2022 at 12:45 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > > +Cc: Liam, Mark
>
> > > If you needed to add me to the CC I've not seen the patch...
> > > for review.  People get busy, go on holiday, attend conferences and so
>
> > The question here is about MAINTAINERS. That's why you are in Cc list.
> > Do we have an issue in MAINTAINERS that causes you being not see the
> > patch?
>
> I have no idea, all that's showing up in my inbox is these content free
> pings.  You'd have to ask whoever didn't send the patch to me.

Let me rephrase my question (it's not so related to this patch).
How does the ASoC works in terms of MAINTAINERS records?

I found that there are files that are related to the sound/soc/* one
way or another, but listed only in a certain record of MAINTAINERS
without being listed as part of ASoC record. Does it mean I have to
always remember to add ASoC maintainers to each patch that touches one
of such files and doesn't provide them? OR do we need to fix
MAINTAINERS for such files by listing them in the ASoC record?


-- 
With Best Regards,
Andy Shevchenko
