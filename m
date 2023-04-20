Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 038106E9A6B
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 19:15:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E16AEC2;
	Thu, 20 Apr 2023 19:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E16AEC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682010952;
	bh=PEJHCF8o5yRXy8rQpWjSG+FZsMlzywfLjLfQ1k5Fkl0=;
	h=Date:From:Subject:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qP/kPqcbgtxomC07eNIyRvDQhwxnF4nZJf1AlWfvhuPz/IUT07N2Zvs4VXJKa1Wy4
	 qhiq9xrg0nJ1ung79bvkzpxDg6Zs5sbw6vPz/1LEkZTwBICgbOd/ax/IjTRyn9FTsX
	 seeIcozLAk2RMEnx2xcoihQoZetvQhOt5qkUPObo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61318F804FC;
	Thu, 20 Apr 2023 19:14:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D579F80155; Thu, 20 Apr 2023 19:14:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19FB3F80053
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 19:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19FB3F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=f1o2pB38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682010842; x=1713546842;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=PEJHCF8o5yRXy8rQpWjSG+FZsMlzywfLjLfQ1k5Fkl0=;
  b=f1o2pB38fUAT+/tFshTAb1Zqn4oUmAWeHtRMhuizgSehHhYohJ7Nh8Ks
   JI4fAgA5fChX/gk0X+rB1gi9YKyVvzZ50Ymy6F00lozq6RdDkUMZCfNKq
   4raf866nEbn9BphEE3tuaTMRfj3N8Uj/TNCsAosG9uA6E2xDFrKOkscOZ
   LlPmmVJRr5Dj28PbRK+eJrBjdDlqiTSV5YnkYLYiTdSPqMqymSMxovEkP
   oyYIjcaJm1qJdBmVEe8roU9iQvLS3UPbxPXxGNYTu/FpIEglfQFY89XCd
   AvVm1SEP2tqg3laBxcJgyzFq7wQUr9S/L9U1K4vO3dyR+06+0U674eRRA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="348574481"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200";
   d="scan'208";a="348574481"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 09:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="1021622674"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200";
   d="scan'208";a="1021622674"
Received: from mprabhug-mobl.amr.corp.intel.com (HELO [10.209.102.50])
 ([10.209.102.50])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 09:43:00 -0700
Message-ID: <7ee41bcb-8656-49ec-40b6-15072c080d08@linux.intel.com>
Date: Thu, 20 Apr 2023 11:42:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 5/6] soudnwire: master: protect concurrecnt check for
 bus->md
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
 <20230420101617.142225-6-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
In-Reply-To: <20230420101617.142225-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DGF5PMNGQFXGOADMXIG6CF54VRHFJNAQ
X-Message-ID-Hash: DGF5PMNGQFXGOADMXIG6CF54VRHFJNAQ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DGF5PMNGQFXGOADMXIG6CF54VRHFJNAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

typos in commit title...

On 4/20/23 05:16, Krzysztof Kozlowski wrote:
> The Soundwire master controllers might want to check for bus->md

Apologies for being pedantic but 'manager' and 'controller' are
different concepts in SoundWire, see DisCo spec.
It's not a 1:1 mapping, a controller can rely on M managers

> initialization to avoid race between early interrupt and finish of
> sdw_bus_master_add()/sdw_master_device_add().  Such early interrupt can
> happen if Soundwire devices are not powered off during their probe.
> 
> Add a store release barrier, so the Soundwire controllers can safely
> check it in concurrent (e.g. in interrupt) way.

Can you elaborate on the race condition? I am not following what breaks,
and what entity generates the 'early interrupt'.

I am specifically concerned about adding this in common code without any
matching smp_load_acquire() - which is only added in the following patch
for the Qualcomm manager only, but not added for Intel/AMD managers. Is
this not a problem?

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Patrick Lai <quic_plai@quicinc.com>
> ---
>  drivers/soundwire/master.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
> index 9b05c9e25ebe..d5bf13e7e602 100644
> --- a/drivers/soundwire/master.c
> +++ b/drivers/soundwire/master.c
> @@ -161,7 +161,12 @@ int sdw_master_device_add(struct sdw_bus *bus, struct device *parent,
>  	/* add shortcuts to improve code readability/compactness */
>  	md->bus = bus;
>  	bus->dev = &md->dev;
> -	bus->md = md;
> +	/*
> +	 * Make sure the contents of md is stored before storing bus->md.
> +	 * Paired with new slave attached and slave status interrupts
> +	 * on the Soundwire master side.
> +	 */
> +	smp_store_release(&bus->md, md);
>  
>  	pm_runtime_set_autosuspend_delay(&bus->md->dev, SDW_MASTER_SUSPEND_DELAY_MS);
>  	pm_runtime_use_autosuspend(&bus->md->dev);
