Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAC66CB781
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 08:53:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 525101F7;
	Tue, 28 Mar 2023 08:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 525101F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679986379;
	bh=S1YBIVF/bROWcOlbmPASl12Ayt/yfUb1s8mC0/TBz7M=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OiG3FPx6YBoVzg/71wncBm/TncuYpwSx/vXkq2dVVaNa0cHdmeTXNJzs1G3GSKJJh
	 FXGqx6hlOIro4VmJ3w+4CP9+25qDmVXDWXA2G6aBTBQKPGAIS0tWIpbB1ODNSJmBqV
	 si7hZnrukhu8gtLx4wzq7SsZWgneLE/r5LOH4HHU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1BA3F8024E;
	Tue, 28 Mar 2023 08:52:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8F54F80272; Tue, 28 Mar 2023 08:49:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 510D0F8021D
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 08:49:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 510D0F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=g88lsSLQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679986160; x=1711522160;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=S1YBIVF/bROWcOlbmPASl12Ayt/yfUb1s8mC0/TBz7M=;
  b=g88lsSLQ48yzr2y/c883osPqFz/y3e5eZPL17lmbvnSAB73kHEIrjgYZ
   1TOCpE9S11yxoZTL8DCXKQyQMuzIuXgy7yhu5g0DswdmakblQ5i8mDf0k
   tUTQZo0haS7mE+ppix9eAPVwDt63HfnEfDiTUIRnZaKIIp0TDkYAkXhZK
   1ntZKZimOfNFGLlcPrV07/ml+G9G/ft5a6ahgUbFG1WUeDu9EYBTChMWQ
   UFFmNYm0vnOg2s7fq/qhA82mIUtCLJhLTzq4h/4p6wtsSzWrt7v/YCxDD
   nrnnwcKksjEm2j9eRyvpAiEL3lZ/sVIKMy/PDVLxtObGreFHJlc04nrUs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="405422862"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400";
   d="scan'208";a="405422862"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 23:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="1013429168"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400";
   d="scan'208";a="1013429168"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO [10.249.32.113])
 ([10.249.32.113])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 23:49:14 -0700
Message-ID: <e254ea09-1ea7-0317-b227-17a2ab79de02@linux.intel.com>
Date: Tue, 28 Mar 2023 09:49:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/4] ASoC: soc-topology.c: remove unnecessary
 dai_link->platform
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87pm8zjd0t.wl-kuninori.morimoto.gx@renesas.com>
 <87jzz7jczp.wl-kuninori.morimoto.gx@renesas.com>
 <5eb5c8e5-a6ad-2522-1b53-5f927a3a7d8c@linux.intel.com>
 <87r0t9g4t4.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87r0t9g4t4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PBDDDPUROFEZLCD345QJAXYKNWOBELFJ
X-Message-ID-Hash: PBDDDPUROFEZLCD345QJAXYKNWOBELFJ
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBDDDPUROFEZLCD345QJAXYKNWOBELFJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Morimoto-san,

On 28/03/2023 02:20, Kuninori Morimoto wrote:
> 
> Hi Peter
> 
> Thank you for your feedback.
> 
>>> @@ -1694,11 +1694,9 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
>>>  
>>>  	link->cpus	= &dlc[0];
>>>  	link->codecs	= &dlc[1];
>>> -	link->platforms	= &dlc[2];
>>>  
>>>  	link->num_cpus	 = 1;
>>>  	link->num_codecs = 1;
>>> -	link->num_platforms = 1;
>>>  
>>>  	link->dobj.index = tplg->index;
>>>  	link->dobj.type = SND_SOC_DOBJ_DAI_LINK;
>>> @@ -1726,8 +1724,6 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
>>>  	link->codecs->name = "snd-soc-dummy";
>>>  	link->codecs->dai_name = "snd-soc-dummy-dai";
>>>  
>>> -	link->platforms->name = "snd-soc-dummy";
>>> -
>>
>> I think this patch is incorrect and should be reverted (I have received
>> a note from a SOF developer).
>> The link->cpus->dai_name is not necessarily "snd-soc-dummy", it is set
>> earlier:
>> if (strlen(pcm->dai_name)) {
>> 	link->cpus->dai_name = devm_kstrdup(tplg->dev, pcm->dai_name,
>> 					    GFP_KERNEL);
>> 	if (!link->cpus->dai_name) {
>> 		ret = -ENOMEM;
>> 		goto err;
>> 	}
>> }
>>
>> We cannot be sure that it is the same component, in fact it is most like
>> not.
> 
> But sorry, I don't understand the point.
> This patch removed dummy PLATFORM which is not necessary I think,
> but you are talking about CPU.

The patch removes the dummy platform with a justification that if the
CPU name and the platform name is identical, then the platform name does
not need to be set.

But in this case the CPU name and the platform name is _not_ identical,
they are different and we need to have the dummy platform on the FE side
unconditionally.

> Could you please explain more detail what is the problem ?

snd_sof:sof_dai_load: sof-audio-pci-intel-tgl 0000:00:1f.3: tplg: load
pcm HDMI1
sof-audio-pci-intel-tgl 0000:00:1f.3: error: no platforms
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: FE link loading failed
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: topology: could not load
header: -22
sof-audio-pci-intel-tgl 0000:00:1f.3: error: tplg component load failed -22
sof-audio-pci-intel-tgl 0000:00:1f.3: error: failed to load DSP topology -22
sof-audio-pci-intel-tgl 0000:00:1f.3: ASoC: error at
snd_soc_component_probe on 0000:00:1f.3: -22
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: failed to instantiate
card -22
skl_hda_dsp_generic: probe of skl_hda_dsp_generic failed with error -22

which should look like this ideally:

snd_sof:sof_dai_load: sof-audio-pci-intel-tgl 0000:00:1f.3: tplg: load
pcm HDMI1
snd_sof:sof_dai_load: sof-audio-pci-intel-tgl 0000:00:1f.3: tplg: load
pcm HDMI2
snd_sof:sof_dai_load: sof-audio-pci-intel-tgl 0000:00:1f.3: tplg: load
pcm HDMI3
snd_sof:sof_dai_load: sof-audio-pci-intel-tgl 0000:00:1f.3: tplg: load
pcm HDA Analog
snd_sof:sof_dai_load: sof-audio-pci-intel-tgl 0000:00:1f.3: tplg: load
pcm DeepBuffer


> 
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto

-- 
Péter
