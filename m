Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B1F182F6F
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 12:41:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7449716D6;
	Thu, 12 Mar 2020 12:40:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7449716D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584013294;
	bh=swjb62LfFGeOU+yjGcAhq+98TranS2onxgJpN/sI+cg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q63yd/Rc//UoiyQ65d8YXvX1FGfMUakg2iCESkFVfWgOz6FleJJvs0h1QkYtZh4AJ
	 S8zItaXPZA+kG4pEnhfM2L0biIY7eFRX9c1IWertLy7cFQDGTgvy8FrhsWkt13v2/1
	 hYg1D2hm/4btDpcCJEDLh7oYf4MwZQXMuZrMTC/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70277F800BE;
	Thu, 12 Mar 2020 12:39:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A598F8013E; Thu, 12 Mar 2020 12:39:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E48BF8013E
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 12:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E48BF8013E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 04:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,544,1574150400"; d="scan'208";a="242995404"
Received: from swaydand-mobl1.amr.corp.intel.com (HELO [10.255.230.33])
 ([10.255.230.33])
 by orsmga003.jf.intel.com with ESMTP; 12 Mar 2020 04:39:41 -0700
Subject: Re: [PATCH] soundwire: stream: use sdw_write instead of update
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20200312100105.5293-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b235b88a-acdc-cec4-0c00-2609c3774fa1@linux.intel.com>
Date: Thu, 12 Mar 2020 05:45:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312100105.5293-1-srinivas.kandagatla@linaro.org>
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



On 3/12/20 5:01 AM, Srinivas Kandagatla wrote:
> There is no point in using update for registers with write mask
> as 0xFF, this adds unecessary traffic on the bus.
> Just use sdw_write directly.

well in theory you could have two streams share the same port, that's 
allowed by the specification.

But since it clearly documented as not supported

	/*
	 * Since bus doesn't support sharing a port across two streams,
	 * it is safe to reset this register
	 */

this mask handing is indeed completely overkill.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   drivers/soundwire/stream.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 00348d1fc606..1b43d03c79ea 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -313,9 +313,9 @@ static int sdw_enable_disable_slave_ports(struct sdw_bus *bus,
>   	 * it is safe to reset this register
>   	 */
>   	if (en)
> -		ret = sdw_update(s_rt->slave, addr, 0xFF, p_rt->ch_mask);
> +		ret = sdw_write(s_rt->slave, addr, p_rt->ch_mask);
>   	else
> -		ret = sdw_update(s_rt->slave, addr, 0xFF, 0x0);
> +		ret = sdw_write(s_rt->slave, addr, 0x0);
>   
>   	if (ret < 0)
>   		dev_err(&s_rt->slave->dev,
> @@ -464,10 +464,9 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
>   		addr = SDW_DPN_PREPARECTRL(p_rt->num);
>   
>   		if (prep)
> -			ret = sdw_update(s_rt->slave, addr,
> -					 0xFF, p_rt->ch_mask);
> +			ret = sdw_write(s_rt->slave, addr, p_rt->ch_mask);
>   		else
> -			ret = sdw_update(s_rt->slave, addr, 0xFF, 0x0);
> +			ret = sdw_write(s_rt->slave, addr, 0x0);
>   
>   		if (ret < 0) {
>   			dev_err(&s_rt->slave->dev,
> 
