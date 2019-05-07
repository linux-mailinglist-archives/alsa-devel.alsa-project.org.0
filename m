Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4060315F33
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 10:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFB7517E2;
	Tue,  7 May 2019 10:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFB7517E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557217041;
	bh=xfnCtfJ4bp0pgmKFs78A1+UgMH8wR5zybPMR4FlJvxw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xf5l0veP500cYSHT4NDqQGslkFCM9KwOsCQhnph7V80wwnpVhSbUOmZyCRsKC5pWP
	 MqINLnQJX14eUy3vxKx1BkA9sjeX4kyTpj3Z/DLhZ40yVJnqdIEcqmr+uDAuI1YY57
	 AGyImM3MKQn5AdKauHLRL7H50WysoUAXXgRpITuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D027F89682;
	Tue,  7 May 2019 10:15:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66283F89674; Tue,  7 May 2019 10:15:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19484F80726
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 10:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19484F80726
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 01:15:29 -0700
X-ExtLoop1: 1
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by FMSMGA003.fm.intel.com with ESMTP; 07 May 2019 01:15:28 -0700
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 7 May 2019 01:15:28 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx115.amr.corp.intel.com (10.18.116.19) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 7 May 2019 01:15:28 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.70]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.126]) with mapi id 14.03.0415.000;
 Tue, 7 May 2019 16:15:25 +0800
From: "Yang, Libin" <libin.yang@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>
Thread-Topic: [alsa-devel] [PATCH] ASoC: soc-pcm: BE dai needs prepare when
 pause release after resume
Thread-Index: AQHVAw/TBvlZg+xTNES8OdHpk4AaI6Zdrp6AgAGZWuA=
Date: Tue, 7 May 2019 08:15:25 +0000
Message-ID: <96A12704CE18D347B625EE2D4A099D1952837B35@SHSMSX103.ccr.corp.intel.com>
References: <1557038262-26356-1-git-send-email-libin.yang@intel.com>
 <1135262a-0488-3261-e8d3-5e538837ba8d@linux.intel.com>
In-Reply-To: <1135262a-0488-3261-e8d3-5e538837ba8d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzM2YzE5NjYtOTAxZS00OTlmLWE2NDQtZGFkNDQ3OGQ4MGIwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiR3RYYjhrWW42R3VcL2hCcjJ5eFordk9cL3JhaUNyTFdkZXNnMFRvZnc1dEM1RzNoeXRocU5QSExmd3piK3BvNHhcLyJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>, "Wang,
 Rander" <rander.wang@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-pcm: BE dai needs prepare when
 pause release after resume
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

Hi Pierre,

>-----Original Message-----
>From: Pierre-Louis Bossart [mailto:pierre-louis.bossart@linux.intel.com]
>Sent: Monday, May 6, 2019 11:08 PM
>To: Yang, Libin <libin.yang@intel.com>; alsa-devel@alsa-project.org;
>broonie@kernel.org
>Cc: Sridharan, Ranjani <ranjani.sridharan@intel.com>; Wang, Rander
><rander.wang@intel.com>
>Subject: Re: [alsa-devel] [PATCH] ASoC: soc-pcm: BE dai needs prepare when
>pause release after resume
>
>On 5/5/19 1:37 AM, libin.yang@intel.com wrote:
>> From: Libin Yang <libin.yang@intel.com>
>>
>> If playback/capture is paused and system enters S3, after system
>> returns from suspend, BE dai needs to call prepare() callback when
>> playback/capture is released from pause.
>
>Libin, this patch was discussed at length on GitHub [1] and the commit
>message does not convey any of the information we looked into. It's not very
>helpful to send such patches to a larger audience without explaining context

Thanks for pointing it out. I will add more context in the patch description.

>and goals. I personally still have no idea of the state machine and if all
>solutions need this or if this is only needed in the case where the
>RESUME_INFO flag is not set.

Let me describe the bug for the reviewers who doesn't know the details.

The patch is trying to fix the below bug:
Playback -> pause -> suspend -> resume -> pause release.

When pause release, playback should continue to play. However
we found playback will quit abnormally.

This is because we should restore the registers after S3.
Currently RESUME_INFO flag is not set, so alsa will call prepare()
callback. But as you can see, dpcm_be_dai_prepare() will block
calling prepare() because it lacks of this patch. This means prepare()
of BE will not be called, which is wrong. 

So this patch adds the judgement to let the driver call the prepare()
if the state is SND_SOC_DPCM_STATE_PAUSED. And the state is
SND_SOC_DPCM_STATE_PAUSED because it is paused. Although
S3 happens before pause release, but the state is still in
SND_SOC_DPCM_STATE_PAUSED based on the code of
dpcm_be_dai_trigger().

If RESUME_INFO flag is not set, prepare() will not be called by alsa
after S3. So the patch is not necessary.

Regards,
Libin

>
>[1] https://github.com/thesofproject/linux/pull/868
>
>
>>
>> Signed-off-by: Libin Yang <libin.yang@intel.com>
>> ---
>>   sound/soc/soc-pcm.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c index
>> d2aa560..0888995 100644
>> --- a/sound/soc/soc-pcm.c
>> +++ b/sound/soc/soc-pcm.c
>> @@ -2471,7 +2471,8 @@ int dpcm_be_dai_prepare(struct
>> snd_soc_pcm_runtime *fe, int stream)
>>
>>   		if ((be->dpcm[stream].state !=
>SND_SOC_DPCM_STATE_HW_PARAMS) &&
>>   		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP)
>&&
>> -		    (be->dpcm[stream].state !=
>SND_SOC_DPCM_STATE_SUSPEND))
>> +		    (be->dpcm[stream].state !=
>SND_SOC_DPCM_STATE_SUSPEND) &&
>> +		    (be->dpcm[stream].state !=
>SND_SOC_DPCM_STATE_PAUSED))
>>   			continue;
>>
>>   		dev_dbg(be->dev, "ASoC: prepare BE %s\n",
>>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
