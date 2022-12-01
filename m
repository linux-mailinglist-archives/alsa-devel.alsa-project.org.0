Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D245063F947
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 21:40:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC8BA17DB;
	Thu,  1 Dec 2022 21:39:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC8BA17DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669927227;
	bh=38oa5iNj8+pu7Dm8hMinaLo5Pj+hXioLhzHtZupPIes=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W2O4MvFhKP2GJSHiXmhaVG9g2WySeTH5jH+zWIXil477soZXmobi0poLovTLihjp2
	 decTVmvqF4/ZM4XX1d+q2YlY5Qhqmt9VINS6p8tS7KwbOCmO88GP1kUaXmh3s1lEI0
	 gOI8Th+86K7BOI4Cpo/mNopxRfKDYsgm4rRy2fQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90D43F8055C;
	Thu,  1 Dec 2022 21:38:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DB11F8055C; Thu,  1 Dec 2022 21:38:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56C77F804B1
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 21:38:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56C77F804B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="B+EiFnyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669927116; x=1701463116;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=38oa5iNj8+pu7Dm8hMinaLo5Pj+hXioLhzHtZupPIes=;
 b=B+EiFnyVGifwIdiNRZM8FVPA5k67LBfamrBpTwvrQ/RIXK/WGihUf9MB
 T7b1pFvEauDmrcP0q895C5I4BKfoVx8MbgKULRDI4O7HShJbYLFs7bSZV
 CG+VZOz2JjfS4BPUfV6+k9uubRiboHDDQv/79QKvCBQItI1asMxgEEU0s
 WGrUzwg7yS3bThey1vz1MgpTvt2hW2g1bcSNdydHmrTtmyNeyViOyymlx
 Y1bMxl+JnGRZs601NbxbyO2LScHzyLsimwBdjEAXi5sdX+x9PiDx00nwp
 CmE/VGzs8iRZs/26h/zXcedC0GWXsEG083vjSdr1qEvTbO6YEKteyC263 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="314498378"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="314498378"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 12:38:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="644781661"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="644781661"
Received: from twcarol-mobl.amr.corp.intel.com (HELO [10.212.10.40])
 ([10.212.10.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 12:38:04 -0800
Message-ID: <cdc6b2ea-d20d-0e2e-0791-faf8f0994c78@linux.intel.com>
Date: Thu, 1 Dec 2022 12:12:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] soundwire: cadence: Remove wasted space in
 response_buf
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org
References: <20221201134845.4055907-1-rf@opensource.cirrus.com>
 <20221201134845.4055907-3-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221201134845.4055907-3-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com, alsa-devel@alsa-project.org,
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



On 12/1/22 07:48, Richard Fitzgerald wrote:
> The response_buf was declared much larger (128 entries) than the number
> of responses that could ever be written into it (maximum 8).

Indeed I don't know why we used 128 entries. This is a magic value that
doesn't appear in any specs I've looked at.

Note that there's 'sniffer' mode when each response takes two
consecutive 32-words in the FIFO. we've never used this mode though so
it's not really an issue.

It's also possible that this is related to the automatic command retry,
where a failed command can be re-issued 15 times. However in that case
the worst case would be 32 commands * 15 = 480. The value of 128 makes
no sense at all, unless it was an upper bound for 8 * 15. We don't use
this hardware retry btw.

See more below...

> Reduce response_buf to 8 entries and add checking in cdns_read_response()
> to prevent overflowing reponse_buf if CDNS_MCP_RX_FIFO_AVAIL contains
> an unexpectedly large number.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  drivers/soundwire/cadence_master.c | 6 ++++++
>  drivers/soundwire/cadence_master.h | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 27699f341f2c..95c84d9f0775 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -774,8 +774,14 @@ static void cdns_read_response(struct sdw_cdns *cdns)
>  	u32 num_resp, cmd_base;
>  	int i;
>  
> +	BUILD_BUG_ON(ARRAY_SIZE(cdns->response_buf) < CDNS_MCP_CMD_LEN);
> +
>  	num_resp = cdns_readl(cdns, CDNS_MCP_FIFOSTAT);
>  	num_resp &= CDNS_MCP_RX_FIFO_AVAIL;
> +	if (num_resp > ARRAY_SIZE(cdns->response_buf)) {
> +		dev_warn(cdns->dev, "RX AVAIL %d too long\n", num_resp);
> +		num_resp = CDNS_MCP_CMD_LEN;

.... this is different from what the hardware documentation tells me.
The range of values to RX_FIFO_AVAIL is 0..RX_FIFO_DEPTH + 2.

I don't understand the +2, but we should maybe be more cautious and use
u32 response_buf[CDNS_MCP_CMD_LEN + 2];

> +	}
>  
>  	cmd_base = CDNS_MCP_CMD_BASE;
>  
> diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
> index 0434d70d4b1f..c2d817e8e22a 100644
> --- a/drivers/soundwire/cadence_master.h
> +++ b/drivers/soundwire/cadence_master.h
> @@ -117,7 +117,7 @@ struct sdw_cdns {
>  	struct sdw_bus bus;
>  	unsigned int instance;
>  
> -	u32 response_buf[0x80];
> +	u32 response_buf[8];
>  	struct completion tx_complete;
>  	struct sdw_defer *defer;
>  
