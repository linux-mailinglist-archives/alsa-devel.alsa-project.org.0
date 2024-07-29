Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2070393F7EA
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 16:30:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5635483B;
	Mon, 29 Jul 2024 16:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5635483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722263422;
	bh=NehnDBe65QUb/bCNXvqWYiRaGGm51AIYVQytQZgxYgU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nOFubASBaNEaHrRMksmGZfNtD1QSvUBREUzXc2JII19cGSAPHcvMncMezMx/e/2M3
	 M/ABI7HSt1D1WXtoYEAfmkuIK7mWztiLbdxoz1iFHb/2HX4ngJ05XX8DeVYJpSynzF
	 NGXzKbrQ9UAqmqWlqqh8mPaJNjCqSmHiOEr1tq3g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6CFEF805B2; Mon, 29 Jul 2024 16:29:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A7BFF805B0;
	Mon, 29 Jul 2024 16:29:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9294F802DB; Mon, 29 Jul 2024 16:29:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9764BF80269
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 16:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9764BF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dfCsndyR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722263343; x=1753799343;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NehnDBe65QUb/bCNXvqWYiRaGGm51AIYVQytQZgxYgU=;
  b=dfCsndyRSDN+QIHi3EXfyG5OjafWRNzILye0jgDg2k6cJOL3y4BMCyaa
   IA3Gxfq4N4REUmlBQ5UOdiJ93zN+nAM8bSGnTiPH0QeBk1mkEwN2nlG/E
   SOuR3Q6SH2t5SvFnLH1PIP8Vw6052Grq6h1vMaXzAyVB/lxWf5N3HPdnj
   NMouo535Of+FGbkucFR7gTBkz5rmIMfAmFy9U+5Nj2l62xUwE60e4bEIA
   rsWYIcqMZUniNQIYYa2Sn9EaNmdtqg5qOxnDYtPLfZ68sZDdBACKv7x0c
   2cQdYMlmbrM58AEdYOt9F+qH6PADxgjbokqwi0giCXaeeHkMP5EZkL9Os
   g==;
X-CSE-ConnectionGUID: ukOCXT+iS4Skm15sk76IlQ==
X-CSE-MsgGUID: uhFh6EvIScWl9ob21ofs1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="30692054"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800";
   d="scan'208";a="30692054"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 07:28:43 -0700
X-CSE-ConnectionGUID: aaRxpF21Q2+Qdt21vlrXrw==
X-CSE-MsgGUID: TrH4A4xhQ8qG38n6OD5zkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800";
   d="scan'208";a="53889098"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.246.219])
 ([10.245.246.219])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 07:28:40 -0700
Message-ID: <095d7119-8221-450a-9616-2df6a0df4c77@linux.intel.com>
Date: Mon, 29 Jul 2024 16:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: stream: fix programming slave ports for
 non-continous port maps
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Shreyas NC <shreyas.nc@intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20240729140157.326450-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240729140157.326450-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CKXMOCXDGYREN657JOP4J2QKJO2NP74I
X-Message-ID-Hash: CKXMOCXDGYREN657JOP4J2QKJO2NP74I
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CKXMOCXDGYREN657JOP4J2QKJO2NP74I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/29/24 16:01, Krzysztof Kozlowski wrote:
> Two bitmasks in 'struct sdw_slave_prop' - 'source_ports' and
> 'sink_ports' - define which ports to program in
> sdw_program_slave_port_params().  The masks are used to get the
> appropriate data port properties ('struct sdw_get_slave_dpn_prop') from
> an array.
> 
> Bitmasks can be non-continuous or can start from index different than 0,
> thus when looking for matching port property for given port, we must
> iterate over mask bits, not from 0 up to number of ports.
> 
> This fixes allocation and programming slave ports, when a source or sink
> masks start from further index.
> 
> Fixes: f8101c74aa54 ("soundwire: Add Master and Slave port programming")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This is a valid change to optimize how the port are accessed.

But the commit message is not completely clear, the allocation in
mipi_disco.c is not modified and I don't think there's anything that
would crash. If there are non-contiguous ports, we will still allocate
space that will not be initialized/used.

	/* Allocate memory for set bits in port lists */
	nval = hweight32(prop->source_ports);
	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
					  sizeof(*prop->src_dpn_prop),
					  GFP_KERNEL);
	if (!prop->src_dpn_prop)
		return -ENOMEM;

	/* Read dpn properties for source port(s) */
	sdw_slave_read_dpn(slave, prop->src_dpn_prop, nval,
			   prop->source_ports, "source");

IOW, this is a valid change, but it's an optimization, not a fix in the
usual sense of 'kernel oops otherwise'.

Am I missing something?

BTW, the notion of DPn is that n > 0. DP0 is a special case with
different properties, BIT(0) cannot be set for either of the sink/source
port bitmask.


> ---
>  drivers/soundwire/stream.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 7aa4900dcf31..f275143d7b18 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1291,18 +1291,18 @@ struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
>  					    unsigned int port_num)
>  {
>  	struct sdw_dpn_prop *dpn_prop;
> -	u8 num_ports;
> +	unsigned long mask;
>  	int i;
>  
>  	if (direction == SDW_DATA_DIR_TX) {
> -		num_ports = hweight32(slave->prop.source_ports);
> +		mask = slave->prop.source_ports;
>  		dpn_prop = slave->prop.src_dpn_prop;
>  	} else {
> -		num_ports = hweight32(slave->prop.sink_ports);
> +		mask = slave->prop.sink_ports;
>  		dpn_prop = slave->prop.sink_dpn_prop;
>  	}
>  
> -	for (i = 0; i < num_ports; i++) {
> +	for_each_set_bit(i, &mask, 32) {
>  		if (dpn_prop[i].num == port_num)
>  			return &dpn_prop[i];
>  	}

