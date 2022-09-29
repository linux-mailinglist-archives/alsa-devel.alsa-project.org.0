Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 862A25EF29F
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 11:49:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B625B15E0;
	Thu, 29 Sep 2022 11:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B625B15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664444970;
	bh=URHxb8lU81RnkvovOLqWHu3JtwNm+uTnov0gAOxG9/M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gQzNBwra6Oa0t3aZuWisz+BdH1I9whPspFzOsVLODRzWPXkhZiCh1QY3Q9OZgfO53
	 JbmVxvsBHtiOu2iyoDzkXgCJfwq0Bfty1hYMLHZPQ/zpldG9IoZOpYagTy26mCJ7r+
	 UTBZnaKxyWK4zDLXrvS/RuSNuGr1Dg9gtoFX0mBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BEEEF803DD;
	Thu, 29 Sep 2022 11:48:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5506F8023A; Thu, 29 Sep 2022 11:48:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B74DF800AA
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 11:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B74DF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dfSpCvmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664444906; x=1695980906;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=URHxb8lU81RnkvovOLqWHu3JtwNm+uTnov0gAOxG9/M=;
 b=dfSpCvmUrKAsA9MudGXusjEADbev34+k+Vs/VEI099QpeYdCO+vc71Oy
 uVr36nu/ULfr+TfpcKeV6bCqPEPF2xyrEsj9qjtjY2ub1Jid9S1aC7Ux3
 TKI4JFkwOxS+8eF/sDRTdtdIdn5LjcZlLqS/ZKua/1C3YpwCg9RrXhxIJ
 SWK4sU8YG8mqV3PmmBd+a0BeereCSVVo958GuhVsQYKQ6gSyAPSW3l8nv
 CLzfAp+z8l7RKftzJuOnqowdDrv7Lqvzsw9PX1r4aYBAuVyYmy/3Sy6s/
 0cO3mZyzojTZs4JpnVYg7ri3Tstb4l5dJM1WTqEWd9XuLiSfb4WFFt7QR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="363691952"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="363691952"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 02:48:22 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="690754011"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="690754011"
Received: from crijnder-mobl.ger.corp.intel.com (HELO [10.251.211.131])
 ([10.251.211.131])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 02:48:18 -0700
Message-ID: <3bddff5a-78ed-a3fa-841c-2f2f6a8f8bbb@linux.intel.com>
Date: Thu, 29 Sep 2022 10:39:26 +0200
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
 <d94a9abd-95ca-09ba-ab24-e4c38b832678@linux.intel.com>
 <CY5PR11MB6257AF53395DDF069A43D28E97579@CY5PR11MB6257.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CY5PR11MB6257AF53395DDF069A43D28E97579@CY5PR11MB6257.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Ajye Huang <ajye.huang@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "Chiang, Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, "Gopal,
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



On 9/29/22 08:25, Lu, Brent wrote:
>>>
>>> I think TDM slot number is possible but not TX/RX mask. What we have
>>> in topology is union of tx/rx mask of all channels. We don't know the
>>> mask of specific channel in DAI_CONFIG.
>>>
>>> DAI_CONFIG(SSP, 0, BOARD_HP_BE_ID, SSP0-Codec,
>>>         SSP_CONFIG(I2S, SSP_CLOCK(mclk, 19200000, codec_mclk_in),
>>>                 SSP_CLOCK(bclk, 2400000, codec_slave),
>>>                 SSP_CLOCK(fsync, 48000, codec_slave),
>>>                 SSP_TDM(2, 25, 3, 3),
>>
>> the 3 3 is precisely the channel mask!
>>
> 
> Yes, but what we need in the hw_params() is the mask for individual channel,
> like 0x1 for left and 0x2 for right.

Ah yes, you're talking about the mask configuration on the codec side,
sorry I was confused with your reference to DAI_CONFIG. That would be
platform-level information, not DSP topology information indeed.

Sounds good then, thanks for the explanations.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

