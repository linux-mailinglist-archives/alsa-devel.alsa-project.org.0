Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5905917E666
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 19:07:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC51F16AD;
	Mon,  9 Mar 2020 19:06:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC51F16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583777234;
	bh=+AOe4PIFjhkLgSsRMn+4KGJyF8Sk5Hsr2hHUMbxXN/U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AVZC8QClVxXYl5nfIgFm4D3A/WAvEYMU364lkGh7X7Vq+tNP+dbIXrlklrXn0sHFg
	 kCX3GHRxNc0w0jCmYOZrBDM8D+nbPLC/LStznkjXs+6W/88IpNemvrdosZaJUWSIoz
	 88yyxOd3KvWZ6cBZr7zhTe6rIDcx5Sd5hPGWd7Kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E76AAF80123;
	Mon,  9 Mar 2020 19:05:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84E3EF801EB; Mon,  9 Mar 2020 19:05:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6E4BF800DA
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 19:05:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6E4BF800DA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 11:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="231020439"
Received: from jdbostic-mobl1.amr.corp.intel.com (HELO [10.251.152.35])
 ([10.251.152.35])
 by orsmga007.jf.intel.com with ESMTP; 09 Mar 2020 11:05:22 -0700
Subject: Re: [RFC PATCH] soundwire: bus: Add flag to mark DPN_BlockCtrl1 as
 readonly
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20200309173755.955-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d94fca16-ed61-632a-6f8c-84e3a97869c7@linux.intel.com>
Date: Mon, 9 Mar 2020 13:05:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309173755.955-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 3/9/20 12:37 PM, Srinivas Kandagatla wrote:
> According to SoundWire Specification Version 1.2.
> "A Data Port number X (in the range 0-14) which supports only one
> value of WordLength may implement the WordLength field in the
> DPX_BlockCtrl1 Register as Read-Only, returning the fixed value of
> WordLength in response to reads."

Interesting.

I think it's a spec issue that you want to bring to the MIPI Audio WG 
attention.

The note below says 'the DPx_BlockCtrl1 Register remains as Read-Write, 
but the value written to the Read-Only field is not used'

Ignoring a value and returning an error are two different behaviors indeed.

My recommendation would be to add a DisCo property stating the 
WordLength value can be used by the bus code but not written to the 
Slave device registers.

> 
> As WSA881x interfaces in PDM mode making the only field "WordLength"
> in DPX_BlockCtrl1" fixed and read-only. Behaviour of writing to this
> register on WSA881x soundwire slave with Qualcomm Soundwire Controller
> is throwing up an error. Not sure how other controllers deal with
> writing to readonly registers, but this patch provides a way to avoid
> writes to DPN_BlockCtrl1 register by providing a ro_blockctrl1_reg
> flag in struct sdw_port_runtime.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> 
> I will send patch for WSA881x to include this change once this patch
> is accepted.
> 
>   drivers/soundwire/bus.h    |  2 ++
>   drivers/soundwire/stream.c | 17 ++++++++++-------
>   2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
> index 204204a26db8..791e8d14093e 100644
> --- a/drivers/soundwire/bus.h
> +++ b/drivers/soundwire/bus.h
> @@ -79,6 +79,7 @@ int sdw_find_col_index(int col);
>    * @num: Port number. For audio streams, valid port number ranges from
>    * [1,14]
>    * @ch_mask: Channel mask
> + * @ro_blockctrl1_reg: Read Only flag for DPN_BlockCtrl1 register
>    * @transport_params: Transport parameters
>    * @port_params: Port parameters
>    * @port_node: List node for Master or Slave port_list
> @@ -89,6 +90,7 @@ int sdw_find_col_index(int col);
>   struct sdw_port_runtime {
>   	int num;
>   	int ch_mask;
> +	bool ro_blockctrl1_reg;
>   	struct sdw_transport_params transport_params;
>   	struct sdw_port_params port_params;
>   	struct list_head port_node;
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 00348d1fc606..4491643aeb4a 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -167,13 +167,15 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
>   		return ret;
>   	}
>   
> -	/* Program DPN_BlockCtrl1 register */
> -	ret = sdw_write(s_rt->slave, addr2, (p_params->bps - 1));
> -	if (ret < 0) {
> -		dev_err(&s_rt->slave->dev,
> -			"DPN_BlockCtrl1 register write failed for port %d\n",
> -			t_params->port_num);
> -		return ret;
> +	if (!p_rt->ro_blockctrl1_reg) {
> +		/* Program DPN_BlockCtrl1 register */
> +		ret = sdw_write(s_rt->slave, addr2, (p_params->bps - 1));
> +		if (ret < 0) {
> +			dev_err(&s_rt->slave->dev,
> +				"DPN_BlockCtrl1 register write failed for port %d\n",
> +				t_params->port_num);
> +			return ret;
> +		}
>   	}
>   
>   	/* Program DPN_SampleCtrl1 register */
> @@ -1195,6 +1197,7 @@ static struct sdw_port_runtime
>   
>   	p_rt->ch_mask = port_config[port_index].ch_mask;
>   	p_rt->num = port_config[port_index].num;
> +	p_rt->ro_blockctrl1_reg = port_config[port_index].ro_blockctrl1_reg;
>   
>   	return p_rt;
>   }
> 
