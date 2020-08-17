Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5886D24653D
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 13:21:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E95751692;
	Mon, 17 Aug 2020 13:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E95751692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597663280;
	bh=1BxYmKlHGAYGgAGwfjEYuulG0rJG5NczRt9Xyo1ZNJ0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TmuhbgfZsYqkXF9WYLfQFYZeHeG8E94WYnHTsLYqy7C9uuu5B+K1dwRUIcvm5phNC
	 X3G5FyYimrddDntIjyvgECr7gvvsSoorOIFg1Cn40/fBpbvhl/sOUsJfIHcCbmEYBs
	 MXgvQO1HDO4tezEdaeRIAvHJ5zlcqA7Wqg7VpjKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E44FF800F0;
	Mon, 17 Aug 2020 13:19:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D326F80218; Mon, 17 Aug 2020 13:19:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B6F7F800EF
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 13:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B6F7F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="orlAfBXK"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62F742072D;
 Mon, 17 Aug 2020 11:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597663168;
 bh=1BxYmKlHGAYGgAGwfjEYuulG0rJG5NczRt9Xyo1ZNJ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=orlAfBXKzkdMjfZHKw8cKc2q8t0149ohjtuqqBWyQZlTURSTXhO2uMXf408ANifDa
 Vr5XIM50eYgzDpgpvUiX0yq9JZjSwEy0xHVfZ2OEQYoPAG1mj4VEensYL0M91HNWXx
 kCykOPPbx4fhzDqaEHzrJd9OpzJ1EyPl/dre9bOo=
Date: Mon, 17 Aug 2020 16:49:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 03/13] soundwire: intel: reset pm_runtime status during
 system resume
Message-ID: <20200817111924.GO2639@vkoul-mobl>
References: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
 <20200721203723.18305-4-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721203723.18305-4-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 22-07-20, 04:37, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The system resume does the entire bus re-initialization and brings it
> to full-power. If the device was pm_runtime suspended, there is no
> need to run the pm_runtime resume sequence after the system runtime.
> 
> Follow the documentation from runtime_pm.rst, and conditionally
> disable, set_active and re-enable the device on system resume.
> 
> Note that pm_runtime_suspended() is used instead of
> pm_runtime_status_suspended() so that we can deal with the case where
> pm_runtime is disabled.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index ed7163ae5f7a..284e5c9d240a 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1433,6 +1433,14 @@ static int intel_suspend(struct device *dev)
>  		return 0;
>  	}
>  
> +	if (pm_runtime_suspended(dev)) {
> +		dev_dbg(dev,
> +			"%s: pm_runtime status: suspended\n",
> +			__func__);

first, can we have this in a single line, or better drop it
second why would this be called when device is suspended

> +
> +		return 0;
> +	}
> +
>  	ret = sdw_cdns_enable_interrupt(cdns, false);
>  	if (ret < 0) {
>  		dev_err(dev, "cannot disable interrupts on suspend\n");
> @@ -1493,6 +1501,18 @@ static int intel_resume(struct device *dev)
>  		return 0;
>  	}
>  
> +	if (pm_runtime_suspended(dev)) {
> +		dev_dbg(dev,
> +			"%s: pm_runtime status was suspended, forcing active\n",
> +			__func__);

this one also could look better in a single line

> +
> +		/* follow required sequence from runtime_pm.rst */
> +		pm_runtime_disable(dev);
> +		pm_runtime_set_active(dev);
> +		pm_runtime_mark_last_busy(dev);
> +		pm_runtime_enable(dev);
> +	}
> +
>  	ret = intel_init(sdw);
>  	if (ret) {
>  		dev_err(dev, "%s failed: %d", __func__, ret);
> -- 
> 2.17.1

-- 
~Vinod
