Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F556E30A2
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 13:41:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA32F16A1;
	Thu, 24 Oct 2019 13:40:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA32F16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571917270;
	bh=kWObeEArXZLtu5oLzublBY8kkXtJb0HXltq7cmeJtaI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qxrtn0jW+7Pm8jvGkPcF24oRbAAW0YHJO0MYcrjTYraX4XODUWFlLZREYo6L65Cq9
	 UcAxNGc05SwOszwJ47Lp902fiq8/ky+B0ndJbrfB+xGG6Jppc5cqk4UwlyNZuk08Ja
	 y8kR2+uTD5WqOsT1TlREYMw9+86hkDw1NhPLv59w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F39EF80377;
	Thu, 24 Oct 2019 13:39:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BECFF8036B; Thu, 24 Oct 2019 13:39:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CFC7F80112
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 13:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CFC7F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nD7zqHML"
Received: from localhost (unknown [122.181.210.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D37B20679;
 Thu, 24 Oct 2019 11:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571917158;
 bh=btv1T62kZlTa2GqfHH4BS6VB02TuYQ5KdYGyc08+TRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nD7zqHMLHLaS0MspoOdBs9SSyekBu/RzDoBVMLHUJ3u+4Zfsm+4J+wNsw3RA0fdqI
 I/ZnVPtccAexpTnhp3QdlFjKmHU61l7ZkdcU/tJJmM6wcZ0bfvIwNEjUS7c4UYEvpT
 faUnHCgEUchMSyvTtKSOL0wIv+r1i+DlUJBcYIgY=
Date: Thu, 24 Oct 2019 17:09:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191024113911.GD2620@vkoul-mobl>
References: <20191022234808.17432-1-pierre-louis.bossart@linux.intel.com>
 <20191022234808.17432-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022234808.17432-4-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 3/3] soundwire: ignore uniqueID when
	irrelevant
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

On 22-10-19, 18:48, Pierre-Louis Bossart wrote:
> The uniqueID is useful when there are two or more devices of the same
> type (identical manufacturer ID, part ID) on the same link.

Right!

> When there is a single device of a given type on a link, its uniqueID
> is irrelevant. It's not uncommon on actual platforms to see variations
> of the uniqueID, or differences between devID registers and ACPI _ADR
> fields.

Ideally this should be fixed in firmware, I do not like the fact the we are
poking in core for firmware issues!

> This patch suggests a filter on startup to identify 'single' devices
> and tag them accordingly. 

So you try to see if the board has a single device and mark them so that
you can skip the unique id, did I get that right?

What about the boards which have multiple devices? How doing solve
these?

> The uniqueID is then not used for the probe,
> and the device name omits the uniqueID as well.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus.c   |  7 +++---
>  drivers/soundwire/slave.c | 52 ++++++++++++++++++++++++++++++++++++---
>  2 files changed, 52 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index fc53dbe57f85..be5d437058ed 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -422,10 +422,11 @@ static struct sdw_slave *sdw_get_slave(struct sdw_bus *bus, int i)
>  
>  static int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id)
>  {
> -	if (slave->id.unique_id != id.unique_id ||
> -	    slave->id.mfg_id != id.mfg_id ||
> +	if (slave->id.mfg_id != id.mfg_id ||
>  	    slave->id.part_id != id.part_id ||
> -	    slave->id.class_id != id.class_id)
> +	    slave->id.class_id != id.class_id ||
> +	    (slave->id.unique_id != SDW_IGNORED_UNIQUE_ID &&
> +	     slave->id.unique_id != id.unique_id))
>  		return -ENODEV;
>  
>  	return 0;
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index 5dbc76772d21..19919975bb6d 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -29,10 +29,17 @@ static int sdw_slave_add(struct sdw_bus *bus,
>  	slave->dev.parent = bus->dev;
>  	slave->dev.fwnode = fwnode;
>  
> -	/* name shall be sdw:link:mfg:part:class:unique */
> -	dev_set_name(&slave->dev, "sdw:%x:%x:%x:%x:%x",
> -		     bus->link_id, id->mfg_id, id->part_id,
> -		     id->class_id, id->unique_id);
> +	if (id->unique_id == SDW_IGNORED_UNIQUE_ID) {
> +		/* name shall be sdw:link:mfg:part:class */
> +		dev_set_name(&slave->dev, "sdw:%x:%x:%x:%x",
> +			     bus->link_id, id->mfg_id, id->part_id,
> +			     id->class_id);
> +	} else {
> +		/* name shall be sdw:link:mfg:part:class:unique */
> +		dev_set_name(&slave->dev, "sdw:%x:%x:%x:%x:%x",
> +			     bus->link_id, id->mfg_id, id->part_id,
> +			     id->class_id, id->unique_id);
> +	}
>  
>  	slave->dev.release = sdw_slave_release;
>  	slave->dev.bus = &sdw_bus_type;
> @@ -103,6 +110,7 @@ static bool find_slave(struct sdw_bus *bus,
>  int sdw_acpi_find_slaves(struct sdw_bus *bus)
>  {
>  	struct acpi_device *adev, *parent;
> +	struct acpi_device *adev2, *parent2;
>  
>  	parent = ACPI_COMPANION(bus->dev);
>  	if (!parent) {
> @@ -112,10 +120,46 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
>  
>  	list_for_each_entry(adev, &parent->children, node) {
>  		struct sdw_slave_id id;
> +		struct sdw_slave_id id2;
> +		bool ignore_unique_id = true;
>  
>  		if (!find_slave(bus, adev, &id))
>  			continue;
>  
> +		/* brute-force O(N^2) search for duplicates */
> +		parent2 = parent;
> +		list_for_each_entry(adev2, &parent2->children, node) {
> +
> +			if (adev == adev2)
> +				continue;
> +
> +			if (!find_slave(bus, adev2, &id2))
> +				continue;
> +
> +			if (id.sdw_version != id2.sdw_version ||
> +			    id.mfg_id != id2.mfg_id ||
> +			    id.part_id != id2.part_id ||
> +			    id.class_id != id2.class_id)
> +				continue;
> +
> +			if (id.unique_id != id2.unique_id) {
> +				dev_dbg(bus->dev,
> +					"Valid unique IDs %x %x for Slave mfg %x part %d\n",
> +					id.unique_id, id2.unique_id,
> +					id.mfg_id, id.part_id);
> +				ignore_unique_id = false;
> +			} else {
> +				dev_err(bus->dev,
> +					"Invalid unique IDs %x %x for Slave mfg %x part %d\n",
> +					id.unique_id, id2.unique_id,
> +					id.mfg_id, id.part_id);
> +				return -ENODEV;
> +			}
> +		}
> +
> +		if (ignore_unique_id)
> +			id.unique_id = SDW_IGNORED_UNIQUE_ID;
> +
>  		/*
>  		 * don't error check for sdw_slave_add as we want to continue
>  		 * adding Slaves
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
