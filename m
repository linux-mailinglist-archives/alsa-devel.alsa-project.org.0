Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 724DC91B0F
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2019 04:35:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6D0F167A;
	Mon, 19 Aug 2019 04:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6D0F167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566182124;
	bh=quz+Qr/jymo5H5mzFsJN6ar1dtTuVSvcWmWgKK9RmZY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oY8YPuUmsOpbx+31O3YbAuHvLmxRadpTkmwDAgZhFc/WV58GZapq+7x2aONTCBB0A
	 mv/eLMeMLnILdiF8rpQtZ+xBmT74vC/v8URP/IpU+Z1WeVVg2bUH0c6BsGokMjhopP
	 96jtZpluRbWQFqgqfok041jVPdZM48UufYoz6KPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 133A4F80306;
	Mon, 19 Aug 2019 04:33:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21096F802E0; Mon, 19 Aug 2019 04:33:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCE4DF8011F
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 04:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCE4DF8011F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Aug 2019 19:33:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="177744931"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga008.fm.intel.com with ESMTP; 18 Aug 2019 19:33:30 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 18 Aug 2019 19:33:29 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx117.amr.corp.intel.com (10.18.116.17) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 18 Aug 2019 19:33:29 -0700
Received: from shsmsx106.ccr.corp.intel.com ([169.254.10.204]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.139]) with mapi id 14.03.0439.000;
 Mon, 19 Aug 2019 10:33:27 +0800
From: "Jie, Yang" <yang.jie@intel.com>
To: Jon Flatley <jflat@chromium.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Thread-Topic: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
Thread-Index: AQHVRlhay0hHC8a4PkG/cLhEnYjIt6bhsKqAgAAe1oCAABlIAIABAYiAgAARVgCAAASkAIAXn1yAgAARk4CAAAmAgIAHHYQQ
Date: Mon, 19 Aug 2019 02:33:27 +0000
Message-ID: <E7B1D079BA13FB44A978CC8F69C7D6A9606FC567@SHSMSX106.ccr.corp.intel.com>
References: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
 <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
 <ac7bcb42e40ac12d9924fd65c3e2c68b9b11b093.camel@linux.intel.com>
 <37ede7ea-e760-eac9-a1d5-0eb8e3bff3cb@linux.intel.com>
 <CACJJ=pyb==xWqKMB-gAzW7-FCFgEU7Rm+b-CL-ANO-eorDKy=A@mail.gmail.com>
 <356b3f4eacb43f23c40c4cd8e3c54ae9514a34c6.camel@linux.intel.com>
 <7e08e45d-7cec-9fdd-36c5-5e82632968f8@linux.intel.com>
 <CACJJ=pzcMCaOvHMVhmYKKL2Z45-XdrBB9FT8VjSzX_obVtKzyw@mail.gmail.com>
 <d80c2f4d-b5f4-5bbe-9529-36b9859ab8be@linux.intel.com>
 <CACJJ=pxokT5z+U=nM9QcUVxCk84998ugM5J89U28k=CVGMjG=w@mail.gmail.com>
In-Reply-To: <CACJJ=pxokT5z+U=nM9QcUVxCk84998ugM5J89U28k=CVGMjG=w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDg5YzliZWMtYjQzMy00MWI1LThjMTMtOGI2YzA0ZmI5YzAxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTnU1SktRanFHU2VRM2swbWx6OFRoTlF1SXg3VWZuMmd2amg1UTRnSEx2TnR4V2tEWHZkZUtVU2JrY1Uzd3M4SCJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "benzh@chromium.org" <benzh@chromium.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
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
>From: Jon Flatley [mailto:jflat@chromium.org]
>Sent: Thursday, August 15, 2019 5:25 AM
>To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>Cc: Jon Flatley <jflat@chromium.org>; Jie, Yang <yang.jie@intel.com>;
>benzh@chromium.org; alsa-devel@alsa-project.org; Ranjani Sridharan
><ranjani.sridharan@linux.intel.com>; cujomalainey@chromium.org; Jie Yang
><yang.jie@linux.intel.com>
>Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
>
>On Wed, Aug 14, 2019 at 1:51 PM Pierre-Louis Bossart <pierre-
>louis.bossart@linux.intel.com> wrote:
>>
>>
>> > There seems to be an issue when suspending the ALC5650. I think the
>> > nondeterministic behavior I was seeing just had to do with whether
>> > or not the DSP had yet suspended.
>> >
>> > I reverted commit 0d2135ecadb0 ("ASoC: Intel: Work around to fix HW
>> > D3 potential crash issue") and things started working, including
>> > suspend/resume of the DSP. Any ideas for why this may be? I would
>> > like to resolve this so I can finish upstreaming the bdw-rt5650
>> > machine driver.
>>
>> Copying Keyon in case he remembers the context.
>>
>> Reverting a 5yr-old commit with all sorts of clock/power-related fixes
>> looks brave, and it's not clear why this would work with the rt5677
>> and not with 5650.
>
>No idea, I was just diffing the register writes looking for sources of discrepancy.
>The Chromium OS 3.14 kernel tree that Buddy uses doesn't have this patch, so
>I figured what's the worst that could happen?

Hi Jon, sorry about just noticing this thread.
From the dmesg log, the issue happens at runtime suspend/resume but not in boot, am I right(you can disable runtime PM for the device to confirm that)? 

My points here are:
1. the commit 0d2135ecadb0 was suggested by FW team to W/A D3 potential crash issue.
2. it was verified with rt286(Broadwell.c, e.g. Dell XPS) from our side only(and may have been checked with rt5677 by Chrome team).
3. please follow sequence in broadwell.c if issue happen at boot time.
If happened at runtime PM from DSP side, we should see it with all kinds of machine driver.
Could you performing more test and debugging to see what it real happen there?
4. we have no reason to remove the commit directly, except correcting if some lines are proved wrong. And, as Pierre mentioned, SOF driver is preferred, as there is no new development effort to support SST haswell/Broadwell driver here(no platform, no developer, :-( ).

Thanks,
~Keyon>
>>
>> Are you using the latest upstream firmware btw? Or the one which
>> shipped with the initial device (which could be an issue if the protocol
>changed).
>
>The firmware I'm loading is: `FW info: type 01, - version: 00.00, build 77,
>source commit id: 876ac6906f31a43b6772b23c7c983ce9dcb18a1`.
>Hashes the same as the upstream binary.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
