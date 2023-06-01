Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FF671EFBC
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 18:54:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D218084A;
	Thu,  1 Jun 2023 18:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D218084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685638438;
	bh=unaIhnrbLjV7sEpHjjq64t0b2CFQcNQSWZs0Xy3lg8E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ygpg6EGT/ewpa6QFqKX4M6YkyRZ9S1G3PUtWX5Yat2V620eqc1MoVgz/bCNymV++6
	 VAfNkdVl2xJgKaQMJUkD5Z83ci3JQsDOwS657wF7BInCJWfBF1buxy0yMJYHeSY5Ko
	 23RgBR7k31yBknuA59yMoh78b5EFMqMi5zDBdQug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DF4DF8057B; Thu,  1 Jun 2023 18:52:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60A3CF8055C;
	Thu,  1 Jun 2023 18:52:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7D88F80199; Thu,  1 Jun 2023 18:52:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF1C3F800C1
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 18:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF1C3F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JbARN1Bo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685638320; x=1717174320;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=unaIhnrbLjV7sEpHjjq64t0b2CFQcNQSWZs0Xy3lg8E=;
  b=JbARN1BowZ8Gz3HnBlnmJU55HwHf04BphSRMbI9jCrFS4qxkTHEDDlex
   F0DvEjdCa2micIgRbPFAAm7R/MdijS5zl7PxjHbhUcEhrNqWtakC2jlAY
   og4ZTNuzKbyrJQGcG2eOhjVEG4oBXzqA0uA6QUow7c27P2G2Sr+WpvRbC
   /mtaf4jY1j2r5xHrkeTkjmHJqMqV8f9g+QhKPEN4vnhnbxk7Gjgn/xV5O
   SL+MNH73nzgGXRowFOxHVbMr53ORcnluTMGS07+qB3O0kjGX20OYgE4Xv
   IhPXWCmH5UfM6ZFYAWwujB3G3UZC7vMmER+DN+CFouTOcIFo49XsbGFIw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="421426869"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400";
   d="scan'208";a="421426869"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:51:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="777283278"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400";
   d="scan'208";a="777283278"
Received: from rcelisco-mobl.amr.corp.intel.com (HELO [10.212.207.82])
 ([10.212.207.82])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:51:54 -0700
Message-ID: <40d09b30-3323-f438-0f12-bc322ee389e9@linux.intel.com>
Date: Thu, 1 Jun 2023 11:37:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 3/4] soundwire: stream: Remove unnecessary gotos
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20230601161622.1808135-1-ckeepax@opensource.cirrus.com>
 <20230601161622.1808135-3-ckeepax@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230601161622.1808135-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SYR63CJ4LGHROERAIBDSHCAI7WDKJIP7
X-Message-ID-Hash: SYR63CJ4LGHROERAIBDSHCAI7WDKJIP7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SYR63CJ4LGHROERAIBDSHCAI7WDKJIP7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/1/23 11:16, Charles Keepax wrote:
> There is a lot of code using gotos to skip small sections of code, this
> is a fairly dubious use of a goto, especially when the level of
> intentation is really low. Most of this code doesn't even breach 80
> characters when naively shifted over.
> 
> Simplify the code a bit, by replacing these unnecessary gotos with
> simple ifs.

it's probably ok but far from simple to review with the inverted states
for variables. I don't have the time and energy to revisit this...

I would err on the side of if it ain't broke don't fix it here.

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/soundwire/stream.c | 131 +++++++++++++++++--------------------
>  1 file changed, 59 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 379228f221869..248ab243ec6e4 100644
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
> @@ -1864,7 +1862,7 @@ int sdw_stream_add_master(struct sdw_bus *bus,
>  			  struct sdw_stream_runtime *stream)
>  {
>  	struct sdw_master_runtime *m_rt;
> -	bool alloc_master_rt = true;
> +	bool alloc_master_rt = false;
>  	int ret;
>  
>  	mutex_lock(&bus->bus_lock);
> @@ -1886,30 +1884,25 @@ int sdw_stream_add_master(struct sdw_bus *bus,
>  	 * it first), if so skip allocation and go to configuration
>  	 */
>  	m_rt = sdw_master_rt_find(bus, stream);
> -	if (m_rt) {
> -		alloc_master_rt = false;
> -		goto skip_alloc_master_rt;
> -	}
> -
> -	m_rt = sdw_master_rt_alloc(bus, stream);
>  	if (!m_rt) {
> -		dev_err(bus->dev, "%s: Master runtime alloc failed for stream:%s\n",
> -			__func__, stream->name);
> -		ret = -ENOMEM;
> -		goto unlock;
> -	}
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
> @@ -1990,8 +1983,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
>  {
>  	struct sdw_slave_runtime *s_rt;
>  	struct sdw_master_runtime *m_rt;
> -	bool alloc_master_rt = true;
> -	bool alloc_slave_rt = true;
> +	bool alloc_master_rt = false;
> +	bool alloc_slave_rt = false;
>  
>  	int ret;
>  
> @@ -2002,47 +1995,41 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
>  	 * and go to configuration
>  	 */
>  	m_rt = sdw_master_rt_find(slave->bus, stream);
> -	if (m_rt) {
> -		alloc_master_rt = false;
> -		goto skip_alloc_master_rt;
> -	}
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
> -skip_alloc_master_rt:
> -	s_rt = sdw_slave_rt_find(slave, stream);
> -	if (s_rt) {
> -		alloc_slave_rt = false;
> -		goto skip_alloc_slave_rt;
> +		alloc_master_rt = true;
>  	}
>  
> -	s_rt = sdw_slave_rt_alloc(slave, m_rt);
> +	s_rt = sdw_slave_rt_find(slave, stream);
>  	if (!s_rt) {
> -		dev_err(&slave->dev, "Slave runtime alloc failed for stream:%s\n", stream->name);
> -		alloc_slave_rt = false;
> -		ret = -ENOMEM;
> -		goto alloc_error;
> -	}
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
