Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B81AE585
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 10:30:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED84C1664;
	Tue, 10 Sep 2019 10:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED84C1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568104201;
	bh=LpaFv9dLdOlcOED2nrF+dZ435M5dnlqVU3VJDkFZhoA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=umUbNnzk90dwGALBDZe0umwzMwoHxVwjP993k3SXwZa8JGz1pYS+mAEg8K+DtplGY
	 ls/4ogy+bp+eLOZCHFeirQth+r7RSty+MwLCWNrEyALBFvmFrMlMieqXjt5f6Mn9z7
	 iD4+124egkFKfRn5qMi7NORYPH1urlOrlO4UlkhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59778F80321;
	Tue, 10 Sep 2019 10:28:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF4CEF80368; Tue, 10 Sep 2019 10:28:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D957F800E9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 10:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D957F800E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 01:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="359743313"
Received: from pgsmsx111.gar.corp.intel.com ([10.108.55.200])
 by orsmga005.jf.intel.com with ESMTP; 10 Sep 2019 01:28:02 -0700
Received: from pgsmsx108.gar.corp.intel.com ([169.254.8.125]) by
 PGSMSX111.gar.corp.intel.com ([169.254.2.128]) with mapi id 14.03.0439.000;
 Tue, 10 Sep 2019 16:28:01 +0800
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH] ASoC: bdw-rt5677: channel constraint support
Thread-Index: AQHVZFJP8PyrEMjcjUeZpcb0xW/mNqceLbmAgASxdDCAAEEEgIABJDyg
Date: Tue, 10 Sep 2019 08:28:00 +0000
Message-ID: <CF33C36214C39B4496568E5578BE70C7402CB9AC@PGSMSX108.gar.corp.intel.com>
References: <1567733058-9561-1-git-send-email-brent.lu@intel.com>
 <391e8f6c-7e35-deb4-4f4d-c39396b778ba@linux.intel.com>
 <CF33C36214C39B4496568E5578BE70C7402C9EA2@PGSMSX108.gar.corp.intel.com>
 <29b9fd4e-3d78-b4a3-e61a-c066bf24995a@linux.intel.com>
In-Reply-To: <29b9fd4e-3d78-b4a3-e61a-c066bf24995a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzRiNDM3ZDQtMjI2OC00NGUzLThlYjktY2FhOWVhMGE3MDA3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNndmTjNkMFd6M1BaTjE1dW9Vd2REd2YyMzFoQktQZFZIRzNVYmpXRHJ3Sm5IM3JpenBLY3ZrRUhMVkNZVVBNbyJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "yang.jie@linux.intel.com" <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH] ASoC: bdw-rt5677: channel constraint
 support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> -----Original Message-----
> From: Pierre-Louis Bossart [mailto:pierre-louis.bossart@linux.intel.com]
> Sent: Tuesday, September 10, 2019 1:53 AM
> To: Lu, Brent <brent.lu@intel.com>; alsa-devel@alsa-project.org
> Cc: Rojewski, Cezary <cezary.rojewski@intel.com>;
> kuninori.morimoto.gx@renesas.com; linux-kernel@vger.kernel.org;
> yang.jie@linux.intel.com; tiwai@suse.com; liam.r.girdwood@linux.intel.com;
> broonie@kernel.org; tglx@linutronix.de
> Subject: Re: [alsa-devel] [PATCH] ASoC: bdw-rt5677: channel constraint
> support
> 
> Please don't top-post on public mailing lists.
> 
> > We are working on a backport 3.14 branch for Chrome projects based on
> BDW platform. In the branch 4-channel capture is supported on some
> platforms but not all. So we need to add a constraint in the machine driver
> for machines don't support this feature.
> >
> > I checked the for-next branch in the broonie repo. The channels_max of
> HSW_PCM_DAI_ID_SYSTEM is 4 for capture stream so I think it would have
> same issue like google's backport tree. I didn't find any constraint for this dai.
> Would you point out where it is?
> >
> > 		.capture = {
> > 			.stream_name = "Analog Capture",
> > 			.channels_min = 2,
> > 			.channels_max = 4,
> > 			.rates = SNDRV_PCM_RATE_48000,
> > 			.formats = SNDRV_PCM_FMTBIT_S24_LE |
> SNDRV_PCM_FMTBIT_S16_LE,
> > 		},
> 
> ok, I missed this capture case indeed, but when I look at the Chrome
> 3.14 code I don't see this constraint being added, and we already have an
> ssp0_fixup function where 2 channels only are used.
> 
> 	/* The ADSP will covert the FE rate to 48k, stereo */
> 	rate->min = rate->max = 48000;
> 	channels->min = channels->max = 2;
Yes I noticed it, but the channel max number returned by snd_pcm_hw_params_any() 
is still 4 for the port "Capture PCM" so I add a constraint to the FE dai.

> 
> I also don't see any case where we support 4 channels in any broadwell
> machine driver?
It's the bdw-rt5650.c which only exists in chrome's 3.14 branch supporting Buddy 
project. They submitted the machine driver but not yet merged.

https://patchwork.kernel.org/patch/11050985/

> 
> So again can you point me to an issue or existing backport that requires the
> patch below. Not trying to be obtuse but we should only change older
> platforms when there is evidence that a change is needed.
The story is Chrome has a tool called alsa_conformance_test which runs capture or 
playback against a PCM port with all possible configurations (channel, format, rate) 
then measure if the sample rate is correct. Since the channel max number reported 
is 4, it tests the 4-channel 48K capture and reports the actual sample rate is 24000 
instead of 48000. That's the reason we want to add a constraint in machine driver to 
avoid user space programs trying to do 4 channel recording since this machine does 
not support it in the beginning.


> 
> -Pierre
> 
> >
> > Regards,
> > Brent Lu
> >
> > -----Original Message-----
> > From: Pierre-Louis Bossart
> > [mailto:pierre-louis.bossart@linux.intel.com]
> > Sent: Friday, September 6, 2019 10:21 PM
> > To: Lu, Brent <brent.lu@intel.com>; alsa-devel@alsa-project.org
> > Cc: Rojewski, Cezary <cezary.rojewski@intel.com>;
> > liam.r.girdwood@linux.intel.com; yang.jie@linux.intel.com;
> > broonie@kernel.org; perex@perex.cz; tiwai@suse.com;
> > kuninori.morimoto.gx@renesas.com; tglx@linutronix.de;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [alsa-devel] [PATCH] ASoC: bdw-rt5677: channel constraint
> > support
> >
> > On 9/5/19 8:24 PM, Brent Lu wrote:
> >> BDW boards using this machine driver supports only stereo capture and
> >> playback. Implement a constraint to enforce it.
> >
> > Humm, can you clarify what problem/error this patch fixes?
> >
> > There are already constraints on the hsw_dais[] where the channels are
> stereo only.
> >
> > Thanks
> > -Pierre
> >
> >>
> >> Signed-off-by: Brent Lu <brent.lu@intel.com>
> >> ---
> >>    sound/soc/intel/boards/bdw-rt5677.c | 33
> +++++++++++++++++++++++++++++++++
> >>    1 file changed, 33 insertions(+)
> >>
> >> diff --git a/sound/soc/intel/boards/bdw-rt5677.c
> >> b/sound/soc/intel/boards/bdw-rt5677.c
> >> index 4a4d335..a312b55 100644
> >> --- a/sound/soc/intel/boards/bdw-rt5677.c
> >> +++ b/sound/soc/intel/boards/bdw-rt5677.c
> >> @@ -22,6 +22,8 @@
> >>
> >>    #include "../../codecs/rt5677.h"
> >>
> >> +#define DUAL_CHANNEL 2
> >> +
> >>    struct bdw_rt5677_priv {
> >>    	struct gpio_desc *gpio_hp_en;
> >>    	struct snd_soc_component *component; @@ -245,6 +247,36 @@
> static
> >> int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
> >>    	return 0;
> >>    }
> >>
> >> +static const unsigned int channels[] = {
> >> +	DUAL_CHANNEL,
> >> +};
> >> +
> >> +static const struct snd_pcm_hw_constraint_list constraints_channels = {
> >> +	.count = ARRAY_SIZE(channels),
> >> +	.list = channels,
> >> +	.mask = 0,
> >> +};
> >> +
> >> +static int bdw_fe_startup(struct snd_pcm_substream *substream) {
> >> +	struct snd_pcm_runtime *runtime = substream->runtime;
> >> +
> >> +	/*
> >> +	 * On this platform for PCM device we support,
> >> +	 * stereo
> >> +	 */
> >> +
> >> +	runtime->hw.channels_max = DUAL_CHANNEL;
> >> +	snd_pcm_hw_constraint_list(runtime, 0,
> SNDRV_PCM_HW_PARAM_CHANNELS,
> >> +					   &constraints_channels);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static const struct snd_soc_ops bdw_rt5677_fe_ops = {
> >> +	.startup = bdw_fe_startup,
> >> +};
> >> +
> >>    /* broadwell digital audio interface glue - connects codec <--> CPU */
> >>    SND_SOC_DAILINK_DEF(dummy,
> >>    	DAILINK_COMP_ARRAY(COMP_DUMMY()));
> >> @@ -273,6 +305,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] =
> {
> >>    		},
> >>    		.dpcm_capture = 1,
> >>    		.dpcm_playback = 1,
> >> +		.ops = &bdw_rt5677_fe_ops,
> >>    		SND_SOC_DAILINK_REG(fe, dummy, platform),
> >>    	},
> >>
> >>
> >
> > _______________________________________________
> > Alsa-devel mailing list
> > Alsa-devel@alsa-project.org
> > https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
