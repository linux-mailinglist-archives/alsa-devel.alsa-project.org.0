Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C27DC74965A
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 09:26:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44E50741;
	Thu,  6 Jul 2023 09:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44E50741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688628401;
	bh=d/JeGf4O7nqV9K0UCQyS7h7C0MLtL6IXNPzF10Io+yo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dTTAwMU14N6ZPcbt8nE4vw9LrJmJeJCPkf42caGbDawSNETTu3e7VzBYeTE5R5JAw
	 nXRWxd3m7n11CuSiT3zObx8MsaBa5tedFbe+9/KnIGNchmCRTzOg2ZA4ixe/eQfWtS
	 3I8W6xy7uGZ+xhzhY6NcDIePB1mjl702pdESU20E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6B6DF80124; Thu,  6 Jul 2023 09:25:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CF4CF80124;
	Thu,  6 Jul 2023 09:25:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55494F80125; Thu,  6 Jul 2023 09:25:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8451EF800E4
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 09:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8451EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=m68a8qkC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688628341; x=1720164341;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=d/JeGf4O7nqV9K0UCQyS7h7C0MLtL6IXNPzF10Io+yo=;
  b=m68a8qkCWsLN1u+/hnNxZYdsehVyffc2fgQZEyQQJebKhhgs4B/LNiTL
   ixYs67afyFX0W74FNJXODaBaBZmJ41yMoaIuc3aNnvsTlzoD26elYFztq
   tFabBdiFp87o9/E3qVCFR8YsruzmsdbGQ4LExuOSXAo5hdpNIV0Ed1ax7
   Es/x6KzmiwM/0YFEby19xjF4IrIzqPdGgkkhoT55rkCB88us1Y+x25SHB
   KyQtDGQUmXqn1/dtPHgzVzwOerGIDnVa/EIrnlJsPvSiSlUzGcN6r97az
   P/SR8rHVMXNEtuBmet0c5Qcf85MhVjxM/PFeQQyzE+ZcLa7b7BMLdybWc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="363556030"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200";
   d="scan'208";a="363556030"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 00:25:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="713450911"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200";
   d="scan'208";a="713450911"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 00:25:29 -0700
Message-ID: <f464d5b1-c708-4b3f-f1d1-031c5def5b38@linux.intel.com>
Date: Thu, 6 Jul 2023 09:25:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/8] ASoC: topology: suppress probe deferral errors
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Alex Elder <elder@linaro.org>
References: <20230705123018.30903-1-johan+linaro@kernel.org>
 <20230705123018.30903-8-johan+linaro@kernel.org>
 <ac232872-734f-d192-d46c-555ebe3625c5@linux.intel.com>
 <ZKZbzctgLpV-67hJ@hovoldconsulting.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ZKZbzctgLpV-67hJ@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S34H47D7WIFJN7TMSAEB6VHP47MJ66RT
X-Message-ID-Hash: S34H47D7WIFJN7TMSAEB6VHP47MJ66RT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S34H47D7WIFJN7TMSAEB6VHP47MJ66RT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/6/2023 8:14 AM, Johan Hovold wrote:
> On Wed, Jul 05, 2023 at 05:07:22PM +0200, Amadeusz Sławiński wrote:
>> On 7/5/2023 2:30 PM, Johan Hovold wrote:
>>> Suppress probe deferral error messages when loading topologies and
>>> creating frontend links to avoid spamming the logs when a component has
>>> not yet been registered:
>>>
>>>       snd-sc8280xp sound: ASoC: adding FE link failed
>>>       snd-sc8280xp sound: ASoC: topology: could not load header: -517
>>>
>>> Note that dev_err_probe() is not used as the topology component can be
>>> probed and removed while the underlying platform device remains bound to
>>> its driver.
>>
>> I'm not sure that I understand that argument... what's wrong with
>> dev_err_probe(tplg->dev, err, "ASoC: adding FE link failed\n");
>> instead of
>> dev_err(tplg->dev, "ASoC: adding FE link failed\n");
>> ?
> 
> In short, it is not correct to use dev_err_probe() here as this is not a
> probe function.
> 
> dev_err_probe() is tied to driver core and will specifically allocate
> and associate an error message with the struct device on probe
> deferrals, which is later freed when the struct device is bound to a
> driver (or released).
> 

I guess you mean call to: device_set_deferred_probe_reason(dev, &vaf);
perhaps functionality could be extended to allow to skip this call and 
just do prints? Or just add separate dev_err_defer function without this 
step, although it would be best if they could share parts of code.

