Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9CA7F6FB
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 14:39:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A43F1713;
	Fri,  2 Aug 2019 14:38:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A43F1713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564749544;
	bh=tgTMXOlfzF3ribhTnShk9oBgNP0LDQ0coG30Hl3f948=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NHspetCV+EJbEWi04WnUoAiDuqj94NxI2k7M5ZURkhq8GUz2SjnQyAxfWijcv/Mse
	 7Sr7lK3HsoUM41qVfdB7Jd8PSjBUJx5Merj8bJ8ymTsBOepRspxG87VbtLzpGlw95q
	 SXr2HBOyreh+h67S0kylTnutE9nP6RcXOmeIy1oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1086F804CB;
	Fri,  2 Aug 2019 14:36:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A3F6F804CA; Fri,  2 Aug 2019 14:36:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A9BDF8048E
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 14:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A9BDF8048E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BekoZ6qt"
Received: from localhost (unknown [122.167.106.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8BC32184B;
 Fri,  2 Aug 2019 12:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564748476;
 bh=SQAMv/GjRtBugvtxOJvDkEzBbx5en47q4GkvzPSXWfA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BekoZ6qtwpJXcE8GkxJd8wDRfQ56P5nTr4BJmBMzke7A8zAcU5VhQjNje/C4YtZ6c
 Fkcd3MFuAxUnTC0pfqp6TjQ3WD8OA8jNLs1JIOu33/eY4KnoJhxejAPG0HgtNXJ0v4
 +/l2hUDYGTOsVbLu6Tkc2xyL43SxP8dbIT6kKs6k=
Date: Fri, 2 Aug 2019 17:50:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190802122003.GQ12733@vkoul-mobl.Dlink>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-16-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-16-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
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

On 25-07-19, 18:40, Pierre-Louis Bossart wrote:
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
> +
> +			switch (val & 0x3) {
> +			case 0:

why not case CDNS_MCP_SLAVE_INTSTAT_NPRESENT:

> +				status[i] = SDW_SLAVE_UNATTACHED;
> +				break;
> +			case 1:
> +				status[i] = SDW_SLAVE_ATTACHED;
> +				break;
> +			case 2:
> +				status[i] = SDW_SLAVE_ALERT;
> +				break;
> +			default:
> +				status[i] = SDW_SLAVE_RESERVED;
> +				break;
> +			}

we have same logic in the code block preceding this, maybe good idea to
write a helper and use for both

Also IIRC we can have multiple status set right?

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
