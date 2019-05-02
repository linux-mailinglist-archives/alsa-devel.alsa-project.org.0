Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 655C311C3D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 17:09:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEDBA17B3;
	Thu,  2 May 2019 17:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEDBA17B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556809789;
	bh=A6JGP3ecGtkohN32P9xevlNIdjvaOZM7vjlSNIDSI/w=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EFnqlpRQQ3k7R/fXlgxcgLwYP/k47yeJhZ52mMTsLBaXdC8oCF7ylqlSHKq3If8Xo
	 J+OY8LTR/pXrMXgcI8wR2rEXgMehOq2WKCaTHeox4LCm1d9poYGoMNSpdkTK4fijva
	 YudiSP9D0hzfmvBKfzUwGBvU+vrfPOCh8GDnhfFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1B20F896AA;
	Thu,  2 May 2019 17:08:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F709F896C7; Thu,  2 May 2019 17:08:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8F3EF89693
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 17:07:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8F3EF89693
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VrFrLi3X"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A3812081C;
 Thu,  2 May 2019 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556809676;
 bh=IQByDGd7I4uc6LT2mqaUghf/zFn3FgKPCnkqb8xefG0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VrFrLi3Xb03yH4ggcQpix+tO4Y3YeRzeNZqbdj1h05KGf5BgKdqspW7o2hYeU/zRA
 ORNNRTuyLW9DQe8WA/GA531DlE+oXHhTd0usrcSWCPZE20mHKrfMPfptwW75btdlyJ
 yJJl6d7Rn0xLbsXGhl3k7On4rwDB5a8w6sC3VuDo=
Date: Thu, 2 May 2019 17:07:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20190502150754.GA17197@kroah.com>
References: <20190502105930.9889-1-vkoul@kernel.org>
 <20190502105930.9889-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502105930.9889-2-vkoul@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, Shreyas NC <shreyas.nc@intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 01/14] soundwire: fix kconfig help format
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

On Thu, May 02, 2019 at 04:29:17PM +0530, Vinod Koul wrote:
> Move to help format instead of --help-- as that is not recommended and
> this makes file consistent with other instance
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/soundwire/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> index 84876a74874f..53b55b79c4af 100644
> --- a/drivers/soundwire/Kconfig
> +++ b/drivers/soundwire/Kconfig
> @@ -28,7 +28,7 @@ config SOUNDWIRE_INTEL
>  	select SOUNDWIRE_CADENCE
>  	select SOUNDWIRE_BUS
>  	depends on X86 && ACPI && SND_SOC
> -	---help---
> +	help
>  	  SoundWire Intel Master driver.
>  	  If you have an Intel platform which has a SoundWire Master then
>  	  enable this config option to get the SoundWire support for that
> -- 
> 2.20.1
> 

Huh?

Pierre-Louis sent this patch before you did.  Why did you just rewrite
the changelog text a bit and then ignore his authorship and
signed-off-by?

That's a really really shitty thing to do, I'm going to go take his
version of these patches instead, let me see how they line up...

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
