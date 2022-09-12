Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E37835B59DE
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 14:03:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E3216E8;
	Mon, 12 Sep 2022 14:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E3216E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662984181;
	bh=cOz4LC+vVivuX8Ts3PVkxuMj1HkgIMBETXMOxkFJ1pg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gGdAlK4RFNW2LiEGHyKtORSbxHD8jsA7Cp4XRoJ4QC6+k18fLgxB4phd+Nt1lohnY
	 ozQJSjted/5vyVfCaE2qh9Gcs6lr67tBQ6VpDSVSio4R1R32RKZNR3ghXI80tL56P6
	 txNV93PEwC2JKaORWXBd2nvY0YReBwyfyvYQA7Q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80607F8030F;
	Mon, 12 Sep 2022 14:00:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64AD4F8056F; Mon, 12 Sep 2022 14:00:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DB85F8030F
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 14:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DB85F8030F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kyg2n/PE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662984034; x=1694520034;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cOz4LC+vVivuX8Ts3PVkxuMj1HkgIMBETXMOxkFJ1pg=;
 b=kyg2n/PEDv1rAJqWlrWJXG3a0m9JbPEmYN+yk4F/fWYmhuGXTnXxmvKR
 VUGOiJmpilCNxfJKDeJP+VGhHWh+Sf/jyMWtE4A0KjVQf4sTWSheXSbIz
 iKpmpVsJ5kX6kQzS/GRTDhp0sGg+aE+Rra1GSEqaezSGZEbU7T0p1TLrs
 cb9joMwD9FZXRl/Juxlb8B3wQv+nByyyBhA6Axnxazw4CV8lx+3YEiBLU
 lc1ZuAiFfUqBDxk36xgN6lSAOBuko7CeoDlm0kWrwru68Wv5g41y5NmK+
 vaGrKuFh0i8rkiEXdn4+zOH2HslUGB8vOhWNuUNtk+WNIT1ut1Ef6PE/D Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="359570576"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="359570576"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 05:00:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="705126666"
Received: from vtsymbal-mobl.ger.corp.intel.com (HELO [10.252.32.67])
 ([10.252.32.67])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 05:00:26 -0700
Message-ID: <00ffdd42-2cb6-112e-3bb5-b9ef1105fc4f@linux.intel.com>
Date: Mon, 12 Sep 2022 13:49:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: Intel: sof_rt5682: Add support for
 jsl_rt5682_rt1019
Content-Language: en-US
To: "Lu, Brent" <brent.lu@intel.com>,
 Sean Hong <sean.hong@quanta.corp-partner.google.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
References: <20220816075424.1245593-1-sean.hong@quanta.corp-partner.google.com>
 <f6baa98e-af46-7ca8-397a-2e762cd444c6@linux.intel.com>
 <CY5PR11MB6257F0C029B0C9325A8AC443977F9@CY5PR11MB6257.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CY5PR11MB6257F0C029B0C9325A8AC443977F9@CY5PR11MB6257.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
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



On 9/5/22 10:07, Lu, Brent wrote:
> 
>> On 8/16/22 09:54, Sean Hong wrote:
>>> This patch adds the driver data for rt5682 support jsl_rt5682_rt1019.
>>>
>>> Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
>>> ---
>>>  sound/soc/intel/boards/sof_rt5682.c               |  9 +++++++++
>>>  sound/soc/intel/common/soc-acpi-intel-jsl-match.c | 12 ++++++++++++
>>>  2 files changed, 21 insertions(+)
>>>
>>> diff --git a/sound/soc/intel/boards/sof_rt5682.c
>>> b/sound/soc/intel/boards/sof_rt5682.c
>>> index 045965312..3a840f3a9 100644
>>> --- a/sound/soc/intel/boards/sof_rt5682.c
>>> +++ b/sound/soc/intel/boards/sof_rt5682.c
>>> @@ -1100,6 +1100,15 @@ static const struct platform_device_id
>> board_ids[] = {
>>>  					SOF_RT5682_SSP_AMP(1) |
>>>  					SOF_RT5682_NUM_HDMIDEV(4)),
>>>  	},
>>> +	{
>>> +		.name = "jsl_rt5682_rt1019",
>>> +		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
>>> +					SOF_RT5682_MCLK_24MHZ |
>>
>> I see it's the same setting for all JSL devices but I am having doubts on this
>> MCLK.  Is this 24MHz value correct for JSL? It's derived from ICL so in theory
>> the MCLK should be a multiple of 19.2MHz if the root frequency was the
>> oscillator.
>>
>> Is this intentional?
>>
> 
> I've checked some internal wiki page and sof git log. It seems the first amp enabled
> on JSL is max98373 running in TDM 4 slot 100fs so 24MHz MCLK seems to be a
> reasonable choice. The commis is 5340225a7 ("topology: Add JSL da7219+max98373 support")
> 
> +# SSP 1 (ID: 0)
> +DAI_CONFIG(SSP, SPK_INDEX, 0, SPK_NAME,
> +       SSP_CONFIG(DSP_B, SSP_CLOCK(mclk, 24000000, codec_mclk_in),
> +               SSP_CLOCK(bclk, 4800000, codec_slave),
> +               SSP_CLOCK(fsync, 48000, codec_slave),
> +               SSP_TDM(4, 25, 3, 240),
> +               SSP_CONFIG_DATA(SSP, SPK_INDEX, 16)))
> 
> I've also tested 19.2MHz on JSL boards and it also works. 1K sinetone playback sounds ok.
> Since JSL boards are using 2.304 MHz bclk for max98360a and 3.072 MHz bclk for alc1015 now,
> changing to 19.2 MHz mclk seems no benefit.

Functionally there should be no difference, but the 24 MHz MCLK can only
be created on JSL from the 96 MHz HDaudio PLL while the 19.2 MHz can be
divided from the oscillator.

I guess it's too late to optimize now that the topology files are in use
so here is my Ack:

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


but that's a clear miss in the topology reviews.

