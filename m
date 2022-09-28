Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 376885ED80A
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 10:40:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD7B184A;
	Wed, 28 Sep 2022 10:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD7B184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664354441;
	bh=V5ZHsDB6wcD9KRT2A0rLXsENvTTm9TvpXoN0E3+EoAs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UCcCJxjUFF6jxArDkXcVNnSDkfKurPKSA1jQWiRoi6qiyVXcMnuTiWQkiV8r8iDrG
	 ZFc7jPkthVYHbXxdbJ2OnHw9IoJ413+xVSPFftg0Ezn3nkpiRPaUH/s1lPuse2ykww
	 c31n3r7x68dsLO+vq4InX/dIHEykg/x/tyoZzCug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40BB2F80310;
	Wed, 28 Sep 2022 10:39:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28593F80310; Wed, 28 Sep 2022 10:39:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B03CFF800AA
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 10:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B03CFF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="b1DScQke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664354377; x=1695890377;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=V5ZHsDB6wcD9KRT2A0rLXsENvTTm9TvpXoN0E3+EoAs=;
 b=b1DScQke46UkK65CIyjdRq5KiFveHEb2gfm2JyCIwRfOgNj0JT5tQODq
 8YrT4Jf95Cuh7hYDyqNib9xbuFghLN1IA/+2Lo+KLUIc58S4RePoAx9pX
 mYhCYqvHpJd8PNdVxyPtcKkqnTNF/9D0aRjW33Jv098BecFt4loLRJ/pj
 Cr20oz1s58N1Ti8NcMTrWP3SYaLhsLaB1z0invu5tz3A0wNaWpbCToLby
 Gn1xybg+mFR3FWZAlQeHMGY10v1AWcJYdzeJK24k/+y8laZ0z0+PyQtCT
 CvjdI1O/WT7t9bg3hue0gXN3yhUmn2t2ccN890ZtWv0XOv4GiIPAhnSY+ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="288701807"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="288701807"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 01:39:30 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="617131390"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="617131390"
Received: from morank-mobl3.ger.corp.intel.com (HELO [10.251.211.7])
 ([10.251.211.7])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 01:39:25 -0700
Message-ID: <d94a9abd-95ca-09ba-ab24-e4c38b832678@linux.intel.com>
Date: Wed, 28 Sep 2022 10:38:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: remove
 SOF_RT1015_SPEAKER_AMP_100FS flag
Content-Language: en-US
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20220913074906.926774-1-brent.lu@intel.com>
 <2577e4db-8593-cf37-135b-aa51b6268cd7@linux.intel.com>
 <CY5PR11MB6257A5CC3976FAEA2C713A4997559@CY5PR11MB6257.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CY5PR11MB6257A5CC3976FAEA2C713A4997559@CY5PR11MB6257.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Ajye Huang <ajye.huang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "Chiang,
 Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>, "Zhi,
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



On 9/27/22 15:16, Lu, Brent wrote:
>>> +		case SND_SOC_DAIFMT_DSP_A:
>>> +		case SND_SOC_DAIFMT_DSP_B:
>>> +			/* 4-slot TDM */
>>> +			ret = snd_soc_dai_set_tdm_slot(codec_dai,
>>> +						       rt1015_tdm_mask[i].tx,
>>> +						       rt1015_tdm_mask[i].rx,
>>> +						       4,
>>> +						       params_width(params));
>>
>> The changes look ok, just wondering if we can avoid hard-coding those 4 values.
>> Can we not get the number of TDM slots from topology and/or dailink
>> configuration?
>>
>>
> 
> I think TDM slot number is possible but not TX/RX mask. What we have in topology
> is union of tx/rx mask of all channels. We don't know the mask of specific channel in
> DAI_CONFIG.
> 
> DAI_CONFIG(SSP, 0, BOARD_HP_BE_ID, SSP0-Codec,
>         SSP_CONFIG(I2S, SSP_CLOCK(mclk, 19200000, codec_mclk_in),
>                 SSP_CLOCK(bclk, 2400000, codec_slave),
>                 SSP_CLOCK(fsync, 48000, codec_slave),
>                 SSP_TDM(2, 25, 3, 3),

the 3 3 is precisely the channel mask!

>                 SSP_CONFIG_DATA(SSP, 0, 24, 0, 0, 0, SSP_CC_BCLK_ES)))')
> 
> Regards,
> Brent
> 
