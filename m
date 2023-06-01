Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F0171EFB3
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 18:53:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB50074C;
	Thu,  1 Jun 2023 18:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB50074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685638382;
	bh=g5y1GHVsR7iAG9EmS8Ihu9Jzn9ts5cBKEcy8VFO6/sw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jFmQEtvDG4aGjO2eS7GjqQ+UV1Fbitzl8e3NspPlRUauDvbJIHc/EOvUWChrqsNHQ
	 CZ9sMZsUXdFeoQmbKXL9TgpNNzUScYaAl9djOMxTsl7ear3dTv1yQAwD5ugcWy6guS
	 QrFaApLTMdsq0U5GNVXyJKqv6iFhbpVkChOql2PU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06EBEF804DA; Thu,  1 Jun 2023 18:52:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06AE5F800C1;
	Thu,  1 Jun 2023 18:52:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A40FF8047D; Thu,  1 Jun 2023 18:52:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D866F800C8
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 18:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D866F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SKuTh4I1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685638319; x=1717174319;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=g5y1GHVsR7iAG9EmS8Ihu9Jzn9ts5cBKEcy8VFO6/sw=;
  b=SKuTh4I1nE3+kM06M/W0zSmxwymSSUieWk3G3NSM4esPapzypvfUGvFn
   NhSdp5HTzsYIo55sDJEN+80BMzOhs9QGf/WjqfnUEXziWd9plWD5peLyH
   2swnyFeNx3V4XFkJQjj0uks/dlqJwwWKki/YlBdoqAa3PrHRZgkltCve5
   M8wfvdtTr13pOdyQp8BBwY0Nj3/s9X6GPptyCfm+LqmJ5R1vgGJNm6RIF
   2FmUxlfyF3H/MkapoowV9K86uISZAR4eWs1xEE1buu3OANTJVqRHrrd++
   QqmhQyTNDyxypxGISMoG09cofXuDvyd5LICBuYz/srth1gWCBL3nP05xk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="421426857"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400";
   d="scan'208";a="421426857"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:51:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="777283273"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400";
   d="scan'208";a="777283273"
Received: from rcelisco-mobl.amr.corp.intel.com (HELO [10.212.207.82])
 ([10.212.207.82])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:51:52 -0700
Message-ID: <4e90380f-b328-5806-4305-0a794cadc550@linux.intel.com>
Date: Thu, 1 Jun 2023 11:34:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 4/4] soundwire: stream: Tidy do_bank_switch error messages
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20230601161622.1808135-1-ckeepax@opensource.cirrus.com>
 <20230601161622.1808135-4-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230601161622.1808135-4-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3TT7PKJUWCTEFEKULVUKKLD4RFOC5EUN
X-Message-ID-Hash: 3TT7PKJUWCTEFEKULVUKKLD4RFOC5EUN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3TT7PKJUWCTEFEKULVUKKLD4RFOC5EUN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/1/23 11:16, Charles Keepax wrote:
> Every error path in do_bank_switch prints an error message so there is no
> need for the callers to also print error messages. Indeed in multi-master
> cases these extra messages are confusing because they print out against a
> random bus device whereas the do_bank_switch messages print against the bus
> that actually failed.

Errm, what?

There is no way to know which bus failed in multi-master mode, and the
'stream' can span multiple buses so the use of pr_err was intentional.
There's just no other way to report issues, and I don't see why one
would remove such logs and fail silently.

I just don't get what you are trying to address.

> This also allows clean up of a couple of if's and variable initialisations
> that were only there to silence potentially uninitialised variable
> warnings on the bus variable.

That should be a separate patch IMHO.


> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/soundwire/stream.c | 26 +++++---------------------
>  1 file changed, 5 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 248ab243ec6e4..b5c7a52aac19e 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1338,7 +1338,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
>  			       bool update_params)
>  {
>  	struct sdw_master_runtime *m_rt;
> -	struct sdw_bus *bus = NULL;
> +	struct sdw_bus *bus;
>  	struct sdw_master_prop *prop;
>  	struct sdw_bus_params params;
>  	int ret;
> @@ -1380,16 +1380,9 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
>  		}
>  	}
>  
> -	if (!bus) {
> -		pr_err("Configuration error in %s\n", __func__);
> -		return -EINVAL;
> -	}
> -
>  	ret = do_bank_switch(stream);
> -	if (ret < 0) {
> -		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
> +	if (ret < 0)
>  		goto restore_params;
> -	}
>  
>  	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
>  		bus = m_rt->bus;
> @@ -1465,7 +1458,7 @@ EXPORT_SYMBOL(sdw_prepare_stream);
>  static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
>  {
>  	struct sdw_master_runtime *m_rt;
> -	struct sdw_bus *bus = NULL;
> +	struct sdw_bus *bus;
>  	int ret;
>  
>  	/* Enable Master(s) and Slave(s) port(s) associated with stream */
> @@ -1488,16 +1481,9 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
>  		}
>  	}
>  
> -	if (!bus) {
> -		pr_err("Configuration error in %s\n", __func__);
> -		return -EINVAL;
> -	}
> -
>  	ret = do_bank_switch(stream);
> -	if (ret < 0) {
> -		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	stream->state = SDW_STREAM_ENABLED;
>  	return 0;
> @@ -1571,10 +1557,8 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
>  	}
>  
>  	ret = do_bank_switch(stream);
> -	if (ret < 0) {
> -		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	/* make sure alternate bank (previous current) is also disabled */
>  	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
