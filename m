Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E6E39E8BF
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 22:50:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32CF0167B;
	Mon,  7 Jun 2021 22:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32CF0167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623099058;
	bh=f0/p2kacALeMN9IYPqN1QunL2jJg3HXctiD7nyGyZtg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WTnz1CHJrlPP6yoD1YoEoU4NtlryeJ50MHG1WSZxjHTsqlADj3zKurOg3pOtpi4GO
	 6AWANOAy64pllSCqlTXGi4FwO2uqItU0Kdz5hs/yL6N+nYeYp35M4aJlCujAe/Vdti
	 Y1EbTx6uvrsvu1avqnOjF0pAjjJycQ8DAmHSUV/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1829F800DF;
	Mon,  7 Jun 2021 22:49:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89C55F800DF; Mon,  7 Jun 2021 22:49:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF255F800DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 22:49:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF255F800DF
IronPort-SDR: cxHiuKPOYA541SyC3m3skzVsegrW5f3L7+wKFSl82qTGIWgvJ82Z3nber9mrd52LaJKNHPx4pf
 uL4GvNJE3fJA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="184393310"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="184393310"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 13:49:14 -0700
IronPort-SDR: UsKfiU/1QAnHdi+YVwq3nCcSR3l3GUOwA62aXB7mfPS3hJkqEt0uOBxN6F49wOEyL1vupLWw8U
 yCnLCyVEoQZA==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="401804394"
Received: from mbragatx-mobl.amr.corp.intel.com (HELO [10.212.46.134])
 ([10.212.46.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 13:49:12 -0700
Subject: Re: [PATCH 1/4] ASoC: Intel: sof_cs42l42: support JSL DAI link
 sequence
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20210606004102.26190-1-brent.lu@intel.com>
 <20210606004102.26190-2-brent.lu@intel.com>
 <2ccdffb1-e905-420e-5144-ebb8356b5518@linux.intel.com>
 <DM6PR11MB36429F4E8A6F077F8D2374F997389@DM6PR11MB3642.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a3b5d6be-17eb-088f-197c-8a0b30c2f32d@linux.intel.com>
Date: Mon, 7 Jun 2021 15:49:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB36429F4E8A6F077F8D2374F997389@DM6PR11MB3642.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, "R,
 Dharageswari" <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "Zhi,
 Yong" <yong.zhi@intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, "M,
 Naveen" <naveen.m@intel.com>, "Wang, Rander" <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Fred Oh <fred.oh@linux.intel.com>,
 "Gopal, Vamshi Krishna" <vamshi.krishna.gopal@intel.com>, "Nujella,
 Sathyanarayana" <sathyanarayana.nujella@intel.com>
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


> Cs42l42 is sharing topology with DA7219's topology source file sof-glk-da7219.m4
> on GLK platform. The configuration is:
> 
> dai link id 0 is for spk
> #SSP 1 (ID: 0) with 19.2 MHz mclk with MCLK_ID 1 (unused), 1.536 MHz blck
> DAI_CONFIG(SSP, 1, 0, SSP1-Codec,
> 
> dai link id 1 is for headphone
> #SSP 2 (ID: 1) with 19.2 MHz mclk with MCLK_ID 1, 1.92 MHz bclk
> DAI_CONFIG(SSP, 2, 1, SSP2-Codec,
> 
> dai link id 2 is for dmic
> DAI_CONFIG(DMIC, 0, 2, dmic01,
> 
> dai link id 3/4/5 is for hdmi
> DAI_CONFIG(HDA, 3, 3, iDisp1,
> DAI_CONFIG(HDA, 4, 4, iDisp2,
> DAI_CONFIG(HDA, 5, 5, iDisp3,
> 
> When on JSL, we plan to share topology with rt5682 which has different dai link
> sequence:
> sof-jsl-rt5682.m4:
> 
> dai link id 0 is for headphone
> DAI_CONFIG(SSP, 0, 0, SSP0-Codec,
> 
> dai link id 6 is for spk
> # SSP 1 (ID: 6)
> DAI_CONFIG(SSP, SPK_INDEX, 6, SPK_NAME,
> 	SET_SSP_CONFIG)
> 
> dai link id 3/4/5 is for hdmi
> # 4 HDMI/DP outputs (ID: 3,4,5)
> DAI_CONFIG(HDA, 0, 3, iDisp1,
> DAI_CONFIG(HDA, 1, 4, iDisp2,
> DAI_CONFIG(HDA, 2, 5, iDisp3,
> 
> I'm not sure if there is convention about the sequence to follow?

ok, now I get what you are trying to do.

Unfortunately there are no conventions so far, and since we have to be 
backwards-compatible with topology files already released we will need 
to deal with the different configurations in this machine driver, you're 
right about this.

The code you suggested is fine, but we can future-proof it a bit.

Instead of assuming any order depending on GLK or !GLK, we can add a BE 
'base' for headphone, amp, DMIC and DMIC each (represented as a constant 
structure) and point to different configurations depending on a quirk. 
That way we can deal with other permutations such as HP - SPK - HDMI - DMIC


