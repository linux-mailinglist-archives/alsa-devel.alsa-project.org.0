Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B0827811
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 10:36:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B90941667;
	Thu, 23 May 2019 10:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B90941667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558600585;
	bh=CVnuKGElMl6AyqoypRf4+EL01YoWBxvHHCm0t7BilzI=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JqQmohkYFwxf7EInhrgXiGJ5qlY9ze15r768tDBA7kjy7YS0Sp9tE0kilE1fL985l
	 CuWCH4FWkyihmnsmB9OqC4zyqf32MXxI80DC1BvWObxcPR8Q4YZYyNsDGlGGOCPEal
	 xqBl5BGmXlaeM1mnDd7YnRgd8AO+LOBDQrnoPPMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EF51F89674;
	Thu, 23 May 2019 10:34:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70150F89674; Thu, 23 May 2019 10:34:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32FA7F80C0F
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 10:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32FA7F80C0F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 01:34:33 -0700
X-ExtLoop1: 1
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga005.jf.intel.com with ESMTP; 23 May 2019 01:34:33 -0700
Received: from fmsmsx101.amr.corp.intel.com (10.18.124.199) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 23 May 2019 01:34:33 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 fmsmsx101.amr.corp.intel.com (10.18.124.199) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 23 May 2019 01:34:32 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.70]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.129]) with mapi id 14.03.0415.000;
 Thu, 23 May 2019 16:34:30 +0800
From: "Yang, Libin" <libin.yang@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: [alsa-devel] [PATCH v2 12/12] ASoC: SOF: Intel: hda-codec: fix
 memory allocation
Thread-Index: AQHVELp8xHfh5vooqE+zpD1TQ3/5CKZ4GRrAgAAtZKD//5FsAIAAhlMg//980YCAAIgF8A==
Date: Thu, 23 May 2019 08:34:29 +0000
Message-ID: <96A12704CE18D347B625EE2D4A099D1952841741@SHSMSX103.ccr.corp.intel.com>
References: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
 <20190522162142.11525-13-pierre-louis.bossart@linux.intel.com>
 <96A12704CE18D347B625EE2D4A099D195284169B@SHSMSX103.ccr.corp.intel.com>
 <s5hr28pfux1.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D19528416D3@SHSMSX103.ccr.corp.intel.com>
 <s5ho93tfuea.wl-tiwai@suse.de>
In-Reply-To: <s5ho93tfuea.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZGYxYmI2OGUtOWEyOC00NDBhLWFhZWMtOWMyYjRhMGIzYTU5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidm92NW1mME5EUVdVaDVWdGpoMXhFNVRZTGV0djZFOW00QUlvd0ZrYnhrRHVlSVhjeWNqUTNTUkdlQ2hSaVFJeCJ9
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


>-----Original Message-----
>From: Takashi Iwai [mailto:tiwai@suse.de]
>Sent: Thursday, May 23, 2019 4:27 PM
>To: Yang, Libin <libin.yang@intel.com>
>Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>; alsa-
>devel@alsa-project.org; broonie@kernel.org
>Subject: Re: [alsa-devel] [PATCH v2 12/12] ASoC: SOF: Intel: hda-codec: fix
>memory allocation
>
>On Thu, 23 May 2019 10:21:20 +0200,
>Yang, Libin wrote:
>>
>> Hi Takashi,
>>
>> >-----Original Message-----
>> >From: Takashi Iwai [mailto:tiwai@suse.de]
>> >Sent: Thursday, May 23, 2019 4:16 PM
>> >To: Yang, Libin <libin.yang@intel.com>
>> >Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>;
>> >alsa- devel@alsa-project.org; broonie@kernel.org
>> >Subject: Re: [alsa-devel] [PATCH v2 12/12] ASoC: SOF: Intel:
>> >hda-codec: fix memory allocation
>> >
>> >On Thu, 23 May 2019 10:03:03 +0200,
>> >Yang, Libin wrote:
>> >>
>> >> Please let me describe the issue here.
>> >>
>> >> The test case is:
>> >> 1) Unload module with script "sudo ./sof_remove.sh" ,
>> >> 2) reload module with script "sudo ./sof_insert.sh"
>> >>
>> >> After several rounds of removing and inserting kernel modules,
>> >> system will complain like below:
>> >> "BUG: unable to handle kernel paging request at 000000292a282031"
>> >
>> >Did you try some kernel debug options?  It might show what went wrong.
>>
>> No, I haven't. I'm not sure which options I can use for this case.
>> Could you please give me some suggestions?
>
>You can enable CONFIG_DEBUG_DEVRES and adjust the devres.log option for
>showing each devres allocation and removal.  And I'd try
>CONFIG_DEBUG_SLAB and CONFIG_DEBUG_KMEMLEAK or whatever
>interesting in CONFIG_DEBUG section, too.

Thanks. I will have a try.

Regards,
Libin

>
>
>Takashi
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
