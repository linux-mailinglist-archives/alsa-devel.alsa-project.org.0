Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5DEB4718
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 07:57:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25628166F;
	Tue, 17 Sep 2019 07:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25628166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568699826;
	bh=94IgTC5zlQGOxak23d0s0tCCiQ/6MVRETP2dABi5bf0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GqR7Pvad0Bx4dIbdjPSM7OuJe7FaXmtXXWhsItWm9TFBu1V7h47GOTuXKwRgUUlaJ
	 MluTnOLE7v/WLr+sEmUcNvJrTooBqvZPRVH9GLadO7uy5i0OMf/Lt5Jo9BIljHohR3
	 QVEyXCK74dxto8p+i1kdWkFczUD222XudE1vA2Bg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E9CEF80361;
	Tue, 17 Sep 2019 07:55:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A566F80361; Tue, 17 Sep 2019 07:55:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 960B6F802BD
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 07:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 960B6F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hMAru7ZT"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8F5021670;
 Tue, 17 Sep 2019 05:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568699714;
 bh=PguNlRlXErMMWFgmBjjpNfbyE9JGSwRipCM2vKmpfAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hMAru7ZTwpG5XG8o5eI2RR/kZfwwODOjxoY+REOdv4P53vq1DmV04Onf7QJD64qis
 N1voFAqWO+PBd3i80zo9oszKCVBYFjxxbGUS1uJlLaLuRb9UVkXWxw/ollZQ1EDrId
 jWrzBJbSD+foaYZCPD4NImx6A7WpsXzPGTWp/oPA=
Date: Tue, 17 Sep 2019 07:55:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190917055512.GE2058532@kroah.com>
References: <20190916212342.12578-1-pierre-louis.bossart@linux.intel.com>
 <20190916212342.12578-9-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190916212342.12578-9-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 8/9] soundwire: intel: remove platform
 devices and provide new interface
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

On Mon, Sep 16, 2019 at 04:23:41PM -0500, Pierre-Louis Bossart wrote:
> +/**
> + * sdw_intel_probe() - SoundWire Intel probe routine
> + * @parent_handle: ACPI parent handle
> + * @res: resource data
> + *
> + * This creates SoundWire Master and Slave devices below the controller.
> + * All the information necessary is stored in the context, and the res
> + * argument pointer can be freed after this step.
> + */
> +struct sdw_intel_ctx
> +*sdw_intel_probe(struct sdw_intel_res *res)
> +{
> +	return sdw_intel_probe_controller(res);
> +}
> +EXPORT_SYMBOL(sdw_intel_probe);
> +
> +/**
> + * sdw_intel_startup() - SoundWire Intel startup
> + * @ctx: SoundWire context allocated in the probe
> + *
> + */
> +int sdw_intel_startup(struct sdw_intel_ctx *ctx)
> +{
> +	return sdw_intel_startup_controller(ctx);
> +}
> +EXPORT_SYMBOL(sdw_intel_startup);

Why are you exporting these functions if no one calls them?

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
