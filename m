Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3302B8635
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 22:01:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A552D1714;
	Wed, 18 Nov 2020 22:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A552D1714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605733266;
	bh=FsnfQHzl5f07Ax8JF33wUFUnd8Ay93hr/Q1W7Erry/U=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BrUtZfobpaPdzjY/SIh/CeV5sPXFQpo8jMhFBHsTS/fDjsshF5PmpNFNBzo8awDdU
	 s3KlEkmHqQcB0zqYzICnDtxeHSquKbCGcUF06stL5Tneh8zrOqSQ6EJTN0jbfEDFlO
	 Yvk7PnsoDxnLuIOgaOoOm95C0WaweYF2o2dFxs7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2207EF8016D;
	Wed, 18 Nov 2020 21:59:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5990F8016C; Wed, 18 Nov 2020 21:59:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=PRX_BODY_30,PRX_BODY_65,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39E87F8010A
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 21:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39E87F8010A
IronPort-SDR: kQB6N7VL9V33fgZ4WNLfbV7q0nNHkRmfF6I3S3IyN+POC9gV6uUx5cHJ1pEetoV52oGo9G9Rzd
 JvbETt6+8BVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="151030812"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; d="scan'208";a="151030812"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 12:59:18 -0800
IronPort-SDR: 7/QasdqJrB35iuWCnN8Aj1HmhKEzdeO44wLqlRJ9kjGGbpR8B9y7Wcm1R9vAFTc3p/kS+ZABrc
 VOgymQDlhULg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; d="scan'208";a="534482331"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by fmsmga005.fm.intel.com with ESMTP; 18 Nov 2020 12:59:16 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 18 Nov 2020 20:59:15 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Wed, 18 Nov 2020 20:59:15 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Topic: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Index: AQHWuUTISKj33SVxVku5O7g0f1ygmanF+0XggABMLQCAAASUgIAEnFAQgAAmMgCAAVQSgIAAh8aQgACh2YCAANvXEA==
Date: Wed, 18 Nov 2020 20:59:15 +0000
Message-ID: <598648a32e024f30b555112f03ff1768@intel.com>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
 <0a0854d1ddaf4f9b81ef5569a7d501a5@intel.com>
 <20201113164946.GD4828@sirena.org.uk>
 <2cf7075b-bd51-21a5-2058-3a98e6c488a7@redhat.com>
 <d462c890495e4dda8698b5ba5eb50066@intel.com>
 <f62abcd8-b67f-774b-61b5-e08cfc3d2cc7@linux.intel.com>
 <s5h1rgst6z4.wl-tiwai@suse.de>	<0286c6975f24432082f609d45adaa14c@intel.com>
 <s5h3617rtnq.wl-tiwai@suse.de>
In-Reply-To: <s5h3617rtnq.wl-tiwai@suse.de>
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
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
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

On 2020-11-18 8:49 AM, Takashi Iwai wrote:
> On Tue, 17 Nov 2020 23:13:13 +0100, Rojewski, Cezary wrote:

...

>>
>> Thanks for joining the discussion, Takashi.
>>
>> If the switch of solution for atom-based products is imminent, why add
>> code which becomes redundant soon after?
>>
>> Yes, indeed I meant the modprobe blacklisting as it solves the problem
>> without addition of any code. Doubt alsa-driver entries are scattered in
>> /etc/modprobe.d/ so switching between one solution to another via
>> blacklist becomes as easy as changing 'options intel-dsp-config
>> <param>=3D=3D<value>' entry.
>=20
> Ideally blacklist would work well, but practically it can be more
> problematic.  When you *switch* between multiple drivers via
> blacklist, you'll have to mask one of them while keeping another
> untouched, so either:
>    blacklist A
> or
>    blacklist B
>=20
> Now, imagine that distro sets "blacklist A" to choose B as the
> default.  What user has to do?  They have to modify "blacklist A"
> line with "blacklist B".  But it can't be done with an additional
> modprobe.d/*.config file; otherwise this blacklist remains.  It means
> they have to scratch the system configuration file itself -- which
> might be again overridden by a package update or whatever.
>=20
> This will be more complex if there are more than three choices, of
> course.
>=20
> Admittedly, the situation with the system config file be same for
> module option if distro sets the option in modprobe.d/*, too.  But,
> there is another difference: the default option value can be set in
> the kernel code, while the blacklist approach is to let all open and
> choose via blacklist.  IOW, devs have some control for choosing the
> default value for the module option but for blacklist they are all
> done by user-space side.
>=20

I agree, module param is ultimately easier to handle than denylist. The
reason I had mentioned that is: if user is capable of changing value for
module param, then we might as well assume he or she is the experienced
one and playing with denylist isn't a problem either.

And hopefully we don't reach a point in time where again 3 flavours for
atom-based products are available : )

>> In regard to catpt, solution is even simpler: just remove
>> sound/soc/sof/intel/bdw.c as that code is not valid & recommended
>> anyway and linux kernel is not place for such. There shouldn't be really
>> any options for not recommended stuff. Leave the selection explicit.
>>

...

>> Well, if non-Intel guys see the localization of code counter-intuitive
>> then how about those who play with it daily..
>=20
> I play it and maintain it daily, that's why I find unintuitive :)
> I guess most users don't notice the file path, as the module loading
> or option is done only by the module name.
>=20

Perhaps I misworded my previous statement. What I meant is: you don't
have access to all the stuff we - Intel employees - have like specs,
firmware documentation, hardware specifics and yet you see the problem.
And this tells me there's still a lot to be done.

>> The new "sof-parent" checks won't make maintaining any easier and I
>> believe there are easier solutions as written above.
>=20
> If you find a good way to overcome the disadvantage, that's great.
> Let's see.

Well, the disadvantage is: weight of maintenance of newly added code.
All in all, as mentioned in other reply, we could settle with selection
mechanism for atom while leaving hsw/bdw out of it.

Czarek

