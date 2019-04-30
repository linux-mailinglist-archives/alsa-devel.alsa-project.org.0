Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FD7F2A6
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 11:19:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B43D16BA;
	Tue, 30 Apr 2019 11:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B43D16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556615953;
	bh=Edf5Ov9AbJ6Sdf//S9jtsvnL7QU8fjGUR5syvBkSzQ4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JfLJtDwVBfnjrQjcce9oAaNaExSu6oPl9kEDFYXRAtxdZUVKYMAe0G2wYX5+gNxIT
	 BJWCaMgROklRthf3n3xZOUNYTgoB2aavJ0xECO9O0CSIPYPG8eAnrmtuWw1QAuEbok
	 nY+3Kg6L8PqP7e4v9ICIuXfbQdrLKGnJEtsliqIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89076F896EC;
	Tue, 30 Apr 2019 11:17:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BAE6F896AA; Tue, 30 Apr 2019 11:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A02CF8065C
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 11:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A02CF8065C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AreVB2Kn"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A26B21707;
 Tue, 30 Apr 2019 08:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556613739;
 bh=T6pRf3puCnfwJR+wvi+dqK0s/FpjYe7lFV+mtUbejjI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AreVB2Kn857blB5VXEumv0Ujy7BbBmakyHrElcCY4+D3mB0aGzefOrepYKgdD4Xl0
 pMAPerpc1HjS/8WhebzLzVTW/tCUqb+dKL9xgYHzPAcjQGWXd0BtGT7nINCsxhen/q
 vRFa38AlyT8+9b76oGF5OCz7Bfrd57AxO+QoBmSc=
Date: Tue, 30 Apr 2019 14:12:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190430084203.GR3845@vkoul-mobl.Dlink>
References: <20190429112829.GH3845@vkoul-mobl.Dlink>
 <20190429114337.GA16771@kroah.com>
 <20190429114617.GJ3845@vkoul-mobl.Dlink>
 <24c3eef6-2a91-afbd-04f1-2e9a0db29f1c@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24c3eef6-2a91-afbd-04f1-2e9a0db29f1c@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: Greg KH <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [GIT PULL] soundwire updates for v5.2-rc1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 29-04-19, 07:53, Pierre-Louis Bossart wrote:
> On 4/29/19 6:46 AM, Vinod Koul wrote:
> > On 29-04-19, 13:43, Greg KH wrote:
> > > On Mon, Apr 29, 2019 at 04:58:29PM +0530, Vinod Koul wrote:
> > > > Hey Greg,
> > > > 
> > > > Please PULL to receive updates to soundwire subsystem
> > > > 
> > > > The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:
> > > > 
> > > >    Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)
> > > > 
> > > > are available in the Git repository at:
> > > > 
> > > >    git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-5.2-rc1
> > > 
> > > Pulled and pushed out, thanks,
> > 
> > That was fast :)
> 
> Vinod, is there any reason why you didn't take the rest of my clean-up
> patches? The feedback you provided wasn't really relevant (patches do apply
> and alignment is fine) and you didn't reply to my questions. 

Sorry I though base don comments a v2 was coming, I will recheck and see
if there is anything pending from my side. Nevertheless whats gets into
a PULL request is frozen some days back, even if I had applied
afterwards chances are that it wont have gone into this one. But hey
there is always next one...

> That's not 
> 'fast'. If we start having such delays with trivial patches, I can only
> imagine how well this is going to work with the rest of the patches I am
> cooking...

I never claim to be as fast as Greg :) But delays will be there, without
seeing rest of the patches I cant comment. But yes you can make it easy
for people to review which ensures they get done faster

Anyway lets discuss those points in relevant threads.

Thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
