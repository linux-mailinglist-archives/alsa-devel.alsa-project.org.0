Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07702120DA
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 19:11:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8382C1812;
	Thu,  2 May 2019 19:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8382C1812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556817110;
	bh=Y+g3YN0in+QbB5rguJIXrePp2aTdR3ClhtSD0tBN/58=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UOr3ynvDm6YXdAixVQuMC3d5SdLwOjVCC90bzYrqVOfE53KH7Cv5IDfTH/Y2Xij7D
	 keWkAwh3ATVIuGwOneGWnJwMr3lNshjiIdKvsPHhtXxv6yEw9oeeOzIjIkICyADGni
	 SkXP3WejL5E6FHjiVZYjs1zMUvpFEMZhe7cUpGtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A439F896E3;
	Thu,  2 May 2019 19:10:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0B61F896C7; Thu,  2 May 2019 19:10:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53DFBF89693
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 19:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53DFBF89693
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="z5EVuigJ"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E10DD20675;
 Thu,  2 May 2019 17:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556816998;
 bh=dGFqRljxay/QBS5jA/YGpNxt5v22s46sFC0Zch9qAz8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=z5EVuigJtQ0MIunh05r86zaVUdh6wUol44STekkh2dJ01bM1mvH9cFDqzxgve4DJY
 Xn8A5GViSY6JDjOHtb+s1YnVKC6U7x8Trol6NR9wWAB0ZcaiQIlfUBihqOPa8p9VTA
 nRuIZYbzhiZcwBunvQ0+Zw+nYLaClGmhFzG88Nr0=
Date: Thu, 2 May 2019 19:09:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20190502170956.GA18654@kroah.com>
References: <20190502165636.GU3845@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502165636.GU3845@vkoul-mobl.Dlink>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [GIT PULL]: Second soundwire updates
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

On Thu, May 02, 2019 at 10:26:36PM +0530, Vinod Koul wrote:
> Hi Greg,
> 
> As discussed here is the second soundwire PULL request for v5.2-rc1.
> 
> The following changes since commit 4abbd783d126cabfc20d1b8d50b1d5026b5cba09:
> 
>   soundwire: intel: fix implicit header use of module.h/export.h (2019-04-14 15:52:50 +0530)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-5.2-rc1_2

I just did a pull, and a diff, and got nothing:
	$ git diff work-testing..HEAD
	$

So what I currently have in my char-misc work-testing branch is
identical to your branch.  So if you were to rebase, you would have a
"clean" tree.

So I'll just keep what I have already, as this way, everything has my
signed-off-by on them, as I did take the time to review them all :)

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
