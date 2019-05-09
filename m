Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 795AE183CC
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 04:32:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EC99183C;
	Thu,  9 May 2019 04:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EC99183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557369157;
	bh=JKCL28andOhtpLkjmuOC+ZHvzdxO9uq68WXLp+USToA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DIheopZhS0opxbifbRpUZTr3iaWfAQ2TUHEwIrV2ghMNeobB2RPYHZ3riEFpSwhkA
	 hb2wypI/rzXkSIxXNX8OB5jU5FrgpzeYimwTVZcqgPBSsLqsIVBrsvUOaVYtRbQVv6
	 pNelQsKfhWuuoYjJ1ASIeSeuTB/soMfiW2fzBIic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DA9FF89682;
	Thu,  9 May 2019 04:30:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AE70F89674; Thu,  9 May 2019 04:30:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 916B4F8073C
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 04:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 916B4F8073C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2019 19:30:42 -0700
X-ExtLoop1: 1
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga005.jf.intel.com with ESMTP; 08 May 2019 19:30:42 -0700
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 8 May 2019 19:30:42 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 FMSMSX112.amr.corp.intel.com (10.18.116.6) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 8 May 2019 19:30:42 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.70]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.126]) with mapi id 14.03.0415.000;
 Thu, 9 May 2019 10:30:39 +0800
From: "Yang, Libin" <libin.yang@intel.com>
To: Takashi Iwai <tiwai@suse.de>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>
Thread-Topic: [alsa-devel] [PATCH V2] ASoC: soc-pcm: BE dai needs prepare
 when pause release after resume
Thread-Index: AQHVBUkLh5Eu02ZEH0uqF+PBAAy+/aZg5eoAgABRNwCAAMS6MA==
Date: Thu, 9 May 2019 02:30:39 +0000
Message-ID: <96A12704CE18D347B625EE2D4A099D1952838E47@SHSMSX103.ccr.corp.intel.com>
References: <1557282761-26146-1-git-send-email-libin.yang@intel.com>
 <aa0c6eea81a721f340dd1362801e49049a6620dd.camel@linux.intel.com>
 <s5htve4mymn.wl-tiwai@suse.de>
In-Reply-To: <s5htve4mymn.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzE1MzljMGEtMGNjYi00ZjkwLTg4MWEtZDVkNjg4NGE4Nzc1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicERhVWpZcEd2NFdLTHRGcU1cLzJ5ZzFKRGpIWjJteUNXd1l6alY4ZXMrYjA2b2txUm1UeHZMUm1hNzhWK3FpXC9OIn0=
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
>From: Takashi Iwai [mailto:tiwai@suse.de]
>Sent: Thursday, May 9, 2019 5:21 AM
>To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>Cc: Yang, Libin <libin.yang@intel.com>; alsa-devel@alsa-project.org;
>Sridharan, Ranjani <ranjani.sridharan@intel.com>; pierre-
>louis.bossart@linux.intel.com; Wang, Rander <rander.wang@intel.com>;
>broonie@kernel.org
>Subject: Re: [alsa-devel] [PATCH V2] ASoC: soc-pcm: BE dai needs prepare
>when pause release after resume
>
>On Wed, 08 May 2019 18:30:08 +0200,
>Ranjani Sridharan wrote:
>>
>> On Wed, 2019-05-08 at 10:32 +0800, libin.yang@intel.com wrote:
>> > From: Libin Yang <libin.yang@intel.com>
>> >
>> > If playback/capture is paused and system enters S3, after system
>> > returns from suspend, BE dai needs to call prepare() callback when
>> > playback/capture is released from pause if RESUME_INFO flag is not
>> > set.
>> Hi Takashi,
>>
>> This is a question for you. We've run into the problem of not being
>> able to do a pause-release after the system resumes from S3 after we
>> removed INFO_RESUME from the SOF driver.
>>
>> Apparently, with this flag removed, when the user does a pause release
>> after resuming from S3, the prepare() callback gets invoked for the FE
>> but doesnt happen for the the BE. Could you please guide us on whether
>> this is the right approach and if not, suggest an alternative?

I think this may be a ASoC FE-BE defect.
In this case, ASoC will call FE dai prepare(), but it will not call 
BE dai prepare() because of the judgement. This is why I made the patch.

>
>Hm, it's a good question.  Currently the PCM core doesn't care about the
>paused stream wrt PM by the assumption that the paused / stopped stream
>doesn't need a special resume treatment.  But, generally speaking, the pause-
>release won't work for a hardware that doesn't support the full resume,
>either.  For example, the legacy HD-audio may restart from some wrong
>position if resumed from the pause.
>
>Maybe this problem hasn't been seen just because the pause function is rarely
>used.
>
>So, the safe behavior would be to let the stream being SUSPENDED state at
>snd_pcm_stream_suspend() when it's in the PAUSED and has no
>INFO_RESUME capability.  Then the application does re-prepare the stream
>like the running one.
>
>But the question is what's expected at next.  Should the application re-start?
>But it was paused.  Should PCM core automatically move to pause?  But most
>hardware can't move the pointer to any random position.

I think our current solution is reasonable. we should remove INFO_RESUME
for Intel platform. The only side effect is that we will restart the PCM.
My understanding is that INFO_RESUME is used for those platforms which 
can support suspend/resume by hardware. And obviously, on intel platforms, 
we need do a lot of recovery for resume in driver. 

Regards,
Libin

>
>My gut feeling is just to treat like a normal error-restart, i.e. re-prepare / re-
>start.  But I'm open and would like to hear more opinions.
>
>
>thanks,
>
>Takashi
>
>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
