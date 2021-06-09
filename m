Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FF93A0FE0
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 12:02:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85AF316B9;
	Wed,  9 Jun 2021 12:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85AF316B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623232955;
	bh=y5GJQnLC5JKowffTHGX+5L4qB6tZi5mbQC7TJaTdqA0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dSDfOF81mj0iXKxcZXbgcSGulqtCnM3CUAuvcaSiSA3J2TBAJAqFEPmnTNFdj4YOS
	 BW2MTMc6zzs+0/KbqfAEkpIN9UX1jK/Ql+wK4F6o/L00SskZqBAu4Eo7arhRYPVs3D
	 Oa4zW1+oqqC49ft9rZ2Jd8gk9mB7srzYqijDFrKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB69FF800F4;
	Wed,  9 Jun 2021 12:01:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81EA4F8026C; Wed,  9 Jun 2021 12:01:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0D58F8020D
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 12:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D58F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="o7Ttiboe"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AFE8610C7;
 Wed,  9 Jun 2021 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623232857;
 bh=y5GJQnLC5JKowffTHGX+5L4qB6tZi5mbQC7TJaTdqA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o7TtiboeaC9i5+GoW2tlvaLfkj5+LTxTt8huuypnB0ni0Rwub23LvYoIHtC36vRym
 CPtz+TRzM9zXtmC3iehyz473znFAUDDkC0K+GUhAdY+ILrdAiyqL6A6qX39DePKcpz
 x3+q8mmpiCovvoMx/My8c7S7vUp/ZVe8MnHx5jyc=
Date: Wed, 9 Jun 2021 12:00:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: rt5645: Avoid upgrading static warnings to errors
Message-ID: <YMCRViKtEd3Fkk6w@kroah.com>
References: <20210608160713.21040-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608160713.21040-1-broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Phillip Potter <phil@philpotter.co.uk>
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

On Tue, Jun 08, 2021 at 05:07:13PM +0100, Mark Brown wrote:
> One of the fixes reverted as part of the UMN fallout was actually fine,
> however rather than undoing the revert the process that handled all this
> stuff resulted in a patch which attempted to add extra error checks
> instead.  Unfortunately this new change wasn't really based on a good
> understanding of the subsystem APIs and bypassed the usual patch flow
> without ensuring it was reviewed by people with subsystem knowledge and
> was merged as a fix rather than during the merge window.
> 
> The effect of the new fix is to upgrade what were previously warnings on
> static data in the code to hard errors on that data.  If this actually
> happens then it would break existing systems, if it doesn't happen then
> the change has no effect so this was not a safe change to apply as a fix
> to the release candidates.  Since the new code has not been tested and
> doesn't in practice improve error handling revert it instead, and also
> drop the original revert since the original fix was fine.  This takes
> the driver back to what it was in -rc1.
> 
> Fixes: 5e70b8e22b64e ("ASoC: rt5645: add error checking to rt5645_probe function")
> Fixes: 1e0ce84215dbf ("Revert "ASoC: rt5645: fix a NULL pointer dereference")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Phillip Potter <phil@philpotter.co.uk>
> ---
>  sound/soc/codecs/rt5645.c | 49 +++++++++------------------------------
>  1 file changed, 11 insertions(+), 38 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
