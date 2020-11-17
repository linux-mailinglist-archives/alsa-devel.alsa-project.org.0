Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 488392B5A01
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 08:03:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D062716C5;
	Tue, 17 Nov 2020 08:02:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D062716C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605596628;
	bh=x6cXubNXc3tGqmxmQvpt5NxRCngt77HtQoMhgwcbzN0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lHd7yLNlDcGujhj87sivWmAqYJt4bFPwHqj2+arH1LBx1hv2l3pX5g7LpMFs1Ie45
	 xjZc5+e7p5aOOB3RaaQ4APfOcMlb6DB0yfbldaOfTknlEHV84/EEm0dAVw6bucWSZo
	 wNCv1E9l7N03Pzxf2dR0oGWB17128Y5V4mdFLsIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 559F6F801F9;
	Tue, 17 Nov 2020 08:02:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29758F801F5; Tue, 17 Nov 2020 08:02:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0F8AF800FE
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 08:02:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0F8AF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HccT+e98"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE8B8241A7;
 Tue, 17 Nov 2020 07:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605596524;
 bh=x6cXubNXc3tGqmxmQvpt5NxRCngt77HtQoMhgwcbzN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HccT+e98CTjo/3xnpyy36qRn2CLzuuWriOejALzW0PBKOKrRbf9noJh7Xv7v+IYRM
 nwikssCF7+zKPCQmoCWAytzUdz8bUQGWRddiyyWZRe7Vr5cGoA7H8Tj80uUVmuFkKd
 0EXZCXTnnO+jkOVyGCUWrNmdDbzubNoCXSUijIRc=
Date: Tue, 17 Nov 2020 08:02:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Leon Romanovsky <leonro@nvidia.com>
Subject: Re: [PATCH v4 01/10] Add auxiliary bus support
Message-ID: <X7N1naYOXodPsP/I@kroah.com>
References: <20201113161859.1775473-1-david.m.ertman@intel.com>
 <20201113161859.1775473-2-david.m.ertman@intel.com>
 <20201117053000.GM47002@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117053000.GM47002@unreal>
Cc: alsa-devel@alsa-project.org, parav@mellanox.com, tiwai@suse.de,
 netdev@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, fred.oh@linux.intel.com,
 linux-rdma@vger.kernel.org, dledford@redhat.com, broonie@kernel.org,
 jgg@nvidia.com, kuba@kernel.org, Dave Ertman <david.m.ertman@intel.com>,
 dan.j.williams@intel.com, shiraz.saleem@intel.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org, kiran.patil@intel.com
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

On Tue, Nov 17, 2020 at 07:30:00AM +0200, Leon Romanovsky wrote:
> On Fri, Nov 13, 2020 at 08:18:50AM -0800, Dave Ertman wrote:
> > Add support for the Auxiliary Bus, auxiliary_device and auxiliary_driver.
> > It enables drivers to create an auxiliary_device and bind an
> > auxiliary_driver to it.
> >
> > The bus supports probe/remove shutdown and suspend/resume callbacks.
> > Each auxiliary_device has a unique string based id; driver binds to
> > an auxiliary_device based on this id through the bus.
> >
> > Co-developed-by: Kiran Patil <kiran.patil@intel.com>
> > Signed-off-by: Kiran Patil <kiran.patil@intel.com>
> > Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
> > Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> > Co-developed-by: Leon Romanovsky <leonro@nvidia.com>
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Reviewed-by: Shiraz Saleem <shiraz.saleem@intel.com>
> > Reviewed-by: Parav Pandit <parav@mellanox.com>
> > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
> > ---
> 
> Greg,
> 
> This horse was beaten to death, can we please progress with this patch?
> Create special topic branch or ack so I'll prepare this branch.
> 
> We are in -rc4 now and we (Mellanox) can't hold our submissions anymore.
> My mlx5_core probe patches [1] were too intrusive and they are ready to
> be merged, Parav's patches got positive review as well [2] and will be
> taken next.
> 
> We delayed and have in our internal queues the patches for VDPA, eswitch
> and followup for mlx5_core probe rework, but trapped due to this AUX bus
> patch.

There are no deadlines for kernel patches here, sorry.  Give me some
time to properly review this, core kernel changes should not be rushed.

Also, if you really want to blame someone for the delay, look at the
patch submitters, not the reviewers, as they are the ones that took a
very long time with this over the lifecycle of this patchset, not me.  I
have provided many "instant" reviews of this patchset, and then months
went by between updates from them.

greg k-h
