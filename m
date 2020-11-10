Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 338312AD387
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 11:22:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B03FA1734;
	Tue, 10 Nov 2020 11:21:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B03FA1734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605003725;
	bh=8Qz8LIUkTxY5/gc9OeAz1JzdfBTeCe2Bc+FW79CrHvs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nFfkzEXv+38tmCpoJVJe6fpLPbbbUETVupYKvMF2VuRyOK+EaJJyslOVC977kDPG4
	 NqrNVS6/z439vb9nqG8LfgBNpTl0aEjyBS9qoC9IvGvS4l60SbVitGEFAIwB9hTvPi
	 k3pRE+06a4qZwN4Fzs/1nr42YLcaP1kIT8iiYTyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D460CF80527;
	Tue, 10 Nov 2020 11:15:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF6FBF80161; Tue, 10 Nov 2020 08:23:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, RCVD_IN_SORBS_HTTP, RCVD_IN_SORBS_SOCKS,
 SPF_HELO_NONE, SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1DE8F800EB
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 08:23:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1DE8F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lxwipDA7"
Received: from ogabbay-VM.habana-labs.com (unknown [213.57.90.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C0E7206B6;
 Tue, 10 Nov 2020 07:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604993000;
 bh=8Qz8LIUkTxY5/gc9OeAz1JzdfBTeCe2Bc+FW79CrHvs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lxwipDA750+LxYCIEu3zmzw/pUVmCg7SnCXTV+tkp+uRd9HfS7hzKE6EWuqiSM04n
 JSYs2z775lphf/o41x7822LhK8kSvzL+ukiWXd7qO3bbsyTc3toL9GerxI+wnwO5Bn
 C0q4F0UuQnc+RBfkG6lgigyNFmnbFtw8EbA34xTQ=
Date: Tue, 10 Nov 2020 09:23:10 +0200
From: Oded Gabbay <ogabbay@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 01/10] Add auxiliary bus support
Message-ID: <20201110072309.GA6508@ogabbay-VM.habana-labs.com>
References: <20201023003338.1285642-1-david.m.ertman@intel.com>
 <20201023003338.1285642-2-david.m.ertman@intel.com>
 <CAPcyv4i9s=CsO5VJOhPnS77K=bD0LTQ8TUAbhLd+0OmyU8YQ3g@mail.gmail.com>
 <DM6PR11MB284191BAA817540E52E4E2C4DDEE0@DM6PR11MB2841.namprd11.prod.outlook.com>
 <BY5PR12MB43228923300FDE8B087DC4E9DCEE0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <CAPcyv4h1LH+ojRGqvh_R6mfuBbsibGa8DNMG5M1sN5G1BgwiHw@mail.gmail.com>
 <BY5PR12MB43222D59CCCFCF368C357098DCEE0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <20201106193537.GH49612@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106193537.GH49612@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 10 Nov 2020 11:14:56 +0100
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Parav Pandit <parav@mellanox.com>, Greg KH <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.de>, Netdev <netdev@vger.kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, Parav Pandit <parav@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, "Ertman,
 David M" <david.m.ertman@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 "Saleem, Shiraz" <shiraz.saleem@intel.com>, David Miller <davem@davemloft.net>,
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

On Fri, Nov 06, 2020 at 07:35:37PM +0000, Mark Brown wrote:
> On Thu, Nov 05, 2020 at 08:37:14PM +0000, Parav Pandit wrote:
> 
> > > > This example describes the mlx5 PCI subfunction use case.
> > > > I didn't follow your question about 'explicit example'.
> > > > What part is missing to identify it as explicit example?
> 
> > > Specifically listing "mlx5" so if someone reading this document thinks to
> > > themselves "hey mlx5 sounds like my use case" they can go grep for that.
> 
> > Ah, I see.
> > "mlx5" is not listed explicitly, because it is not included in this patchset.
> > In various previous discussions in this thread, mlx5 subfunction use case is described that justifies the existence of the bus.
> > I will be happy to update this documentation once mlx5 subfunction will be part of kernel so that grep actually shows valid output.
> > (waiting to post them as it uses auxiliary bus :-)).
> 
> For ease of review if there's a new version it might be as well to just
> reference it anyway, hopefully the mlx5 code will be merged fairly
> quickly once the bus itself is merged.  It's probably easier all round
> than adding the reference later, it seems more likely that mlx5 will get
> merged than that it'll fall by the wayside.

Another use-case for this patch-set is going to be the habanalabs driver.
The GAUDI ASIC is a PCI H/W accelerator for deep-learning which also exposes 
network ports.We are going to use this auxiliary-bus feature to separate our 
monolithic driver into several parts that will reside in different subsystems 
and communicate between them through the bus.

Thanks,
Oded
