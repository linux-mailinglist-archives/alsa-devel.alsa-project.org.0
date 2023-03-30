Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 388F16D040E
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 13:55:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 091F81EF;
	Thu, 30 Mar 2023 13:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 091F81EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680177320;
	bh=HnAIjzzdx2lB/b8PHKZcY6z2HpfZD2oCVe+1dUZS8So=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e7h/DhYODhQROSOyakMzhVFzMDdDLWp4ppgWZ3GpZSriJ4zaIcOFfW1YBSLnIkJ6G
	 //87Kmy+wUiLqrAV9FKbBdNiUk8kCixwJGNXrnamDUF7qezd2LQqKIZxwbd/Kpzszw
	 NNu+SIfb/t4oTVprzhQDnKCAqXU5jZJJF4gA7S8o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CDD5F8024E;
	Thu, 30 Mar 2023 13:54:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EBA5F80272; Thu, 30 Mar 2023 13:54:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CCFBF8021D
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 13:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CCFBF8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Qrcpm6yP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177262; x=1711713262;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HnAIjzzdx2lB/b8PHKZcY6z2HpfZD2oCVe+1dUZS8So=;
  b=Qrcpm6yPc2h3DOWFvsvHN5iHrnyAVwvcP6MCIZIGqJNMoCgDSPpNr07C
   D0gVafFFhr6tUo56/jQfFfVNbsgUudrkI54++mDGULLfCz5jI1EOlCnRv
   NX+EyD1mDIfs1/NILcikJDnrHL3lq3x+8xkl9LTMIxVt4m/KkvHcj/9AF
   kVQNcTmXWBNoTK1oF7NUD1cx3El5Zm2w6BsMnaBi5CrVVftmqX/suNjPm
   cPutuuHK6YlZk7wPhNSSL69yA7l1RIhWodTr6agV++n8asofQslc1ccfs
   OKREjsu+6Dx4ff5uuoVT9fbYQ21uiu4L+2DQWEsY+Wx7vJdIlGQL39csw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="325069299"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400";
   d="scan'208";a="325069299"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 04:54:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="717285299"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400";
   d="scan'208";a="717285299"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 04:54:01 -0700
Message-ID: <8d0d0478-1e45-ea52-f1b7-910b747d6282@linux.intel.com>
Date: Thu, 30 Mar 2023 13:53:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v10] ASoC: tas2781: Add tas2781 driver
Content-Language: en-US
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, pierre-louis.bossart@linux.intel.com
References: <20230329100107.8181-1-13916275206@139.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230329100107.8181-1-13916275206@139.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: P3RKS2HFZL4XBPF3ZYHFOAIWH336Y5MV
X-Message-ID-Hash: P3RKS2HFZL4XBPF3ZYHFOAIWH336Y5MV
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: kevin-lu@ti.com, shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com, navada@ti.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3RKS2HFZL4XBPF3ZYHFOAIWH336Y5MV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/29/2023 12:01 PM, Shenghao Ding wrote:
> Create tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>
> 
> ---
> Changes in v10:
>   - using be16_to_cpu and be32_to_cpu instead of SMS_HTONS and SMS_HTONL
>   - optimize and reduce the boundary checks
>   - Add comments on some kmemdup instead of kzalloc+memcpy
>   Changes to be committed:
> 	modified:   sound/soc/codecs/Kconfig
> 	modified:   sound/soc/codecs/Makefile
> 	new file:   sound/soc/codecs/tas2781-dsp.c
> 	new file:   sound/soc/codecs/tas2781-dsp.h
> 	new file:   sound/soc/codecs/tas2781-i2c.c
> 	new file:   sound/soc/codecs/tas2781.h
> ---

...

> +
> +static int fw_parse_block_data_kernel(struct tasdevice_fw *tas_fmw,
> +	struct tasdev_blk *block, const struct firmware *fmw, int offset)
> +{
> +	const unsigned char *data = fmw->data;
> +
> +	if (offset + 16 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: File Size error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	block->type = be32_to_cpup((__be32 *)&data[offset]);

Wouldn't just be32_to_cpu(data[offset]) work instead of be32_to_cpup? 
Same in other cases.


