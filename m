Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 793EC7F702
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 14:40:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 151551733;
	Fri,  2 Aug 2019 14:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 151551733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564749603;
	bh=bVvpr5aQST3kzuEQ6PHrSMHmkqO0sL+jWUeAZl7/t/c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TaZ4JtsdmPUSmL5yF6/7ZHPwplG1TuyTagLRvIxJ4FeCRtA+KOONpM7ALdAaxJy+U
	 hu3jeNLU1XFEDdaZgbPRbYs6fJt+Y/XZCXiljOrHQdLXkrR8br1hx0pb78tHesrOg/
	 mnYcq2lOP91FK15S/xjnuws5rQUBxiKw0G9kF3dA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C98C4F805A8;
	Fri,  2 Aug 2019 14:36:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C418F8048E; Fri,  2 Aug 2019 14:36:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F5B3F8048F
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 14:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F5B3F8048F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eeq1RVT0"
Received: from localhost (unknown [122.167.106.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 855272173E;
 Fri,  2 Aug 2019 11:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564747191;
 bh=MegDr0BzCf1Mp8IehHAFlKK+IwXvFjSU1XSVy88+78o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eeq1RVT0t01vVnxkj5ekOJaqCWt1Lh6DYOo9zIqiWqtiYesm+oJy+oJgnpsOdsfIk
 7XWdYsWcKAG3O9h7puBQ+xVJSg1e+DvpY6bElLLdgi6aSL8j8lRxXcH7vU9jUNb+ZK
 HvUFOTjzKPXRAMTZf+/0zW2ImD7O6VdgFzmFzNbE=
Date: Fri, 2 Aug 2019 17:28:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190802115838.GK12733@vkoul-mobl.Dlink>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-9-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-9-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 08/40] soundwire: intel: remove BIOS
	work-arounds
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

On 25-07-19, 18:40, Pierre-Louis Bossart wrote:
> the values passed by all existing BIOS are fine, let's use them as is.
> The existing code must have been needed only on early prototypes.

Thanks for this, I am applying this.

> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 51990b192dc0..c718c9c67a37 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -922,17 +922,6 @@ static int intel_prop_read(struct sdw_bus *bus)
>  	/* Initialize with default handler to read all DisCo properties */
>  	sdw_master_read_prop(bus);
>  
> -	/* BIOS is not giving some values correctly. So, lets override them */
> -	bus->prop.num_clk_freq = 1;
> -	bus->prop.clk_freq = devm_kcalloc(bus->dev, bus->prop.num_clk_freq,
> -					  sizeof(*bus->prop.clk_freq),
> -					  GFP_KERNEL);
> -	if (!bus->prop.clk_freq)
> -		return -ENOMEM;
> -
> -	bus->prop.clk_freq[0] = bus->prop.max_clk_freq;
> -	bus->prop.err_threshold = 5;
> -
>  	return 0;
>  }
>  
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
