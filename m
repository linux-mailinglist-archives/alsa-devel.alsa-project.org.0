Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E20263AEEB
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 18:29:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5ADA16A6;
	Mon, 28 Nov 2022 18:28:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5ADA16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669656552;
	bh=wlocxIzZa2YAPiuBniHtUeU72dW8mhGyG945Z9QPseQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tBO6AJLcRiOwJeeMY3FISKZ0ekKei9AuOiA75fmU+DzRzFffkoTndQstQg6IZek0t
	 QC+Rt+3/hMCz7qYWiKz9hyMMzqEdYHDU8hmCbBNyCeMb9FHaPMna99IgN7T3gJvvZ9
	 LxU62Zgentz7sHPlNmMZcgxmwtBCEMzYvk8qwKqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CA8FF800B6;
	Mon, 28 Nov 2022 18:28:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29F25F8024C; Mon, 28 Nov 2022 18:28:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A34BF800B6
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 18:28:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A34BF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dAbQEu9N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669656488; x=1701192488;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wlocxIzZa2YAPiuBniHtUeU72dW8mhGyG945Z9QPseQ=;
 b=dAbQEu9Nk13yolvJETCQiHwKYhvVB7YPFOUpDnu2FLNcsgWuwv7IOa9F
 Ubhzm6oyFEqr3wM4Qc7xStp9ApyiKJzbDpPgrXxEtSR4hkgL96ICcZl4/
 SrDPBSr5SkLBFZECdqp86wsZh/Cc7bfxFPPOFBPGXIf1rbbJibwTLu1Ik
 QJtOwZy+qBHZhIUWCoxkrs5O78iALZVO9GC6Ml8mIHgYpnWrz8ZMlN759
 PwFk7hZR8Lh7uTr6G/vxtn0jJ3hwTwsBBifKFva69unuuniAtjRHnQBr6
 7qhpW2em7cBISHE1gwr9H55r7XdSF1AK3uAVGQY3Z8Tw1IGE97H0tqpGc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="295281629"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="295281629"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 09:27:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="888509534"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="888509534"
Received: from kschjaer-mobl.amr.corp.intel.com (HELO [10.212.114.246])
 ([10.212.114.246])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 09:27:48 -0800
Message-ID: <2d207a51-d415-726b-3bc1-8788df2f06fd@linux.intel.com>
Date: Mon, 28 Nov 2022 11:18:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] soundwire: bus_type: Avoid lockdep assert in
 sdw_drv_probe()
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20221121162453.1834170-1-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221121162453.1834170-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 11/21/22 10:24, Richard Fitzgerald wrote:
> Don't hold sdw_dev_lock while calling the peripheral driver
> probe() and remove() callbacks.
> 
> Holding sdw_dev_lock around the probe() and remove() calls
> causes a theoretical mutex inversion which lockdep will
> assert on. The peripheral driver probe will probably register
> a soundcard, which will take ALSA and ASoC locks. During

It's extremely unlikely that a peripheral driver would register a sound
card, this is what machine drivers do.

Which leads me to the question: is this a real problem?

Or did you mean 'register components', and if yes what would the problem
with lockdep be?

> normal operation a runtime resume suspend can be triggered
> while these locks are held and will then take sdw_dev_lock.
> 
> It's not necessary to hold sdw_dev_lock when calling the
> probe() and remove(), it is only used to prevent the bus core
> calling the driver callbacks if there isn't a driver or the
> driver is removing.


> If sdw_dev_lock is held while setting and clearing the
> 'probed' flag this is sufficient to guarantee the safety of
> callback functions.

not really, the 'probed' flag was kept for convenience. what this lock
really protects is the dereferencing of ops after the driver .remove
happens.

> The potential race of a bus event happening while probe() is
> executing is the same as the existing race of the bus event
> handler taking the mutex first and processing the event
> before probe() can run. In both cases the event has already
> happened before the driver is probed and ready to accept
> callbacks.

Sorry, I wasn't able to parse the first sentence in this paragraph. what
'existing race' are you referring to?

> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  drivers/soundwire/bus_type.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 04b3529f8929..963498db0fd2 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -105,20 +105,19 @@ static int sdw_drv_probe(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	mutex_lock(&slave->sdw_dev_lock);
> -
>  	ret = drv->probe(slave, id);
>  	if (ret) {
>  		name = drv->name;
>  		if (!name)
>  			name = drv->driver.name;
> -		mutex_unlock(&slave->sdw_dev_lock);
>  
>  		dev_err(dev, "Probe of %s failed: %d\n", name, ret);
>  		dev_pm_domain_detach(dev, false);
>  		return ret;
>  	}
>  
> +	mutex_lock(&slave->sdw_dev_lock);
> +
>  	/* device is probed so let's read the properties now */
>  	if (drv->ops && drv->ops->read_prop)
>  		drv->ops->read_prop(slave);
> @@ -167,14 +166,12 @@ static int sdw_drv_remove(struct device *dev)
>  	int ret = 0;
>  
>  	mutex_lock(&slave->sdw_dev_lock);
> -
>  	slave->probed = false;
> +	mutex_unlock(&slave->sdw_dev_lock);
>  
>  	if (drv->remove)
>  		ret = drv->remove(slave);
>  
> -	mutex_unlock(&slave->sdw_dev_lock);
> -
>  	dev_pm_domain_detach(dev, false);
>  
>  	return ret;
