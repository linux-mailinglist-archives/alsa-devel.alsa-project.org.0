Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3EC7B809C
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 15:17:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CD49A4E;
	Wed,  4 Oct 2023 15:16:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CD49A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696425469;
	bh=J7FWRujScPWtK9aYMSMLSqxeUcL9YGPo2NYKLZhT1DU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QWYF/ebJEqw/1Ez6oz4jdXqSDC/D7KMCbFh8mdoFib8Rot/KPJLcjuO8kzvgXK6By
	 SsqkpzwhS1DKNqbAsZ7pwMbdH5liEmFZNu4Q0SfABu+vSebn68y/NxE4wQ2prOcB/Z
	 tmpXW9UGRYMdHTlHlQVNJ03Z2SUceTlXhZxjRVMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EE37F80130; Wed,  4 Oct 2023 15:16:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 180DDF8047D;
	Wed,  4 Oct 2023 15:16:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DD07F80551; Wed,  4 Oct 2023 15:16:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F144F80549
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 15:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F144F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=X5O55a74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696425414; x=1727961414;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J7FWRujScPWtK9aYMSMLSqxeUcL9YGPo2NYKLZhT1DU=;
  b=X5O55a74jnduhc2fdp9jLhsNvBIDqwjYTDyASQe4chqCcngjBrTnukYd
   j/Us5W3mWM6gWg6uytOoOeGfockRrJ4IQgWwdxCHZLEGV8lltzp1/VAt0
   DIy31Y8DXbtjdf/OITEAA3s4GqBKS3biBbTeeZ83VVF505JCCAZso5i8A
   qNGwazxFmA1xo5cQZYr9+Np0ImcKsBa2Xlm9y5PnkQiTSONe2paLnWa30
   SGjwT6oJKzS9nvHK/rG/Z8hpjnSXmY6xgs8Ynf4+1VXVS/Rj0JjeWcXw5
   3yR4v/FfGUBHIV3sTfwJY/YonuYcRfql2h2xEI0+TneFFVA0A9XIt0Hxy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383069841"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200";
   d="scan'208";a="383069841"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 06:16:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="821664266"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200";
   d="scan'208";a="821664266"
Received: from mfmousa-mobl1.amr.corp.intel.com (HELO [10.212.98.56])
 ([10.212.98.56])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 06:16:48 -0700
Message-ID: <6628a5f6-ed22-4039-b5c2-2301c05c7e3e@linux.intel.com>
Date: Wed, 4 Oct 2023 09:16:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: fix initializing sysfs for same devices on
 different buses
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20231004130243.493617-1-krzysztof.kozlowski@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231004130243.493617-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: H3I34UKGTAVTVP5P2LNNP5PBQEWJF64B
X-Message-ID-Hash: H3I34UKGTAVTVP5P2LNNP5PBQEWJF64B
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3I34UKGTAVTVP5P2LNNP5PBQEWJF64B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/4/23 09:02, Krzysztof Kozlowski wrote:
> If same devices with same device IDs are present on different soundwire
> buses, the probe fails due to conflicting device names and sysfs
> entries:
> 
>   sysfs: cannot create duplicate filename '/bus/soundwire/devices/sdw:0:0217:0204:00:0'
> 
> The link ID is 0 for both devices, so they should be differentiated by
> bus ID.  Add the bus ID so, the device names and sysfs entries look
> like:

I am pretty sure this will break Intel platforms by changing the device
names.

sof_sdw.c:      else if (is_unique_device(adr_link, sdw_version, mfg_id,
part_id,
sof_sdw.c:
"sdw:%01x:%04x:%04x:%02x", link_id,
sof_sdw.c:
"sdw:%01x:%04x:%04x:%02x:%01x", link_id,

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
>  			     id->class_id, id->unique_id);
>  	}
>  
