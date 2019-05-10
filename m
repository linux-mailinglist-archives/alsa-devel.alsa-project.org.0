Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D62196B6
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 04:34:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91EEB1AA6;
	Fri, 10 May 2019 04:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91EEB1AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557455649;
	bh=Z9r9crJZoT3x3ET9lUHVrN6GwOTWo6v/ZxZK37JzzoY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c7gLvHlCa3slpRLqrcoQYzCUTTROiw6LZ/KZc/kh5b/4PySENk/UECViAOsqzJIsg
	 GBgOb2hlumNiVSxI8HXmlhyJ1iDoseNHeKtKAITQiHSfsYA900mo0eSDKrFtmDGOBK
	 tYs8mK78E+YeXJzyT/B2ofij9J3mg7pA+cB3cVqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9C55F896F5;
	Fri, 10 May 2019 04:32:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 163FFF896F0; Fri, 10 May 2019 04:32:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63AABF8073C
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 04:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63AABF8073C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2019 19:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,452,1549958400"; d="scan'208";a="170173226"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga002.fm.intel.com with ESMTP; 09 May 2019 19:32:14 -0700
Received: from fmsmsx125.amr.corp.intel.com (10.18.125.40) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 9 May 2019 19:32:14 -0700
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX125.amr.corp.intel.com (10.18.125.40) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 9 May 2019 19:32:14 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.70]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.150]) with mapi id 14.03.0415.000;
 Fri, 10 May 2019 10:32:11 +0800
From: "Yang, Libin" <libin.yang@intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Takashi Iwai
 <tiwai@suse.de>
Thread-Topic: [alsa-devel] [PATCH V2] ASoC: soc-pcm: BE dai needs prepare
 when pause release after resume
Thread-Index: AQHVBUkLh5Eu02ZEH0uqF+PBAAy+/aZg5eoAgABRNwCAAUhnAIAACuuAgADfcOD//65RAIAAiOlw
Date: Fri, 10 May 2019 02:32:11 +0000
Message-ID: <96A12704CE18D347B625EE2D4A099D1952839824@SHSMSX103.ccr.corp.intel.com>
References: <1557282761-26146-1-git-send-email-libin.yang@intel.com>
 <aa0c6eea81a721f340dd1362801e49049a6620dd.camel@linux.intel.com>
 <s5htve4mymn.wl-tiwai@suse.de>
 <ac99b2fefe05833787e473cbd2327a35c02de68b.camel@linux.intel.com>
 <s5hd0krmsyy.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D19528396E1@SHSMSX103.ccr.corp.intel.com>
 <9a392d4db4e6e700cf473f6ddaab532fcf3876f2.camel@linux.intel.com>
In-Reply-To: <9a392d4db4e6e700cf473f6ddaab532fcf3876f2.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODYxMmE5ZTktZjk2Ny00MDFkLTg1MjEtMjE0MzgwMDE4MDAwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRko0OHFzTlBJWWFrMHh0UzVMVlExSXAwNCtpc0VSSHg4ZXdibWtyKzFKdDBqVjJ6RVlVSFdCNmNZbjlSZG9WSSJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "Wang, Rander" <rander.wang@intel.com>
Subject: Re: [alsa-devel] [PATCH V2] ASoC: soc-pcm: BE dai needs prepare
 when pause release after resume
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



>-----Original Message-----
>From: Ranjani Sridharan [mailto:ranjani.sridharan@linux.intel.com]
>Sent: Friday, May 10, 2019 10:03 AM
>To: Yang, Libin <libin.yang@intel.com>; Takashi Iwai <tiwai@suse.de>
>Cc: alsa-devel@alsa-project.org; Sridharan, Ranjani
><ranjani.sridharan@intel.com>; pierre-louis.bossart@linux.intel.com; Wang,
>Rander <rander.wang@intel.com>; broonie@kernel.org
>Subject: Re: [alsa-devel] [PATCH V2] ASoC: soc-pcm: BE dai needs prepare
>when pause release after resume
>
>> > >
>> > > So in the current scenario what we see is that after resuming from
>> > > S3, a pause-release action from the user results in a FE prepare()
>> > > followed by the START trigger (and not a PAUSE-RELEASE trigger).
>> > >
>> > > Libin's patch proposes to do a prepare() for the BE even in the
>> > > case of a regular pause-release. But this might not be ideal since
>> > > other drivers might have logic in the prepare() ioctl that might
>> > > end up with errors.
>> >
>> > Right.
>> >
>> > > So I am thinking maybe we can have some internal logic in the SOF
>> > > prepare() callback that will also call the BE prepare() when the
>> > > be->dpcm[stream].state is SND_SOC_DPCM_STATE_PAUSED? Would that
>> >
>> > make
>> > > sense?
>> >
>> > Yes, that would work, I guess.  Eventually this might be needed to
>> > be addressed in ALSA core side, too, but it's good to have some fix
>> > beforehand in DPCM.
>>
>> Ranjani, with "regular pause-release", do you mean pause-release
>> without S3? The prepare() is called from alsa core (pcm_native.c) in
>> S3 case.
>> Prepare() being called in pause-release after S3 is because of S3, not
>> because of pause-release. Actually, if you pause-release without S3
>> (not sure in pm-runtime case), ASoC's prepare() will not be called. So
>> dpcm_be_dai_prepare() will not be called. So you assumption of
>> "regular pause-release" calling prepare() is wrong.
>Oh yes. That's right. Thanks for pointing it out.
>In this case, the patch sounds like a good fix. Basically, you're saying that if the
>FE prepare() gets called (which happens in the case of pause-release without
>INFO_RESUME) it should also call the BE prepare(), right?

I mean as there is a S3, we need prepare() for both FE and BE.
And logically, if ASoC calls FE prepare(), it should also call BE prepare().
Otherwise, FE and BE are not synced. The behavior is unknown unless
we really know what's happening in ASoC.

>
>Takashi, what do you think?
>
>>
>> Please let me describe the flow below:
>> 1. Pause-release after S3 without RESUME_INFO
>> Prepare() -> trigger start
>> 2. pause-release without S3 without/with RESUME_INFO Trigger
>> pause-release
>
>> 3. Pause-release after S3 with RESUME_INFO Trigger resume
>Are you sure about this? A paused stream will not be suspended. So it would
>still be trigger PAUSE-RELEASE in this case?

Hum, maybe you are right. I didn't test such case. If we don't need call 
"trigger resume" even after
S3? If it triggers PAUSE-RELEASE, how can we know it is after S3 or not?
Driver may do different operations for pause release for with S3 or without S3.

Regards,
Libin

>
>Thanks,
>Ranjani
>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
