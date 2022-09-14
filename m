Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFED5B89B4
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 16:02:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31B5918D6;
	Wed, 14 Sep 2022 16:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31B5918D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663164135;
	bh=1ap74b2ShIK5B36wgT8k9kVTGGgttMUTr1hjPhiYPXU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c1A2d47k/+bG9O1W8PeC3H0Klk9F6RFcWvqrB+nYOkgwIkCkzpBs5q+oJW5Ugeyd4
	 BUaN8XiEhldnyzmXz824S+yF0koBtKq1j9aOh5PPPB8SmBsrJCm6e1TtkK4PcceuTf
	 TP7/Zebu8fZ3spIoryutyDL5pBDen9mOX1JJ9/2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3BE1F804E6;
	Wed, 14 Sep 2022 16:00:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DF77F804E6; Wed, 14 Sep 2022 16:00:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28931F8014B
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 16:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28931F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bEDmw7ak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663164045; x=1694700045;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1ap74b2ShIK5B36wgT8k9kVTGGgttMUTr1hjPhiYPXU=;
 b=bEDmw7akjGYiHm9mADQj+2l9xeOyyqAxdphrjwEWjzcIPcMML0jalz5k
 5DCcBeiaSufm7Z4fm2fVpEuB3unxamrOooT8jjR7XJjvI0ev/gK+y/89C
 UtsxFLsKAWgW9vj5uY8K9aahvnMFebxL2iKKO4u5OQ6obXUlfUugL8jGf
 mDesfUvutERGbBy0f59Vk0wlYjBDnuvfWJ7hr9k+2CZDCzYmFEyR0yWIl
 8n74EsNO2f/eQ6JtpaFoQ9sb4GDb2TmXUAKJ2dfkSINx/mq8DEGWbXdyR
 Ova/vcJ2OWZIVqZG4vsR+LmzOd44g93IJfOsaNhe43QtwnDkiTK+6o8+K w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="362397075"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="362397075"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 07:00:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="705968826"
Received: from blaesing-mobl.ger.corp.intel.com (HELO [10.249.45.209])
 ([10.249.45.209])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 07:00:41 -0700
Message-ID: <3b51ec11-772c-3263-46f8-a32ccd4b89b9@linux.intel.com>
Date: Wed, 14 Sep 2022 15:58:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v3 5/5] soundwire: bus: Don't exit early if no device IDs
 were programmed
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20220914120949.747951-1-rf@opensource.cirrus.com>
 <20220914120949.747951-6-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220914120949.747951-6-rf@opensource.cirrus.com>
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



On 9/14/22 14:09, Richard Fitzgerald wrote:
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

Nice work, thanks Richard

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> ---
>  drivers/soundwire/bus.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 6e569a875a9b..8eded1a55227 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -729,7 +729,7 @@ void sdw_extract_slave_id(struct sdw_bus *bus,
>  }
>  EXPORT_SYMBOL(sdw_extract_slave_id);
>  
> -static int sdw_program_device_num(struct sdw_bus *bus)
> +static int sdw_program_device_num(struct sdw_bus *bus, bool *programmed)
>  {
>  	u8 buf[SDW_NUM_DEV_ID_REGISTERS] = {0};
>  	struct sdw_slave *slave, *_s;
> @@ -739,6 +739,8 @@ static int sdw_program_device_num(struct sdw_bus *bus)
>  	int count = 0, ret;
>  	u64 addr;
>  
> +	*programmed = false;
> +
>  	/* No Slave, so use raw xfer api */
>  	ret = sdw_fill_msg(&msg, NULL, SDW_SCP_DEVID_0,
>  			   SDW_NUM_DEV_ID_REGISTERS, 0, SDW_MSG_FLAG_READ, buf);
> @@ -797,6 +799,8 @@ static int sdw_program_device_num(struct sdw_bus *bus)
>  					return ret;
>  				}
>  
> +				*programmed = true;
> +
>  				break;
>  			}
>  		}
> @@ -1756,7 +1760,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
>  {
>  	enum sdw_slave_status prev_status;
>  	struct sdw_slave *slave;
> -	bool attached_initializing;
> +	bool attached_initializing, id_programmed;
>  	int i, ret = 0;
>  
>  	/* first check if any Slaves fell off the bus */
> @@ -1787,14 +1791,23 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
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
> +		 * This relies on those devices reporting ATTACHED, which will
> +		 * trigger another call to this function. This will only
> +		 * happen if at least one device ID was programmed.
> +		 * Error returns from sdw_program_device_num() are currently
> +		 * ignored because there's no useful recovery that can be done.
> +		 * Returning the error here could result in the current status
> +		 * of other devices not being handled, because if no device IDs
> +		 * were programmed there's nothing to guarantee a status change
> +		 * to trigger another call to this function.
>  		 */
> -		return ret;
> +		sdw_program_device_num(bus, &id_programmed);
> +		if (id_programmed)
> +			return 0;
>  	}
>  
>  	/* Continue to check other slave statuses */
