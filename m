Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DBFD319E
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 21:45:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83D3B166C;
	Thu, 10 Oct 2019 21:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83D3B166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570736735;
	bh=6jkGCYpHStxrpaVnTeKo58Bp3AFmijs9RJQtjTHbhMU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uwRM0z4Uf77EaSkyjQsDjSs9zG9qP1Rfl0uKPRxWCmmaBtjKdy1h6LPpZsk5oFL6D
	 EE5XG+sm2DiA4LSy06oyWmfIL1WjoOGSZtczZLXCeQaIaSQ2Q3kCriZQ6uYLFKveiY
	 JSXYuLQKN1OT6Tq6iq3mb6vqISBt+zxz9vtde9cw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BACC4F802BC;
	Thu, 10 Oct 2019 21:43:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E340F8038F; Thu, 10 Oct 2019 21:43:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 862CBF802BC
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 21:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 862CBF802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Acnp8yeI"
Received: by mail-wm1-x343.google.com with SMTP id i16so8137184wmd.3
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 12:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8fcZ1OrWRxSJWfhPApkFY+NF6ygatxkprn8aJQR1SRQ=;
 b=Acnp8yeIYjKAMe26fLCOl5VGKoYlZ5aUdGkW8/+nbt7oR8qS/x3eCt8W6K/q7tapUB
 wKWfDhowLdJnqTUexENKE/9RDSvVFB8aZwdxqg7xvEeYtrTJKwMBR5ln1O2eGKYzpuEx
 KqCbj6icX6kV4yt3G40BUbuE7MKtnPsRsr0h/U0qdQHcSy18YY0j5etmlLM+TrmOuEn6
 k7aX3VNh9kql3c8b5h1fUF4auLlOjb30MDNEmItjWVzJ0bQwHBy8fLtac8Dbuk8BdZMh
 e86NeLdNATcr7jPxDjPXirr1i9/vAlqFKreStWNN0gC6Euw9YKaExfD86V4qSBHXm6Ks
 vFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8fcZ1OrWRxSJWfhPApkFY+NF6ygatxkprn8aJQR1SRQ=;
 b=T06zhah4K6r5n+5M9Y+X1dcRzx43LPYXq3bd6UkNVMNsP4ddyOATM7inns17f2kTDX
 U0hB5slFo1U9Zx4nt442KCCYUBVgpAmf22DtP+tjTKvGWegFZ1cHipv4GydSSyv33HYT
 y+onEx9fi1I7BVTGpJHNBwIU0O4SGTdPLYt9pfFDg2NuspjFQ51Tbcl51yvsSN8HhB/X
 KzSaGmVJpt7A3ka2xDkODGkWDCB21mvCCB+VZynMHzgiSZ1jXjSkPxVwM72u5+m3XyW1
 0Zft4fSlIm+TRYjDTjBLXCs4DMrJtOiXBj/vTCYeEJLazZfWd2eQ29eJtmDcCYgypNX8
 Xa2g==
X-Gm-Message-State: APjAAAWOphjlPEvmifMT2IhqSLIyp8fydsvttCnkQsLqIlHLcGIvKIS4
 K7uNdXluTRKAy4Kca89e8+N/DX2MnVkeJGoFIwM=
X-Google-Smtp-Source: APXvYqyKjZYsaygA6cT+JDU6RWfVoxAAb0ol7l1aJdHv/atSJ8e5L+4R/iSSh7Sd2r4i2B45cWpivh7sGN6QWjxQwNw=
X-Received: by 2002:a1c:e48a:: with SMTP id b132mr165872wmh.13.1570736623436; 
 Thu, 10 Oct 2019 12:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191009181356.GO2036@sirena.org.uk>
 <CAEnQRZAR1b-CHHVEv0ia92vYu38fWkwgW3mdwJFhEQsHk2j5+A@mail.gmail.com>
 <20191010155716.GE4741@sirena.org.uk>
 <47378afc-f7ef-d6fa-7b0d-efc3fbe494e0@linux.intel.com>
In-Reply-To: <47378afc-f7ef-d6fa-7b0d-efc3fbe494e0@linux.intel.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 10 Oct 2019 22:43:32 +0300
Message-ID: <CAEnQRZCR1683c_Oge=M7pzKOUx8SfhXrU_nL_HfqYrhg5ZHXWw@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>, Mark Brown <broonie@kernel.org>,
 Guido Roncarolo <guido.roncarolo@nxp.com>
Subject: Re: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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

On Thu, Oct 10, 2019 at 10:21 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 10/10/19 10:57 AM, Mark Brown wrote:
> > On Wed, Oct 09, 2019 at 09:48:14PM +0300, Daniel Baluta wrote:
> >> On Wed, Oct 9, 2019 at 9:15 PM Mark Brown <broonie@kernel.org> wrote:
> >
> >> My topics:
> >
> > I'll add these to the agenda.
> >
> >> - SOF driver: ACPI / DT unification
> >
> > Are there concrete plans to discuss here or is this more of a
> > "what are we doing" kind of thing?  ACPI standardization has been
> > an issue :/
>
> I took this agenda item as "how machine drivers are handled in SOF".
>
> Currently the core creates a platform device which will result in a
> machine driver being probe and the card created. This is mainly due to
> the lack of 'machine device' in existing DSDT tables. DT has explicit
> support for machine drivers, so we need to have a solution that caters
> to both.
>
> >
> >> - SOF driver: Handling built-in driver use case
> >
> > What's the issue here?
>
> The SOF driver (or any existing driver with closed-source firmware) will
> not work when compiled as built-in due to the request_firmware()
> dependency. This wasn't too much of an issue for Intel so far, but for
> i.MX platforms it's quite common to have no modules.
>
> Daniel, did I get things right?

Yes, thanks for jumping in! This is exactly what I was thinking of.

Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
