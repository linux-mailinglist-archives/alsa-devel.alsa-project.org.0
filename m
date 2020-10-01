Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8176F27FE09
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 13:03:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2824117B7;
	Thu,  1 Oct 2020 13:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2824117B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601550187;
	bh=xrV7hEvr9cRjueAwfaJoyYDOd+e64259+jZzByobZBY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ka4ye0Nf/X855kyNsakpvBNLZWmeiUWKyLWLj6F/ghq4sSTnH3hE6mKuqLxxgKAX0
	 XiTdBBhncC5/Dqu9X0DNedJOyu6km1dxgi+LE/UD8G8HA5Hft9FPNmXN3VxGJblGR8
	 1xf6imz6XaTPiNh/Q4Ia8yjB4xpprlf4u0fLFR7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51CAFF801DB;
	Thu,  1 Oct 2020 13:01:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 636F8F801F5; Thu,  1 Oct 2020 13:01:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA716F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 13:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA716F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2qI9x75l"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F9092085B;
 Thu,  1 Oct 2020 11:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601550078;
 bh=xrV7hEvr9cRjueAwfaJoyYDOd+e64259+jZzByobZBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2qI9x75lNSEsXMDLhm7EHU2trCmGBnihbCPeJ3xwLDtOG3g3sSqnmGgXQ6II5Wpb9
 667GEDbiwihu5WNgfihvwsiXFWIUvdOH/hL6ih5sWubl6NaJK4wKXXxYi9kBkXSXmQ
 bz9H/LouXeFWAa+RlMJShdpHASvUEL2xys8DgegE=
Date: Thu, 1 Oct 2020 13:01:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Ertman <david.m.ertman@intel.com>
Subject: Re: [PATCH 1/6] Add ancillary bus support
Message-ID: <20201001110120.GB1939744@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930225051.889607-2-david.m.ertman@intel.com>
Cc: alsa-devel@alsa-project.org, Kiran Patil <kiran.patil@intel.com>,
 tiwai@suse.de, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org, parav@nvidia.com,
 jgg@nvidia.com, Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, Parav Pandit <parav@mellanox.com>
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

On Wed, Sep 30, 2020 at 03:50:46PM -0700, Dave Ertman wrote:
> +int ancillary_device_initialize(struct ancillary_device *ancildev)
> +{
> +	struct device *dev = &ancildev->dev;
> +
> +	dev->bus = &ancillary_bus_type;
> +
> +	if (WARN_ON(!dev->parent) || WARN_ON(!ancildev->name) ||
> +	    WARN_ON(!(dev->type && dev->type->release) && !dev->release))
> +		return -EINVAL;

You have a lot of WARN_ON() calls in this patch.  That blows up anyone
who runs with panic-on-warn, right?

If these are things that we have to have, then just test and properly
return an error, don't cause a potential crash.

thanks,

greg k-h
