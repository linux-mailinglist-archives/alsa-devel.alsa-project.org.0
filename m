Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9413B71EFBD
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 18:54:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E00941DC;
	Thu,  1 Jun 2023 18:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E00941DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685638445;
	bh=bhdAFTRphoPxW/9JmfSMKhCJWRqyEDl5R+kjnpRDSLg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Emq2FNol5tcJC6LqyKCSESzcXB1zhOpO7SK90lqnnY5TbsdDdvU9Q9e+vwhWlLqt/
	 21wyEPcJGD2yICunxpV7w3KEaqJafnMxHW9+/aUPkhHJozQvwHqZFpXncmZ1dqbouF
	 fD6LWILLjKx4VA1JdCRrP36FnN/f0tieAtcDx9lM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5722FF8058C; Thu,  1 Jun 2023 18:52:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D18EF8056F;
	Thu,  1 Jun 2023 18:52:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2B89F80580; Thu,  1 Jun 2023 18:52:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5EC64F8016B
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 18:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EC64F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=l9IMMXEo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685638321; x=1717174321;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bhdAFTRphoPxW/9JmfSMKhCJWRqyEDl5R+kjnpRDSLg=;
  b=l9IMMXEoWl1tlLQT8q2AWHoEuPjIZvuOv412Lnu1vD+KMErdSf35ENoa
   u1JGB4JsarDnzusreU0q7kV/n7RTsfhIebd9p/aZHoLyglgN3V9QtcoFr
   cthfeDzcTsnngvrjoSdsztL1opouoZ8MQY0EL0J+IPbBTfn2NW35ZN+Vi
   8h3zWRTjXSVYy99p83DEl7rAkPzOHQafZKCavaGL4ivBszOP5Cd83Uag7
   PtoSqK+R2t5Wff7dgnmK68Mhg5m/UTkSk76VoDEuujoIUF4+R5tl+b/ZP
   LtjMnh+xohF7ceUDaG7AxzY8rv2n3MBoMDywbS/nZft+mGtqbmRpLq2kQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="421426894"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400";
   d="scan'208";a="421426894"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:51:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="777283287"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400";
   d="scan'208";a="777283287"
Received: from rcelisco-mobl.amr.corp.intel.com (HELO [10.212.207.82])
 ([10.212.207.82])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:51:57 -0700
Message-ID: <9bcc7daa-744d-a092-91fa-07c0c869b386@linux.intel.com>
Date: Thu, 1 Jun 2023 11:43:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] soundwire: stream: Add missing clear of
 alloc_slave_rt
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20230601161622.1808135-1-ckeepax@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230601161622.1808135-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QXCMOOYD7RX57V6DDS6MPRTBC6WVDRII
X-Message-ID-Hash: QXCMOOYD7RX57V6DDS6MPRTBC6WVDRII
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QXCMOOYD7RX57V6DDS6MPRTBC6WVDRII/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/1/23 11:16, Charles Keepax wrote:
> The current path that skips allocating the slave runtime does not clear
> the alloc_slave_rt flag, this is clearly incorrect. Add the missing
> clear, so the runtime won't be erroneously cleaned up.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Sounds about right, thanks

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/stream.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index c2191c07442b0..379228f221869 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -2021,8 +2021,10 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
>  
>  skip_alloc_master_rt:
>  	s_rt = sdw_slave_rt_find(slave, stream);
> -	if (s_rt)
> +	if (s_rt) {
> +		alloc_slave_rt = false;
>  		goto skip_alloc_slave_rt;
> +	}
>  
>  	s_rt = sdw_slave_rt_alloc(slave, m_rt);
>  	if (!s_rt) {
