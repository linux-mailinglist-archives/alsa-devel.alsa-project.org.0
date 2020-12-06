Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 856CA2CFFF7
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 01:34:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ACBD1837;
	Sun,  6 Dec 2020 01:33:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ACBD1837
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607214868;
	bh=5WqkRFso8bCwcNIXq6CgbDQfXiGycajBSIxOxFyKyRo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WzV+xZ8Ub/tOWDRZTl93sV7F1TV5iijscEhE/oNR2RJBiQXJ6EW+VJI6zE8Vx+ClL
	 +winl0/yPmovZeRov3/8RiS1ILC5j5f6kSBrPGuOxIKgqbZA1a+2P5KLibz73nxq4T
	 JzrNMQSQXwwxcvkUge1jyLMscc377ocO3MzpVtCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 486EFF80254;
	Sun,  6 Dec 2020 01:32:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B3ADF8016D; Sun,  6 Dec 2020 01:32:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62BD9F800E2
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 01:32:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62BD9F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="XJKdb70p"
Received: by mail-ed1-x544.google.com with SMTP id l5so9796127edq.11
 for <alsa-devel@alsa-project.org>; Sat, 05 Dec 2020 16:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gsJTnuBIKurvy5/BWkf4XzEJ7IPXfR3rghfxKMIdv5A=;
 b=XJKdb70pzE/zlzt49Fah0BHTuoQI/1gp0ANorpuSlhGDe5lvKDxwj1nV++iduDrHZO
 5egN+IeYeOoixDnwHTi+ErwlWJ+Vl+DXaKxjuuG3F/u9C+kgikt9jpCoUPiQQ1mk0GIt
 pBAXWYgQJ1gEgASRAC53JsKxZYF+LILb7PRheMEEHWH1ulEM1oA7Rc1amBxJiy/fw4JZ
 neU2YHasQLwYOvA7dz6DDjUocijcqE5kYh3+tTwKzYMoSu3Q35cXR08a5d22e4q4of7L
 ULTmY6TebcajaaxeAZrLRPeqJTkHVyBHaJyFwu6L6IYSGC272/5HyZK8l8KYXknxFPxa
 8P7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gsJTnuBIKurvy5/BWkf4XzEJ7IPXfR3rghfxKMIdv5A=;
 b=A6FukxgsQ8sQQApLBDugwhSbLTULgh7SkDZqgIankwGc5aOjMto3XMqdI8eOXVmQJv
 naVASRvjN7gZVerEpmYCWgIWfGmL3uiwYmmafv4dyRbZCmqKz8mOtR+/O0p1mIs9UNZT
 Ee8A68dPbZrukoRRQEaa4boN/jGIJUY5DHe4z2nY8IzmYJPPcsJxNxuSUr0IH0AXfhxQ
 XQNbof9euQx04UxQWr5e3O6+8ssLbKwTbwJCoiMbix2BJ5joyhJhRSxcmbFhRzwPB6Nd
 FPxR+JRtQpQA3Bm8Z0m4oD/Mae6VDUYwvy9vfh9e8bzpchJG9j9Kb9oC5utNEIcy2PYH
 e6Bw==
X-Gm-Message-State: AOAM532zvPpCZFWDHSIavm8nE9riSt1xVbtIhfeoRJEcFxV7SDmVzly7
 64FBW5tvVajRWwHtOUUmrcp8ed/2ZLAaFref3cBJ5w==
X-Google-Smtp-Source: ABdhPJyfTHBvHCXuS7GMkDJKmo6ZL65D889ZDN8Fij1tzRHq9IWIaeeueUQ0KTEr9lBaBh47xr9YPay4K9BanZOMcCg=
X-Received: by 2002:a50:e0ce:: with SMTP id j14mr14231534edl.18.1607214765241; 
 Sat, 05 Dec 2020 16:32:45 -0800 (PST)
MIME-Version: 1.0
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
 <a24b3044-1379-6331-c171-be8d95f21353@gmail.com>
In-Reply-To: <a24b3044-1379-6331-c171-be8d95f21353@gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sat, 5 Dec 2020 16:32:41 -0800
Message-ID: <CAPcyv4iM=_MhhpKKA9ihWAq_c43kKjRwGKzhvKEYHYJ+FiAVJA@mail.gmail.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
To: David Ahern <dsahern@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kiran Patil <kiran.patil@intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 Shiraz Saleem <shiraz.saleem@intel.com>,
 Martin Habets <mhabets@solarflare.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Dave Ertman <david.m.ertman@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Netdev <netdev@vger.kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>, David Miller <davem@davemloft.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Parav Pandit <parav@mellanox.com>
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

On Sat, Dec 5, 2020 at 4:24 PM David Ahern <dsahern@gmail.com> wrote:
>
> On 12/2/20 5:54 PM, Dan Williams wrote:
> > diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> > index 8d7001712062..040be48ce046 100644
> > --- a/drivers/base/Kconfig
> > +++ b/drivers/base/Kconfig
> > @@ -1,6 +1,9 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  menu "Generic Driver Options"
> >
> > +config AUXILIARY_BUS
> > +     bool
> > +
> >  config UEVENT_HELPER
> >       bool "Support for uevent helper"
> >       help
>
> Missing a description and without it does not appear in menuconfig or in
> the config file.
>
> Could use a blurb in the help as well.

It doesn't have a description or help because it is a select-only
symbol, but a comment to that effect and a pointer to the
documentation would help.
