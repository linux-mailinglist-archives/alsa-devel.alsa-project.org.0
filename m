Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 022D97E274D
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Nov 2023 15:43:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6936F950;
	Mon,  6 Nov 2023 15:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6936F950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699281818;
	bh=Blf0199Gw4mvSrXSKGGBH3/GGxGUXwzOd/XtE3qOLdM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qGM1mZdOuzv6bRsnLXsKPye/2FAoawpDeCXqeQWbJ/SkRxjWoMf14cUqi+J6Ekb3g
	 L6HJqd3rBEkCTbreLNkqQplaG4pK60yh+/WeUpSZE21gzF+qxwoNCnyUl17ajMKn6i
	 9OFhfzyjmiAxvQMACJiQLIEssjcOiLbykVmtIrcw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D421F800ED; Mon,  6 Nov 2023 15:42:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3E20F80563;
	Mon,  6 Nov 2023 15:42:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62724F80567; Mon,  6 Nov 2023 15:42:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7346FF800ED
	for <alsa-devel@alsa-project.org>; Mon,  6 Nov 2023 15:42:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7346FF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eBJmI5Xy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699281723; x=1730817723;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=Blf0199Gw4mvSrXSKGGBH3/GGxGUXwzOd/XtE3qOLdM=;
  b=eBJmI5XyP4l0n2l304Hzr0QPauUTagyNbmHDL52En9+N2ZMGZZf2T/gz
   zRdE+BTYHUl8DKqiY5UT6zgQuuOVvBwVEujUdCw9FhHCKlwF1q0Zu4r3z
   /VgPYPNfLdfLsHbXpDTEp+lTQhLWAfVb3c4yf2ZuCasjzQDpg/4vA08YE
   TzmCcy4nIZvpcBdFDdhChlukvS7dt/BlVOWd9oWPymWtlPX7D8l0uu5kH
   qyNBt5DQY1i9CcWfjlRR2jyPRxzH+Dj4G7IMW3uOBsk9jWzV7qQRjZVNh
   qoj/zJ7pbgcwEPeVxEGPMr663ZyPCxPrerDZvnkKtI5hhZTMniQY5Jn+8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="379677761"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200";
   d="scan'208";a="379677761"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 06:41:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="1093799387"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200";
   d="scan'208";a="1093799387"
Received: from dpidwerb-mobl.amr.corp.intel.com (HELO [10.209.77.27])
 ([10.209.77.27])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 06:41:56 -0800
Message-ID: <df6715a5-9e8d-4cbd-a654-2a18a021ff99@linux.intel.com>
Date: Fri, 3 Nov 2023 10:29:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soundwire: qcom: drop unneeded DAI .set_stream
 callback
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20231025144601.268645-1-krzysztof.kozlowski@linaro.org>
 <322002af-09e8-4d4c-bc85-81654c6b5f9d@linux.intel.com>
 <7af13415-ca58-4084-9aea-f805cf266bb8@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <7af13415-ca58-4084-9aea-f805cf266bb8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VABIX2NS3UBXIESLG7ZPON7CSXLHUD3L
X-Message-ID-Hash: VABIX2NS3UBXIESLG7ZPON7CSXLHUD3L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VABIX2NS3UBXIESLG7ZPON7CSXLHUD3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> Qualcomm Soundwire controller drivers do not support multi-link setups,
>>> so DAI .set_stream() callback will not be used.  What's more, if called
>>> it will overwrite the sdw_stream_runtime runtime set in DAI .startup
>>> (qcom_swrm_startup()) causing issues (unsupported multi-link error) when
>>> two Soundwire controllers are passed as codec DAIs.
>>
>> This last sentence is confusing at best.
>>
>> A controller can have one or more managers, each of whom can have one or
>> more peripherals.
>>
>> only peripherals should expose codec DAIs, managers should expose CPU DAIs.
>>
>> Put differently, the controller is the host part while the peripheral is
>> the codec part. "controllers passed as codec DAIs" is not really
>> possible, or this was a typo?
> 
> No, it wasn't a typo. Take a look here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts#n1023
> 
> The <&swr0 0> is the controller, although probably I should call it
> manager, but in case of Qualcomm I think they are 1-to-1.

Is this a case where the SoundWire manager is part of a codec?

In that case, how are the SoundWire peripheral modeled?

The .set_stream callback was really meant to be used when you have a CPU
DAI for the manager and a codec DAI for the peripheral(s). This seems to
be a different configuration where CPU and codec DAIs are mixed.
