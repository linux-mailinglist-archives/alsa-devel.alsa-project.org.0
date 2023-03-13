Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3BC6B7FC0
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 18:51:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D15A143D;
	Mon, 13 Mar 2023 18:50:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D15A143D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678729864;
	bh=Ac0J0wDsrRrQOCKOPmVPqi3IPMCeAJCrifPoOm+f26E=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ixMtmx4kIN9Q6g1Pqi87jxrp7iwDPwS0w3+Cb3IU3Cf35X9pEhmCOpe4e7hfk+a9L
	 XrOxZ6udK07ur+5vr2/h7/fP0+gTIdQe4Gkdf2pyMX6dvDeyI2Zgyd1sZinvS8EqpR
	 KbsAi1KQdEKf+e4jvYn4RrouJf+c3LlHM2eztQgg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2958F804B1;
	Mon, 13 Mar 2023 18:49:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9ACA0F80425; Mon, 13 Mar 2023 18:49:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC179F8032D
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 18:49:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC179F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IDOXYoEP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678729756; x=1710265756;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ac0J0wDsrRrQOCKOPmVPqi3IPMCeAJCrifPoOm+f26E=;
  b=IDOXYoEPmNW0SGz8W7sBJ8Pp8wui7kPfIcC9CzzVSQ6HGDegJkJCm0HD
   Hh/fL4C9NzWtWFcPCe+4DMbW2qizY82YF+C0vgxOsB1QvfJ2UH5NbvP5M
   caGzMkDaWxp5zo0LjyaY22kX4B+DWjUwy5IHPsBN8CJTIvQVZ5Lm1NMiU
   PaP9vtA0jPD1k1ynCQ/OGsaNloXtDWXzVyzMxorlfpnL14h+5JQhufxjp
   D8IotRSMkjBiOK6TZjnO8OtQ2fwwrNCpb7BpQXmvCes3Fh6Bw7+Mam9Pf
   PLLZju86+UGyHrtw/deE51ne4Xg1l1dHGlA9tLG7Jf8cWxJmah81G6cTm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="321069307"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400";
   d="scan'208";a="321069307"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 10:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="852860019"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400";
   d="scan'208";a="852860019"
Received: from jlewis8x-mobl.amr.corp.intel.com (HELO [10.255.34.75])
 ([10.255.34.75])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 10:49:07 -0700
Message-ID: <e6a96b2d-19d2-97fe-387f-cddc4abbb590@linux.intel.com>
Date: Mon, 13 Mar 2023 09:36:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH v1] ASoC: Intel: sof_rt5682: Enable Bluetooth offload on
 adl_rt1019_rt5682
Content-Language: en-US
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
References: 
 <20230310184201.1302232-1-ajye_huang@compal.corp-partner.google.com>
 <0456bd4e-cfee-b863-e02d-98084b5da0f6@linux.intel.com>
 <CALprXBamM-M-YdyfX9dQHp_AQAovcqzL5H4rMPsZPXS426+VgA@mail.gmail.com>
 <a5962d12-ccd2-79ea-27bc-674e0b3065f4@linux.intel.com>
 <CALprXBYVFWDFkT5tnrj6Ef=+ibFLoBAnCnBHtZwSThDauN=uzw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CALprXBYVFWDFkT5tnrj6Ef=+ibFLoBAnCnBHtZwSThDauN=uzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WXOMQEE7P6J463GTPUBOHLMHLRRKOHRB
X-Message-ID-Hash: WXOMQEE7P6J463GTPUBOHLMHLRRKOHRB
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>,
 dharageswari.r@intel.com, Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, alsa-devel@alsa-project.org,
 Mac Chiang <mac.chiang@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WXOMQEE7P6J463GTPUBOHLMHLRRKOHRB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/10/23 17:55, Ajye Huang wrote:
> On Sat, Mar 11, 2023 at 6:46 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
> 
>> It's best if you provide a series that enables BT offload across the
>> board for ADL, if that's the intended goal.
> Hi Pierre,
> 
>   {        .name = "adl_mx98357_rt5682",
>         .driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
>                     SOF_RT5682_SSP_CODEC(0) |
>                     SOF_SPEAKER_AMP_PRESENT |
>                     SOF_RT5682_SSP_AMP(2) |
>                     SOF_RT5682_NUM_HDMIDEV(4)),
>     },
> The "adl_mx98357_rt5682" is the sound card of the google "Brya" Board project.
> Because the SSP2 is used for the max98357 amplifier, so SSP2
> bt_offload can't be enabled at the drv_name  "adl_mx98357_rt5682".
> (The hardway layout I2S port2 connected to max98357 amplifier)
> 
> The other adl projects that enabled the bt_offload feature were
> designed with ssp1 for amp, ssp2 for bt_offload based on pins
> definition.
>     {
>         .name = "adl_rt1019_rt5682",
>         .driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
>                     SOF_RT5682_SSP_CODEC(0) |
>                     SOF_SPEAKER_AMP_PRESENT |
>                     SOF_RT1019_SPEAKER_AMP_PRESENT |
>                     SOF_RT5682_SSP_AMP(1) |
>                     SOF_RT5682_NUM_HDMIDEV(4) |
>                     SOF_BT_OFFLOAD_SSP(2) |
>                     SOF_SSP_BT_OFFLOAD_PRESENT),
>     },

ok, so for this patch:

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

I accept the argument that when SSP2 is used for the amplifier then it
can't be used for BT offload, but I still find "mtl_mx98360_rt5682"
missing BT offload.  This would need a follow-up patch or a comment if
this miss was intentional (not formally supported).

