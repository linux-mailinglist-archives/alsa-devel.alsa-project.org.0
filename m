Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D3B181E1
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 00:00:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B56121AC9;
	Wed,  8 May 2019 23:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B56121AC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557352842;
	bh=wgos5VYVyAknf3O2sUz25FBb21/Sscn2wuB4VYvxcaU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m9aNg5fI1Mqe6UW28GO1LKBn7rFNH6Z3DztsQt7UPycSLn4LeMZJQ27Q2NpNhIDF2
	 +SuONPKeACaM6gD0sD93Bu9ohuA6jgnq91aRRWDblpi9nTpfKlgYuZQEKwZh99JNC4
	 LI6CtUD+ouqXRp4jF3bJFuTPBhOjhild18Xk0mDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8CAAF89715;
	Wed,  8 May 2019 23:59:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C496F896FF; Wed,  8 May 2019 23:59:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9916F896E6
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 23:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9916F896E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="IwWDVQRe"
Received: by mail-lj1-x242.google.com with SMTP id s7so257640ljh.1
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 14:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UZMfXBQdOHBDgXhrafYn8rmUp2moZY4YUtAHGpeXcXQ=;
 b=IwWDVQReBqLpD91rfRHP5GUe1YVtCg7a2594K/O6nP3EjOMfYjP9Jvg4wQFnrIuxJo
 2xoX7a6EjGItF1lhoQX2Z7iEJzN7X0+uP1nULC7/B/NmgLe0tvRGxZqYWKBfpy7+PSKV
 onf595Hho8vuccSrSxuNJeMLoEM3irs+ejy4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UZMfXBQdOHBDgXhrafYn8rmUp2moZY4YUtAHGpeXcXQ=;
 b=sY/4WX5P/ySnR/CXBZ1y2hd5+/LjHUdFpSAoHVfDdNbMkGoglLpxCoaQJtY/kkS1nu
 plqD9Y3VF7jBOkwI+/rhpBVb8PQchYCOv/H2jYNuQy9UwaMwF1Ot6xd4HgPl7yryge8a
 qm+0eRkxQuTIN5qB6f7+ziMtC8yDivz9YTeP/YjY0zmDx0y3qyB03W/KXEYXGDjLROLx
 fWCwBErM6nkxDDeHBAqnoaqRxrIJMwYVchScPLxMBP+UNbeVcps1iGkozZrYKYrQl6KJ
 d9+3J+tExZOrmXSBSEecVvTCywOiiMsGMcgTKzVpJcgPV0DO6hcjkW6444HWymI3PDcu
 Ohcg==
X-Gm-Message-State: APjAAAUyenPwTvxKsnPM8KTMPvv6Hj1mQXMGQD9rht1aIklresCI8h7W
 xuAo5RhQq+fG3DvgoB3rSEVVf2pf8xQ=
X-Google-Smtp-Source: APXvYqypo12tgjxbOUKRcK96b1JLma7SxtLRYcyBbFUBtLzJRhtYbh5y/HDOzo1bT/uNv+jh+CPYiQ==
X-Received: by 2002:a05:651c:97:: with SMTP id 23mr76504ljq.143.1557352747167; 
 Wed, 08 May 2019 14:59:07 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id a6sm28870lfi.89.2019.05.08.14.59.05
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 14:59:05 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id m20so254152lji.2
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 14:59:05 -0700 (PDT)
X-Received: by 2002:a2e:298d:: with SMTP id p13mr107842ljp.64.1557352744587;
 Wed, 08 May 2019 14:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190507215359.113378-1-evgreen@chromium.org>
 <20190507215359.113378-2-evgreen@chromium.org>
 <cb0accd5-6b0d-065a-9b54-321252862d88@linux.intel.com>
 <CAE=gft7PtNWzH1QYigbQvDcJwZSb7ZLWoKzurPGBnh72DYcZrw@mail.gmail.com>
 <0d2c6330-7882-a7e5-8dcb-51eec0e845ba@linux.intel.com>
In-Reply-To: <0d2c6330-7882-a7e5-8dcb-51eec0e845ba@linux.intel.com>
From: Evan Green <evgreen@chromium.org>
Date: Wed, 8 May 2019 14:58:28 -0700
X-Gmail-Original-Message-ID: <CAE=gft4sTgnmzWDry2GB9_EAeC6Un2m7itvL4AG97z1XnWxe9A@mail.gmail.com>
Message-ID: <CAE=gft4sTgnmzWDry2GB9_EAeC6Un2m7itvL4AG97z1XnWxe9A@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: SOF: Add Comet Lake PCI IDs
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

On Wed, May 8, 2019 at 10:00 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 5/8/19 11:42 AM, Evan Green wrote:
> > On Tue, May 7, 2019 at 3:14 PM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> wrote:
> >>
> >> Minor nit-picks below. The Kconfig would work but select CANNONLAKE even
> >> if you don't want it.
> >>
> >>>
> >>> +config SND_SOC_SOF_COMETLAKE_LP
> >>> +     tristate
> >>> +     select SND_SOC_SOF_CANNONLAKE
> >>
> >> This should be
> >> select SND_SOF_SOF_HDA_COMMON
> >
> > You mean SND_SOC_SOF_HDA_COMMON I assume.
> > Except that I also need &cnl_desc, so I need CANNONLAKE to be on as
> > well. Should I select them both?
>
> Ah I see. I'd rather use a different descriptor then, and make the two
> platforms independent, as I did for CoffeeLake. You can use the same
> descriptor for the two -H and -LP skews though.

Ok, I'll add a cml_desc and have it conditionally compiled in on
either _LP or _H Kconfig.
-Evan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
