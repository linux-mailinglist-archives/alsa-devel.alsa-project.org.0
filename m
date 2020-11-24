Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 693BF2C2C52
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 17:09:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AB71169E;
	Tue, 24 Nov 2020 17:08:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AB71169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606234161;
	bh=VgBhshWYs1yWp6XdJ1+GUecWd/Kpor5G6Hv3AHH47w8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGcByvqxELYB+l60dhcu2hucQwrZ1UoQy+rZ3D/mA2cqW2AyRqmJHiWqRuCLT3deY
	 ezg5GpE5/FAZfdzDozoh57oXjKbRKEGGKURzaK+tPYQcv/v1vKww58SjpuVRHmLNOs
	 0dRAw/lZ1iwqL0Iu6XRvHYncIr/8uE6Mo6rr9wzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 870E7F80161;
	Tue, 24 Nov 2020 17:07:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF333F80165; Tue, 24 Nov 2020 17:07:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D828F800C1
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 17:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D828F800C1
IronPort-SDR: YuVGGwwDSZdQ8gORNo32aGpkQHhCrnfcsTO14QkOTDObT/5grg/PD2WdmKN80HaqKzi/W4i/eq
 n5BXjk6dtsHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="256678694"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="256678694"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 08:07:22 -0800
IronPort-SDR: dID+t67kPrOGFzyq/1p6v7bIfLKbiytCVFId5tH8qgSxbKyOwJArHo9Py6P/h6foHgDHSMfDbZ
 CE2+ZfODCm8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="312620126"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by fmsmga008.fm.intel.com with ESMTP; 24 Nov 2020 08:07:20 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Nov 2020 16:07:20 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Tue, 24 Nov 2020 16:07:20 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Topic: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Index: AQHWuUTISKj33SVxVku5O7g0f1ygmanF+0XggABMLQCAAASUgIAEnFAQgAAmMgCAAVQSgIAAh8aQgAAL6wCAAWXZUIAAA0eAgALUmaCAABNygIAABbuAgAAQAICAADBe4IAEff6AgAEzKOCAACNSgIAAA+gAgAAZcGA=
Date: Tue, 24 Nov 2020 16:07:19 +0000
Message-ID: <ed9b1430fdc54c2c9b49ac7a186b9c60@intel.com>
References: <0badb36f-3089-dc34-f7b0-75a73b856f0d@linux.intel.com>
 <d57fa3716a974eb9ba585ddd85dbe14c@intel.com>
 <cd8e5c2f-e1c2-7fbb-bee1-cc76ec14a801@linux.intel.com>
 <d94ccf9a3c61460db88f256df1fa3240@intel.com>
 <20201120164841.GF6751@sirena.org.uk>
 <758af664b89545c5be83ca2bc81078fb@intel.com>
 <20201120180627.GI6751@sirena.org.uk>
 <c8cd5f98e7c941c1b87aaabb850ece4e@intel.com>
 <20201123173533.GL6322@sirena.org.uk>
 <41fbc38fa46f41f49b4ff846f9f7b5b2@intel.com>
 <20201124140119.GC4933@sirena.org.uk> <s5hsg8yrgcp.wl-tiwai@suse.de>
In-Reply-To: <s5hsg8yrgcp.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Hans de Goede <hdegoede@redhat.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2020-11-24 3:15 PM, Takashi Iwai wrote:
> On Tue, 24 Nov 2020 15:01:19 +0100, Mark Brown wrote:
>>
>> On Tue, Nov 24, 2020 at 11:56:36AM +0000, Rojewski, Cezary wrote:
>>
>>> What the patchset presents catpt vs SOF. /sof/ runs through SOF firmwar=
e
>>> so it cannot be account as old-implementation. It's a mix of not
>>> recommended fw + incorrect sw flow. As old /haswell/ is no more, there
>>> is no worrying about catpt deployment - it's your only option. As there
>>> is no userspace involved (lack of topology files), base firmware binary
>>> remains the same and amixer kcontrols behave 1:1 when compared to its
>>> predecessor, compatibility is left intact.
>>
>>> That's exactly why we should be explicit in driver selection. Pretty
>>> sure hsw/bdw case is still mistakenly addressed to as if it was
>>> atom-based platform.
>>
>> It's not just the userspace interface that worries people, it's also any
>> board specific quirks that might turn up.  A good chunk of the work with
>> x86 sound support is quirking around platform specifics - look at all
>> the patches Hans sends for example.  In an ideal world this would just
>> be people worrying too much but the general history with getting generic
>> code working well on a wide range of x86 hardware it's hard to blame
>> anyone for being conservative about substantial changes in the software
>> stack.

Mark, there is not a single word I don't agree with in your statement.

In regard to quirks - I was surprised how much detail Hans found out
regarding atom platforms. That's a lot of good input. And that's
probably one of the key reasons why atom is properly supported in linux.

My point has more "basic" nature.
=20
> I guess Cezary's point is that CATPT is the only driver for Haswell,
> hence the intel-dsp-config is useless for it.

This! and..

> But I thought CATPT also covers Broadwell, and Broadwell can be
> supported by both CATPT and SOF?  If so, the dynamic switching makes
> sense.

..more. Dynamic selection made sense if you're in transition period as
it is the case for atoms. There is no transition period for hsw/bdw. BDW
as "supported" by SOF would be a strong claim. There is no commitment
and Intel does not recommend using it for hsw/bdw for any scenario. And
as such, selection-subject does not apply here.

Believe removal of /sof/intel/bdw.c is in order?

Czarek

