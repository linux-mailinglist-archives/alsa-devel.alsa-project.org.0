Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4CD11DE92
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 08:24:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EC58175A;
	Fri, 13 Dec 2019 08:23:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EC58175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576221851;
	bh=DoDJNL5jhfS3LXyUuyZDlAVWNiN11gzO8PPHtkVCMFY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bPJ1fW9LnGqFHieJOLH2ljUi1ie1Gqu4Q4d+1p/qypjwZCxxP6xsl7dF5OKWJwGj8
	 3FOl0VBu2SVlC/rKAfkIREEoDwDLA+pkMM1jvy8i/ZVU6Rudzc1LYcY0lcbFkM6M8L
	 Hx4mCV+jtDPlUmCo+XiJGNk29hdS+6UmtOtcperc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EAF8F8023F;
	Fri, 13 Dec 2019 08:22:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A2B9F8021E; Fri, 13 Dec 2019 08:22:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B412F800AB
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 08:22:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B412F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2flDD/pR"
Received: from localhost (unknown [84.241.199.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E955222527;
 Fri, 13 Dec 2019 07:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576221754;
 bh=0sPm7J7BCIEhMIoIedEg2UHth35LruEqtDCfrEnZ7Vs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2flDD/pRkDALP6RVioapKjvMd3DFwlByvJfqSwkUOzH4yhMOzaWu38P/krZc6cA4Y
 fEKZ0sbG0hWTa4ccqYWjXdK6wy+iPKQMAlcUiZ4cpvW14Cfx8ti65ilWrLypCL6E2z
 hO47UMngPqdR2r53YuwyJErkX1obP+uB1JvrdHD0=
Date: Fri, 13 Dec 2019 08:22:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191213072231.GE1750354@kroah.com>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
 <20191213050409.12776-8-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213050409.12776-8-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v4 07/15] soundwire: slave: move uevent
	handling to slave
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

On Thu, Dec 12, 2019 at 11:04:01PM -0600, Pierre-Louis Bossart wrote:
> Currently the code deals with uevents at the bus level, but we only care
> for Slave events

What does this mean?  I can't understand it, can you please provide more
information on what you are doing here?

> 
> Suggested-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus.h      | 2 ++
>  drivers/soundwire/bus_type.c | 3 +--
>  drivers/soundwire/slave.c    | 1 +
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
> index cb482da914da..be01a5f3d00b 100644
> --- a/drivers/soundwire/bus.h
> +++ b/drivers/soundwire/bus.h
> @@ -6,6 +6,8 @@
>  
>  #define DEFAULT_BANK_SWITCH_TIMEOUT 3000
>  
> +int sdw_uevent(struct device *dev, struct kobj_uevent_env *env);
> +
>  #if IS_ENABLED(CONFIG_ACPI)
>  int sdw_acpi_find_slaves(struct sdw_bus *bus);
>  #else
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index bbdedce5eb26..5c18c21545b5 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -47,7 +47,7 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
>  			slave->id.mfg_id, slave->id.part_id);
>  }
>  
> -static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
> +int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>  {
>  	struct sdw_slave *slave;
>  	char modalias[32];
> @@ -71,7 +71,6 @@ static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>  struct bus_type sdw_bus_type = {
>  	.name = "soundwire",
>  	.match = sdw_bus_match,
> -	.uevent = sdw_uevent,
>  };
>  EXPORT_SYMBOL_GPL(sdw_bus_type);
>  
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index c87267f12a3b..014c3ece1f17 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -17,6 +17,7 @@ static void sdw_slave_release(struct device *dev)
>  struct device_type sdw_slave_type = {
>  	.name =		"sdw_slave",
>  	.release =	sdw_slave_release,
> +	.uevent = sdw_uevent,

Align this with the other ones?

does this cause any different functionality?

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
