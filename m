Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 458607C57C1
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 17:08:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FCB216F8;
	Wed, 11 Oct 2023 17:07:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FCB216F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697036917;
	bh=8c7ow3r0v7L/3vxLn67gJ7U9jhG5P3D98ExqsyocpYw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U0ToHlNlyqUeCJdFQA0yLEVmTTVcK1Q3dOkfLHbHKpEc5ZL/Gb8YmFc7hzujI68c5
	 s2xWC2djEi8xhpPJtbvPFQqKN+ph7+2mORRjp/17dx8vws1+0qzsL3Rc9bhbrNNmAj
	 WcdY+tmVc3sCaHvTb2MjXpHs+RKkWrEpsFYl6Bqw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE117F80536; Wed, 11 Oct 2023 17:07:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D053F8027B;
	Wed, 11 Oct 2023 17:07:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDBC3F802BE; Wed, 11 Oct 2023 17:07:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 188ABF8015B
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 17:07:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 188ABF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OWKn/u0z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697036858; x=1728572858;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8c7ow3r0v7L/3vxLn67gJ7U9jhG5P3D98ExqsyocpYw=;
  b=OWKn/u0zaT1izW9c+TOTmVsqSP99CRRgZcQVyX8JfDpzgJpDr+kmxPFX
   zU1vmbvHCXgMc/nQEqHYlkArDFWOF7I2046nMOm93d1U7Iq32Lrqzg/bl
   RWOsxv2feSXA+87JOUy4HPtkjF5LBUzshuKyY22kZa3vgPbMEOn5KKEBi
   /rDjzVA6nt6lwTfwJaSFeTvfKzbCPBIna7/S6Bv3KozpFITicpgERD3Ym
   IPHY2MeS+exMxcAzdyOjT30pH3uYFDcrDIgaKw6P8yZFhyShcKt69dPl0
   Ia9mg5g/5nbVf2asi0hs8KxlpiM+5SDoJ2CR5+BjGcyPv/EBwaCkmJOMB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="415734245"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200";
   d="scan'208";a="415734245"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 08:05:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1001150966"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200";
   d="scan'208";a="1001150966"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 08:05:07 -0700
Message-ID: <836c70f3-7423-4321-84cf-31f54e42b163@linux.intel.com>
Date: Wed, 11 Oct 2023 17:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] ASoC: Intel: avs: Introduce helper functions for
 SSP and TDM handling
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai
 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org
References: <20231011121703.363652-1-amadeuszx.slawinski@linux.intel.com>
 <20231011121703.363652-3-amadeuszx.slawinski@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20231011121703.363652-3-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MK6L5WRI5IEFMV5IRYQTDQM5QWRYEAYL
X-Message-ID-Hash: MK6L5WRI5IEFMV5IRYQTDQM5QWRYEAYL
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MK6L5WRI5IEFMV5IRYQTDQM5QWRYEAYL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/11/2023 2:16 PM, Amadeusz Sławiński wrote:
> In quite a few places in code there are checks for number of SSPs
> present on system, to reduce maintenance burden introduce helper
> functions allowing to get SSP and TDM from machine board configuration.
> 
> Additionally in boards we use SSP and TDM to generate quite a few
> strings, it could be done like:
> if (tdms)
> 	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d:%d-Codec",
> 		ssp_port, tdm_slot);
> else
> 	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec",
> 		ssp_port);
> 
> but quite quickly code ends up with spaghetti of similar if elses.
> Instead introduce macro which can be used to generate correct string,
> allowing to minimize code to something like:
> dl->name = devm_kasprintf(dev, GFP_KERNEL, AVS_STRING_FMT("SSP", "-Codec",
> 		ssp_port, tdm_slot));
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

And apparently we didn't catch that functions in header should be 
static, which leads to linking problems when everything is built-in, I 
will send v2 tomorrow.
