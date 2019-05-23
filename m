Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACA5277E9
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 10:26:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9706F1668;
	Thu, 23 May 2019 10:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9706F1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558599995;
	bh=Ptid7z6YVYilu/52Qb6Q53Az04IqW+Xyh+KlSI1c1Vw=;
	h=From:To:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Yu4+rJiWvOZeE1by8N8bmy4aWwC1AXXtCYgryjd9JogP8FM48YqY5CIK4kwKn2Sym
	 S6OCjjtsa6C0Ua6HwHPNGO3Ud4TqKnrE0ZG8x3aWsNU55X4zu6KrjK5cHwz/GdQm8+
	 eksbHL001yE9aO6wpUc7PLEK4Zp66ejYVjm5Pqtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 179F1F89709;
	Thu, 23 May 2019 10:24:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EC57F89674; Thu, 23 May 2019 10:24:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37C4BF8079B
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 10:24:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37C4BF8079B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 01:24:43 -0700
X-ExtLoop1: 1
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga004.fm.intel.com with ESMTP; 23 May 2019 01:24:43 -0700
Received: from fmsmsx157.amr.corp.intel.com (10.18.116.73) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 23 May 2019 01:24:43 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 FMSMSX157.amr.corp.intel.com (10.18.116.73) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 23 May 2019 01:24:43 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.70]) by
 SHSMSX104.ccr.corp.intel.com ([169.254.5.33]) with mapi id 14.03.0415.000;
 Thu, 23 May 2019 16:24:41 +0800
From: "Yang, Libin" <libin.yang@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: [alsa-devel] [PATCH v2 12/12] ASoC: SOF: Intel: hda-codec: fix
 memory allocation
Thread-Index: AQHVELp8xHfh5vooqE+zpD1TQ3/5CKZ4GRrAgAAtZKD//5FsAIAAhlMggAAB6EA=
Date: Thu, 23 May 2019 08:24:41 +0000
Message-ID: <96A12704CE18D347B625EE2D4A099D19528416F0@SHSMSX103.ccr.corp.intel.com>
References: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
 <20190522162142.11525-13-pierre-louis.bossart@linux.intel.com>
 <96A12704CE18D347B625EE2D4A099D195284169B@SHSMSX103.ccr.corp.intel.com>
 <s5hr28pfux1.wl-tiwai@suse.de> 
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzVlZDcyNzYtZDQ2Mi00NDMzLWI3MjctOTllM2JiN2NmYTAwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibW1USmtDRFJEVXd0Q21cL2czNXpmNWlJT2w0TXMyUVwvSk5ENDltdFJ2YnpKK2gyXC9pUXN6WnVZQ1BpQjRVUzhVSiJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 12/12] ASoC: SOF: Intel: hda-codec: fix
 memory allocation
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

Hi Takashi,


>>-----Original Message-----
>>From: Takashi Iwai [mailto:tiwai@suse.de]
>>Sent: Thursday, May 23, 2019 4:16 PM
>>To: Yang, Libin <libin.yang@intel.com>
>>Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>; alsa-
>>devel@alsa-project.org; broonie@kernel.org
>>Subject: Re: [alsa-devel] [PATCH v2 12/12] ASoC: SOF: Intel: hda-codec:
>>fix memory allocation
>>
>>On Thu, 23 May 2019 10:03:03 +0200,
>>Yang, Libin wrote:
>>>
>>> Please let me describe the issue here.
>>>
>>> The test case is:
>>> 1) Unload module with script "sudo ./sof_remove.sh" ,
>>> 2) reload module with script "sudo ./sof_insert.sh"
>>>
>>> After several rounds of removing and inserting kernel modules, system
>>> will complain like below:
>>> "BUG: unable to handle kernel paging request at 000000292a282031"
>>
>>Did you try some kernel debug options?  It might show what went wrong.
>
>No, I haven't. I'm not sure which options I can use for this case. Could you
>please give me some suggestions?

BTW: I have enabled DEBUG_DEVRES. Are there any other options I can try?

Regards,
Libin 

>
>Regards,
>Libin
>
>>
>>
>>Takashi
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
