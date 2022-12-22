Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2012653D98
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 10:42:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 630B339EF;
	Thu, 22 Dec 2022 10:41:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 630B339EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671702134;
	bh=VGFTnbrcRHhkHQWaEBT2PXR3gDExOSSHWmINXxQpI2E=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SsZNwsRXN8uvjkFc2IEzfB8YPNIlZWbvDnKm2MiurGhKwbpjxzgezxMHUinpNK3Td
	 yDzAiJnCjTD8WylfjfxjmGdR+p5tekzK6uMSTYho/tW3ila3UgK/41k97GOMuP55kb
	 HbLYOOfJtyv2xKMeZxV9Y6vaKb89EyeAu20T1jHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0635CF8024D;
	Thu, 22 Dec 2022 10:41:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECDC5F8024D; Thu, 22 Dec 2022 10:41:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC466F8024D
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 10:41:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC466F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NTBro8KC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671702074; x=1703238074;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VGFTnbrcRHhkHQWaEBT2PXR3gDExOSSHWmINXxQpI2E=;
 b=NTBro8KCaCQErfVGJsQu/w1jn9NYt2DxGAXaJdpBF6wt0CUDH5b5Z/Ne
 fQsWcz856PInpH7UKeVc5DKVsfYgC2VXRIc/7BGrQyT5MtnJTHwFW+pFI
 gKInXOUo4Nr52XUw8fLz8cPd/gNFbUtBd4sht8jQ03GeUkpZqQY+sYdY+
 c4kRDc+fiixNKG0ykk3vbnSll0elStQ3TjXioOgWhQr5hTu6PWwSDgl/f
 NvAbW1zFVjQfzGbdjEjZb4DSM5frpUYQ/A6r/O1b5U5cQMJOFATyNrrKZ
 vOYECji0z3kxl+j0IWLm6zsLzZgeUUmPNa1+06JIb8ppF1VklRhx2a5Ny w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="382317486"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="382317486"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 01:41:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="758887492"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="758887492"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 01:41:07 -0800
Message-ID: <f3b81814-96ce-f54e-5df9-6a70e4c29b19@linux.intel.com>
Date: Thu, 22 Dec 2022 10:41:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ASoC: Intel: avs: Add support for RT5663 codec
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Alicja Michalska <ahplka19@gmail.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <Y6No3WsiZ7Sbg35u@tora>
 <0c48007d-5d95-4d6b-9aad-80e77bd3111f@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <0c48007d-5d95-4d6b-9aad-80e77bd3111f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: cezary.rojewski@intel.com, upstream@semihalf.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, cujomalainey@chromium.org,
 lma@semihalf.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 12/21/2022 9:36 PM, Pierre-Louis Bossart wrote:
> 
>> +static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
>> +			       struct snd_soc_dai_link **dai_link)
>> +{
>> +	struct snd_soc_dai_link_component *platform;
>> +	struct snd_soc_dai_link *dl;
>> +
>> +	dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
>> +	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
>> +	if (!dl || !platform)
>> +		return -ENOMEM;
>> +
>> +	platform->name = platform_name;
>> +
>> +	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_port);
>> +	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
>> +	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
>> +	if (!dl->name || !dl->cpus || !dl->codecs)
>> +		return -ENOMEM;
>> +
>> +	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
>> +	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-10EC5663:00");
>> +	dl->codecs->dai_name = RT5663_DAI_NAME;
>> +	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
>> +		return -ENOMEM;
>> +
>> +	dl->num_cpus = 1;
>> +	dl->num_codecs = 1;
>> +	dl->platforms = platform;
>> +	dl->num_platforms = 1;
>> +	dl->id = 0;
>> +	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
> 
> can I ask why it's necessary to hard-code the format, shouldn't this be
> specified in the topology?
> 
> It's a generic question for AVS machine drivers, the same code is found
> in other cases.
> 

It describes back-end and topology describes FEs and FE and BE DSP 
configuration, machine boards describe BE configuration. Not to say that 
I didn't wonder if we can perhaps simplify things some more  and move BE 
declaration to topology and perhaps even implement generic i2s board. It 
is something to revisit.

