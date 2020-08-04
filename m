Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7448F23BD44
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 17:38:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E0B1166A;
	Tue,  4 Aug 2020 17:37:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E0B1166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596555487;
	bh=baQdIACpFgTosn3b8omAUf5wZxdvnmgVQzp1OPoL9Kc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lN9WzDFTBVL0cfjibQ1bKkvhn47JoC2rZINl2fC5A3ufruPH3bVqQ6VV3Iymnhrrn
	 19wqowBW92vtYmLimqBOkhTiaSi8FdXDaGOWbDll/YozVm0HUEB/Og11rcysFLsJci
	 jRZRFTc0STTnwtfSAoTaB/2lc1M+nPLETDLYn+W0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41464F80260;
	Tue,  4 Aug 2020 17:35:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A479F8015D; Tue,  4 Aug 2020 17:35:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36E8CF800B7
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 17:35:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36E8CF800B7
IronPort-SDR: M3rWva0JJBMnPwpjihnQ/n89/He5AyABM78OS429K2q89/9SUDlK1AgDftQu+UJyeRtKuPiF1T
 XY9iEtcKGGrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="150127504"
X-IronPort-AV: E=Sophos;i="5.75,434,1589266800"; d="scan'208";a="150127504"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2020 08:35:42 -0700
IronPort-SDR: JpDZzfp+0iIkXsi8g7rRgEZzjD9nahjbHNdVjADLj0+eMaV568fu/6U0GZlTecg4lcA9B0BwDU
 rRZdPfLw5rVg==
X-IronPort-AV: E=Sophos;i="5.75,434,1589266800"; d="scan'208";a="288602863"
Received: from gggmerek-mobl.amr.corp.intel.com (HELO [10.212.131.193])
 ([10.212.131.193])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2020 08:35:40 -0700
Subject: Re: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
To: "Lu, Brent" <brent.lu@intel.com>, Takashi Iwai <tiwai@suse.de>
References: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
 <1596198365-10105-1-git-send-email-brent.lu@intel.com>
 <1596198365-10105-3-git-send-email-brent.lu@intel.com>
 <s5h5za3ajvb.wl-tiwai@suse.de>
 <DM6PR11MB3642AE90DF98956CCEDE6C2F974F0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <s5hd04a90o4.wl-tiwai@suse.de>
 <DM6PR11MB3642B5BC2E1E0708088526D8974D0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <63bca214-3434-16c6-1b60-adf323aec554@linux.intel.com>
 <DM6PR11MB3642D9BE1E5DAAB8B78B84B0974D0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <s5hpn873by6.wl-tiwai@suse.de>
 <DM6PR11MB36423A9D28134811AD5A911F974A0@DM6PR11MB3642.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6466847a-8aae-24f7-d727-36ba75e95f98@linux.intel.com>
Date: Tue, 4 Aug 2020 09:24:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB36423A9D28134811AD5A911F974A0@DM6PR11MB3642.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yuhsuan@google.com" <yuhsuan@google.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Damian van Soelen <dj.vsoelen@gmail.com>
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



On 8/3/20 11:33 PM, Lu, Brent wrote:
>>
>> For avoid further misunderstanding: it's fine that CRAS *uses* such a short
>> period.  It's often required for achieving a short latency.
>>
>> However, the question is whether the driver can set *only* this value for
>> making it working.  IOW, if we don't have this constraint, what actually
>> happens?  If the driver gives the period size alignment, wouldn't CRAS
>> choose 240?
> 
> It won't. Without the constraint it becomes 432. Actually CRAS does not set
> period size specifically so the value depends on the constraint rules.

I don't get this. If the platform driver already stated 240 and 960 
samples why would 432 be chosen? Doesn't this mean the constraint is not 
applied?

> [   52.011146] sound pcmC1D0p: hw_param
> [   52.011152] sound pcmC1D0p:   ACCESS 0x1
> [   52.011155] sound pcmC1D0p:   FORMAT 0x4
> [   52.011158] sound pcmC1D0p:   SUBFORMAT 0x1
> [   52.011161] sound pcmC1D0p:   SAMPLE_BITS [16:16]
> [   52.011164] sound pcmC1D0p:   FRAME_BITS [32:32]
> [   52.011167] sound pcmC1D0p:   CHANNELS [2:2]
> [   52.011170] sound pcmC1D0p:   RATE [48000:48000]
> [   52.011173] sound pcmC1D0p:   PERIOD_TIME [9000:9000]
> [   52.011176] sound pcmC1D0p:   PERIOD_SIZE [432:432]
> [   52.011179] sound pcmC1D0p:   PERIOD_BYTES [1728:1728]
> [   52.011182] sound pcmC1D0p:   PERIODS [474:474]
> [   52.011185] sound pcmC1D0p:   BUFFER_TIME [4266000:4266000]
> [   52.011188] sound pcmC1D0p:   BUFFER_SIZE [204768:204768]
> [   52.011191] sound pcmC1D0p:   BUFFER_BYTES [819072:819072]
> [   52.011194] sound pcmC1D0p:   TICK_TIME [0:0]
> 
> Regards,
> Brent
> 
>>
>>
>> Takashi
> 
> 
