Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A713F25A68D
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 09:24:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0401F1840;
	Wed,  2 Sep 2020 09:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0401F1840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599031465;
	bh=ncAkLLM3jrzn7E58cq3AgasZOXkAKgDF62YwmE0Sv5I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LTtqKBo0Mz7Tmzkrfe4jWnlj06RavL/QcL50crPH4B6Q/DMCBKjaY0YsMwLEgr6Nq
	 vgH1I2l+iQMNM0I+lubeN5pxCmZKRX5n3uJrIR1jjKo65lxRmbn7U6S7beBZ1Jfvue
	 M2vYOlqGR/3cf+Ny1rC73OdQ7Rmb5Xr5nYkBgmTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 223ACF80257;
	Wed,  2 Sep 2020 09:22:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 319CEF8025F; Tue,  1 Sep 2020 17:03:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29476F801DA
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 17:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29476F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="lCL5SLaM"
Received: by mail-ed1-x543.google.com with SMTP id l63so1756953edl.9
 for <alsa-devel@alsa-project.org>; Tue, 01 Sep 2020 08:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BIr3FRHLWeYI5mpm2jHeXhPihRGMNnmHYOmMOMeHpR4=;
 b=lCL5SLaMFPqoPftiV2X8nocTTBdKqARvrqI17ufYPS0DtjiIyaSIs4CniiHZ/VEW8n
 WoqCHbvQzPHbcjvAM7+zD7U98QNr5oxI5U75nYwYeOtUdaj7M9sptx5fdS3otDiC5uUz
 5071XY7IwhHNlm+8JmyRZFrwvyyMI1Xxx/Jf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BIr3FRHLWeYI5mpm2jHeXhPihRGMNnmHYOmMOMeHpR4=;
 b=KpUxzlGtPZDZ+i0vSqWWAQnFBbY+S/swrFvoLQUQm1FnvW/2h6T8D3kxgkf+6qXNXV
 DcHC780N42r/OA20kp8W8o7MDPMzU+563RRqVFo9maS7yOkFs+hC4D/bUNMLbeXTFKxH
 1aP+cuc44XWejbQnKIIG7K6BLbjDj++7cw6JYMaArTNpTST5oNgES/DArUKW5TTh677f
 YOQvVEzVVCOR3ykAsSrjJY2wm9mtkJclKpyDJVBxIk2DuXIXe9MWjrgXN+rish1MoHeY
 F+v//ml0YJBV0vp7TZyYS35r4RiHtgewP/btumD53cmr+U6QEi+ngmmoQIidl/8k+zPN
 O+TA==
X-Gm-Message-State: AOAM5321WcyChpArBF228l3uYYNlEZG7l9nEfivUIIkr/JYKNmy+pm5F
 Jo4ITsSKbjhLzgPU/fFT5hw/WyULT9poeA==
X-Google-Smtp-Source: ABdhPJxZAGGE5Qf+WgynHzZn+nCM1TWeAy1eBIxPix1dJey8iotNj8FT4KvwFaAdPKX8yX75U5gF1A==
X-Received: by 2002:a50:ed8d:: with SMTP id h13mr1998413edr.50.1598972570426; 
 Tue, 01 Sep 2020 08:02:50 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43])
 by smtp.gmail.com with ESMTPSA id r16sm1401975ejb.110.2020.09.01.08.02.49
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 08:02:49 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id j2so1915035wrx.7
 for <alsa-devel@alsa-project.org>; Tue, 01 Sep 2020 08:02:49 -0700 (PDT)
X-Received: by 2002:a5d:5150:: with SMTP id u16mr2332024wrt.197.1598972568491; 
 Tue, 01 Sep 2020 08:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <20200819135454.GA17098@lst.de>
 <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
 <20200820044347.GA4533@lst.de> <20200820052004.GA5305@lst.de>
 <CAAFQd5CFiA2WBaaPQ9ezvMjYZfNw37c42UEy9Pk7kJyCi1mLzQ@mail.gmail.com>
 <20200820165407.GD12693@lst.de>
 <CAAFQd5D=NzgjosB51-O_cH27a8V6CPgCfaPSfHHz7nKJPbazgg@mail.gmail.com>
 <20200901110617.GA13232@lst.de>
In-Reply-To: <20200901110617.GA13232@lst.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 1 Sep 2020 17:02:20 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CmPVSxmZJVn7HnNUn8srZbAbnfzpNMYw3KcDzn7xD2cg@mail.gmail.com>
Message-ID: <CAAFQd5CmPVSxmZJVn7HnNUn8srZbAbnfzpNMYw3KcDzn7xD2cg@mail.gmail.com>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 02 Sep 2020 09:22:41 +0200
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

On Tue, Sep 1, 2020 at 1:06 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Aug 20, 2020 at 07:33:48PM +0200, Tomasz Figa wrote:
> > > It wasn't meant to be too insulting, but I found this out when trying
> > > to figure out how to just disable it.  But it also ends up using
> > > the actual dma attr flags for it's own consistency checks, so just
> > > not setting the flag did not turn out to work that easily.
> > >
> >
> > Yes, sadly the videobuf2 ended up becoming quite counterintuitive
> > after growing for the long years and that is reflected in the design
> > of this feature as well. I think we need to do something about it.
>
> So I'm about to respin the series and wonder how we should proceed.
> I've failed to come up with a clean patch to keep the flag and make
> it a no-op.  Can you or your team give it a spin?
>

Okay, I'll take a look.

> Also I wonder if the flag should be renamed from NON_CONSISTENT
> to NON_COHERENT - the consistent thing is a weird wart from the times
> the old PCI DMA API that is mostly gone now.

It originated from the DMA_ATTR_NON_CONSISTENT flag, but agreed that
NON_COHERENT would be more consistent (pun not intended) with the rest
of the DMA API given the removal of that flag. Let me see if we can
still change it.

Best regards,
Tomasz
