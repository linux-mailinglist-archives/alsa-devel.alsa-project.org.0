Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C322969FD
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 08:57:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D95AA17F7;
	Fri, 23 Oct 2020 08:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D95AA17F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603436238;
	bh=NIK8YqU0UAeUuqB3Fw2hEF+C+03sZYkTOCGN29s/iPI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bratfmPk72iUAKXpIFN5bdoz7sGv9AsaMcyCSyGE3IRldUHCw0DgezmhTpwKVlVtJ
	 UpdkmKvpbQM4X7PDTlqqi4qnmLMpMLBZ+le++fCpoZ8xZJnTzKDbHNguGdnCRPS4Bp
	 3Cudns3L2O2cDBhjTlrszEiAaID80pfUZG4hzwTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CA87F80264;
	Fri, 23 Oct 2020 08:55:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 392C9F8025A; Fri, 23 Oct 2020 08:55:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5D7FF80245
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 08:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5D7FF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kLQR+Fz4"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1EC6821527;
 Fri, 23 Oct 2020 06:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603436134;
 bh=NIK8YqU0UAeUuqB3Fw2hEF+C+03sZYkTOCGN29s/iPI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kLQR+Fz4Le3idbzalFRg3vSNKw7jp+rA/02vOGU1QGfml4CveJJOyv1+6syy3XiQW
 eVyK94i+lrirVfZ6rpSWdKaSyckd69KC8p+rykMpU3l/NSoY6xcJ9FiibG5akGPnbO
 T+HOT5jh5ezHT3DcsdPYvhDHcfB8Ad2QMMdT1w78=
Date: Fri, 23 Oct 2020 08:56:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Leon Romanovsky <leonro@nvidia.com>
Subject: Re: [PATCH v3 00/10] Auxiliary bus implementation and SOF
 multi-client support
Message-ID: <20201023065610.GA2162757@kroah.com>
References: <20201023003338.1285642-1-david.m.ertman@intel.com>
 <20201023064946.GP2611066@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023064946.GP2611066@unreal>
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

On Fri, Oct 23, 2020 at 09:49:46AM +0300, Leon Romanovsky wrote:
> On Thu, Oct 22, 2020 at 05:33:28PM -0700, Dave Ertman wrote:
> 
> <...>
> 
> > Dave Ertman (1):
> >   Add auxiliary bus support
> 
> We are in merge window now and both netdev and RDMA are closed for
> submissions. So I'll send my mlx5 conversion patches once -rc1 will
> be tagged.
> 
> However, It is important that this "auxiliary bus" patch will be applied
> to some topic branch based on Linus's -rcX. It will give us an ability
> to pull this patch to RDMA, VDPA and netdev subsystems at the same time.

I will do that, but as you said, it's the middle of the merge window and
I can't do anything until after -rc1 is out.  Give us some time to catch
up after that...

greg k-h
