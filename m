Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE4A12B24C
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 08:16:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D8B71713;
	Fri, 27 Dec 2019 08:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D8B71713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577430991;
	bh=+Q0qvvfzo9eNFkbCHi8TELWdwl2Q5oTa31kb+aj4gpE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H5BmX2jMebBb69ULyz50oQj1RUyFJZIhW7zDzE/PzTsl/RMzg7tSkLi4b5nrwsTu1
	 jW3zbRTVs+LIhGa52CkHE428/Gp9z7RPEHypFoHEz3QcHSb4HJJLLbMo87GMOjuoq2
	 IXiEjwewQwvEFZdI/+LIggEGMmqKV2jg/AxgHN0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 946C0F8013D;
	Fri, 27 Dec 2019 08:14:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BED50F80132; Fri, 27 Dec 2019 08:14:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 055F4F800CD
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 08:14:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 055F4F800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kZEwq+Vv"
Received: from localhost (unknown [106.201.34.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06F7E2053B;
 Fri, 27 Dec 2019 07:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577430879;
 bh=49Lm7+RozsQClCk5xLTdStGzPbj3kdYXaIJf87sbKDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kZEwq+VvfBH9zNooswKee02UuEVKFclYXC00+XJJBYZumMqasI7lmZzC6a4C4zqhp
 htbCOR7tc8NwCKaSnpbq4yBFw9hdbz60w7SCFdn4sxbTzEiuE3h7lylxSCISAcoTGA
 1f88U7Ug7Dmi8WI+1SgZtvJe5mPzTcfLFP3GwePA=
Date: Fri, 27 Dec 2019 12:44:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191227071433.GL3006@vkoul-mobl>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-9-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217210314.20410-9-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 08/17] soundwire: add initial
 definitions for sdw_master_device
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

On 17-12-19, 15:03, Pierre-Louis Bossart wrote:
> Since we want an explicit support for the SoundWire Master device, add
> the definitions, following the Greybus example of a 'Host Device'.
> 
> A parent (such as the Intel audio controller) would use sdw_md_add()
> to create the device, passing a driver as a parameter. The
> sdw_md_release() would be called when put_device() is invoked by the
> parent. We use the shortcut 'md' for 'master device' to avoid very
> long function names.

I agree we should not have long name :) but md does not sound great. Can
we drop the device and use sdw_slave and sdw_master for devices and
append _driver when we are talking about drivers... 

we dont use sd for slave and imo this would gel well with existing names

> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -66,7 +66,10 @@ int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>  		 * callback is set to use this function for a
>  		 * different device type (e.g. Master or Monitor)
>  		 */
> -		dev_err(dev, "uevent for unknown Soundwire type\n");
> +		if (is_sdw_master_device(dev))
> +			dev_err(dev, "uevent for SoundWire Master type\n");

see below [1]:

> +static void sdw_md_release(struct device *dev)

sdw_master_release() won't be too long!

> +{
> +	struct sdw_master_device *md = to_sdw_master_device(dev);
> +
> +	kfree(md);
> +}
> +
> +struct device_type sdw_md_type = {

sdw_master_type and so on :)

> +	.name =		"soundwire_master",
> +	.release =	sdw_md_release,

[1]:
There is no uevent added here, so sdw_uevent() will never be called for
this, can you check again if you see the print you added?

>  
> +struct sdw_master_device {

we have sdw_slave, so would be better if we call this sdw_master

> +	struct device dev;
> +	int link_id;
> +	struct sdw_md_driver *driver;
> +	void *pdata;

no sdw_bus pointer and I dont see bus adding this object.. Is there no
link between bus and master device objects?

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
