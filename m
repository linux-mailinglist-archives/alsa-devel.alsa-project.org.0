Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F32F5E18C
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 13:48:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75E8C1668;
	Mon, 29 Apr 2019 13:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75E8C1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556538497;
	bh=v7Oi3a3LbEgscqnielHlgSiBUtk8xt7GP5RQpMCHgVk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QTXJUcf0m/uaJRDZt3COE0LbHXrZ46T5xndhLIv6ag1q/qvgo1OCm60rnIZSARRsi
	 e7ev3fqMLCxkMsyGRqpEMTeYjZnij5S1sXdbVHobG+tRmU7V7HAfBuVIiumDrYeoP9
	 a/h1kiwEtmxJtzz1l4MxtAf46gPpLR+DXTbG0Wjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30D38F89693;
	Mon, 29 Apr 2019 13:46:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CBFCF80CAB; Mon, 29 Apr 2019 13:46:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C9F2F806E7
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 13:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C9F2F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gYKSa4Ec"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10A1A2147A;
 Mon, 29 Apr 2019 11:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556538385;
 bh=GgjvpWYZO7rwsfp+VeKOFEk48ySPOIYW8EHJP9W9BHk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gYKSa4Ec8lrfI8KaWlAbPbtFQqneMY/hITEN8EmpcNB4dwE7m0n6pF/5KFmefFe0O
 GhgDC/WoT8k4bp3eO/1r2PO5o7cpma+bS+KSU2k8smfZLxE5rsBraaMK81fiUuEtG5
 rsa3gx3oeiCgOuHCGACClQcxBrNGuUPf4xRO+WP4=
Date: Mon, 29 Apr 2019 17:16:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20190429114617.GJ3845@vkoul-mobl.Dlink>
References: <20190429112829.GH3845@vkoul-mobl.Dlink>
 <20190429114337.GA16771@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190429114337.GA16771@kroah.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 29-04-19, 13:43, Greg KH wrote:
> On Mon, Apr 29, 2019 at 04:58:29PM +0530, Vinod Koul wrote:
> > Hey Greg,
> > 
> > Please PULL to receive updates to soundwire subsystem
> > 
> > The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:
> > 
> >   Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-5.2-rc1
> 
> Pulled and pushed out, thanks,

That was fast :)

Thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
