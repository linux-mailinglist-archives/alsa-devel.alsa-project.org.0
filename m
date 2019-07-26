Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E952475CCA
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 04:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B98B1F72;
	Fri, 26 Jul 2019 04:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B98B1F72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564107237;
	bh=SywOp+t1t2W2wY3lU+wGIm7BS6poZkd7/iVM5k/Jqjw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QR05FwLIvVnisydgOucvM4WR10a081L4iVfw3UARcb0n36ZpBGmjGZaTZk0HY8uS5
	 G4CVBVO1US6/hM9ggGxKfkiR1x1y1bsPGxBxKK5MAHAi2HrPBF1KVp8l/G9abC9ofR
	 QGbFRIEc9phPMbx4eSaJvAAhhX35fSSn4G96wHNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 903B6F80393;
	Fri, 26 Jul 2019 04:12:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70865F80393; Fri, 26 Jul 2019 04:12:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F194F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 04:12:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F194F800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 19:12:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,308,1559545200"; d="scan'208";a="254179356"
Received: from yungchua-mobl.ccr.corp.intel.com (HELO [10.252.184.27])
 ([10.252.184.27])
 by orsmga001.jf.intel.com with ESMTP; 25 Jul 2019 19:12:00 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-10-pierre-louis.bossart@linux.intel.com>
From: Bard liao <yung-chuan.liao@linux.intel.com>
Message-ID: <3aa182a9-4b8e-96dd-e8f8-f2f5a90401cb@linux.intel.com>
Date: Fri, 26 Jul 2019 10:11:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725234032.21152-10-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 09/40] soundwire: cadence_master: fix
 usage of CONFIG_UPDATE
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 7/26/2019 7:40 AM, Pierre-Louis Bossart wrote:
> Per the hardware documentation, all changes to MCP_CONFIG,
> MCP_CONTROL, MCP_CMDCTRL and MCP_PHYCTRL need to be validated with a
> self-clearing write to MCP_CONFIG_UPDATE.
>
> For some reason, the existing code only does this write to
> CONFIG_UPDATE when enabling interrupts. Add a helper and do the update
> when the CONFIG is changed.
>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   drivers/soundwire/cadence_master.c | 29 +++++++++++++++++++++--------
>   1 file changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 9f611a1fff0a..eb46cf651d62 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -224,6 +224,22 @@ static int cdns_clear_bit(struct sdw_cdns *cdns, int offset, u32 value)
>   	return -EAGAIN;
>   }
>   
> +/*
> + * all changes to the MCP_CONFIG, MCP_CONTROL, MCP_CMDCTRL and MCP_PHYCTRL
> + * need to be confirmed with a write to MCP_CONFIG_UPDATE
> + */
> +static int cdns_update_config(struct sdw_cdns *cdns)
> +{
> +	int ret;
> +
> +	ret = cdns_clear_bit(cdns, CDNS_MCP_CONFIG_UPDATE,
> +			     CDNS_MCP_CONFIG_UPDATE_BIT);
> +	if (ret < 0)
> +		dev_err(cdns->dev, "Config update timedout\n");
> +
> +	return ret;
> +}
> +
>   /*
>    * debugfs
>    */
> @@ -758,15 +774,9 @@ static int _cdns_enable_interrupt(struct sdw_cdns *cdns)
>    */
>   int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
>   {
> -	int ret;
> -
>   	_cdns_enable_interrupt(cdns);
> -	ret = cdns_clear_bit(cdns, CDNS_MCP_CONFIG_UPDATE,
> -			     CDNS_MCP_CONFIG_UPDATE_BIT);
> -	if (ret < 0)
> -		dev_err(cdns->dev, "Config update timedout\n");
>   
> -	return ret;
Should we add cdns_update_config() here?
> +	return 0;
>   }
>   EXPORT_SYMBOL(sdw_cdns_enable_interrupt);
>   
> @@ -943,7 +953,10 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
>   
>   	cdns_writel(cdns, CDNS_MCP_CONFIG, val);
>   
> -	return 0;
> +	/* commit changes */
> +	ret = cdns_update_config(cdns);
> +
> +	return ret;
>   }
>   EXPORT_SYMBOL(sdw_cdns_init);
>   
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
