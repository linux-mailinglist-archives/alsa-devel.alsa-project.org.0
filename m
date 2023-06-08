Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CCD72781C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 09:04:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1108174C;
	Thu,  8 Jun 2023 09:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1108174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686207879;
	bh=5HtRogoAh3fjCmgcEryno3NX7M48UKDYlbGiGKHr5Fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cb7VWQ5nD2vZOSp46QBS2vmA66pXUvntOkookbUtgpjf2SO4P8cHy9BHQ+zcx/Q39
	 LLlSJ+vJ215wDjp06OPfAelzq2m7KqQIKNkF7so5TueHmah8yAlbF7eMZUAgbgtPxL
	 t+d+eL/Wv+bJtk0W2JPdvSO5vbpvPoFS0zPMSIAo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D50DF80199; Thu,  8 Jun 2023 09:03:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E822DF8016C;
	Thu,  8 Jun 2023 09:03:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DEF4F80199; Thu,  8 Jun 2023 09:03:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8D89F80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 09:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8D89F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EWly14kw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C2F3A61A39;
	Thu,  8 Jun 2023 07:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AA8C433EF;
	Thu,  8 Jun 2023 07:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686207778;
	bh=5HtRogoAh3fjCmgcEryno3NX7M48UKDYlbGiGKHr5Fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EWly14kwrh8eZxQZaeZ2zFY0UgJTfzku9jqovlZWOTLapW1GrGML4Yh9czEt4ALnZ
	 Vfa6/wKNkm4pSBcTfXrnXnPN1xPoG1nLqF504KVE2EIA6tM4jd5JhyJEEEYPSt14IX
	 VAIIfiEtM1BdJEjzNfH092venkVDi3JFJqsPgSEWeCEHxSVSBRwtDzMIdP7EY48UgO
	 5NTqdEkBoIRpryMOldg2xOORLAiHfYK2nnCbZ3meL6tpeYyEM+VOZVvIrt4mjMwjKv
	 5lzyL4xZIz88aGA3FwlfI9Ut8QKodxC6kZxp9ZEau2+hZf0502mPwNOhZoYeMpvBey
	 jRuITjaPtLK3A==
Date: Thu, 8 Jun 2023 12:32:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
Subject: Re: [PATCH 1/4] soundwire: add enum to control device number
 allocation
Message-ID: <ZIF9Hd5Hv/CKQeUW@matsya>
References: <20230531033736.792464-1-yung-chuan.liao@linux.intel.com>
 <20230531033736.792464-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531033736.792464-2-yung-chuan.liao@linux.intel.com>
Message-ID-Hash: DLAJSQ44BHSSJKMVYLCYXEODOA7TOH4K
X-Message-ID-Hash: DLAJSQ44BHSSJKMVYLCYXEODOA7TOH4K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DLAJSQ44BHSSJKMVYLCYXEODOA7TOH4K/>
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
> Commit c60561014257 ("soundwire: bus: allow device number to be unique
> at system level") introduced two strategies to allocate device
> numbers.
> 
> a) a default unconstrained allocation, where each bus can allocate
> Device Numbers independently.
> 
> b) an ida-based allocation. In this case each Device Number will be
> unique at the system-level.
> 
> The IDA-based allocation is useful to simplify debug, but it was also
> introduced as a prerequisite to deal with the Intel Lunar Lake
> hardware programming sequences: the wake-ups have to be handled with a
> system-unique SDI address at the HDaudio controller level.
> 
> At the time, the restriction introduced by the IDA to 8 devices total
> seemed perfectly fine, but recently hardware vendors created
> configurations with more than 8 devices.
> 
> This patch provides an iso-functionality change, with the allocation
> selected with an enum instead of an 'ida_min' value. Follow-up patches
> will add a new allocation strategy to allow for more than 8 devices
> using information on the type of devices, and only use the IDA-based
> allocation for devices capable of generating a wake.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/bus.c             |  4 ++--
>  drivers/soundwire/intel_auxdevice.c |  1 +
>  include/linux/soundwire/sdw.h       | 16 +++++++++++++++-
>  3 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index b44f8d0affa6..e8c1c55a2a73 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -159,7 +159,7 @@ static int sdw_delete_slave(struct device *dev, void *data)
>  
>  	if (slave->dev_num) { /* clear dev_num if assigned */
>  		clear_bit(slave->dev_num, bus->assigned);
> -		if (bus->dev_num_ida_min)
> +		if (bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA)
>  			ida_free(&sdw_peripheral_ida, slave->dev_num);
>  	}
>  	list_del_init(&slave->node);
> @@ -701,7 +701,7 @@ static int sdw_get_device_num(struct sdw_slave *slave)
>  {
>  	int bit;
>  
> -	if (slave->bus->dev_num_ida_min) {
> +	if (slave->bus->dev_num_alloc == SDW_DEV_NUM_ALLOC_IDA) {
>  		bit = ida_alloc_range(&sdw_peripheral_ida,
>  				      slave->bus->dev_num_ida_min, SDW_MAX_DEVICES,
>  				      GFP_KERNEL);
> diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
> index 0daa6ca9a224..30f3d2ab80fd 100644
> --- a/drivers/soundwire/intel_auxdevice.c
> +++ b/drivers/soundwire/intel_auxdevice.c
> @@ -165,6 +165,7 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
>  	cdns->msg_count = 0;
>  
>  	bus->link_id = auxdev->id;
> +	bus->dev_num_alloc = SDW_DEV_NUM_ALLOC_IDA;
>  	bus->dev_num_ida_min = INTEL_DEV_NUM_IDA_MIN;
>  	bus->clk_stop_timeout = 1;
>  
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index c076a3f879b3..4656d6d0f3bb 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -864,6 +864,17 @@ struct sdw_master_ops {
>  	void (*new_peripheral_assigned)(struct sdw_bus *bus, int dev_num);
>  };
>  
> +/**
> + * enum sdw_dev_num_alloc - Device Number allocation strategies
> + * @SDW_DEV_NUM_ALLOC_DEFAULT: unconstrained first-come-first-serve allocation,
> + * using range [1, 11]
> + * @SDW_DEV_NUM_ALLOC_IDA: IDA-based allocation, using range [ida_min, 11]
> + */
> +enum sdw_dev_num_alloc {
> +	SDW_DEV_NUM_ALLOC_DEFAULT = 0,
> +	SDW_DEV_NUM_ALLOC_IDA,

Let default be IDA as 0, am sure we are not setting this field in qcom
or amd controller, lets retain the defaults please

> +};
> +
>  /**
>   * struct sdw_bus - SoundWire bus
>   * @dev: Shortcut to &bus->md->dev to avoid changing the entire code.
> @@ -895,9 +906,11 @@ struct sdw_master_ops {
>   * meaningful if multi_link is set. If set to 1, hardware-based
>   * synchronization will be used even if a stream only uses a single
>   * SoundWire segment.
> + * @dev_num_alloc: bus-specific device number allocation
>   * @dev_num_ida_min: if set, defines the minimum values for the IDA
>   * used to allocate system-unique device numbers. This value needs to be
> - * identical across all SoundWire bus in the system.
> + * identical across all SoundWire bus in the system. Only used if @sdw_num_alloc
> + * is not default.
>   */
>  struct sdw_bus {
>  	struct device *dev;
> @@ -922,6 +935,7 @@ struct sdw_bus {
>  	u32 bank_switch_timeout;
>  	bool multi_link;
>  	int hw_sync_min_links;
> +	enum sdw_dev_num_alloc dev_num_alloc;
>  	int dev_num_ida_min;
>  };
>  
> -- 
> 2.25.1

-- 
~Vinod
