Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 512AE80224
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 23:14:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D28F416CA;
	Fri,  2 Aug 2019 23:13:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D28F416CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564780442;
	bh=iprUSMwDaYgG+KfiDLA9EM5C0ZbNXdvQUtZQgubD7NA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z1MXNdmNN78LSYdxwg5gN43gQ5Hlyj2SyPWqF0Tcqs8xCk54eJN1wn7qIvU98bu0/
	 cZeDDKxJmSmmXO7e1y8M2hgabybq5g05WdSyiuBEAfXbVAHpGHqtbrtYw8yKWizA6+
	 aw74Ck+MQYBFFZVay6Thfq2jzwVc7QlaY6omjyyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3F73F804CB;
	Fri,  2 Aug 2019 23:11:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55A3DF8049A; Fri,  2 Aug 2019 23:11:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DB95F8048E
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 23:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DB95F8048E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="foz5wlEb"
Received: from localhost (unknown [106.51.106.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 64D79217D6;
 Fri,  2 Aug 2019 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564767120;
 bh=xzeUvxNQZP/5YdCw/FcqyiP94v61eID4Y+IJB6rOLZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=foz5wlEbhJylMNd02mn/a+5p6LgJbzCZtUdZov47IEY0AUIs3qfTwx8jMbpWmJZUi
 du/LPrDYAuJ11VgWg9XwtV1mvCQWXc/WMgXulA5z37aUjtUfB/K975WSFsYkmWdhFW
 JiYvmvpnHp0dkHKvX9Or12XweqtV6GluNW7+nvCE=
Date: Fri, 2 Aug 2019 23:00:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190802173047.GD12733@vkoul-mobl.Dlink>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-35-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-35-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 34/40] soundwire: intel: ignore
 disabled links for suspend/resume
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

Please add explanation why..

> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 1477c35f616f..a976480d6f36 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1161,6 +1161,12 @@ static int intel_suspend(struct device *dev)
>  
>  	sdw = dev_get_drvdata(dev);
>  
> +	if (sdw->cdns.bus.prop.hw_disabled) {
> +		dev_dbg(dev, "SoundWire master %d is disabled, ignoring\n",
> +			sdw->cdns.bus.link_id);
> +		return 0;
> +	}
> +
>  	ret = intel_link_power_down(sdw);
>  	if (ret) {
>  		dev_err(dev, "Link power down failed: %d", ret);
> @@ -1179,6 +1185,12 @@ static int intel_resume(struct device *dev)
>  
>  	sdw = dev_get_drvdata(dev);
>  
> +	if (sdw->cdns.bus.prop.hw_disabled) {
> +		dev_dbg(dev, "SoundWire master %d is disabled, ignoring\n",
> +			sdw->cdns.bus.link_id);
> +		return 0;
> +	}
> +
>  	ret = intel_init(sdw);
>  	if (ret) {
>  		dev_err(dev, "%s failed: %d", __func__, ret);
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
