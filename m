Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6D95713CD
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 10:01:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5B7D15F2;
	Tue, 12 Jul 2022 10:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5B7D15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657612886;
	bh=XXz3aa2aC2vSQAHcR+WNJs9TRR4YGBOBs/Xr1Spf5gg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b9ZeHs5sPd7+P0VW1PSZCcfc5bXt+liul3lqZdeu1tzrOjH/EioUl0wO9JOBaux5K
	 OyX28m+T8lj8rUPxVKXwsTTI4MOyIp1a5u6nq7MgrL33Mah91oa+EZlWwjdsg7MURD
	 Us3cbIXwYXLpBqoGPRz13sZV0VmcyhizM6aSm590=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45C0DF80279;
	Tue, 12 Jul 2022 10:00:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A768F80246; Tue, 12 Jul 2022 10:00:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E583AF800E8
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 10:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E583AF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WN9sSDUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657612821; x=1689148821;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XXz3aa2aC2vSQAHcR+WNJs9TRR4YGBOBs/Xr1Spf5gg=;
 b=WN9sSDUBI3olOp5I2KgI4pyeTpKFXSkDfKfb74kl9uh9aTKwc9/VMujp
 IyQAcDS4Nlsyusi02zJWTPqRIc04F9qSXEIBmuDqdLex3QpP/rkIsjxTS
 gEAL2la+yVipGbSepQ671wLugeOUdpbNPrPSvGC1SQdOStLIBJ61Jz3y+
 zAGGZOAdqZkU1JX1CCpHhzsIdGBcUkwTgFP56KiIQ+C4xA5RVnSjI2HTT
 I2YnWNe7bDIUM85sT7K4NCgN37MTExUuwRMb3hcB0QgjGQD/qhUHkE5Ag
 ZpFQ8mgeMa/YzqLD4gVyR6WHcDYgRdTgfLNOzYLXUd73CAQpjNoHOLogQ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="267905687"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="267905687"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 01:00:05 -0700
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="684684108"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO [10.249.254.175])
 ([10.249.254.175])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 00:59:41 -0700
Message-ID: <48a9865b-9cf8-f99a-235f-565da9c0529d@linux.intel.com>
Date: Tue, 12 Jul 2022 11:00:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: Sound not working after commit
 bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Alex Natalsson <harmoniesworlds@gmail.com>
References: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
 <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
 <CADs9LoN-L0X1Dr1sP2K7xrcWm7dpHW6MhF47c2eBB0moLNnPRQ@mail.gmail.com>
 <18d3e724-e43f-c166-e322-26cc5e3890b7@linux.intel.com>
 <CADs9LoOZjK=cUuNSEELtgxYoA+yHVFKM_Y9YLcY74smqx8XsjQ@mail.gmail.com>
 <c554b69c-0c73-158d-85d8-95a0375babeb@linux.intel.com>
 <CADs9LoOOOXVC0p8R=b1y+Kfb1+ESEyMaVe9eoW=F5gdp0_GitQ@mail.gmail.com>
 <c4d32547-5f99-595e-21d3-fdb22a1af237@linux.intel.com>
 <CADs9LoNMuwbiSfgF1buDoY6=ecpR-BuZvTgXbFxe3qyL1=roUQ@mail.gmail.com>
 <CADs9LoOJu-NYxPhDL+N+xBtocPNw2y0nRHbSaO-NmGO284GPfA@mail.gmail.com>
 <b3e3d969-606f-dede-0319-7b8ed2a975f7@linux.intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <b3e3d969-606f-dede-0319-7b8ed2a975f7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 11/07/2022 17:33, Pierre-Louis Bossart wrote:
> 
> 
> On 7/9/22 06:19, Alex Natalsson wrote:
>>>> +       if (!fe_substream) {
>>>> +               dev_err(fe->dev, "%s: fe_substream not initialized\n",
>>>> __func__);
>>>> +               return -EINVAL;
>>>> +       }
>>>> +       if (!be_substream) {
>>>> +               dev_err(be->dev, "%s: be_substream not initialized\n",
>>>> __func__);
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>
>> Will be this in upstream or needing bugzilla reporting message?
> I created a patch based on this, see
> https://github.com/thesofproject/linux/pull/3735
> 
> I am not sure however if this is the 'right' fix. There was a comment
> from Peter Ujfalusi that a BE substream may be initialized later, but if
> that's the case then the atomicity check that was introduced is done in
> the wrong location.

fwiw, the dpcm_apply_symmetry() have this check at line 1822:

/* A backend may not have the requested substream */
if (!be_substream)
	continue;

both dpcm_be_connect() and dpcm_apply_symmetry() are called via
dpcm_fe_dai_open() line 2736-2739:

/* calculate valid and active FE <-> BE dpcms */
dpcm_process_paths(fe, stream, &list, 1);

ret = dpcm_fe_dai_startup(fe_substream);

dpcm_fe_dai_open -> dpcm_process_paths -> dpcm_add_paths > dpcm_be_connect

dpcm_fe_dai_open -> dpcm_fe_dai_startup -> dpcm_apply_symmetry

If the check was added by
6246f283d5e02 ("ASoC: dpcm: skip missing substream while applying symmetry")

It looks like that it is not uncommon to not have be_substream at this
point...

> Takashi, we could use your guidance here.
> Thanks
> -Pierre

-- 
Péter
