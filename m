Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BD4287084
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 10:11:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 165F716B6;
	Thu,  8 Oct 2020 10:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 165F716B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602144690;
	bh=3009aDJbZ6Fm4WSc4LJepnxCjwiNu8hSq2/ydV5XAeo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kJNlFkP32y3H/zJu62Ht+BPoqJiLfAeADOtKHhuaqEFAUcMqIaCByqmwN1yZIIKV5
	 wXnw2Gf82Hho3KtBemLqSWRff6qumdH5oVYNalQUK4nwZRWF8EtmNu8/B3bQPETEVH
	 d1FjjynNgIZhw8looZJB4oTS6IAauy/9y1G3N4Pk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC286F80167;
	Thu,  8 Oct 2020 10:09:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B151AF80164; Thu,  8 Oct 2020 10:09:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67883F8015A
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 10:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67883F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="SsJBhLvB"
Received: by mail-ed1-x544.google.com with SMTP id o18so4901594edq.4
 for <alsa-devel@alsa-project.org>; Thu, 08 Oct 2020 01:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3009aDJbZ6Fm4WSc4LJepnxCjwiNu8hSq2/ydV5XAeo=;
 b=SsJBhLvBJdS3TBhJTMJ7Hn3+yK888TI5Cp1Vq19cpWIyAve+NdnWUFRztRu8MG+wXF
 RD1Eit4MepEjp+sOWaUXq+uPwWRMwdT18NfpKHUkvzo13tXl4nvnTJjhODiIwlZlvGnp
 OcZWDbKGe3HkYJ7/N5+TZ/NhGicYeJ5An4RqsetIHGz3uXxkzbKHdK+KfeqGxwwCJ80c
 lptdFLc49VkoCrLeLOOaaRIZnpTQGIgmYI2ZTpoNfbbtQhqm1X4BJXI8vSBvXmnEkHCc
 ku8HarPaLH1ecIuqO+rIcm3JM1pqBlujgRmzQYuCM9UpvgFAn4L8z3vyRDeAN/+JHFM4
 qJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3009aDJbZ6Fm4WSc4LJepnxCjwiNu8hSq2/ydV5XAeo=;
 b=mwjPgSiAvVP2nb0Al1EkZdKHdEh+Gc3jchJDs3Ey3jFfAyr4WaZohCSpuKqpCRg58C
 q9GQlMO6WXffjR3EfTq7J2mwFvp2YS1sb3GWg9OBj4Ihf3DYScTRxN/079keSmVsDumy
 8jJWNKQPHmM0H53jyxBl3mgzImvu++Id1rAP5i2KqwGGjwSxoHqhtVIhP9HDy6HsXmQW
 S+x0Be0vn2WbN7vnFIZZ8dM5VUcRc3Yzo6owbNzInCHWVjg7ed9kplbjkxULCiEaB4Pn
 GSTRi5GGfTQLvlKCuLalazUqWSb1buBuMEUnsyVXQI/O4s9uY2mLGTBi+CDtV6AtfmjD
 68wA==
X-Gm-Message-State: AOAM532znXm09+nMfrnzNV4Gqqp+K0DNdWpDJi8/W6NdH3LH5sP0JLBO
 MwXhLIEVP0dGaYboB9iduv5RF/8OT+hE+oS4tcBcHw==
X-Google-Smtp-Source: ABdhPJw6TqCFkvdHI3AzjviyS3ZgWRKfQTwwk1z06cK91gkXe6Uyt+vnNNXrav2X5tHaNKGJASptsQzrvNugqVAEJp4=
X-Received: by 2002:aa7:d1d5:: with SMTP id g21mr7964014edp.348.1602144579794; 
 Thu, 08 Oct 2020 01:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <b4f6b5d1-2cf4-ae7a-3e57-b66230a58453@linux.intel.com>
 <20201006170241.GM1874917@unreal>
 <DM6PR11MB2841C531FC27DB41E078C52BDD0A0@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201007192610.GD3964015@unreal>
 <BY5PR12MB43221A308CE750FACEB0A806DC0A0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <DM6PR11MB28415A8E53B5FFC276D5A2C4DD0A0@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201008052137.GA13580@unreal>
 <CAPcyv4gz=mMTfLO4mAa34MEEXgg77o1AWrT6aguLYODAWxbQDQ@mail.gmail.com>
 <20201008070032.GG13580@unreal>
 <CAPcyv4jUbNaR6zoHdSNf1Rsq7MUp2RvdUtDGrmi5Be6hK_oybg@mail.gmail.com>
 <20201008080010.GK13580@unreal>
In-Reply-To: <20201008080010.GK13580@unreal>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 8 Oct 2020 01:09:28 -0700
Message-ID: <CAPcyv4hguww6bgwbg1ufHkzPQu=sjneWt4sP6W7TF0EgWGrx+A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add ancillary bus support
To: Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "parav@mellanox.com" <parav@mellanox.com>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>, Parav Pandit <parav@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Ertman,
 David M" <david.m.ertman@intel.com>, "Saleem,
 Shiraz" <shiraz.saleem@intel.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "Patil, Kiran" <kiran.patil@intel.com>
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

On Thu, Oct 8, 2020 at 1:00 AM Leon Romanovsky <leon@kernel.org> wrote:
>
> On Thu, Oct 08, 2020 at 12:38:00AM -0700, Dan Williams wrote:
> > On Thu, Oct 8, 2020 at 12:01 AM Leon Romanovsky <leon@kernel.org> wrote:
> > [..]
> > > All stated above is my opinion, it can be different from yours.
> >
> > Yes, but we need to converge to move this forward. Jason was involved
> > in the current organization for registration, Greg was angling for
> > this to be core functionality. I have use cases outside of RDMA and
> > netdev. Parav was ok with the current organization. The SOF folks
> > already have a proposed incorporation of it. The argument I am hearing
> > is that "this registration api seems hard for driver writers" when we
> > have several driver writers who have already taken a look and can make
> > it work. If you want to follow on with a simpler wrappers for your use
> > case, great, but I do not yet see anyone concurring with your opinion
> > that the current organization is irretrievably broken or too obscure
> > to use.
>
> Can it be that I'm first one to use this bus for very large driver (>120K LOC)
> that has 5 different ->probe() flows?
>
> For example, this https://lore.kernel.org/linux-rdma/20201006172317.GN1874917@unreal/
> hints to me that this bus wasn't used with anything complex as it was initially intended.

I missed that. Yes, I agree that's broken.

>
> And regarding registration, I said many times that init()/add() scheme is ok, the inability
> to call to uninit() after add() failure is not ok from my point of view.

Ok, I got to the wrong conclusion about your position.
