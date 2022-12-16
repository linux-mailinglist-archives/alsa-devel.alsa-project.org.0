Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1EA64F285
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 21:42:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 602E616FC;
	Fri, 16 Dec 2022 21:41:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 602E616FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671223366;
	bh=yXW+wV+UgSM2VSneYgwaMavVBMwnnak5JNaby2zZkUY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dVqeDOoY+aWULLzoyoARVZTvRTEjoTUw+Fq4sNh0SwkOAdhTw80/JvSa95xQg5rcl
	 KlCvh/Gar+bR32yXJbCfmfn+GQdy/UL6gpnpxGhZqXA0aa7o4bOwQtmmPJ47l93Coh
	 busDzQgWttF0j3XofVfcmt0LiGh/CPSGZdhKibKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE3FAF80578;
	Fri, 16 Dec 2022 18:37:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 931AAF80571; Fri, 16 Dec 2022 18:37:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AE45F8056F
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 18:37:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AE45F8056F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NIUP04Wu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671212225; x=1702748225;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yXW+wV+UgSM2VSneYgwaMavVBMwnnak5JNaby2zZkUY=;
 b=NIUP04WujA/bmM8U0ekYddzlcD70QYJ1lsF/R2IGLmq2ayliN6BL3B0A
 S2HvY/Wk1aSt4DWH5+fwVX8trvAdnV7udjop1IPvM3mBx3/+f8Qu2fp+Y
 1qNp5Zui5p6MdZ9NHY0hC7B8Ch+yVCQUjhngKCM6l+3eAGrcPaGL/BwRz
 4pnWT62phzt8v798ycKpN9owDm2UVuVrA/xfQvie/J3qh+3EZadpcsM0l
 Givo8bBQn4n8mjAPBrZNgph0DrTIZJI1JIyBKVIZhkypAzpRNNotzxowi
 xBhLNvymIwvytNIN9Q4ALZ4JBIYt3wEbNVccx9d3Iby2jyFVyaw/wS8YR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="383352493"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="383352493"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 09:36:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="651997543"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="651997543"
Received: from krojasle-mobl.amr.corp.intel.com (HELO [10.209.187.31])
 ([10.209.187.31])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 09:36:57 -0800
Message-ID: <9aa4bffd-bc7e-0e40-3063-5ce80b5fbe9a@linux.intel.com>
Date: Fri, 16 Dec 2022 11:36:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2] ASoC: Intel: sof_nau8825: add variant with nau8318
 amplifier.
Content-Language: en-US
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
References: <20221216154938.9426-1-ajye_huang@compal.corp-partner.google.com>
 <b0612bbd-2eba-36cf-9c29-7542cf32adfd@linux.intel.com>
 <CALprXBYy9_ax8-xfh0paB59Pn=TB7yVLwtY8vnT_-y5vWd867w@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CALprXBYy9_ax8-xfh0paB59Pn=TB7yVLwtY8vnT_-y5vWd867w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Libin Yang <libin.yang@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, "balamurugan . c" <balamurugan.c@intel.com>,
 Mark Brown <broonie@kernel.org>, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, David Lin <CTLIN0@nuvoton.com>,
 alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/16/22 10:55, Ajye Huang wrote:
> Hi Pierre
> 
> On Sat, Dec 17, 2022 at 12:03 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
> 
>> On 12/16/22 09:49, Ajye Huang wrote:
>>> This patch adds the driver data for two nau8318 speaker amplifiers on
>>> SSP1 and nau8825 on SSP0 for ADL platform.
>>
>> So here you are making reference to two amplifiers...
>>
>>> +static struct snd_soc_dai_link_component nau8318_components[] = {
>>> +     {
>>> +             .name = "NVTN2012:00",
>>> +             .dai_name = "nau8315-hifi",
>>> +     }
>>> +};
>>
>> but here there's only one? I was expecting something like what we've
>> used for Maxim amplifiers with a codec configuration and dailink
>> components that list the two amplifiers.
>>
>> static struct snd_soc_codec_conf max_98373_codec_conf[] = {
>>         {
>>                 .dlc = COMP_CODEC_CONF(MAX_98373_DEV0_NAME),
>>                 .name_prefix = "Right",
>>         },
>>         {
>>                 .dlc = COMP_CODEC_CONF(MAX_98373_DEV1_NAME),
>>                 .name_prefix = "Left",
>>         },
>> };
>>
>> struct snd_soc_dai_link_component max_98373_components[] = {
>>         {  /* For Right */
>>                 .name = MAX_98373_DEV0_NAME,
>>                 .dai_name = MAX_98373_CODEC_DAI,
>>         },
>>         {  /* For Left */
>>                 .name = MAX_98373_DEV1_NAME,
>>                 .dai_name = MAX_98373_CODEC_DAI,
>>         },
>> };
>>
>> Or is this a commit message problem and there's really only one amplifier?
> 
> Really , it has two speakers.  The nau8318 is an auto mode Amplifier
> chip, similar to the max98360a amp chip.
> EX: Sof_maxim_common.c (sound\soc\intel\boards):
> static struct snd_soc_dai_link_component max_98360a_components[] = {
>     {
>         .name = MAX_98360A_DEV0_NAME,
>         .dai_name = MAX_98357A_CODEC_DAI,
>     }
> };
> It is not an i2c interface,  from the nau8318 data sheet, there are
> five pins used mainly. one for enable, others for I2S.
> EN-- enable pin
> FSR-- Frame Sync, Right
> FSL--  Frame Sync, Left
> BCLK--  bit clock
> DACIN-- Input i2s data
> 
> The FSR and FSL pins are for Left and Right channels used.
> thanks

Ok, thanks for the explanations.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
