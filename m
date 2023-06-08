Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73646727828
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 09:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 828966C1;
	Thu,  8 Jun 2023 09:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 828966C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686208033;
	bh=P79MCRt+hiRe7B8a/nvhZY8cLwClvWjf6ZV0bkWmcl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G++YtCgjjn2jxWGNfp37ehZrD707xWVZWy8JefPVrXdY65DdIGSb2ONmf0OECPaI/
	 7ku4p6JqwkXmRXL3a3EjEcPBgZsEKiOOij3VQf56FR4O81HIRchWR3GoNlXdIXZi9Z
	 1SaW+9EZZ8GIVF0E1xqnlK7GuzdPDOUfWPXNo+NQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4E31F8016C; Thu,  8 Jun 2023 09:06:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 854E4F8016C;
	Thu,  8 Jun 2023 09:06:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F64BF80199; Thu,  8 Jun 2023 09:06:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE977F80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 09:06:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE977F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pJGw4mbN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AFF0D648DA;
	Thu,  8 Jun 2023 07:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 480A8C4339E;
	Thu,  8 Jun 2023 07:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686207975;
	bh=P79MCRt+hiRe7B8a/nvhZY8cLwClvWjf6ZV0bkWmcl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJGw4mbNj45zXuKQqRtGgnGHaNm/XKKoY8m2Bb/9RrcDVOsL/QzkdMnzUfV8SSjgE
	 xCbz8yjDL1w6EGSo79xcGw1hJtCuIo5xYuK88O/Bh8UsLzGSIRj+3DxLrxwyQhkeXN
	 vuCqQ/dwP1oIRnLoyKPu8GSYyv5ug4YzdtlhKD5UPEOW6AH8PHeMY810HZvfAHRK9G
	 FbOWMq3xKd8ZldvnO894r2cPp5PX8t8rqV6vdKZweaTIsXYAil2cfj/2MfJVn9BYyf
	 RpuPzLdIzgKvVITgQC7dlV7uuOGTXtMfgIP7UHuXBVB5c80mBEMovQ7vZp0UIVf86q
	 u44O+Xzq67d9g==
Date: Thu, 8 Jun 2023 12:36:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
Subject: Re: [PATCH 2/4] soundwire: introduce SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY
Message-ID: <ZIF94vZHzeGXfyin@matsya>
References: <20230531033736.792464-1-yung-chuan.liao@linux.intel.com>
 <20230531033736.792464-3-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531033736.792464-3-yung-chuan.liao@linux.intel.com>
Message-ID-Hash: PQA5ZCOQORC2DXMX4PIYPNNVKL73KYLG
X-Message-ID-Hash: PQA5ZCOQORC2DXMX4PIYPNNVKL73KYLG
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PQA5ZCOQORC2DXMX4PIYPNNVKL73KYLG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31-05-23, 11:37, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> This patch adds a new Device Number allocation strategy, with the IDA
> used only for devices that are wake-capable.
> 
> "regular" devices such as amplifiers will use Device Numbers
> [1..min_ida-1].
> 
> "wake-capable" devices such as jack or microphone codecs will use
> Device Numbers [min_ida..11].
> 
> This hybrid strategy extends the number of supported devices in a
> system by only constraining the allocation if required, e.g. in the
> case of Intel LunarLake platforms the wake-capable devices are
> required to have a unique address to use the HDaudio SDI and HDAudio
> WAKEEN/WAKESTS registers.

This seems to be a consequence of Intel hardware decisions, so I guess
best suited place for this is Intel controller, do we really want to
have this in core logic?

> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/bus.c       | 26 +++++++++++++++++++++-----
>  include/linux/soundwire/sdw.h |  4 ++++
>  2 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index e8c1c55a2a73..6f465cce8369 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -159,7 +159,9 @@ static int sdw_delete_slave(struct device *dev, void *data)
>  
>  	if (slave->dev_num) { /* clear dev_num if assigned */
>  		clear_bit(slave->dev_num, bus->assigned);
> -		if (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA)
> +		if (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA ||
> +		    (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY &&
> +		     slave->prop.wake_capable))
>  			ida_free(&sdw_peripheral_ida, slave->dev_num);
>  	}
>  	list_del_init(&slave->node);
> @@ -699,17 +701,31 @@ EXPORT_SYMBOL(sdw_compare_devid);
>  /* called with bus_lock held */
>  static int sdw_get_device_num(struct sdw_slave *slave)
>  {
> +	struct sdw_bus *bus = slave->bus;
>  	int bit;
>  
> -	if (slave->bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA) {
> +	if (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA ||
> +	    (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY &&
> +	     slave->prop.wake_capable)) {
>  		bit = ida_alloc_range(&sdw_peripheral_ida,
> -				      slave->bus->dev_num_ida_min, SDW_MAX_DEVICES,
> +				      bus->dev_num_ida_min, SDW_MAX_DEVICES,
>  				      GFP_KERNEL);
>  		if (bit < 0)
>  			goto err;
>  	} else {
> -		bit = find_first_zero_bit(slave->bus->assigned, SDW_MAX_DEVICES);
> -		if (bit == SDW_MAX_DEVICES) {
> +		int max_devices = SDW_MAX_DEVICES;
> +
> +		if (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY &&
> +		    !slave->prop.wake_capable) {
> +			max_devices = bus->dev_num_ida_min - 1;
> +
> +			/* range check */
> +			if (max_devices < 1 || max_devices > SDW_MAX_DEVICES)
> +				return -EINVAL;
> +		}
> +
> +		bit = find_first_zero_bit(bus->assigned, max_devices);
> +		if (bit == max_devices) {
>  			bit = -ENODEV;
>  			goto err;
>  		}
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 4656d6d0f3bb..8a7541ac735e 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -869,10 +869,14 @@ struct sdw_master_ops {
>   * @SDW_DEV_NUM_ALLOC_DEFAULT: unconstrained first-come-first-serve allocation,
>   * using range [1, 11]
>   * @SDW_DEV_NUM_ALLOC_IDA: IDA-based allocation, using range [ida_min, 11]
> + * @SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY: Hybrid allocation where wake-capable devices rely on
> + * IDA-based allocation and range [ida_min, 11], while regular devices rely on default
> + * allocation in range [1, ida_min - 1]
>   */
>  enum sdw_dev_num_alloc {
>  	SDW_DEV_NUM_ALLOC_DEFAULT = 0,
>  	SDW_DEV_NUM_ALLOC_IDA,
> +	SDW_DEV_NUM_ALLOC_IDA_WAKE_ONLY,
>  };
>  
>  /**
> -- 
> 2.25.1

-- 
~Vinod
