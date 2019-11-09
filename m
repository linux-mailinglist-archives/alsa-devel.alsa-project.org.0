Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFE8F5EFA
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Nov 2019 13:23:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE4021684;
	Sat,  9 Nov 2019 13:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE4021684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573302221;
	bh=xR8+FLPBKOa+mg4udzsNG25CfS+O8jvnTYUfSypfYew=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EN1ao15W5xaVuHRwi5vMM0Lcz01BFB5tZbiOND8gj1k7tqmfGjm05kwyP/uUA2Mbt
	 5/K2wLZFOmNv6REj0chtY0q8/KzUlZb74Uxvu7gfaphjWxvrBgMdJJZovTckXrvcY+
	 +1TtVH9689zRxLGkxY8XnS3qqOl9JV/+xEuiDo4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A1C4F8049B;
	Sat,  9 Nov 2019 13:21:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 723F3F8049B; Sat,  9 Nov 2019 13:21:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4929F800D3
 for <alsa-devel@alsa-project.org>; Sat,  9 Nov 2019 13:21:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4929F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KnfmeTKC"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C19920659;
 Sat,  9 Nov 2019 12:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573302108;
 bh=b/KNg34t7V9bn6veT2DJZhSXA9dQP2v8VU1Q8TzMhG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KnfmeTKCTWUtGFcx7zm1cT5sQ6XGTpCMEsFkJoN2kMGsGGj4ZaTS41GoXODrcIH4x
 oNwS9lYqjv+t8QDGa+K2hgzKfIWv2UQ7C12OmRMvQktECIrRFxdy3JlaRaXfB11qoX
 o+O+GzbK0KSKGCGjytQlDZcCtCqmZBV8eHnzeFg0=
Date: Sat, 9 Nov 2019 13:21:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20191109122121.GA1341519@kroah.com>
References: <20191109113527.GE952516@vkoul-mobl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191109113527.GE952516@vkoul-mobl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [GIT PULL] soundwire update for v5.5-rc1
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

On Sat, Nov 09, 2019 at 05:05:27PM +0530, Vinod Koul wrote:
> Hi Greg,
> 
> Here is the soundwire updates for v5.5-rc1. I may send another pull
> request with more changes which are under review next week. This time we
> have few core changes and bunch of changes to Intel drivers.
> 
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
> 
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-5.5-rc1

Pulled and pushed out, thanks.

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
