Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3394857910
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 03:48:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F3F816C3;
	Thu, 27 Jun 2019 03:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F3F816C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561600129;
	bh=HQPu3TZ8eHl86dI9TOm/eSxXnw0IQWCYtGZxtkBry2g=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oqwpj/S/TLEZm3h4pVQ9SNcKw7mf+Y+i5qCEkEaNADfk0rl+AEHJDh33drMpXvz8S
	 15ZUZW4lh2lhbsqHtDiE4nBRNp6a77TbVFAC5darcRonFERMvj9t+cYQiQRWt2T1Ft
	 AQUSF2sq+Qzp/1n328JUH4ovWCqkFi+h8WUTash0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC9B6F896F6;
	Thu, 27 Jun 2019 03:47:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55C82F896F6; Thu, 27 Jun 2019 03:47:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2818F89678
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 03:46:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2818F89678
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 18:46:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,422,1557212400"; d="scan'208";a="360530811"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga005.fm.intel.com with ESMTP; 26 Jun 2019 18:46:54 -0700
Received: from fmsmsx101.amr.corp.intel.com (10.18.124.199) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 26 Jun 2019 18:46:54 -0700
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 fmsmsx101.amr.corp.intel.com (10.18.124.199) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 26 Jun 2019 18:46:54 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.83]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.76]) with mapi id 14.03.0439.000;
 Thu, 27 Jun 2019 09:46:53 +0800
From: "Yang, Libin" <libin.yang@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: [alsa-devel] [RFC PATCH 3/4] ASoC: hdac_hdmi: refine hdmi jacks
Thread-Index: AQHVFG5wpg37HjgRpkesT50Q0sKADaaCv0uAgADqFbD//56WAIABPtqwgBZdwWCAESBxIP//194AgAMN13A=
Date: Thu, 27 Jun 2019 01:46:53 +0000
Message-ID: <96A12704CE18D347B625EE2D4A099D19528A3F6E@SHSMSX103.ccr.corp.intel.com>
References: <1558948047-18930-1-git-send-email-libin.yang@intel.com>
 <1558948047-18930-4-git-send-email-libin.yang@intel.com>
 <s5hftowv2ii.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D195285809B@SHSMSX103.ccr.corp.intel.com>
 <s5hsgswt1at.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D19528582FD@SHSMSX103.ccr.corp.intel.com>
 <96A12704CE18D347B625EE2D4A099D195289BC7B@SHSMSX103.ccr.corp.intel.com>
 <96A12704CE18D347B625EE2D4A099D19528A2E44@SHSMSX103.ccr.corp.intel.com>
 <s5hpnn1x6uz.wl-tiwai@suse.de>
In-Reply-To: <s5hpnn1x6uz.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTg4MTJkYjctYzhjYy00MGYyLWE1NTAtMmVkODVkNzQzNTkxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiemQxUWNLRW9FTFFJVWlSNVpWVk96N3RjWStKTTc2WDlyNkZ1ZWlOVUxZZ1BtZFZTREpDKzJcL1d5bTlrbEZXN0YifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: 'Hui Wang' <hui.wang@canonical.com>,
 "'alsa-devel@alsa-project.org'" <alsa-devel@alsa-project.org>,
 "'broonie@kernel.org'" <broonie@kernel.org>,
 "'pierre-louis.bossart@linux.intel.com'"
 <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 3/4] ASoC: hdac_hdmi: refine hdmi jacks
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

>-----Original Message-----
>From: Takashi Iwai [mailto:tiwai@suse.de]
>Sent: Tuesday, June 25, 2019 7:06 PM
>To: Yang, Libin <libin.yang@intel.com>
>Cc: 'alsa-devel@alsa-project.org' <alsa-devel@alsa-project.org>;
>'broonie@kernel.org' <broonie@kernel.org>; 'pierre-
>louis.bossart@linux.intel.com' <pierre-louis.bossart@linux.intel.com>; 'Hui
>Wang' <hui.wang@canonical.com>
>Subject: Re: [alsa-devel] [RFC PATCH 3/4] ASoC: hdac_hdmi: refine hdmi jacks
>
>On Tue, 25 Jun 2019 08:02:45 +0200,
>Yang, Libin wrote:
>>
>> >
>> >Sorry for a long delay for the hdmi jacks. I was busy on another
>> >critical issue last 2 weeks. I have worked out the UCM configuration
>> >files. Please check the attachment. It is a long file, so I use the attachment
>instead of the patch mode.
>> >Based on my test, it works well. Could you please help review if the
>> >configuration file is OK or not. I will do more test on the meantime,
>> >including DPMST and NON-DPMST.
>>
>> With some more tests on the new hdmi jack with UCM configuration, I
>> found that the kernel patch can always notify the jack hotplug event
>> to userspace correctly. However, the userspace can't set the amixer
>> correctly based on the UCM configurations sometimes.
>>
>> Here is the details:
>> There are 3 PCMs on Intel platforms. Let's call them pcm1, pcm2, pcm3.
>> And there are 3 pins (pin5, pin6, pin7). For DPMST, and each pin has 3 ports:
>> port0, port1, port2.
>>
>> For non-DPMST, we can set pin5 <=> pcm1, pin6 <=> pcm2, pin7 <=> pcm3.
>> This can always work.
>>
>> For DPMST, as there are 9 ports using 3 pcms. So we should assign
>> 1 pcm to 3 ports. For example, pin5-port0, pin6-port1 and pin7-port2
>> are using pcm1;  pin5-port1, pin6-port2 and pin7-port0 are using pcm2;
>> pin5-port2; pin6-port3 and pin7-port1 are using pcm3.
>> In this setting, we should setting the ConflictingDevice in UCM.
>> For example, pin5-port0 is conflicting with pin6-port1 and pin7-port2.
>> Hui and I found if we set one device conflicting with 2 devices, the
>> amixer setting will be wrong and it will not following UCM
>> configuration setting when we are hotplugging the monitors.
>
>How wrong would it behave?  Only one of them is done?
>
>> Hui and I thought this may be the alsa-lib or pulseaudio issue.
>
>You can try alsaucm directly without PA, too.
>But in general the conflicting device management is done in PA, so I'd begin
>with tracking the PA UCM code at first.

Sorry for delay reply. I take annual leave these days. 
The behavior is like Hui's description. Thanks for the suggestion. I will
try alsaucm firstly for the debug.

Regards,
Libin

>
>
>thanks,
>
>Takashi
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
