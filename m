Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D3F63F942
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 21:39:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0284A17A3;
	Thu,  1 Dec 2022 21:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0284A17A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669927176;
	bh=FTyZ93Sc1W4VIQsNHMxgJlH0sdHFINQo9kc6bxOlM0w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MLh1+C19amhZC75+r8dSS0RW+RWjUwMpiCD8eQDJJX21svBKHB8PLlNvoRY9ftO42
	 P+F14cWdonUE+5mu4/PAybwncd5m1SbakCQKXLRvv9Y5+eZYp3Vp564JZQf27C0aiM
	 DfVp4HGt4n204Qd1t2sPLSPnKQWWmk8OQaIZxpRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90EB5F80519;
	Thu,  1 Dec 2022 21:38:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB4F8F804ED; Thu,  1 Dec 2022 21:38:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AB8BF80118
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 21:38:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AB8BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PQRs0yuo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669927112; x=1701463112;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FTyZ93Sc1W4VIQsNHMxgJlH0sdHFINQo9kc6bxOlM0w=;
 b=PQRs0yuo/JUfmjWzUUEzURvczE3cFcJKBE3TZSSZ6HhhZeYD+hgb+hq4
 yViJJZ6ozICEnHNh7cyGJhlMthseWbIXzs5TV4lNZ9gL/EDStZVn1YWxg
 1JBTsi18ix/KgemGg0D3dUIC6G7YykFurCFTWqg8fd7O247pS+XphN92E
 MJ3qKqW57thhNcrQGS1aie1+VQUOjjwa5T5+rlbt1aBv7biViHQYdYoB3
 /Y/fQWp7O0PN/EFgO5qN/EVG4wAfLG7x9/dLmuviF6/QaN+dit1CVJz+O
 guB1nihfWsyH3GWgzcR3/nM16SvIcTVmUIhI2B8wu5jhxdTo0QiQuWMii g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="314498387"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="314498387"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 12:38:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="644781664"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="644781664"
Received: from twcarol-mobl.amr.corp.intel.com (HELO [10.212.10.40])
 ([10.212.10.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 12:38:06 -0800
Message-ID: <0f0fa03a-b7aa-6cdb-38b8-a09bf03f9efd@linux.intel.com>
Date: Thu, 1 Dec 2022 12:20:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] soundwire: cadence: Drain the RX FIFO after an IO
 timeout
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org
References: <20221201134845.4055907-1-rf@opensource.cirrus.com>
 <20221201134845.4055907-4-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221201134845.4055907-4-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com
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



On 12/1/22 07:48, Richard Fitzgerald wrote:
> If wait_for_completion_timeout() times-out in _cdns_xfer_msg() it
> is possible that something could have been written to the RX FIFO.
> In this case, we should drain the RX FIFO so that anything in it
> doesn't carry over and mess up the next transfer.
> 
> Obviously, if we got to this state something went wrong, and we
> don't really know the state of everything. The cleanup in this
> situation cannot be bullet-proof but we should attempt to avoid
> breaking future transaction, if only to reduce the amount of
> error noise when debugging the failure from a kernel log.
> 
> Note that this patch only implements the draining for blocking
> (non-deferred) transfers. The deferred API doesn't have any proper
> handling of error conditions and would need some re-design before
> implementing cleanup. That is a task for a separate patch...

It's nearly impossible to deal with error conditions with deferred
transfers, specifically in the case where deferred transfers deal with
bank switches to synchronize changes across multiple links. The NAK is
visible only in the scope of a link, and it could happen that a bank
switch happens on one link and not the other. We don't have any means to
recover at this point.

That said, draining the FIFO on timeouts for regular commands is a good
idea - or it cannot hurt, so

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  drivers/soundwire/cadence_master.c | 48 ++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 95c84d9f0775..6bffecf3d61a 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -555,6 +555,28 @@ cdns_fill_msg_resp(struct sdw_cdns *cdns,
>  	return SDW_CMD_OK;
>  }
>  
> +static void cdns_read_response(struct sdw_cdns *cdns)
> +{
> +	u32 num_resp, cmd_base;
> +	int i;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(cdns->response_buf) < CDNS_MCP_CMD_LEN);
> +
> +	num_resp = cdns_readl(cdns, CDNS_MCP_FIFOSTAT);
> +	num_resp &= CDNS_MCP_RX_FIFO_AVAIL;
> +	if (num_resp > ARRAY_SIZE(cdns->response_buf)) {
> +		dev_warn(cdns->dev, "RX AVAIL %d too long\n", num_resp);
> +		num_resp = CDNS_MCP_CMD_LEN;
> +	}
> +
> +	cmd_base = CDNS_MCP_CMD_BASE;
> +
> +	for (i = 0; i < num_resp; i++) {
> +		cdns->response_buf[i] = cdns_readl(cdns, cmd_base);
> +		cmd_base += CDNS_MCP_CMD_WORD_LEN;
> +	}
> +}
> +
>  static enum sdw_command_response
>  _cdns_xfer_msg(struct sdw_cdns *cdns, struct sdw_msg *msg, int cmd,
>  	       int offset, int count, bool defer)
> @@ -596,6 +618,10 @@ _cdns_xfer_msg(struct sdw_cdns *cdns, struct sdw_msg *msg, int cmd,
>  		dev_err(cdns->dev, "IO transfer timed out, cmd %d device %d addr %x len %d\n",
>  			cmd, msg->dev_num, msg->addr, msg->len);
>  		msg->len = 0;
> +
> +		/* Drain anything in the RX_FIFO */
> +		cdns_read_response(cdns);
> +
>  		return SDW_CMD_TIMEOUT;
>  	}
>  
> @@ -769,28 +795,6 @@ EXPORT_SYMBOL(cdns_read_ping_status);
>   * IRQ handling
>   */
>  
> -static void cdns_read_response(struct sdw_cdns *cdns)
> -{
> -	u32 num_resp, cmd_base;
> -	int i;
> -
> -	BUILD_BUG_ON(ARRAY_SIZE(cdns->response_buf) < CDNS_MCP_CMD_LEN);
> -
> -	num_resp = cdns_readl(cdns, CDNS_MCP_FIFOSTAT);
> -	num_resp &= CDNS_MCP_RX_FIFO_AVAIL;
> -	if (num_resp > ARRAY_SIZE(cdns->response_buf)) {
> -		dev_warn(cdns->dev, "RX AVAIL %d too long\n", num_resp);
> -		num_resp = CDNS_MCP_CMD_LEN;
> -	}
> -
> -	cmd_base = CDNS_MCP_CMD_BASE;
> -
> -	for (i = 0; i < num_resp; i++) {
> -		cdns->response_buf[i] = cdns_readl(cdns, cmd_base);
> -		cmd_base += CDNS_MCP_CMD_WORD_LEN;
> -	}
> -}
> -
>  static int cdns_update_slave_status(struct sdw_cdns *cdns,
>  				    u64 slave_intstat)
>  {
