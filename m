Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D034011DE90
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 08:23:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28C20175B;
	Fri, 13 Dec 2019 08:22:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28C20175B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576221803;
	bh=rR/lvCLT0WEZbtsCoEHcUGpPkz18OzVz8zmsp4gNbPk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E9PEmTUZ+tZs2MoYAzkaixa4zw/GjDUiMs7Qr+eUWIsDQqaU5MlbRpSZNNzuoi7Q8
	 aghx4zogYoXKdWrBTxOwjjUaukInxzg7bM+VKc/ZPNnsWdDz/CLzuc9OchO3feyI9I
	 F19QWcZS4Bj4dFlvx89a3s1Rqp8zGhZlUO2E3IO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5E09F8021D;
	Fri, 13 Dec 2019 08:21:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6DC3F801F4; Fri, 13 Dec 2019 08:21:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C1C1F80139
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 08:21:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C1C1F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nK0mkKVm"
Received: from localhost (unknown [84.241.199.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF17A22527;
 Fri, 13 Dec 2019 07:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576221690;
 bh=1irYrXGOcxexWbuIpAf9P38P6DG0tz6DxNZJDv6EmtE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nK0mkKVmXw7yPAns6tFG57mYIF/DC4ECaDxa6MTMHPSLqnk+MSMsR085zVutvYQAV
 7UYPqnsEhYcTghhvcofVsrcuPD2B/7IRgn+8EPaWeCWXZbUDRoQSgvL7oOtB+XzUcm
 pjE/UUBFae5wZF8Yqo2aWF/lI+X0Txh4bbAcpKTM=
Date: Fri, 13 Dec 2019 08:21:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191213072127.GD1750354@kroah.com>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
 <20191213050409.12776-7-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213050409.12776-7-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 06/15] soundwire: add support for
	sdw_slave_type
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

On Thu, Dec 12, 2019 at 11:04:00PM -0600, Pierre-Louis Bossart wrote:
> Currently the bus does not have any explicit support for master
> devices.
> 
> First add explicit support for sdw_slave_type and error checks if this type
> is not set.
> 
> In follow-up patches we can add support for the sdw_md_type (md==Master
> Device), following the Grey Bus example.

How are you using greybus as an example of "master devices"?  All you
are doing here is setting the type of the existing devices, right?


> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus_type.c       | 16 ++++++++++++----
>  drivers/soundwire/slave.c          |  7 ++++++-
>  include/linux/soundwire/sdw_type.h |  6 ++++++
>  3 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 9a0fd3ee1014..bbdedce5eb26 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -49,13 +49,21 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
>  
>  static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>  {
> -	struct sdw_slave *slave = to_sdw_slave_device(dev);
> +	struct sdw_slave *slave;
>  	char modalias[32];
>  
> -	sdw_slave_modalias(slave, modalias, sizeof(modalias));
> +	if (is_sdw_slave(dev)) {
> +		slave = to_sdw_slave_device(dev);
> +
> +		sdw_slave_modalias(slave, modalias, sizeof(modalias));
>  
> -	if (add_uevent_var(env, "MODALIAS=%s", modalias))
> -		return -ENOMEM;
> +		if (add_uevent_var(env, "MODALIAS=%s", modalias))
> +			return -ENOMEM;
> +	} else {
> +		/* only Slave device type supported */
> +		dev_warn(dev, "uevent for unknown Soundwire type\n");
> +		return -EINVAL;

Right now, this can not happen, right?

Not a problem, just trying to understand the sequence of patches here...

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
