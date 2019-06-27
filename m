Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9436C57555
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 02:18:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 312D216B0;
	Thu, 27 Jun 2019 02:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 312D216B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561594693;
	bh=AwNshQwz6IwswoBgWIE7pJOHtNRKF5de7bGj4sHPQsg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X3I3+3kSqEF1YNgeWZ9xyPgEFv6G8+asbpimDnDmR2EDfFejjrgXKt+wVM3Cl2+Xv
	 7Ml6Z8D/vJpQUYVh9FTpzkj0klFfQ5Uia3zGAG3G7qze2KV2/lY8QjrozBWQ7I6jrb
	 dQk6JxpDKVXwHG3Vo+2c++IQxqMsM2Cxig5enKaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 458E1F89731;
	Thu, 27 Jun 2019 02:16:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12157F89732; Thu, 27 Jun 2019 02:16:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53ED9F8071F
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 02:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53ED9F8071F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KueqM+8m"
Received: from localhost (unknown [116.247.127.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A97EA216C8;
 Thu, 27 Jun 2019 00:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561594562;
 bh=pwwo17FOMovc2ZCr62QYydIQFeqS0+a7qC77QEGeZs0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KueqM+8mFbhLZA7B6gQxWwVA73OkVt+GigTsbWlhhXFHUHrbb1IkP6cBoMRkxAPyA
 co8Jr2GuCtG2fWNPWzjY6TBV19Lmz/UGI/WJP2M+1pONtIzijrOzie6MMlqJ0MPmAF
 HtYHmndZYBz+U1wTQzFd4VGELg9E8QZmvcNQRdZk=
Date: Thu, 27 Jun 2019 08:15:54 +0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Message-ID: <20190627001554.GH527@kroah.com>
References: <20190626153611.10170-1-ckeepax@opensource.cirrus.com>
 <20190626153611.10170-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626153611.10170-2-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, rafael@kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, linux-acpi@vger.kernel.org,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: madera: Read device tree
	configuration
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

On Wed, Jun 26, 2019 at 04:36:11PM +0100, Charles Keepax wrote:
> Read the configuration of the Madera sound driver from device tree using
> the new device tree helper function.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Note this patch depends on patches that are currently going through Mark's
> tree so probably best if this one also goes through there.

No objection from me for him to take the previous one with this one in
his tree.

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
