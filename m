Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4217024D00E
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:56:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D327C1676;
	Fri, 21 Aug 2020 09:55:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D327C1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597996560;
	bh=5KATzKuBD3JjXcJmdSGrkqg5m44ayB7xjqTo4tV7UHI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N6DCVIzpDEEoLDPnb7UEfV/L3RGC7ae5ibHc4woxYx1kilykzuEwTBwk8mVtq3AkD
	 VcQi3oim3S2czjcik6G/OWviuj60PcPnAnxP3upN5Y6rGTXM0yIbnzgN9MfuUWZAtu
	 SFdfxUiAgSMQN89PO2aUPMPUV0eOICyOTXBk4rpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A28BF80473;
	Fri, 21 Aug 2020 09:36:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D6A4F80228; Thu, 20 Aug 2020 12:10:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_167,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38E98F800C0
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 12:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38E98F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ehZtgn4/"
Received: by mail-ej1-x644.google.com with SMTP id a26so1842611ejc.2
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p7IDsCs3O3XVq6Oo36ltfbQDp/qQH17B8kNCHrYYi58=;
 b=ehZtgn4/AxsmBi4CkUnsCHo/q6bpQxXO/GGgvrCHjALePJV0mY03gGKLtDpnr62vq7
 KV3mdnnS1aNkayPfMEd6+kiXUtw5pXZFUZ/dq+zcrKhOGKgl7b3lXQNmHHz0Fv8waUXO
 bUcyInFMwIZHXpvW8Pcz/o4WwKo7iyfKJp3kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p7IDsCs3O3XVq6Oo36ltfbQDp/qQH17B8kNCHrYYi58=;
 b=OWmCCunF1sOxlaVsgoR+6xQD8fE4RqJE2VZmxxguttKti3uM728V83k7xxnteJ/kGW
 WmkEpSC7udCwoBpxXHIwEVILIKgH7auZvZX8bvAEBaRGRya8vJGH3VGc2IbYWqdZrGXE
 ZWbyjLWILsocUslQBnEU9Xrc1Bob3KGJYseaZHZu6vpbXgjNjLcjslzhGTOrikaxmamU
 jC6ApBIrqrj+iDe3Wi9IGDGrjtn3D0HKBhtGSZj+PDywff6PSznMkrNiiubSeP5zsNY5
 xTylYBayMmWEAUqgOg+DQfbecH4mG9n1jmePQfOvgDN44BgosxAjm9sUCFtgktX1ofJj
 lEsQ==
X-Gm-Message-State: AOAM532b5+INbu+lKXZ2tAYNPWPrZbJ0naGhUIhSs1JqrdDK5egTvgA7
 LtTiIgJkKgjnwUDjLxxP0uJChdGtGbcGkqsW
X-Google-Smtp-Source: ABdhPJz07Gb2mCWoRuvTcJuWpV3RPUXllwa/5e/gBVWgSlDPH01Ip5LcDXi+vVfhkwwkKsbqiJxmXA==
X-Received: by 2002:a17:906:7492:: with SMTP id
 e18mr2442181ejl.375.1597918189860; 
 Thu, 20 Aug 2020 03:09:49 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53])
 by smtp.gmail.com with ESMTPSA id gj12sm1148904ejb.45.2020.08.20.03.09.48
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 03:09:49 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id k20so1064021wmi.5
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 03:09:48 -0700 (PDT)
X-Received: by 2002:a1c:5581:: with SMTP id j123mr2797156wmb.11.1597918188072; 
 Thu, 20 Aug 2020 03:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <62e4f4fc-c8a5-3ee8-c576-fe7178cb4356@arm.com>
 <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
 <20200819135738.GB17098@lst.de>
 <CAAFQd5BvpzJTycFvjntmX9W_d879hHFX+rJ8W9EK6+6cqFaVMA@mail.gmail.com>
 <20200820044533.GA4570@lst.de>
In-Reply-To: <20200820044533.GA4570@lst.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 20 Aug 2020 12:09:34 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CEsC2h-oEdZOPTkUQ4WfFL0yyYu9dE5UscEVpLyMLrCg@mail.gmail.com>
Message-ID: <CAAFQd5CEsC2h-oEdZOPTkUQ4WfFL0yyYu9dE5UscEVpLyMLrCg@mail.gmail.com>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 21 Aug 2020 09:36:14 +0200
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Robin Murphy <robin.murphy@arm.com>
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

On Thu, Aug 20, 2020 at 6:45 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Aug 19, 2020 at 04:11:52PM +0200, Tomasz Figa wrote:
> > > > By the way, as a videobuf2 reviewer, I'd appreciate being CC'd on any
> > > > series related to the subsystem-facing DMA API changes, since
> > > > videobuf2 is one of the biggest users of it.
> > >
> > > The cc list is too long - I cc lists and key maintainers.  As a reviewer
> > > should should watch your subsystems lists closely.
> >
> > Well, I guess we can disagree on this, because there is no clear
> > policy. I'm listed in the MAINTAINERS file for the subsystem and I
> > believe the purpose of the file is to list the people to CC on
> > relevant patches. We're all overloaded with work and having to look
> > through the huge volume of mailing lists like linux-media doesn't help
> > and thus I'd still appreciate being added on CC.
>
> I'm happy to Cc and active participant in the discussion.  I'm not
> going to add all reviewers because even with the trimmed CC list
> I'm already hitting the number of receipients limit on various lists.

Fair enough.

We'll make your job easier and just turn my MAINTAINERS entry into a
maintainer. :)

Best regards,
Tomasz
