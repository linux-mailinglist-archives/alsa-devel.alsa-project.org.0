Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C557B8044
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 15:12:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2BA5868;
	Wed,  4 Oct 2023 15:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2BA5868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696425173;
	bh=siX93/m9hk1N1zT9g0DoJx25MsV21pxMygnh0PRczAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=paZl9yXjBnPekQn+EF5FKBXhK0LGdahtXD/z5opY2Y3tcW4YhQyx0MauSttoXb6VA
	 77staIZUn42XKMn68ijAn/PzTOX/XdkESoFEUA6A7dYIZJQPgkA+wfViW8yHCkITTk
	 gB5d7PK+30NjEcbCq56DTr3u5jNFYF5aUtFcfSiU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3722EF80166; Wed,  4 Oct 2023 15:12:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF247F80310;
	Wed,  4 Oct 2023 15:12:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 649AAF8047D; Wed,  4 Oct 2023 15:11:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFEEFF80130
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 15:11:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFEEFF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=LFq47Bav
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC21F61546;
	Wed,  4 Oct 2023 13:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E438BC433C7;
	Wed,  4 Oct 2023 13:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696425107;
	bh=siX93/m9hk1N1zT9g0DoJx25MsV21pxMygnh0PRczAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LFq47BavBbfGaR+VlduyVs/WF3d+Fqa/zzazKNmOrkvelOde1Ggdug0fAZUEcQzt8
	 6WW/anpby0kWPROJLOkeLV8dxT3IZTmLpFYHxaHqGOmLLieiKebPbvzm0wlKPOnWG0
	 vA15t9OEHnNVNmFRWknBjy4wUIP04rLg7oqnFnls=
Date: Wed, 4 Oct 2023 15:11:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] soundwire: fix initializing sysfs for same devices on
 different buses
Message-ID: <2023100426-purebred-cabbie-ae19@gregkh>
References: <20231004130243.493617-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004130243.493617-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: 7XJKYSK7FIL62R7LQ65GXY3G5E6RWP6G
X-Message-ID-Hash: 7XJKYSK7FIL62R7LQ65GXY3G5E6RWP6G
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XJKYSK7FIL62R7LQ65GXY3G5E6RWP6G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 04, 2023 at 03:02:43PM +0200, Krzysztof Kozlowski wrote:
> If same devices with same device IDs are present on different soundwire
> buses, the probe fails due to conflicting device names and sysfs
> entries:
> 
>   sysfs: cannot create duplicate filename '/bus/soundwire/devices/sdw:0:0217:0204:00:0'
> 
> The link ID is 0 for both devices, so they should be differentiated by
> bus ID.  Add the bus ID so, the device names and sysfs entries look
> like:
> 
>   sdw:1:0:0217:0204:00:0 -> ../../../devices/platform/soc@0/6ab0000.soundwire-controller/sdw-master-1/sdw:1:0:0217:0204:00:0
>   sdw:3:0:0217:0204:00:0 -> ../../../devices/platform/soc@0/6b10000.soundwire-controller/sdw-master-3/sdw:3:0:0217:0204:00:0
> 
> Fixes: 7c3cd189b86d ("soundwire: Add Master registration")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Sending as RFT, because I did not test it on that many devices and
> user-spaces.
> ---
>  drivers/soundwire/slave.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index c1c1a2ac293a..4db43ea53d47 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -39,14 +39,14 @@ int sdw_slave_add(struct sdw_bus *bus,
>  	slave->dev.fwnode = fwnode;
>  
>  	if (id->unique_id == SDW_IGNORED_UNIQUE_ID) {
> -		/* name shall be sdw:link:mfg:part:class */
> -		dev_set_name(&slave->dev, "sdw:%01x:%04x:%04x:%02x",
> -			     bus->link_id, id->mfg_id, id->part_id,
> +		/* name shall be sdw:bus:link:mfg:part:class */
> +		dev_set_name(&slave->dev, "sdw:%01x:%01x:%04x:%04x:%02x",
> +			     bus->id, bus->link_id, id->mfg_id, id->part_id,
>  			     id->class_id);
>  	} else {
> -		/* name shall be sdw:link:mfg:part:class:unique */
> -		dev_set_name(&slave->dev, "sdw:%01x:%04x:%04x:%02x:%01x",
> -			     bus->link_id, id->mfg_id, id->part_id,
> +		/* name shall be sdw:bus:link:mfg:part:class:unique */
> +		dev_set_name(&slave->dev, "sdw:%01x:%01x:%04x:%04x:%02x:%01x",
> +			     bus->id, bus->link_id, id->mfg_id, id->part_id,

Shouldn't some documenation also be changed somewhere that describes the
device id?

thanks,

greg k-h
