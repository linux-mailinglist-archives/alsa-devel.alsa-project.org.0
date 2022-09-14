Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C465B89B0
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 16:01:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC3C818D4;
	Wed, 14 Sep 2022 16:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC3C818D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663164107;
	bh=t+vOnRYtTomPQlSR9thGxJNK0sEIELERgU5vaK6Jg1U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hor/kKH44XAW9SQFKJqN6/gWDCZBJq9ng6paLuLgVgBqk2i2Ia3FARtHTa0wcehE1
	 9IalbxJWApMFTP8VGhByaeuu7XXSZEhLesSeaiJi+sHdJffErl5S40RlaYU9RIoYm0
	 2xD4qpYnaNTPZ2ivtfdD5qrjgiOLucefhWNHIsZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F063DF800C0;
	Wed, 14 Sep 2022 16:00:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3CD3F8016E; Wed, 14 Sep 2022 16:00:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 219C8F800C0
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 16:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 219C8F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="i9DduA4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663164043; x=1694700043;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=t+vOnRYtTomPQlSR9thGxJNK0sEIELERgU5vaK6Jg1U=;
 b=i9DduA4SW4pIY3WQv6EW58YwCPZiY0etAZnm1lc0J+G7MZDDf4dmReIE
 EetNu+w/0TiuQoTedqV4FrJ4Oib/LbFo5ediOeCkv3cjStsoVQVe7OVvn
 3LYAj1tne+ocJY4EdcU0EueMpqLdcD9XogPHO8L9sJboGqd36K3d836in
 zHraCvBAwNbvWNwX56We/v85eKGO+LbuqfyTPw4FBbf2zZfFYioRmdaHG
 miDv/T/GOoH485anbUNLyck+PiR8So+jOrqp8YJyElHP9FS1Rg/m7fiFd
 TGjSDWazrlknzOuWmtPWtT+Wsm8YBkGBRUJCh3JgQfNZsX/qG5JivCuAo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="362397051"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="362397051"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 07:00:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="705968788"
Received: from blaesing-mobl.ger.corp.intel.com (HELO [10.249.45.209])
 ([10.249.45.209])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 07:00:36 -0700
Message-ID: <1b506127-f992-b554-e984-589dc46aa110@linux.intel.com>
Date: Wed, 14 Sep 2022 15:48:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/5] soundwire: cadence: Fix lost ATTACHED interrupts
 when enumerating
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20220914120949.747951-1-rf@opensource.cirrus.com>
 <20220914120949.747951-5-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220914120949.747951-5-rf@opensource.cirrus.com>
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


> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 245191d22ccd..2f131604d884 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -954,9 +954,22 @@ static void cdns_update_slave_status_work(struct work_struct *work)
>  	u32 device0_status;
>  	int retry_count = 0;
>  
> +	/*
> +	 * Clear main interrupt first so we don't lose any assertions
> +	 * the happen during this function.

typo: that happen?

The flow looks good to me otherwise, so

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> +	 */
> +	cdns_writel(cdns, CDNS_MCP_INTSTAT, CDNS_MCP_INT_SLAVE_MASK);
> +
>  	slave0 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT0);
>  	slave1 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT1);
>  
> +	/*
> +	 * Clear the bits before handling so we don't lose any
> +	 * bits that re-assert.
> +	 */
> +	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT0, slave0);
> +	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT1, slave1);
> +
>  	/* combine the two status */
>  	slave_intstat = ((u64)slave1 << 32) | slave0;
>  
> @@ -964,8 +977,6 @@ static void cdns_update_slave_status_work(struct work_struct *work)
>  
>  update_status:
>  	cdns_update_slave_status(cdns, slave_intstat);
> -	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT0, slave0);
> -	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT1, slave1);
>  
>  	/*
>  	 * When there is more than one peripheral per link, it's
> @@ -982,6 +993,11 @@ static void cdns_update_slave_status_work(struct work_struct *work)
>  	 * attention with PING commands. There is no need to check for
>  	 * ALERTS since they are not allowed until a non-zero
>  	 * device_number is assigned.
> +	 *
> +	 * Do not clear the INTSTAT0/1. While looping to enumerate devices on
> +	 * #0 there could be status changes on other devices - these must
> +	 * be kept in the INTSTAT so they can be handled when all #0 devices
> +	 * have been handled.
>  	 */
>  
>  	device0_status = cdns_readl(cdns, CDNS_MCP_SLAVE_STAT);
> @@ -1001,8 +1017,7 @@ static void cdns_update_slave_status_work(struct work_struct *work)
>  		}
>  	}
>  
> -	/* clear and unmask Slave interrupt now */
> -	cdns_writel(cdns, CDNS_MCP_INTSTAT, CDNS_MCP_INT_SLAVE_MASK);
> +	/* unmask Slave interrupt now */
>  	cdns_updatel(cdns, CDNS_MCP_INTMASK,
>  		     CDNS_MCP_INT_SLAVE_MASK, CDNS_MCP_INT_SLAVE_MASK);
>  
