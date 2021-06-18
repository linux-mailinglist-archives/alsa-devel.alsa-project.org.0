Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 745933ACF04
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 17:30:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E429C172B;
	Fri, 18 Jun 2021 17:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E429C172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624030215;
	bh=t1ZcmXEZcCVCD2E8BIMuWOM9eMqyZMv93I+tSmTPZpg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mDEl/8avkhivVngQmFu/bZG5a3WesNVXM9mvZqAvzJsl3H3T3H5b/Kk9+eYNwcxoJ
	 VOPhKUzKOhsJDlm3L4rpLBJMgs5kKmJkQa+QNOmwizuZklHxUyeRXnB6HBQTWdQQGi
	 v0/JfLCIBJuhMCbgEdiAz2GCe8HgcUNQXgbgxXvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AE37F80424;
	Fri, 18 Jun 2021 17:28:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73EF8F8032D; Fri, 18 Jun 2021 17:28:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76D52F80084
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 17:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76D52F80084
IronPort-SDR: 1ATMaCGtUwVPkm7o8++/F3m3aJy4gMjUcpuiV3PSYY0tEPhbmhoI+59GFF0q80b3Yz9fAwcBCK
 aTGolvKWrVqA==
X-IronPort-AV: E=McAfee;i="6200,9189,10019"; a="193701290"
X-IronPort-AV: E=Sophos;i="5.83,284,1616482800"; d="scan'208";a="193701290"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 08:28:16 -0700
IronPort-SDR: tXz/DeiAVks+cDsEly+zSEIB1Rr8PgbebPoxlYQ+o2gY45Akxd/kzS6WUq6dDl72DHPx7qRD+o
 eKKwL/3yJGyg==
X-IronPort-AV: E=Sophos;i="5.83,284,1616482800"; d="scan'208";a="622422622"
Received: from myshevts-mobl.ccr.corp.intel.com (HELO [10.209.154.63])
 ([10.209.154.63])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 08:28:15 -0700
Subject: Re: [PATCH] soundwire: stream: Fix test for DP prepare complete
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20210618144745.30629-1-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a401be25-8ab6-4d28-3a87-10860ca1102d@linux.intel.com>
Date: Fri, 18 Jun 2021 10:28:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210618144745.30629-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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



On 6/18/21 9:47 AM, Richard Fitzgerald wrote:
> In sdw_prep_deprep_slave_ports(), after the wait_for_completion()
> the DP prepare status register is read. If this indicates that the
> port is now prepared, the code should continue with the port setup.
> It is irrelevant whether the wait_for_completion() timed out if the
> port is now ready.
> 
> The previous implementation would always fail if the
> wait_for_completion() timed out, even if the port was reporting
> successful prepare.
> 
> This patch also fixes a minor bug where the return from sdw_read()
> was not checked for error - any error code with LSBits clear could
> be misinterpreted as a successful port prepare.
> 
> Fixes: 79df15b7d37c ("soundwire: Add helpers for ports operations")
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Looks good to me

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/stream.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 1eaedaaba094..1a18308f4ef4 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -422,7 +422,6 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
>  	struct completion *port_ready;
>  	struct sdw_dpn_prop *dpn_prop;
>  	struct sdw_prepare_ch prep_ch;
> -	unsigned int time_left;
>  	bool intr = false;
>  	int ret = 0, val;
>  	u32 addr;
> @@ -479,15 +478,15 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
>  
>  		/* Wait for completion on port ready */
>  		port_ready = &s_rt->slave->port_ready[prep_ch.num];
> -		time_left = wait_for_completion_timeout(port_ready,
> -				msecs_to_jiffies(dpn_prop->ch_prep_timeout));
> +		wait_for_completion_timeout(port_ready,
> +			msecs_to_jiffies(dpn_prop->ch_prep_timeout));
>  
>  		val = sdw_read(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
> -		val &= p_rt->ch_mask;
> -		if (!time_left || val) {
> +		if ((val < 0) || (val & p_rt->ch_mask)) {
> +			ret = (val < 0) ? val : -ETIMEDOUT;
>  			dev_err(&s_rt->slave->dev,
> -				"Chn prep failed for port:%d\n", prep_ch.num);
> -			return -ETIMEDOUT;
> +				"Chn prep failed for port %d: %d\n", prep_ch.num, ret);
> +			return ret;
>  		}
>  	}
>  
> 
