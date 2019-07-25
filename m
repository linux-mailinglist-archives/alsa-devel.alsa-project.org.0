Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 788AB75F6E
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 09:03:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E22BF1FCA;
	Fri, 26 Jul 2019 09:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E22BF1FCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564124631;
	bh=xwhHH3vbkXFvYuX2AWmUk8xKizZBcwgxM4ZeQ9lRSLA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fARnz3+Y53lpsJHPz1MJZw3tmevMI0NZschnx4+mWtSWYqvW3S0A2a4XTEyhKQTW0
	 Ton5FNkX7YJXn2ZHHV5eU0a4BEXn/UwGPGurmnq4EcDDSLiQRlVoggfVZ+s0di+Fsr
	 M8F46Ns2rSZSpDxB4xaCjGz/puXMynbzAXUnaYP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F36DAF80393;
	Fri, 26 Jul 2019 09:02:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2583BF80393; Fri, 26 Jul 2019 09:02:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 512F6F801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 09:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 512F6F801A4
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 00:01:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,309,1559545200"; d="scan'208";a="170537755"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.35.244])
 by fmsmga008.fm.intel.com with ESMTP; 26 Jul 2019 00:01:55 -0700
Date: Fri, 26 Jul 2019 00:31:01 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190725223100.GC16003@ubuntu>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-16-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-16-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 15/40] soundwire: cadence_master:
 handle multiple status reports per Slave
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jul 25, 2019 at 06:40:07PM -0500, Pierre-Louis Bossart wrote:
> When a Slave reports multiple status in the sticky bits, find the
> latest configuration from the mirror of the PING frame status and
> update the status directly.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/cadence_master.c | 34 ++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 889fa2cd49ae..25d5c7267c15 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -643,13 +643,35 @@ static int cdns_update_slave_status(struct sdw_cdns *cdns,
>  
>  		/* first check if Slave reported multiple status */
>  		if (set_status > 1) {
> +			u32 val;
> +
>  			dev_warn_ratelimited(cdns->dev,
> -					     "Slave reported multiple Status: %d\n",
> -					     mask);
> -			/*
> -			 * TODO: we need to reread the status here by
> -			 * issuing a PING cmd
> -			 */
> +					     "Slave %d reported multiple Status: %d\n",
> +					     i, mask);
> +
> +			/* re-check latest status extracted from PING commands */
> +			val = cdns_readl(cdns, CDNS_MCP_SLAVE_STAT);
> +			val >>= (i * 2);

Superfluous parentheses.

> +
> +			switch (val & 0x3) {
> +			case 0:
> +				status[i] = SDW_SLAVE_UNATTACHED;
> +				break;
> +			case 1:
> +				status[i] = SDW_SLAVE_ATTACHED;
> +				break;
> +			case 2:
> +				status[i] = SDW_SLAVE_ALERT;
> +				break;
> +			default:

There aren't many values left for the "default" case :-) But I'm not sure whether
any of

+			case 3:

or

+			case 3:
+			default:

would improve readability.

Thanks
Guennadi

> +				status[i] = SDW_SLAVE_RESERVED;
> +				break;
> +			}
> +
> +			dev_warn_ratelimited(cdns->dev,
> +					     "Slave %d status updated to %d\n",
> +					     i, status[i]);
> +
>  		}
>  	}
>  
> -- 
> 2.20.1
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
