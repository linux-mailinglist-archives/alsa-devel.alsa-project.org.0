Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 026A910AF8
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 18:15:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 437911732;
	Wed,  1 May 2019 18:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 437911732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556727337;
	bh=mrmD7xvicF01dnAFVpzt5W0xy/Jwbn9WR8xGgZXNJeE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mMxp30PI0nTtgzRzC3hCr2ssoJeychtVMQRcqYrpo4X36U5WDkAOCju82JnL7DZ4v
	 SqqadWEJ+FvJJWGbpMhqtwIQQf14AuwKfjuEqG75cdjyst3U8cXm6vwQEYOf1cLBG6
	 prvkPcJelvRn6YmYKtDlfQRBT5ySh75kOpm92Dso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2117BF896E2;
	Wed,  1 May 2019 18:05:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA42AF896B7; Wed,  1 May 2019 18:05:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7713DF8065C
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 18:05:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7713DF8065C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0/eU5QSf"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F9DD20644;
 Wed,  1 May 2019 16:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556726705;
 bh=E8F/3pKddi/VN9Od3ETGWYRD3ebxn03vf7dBr53qS4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0/eU5QSfIyvSF6qY8MTgbPncQaNyEZNbt2FqPgGJoHj6SoRxdIwDUKZJe7/KEPPBL
 LY2qgf1rYgLo44rQdrC2nTFAHQKpvF9yNIb5cGGhPZCiZ2CkMgcDcLGh1oCTZdkfgi
 g1KUkxgFGvyo4nEYXAhKQOEU3Qouf77KGZONrXaQ=
Date: Wed, 1 May 2019 18:05:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190501160503.GB19281@kroah.com>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
 <20190501155745.21806-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501155745.21806-3-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH v4 02/22] soundwire: fix SPDX license for
	header files
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

On Wed, May 01, 2019 at 10:57:25AM -0500, Pierre-Louis Bossart wrote:
> No C++ comments in .h files

That's not really the issue here.

> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus.h            | 4 ++--
>  drivers/soundwire/cadence_master.h | 4 ++--
>  drivers/soundwire/intel.h          | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
> index c77de05b8100..2f8436584e7f 100644
> --- a/drivers/soundwire/bus.h
> +++ b/drivers/soundwire/bus.h
> @@ -1,5 +1,5 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> -// Copyright(c) 2015-17 Intel Corporation.
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/* Copyright(c) 2015-17 Intel Corporation. */

The first line is fine to change, as that was the requirement (although
I think it has now been fixed), the second line is just taste, whatever
you want, it's not a requirement.

But I really don't care, it's not my code :)

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
