Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A57A76308A
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 10:54:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63466828;
	Wed, 26 Jul 2023 10:53:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63466828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690361678;
	bh=PxDicZJ47k7fLyihuTdsIFJca8l83vYwixZmuwu3kYk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t7YqNMk1fb+/eRRAZ/hnffXegIcUp7tjzguG9RebQ9QHTP8xYP2r9vSOEKVl9w2yp
	 Zuy7jJgixmIuoakRhQEcB9sn/vJMySbFeJBYDoxPyimBeRI7IywW5ite9gG75Jy564
	 I0MO9TpktqtPOSrBPMTT2WMh/wcC3t/aoP/PCuss=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCCEBF80153; Wed, 26 Jul 2023 10:53:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27A3BF80153;
	Wed, 26 Jul 2023 10:53:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B3FBF8019B; Wed, 26 Jul 2023 10:53:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97D17F800C7
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 10:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97D17F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OIGI7d1Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690361590; x=1721897590;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PxDicZJ47k7fLyihuTdsIFJca8l83vYwixZmuwu3kYk=;
  b=OIGI7d1Zj6qLCr9Qwv+V6jcvbzQcgBx2GE3Cfgz6rG/5P1MRADDbeLDV
   7m3coDm5sqLjHk1pumLYitbfs7k3dn0MmIfFxiiBOP+p96lAh4zyaV/20
   Nm3KX0Y7/pItYIVkSSjmcDbtj2ZAfCsw717eM3YrG5PK1baFAoE6y9vJw
   VnCqcR8of2rdaNdNP7j9/hCKZGGc9b7Zx1LS35X4FdpHwNxInr9V8XlP6
   4kVKFx2NgsfDo/yaUxhiqYUxLA4j0NuQNTqWA15so4fONP659XBJvG8oW
   hIuEJRtCDjQ6d2OCgmgkylt4OoQdEdk3Ok9Hd5y6KWEE2pN4L+BcwwgTL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352858671"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200";
   d="scan'208";a="352858671"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 01:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="816584916"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200";
   d="scan'208";a="816584916"
Received: from kgerlich-mobl.ger.corp.intel.com (HELO [10.252.35.173])
 ([10.252.35.173])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 01:52:57 -0700
Message-ID: <9e8892cd-4c31-61a2-94e0-379e576cb7d6@linux.intel.com>
Date: Wed, 26 Jul 2023 10:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] ASoC: Intel: maxim-common: get codec number from
 ACPI
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 "Zhi, Yong" <yong.zhi@intel.com>, Terry Cheong <htcheong@chromium.org>,
 "Bhat, Uday M" <uday.m.bhat@intel.com>, "Chiang, Mac"
 <mac.chiang@intel.com>, "R, Dharageswari" <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230726140848.2267568-1-brent.lu@intel.com>
 <20230726140848.2267568-2-brent.lu@intel.com>
 <7349d6f4-4866-6fb3-57c9-9ce2d6989576@linux.intel.com>
 <CY5PR11MB625741E8CCBA25EAA82739579700A@CY5PR11MB6257.namprd11.prod.outlook.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CY5PR11MB625741E8CCBA25EAA82739579700A@CY5PR11MB6257.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GQBXIE3GM4PKP6BCJTWBQQ2ZS3TY45D5
X-Message-ID-Hash: GQBXIE3GM4PKP6BCJTWBQQ2ZS3TY45D5
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQBXIE3GM4PKP6BCJTWBQQ2ZS3TY45D5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/26/23 10:33 AM, Lu, Brent wrote:
> 
>>>    const struct snd_soc_dapm_route max_98373_dapm_routes[] = { @@
>>> -168,17 +181,6 @@ static struct snd_soc_codec_conf max_98390_codec_conf[]
>> = {
>>>    		.dlc = COMP_CODEC_CONF(MAX_98390_DEV1_NAME),
>>>    		.name_prefix = "Left",
>>>    	},
>>> -};
>>> -
>>> -static struct snd_soc_codec_conf max_98390_4spk_codec_conf[] = {
>>> -	{
>>> -		.dlc = COMP_CODEC_CONF(MAX_98390_DEV0_NAME),
>>> -		.name_prefix = "Right",
>>> -	},
>>> -	{
>>> -		.dlc = COMP_CODEC_CONF(MAX_98390_DEV1_NAME),
>>> -		.name_prefix = "Left",
>>> -	},
>>
>> if you remove the codec conf, doesn't this impact the Kcontrols names?
>> Does this break existing UCM files?
>>
>> It's rather hard to review with just the diff.
>>
> 
> I just merge two arrays, max_98373_dapm_routes and max_98390_4spk_codec_conf,
> since the first two entries are the same.

Routes and codec conf are different things, not following how you can 
merge them?

Wondering if you are referring to a different array, i.e.

static struct snd_soc_codec_conf max_98390_codec_conf[]
	
static struct snd_soc_codec_conf max_98390_4spk_codec_conf[]

> 
> Later in max_98390_set_codec_conf() function we will set the num_configs with
> number of amplifiers.
> 
> void max_98390_set_codec_conf(struct snd_soc_card *card)
> {
> 	unsigned int num_codecs = get_num_codecs(MAX_98390_ACPI_HID);
> 
> 	card->codec_conf = max_98390_codec_conf;
> 
> 	switch (num_codecs) {
> 	case 2:
> 	case 4:
> 		card->num_configs = num_codecs;
> 
> Regards,
> Brent
> 

