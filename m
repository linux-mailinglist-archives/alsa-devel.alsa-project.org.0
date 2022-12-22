Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0269065457F
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 18:08:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 867074EAD;
	Thu, 22 Dec 2022 18:07:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 867074EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671728879;
	bh=u5a2cKDrvv2pHodEYViduWFxE2pfrmug8VDhjI3vNs0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VsFwrIHuDnuVAqzkgoJXmrn0KqHmZH9T46LXqmb0UbTqMGD8vKwAyvc7kXsaYdO5E
	 SPvsjtUToY19xC7rdoiC9NY4zrTJLV9Bc8iSjzcq2ZFlkee5PpcNZthk+pGRYYVyzq
	 1luYbxeXCCOr+vYgF/kzpaqEWeJ/lc/d8Gy8VVG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 350AEF80544;
	Thu, 22 Dec 2022 18:05:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 194FBF8051D; Thu, 22 Dec 2022 18:05:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0949FF8045D
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 18:05:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0949FF8045D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hXW9Zmln
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671728749; x=1703264749;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=u5a2cKDrvv2pHodEYViduWFxE2pfrmug8VDhjI3vNs0=;
 b=hXW9ZmlnvzEz/CwRuJnEKNLRkZDk2RiuQdcuK4hAvgOSz/1eWWCk1DGV
 zJ5y+rt+L6cIzlELSxjXaQCwCMpzQVrO/5V7Pz/tsEm4IDucTs1r3Av5v
 QdtgC2ZQoAEz/r/6DWW4dCBbZwEeA5RWkVbCBQ0KB7zXEcD8KvjTukkPl
 8ID1bDt13LVHIdv3MVJxiOjD++nxSVR65Yp4FFlNDUc0yBVtscunYFpXh
 AQdq7FppfDS8WmMH9KCnFavOimvQc2OqK72pBDnd1zhtKuN0UM0KXH3Wg
 MAYZDyse83dr9KDhR0sbCXNS1LEB7MfAgxmfGcft5/JcnQ+NwvIs9nJ0O A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406410710"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406410710"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 09:04:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="794175781"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="794175781"
Received: from rpurdy-mobl.amr.corp.intel.com (HELO [10.212.42.91])
 ([10.212.42.91])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 09:04:05 -0800
Message-ID: <4a627876-fd7c-25a3-bbae-cbb4539f18bb@linux.intel.com>
Date: Thu, 22 Dec 2022 09:59:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] ASoC: Intel: avs: Add support for RT5663 codec
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Alicja Michalska
 <ahplka19@gmail.com>, alsa-devel@alsa-project.org, broonie@kernel.org
References: <Y6No3WsiZ7Sbg35u@tora>
 <0c48007d-5d95-4d6b-9aad-80e77bd3111f@linux.intel.com>
 <f3b81814-96ce-f54e-5df9-6a70e4c29b19@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <f3b81814-96ce-f54e-5df9-6a70e4c29b19@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 12/22/22 03:41, Amadeusz Sławiński wrote:
> On 12/21/2022 9:36 PM, Pierre-Louis Bossart wrote:
>>
>>> +static int avs_create_dai_link(struct device *dev, const char
>>> *platform_name, int ssp_port,
>>> +                   struct snd_soc_dai_link **dai_link)
>>> +{
>>> +    struct snd_soc_dai_link_component *platform;
>>> +    struct snd_soc_dai_link *dl;
>>> +
>>> +    dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
>>> +    platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
>>> +    if (!dl || !platform)
>>> +        return -ENOMEM;
>>> +
>>> +    platform->name = platform_name;
>>> +
>>> +    dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec",
>>> ssp_port);
>>> +    dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
>>> +    dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
>>> +    if (!dl->name || !dl->cpus || !dl->codecs)
>>> +        return -ENOMEM;
>>> +
>>> +    dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d
>>> Pin", ssp_port);
>>> +    dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL,
>>> "i2c-10EC5663:00");
>>> +    dl->codecs->dai_name = RT5663_DAI_NAME;
>>> +    if (!dl->cpus->dai_name || !dl->codecs->name ||
>>> !dl->codecs->dai_name)
>>> +        return -ENOMEM;
>>> +
>>> +    dl->num_cpus = 1;
>>> +    dl->num_codecs = 1;
>>> +    dl->platforms = platform;
>>> +    dl->num_platforms = 1;
>>> +    dl->id = 0;
>>> +    dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
>>> SND_SOC_DAIFMT_CBS_CFS;
>>
>> can I ask why it's necessary to hard-code the format, shouldn't this be
>> specified in the topology?
>>
>> It's a generic question for AVS machine drivers, the same code is found
>> in other cases.
>>
> 
> It describes back-end and topology describes FEs and FE and BE DSP
> configuration, machine boards describe BE configuration. Not to say that
> I didn't wonder if we can perhaps simplify things some more  and move BE
> declaration to topology and perhaps even implement generic i2s board. It
> is something to revisit.

My point is that the topology already provides the information for the
DSP configuration and this is used for the codec configuration, but
that's two pieces of information that need to match, and two things to
change if for some reason you want to use different options.
