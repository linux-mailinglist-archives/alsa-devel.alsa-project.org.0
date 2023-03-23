Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F6E6C7008
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 19:12:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C76C8ECF;
	Thu, 23 Mar 2023 19:11:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C76C8ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679595139;
	bh=rUn3oqJLeZ+PcZAIu66R71ASeFhwezXaOFWYnk+LTbQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WYe7zei2tKh+3lXXtze/UlK+KTR6eqmLceYVSzWFq8xbk+ms3tyIxjSPvr3eHm0SL
	 MYs3g8q2xv730uW1FJmfG7Y4MsRZ2J5evCdrWaL1f9GE8YZZAeGJaNAbQTEG9/d0zn
	 RG1ecSNL4ptc9E5/KUXnwyQ5deNwVcLeUFdonChc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41C32F80254;
	Thu, 23 Mar 2023 19:11:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3664F802E8; Thu, 23 Mar 2023 19:11:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5A29F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 19:11:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5A29F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YIrQAwHT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679595079; x=1711131079;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rUn3oqJLeZ+PcZAIu66R71ASeFhwezXaOFWYnk+LTbQ=;
  b=YIrQAwHTzl2cFin0pkdlX2+iCzt1mx5uOYlHOpBsV4P4ab02jAWrgggG
   n7Dq62yXPnmVOCNu9xSsl7eZQNU5Pmj99apUnu/1paWfXXG2IIroZHGh6
   /kNmvtUKuIdf4dc9cYWYMTEMlAnAsxbfOyyYzdbxLbi5/jBD8E9YclFfI
   qbDc1tmZVKHhu+eXzxMPrYjIc/SkaVKGWtxiSzUtzrmeLR6f80GNy0Et5
   3X15QLk+GxIcnLqzP6Vs4q0D8DQz0Xwkxv017fiJ1FhgZaG4aBDBeFmEJ
   YDMyFHROReqfu1v0zsgsohfdueAl7B/DFhXulwYQCpnRh1++xhg4LcDIK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="319239500"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400";
   d="scan'208";a="319239500"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 11:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="682390296"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400";
   d="scan'208";a="682390296"
Received: from dsamoylo-mobl.amr.corp.intel.com (HELO [10.209.65.26])
 ([10.209.65.26])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 11:11:12 -0700
Message-ID: <5dc11c47-bae6-2f4e-4ffd-58c4f462fd68@linux.intel.com>
Date: Thu, 23 Mar 2023 13:11:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] ASoC: codecs: wsa883x: mute/unmute PA in correct
 sequence
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
 <20230323164403.6654-4-srinivas.kandagatla@linaro.org>
 <ff3eb88a-6941-4303-a4ba-17cad3842b88@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ff3eb88a-6941-4303-a4ba-17cad3842b88@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NCK5B6C7WN4UM7IDDY67VATJGUYJOL3X
X-Message-ID-Hash: NCK5B6C7WN4UM7IDDY67VATJGUYJOL3X
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, johan+linaro@kernel.org, steev@kali.org,
 dmitry.baryshkov@linaro.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCK5B6C7WN4UM7IDDY67VATJGUYJOL3X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>> +static int wsa883x_trigger(struct snd_pcm_substream *s, int cmd,
>> +			   struct snd_soc_dai *dai)
>> +{
>> +	switch (cmd) {
>> +	case SNDRV_PCM_TRIGGER_START:
>> +	case SNDRV_PCM_TRIGGER_RESUME:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +		wsa883x_digital_mute(dai, false, 0);
>> +		break;
> 
>>  static const struct snd_soc_dai_ops wsa883x_dai_ops = {
>> +	.startup = wsa883x_startup,
>>  	.hw_params = wsa883x_hw_params,
>>  	.hw_free = wsa883x_hw_free,
>> -	.mute_stream = wsa883x_digital_mute,
>> +	.trigger = wsa883x_trigger,
> 
> The trigger is run in atomic context, can you really write safely to a
> SoundWire device there?

Mark, I've seen that comment from you several times, and I wonder if I
am missing something: the triggers for SoundWire managers and dailinks
are typically nonatomic - at least for the Cadence-based solution the
trigger is based on a bank switch that may happen with a delay and with
a wait_for_completion(). Sending a command over the SoundWire channel is
also typically not atomic, there's usually a wait_for_completion() as well.
