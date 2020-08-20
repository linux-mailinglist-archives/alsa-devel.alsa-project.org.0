Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D003124D01C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:57:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 837091665;
	Fri, 21 Aug 2020 09:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 837091665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597996653;
	bh=4rqZi1Za8q8uOmqCbzAQcwApuJtuDWNB97V59BpODpM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WGvgzWtUR9V82h67mUJbsJdqfg6zAkVDWDZhxnkfVpr9Q4BTtGhrtuoHmSkdqdv2V
	 fXTi4XinZo3I9LlH2DEt3m1Vq78zx41sCIdc2ocn6TumfZ6Ym2Wm1p/Ys460Q5CN3V
	 7NDzB6g3LZo83dhJFM00RQ8EazOBYEV+DCg0tUz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E686EF8048D;
	Fri, 21 Aug 2020 09:36:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B101DF80228; Thu, 20 Aug 2020 19:42:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACB97F800C0
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 19:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACB97F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="WJVp6uka"
Received: by mail-ed1-x541.google.com with SMTP id df16so2287736edb.9
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 10:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=++DU+mGMau0wCVk26WL7BRudLdRoW/TdcNVBaFfSVeo=;
 b=WJVp6ukadTpNcM9SYJpDROIRN+tD3gRH5NoPQs0+HAsQmLtJTImp5dRFMc7wGC3HgN
 R/lFt0vUnPt7BGWZ9GyHNRaZ0vNwnvZs2Kqg3u8nexS2ZBfKmw9OlPBaaVZioiS7BHsl
 YQ4r7w5vrJPUKxgqdugvjbGIbRfRLzSot++CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++DU+mGMau0wCVk26WL7BRudLdRoW/TdcNVBaFfSVeo=;
 b=hDMR0mRZoE1rEBeTADuJ4f4Fwt5roZvHB6ACt89gRwXnDPlTg2ECOkJEkcG0fa5od/
 LpPh7PO0n/2ZJr335/TrJKwta0sGQx4j6LFTHkJC3JR6F5HfL7w4Evtzi5AEefEwYPd2
 204Mf9hGJWR3GQblSZ2KPVwqaduYhV04Tlb9OfP83uiaLX+huwpoGYQ4OrNRchWNed6c
 THZUIx7FShWcutF/pNfre8yQ/KfdWCkQRnX2VdQUAnTGTUeOlJYbaHjhUuGyq1RES5P+
 ENHg4vbsFkcdsdgGSmSVVEga2nTB/HxNjfgXnzHyZ71Nc8NJZtqBnQexoa/MlMBvlXIa
 hvfw==
X-Gm-Message-State: AOAM5302jTzZzYgFkGYXmOPK35JZTxVNIXif5mpJqEhGg4lwOwIQg7V0
 WgVukAqdBlD0awZqFwYI5rNZC1orHKltbw==
X-Google-Smtp-Source: ABdhPJyZSo/hSuTYtUytHbPfmaTFUooPP7AxF7EzIjfGvD17CDzkE2J1rTzo98hKbdLiEUwmcX0CFA==
X-Received: by 2002:a50:cf46:: with SMTP id d6mr4005280edk.339.1597945317108; 
 Thu, 20 Aug 2020 10:41:57 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47])
 by smtp.gmail.com with ESMTPSA id e14sm1714172edl.86.2020.08.20.10.41.56
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 10:41:56 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id bo3so3476101ejb.11
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 10:41:56 -0700 (PDT)
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr4013793wrn.385.1597944841643; 
 Thu, 20 Aug 2020 10:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <20200819135454.GA17098@lst.de>
 <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
 <20200820044347.GA4533@lst.de> <20200820052004.GA5305@lst.de>
 <CAAFQd5CFiA2WBaaPQ9ezvMjYZfNw37c42UEy9Pk7kJyCi1mLzQ@mail.gmail.com>
 <20200820165407.GD12693@lst.de>
In-Reply-To: <20200820165407.GD12693@lst.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 20 Aug 2020 19:33:48 +0200
X-Gmail-Original-Message-ID: <CAAFQd5D=NzgjosB51-O_cH27a8V6CPgCfaPSfHHz7nKJPbazgg@mail.gmail.com>
Message-ID: <CAAFQd5D=NzgjosB51-O_cH27a8V6CPgCfaPSfHHz7nKJPbazgg@mail.gmail.com>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 21 Aug 2020 09:36:14 +0200
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>
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

On Thu, Aug 20, 2020 at 6:54 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Aug 20, 2020 at 12:05:29PM +0200, Tomasz Figa wrote:
> > The UAPI and V4L2/videobuf2 changes are in good shape and the only
> > wrong part is the use of DMA API, which was based on an earlier email
> > guidance anyway, and a change to the synchronization part . I find
> > conclusions like the above insulting for people who put many hours
> > into designing and implementing the related functionality, given the
> > complexity of the videobuf2 framework and how ill-defined the DMA API
> > was, and would feel better if such could be avoided in future
> > communication.
>
> It wasn't meant to be too insulting, but I found this out when trying
> to figure out how to just disable it.  But it also ends up using
> the actual dma attr flags for it's own consistency checks, so just
> not setting the flag did not turn out to work that easily.
>

Yes, sadly the videobuf2 ended up becoming quite counterintuitive
after growing for the long years and that is reflected in the design
of this feature as well. I think we need to do something about it.

> But in general it helps to add a few more people to the Cc list for
> such things that do stranger things.  Especially if you think you did
> it based on the advice of those people.

Indeed, we should have CCed you and other DMA folks. Sergey who worked
on this series is quite new to these areas of the kernel (although not
to the kernel itself) and it's my fault for not explicitly letting him
know to do that.

Best regards,
Tomasz
