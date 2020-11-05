Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4383A2A8485
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 18:14:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF5E6168A;
	Thu,  5 Nov 2020 18:14:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF5E6168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604596494;
	bh=UjFc3RtI1LUJL9bFrkI7jmm7p0hdcatWwhgwxtzUjZk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oypxXtu7B6Rx2HNvElZ8yCPj6FLhFPWJLs8r5JSwqUAUDzWmCt7kxAVavu+CMQi0u
	 q3X6Vu3KnrLJBCYKI5HsFKAqO7umXJTqWfGcUJl3lFNHLDM/o3XFWmTE/q9NpkBmg0
	 ge3PCNLODn+GKKFMvwosvuYDvZVXFLjD7KPK4stc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 404A6F800EC;
	Thu,  5 Nov 2020 18:13:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62A76F80162; Thu,  5 Nov 2020 18:13:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_21,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E408F800BA
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 18:13:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E408F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="LrZHWpUi"
Received: by mail-ed1-x544.google.com with SMTP id b9so2323681edu.10
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 09:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1OVEId5NbPuZhwiD2RAxt7P3TFnewmmafINvYAxM9CY=;
 b=LrZHWpUiBijvD4dqiTIysN1yWqAONqYpkr1vF2nMOS+hzduZIeM9hIf9ooQe26IE8x
 Zmen5HnkiRYPdRkczOgG7PHViRULQgRSh24HzkkD8TnlHfrOHC4X8yhXpNpNG/ORWYm+
 8wzyGEQEYw5xzt1fv37sZ7AzR4NgvrT5AI/st4t6GIPGqYX4ujx5Od/iswmS/n1ZkGFi
 8ArvQwe1MlI/iMZPOw7fltm7snk1o3RERYoVlgdlK3w0d6tT17fuPenDn1EL1jlT7c7c
 xPw0cBd21Pvskls1uPUF/wiUX/ZxaGdUHaYJf0LBuCctPWOozxR9FnzbhilazLwlxX+o
 3kUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1OVEId5NbPuZhwiD2RAxt7P3TFnewmmafINvYAxM9CY=;
 b=G54sm+iLJoax+ZIdjBXNfsju5bePgjxwO/R0/KCMVBboyntdpj+uswb+D3JfQyMs5x
 SyVyUAuhNrpx4jFCRyh+QxB9jI5q6ZESp1WMqlW2mVu56fHOwdMOzahBwa66AN8mKubW
 MB7OJ5qeZZ4+lJQuxIBfVi/PgZeSGNouRkXg12ag25iLL9xGuWUP3wImNI79BEBecipo
 3b7LdttIrC1b6aV/756YrraIAP8joavHzdihDtw8fKw/EydwT6A8MFDGTP9JeTPpzbDt
 Uvo5JsihB2z1XCYOwMcNj6sBhYfG/K144wsC2ULkB8QvoaChS/HgDMYQf6tnfpQih7ZZ
 UD3g==
X-Gm-Message-State: AOAM533r1SGpNxnnyQmv9Oi8O8Ajd+sei0RxED4g2s9gV++ycnwafW02
 bcELJ8Ppsjg+L0Yy7LDghf2OwOKeAQhRHNDYYTvOJQ==
X-Google-Smtp-Source: ABdhPJxR0K2Ny/la8w6wudT2r17AxOkb0bU7Tr0zLMl7ek9oU/t/pYtRlPYcNtxXSTQpX0bbGX3l0C3ZdfAY3A/HaRk=
X-Received: by 2002:aa7:d843:: with SMTP id f3mr3709824eds.354.1604596382315; 
 Thu, 05 Nov 2020 09:13:02 -0800 (PST)
MIME-Version: 1.0
References: <20201023003338.1285642-1-david.m.ertman@intel.com>
 <20201023003338.1285642-2-david.m.ertman@intel.com>
 <CAPcyv4i9s=CsO5VJOhPnS77K=bD0LTQ8TUAbhLd+0OmyU8YQ3g@mail.gmail.com>
 <20201105094719.GQ5429@unreal>
In-Reply-To: <20201105094719.GQ5429@unreal>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 5 Nov 2020 09:12:51 -0800
Message-ID: <CAPcyv4hmBhkFjSA2Q_p=Ss40CLFs86N7FugJOpq=sZ-NigoSRw@mail.gmail.com>
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

On Thu, Nov 5, 2020 at 1:47 AM Leon Romanovsky <leonro@nvidia.com> wrote:
>
> On Thu, Nov 05, 2020 at 01:19:09AM -0800, Dan Williams wrote:
> > Some doc fixups, and minor code feedback. Otherwise looks good to me.
> >
> > On Thu, Oct 22, 2020 at 5:35 PM Dave Ertman <david.m.ertman@intel.com> wrote:
> > >
>
> <...>
>
> > >
> > > +config AUXILIARY_BUS
> > > +       bool
> >
> > tristate? Unless you need non-exported symbols, might as well let this
> > be a module.
>
> I asked it to be "bool", because bus as a module is an invitation for
> a disaster. For example if I compile-in mlx5 which is based on this bus,
> and won't add auxiliary_bus as a module to initramfs, the system won't boot.

Something is broken if module dependencies don't arrange for
auxiliary_bus.ko to be added to the initramfs automatically, but yes,
it is another degree of freedom for something to go wrong if you build
the initramfs by hand.

>
> <...>
>
> >
> > Per above SPDX is v2 only, so...
>
> Isn't it default for the Linux kernel?

SPDX eliminated the need to guess a default, and MODULE_LICENSE("GPL")
implies the "or later" language. The only default assumption is that
the license is GPL v2 compatible, those possibilities are myriad, but
v2-only is the first preference.
