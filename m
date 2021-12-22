Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B7F47D5B8
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 18:20:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83A4117DB;
	Wed, 22 Dec 2021 18:19:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83A4117DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640193618;
	bh=FeWvEQdP73XpRicYuSJVsjFsBSuw51mLocP1NRhWJos=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cj6S0toT6Kmdlz4xU5hUn49qV6Ob+NLblk4aLHqNqsc7uuyQ0y7YTvWhBMy5G0Uje
	 7j9KcaQIWTsqNZJc5F2ck8V7fU7HQYdGr9iW2NvxPUoFAIsyY/sVrn1jDOjy9w195H
	 5OUoukGVmQ6jkXcLufvs5+dJBOU/oO5cRaHgCwUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CD9EF8020D;
	Wed, 22 Dec 2021 18:19:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5677F80155; Wed, 22 Dec 2021 18:19:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CE71F80084
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 18:18:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CE71F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca
 header.b="LXqfRFsU"
Received: by mail-qk1-x72d.google.com with SMTP id i130so1960679qke.3
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 09:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/L5NSqmnmp0JrNCe4jEZo1LjnyYAG3Zj1ZGvlLyNRww=;
 b=LXqfRFsU799kS6etQx2wny/MKAWaffuWQk76RfpfJW+3X5OCImXg1Dp90Y0mRBI1EG
 WNjZzNDzZKIcmS8X1m46mdALXkuotSNdEczKGUd/PBewYiLrbLh2zbN/CaonWPBMBbDx
 LHnygp0gSkx2zU/yGMCtl+rcj3S3J3Cw2iqmWXTzbF9xYnXxu99hrM6LBcYVQrggMDeJ
 2E+MC79QzCOqtuTTypNlhmVcPYm8OP5ZRavMcgb9yx/5gpRRO0HB1BziVlKih5ozJC/8
 M0ic/La1wfEsbcI58LTI+gJPcyj/M/6EKryf3RVyZBHv/tF5fEsE7drF8k3qsF+r9v3q
 +Ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/L5NSqmnmp0JrNCe4jEZo1LjnyYAG3Zj1ZGvlLyNRww=;
 b=lnJRpD62uKw/0Ty02NHrZXfdjEQ1pja/ezeP4IdZ6DtkyHT7Djn4fugAcc63QqFgmV
 fXQlrNjR9Iq9VF3QEG4YE2c6XjYdzTzt5pFWWPFIXkb10Q9vKZph3kxACsB2t1ludZE5
 mKCcDgf2483887ma7jcn7ZxeIEPrk9o5s5bfvRyZbzvuBPfLpsffWy86Icm1RYkKBr+r
 MtHwIu9PTPMG3PushuJngQgTpUXVF3rsBPnIQbJPwGrC0TGyjtSOhHlQAxOaiKsc3Rul
 g248fdaZCvc/w4koRUMnSfRoEPqsuXRP8imG2hLt/sGlylhVJhMscwt6FGEIehSZDh8R
 d4Xg==
X-Gm-Message-State: AOAM5313vrs6lxLHI/gRwdfEQLfWNI5+PYXmluKY5u4uVIbij1QVAZ6T
 VBEqDAcqEwUH2hyrQH91OQvQ/Q==
X-Google-Smtp-Source: ABdhPJwP5NJyymLKCRDlLyH4OX0k1lbimBfGNffLbMt6CEmyfRjzYEMg0Rxlwp8mOtStmN8qCKq7rQ==
X-Received: by 2002:ae9:df87:: with SMTP id t129mr2774584qkf.67.1640193533176; 
 Wed, 22 Dec 2021 09:18:53 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id de33sm2244073qkb.5.2021.12.22.09.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 09:18:52 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1n05GN-007SI7-Km; Wed, 22 Dec 2021 13:18:51 -0400
Date: Wed, 22 Dec 2021 13:18:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "David E. Box" <david.e.box@linux.intel.com>
Subject: Re: [PATCH 0/4] driver_core: Auxiliary drvdata helper cleanup
Message-ID: <20211222171851.GO6467@ziepe.ca>
References: <20211221235852.323752-1-david.e.box@linux.intel.com>
 <20211222000905.GN6467@ziepe.ca>
 <35bca887e697597f7b3e1944b3dd7347c6defca1.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35bca887e697597f7b3e1944b3dd7347c6defca1.camel@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 mustafa.ismail@intel.com, leon@kernel.org, mst@redhat.com,
 linux-rdma@vger.kernel.org, gregkh@linuxfoundation.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, vkoul@kernel.org,
 davem@davemloft.net, hdegoede@redhat.com, dledford@redhat.com,
 yung-chuan.liao@linux.intel.com, netdev@vger.kernel.org, kuba@kernel.org,
 andriy.shevchenko@linux.intel.com, shiraz.saleem@intel.com, saeedm@nvidia.com,
 linux-kernel@vger.kernel.org
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

On Tue, Dec 21, 2021 at 04:48:17PM -0800, David E. Box wrote:
> On Tue, 2021-12-21 at 20:09 -0400, Jason Gunthorpe wrote:
> > On Tue, Dec 21, 2021 at 03:58:48PM -0800, David E. Box wrote:
> > > Depends on "driver core: auxiliary bus: Add driver data helpers" patch [1].
> > > Applies the helpers to all auxiliary device drivers using
> > > dev_(get/set)_drvdata. Drivers were found using the following search:
> > > 
> > >     grep -lr "struct auxiliary_device" $(grep -lr "drvdata" .)
> > > 
> > > Changes were build tested using the following configs:
> > > 
> > >     vdpa/mlx5:       CONFIG_MLX5_VDPA_NET
> > >     net/mlx53:       CONFIG_MLX5_CORE_EN
> > >     soundwire/intel: CONFIG_SOUNDWIRE_INTEL
> > >     RDAM/irdma:      CONFIG_INFINIBAND_IRDMA
> > >                      CONFIG_MLX5_INFINIBAND
> > > 
> > > [1] https://www.spinics.net/lists/platform-driver-x86/msg29940.html 
> > 
> > I have to say I don't really find this to be a big readability
> > improvement.
> 
> I should have referenced the thread [1] discussing the benefit of this change
> since the question was asked and answered already. The idea is that drivers
> shouldn't have to touch the device API directly if they are already using a
> higher level core API (auxiliary bus) that can do that on its behalf.

Driver writers should rarely use the auxilary device type directly, the
should always immediately container_of it to their proper derived
type.

> > Also, what use is 'to_auxiliary_dev()' ? I didn't see any users added..
>
> This was not added by that patch.

It was added by the referenced patch, and seems totally pointless cut
and paste, again because nothing should be using the auxiliary_device
type for anything more than container_of'ing to their own type.

We've been ripping out bus specific APIs in favour of generic ones
(see the work on the DMA API for instance) so this whole concept seems
regressive, particularly when applied to auxiliary bus which does not
have an API of its own.

Jason
