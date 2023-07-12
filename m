Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD5F750451
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 12:21:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D44C31F6;
	Wed, 12 Jul 2023 12:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D44C31F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689157301;
	bh=tY/BfVTFYGugQI0lJy+CeErN+l4YRI6ixdTewpDFRCY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jsDCUqq9+EEIsuq96yRA9QpxZzLSPwvy+UjxQYLB4vNEV6JoQRph5sWUa/tLN3Hjz
	 e+dC9qZVzrsxBDoydxgmLBI6efrHxYRbGBMLflPziWc/LGjSTA7QB2+hrVnQF/xdYp
	 MURqlDuG6YAmb5OJAdVoeAUNieOi9KAyX6UpoAQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 404B2F800D2; Wed, 12 Jul 2023 12:20:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4036F800D2;
	Wed, 12 Jul 2023 12:20:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC3C8F80249; Wed, 12 Jul 2023 12:20:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 278FAF800D2
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 12:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 278FAF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LPORpcgL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689157238; x=1720693238;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tY/BfVTFYGugQI0lJy+CeErN+l4YRI6ixdTewpDFRCY=;
  b=LPORpcgLpClTxDeZLYhIQ62EZaIL/cc13VcAt8de/u78mxZH7gYYtWej
   EB+1sy3B47+iHmSaPp55GBxV8CUaPHpg5TNDZ9cxpi7OnmYoi6rtp5fzR
   0xlwDZpYSiN8Lbdu3XaV9+BSOAg8k0fCEEIE3Om88WpFJe1jgAegKBWH3
   xYnWQV12zi4nrVItHx9/eOJ8WLg24oaVUKuFuMveMUBX/f2JFGdrcM6Pr
   kDiZKvUo57SvfojQ3nhBKameQ+XebKCdKvnusS2lQMkPbFbOyT02Nou6r
   P4e4r/s7l/TA4kDB4wxesCDXW64ONDy5spJuV/l0mzRjl5mj6mH7DZ91U
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="354759618"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200";
   d="scan'208";a="354759618"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 03:20:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="866070621"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200";
   d="scan'208";a="866070621"
Received: from hoermank-mobl.ger.corp.intel.com (HELO [10.252.42.188])
 ([10.252.42.188])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 03:20:26 -0700
Message-ID: <ab085fff-ade7-02b1-22e0-acba8e6c1846@linux.intel.com>
Date: Wed, 12 Jul 2023 12:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v3] ASoC: Intel: sof_rt5682: add jsl_rt5650 board config
Content-Language: en-US
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, "Zhi, Yong" <yong.zhi@intel.com>,
 "Bhat, Uday M" <uday.m.bhat@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Arnd Bergmann <arnd@arndb.de>, "Song, Gongjun" <gongjun.song@intel.com>,
 Terry Cheong <htcheong@chromium.org>, "Chiang, Mac" <mac.chiang@intel.com>,
 "R, Dharageswari" <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230712100855.272467-1-brent.lu@intel.com>
 <2e9a5d5b-f637-1f9a-b500-03f9c151dc26@linux.intel.com>
 <CY5PR11MB6257F77DBF1D123FAD0DF4689736A@CY5PR11MB6257.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CY5PR11MB6257F77DBF1D123FAD0DF4689736A@CY5PR11MB6257.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6Y3YSYNSUEWETLTX3BJ4SLYKXNWSLWNA
X-Message-ID-Hash: 6Y3YSYNSUEWETLTX3BJ4SLYKXNWSLWNA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6Y3YSYNSUEWETLTX3BJ4SLYKXNWSLWNA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/12/23 08:15, Lu, Brent wrote:
>>> +	{
>>> +		.id = "10EC5650",
>>> +		.drv_name = "jsl_rt5650",
>>> +		.machine_quirk = snd_soc_acpi_codec_list,
>>> +		.quirk_data = &rt5650_spk,
>>> +		.sof_tplg_filename = "sof-jsl-rt5650-dual.tplg",
>>
>> what does 'dual' mean in this context? it's not something we've used before
>> so a comment would be needed IMHO.
>>
>> two DAIs, two codecs?
> 
> Dual I2S. Should we remove it? Just sof-jsl-rt5650.tplg?

that would be my preference, we have lots of configurations with 2 I2S
and never mention it in the topology file name. 'dual' sounds more
confusing than helping here.

The rest of the patch is fine.
