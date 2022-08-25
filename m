Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D28AA5A13DA
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 16:38:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F93F1607;
	Thu, 25 Aug 2022 16:37:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F93F1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661438306;
	bh=FX56wPbxvlPQDR1VixvQrXRAEpdXq95WO2h2og6T3Ts=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BwgVClTSqQn6Q7auN/Xq8tCB1lIf8frczDcVpHA4Twpp9VM5CFTYrXQTm6EMzyPne
	 Rkr+i3sJpPdh5SmLZTtpBMlGdckoJgZgLD9v/Hkj9fLSEDutSwoyhTc4ZSKa4X7xts
	 5WoJAteVGcuGbcc6PEbJd+EnltQLZfp/knSAZ8H8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AA28F80525;
	Thu, 25 Aug 2022 16:37:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4C92F80525; Thu, 25 Aug 2022 16:36:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E58DF80245
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 16:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E58DF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="c2SQqqHy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661438211; x=1692974211;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FX56wPbxvlPQDR1VixvQrXRAEpdXq95WO2h2og6T3Ts=;
 b=c2SQqqHym0E7tFsEjDo9yv4wX7PAoWXs/+7V+78llo4L54Nw4iygv95G
 1nZ0Kz3PlDwGx350J46RlMc/Mm3ejL/6uLPIvFJ0hnGiqMXub7FNTlGGW
 dhYNf6ZIDh2xwsn4ad+7c8DvW/046m5RG8DMk8vnOl4E2/LdnVwaFVPwn
 4OcQgZ11eZD9PrdvtkTvl6m14uvo8EVJhaHJTncrLRHyrjeVClPTP3oLp
 OfIoyFjOGs9q+b2d811iTcmYHFBCZarArkwYw77S4MaVEcjv9Qn0Xdzcb
 xBixS9QSWw10QEz9RWublgnn3yT6csWDQzb0b2RGfIBkDG8Nz/+ruJ6gj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="320332722"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="320332722"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 07:36:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="938346403"
Received: from alanjaco-mobl3.gar.corp.intel.com (HELO [10.252.44.53])
 ([10.252.44.53])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 07:36:47 -0700
Message-ID: <11eedecf-d119-da5d-a0cd-0db270b74825@linux.intel.com>
Date: Thu, 25 Aug 2022 14:57:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] soundwire: cadence: fix updating slave status when a
 bus has multiple peripherals
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20220825122241.273090-1-rf@opensource.cirrus.com>
 <20220825122241.273090-2-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220825122241.273090-2-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Simon Trimmer <simont@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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



On 8/25/22 14:22, Richard Fitzgerald wrote:
> From: Simon Trimmer <simont@opensource.cirrus.com>
> 
> The cadence IP explicitly reports slave status changes with bits for
> each possible change. The function cdns_update_slave_status() attempts
> to translate this into the current status of each of the slaves.
> 
> However when there are multiple peripherals on a bus any slave that did
> not have a status change when the work function ran would not have it's
> status updated - the array is initialised to a value that equates to
> UNATTACHED and this can cause spurious reports that slaves had dropped
> off the bus.
> 
> In the case where a slave has no status change or has multiple status
> changes the value from the last PING command is used.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Goodness, this is one bug fix.

We've been chasing such issues for a while with 2 amps on the same link

https://github.com/thesofproject/linux/issues/3638
https://github.com/thesofproject/linux/issues/3325

and also came up with the same conclusion that there were false reports
of UNATTACHED, and the conclusion was also to use the PING status directly.

see https://github.com/thesofproject/linux/pull/3786

I think this patch is much better than what I suggested, in that it
fixes the root cause for the false report instead of double-checking if
a device is truly UNATTACHED.

Nice work!

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> ---
>  drivers/soundwire/cadence_master.c | 63 +++++++++++++-----------------
>  1 file changed, 28 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 4fbb19557f5e..245191d22ccd 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -782,6 +782,7 @@ static int cdns_update_slave_status(struct sdw_cdns *cdns,
>  	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
>  	bool is_slave = false;
>  	u32 mask;
> +	u32 val;
>  	int i, set_status;
>  
>  	memset(status, 0, sizeof(status));
> @@ -789,41 +790,38 @@ static int cdns_update_slave_status(struct sdw_cdns *cdns,
>  	for (i = 0; i <= SDW_MAX_DEVICES; i++) {
>  		mask = (slave_intstat >> (i * CDNS_MCP_SLAVE_STATUS_NUM)) &
>  			CDNS_MCP_SLAVE_STATUS_BITS;
> -		if (!mask)
> -			continue;
>  
> -		is_slave = true;
>  		set_status = 0;
>  
> -		if (mask & CDNS_MCP_SLAVE_INTSTAT_RESERVED) {
> -			status[i] = SDW_SLAVE_RESERVED;
> -			set_status++;
> +		if (mask) {
> +			is_slave = true;
> +
> +			if (mask & CDNS_MCP_SLAVE_INTSTAT_RESERVED) {
> +				status[i] = SDW_SLAVE_RESERVED;
> +				set_status++;
> +			}
> +
> +			if (mask & CDNS_MCP_SLAVE_INTSTAT_ATTACHED) {
> +				status[i] = SDW_SLAVE_ATTACHED;
> +				set_status++;
> +			}
> +
> +			if (mask & CDNS_MCP_SLAVE_INTSTAT_ALERT) {
> +				status[i] = SDW_SLAVE_ALERT;
> +				set_status++;
> +			}
> +
> +			if (mask & CDNS_MCP_SLAVE_INTSTAT_NPRESENT) {
> +				status[i] = SDW_SLAVE_UNATTACHED;
> +				set_status++;
> +			}
>  		}
>  
> -		if (mask & CDNS_MCP_SLAVE_INTSTAT_ATTACHED) {
> -			status[i] = SDW_SLAVE_ATTACHED;
> -			set_status++;
> -		}
> -
> -		if (mask & CDNS_MCP_SLAVE_INTSTAT_ALERT) {
> -			status[i] = SDW_SLAVE_ALERT;
> -			set_status++;
> -		}
> -
> -		if (mask & CDNS_MCP_SLAVE_INTSTAT_NPRESENT) {
> -			status[i] = SDW_SLAVE_UNATTACHED;
> -			set_status++;
> -		}
> -
> -		/* first check if Slave reported multiple status */
> -		if (set_status > 1) {
> -			u32 val;
> -
> -			dev_warn_ratelimited(cdns->dev,
> -					     "Slave %d reported multiple Status: %d\n",
> -					     i, mask);
> -
> -			/* check latest status extracted from PING commands */
> +		/*
> +		 * check that there was a single reported Slave status and when
> +		 * there is not use the latest status extracted from PING commands
> +		 */
> +		if (set_status != 1) {
>  			val = cdns_readl(cdns, CDNS_MCP_SLAVE_STAT);
>  			val >>= (i * 2);
>  
> @@ -842,11 +840,6 @@ static int cdns_update_slave_status(struct sdw_cdns *cdns,
>  				status[i] = SDW_SLAVE_RESERVED;
>  				break;
>  			}
> -
> -			dev_warn_ratelimited(cdns->dev,
> -					     "Slave %d status updated to %d\n",
> -					     i, status[i]);
> -
>  		}
>  	}
>  
