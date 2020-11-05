Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 546BC2A8817
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 21:29:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D51DA1678;
	Thu,  5 Nov 2020 21:28:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D51DA1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604608181;
	bh=mSRQsgzQkT3M49fMqGqJYmARChjAFFLF23jaetQZSno=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DakIpaKx0iRgqbmrlTdhellg9EL/WiuhmFp+ZA1EFsqIAB0gTHnuQse5RYcLiiulR
	 ZfI2NpKTLo4yVp4QPwDr1dL+hTjwKwc1RA9/nnZQQlWwbpxHpFg7o2+0cvYImaKBWo
	 MfT5kvqdpSiNCC2wIJu91h5+QaxEISF6OsYW2Vy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 754F8F80150;
	Thu,  5 Nov 2020 21:28:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18C74F80171; Thu,  5 Nov 2020 21:28:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_21,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5A07F800EC
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 21:27:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5A07F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="0Gexu+U6"
Received: by mail-ed1-x544.google.com with SMTP id q3so2697972edr.12
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 12:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4tO08g/mdJrUnRp5xmIkC4E/sM1L+cB4NfZ88sr/eLY=;
 b=0Gexu+U6183ptqb2s+FG8/LMY6pXKXn7N3ue80u0iYvQLt+J1c2jziWIJNZODieL9I
 fjudyFeW2Y8vrOoj/uVLGT946g16HQe9FL8wBkxCdGiWweZU2yE2/V2gb4Bqcm8BYY+/
 ns6dNvrguGQ8l6UlwQ19zwKV0nsKkWa27hj/znxgNjAWTwoklQ1nLt+8YIkOsZdmkPvC
 3q3H5/w0tJ3ggiRN/S0VmI7w6ofXq+u9NWrITHIzdaNW9JjSbueu3JGkhuCe0FDdmPbB
 99034gC0Dhmp0LfcxNOoxcJnDRGv8mIiyor9veTUHkdTOiqrRpVnSG0GX3EAWjathtJi
 9AwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4tO08g/mdJrUnRp5xmIkC4E/sM1L+cB4NfZ88sr/eLY=;
 b=uoJdu7DckSulHItsrkHnyboILwGk7VvkichF3xdJsVQfHn8RjqU0oCfUeCEitlsFKW
 awQpeJ5AhHvHv1jSw6aIGKFQ+KKqSg91PYhuAR2R7xifOuFVTMW70bidTRDEMJe1JJ96
 DwXsqnBl9Nf3ZkR67P6akJ5Rotr1EDrMs5Qr3s8rO8G5omsFpySFgSOChrRtVkTrVKy1
 r3NK2r9Hk0neG425Yc7AR+Jf/jAoqXNfSPcvDn/JVjmzKRwcSfe0zZpv0YErdp2uJE8t
 ZT1YkKzoq+fmmzv3qX1uLxKdxtH5qntOqz4OAIc2/sUTIeIQKsq3gBKBo/JC+58/vw6t
 PiTw==
X-Gm-Message-State: AOAM533i5GUtPtc22XC+dUsFgW0CP5w2f4u66E9f7jCFu1UqrbcEYvUl
 0CLD7tiCK0qCghVqv12F09gHVg19NngHYB6R0D1E2g==
X-Google-Smtp-Source: ABdhPJxZyMj5TW7rvvLgOn3hpEvUsDtY61IBF+U1P3Dju0RxQi9OL2cMh7kULFE2kxodEX2WW11HNleHVODps7fifRk=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr4691836edb.52.1604608077519; 
 Thu, 05 Nov 2020 12:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20201023003338.1285642-1-david.m.ertman@intel.com>
 <20201023003338.1285642-2-david.m.ertman@intel.com>
 <CAPcyv4i9s=CsO5VJOhPnS77K=bD0LTQ8TUAbhLd+0OmyU8YQ3g@mail.gmail.com>
 <20201105094719.GQ5429@unreal>
 <CAPcyv4hmBhkFjSA2Q_p=Ss40CLFs86N7FugJOpq=sZ-NigoSRw@mail.gmail.com>
 <20201105193009.GA5475@unreal>
In-Reply-To: <20201105193009.GA5475@unreal>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 5 Nov 2020 12:27:46 -0800
Message-ID: <CAPcyv4j9CiOnxpzcpje-AvdX=EbzUVTGBqiC2AyhLv8rP12sVg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] Add auxiliary bus support
To: Leon Romanovsky <leonro@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Parav Pandit <parav@mellanox.com>,
 Greg KH <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.de>,
 Netdev <netdev@vger.kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, Mark Brown <broonie@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>, "Saleem,
 Shiraz" <shiraz.saleem@intel.com>, David Miller <davem@davemloft.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Patil,
 Kiran" <kiran.patil@intel.com>
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

On Thu, Nov 5, 2020 at 11:30 AM Leon Romanovsky <leonro@nvidia.com> wrote:
>
> On Thu, Nov 05, 2020 at 09:12:51AM -0800, Dan Williams wrote:
> > On Thu, Nov 5, 2020 at 1:47 AM Leon Romanovsky <leonro@nvidia.com> wrote:
> > >
> > > On Thu, Nov 05, 2020 at 01:19:09AM -0800, Dan Williams wrote:
> > > > Some doc fixups, and minor code feedback. Otherwise looks good to me.
> > > >
> > > > On Thu, Oct 22, 2020 at 5:35 PM Dave Ertman <david.m.ertman@intel.com> wrote:
> > > > >
> > >
> > > <...>
> > >
> > > > >
> > > > > +config AUXILIARY_BUS
> > > > > +       bool
> > > >
> > > > tristate? Unless you need non-exported symbols, might as well let this
> > > > be a module.
> > >
> > > I asked it to be "bool", because bus as a module is an invitation for
> > > a disaster. For example if I compile-in mlx5 which is based on this bus,
> > > and won't add auxiliary_bus as a module to initramfs, the system won't boot.
> >
> > Something is broken if module dependencies don't arrange for
> > auxiliary_bus.ko to be added to the initramfs automatically, but yes,
> > it is another degree of freedom for something to go wrong if you build
> > the initramfs by hand.
>
> And this is something that I would like to avoid for now.

Fair enough.

>
> >
> > >
> > > <...>
> > >
> > > >
> > > > Per above SPDX is v2 only, so...
> > >
> > > Isn't it default for the Linux kernel?
> >
> > SPDX eliminated the need to guess a default, and MODULE_LICENSE("GPL")
> > implies the "or later" language. The only default assumption is that
> > the license is GPL v2 compatible, those possibilities are myriad, but
> > v2-only is the first preference.
>
> I mean that plain GPL == GPL v2 in the kernel.

You are right, I was wrong.
