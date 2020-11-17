Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 393782B70A0
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 22:06:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE29B178B;
	Tue, 17 Nov 2020 22:06:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE29B178B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605647216;
	bh=f7bTOwUirtNhbOYUNt0B7X1DMK+XdVKv0rl58u6pn7E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GtKV8tlDt3gjh1wWWELjQV9ndNczggm91fi3HFD3wddzPDQX+hUBw15NT4DHSflkN
	 3SzoKm6IdSfDbLZEMQbbsloFkS62BN2rVtwRdrvxSVdkhjSAURhSIhhZdd1WjMWheR
	 sKDtu3tzVGIbyJe6jP8J/RNjpWQDdjADpFfSlS3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22059F801F9;
	Tue, 17 Nov 2020 22:05:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E37CEF801F5; Tue, 17 Nov 2020 22:05:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27E0BF8010A
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 22:05:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27E0BF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="p+pnzb/Q"
Received: by mail-ej1-x643.google.com with SMTP id o21so31421609ejb.3
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 13:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kPEScT6gyGX81QUKHxjlw3b2BBUYfWDEeiwl2fVm1wc=;
 b=p+pnzb/QV2PtGwSdlBCCfgAyW8YeNSqAdFBepLZnfBYuN8ZsISPTLreqLJrA1uF2a7
 JIXpiidK8x1BZ3q54txbRPbxcTBDky4tJDzlsTVAhQKBxJoobg/6zPaXV7Vl+QSryYTW
 soZx7D0rcc+lDUmhEejuFMzf1msPmPpBn+PNoxSblv6bfenihydjzscQsDUgo2sREyOU
 qvJ+nDebS94wyW7FnAt3NR3eDkvEdqhOn/DNfQmD7fC/TZImL/cMErCXf/K8W5yTtYga
 1ue9DHOUJDF5V2UGiwF6AIAXecxfsnCmkUuDOPjFFBFpbofxmE7TOC7SUS5j4hF6t4B1
 rXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kPEScT6gyGX81QUKHxjlw3b2BBUYfWDEeiwl2fVm1wc=;
 b=W8mGhjnDAxeqSKrF18okBN9CpOY2SWNp670igR/cMwDLevpUeHA6m/0vyP/Biij2Wr
 eIvHx/5VbhJlkqVCFVS17I6rZJZOiTIulTNqCwWjbMSmZZUK2Uyibrk2BSv+T26ZzIv8
 GsdAQR2So5KQI9sA2GPjyOwne0P7n6KVFssNrSGi0I9eZ+y/4f7cGeqrZ5zAIxgSPxvT
 fDwU/JXCrlGpaCxl82uuS+RLIOfOvAoNpeVxNCujVK+lpdVebJA+jvuQEsd27zpwY3ZX
 vBtAiVl8qYYaHNclsw+OU7CrWClMn16FWArStDP1ti6SKeCO02S9TwZSweayVXDdAoFl
 i/NA==
X-Gm-Message-State: AOAM533s5yTE98RN+i5mItnZF/r9wkKVDZDIo1+LJngynY5KDgjfbVYJ
 gpZDqzUqER8iSLZJFpVRjdIKv38mVrJ0jQ6MaoaWQw==
X-Google-Smtp-Source: ABdhPJxIPEbRet7rRI98nHMy4znmKu8Wwkus/v7GOUPBHi9d8SdQldIDo6o+qUCd10IbSYlqVfJ2O+BKKa6GUrV8c6Y=
X-Received: by 2002:a17:906:ad8e:: with SMTP id
 la14mr17989866ejb.264.1605647107261; 
 Tue, 17 Nov 2020 13:05:07 -0800 (PST)
MIME-Version: 1.0
References: <20201113161859.1775473-1-david.m.ertman@intel.com>
 <20201113161859.1775473-2-david.m.ertman@intel.com>
 <20201117053000.GM47002@unreal> <X7N1naYOXodPsP/I@kroah.com>
In-Reply-To: <X7N1naYOXodPsP/I@kroah.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 17 Nov 2020 13:04:56 -0800
Message-ID: <CAPcyv4jXinvaLgtdpXTLLQ3sDOhvoBjF=7v7pba5rAd0g_rdow@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] Add auxiliary bus support
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Parav Pandit <parav@mellanox.com>,
 Takashi Iwai <tiwai@suse.de>, Netdev <netdev@vger.kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, Mark Brown <broonie@kernel.org>, "Saleem,
 Shiraz" <shiraz.saleem@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, David Miller <davem@davemloft.net>,
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

On Mon, Nov 16, 2020 at 11:02 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Nov 17, 2020 at 07:30:00AM +0200, Leon Romanovsky wrote:
> > On Fri, Nov 13, 2020 at 08:18:50AM -0800, Dave Ertman wrote:
> > > Add support for the Auxiliary Bus, auxiliary_device and auxiliary_driver.
> > > It enables drivers to create an auxiliary_device and bind an
> > > auxiliary_driver to it.
> > >
> > > The bus supports probe/remove shutdown and suspend/resume callbacks.
> > > Each auxiliary_device has a unique string based id; driver binds to
> > > an auxiliary_device based on this id through the bus.
> > >
> > > Co-developed-by: Kiran Patil <kiran.patil@intel.com>
> > > Signed-off-by: Kiran Patil <kiran.patil@intel.com>
> > > Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > > Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > > Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
> > > Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> > > Co-developed-by: Leon Romanovsky <leonro@nvidia.com>
> > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > Reviewed-by: Shiraz Saleem <shiraz.saleem@intel.com>
> > > Reviewed-by: Parav Pandit <parav@mellanox.com>
> > > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > > Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
> > > ---
> >
> > Greg,
> >
> > This horse was beaten to death, can we please progress with this patch?
> > Create special topic branch or ack so I'll prepare this branch.
> >
> > We are in -rc4 now and we (Mellanox) can't hold our submissions anymore.
> > My mlx5_core probe patches [1] were too intrusive and they are ready to
> > be merged, Parav's patches got positive review as well [2] and will be
> > taken next.
> >
> > We delayed and have in our internal queues the patches for VDPA, eswitch
> > and followup for mlx5_core probe rework, but trapped due to this AUX bus
> > patch.
>
> There are no deadlines for kernel patches here, sorry.  Give me some
> time to properly review this, core kernel changes should not be rushed.
>
> Also, if you really want to blame someone for the delay, look at the
> patch submitters not the reviewers, as they are the ones that took a
> very long time with this over the lifecycle of this patchset, not me.  I
> have provided many "instant" reviews of this patchset, and then months
> went by between updates from them.

Please stop this finger pointing. It was already noted that the team,
out of abundance of caution / deference to the process, decided not to
push the patches while I was out on family leave. It's cruel to hold
that against them, and if anyone is to blame it's me for not
clarifying it was ok to proceed while I was out.
