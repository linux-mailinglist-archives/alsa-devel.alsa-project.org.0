Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF85C28E82
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 03:12:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38E7E1689;
	Fri, 24 May 2019 03:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38E7E1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558660363;
	bh=2v5IfO6dvIzh3sc1ukAR4gTYg0CA0nFdcCN27pdx1PA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZZUjcHpcB/HnsFYG8NuQuDn2Untd8yp1AutxALNPftpljE9HqtFHfqXKERklx9stu
	 kk100elRI5/N0ohYyndvqqUPTAyz7GXBXCqmVPNPbrw+fYYt9gpnrvHa1Ih8u9Aixb
	 xXo5MbmZNadcqvBvX7Aedmo0TeZo5wd8Pjz/747o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8868EF89709;
	Fri, 24 May 2019 03:10:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CC0BF89674; Fri, 24 May 2019 03:10:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A17A6F89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 03:10:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A17A6F89625
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 18:10:50 -0700
X-ExtLoop1: 1
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga001.fm.intel.com with ESMTP; 23 May 2019 18:10:50 -0700
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 23 May 2019 18:10:50 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx110.amr.corp.intel.com (10.18.116.10) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 23 May 2019 18:10:49 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.70]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.7]) with mapi id 14.03.0415.000;
 Fri, 24 May 2019 09:10:48 +0800
From: "Yang, Libin" <libin.yang@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Takashi Iwai
 <tiwai@suse.de>
Thread-Topic: [alsa-devel] [PATCH v2 12/12] ASoC: SOF: Intel: hda-codec: fix
 memory allocation
Thread-Index: AQHVELp8xHfh5vooqE+zpD1TQ3/5CKZ4GRrAgAAtZKD//5FsAIAAhlMggAAB6ED//69rgIABaLcQ
Date: Fri, 24 May 2019 01:10:48 +0000
Message-ID: <96A12704CE18D347B625EE2D4A099D1952841DCB@SHSMSX103.ccr.corp.intel.com>
References: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
 <20190522162142.11525-13-pierre-louis.bossart@linux.intel.com>
 <96A12704CE18D347B625EE2D4A099D195284169B@SHSMSX103.ccr.corp.intel.com>
 <s5hr28pfux1.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D19528416F0@SHSMSX103.ccr.corp.intel.com>
 <31702c41-aef4-712a-d11b-ee44e446a6cb@linux.intel.com>
In-Reply-To: <31702c41-aef4-712a-d11b-ee44e446a6cb@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOWEzOGQxMDctYTYwMi00N2VkLWJjZTQtMjAxZDZiNmFlN2ZhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSTRqV3ZDUmpIWmZuMkJNNjdVcU5peFVUTlVTREUwd1M3UktST0c2QTlLRCtidk1LQkxXWjBsKzB0RkNQcWRqRiJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>
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

Hi Peirre,

>>>>
>>>> On Thu, 23 May 2019 10:03:03 +0200,
>>>> Yang, Libin wrote:
>>>>>
>>>>> Please let me describe the issue here.
>>>>>
>>>>> The test case is:
>>>>> 1) Unload module with script "sudo ./sof_remove.sh" ,
>>>>> 2) reload module with script "sudo ./sof_insert.sh"
>>>>>
>>>>> After several rounds of removing and inserting kernel modules,
>>>>> system will complain like below:
>>>>> "BUG: unable to handle kernel paging request at 000000292a282031"
>>>>
>>>> Did you try some kernel debug options?  It might show what went wrong.
>>>
>>> No, I haven't. I'm not sure which options I can use for this case.
>>> Could you please give me some suggestions?
>>
>> BTW: I have enabled DEBUG_DEVRES. Are there any other options I can try?
>
>There are already a set of kconfig fragments for debug, see
>https://github.com/thesofproject/kconfig and select memory-debug-defconfig.
>
>I guess I will need to require this test in the SOF CI, I really don't get how this
>issue was not seen earlier. Gah.

This bug can't be reproduced easily sometimes. Sometimes, the bug will be hit 
at the second or third round of the test. And sometimes, we need do more 
rounds to reproduce this bug. This may be the reason we didn't hit this bug before.

Regards,
Libin

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
