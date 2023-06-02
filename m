Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCBB72077F
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 18:25:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95868836;
	Fri,  2 Jun 2023 18:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95868836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685723116;
	bh=P/aBOqyU1q7iZ4JIPu4JBjlwp0Z/TDUhLugAjN+JF18=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AR/KMwWs2EGKSx0Z1CImMDRlAzA99ekIeJqFz4SNZK/jz2kiJcDlGNVIkkUz8YvJH
	 2QUuTgqoeP1qMG+jpgC+nz1bxKW2MvsokzW1/Qr3zL74/xC7Yk+Y0wSCb351QoBxLb
	 0sLciIC7egDfi+iJzIAAGVl6OkHdsznYelz7Bbrs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1152BF8056F; Fri,  2 Jun 2023 18:23:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DCBEF80548;
	Fri,  2 Jun 2023 18:23:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3312F80564; Fri,  2 Jun 2023 18:23:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74C30F80149
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 18:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74C30F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ln9WjMyr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685723010; x=1717259010;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=P/aBOqyU1q7iZ4JIPu4JBjlwp0Z/TDUhLugAjN+JF18=;
  b=Ln9WjMyrPD3dsWAHBfYwmuC+8JGy88rcDZ/ajeTjz84AeGm1a4WkDxL0
   ZMp8kwROoSbnMyaeRXv3HNmjwuU33vGXGoZTRom0i/Et1JZdSTgJslI7J
   hPPkrL9gKZtvBKVpBxNVZr9Q+Sh7bgo3xrdyRlEk711M7g0tyKCZGk2/c
   fIBva6VfaV74oJBFzmvaDDrv+/kC6mm0WzQIITZgo2YI9xGZl4YtvvvX4
   pQJEUEgyWtbRMD9NPvbjf74Ta4hZDxq4AEQNilmCPkra75w9wUMwk9YPv
   3QrtHy5yLUKkeFY5VjIbJTN0PxKP8ZVJZEH4ymF1wAtGHzE/oUm9KfvFl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="442285466"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400";
   d="scan'208";a="442285466"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 09:23:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="685367786"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400";
   d="scan'208";a="685367786"
Received: from joshkuo-mobl.amr.corp.intel.com (HELO [10.209.39.242])
 ([10.209.39.242])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 09:23:15 -0700
Message-ID: <aa039ad4-ebb8-0ce6-80f9-480b7a0bf5ac@linux.intel.com>
Date: Fri, 2 Jun 2023 10:13:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v2 5/5] soundwire: stream: Remove unnecessary gotos
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20230602101140.2040141-1-ckeepax@opensource.cirrus.com>
 <20230602101140.2040141-5-ckeepax@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230602101140.2040141-5-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WPMW527BKXDSJUSNMEEQOIEE7FD6JTYZ
X-Message-ID-Hash: WPMW527BKXDSJUSNMEEQOIEE7FD6JTYZ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WPMW527BKXDSJUSNMEEQOIEE7FD6JTYZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/2/23 05:11, Charles Keepax wrote:
> There is a lot of code using gotos to skip small sections of code, this
> is a fairly dubious use of a goto, especially when the level of
> intentation is really low. Most of this code doesn't even breach 80
> characters when naively shifted over.
> 
> Simplify the code a bit, by replacing these unnecessary gotos with
> simple ifs.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Changes since v1:
>  - Split out the inversion of the alloc_*_rt logic
> 
> Worth noting this patch has no functional corrections it is just a
> stylistic change, so as Pierre said on v1 we could just leave things
> as is. Personally, I would prefer to merge it though, whilst the diff
> is a little more of a pain to review (hopefully eased somewhat by
> splitting out the alloc_*_rt logic into a separate patch), the
> resulting code reads much nicer and the code will be read a lot more
> times than this patch will be.

Indeed, the resulting code is much nicer to look at. I ignored the diffs
and just looked at the result to make up my mind.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Thanks,
> Charles
> 
>  drivers/soundwire/stream.c | 124 +++++++++++++++++--------------------
>  1 file changed, 56 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index df5600a80c174..93baca08a0dea 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1355,25 +1355,23 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
>  			return -EINVAL;
>  		}
>  
> -		if (!update_params)
> -			goto program_params;
> -
> -		/* Increment cumulative bus bandwidth */
> -		/* TODO: Update this during Device-Device support */
> -		bus->params.bandwidth += m_rt->stream->params.rate *
> -			m_rt->ch_count * m_rt->stream->params.bps;
> -
> -		/* Compute params */
> -		if (bus->compute_params) {
> -			ret = bus->compute_params(bus);
> -			if (ret < 0) {
> -				dev_err(bus->dev, "Compute params failed: %d\n",
> -					ret);
> -				goto restore_params;
> +		if (update_params) {
> +			/* Increment cumulative bus bandwidth */
> +			/* TODO: Update this during Device-Device support */
> +			bus->params.bandwidth += m_rt->stream->params.rate *
> +				m_rt->ch_count * m_rt->stream->params.bps;
> +
> +			/* Compute params */
> +			if (bus->compute_params) {
> +				ret = bus->compute_params(bus);
> +				if (ret < 0) {
> +					dev_err(bus->dev, "Compute params failed: %d\n",
> +						ret);
> +					goto restore_params;
> +				}
>  			}
>  		}
>  
> -program_params:
>  		/* Program params */
>  		ret = sdw_program_params(bus, true);
>  		if (ret < 0) {
> @@ -1876,30 +1874,25 @@ int sdw_stream_add_master(struct sdw_bus *bus,
>  	 * it first), if so skip allocation and go to configuration
>  	 */
>  	m_rt = sdw_master_rt_find(bus, stream);
> -	if (m_rt)
> -		goto skip_alloc_master_rt;
> -
> -	m_rt = sdw_master_rt_alloc(bus, stream);
>  	if (!m_rt) {
> -		dev_err(bus->dev, "%s: Master runtime alloc failed for stream:%s\n",
> -			__func__, stream->name);
> -		ret = -ENOMEM;
> -		goto unlock;
> -	}
> -
> -	alloc_master_rt = true;
> -skip_alloc_master_rt:
> -
> -	if (sdw_master_port_allocated(m_rt))
> -		goto skip_alloc_master_port;
> +		m_rt = sdw_master_rt_alloc(bus, stream);
> +		if (!m_rt) {
> +			dev_err(bus->dev, "%s: Master runtime alloc failed for stream:%s\n",
> +				__func__, stream->name);
> +			ret = -ENOMEM;
> +			goto unlock;
> +		}
>  
> -	ret = sdw_master_port_alloc(m_rt, num_ports);
> -	if (ret)
> -		goto alloc_error;
> +		alloc_master_rt = true;
> +	}
>  
> -	stream->m_rt_count++;
> +	if (!sdw_master_port_allocated(m_rt)) {
> +		ret = sdw_master_port_alloc(m_rt, num_ports);
> +		if (ret)
> +			goto alloc_error;
>  
> -skip_alloc_master_port:
> +		stream->m_rt_count++;
> +	}
>  
>  	ret = sdw_master_rt_config(m_rt, stream_config);
>  	if (ret < 0)
> @@ -1992,46 +1985,41 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
>  	 * and go to configuration
>  	 */
>  	m_rt = sdw_master_rt_find(slave->bus, stream);
> -	if (m_rt)
> -		goto skip_alloc_master_rt;
> -
> -	/*
> -	 * If this API is invoked by Slave first then m_rt is not valid.
> -	 * So, allocate m_rt and add Slave to it.
> -	 */
> -	m_rt = sdw_master_rt_alloc(slave->bus, stream);
>  	if (!m_rt) {
> -		dev_err(&slave->dev, "%s: Master runtime alloc failed for stream:%s\n",
> -			__func__, stream->name);
> -		ret = -ENOMEM;
> -		goto unlock;
> -	}
> +		/*
> +		 * If this API is invoked by Slave first then m_rt is not valid.
> +		 * So, allocate m_rt and add Slave to it.
> +		 */
> +		m_rt = sdw_master_rt_alloc(slave->bus, stream);
> +		if (!m_rt) {
> +			dev_err(&slave->dev, "%s: Master runtime alloc failed for stream:%s\n",
> +				__func__, stream->name);
> +			ret = -ENOMEM;
> +			goto unlock;
> +		}
>  
> -	alloc_master_rt = true;
> +		alloc_master_rt = true;
> +	}
>  
> -skip_alloc_master_rt:
>  	s_rt = sdw_slave_rt_find(slave, stream);
> -	if (s_rt)
> -		goto skip_alloc_slave_rt;
> -
> -	s_rt = sdw_slave_rt_alloc(slave, m_rt);
>  	if (!s_rt) {
> -		dev_err(&slave->dev, "Slave runtime alloc failed for stream:%s\n", stream->name);
> -		ret = -ENOMEM;
> -		goto alloc_error;
> -	}
> -
> -	alloc_slave_rt = true;
> +		s_rt = sdw_slave_rt_alloc(slave, m_rt);
> +		if (!s_rt) {
> +			dev_err(&slave->dev, "Slave runtime alloc failed for stream:%s\n",
> +				stream->name);
> +			ret = -ENOMEM;
> +			goto alloc_error;
> +		}
>  
> -skip_alloc_slave_rt:
> -	if (sdw_slave_port_allocated(s_rt))
> -		goto skip_port_alloc;
> +		alloc_slave_rt = true;
> +	}
>  
> -	ret = sdw_slave_port_alloc(slave, s_rt, num_ports);
> -	if (ret)
> -		goto alloc_error;
> +	if (!sdw_slave_port_allocated(s_rt)) {
> +		ret = sdw_slave_port_alloc(slave, s_rt, num_ports);
> +		if (ret)
> +			goto alloc_error;
> +	}
>  
> -skip_port_alloc:
>  	ret =  sdw_master_rt_config(m_rt, stream_config);
>  	if (ret)
>  		goto unlock;
