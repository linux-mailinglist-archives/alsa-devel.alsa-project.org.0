Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2847004FA
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 12:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D8231D7;
	Fri, 12 May 2023 12:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D8231D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683886365;
	bh=lBNvZ/IXG6dHmWrwcxyPKxgwf2Ta/coLnCCGhcyQKdA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OBcbXerUUVE+CF0mohjtVZFrSu/tDXbjfTPXjC3oSXov2QitWrODIbBA83wnEx/im
	 YycbUyeDhTk2+eeYOjBvuZKUgY+k+gZeGDfG/Jeb2je8Kp7YNOzrk/7oJDD0fwYSBl
	 OxgIdfewJiPsZMw/3rY3uaAYvATxWKLMjr6OlWiI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B58DF8053B; Fri, 12 May 2023 12:11:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEF61F8032D;
	Fri, 12 May 2023 12:11:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08429F8052E; Fri, 12 May 2023 12:11:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9534F80087;
	Fri, 12 May 2023 12:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9534F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=d2bkz1jI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683886303; x=1715422303;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lBNvZ/IXG6dHmWrwcxyPKxgwf2Ta/coLnCCGhcyQKdA=;
  b=d2bkz1jI8kkAkYg5iVELc9rZHqwBcxTwauRchLvuu9KMdlt7bP2Cb+8x
   H6IW6grP7YisoLiIKAKjBOx9mpKQx6IMVfCdfcVSRrRwZDb2u4z+b6MbL
   +5Jgj+e2uY7nXgNvnNGyz6xDg5ON1WAMap/d5O7BwsBm1IDZGq00OtYnN
   eBu7h/n1LSB2WsDFNo59l60+n+NrUJxReUz8VUE3O8d4vfouZzaj0cl7a
   Yqjz9L7MbmSRAKpAuMipqEpQGIbcb9VpjK6z45FCeHvaPLBMGH9wHtIC6
   IV46YhAp/kj//pyt6tMMhLTCioNngeK4h4aVvmcs7LYB+K4d3PYIkL/ht
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416386122"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="416386122"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 03:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="824308963"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="824308963"
Received: from nhanph1x-mobl.amr.corp.intel.com (HELO [10.249.38.84])
 ([10.249.38.84])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 03:11:34 -0700
Message-ID: <947a2a5d-5a63-6437-bfc3-a5c4841152c2@linux.intel.com>
Date: Fri, 12 May 2023 13:12:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
Subject: Re: [PATCH] ASoC: SOF: topology: Fix missing error code in
 sof_route_load()
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 pierre-louis.bossart@linux.intel.com
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20230512025410.52832-1-jiapeng.chong@linux.alibaba.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230512025410.52832-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZSEDDB5ZUANJODXPYQ2IB7B66RKJK5DV
X-Message-ID-Hash: ZSEDDB5ZUANJODXPYQ2IB7B66RKJK5DV
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSEDDB5ZUANJODXPYQ2IB7B66RKJK5DV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/05/2023 05:54, Jiapeng Chong wrote:
> The error code is missing in this code scenario, add the error code
> '-EINVAL' to the return value 'err'.
>
> sound/soc/sof/topology.c:2060 sof_route_load() warn: missing error
code 'ret'.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Robots don't necessarily understand code...
The cases which this is aiming to fix are the cases when we ignore
things, not failing.

Would it be possible to check the code and understand it before sending
a patch?

Nack.

> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4935
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  sound/soc/sof/topology.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index d3d536b0a8f5..3ca3a72f1805 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -2045,7 +2045,6 @@ static int sof_route_load(struct
snd_soc_component *scomp, int index,
>  	if (!source_swidget) {
>  		dev_err(scomp->dev, "error: source %s not found\n",
>  			route->source);
> -		ret = -EINVAL;
>  		goto err;
>  	}
>
> @@ -2064,7 +2063,6 @@ static int sof_route_load(struct
snd_soc_component *scomp, int index,
>  	if (!sink_swidget) {
>  		dev_err(scomp->dev, "error: sink %s not found\n",
>  			route->sink);
> -		ret = -EINVAL;
>  		goto err;
>  	}
>
> @@ -2087,6 +2085,8 @@ static int sof_route_load(struct
snd_soc_component *scomp, int index,
>  	return 0;
>  err:
>  	kfree(sroute);
> +	ret = -EINVAL;
> +
>  	return ret;
>  }
>
-- 
Péter
