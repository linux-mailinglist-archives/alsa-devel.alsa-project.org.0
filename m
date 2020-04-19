Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E33E1AF77B
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 08:04:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A39E829;
	Sun, 19 Apr 2020 08:03:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A39E829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587276288;
	bh=r2AgjpwBy563/SvDhTEdOgTQsrTjb6KChd2dLbtCIIs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SKq3yMskEBtBxAy7y9EpONFQzcB32cojz/utgPiioegoWjHfPLFm+Y6KA7P8icRZU
	 tav1j6qUy/4F4WLSbNT1HgfQ+CWKZu4BqiXg+Fzt/OPCzzCAnuSK7THR79IWWoxaSk
	 pwH7KmNnw/cD3YWe/v0sFCmecUllg4cuSsdC+QYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26D1BF800BA;
	Sun, 19 Apr 2020 08:03:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00539F801EC; Sun, 19 Apr 2020 08:03:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 477EDF800BA
 for <alsa-devel@alsa-project.org>; Sun, 19 Apr 2020 08:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 477EDF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pTMv1wOD"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4A4B2076A;
 Sun, 19 Apr 2020 06:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587276170;
 bh=r2AgjpwBy563/SvDhTEdOgTQsrTjb6KChd2dLbtCIIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pTMv1wODwFpdjz0FVgzA+p2WSCpvCxj18+/q3aiIPhhtKR+jsjHHIdl5zJ2q2+RA3
 +Tdmi8jGAiqk3VTvUYzIU3dTg9Q3SKwo6y6sZDkWyGvygbRRccfGpH1VpT4kAcKc5E
 4lTNQxLSLwDJyeMo2kAEPugwsa59XjBdxg3VhiTs=
Date: Sun, 19 Apr 2020 08:02:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 7/9] drivers/base: fix empty-body warnings in devcoredump.c
Message-ID: <20200419060247.GA3535909@kroah.com>
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-8-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200418184111.13401-8-rdunlap@infradead.org>
Cc: alsa-devel@alsa-project.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Zzy Wysm <zzy@zzywysm.com>, linux-kernel@vger.kernel.org,
 "J. Bruce Fields" <bfields@fieldses.org>, target-devel@vger.kernel.org,
 Dave Jiang <dave.jiang@intel.com>, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 linux-input@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On Sat, Apr 18, 2020 at 11:41:09AM -0700, Randy Dunlap wrote:
> Fix gcc empty-body warning when -Wextra is used:
> 
> ../drivers/base/devcoredump.c:297:42: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
> ../drivers/base/devcoredump.c:301:42: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  drivers/base/devcoredump.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> --- linux-next-20200417.orig/drivers/base/devcoredump.c
> +++ linux-next-20200417/drivers/base/devcoredump.c
> @@ -9,6 +9,7 @@
>   *
>   * Author: Johannes Berg <johannes@sipsolutions.net>
>   */
> +#include <linux/kernel.h>

Why the need for this .h file being added for reformatting the code?

thanks,

greg k-h
