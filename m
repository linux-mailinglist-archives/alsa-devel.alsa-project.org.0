Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ECF5A13E0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 16:38:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B94EC15F2;
	Thu, 25 Aug 2022 16:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B94EC15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661438322;
	bh=zznJNH66kRKwzyH876Dafr0smyRfF2XcR8259YbV6MU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kxhMJ5IScnUKyKfgkmG9PHB33wkyFk7h7k4j5/iKw6nuAs5XlIGvbnSb+yXbrhuHS
	 MD1ibtDl+5sh275GX6S0OKwfcMKEi68O+cIs6w3pDUA/gQ75Hw0nhtnFMQdt/J2SC5
	 bkPCLLIXaC1Oj9HVpQHWYZUG8/+dzasmWSYYe1yM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CAB1F80535;
	Thu, 25 Aug 2022 16:37:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C47DEF80526; Thu, 25 Aug 2022 16:37:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18959F800C8
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 16:36:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18959F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ea8bpcF7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661438215; x=1692974215;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zznJNH66kRKwzyH876Dafr0smyRfF2XcR8259YbV6MU=;
 b=Ea8bpcF74Iy6QgSj4E9woWQD4TvUtOLv7ApayrIxOoPO9VjzlzKtjlw0
 vvjSZrs+AVjlw5Vh3bhq7vGtSYF/RTTPbEg2Jcwf8cKsQKhKG/PQxbzEE
 Vss+U9pVth3XPaUUD3n4GhiO9whMUcN2PPRwdpv41m/YkWouFsN8ZH9OT
 4cXym2qSeg89U/iQ53TdDM8trCOPrLaUzMm78b50B+u+AUb7MNUaNqAw+
 ncoLcLMq5Hs6d4sQD6+Xedm0Am1yArO0KawRaMQIfBjGlaEoaSE5AR5pF
 YhOm+JS86dQMJKewJcOCad9S3EIi7eAdkj2HMAv7G5LkWMWQaKpIb33j1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="320332747"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="320332747"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 07:36:53 -0700
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="938346409"
Received: from alanjaco-mobl3.gar.corp.intel.com (HELO [10.252.44.53])
 ([10.252.44.53])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 07:36:51 -0700
Message-ID: <adfdf06a-e1a3-e47c-a71f-5e5dccef6fd0@linux.intel.com>
Date: Thu, 25 Aug 2022 16:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] soundwire: bus: Fix lost UNATTACH when re-enumerating
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20220825122241.273090-1-rf@opensource.cirrus.com>
 <20220825122241.273090-4-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220825122241.273090-4-rf@opensource.cirrus.com>
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

Humm, I am struggling a bit more on this patch.

On 8/25/22 14:22, Richard Fitzgerald wrote:
> Rearrange sdw_handle_slave_status() so that any peripherals
> on device #0 that are given a device ID are reported as
> unattached. The ensures that UNATTACH status is not lost.
> 
> Handle unenumerated devices first and update the
> sdw_slave_status array to indicate IDs that must have become
> UNATTACHED.
> 
> Look for UNATTACHED devices after this so we can pick up
> peripherals that were UNATTACHED in the original PING status
> and those that were still ATTACHED at the time of the PING but
> then reverted to unenumerated and were found by
> sdw_program_device_num().

Are those two cases really lost completely? It's a bit surprising, I do
recall that we added a recheck on the status, see the 'update_status'
label in cdns_update_slave_status_work

> As sdw_update_slave_status() is always processing a snapshot of
> a PING from some time in the past, it is possible that the status
> is changing while sdw_update_slave_status() is running.
> 
> A peripheral could report attached in the PING, but detach and
> revert to device #0 and then be found in the loop in
> sdw_program_device_num(). Previously the code would not have
> updated slave->status to UNATTACHED because there was never a
> PING with that status. If the slave->status is not updated to
> UNATTACHED the next PING will report it as ATTACHED, but its
> slave->status is already ATTACHED so the re-attach will not be
> properly handled.
The idea of detecting first devices that become unattached - and later
deal with device0 when they re-attach - was based on the fact that
synchronization takes time. The absolute minimum is 16 frames per the
SoundWire spec.

I don't see how testing for the status[0] first in
sdw_handle_slave_status() helps, the value is taken at the same time as
status[1..11]. If you really want to take the last information, we
should re-read the status from a new PING frame.


> This situations happens fairly frequently with multiple
> peripherals on a bus that are intentionally reset (for example
> after downloading firmware).
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  drivers/soundwire/bus.c | 39 ++++++++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index bb8ce26c68b3..1212148ac251 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -718,7 +718,8 @@ void sdw_extract_slave_id(struct sdw_bus *bus,
>  }
>  EXPORT_SYMBOL(sdw_extract_slave_id);
>  
> -static int sdw_program_device_num(struct sdw_bus *bus)
> +static int sdw_program_device_num(struct sdw_bus *bus,
> +				  enum sdw_slave_status status[])
>  {
>  	u8 buf[SDW_NUM_DEV_ID_REGISTERS] = {0};
>  	struct sdw_slave *slave, *_s;
> @@ -776,6 +777,12 @@ static int sdw_program_device_num(struct sdw_bus *bus)
>  					return ret;
>  				}
>  
> +				/*
> +				 * It could have dropped off the bus since the
> +				 * PING response so update the status array.
> +				 */
> +				status[slave->dev_num] = SDW_SLAVE_UNATTACHED;
> +
>  				break;
>  			}
>  		}
> @@ -1735,10 +1742,21 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
>  {
>  	enum sdw_slave_status prev_status;
>  	struct sdw_slave *slave;
> +	bool programmed_dev_num = false;
>  	bool attached_initializing;
>  	int i, ret = 0;
>  
> -	/* first check if any Slaves fell off the bus */
> +	/* Handle any unenumerated peripherals */
> +	if (status[0] == SDW_SLAVE_ATTACHED) {
> +		dev_dbg(bus->dev, "Slave attached, programming device number\n");
> +		ret = sdw_program_device_num(bus, status);
> +		if (ret < 0)
> +			dev_warn(bus->dev, "Slave attach failed: %d\n", ret);
> +
> +		programmed_dev_num = true;
> +	}
> +
> +	/* Check if any fell off the bus */
>  	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
>  		mutex_lock(&bus->bus_lock);
>  		if (test_bit(i, bus->assigned) == false) {
> @@ -1764,17 +1782,12 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
>  		}
>  	}
>  
> -	if (status[0] == SDW_SLAVE_ATTACHED) {
> -		dev_dbg(bus->dev, "Slave attached, programming device number\n");
> -		ret = sdw_program_device_num(bus);
> -		if (ret < 0)
> -			dev_err(bus->dev, "Slave attach failed: %d\n", ret);
> -		/*
> -		 * programming a device number will have side effects,
> -		 * so we deal with other devices at a later time
> -		 */
> -		return ret;
> -	}
> +	/*
> +	 * programming a device number will have side effects,
> +	 * so we deal with other devices at a later time
> +	 */
> +	if (programmed_dev_num)
> +		return 0;
>  
>  	/* Continue to check other slave statuses */
>  	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
