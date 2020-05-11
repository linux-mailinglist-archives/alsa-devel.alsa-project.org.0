Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CACFC1CD1E3
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 08:34:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55BE61607;
	Mon, 11 May 2020 08:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55BE61607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589178863;
	bh=2NLujalkFrwrN4wsSJO1B+cIhyLExOYM1THy3Lqg6TQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PP6T7ZpgDJQgP1xxHCc1amOu+3M1poROfKfoePGesa157N04XLiozSZgUe/xWptn9
	 mmqErwVz0HP4aHUT0B5OiMBP+xRZXQyhlw62B/lXMc/Wmrh66A1lH/LB4xOaghSenj
	 XDT3aiP3lPorgMy5l1DGnNgU66a/8bC32rk+n1Hg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FCA9F80157;
	Mon, 11 May 2020 08:32:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB457F8014C; Mon, 11 May 2020 08:32:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6ABB2F800E3
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 08:32:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ABB2F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a9kvfO/z"
Received: from localhost (unknown [122.167.117.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0955E207DD;
 Mon, 11 May 2020 06:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589178751;
 bh=2NLujalkFrwrN4wsSJO1B+cIhyLExOYM1THy3Lqg6TQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a9kvfO/zExXGRVKlys3c28Ud+Gcpe6GQArrRMKHo+8aF3KgiZwYiTw3JHPwS91sdU
 /n4Prhvsm5Vu1boMsRGzV5YPloyF2FAz6GwTfZy3Yr2WMWVtPEiBsVx7JTVdNodGMb
 xy8lMkgIfXSZP0gZGSOhrjfeqeHH58gJJDZmWohQ=
Date: Mon, 11 May 2020 12:02:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 3/3] soundwire: bus_type: add sdw_master_device support
Message-ID: <20200511063227.GS1375924@vkoul-mobl>
References: <20200429185145.12891-1-yung-chuan.liao@linux.intel.com>
 <20200429185145.12891-4-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429185145.12891-4-yung-chuan.liao@linux.intel.com>
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

On 30-04-20, 02:51, Bard Liao wrote:
> @@ -24,9 +24,14 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
>  	struct sdw_master_prop *prop = NULL;
>  	int ret;
>  
> -	if (!bus->dev) {
> -		pr_err("SoundWire bus has no device\n");
> -		return -ENODEV;

This check is removed and not moved into sdw_master_device_add() either,
can you add here or in patch 1 and keep checking the parent device please

> +int sdw_master_device_add(struct sdw_bus *bus, struct device *parent,
> +			  struct fwnode_handle *fwnode)
> +{
> +	struct sdw_master_device *md;
> +	int ret;
> +
> +	if (!bus)
> +		return -EINVAL;
> +
> +	/*
> +	 * Unlike traditional devices, there's no allocation here since the
> +	 * sdw_master_device is embedded in the bus structure.
> +	 */

Looking at this and empty sdw_master_device_release() above, makes me
wonder if it is a wise move? Should we rather allocate the
sdw_master_device() and then free that up in sdw_master_device_release()
or it is really overkill given that this is called when we remove the
sdw_bus instance as well...

> +	md = &bus->md;
> +	md->dev.bus = &sdw_bus_type;
> +	md->dev.type = &sdw_master_type;
> +	md->dev.parent = parent;
> +	md->dev.of_node = parent->of_node;
> +	md->dev.fwnode = fwnode;
> +	md->dev.dma_mask = parent->dma_mask;
> +
> +	dev_set_name(&md->dev, "sdw-master-%d", bus->link_id);

This give nice sdw-master-0. In DT this comes from reg property. I dont
seem to recall if the ACPI/Disco spec treats link_id as unique across
the system, can you check that please, if not we would need to update
this.

-- 
~Vinod
