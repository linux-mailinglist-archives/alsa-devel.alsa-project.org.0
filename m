Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7868411AA1F
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 12:44:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4AA5165F;
	Wed, 11 Dec 2019 12:43:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4AA5165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576064689;
	bh=pq9aP5bGcs0Ec/6v4gi7GG+fL62LonoLnv4+ZwZjnnk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=izxJECnHs1y3Mp/u9mu+8goUQZuF5t+EvSVsEnCMKw1gZdj0fTLMvHaO9ZVqPn7Uo
	 P9ct3Y1Y5zHUCYyAdbBJHrBkRmrwaGdqEF8uPvufxhWWTTMLsNrXvXmhD0iFDccqfB
	 UZAWQX6qWknMk45B7r/9veJNZeAPsIzaKPI4Cxkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D1C0F801F4;
	Wed, 11 Dec 2019 12:43:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D59AF801F4; Wed, 11 Dec 2019 12:43:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47B87F8011E
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 12:42:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47B87F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Br0+MtwR"
Received: from localhost (unknown [171.76.100.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 443762073D;
 Wed, 11 Dec 2019 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576064573;
 bh=6KjxzfVLAoUXt6yCuyJGQsbZXfDjjfZdoEGj/7xAFwU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Br0+MtwRTdi/snyt2rZP3odMEKcpSeZx4LJlZzqmw+Uyfbg7u4G4oboGukomiSde4
 1ygUsRc54BqDgNjRvPo9aMALRrsBLLjLKyYR9mKkDOnGfMZNooeoRh04fSGZkarPEu
 C3HAGZHiXfjxDg1J4HS2/ut/zLfftTwYsnL/o2vg=
Date: Wed, 11 Dec 2019 17:12:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191211114247.GI2536@vkoul-mobl>
References: <20191209235520.18727-1-pierre-louis.bossart@linux.intel.com>
 <20191209235520.18727-6-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209235520.18727-6-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 05/11] soundwire: intel: update
 interfaces between ASoC and SoundWire
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

On 09-12-19, 17:55, Pierre-Louis Bossart wrote:

> @@ -138,8 +126,6 @@ static struct sdw_intel_ctx
>  		pdevinfo.name = "int-sdw";
>  		pdevinfo.id = i;
>  		pdevinfo.fwnode = acpi_fwnode_handle(adev);
> -		pdevinfo.data = &link->res;
> -		pdevinfo.size_data = sizeof(link->res);
>  
>  		pdev = platform_device_register_full(&pdevinfo);
>  		if (IS_ERR(pdev)) {
> @@ -224,10 +210,8 @@ EXPORT_SYMBOL(sdw_intel_init);

This is still exported

>  struct sdw_intel_res {
> +	int count;
>  	void __iomem *mmio_base;
>  	int irq;
>  	acpi_handle handle;
>  	struct device *parent;
>  	const struct sdw_intel_ops *ops;
> -	void *arg;
> +	struct device *dev;
> +	u32 link_mask;
>  };
>  
> -void *sdw_intel_init(acpi_handle *parent_handle, struct sdw_intel_res *res);

But prototype removed, so i think this is a miss in the series, can you
fix that up

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
