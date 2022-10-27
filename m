Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA7960EE27
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 04:58:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE7643458;
	Thu, 27 Oct 2022 04:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE7643458
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666839489;
	bh=bf2paH8sGyUfEw1cg7Z4uilrA3dFquFMe+m0DHeulpU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QI7i8n3LjGDx6LNfCtQYJLNsVXjJqa0xNEtQqfLLefPLg19+TEjRC+DxQUGvQaqqr
	 q70HJK8nBbDATv5VGSRo8pJMpG94E68HD++I2hoH7ZSQtbvLaF1TQFCzSZuxCSkpi2
	 FmTcE5P0ugyorP8Mpkuial/mEicNg9Qg9uuSvQDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18EFEF80496;
	Thu, 27 Oct 2022 04:57:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF726F8025E; Thu, 27 Oct 2022 04:57:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCDE8F8016C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 04:57:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCDE8F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KTut5mNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666839431; x=1698375431;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bf2paH8sGyUfEw1cg7Z4uilrA3dFquFMe+m0DHeulpU=;
 b=KTut5mNrGK4xnkzp3yNNx7EaIFDY1UxxdMImV9neYVDU6KtWNjO7+Jfq
 FGm+BjSaoxiqjcAgEyvRoDglwYQD0nwNd7YZxOGz3DKcrSL/v7UTxsXIY
 Pt2Famu0eGCVVOzqsjkkCNdSNPkzEt495WS+gPmQfjLafyf9qiz2a0p9K
 hwNB3Wih1swBeOPw7+qXq3ZYi6MmFdWz3Fwqp5Z4eybbEhra+MmdVFS42
 UWyqthTEDev6lwFiLo37ku9+PqyRVQNY4nHChtNvUP4ZeJQe1YfbCXzEV
 4HAI4ozpJG+bawgMB4hf0w3xdCAOAMmBX9ClpsdDaeFO6CPpkgzyOglgH Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="306845708"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="306845708"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 19:57:05 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="632248942"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="632248942"
Received: from bcoan-mobl2.amr.corp.intel.com (HELO [10.209.189.197])
 ([10.209.189.197])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 19:57:03 -0700
Message-ID: <bba5dc19-c0c4-2409-6cd2-c8fa91950444@linux.intel.com>
Date: Wed, 26 Oct 2022 20:30:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] ASoC: Intel: sof_rt5682: quirk auto detection
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20221026071409.3235144-1-brent.lu@intel.com>
 <20221026071409.3235144-3-brent.lu@intel.com>
 <6916c126-c710-330a-ffcd-50dd3cdc47d3@linux.intel.com>
 <CY5PR11MB6257D168A60B712088BC7CF797339@CY5PR11MB6257.namprd11.prod.outlook.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CY5PR11MB6257D168A60B712088BC7CF797339@CY5PR11MB6257.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, "Song,
 Gongjun" <gongjun.song@intel.com>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "Chiang, Mac" <mac.chiang@intel.com>, "Wang, Rander" <rander.wang@intel.com>,
 "C, Balamurugan" <balamurugan.c@intel.com>,
 Chao Song <chao.song@linux.intel.com>, Mark Brown <broonie@kernel.org>, "Reddy,
 Muralidhar" <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ajye Huang <ajye.huang@gmail.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhi,
 Yong" <yong.zhi@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 10/26/22 19:13, Lu, Brent wrote:
>>
>> This is a bit confusing: this quirk does not work for Volteer
>>
>> 	{
>> 		.callback = sof_rt5682_quirk_cb,
>> 		.matches = {
>> 			DMI_MATCH(DMI_PRODUCT_FAMILY,
>> "Google_Volteer"),
>> 			DMI_MATCH(DMI_OEM_STRING, "AUDIO-
>> MAX98373_ALC5682I_I2S_UP4"),
>> 		},
>> 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
>> 					SOF_RT5682_SSP_CODEC(0) |
>> 					SOF_SPEAKER_AMP_PRESENT |
>>
>> 	SOF_MAX98373_SPEAKER_AMP_PRESENT |
>> 					SOF_RT5682_SSP_AMP(2) |
>> 					SOF_RT5682_NUM_HDMIDEV(4)),
>> 	},
> 
> I checked Volteer reference kit, it should use SSP1 for amplifier. It seems to me 
> this quirk is for some customer variants which implements MAX98373 on SSP2.
> 
>>
>> Same for Brya and all usages of SSP_AMP(2)
>>
>>
> 
> It's a compromise that Google implements amplifiers on SSP2 on Brya so they can 
> connect SDW codec to SSP1 pins, but we asked customers to implement amplifiers 
> on SSP1 to reserve BT offload capability.

I appreciate what you are trying to suggest, and I am all for trying to
put this proliferation of quirks under control, but the autodetection
based on rules seems out-of-reach if we don't first cleanup the existing
quirks.

If "volteer" and "brya" mean different things to different people, and
reference and derivatives are not well identified, the odds of
regressions seem very high to me.

> 
>>> -	{
>>> -		.name = "adl_rt1019_rt5682s",
>>> -		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
>>> -					SOF_RT5682_SSP_CODEC(0) |
>>> -
>> 	SOF_RT5682S_HEADPHONE_CODEC_PRESENT |
>>
>> and HEADPHONE_CODEC_PRESENT is not handled either.
>>
> 
> Headphone type will be detected later in the sof_audio_probe().
> 
>>> -					SOF_SPEAKER_AMP_PRESENT |
>>> -					SOF_RT1019_SPEAKER_AMP_PRESENT
>> |
>>> -					SOF_RT5682_SSP_AMP(1) |
>>> -					SOF_RT5682_NUM_HDMIDEV(4)),
>>> -	},
>>
>> Overall I doubt that the SOC alone can tell you what the quirk is.
>>
>> Maybe it's a default to avoid repeats of the same baseline configuration, but
>> there's not much else that can be infer from an SOC definition in light of the
>> creativity of our hardware friends who routinely swap interfaces.
> 
> I'm thinking about using kernel module parameters for those boards which do not
> use default SSP port allocation. Not sure it's doable for machine driver module.

That's not a working solution IMHO, the kernel parameters should be used
by expert developers only for specific and short-term debug. It's not
possible to add a dependency on kernel parameters, that would prevent a
kernel update.
