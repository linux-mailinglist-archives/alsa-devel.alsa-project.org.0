Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E12AC1AEAB
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 03:11:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 652CF170E;
	Mon, 13 May 2019 03:11:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 652CF170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557709911;
	bh=cFF/kBpP8xmOzdutYISUxXS4595iavcLEJpSHobKFHY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VYO8VEUy5cHACt22I617e2xi1WnMCo322jDAFpvL8Q2dnpQFHefOhNJAHDgKKGOz2
	 AE0kbd+2MIJdC03DhdhrnA9H7sM4+yxYoILtAFrrrpmX8gA0moLaPtdYhlDW10QZzk
	 yMostHBxEw78iyr53HEmVUSM+OUy4DrevXE7nXZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8B1BF89673;
	Mon, 13 May 2019 03:10:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D7D2F896B6; Mon, 13 May 2019 03:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19458F8961A
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 03:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19458F8961A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 May 2019 18:09:57 -0700
X-ExtLoop1: 1
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga001.jf.intel.com with ESMTP; 12 May 2019 18:09:57 -0700
Received: from fmsmsx123.amr.corp.intel.com (10.18.125.38) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 12 May 2019 18:09:56 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 fmsmsx123.amr.corp.intel.com (10.18.125.38) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 12 May 2019 18:09:56 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.70]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.136]) with mapi id 14.03.0415.000;
 Mon, 13 May 2019 09:09:53 +0800
From: "Yang, Libin" <libin.yang@intel.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [alsa-devel] [PATCH V2] ASoC: soc-pcm: BE dai needs prepare
 when pause release after resume
Thread-Index: AQHVBUkLh5Eu02ZEH0uqF+PBAAy+/aZg5eoAgABRNwCAAMS6MIAEpxMAgAGfIQA=
Date: Mon, 13 May 2019 01:09:52 +0000
Message-ID: <96A12704CE18D347B625EE2D4A099D195283A385@SHSMSX103.ccr.corp.intel.com>
References: <1557282761-26146-1-git-send-email-libin.yang@intel.com>
 <aa0c6eea81a721f340dd1362801e49049a6620dd.camel@linux.intel.com>
 <s5htve4mymn.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D1952838E47@SHSMSX103.ccr.corp.intel.com>
 <20190512080756.GI21483@sirena.org.uk>
In-Reply-To: <20190512080756.GI21483@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOWNlMTkxOTUtNzhiNS00OTdiLTg3NGEtZjBhNTQ1MmQwY2UyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibDRMN0RnYk9FamJvT2h1TmdSUUNqSHdTeXhMdmdRNVdwMkxrMlpGejNDVTA1VGZpWXVWcTBNeG1KYmJxbVwvOXgifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, "Wang,
 Rander" <rander.wang@intel.com>
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

Hi Mark,

>-----Original Message-----
>From: Mark Brown [mailto:broonie@kernel.org]
>Sent: Sunday, May 12, 2019 4:08 PM
>To: Yang, Libin <libin.yang@intel.com>
>Cc: Takashi Iwai <tiwai@suse.de>; Ranjani Sridharan
><ranjani.sridharan@linux.intel.com>; alsa-devel@alsa-project.org; Sridharan,
>Ranjani <ranjani.sridharan@intel.com>; pierre-louis.bossart@linux.intel.com;
>Wang, Rander <rander.wang@intel.com>
>Subject: Re: [alsa-devel] [PATCH V2] ASoC: soc-pcm: BE dai needs prepare
>when pause release after resume
>
>On Thu, May 09, 2019 at 02:30:39AM +0000, Yang, Libin wrote:
>
>> I think this may be a ASoC FE-BE defect.
>> In this case, ASoC will call FE dai prepare(), but it will not call BE
>> dai prepare() because of the judgement. This is why I made the patch.
>
>If it's calling only the front end but not the back end that definitely sounds like
>DPCM is causing trouble again.

Yes. This is caused by dpcm_be_dai_prepare(). dpcm_be_dai_prepare()
should call BE dai prepare() in the case of pause release after S3.
But as the be->dpcm[stream].state is SND_SOC_DPCM_STATE_PAUSED,
it will not call BE dai prepare.

Regards,
Libin

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
