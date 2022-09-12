Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E91D5B59DC
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 14:02:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4B1116E3;
	Mon, 12 Sep 2022 14:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4B1116E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662984161;
	bh=o6Bq1Z3Sr0g8BtqtCAOe8U9O5accgN6ulqcimCetaDA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NS4eCc8w4f0IBbss9Gzv8aGXijRQcrWfkkft+gsD4JFE+AjPVIM1gTRBP520eahIt
	 2v4fvRXEBQ5neTMrcneV8euyx/Zec6dV9xQDtRSqaT9FXIsct2LarvrzLDyP4sAzzM
	 RLePclnddfYECaL+gtKSt2O0oxqkg5gAvRqkcORk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9641F80568;
	Mon, 12 Sep 2022 14:00:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89F83F80563; Mon, 12 Sep 2022 14:00:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAC32F80564
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 14:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAC32F80564
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aJrpUTf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662984026; x=1694520026;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=o6Bq1Z3Sr0g8BtqtCAOe8U9O5accgN6ulqcimCetaDA=;
 b=aJrpUTf/2qa1ze2/ufLuik/+IS4TkgG+UZ2fSUt47h6a3WlYAz0TExyC
 UPfX05k30E6KUqh/o8DO9YST6VASumO/FjJPOiV1FmBWTPPgrip/+5I1H
 m5Jd2Xz+A86nYuFfCYSdy3kQL66CYnZ/tyQfKhvAybNTqIY+pB2gxXJaJ
 z7HNoYhNnjc0rTqHWbYHI0MABJPUBakgAqhOufXm86W7YfbHWNq4Arv+z
 9tTIMUpYp+qkOVKuYsJVwkrHpcld0AG/nipP/9LgJBBEPav2VlNM1MLPB
 Tse7f8PYhjqhZzxBuuCJHrWyRBIw/9LZQXDq1lNV2aw6rYyeYFZyroakF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="284867037"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="284867037"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 05:00:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="705126634"
Received: from vtsymbal-mobl.ger.corp.intel.com (HELO [10.252.32.67])
 ([10.252.32.67])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 05:00:19 -0700
Message-ID: <fa14881d-0eb8-f652-aea7-00d8c3f2a6bb@linux.intel.com>
Date: Mon, 12 Sep 2022 13:43:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/5] soundwire: bus: Don't exit early if no device IDs
 were programmed
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20220907085259.3602-1-rf@opensource.cirrus.com>
 <20220907085259.3602-6-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220907085259.3602-6-rf@opensource.cirrus.com>
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



On 9/7/22 10:52, Richard Fitzgerald wrote:
> Only exit sdw_handle_slave_status() right after calling
> sdw_program_device_num() if it actually programmed an ID into at
> least one device.
> 
> sdw_handle_slave_status() should protect itself against phantom
> device #0 ATTACHED indications. In that case there is no actual
> device still on #0. The early exit relies on there being a status
> change to ATTACHED on the reprogrammed device to trigger another
> call to sdw_handle_slave_status() which will then handle the status
> of all peripherals. If no device was actually programmed with an
> ID there won't be a new ATTACHED indication. This can lead to the
> status of other peripherals not being handled.
> 
> The status passed to sdw_handle_slave_status() is obviously always
> from a point of time in the past, and may indicate accumulated
> unhandled events (depending how the bus manager operates). It's
> possible that a device ID is reprogrammed but the last PING status
> captured state just before that, when it was still reporting on
> ID #0. Then sdw_handle_slave_status() is called with this PING info,
> just before a new PING status is available showing it now on its new
> ID. So sdw_handle_slave_status() will receive a phantom report of a
> device on #0, but it will not find one.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  drivers/soundwire/bus.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 6e569a875a9b..0bcc2d161eb9 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -736,20 +736,19 @@ static int sdw_program_device_num(struct sdw_bus *bus)
>  	struct sdw_slave_id id;
>  	struct sdw_msg msg;
>  	bool found;
> -	int count = 0, ret;
> +	int count = 0, num_programmed = 0, ret;
>  	u64 addr;
>  
>  	/* No Slave, so use raw xfer api */
>  	ret = sdw_fill_msg(&msg, NULL, SDW_SCP_DEVID_0,
>  			   SDW_NUM_DEV_ID_REGISTERS, 0, SDW_MSG_FLAG_READ, buf);
>  	if (ret < 0)
> -		return ret;
> +		return 0;

this doesn't seem quite right to me, there are multiple -EINVAL cases
handled in sdw_fill_msg().

I didn't check if all these error cases are irrelevant in that specific
enumeration case, if that was the case maybe we need to break that
function in two helpers so that all the checks can be skipped.

>  
>  	do {
>  		ret = sdw_transfer(bus, &msg);
>  		if (ret == -ENODATA) { /* end of device id reads */
>  			dev_dbg(bus->dev, "No more devices to enumerate\n");
> -			ret = 0;
>  			break;
>  		}
>  		if (ret < 0) {
> @@ -781,7 +780,7 @@ static int sdw_program_device_num(struct sdw_bus *bus)
>  				 * assigned a device ID.
>  				 */
>  				if (slave->status != SDW_SLAVE_UNATTACHED)
> -					return 0;
> +					return num_programmed;
>  
>  				/*
>  				 * Assign a new dev_num to this Slave and
> @@ -794,9 +793,11 @@ static int sdw_program_device_num(struct sdw_bus *bus)
>  					dev_err(bus->dev,
>  						"Assign dev_num failed:%d\n",
>  						ret);
> -					return ret;
> +					return num_programmed;
>  				}
>  
> +				++num_programmed;
> +
>  				break;
>  			}
>  		}
> @@ -825,7 +826,7 @@ static int sdw_program_device_num(struct sdw_bus *bus)
>  
>  	} while (ret == 0 && count < (SDW_MAX_DEVICES * 2));
>  
> -	return ret;
> +	return num_programmed;
>  }
>  
>  static void sdw_modify_slave_status(struct sdw_slave *slave,
> @@ -1787,14 +1788,16 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
>  
>  	if (status[0] == SDW_SLAVE_ATTACHED) {
>  		dev_dbg(bus->dev, "Slave attached, programming device number\n");
> -		ret = sdw_program_device_num(bus);
> -		if (ret < 0)
> -			dev_err(bus->dev, "Slave attach failed: %d\n", ret);
> +
>  		/*
> -		 * programming a device number will have side effects,
> -		 * so we deal with other devices at a later time
> +		 * Programming a device number will have side effects,
> +		 * so we deal with other devices at a later time.
> +		 * But only if any devices were reprogrammed, because
> +		 * this relies on its PING state changing to ATTACHED,
> +		 * triggering a status change.
>  		 */
> -		return ret;
> +		if (sdw_program_device_num(bus))
> +			return 0;
>  	}
>  
>  	/* Continue to check other slave statuses */
