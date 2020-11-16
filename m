Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C16352B4995
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 16:41:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AD94176B;
	Mon, 16 Nov 2020 16:40:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AD94176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605541296;
	bh=GKjdzjRaUS6hznMygNwfJeRZeQ4v9jaj+vdMGxWPgmQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VXyjOGQaxt/G2qyqLnDLjNyg3+5MqYz3brtx4MqQDJXbbKPApqvHXwC3ZKpCcdEhG
	 TkkdeV5Ny0YYZLHBwq3+sYfmVzo6mHDqiAV2JZxmv3lf2va+dOvq1+8aSHvmxEYwJT
	 AqOwWDkqxqK3+IZl66oMtteLlxDFxhQzP9/sigrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86787F8016C;
	Mon, 16 Nov 2020 16:40:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F8F0F80168; Mon, 16 Nov 2020 16:40:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D24EEF800D8
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 16:39:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D24EEF800D8
IronPort-SDR: 1yjiZj9CH5nQ8dstVO1uDgr8KvhzSOSjP1OOAwn/nvKKscm6w7bfYp01XofRi6zvV3bAOvUBsS
 e46XF62H+oJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="157788699"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="157788699"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 07:39:43 -0800
IronPort-SDR: U1jxu5mfO4GaODYKEKI6QA60ZSw5uqL0BhNyvNLMfAn5zw5M+aHnVYZBPlDWtgRGhLmGUnOD+6
 5z9s6U/Agp8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="533453959"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by fmsmga005.fm.intel.com with ESMTP; 16 Nov 2020 07:39:42 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 16 Nov 2020 15:39:41 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 16 Nov 2020 15:39:41 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Topic: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Index: AQHWuUTISKj33SVxVku5O7g0f1ygmanF+0XggABMLQCAAASUgIAEnFAQ
Date: Mon, 16 Nov 2020 15:39:41 +0000
Message-ID: <d462c890495e4dda8698b5ba5eb50066@intel.com>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
 <0a0854d1ddaf4f9b81ef5569a7d501a5@intel.com>
 <20201113164946.GD4828@sirena.org.uk>
 <2cf7075b-bd51-21a5-2058-3a98e6c488a7@redhat.com>
In-Reply-To: <2cf7075b-bd51-21a5-2058-3a98e6c488a7@redhat.com>
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
Cc: "tiwai@suse.de" <tiwai@suse.de>,
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

On 2020-11-13 6:06 PM, Hans de Goede wrote:
> On 11/13/20 5:49 PM, Mark Brown wrote:
>> On Fri, Nov 13, 2020 at 01:06:48PM +0000, Rojewski, Cezary wrote:
>>
>>> For a very long time upstream was filled with "flavors" of drivers for
>>> Intel solutions. Having three available for BYT is a very good example
>>> of that. The division of what goes where wasn't exactly explicit either=
.
>>> This all leads to confusion - while community and users may feel
>>> confused about what's recommended and what they should actually be
>>> using, surprisingly (unsurprisingly?) developers were too.
>>
>> ...
>>
>>> Patchset presented here goes directly against that goal. We, Intel
>>> developers, are tasked with providing reliable, working solutions
>>> exposing best possible experience for our customers when dealing with
>>> our products. And thus solutions provided are called recommended. We
>>> don't deal with flavors and try-it-out-on-your-own-risk.
>>
>> My feeling here was that this is helping with this goal in that it's not
>> changing the defaults but is rather pushing the decision making process
>> from build time to runtime.  This means that distributions are able to
>> ship the preferred implementations for all the platforms without causing
>> any issues for the hopefully small set of users who need or want to work
>> on a different firmware, if they've been doing something like sticking
>> with an alternative firmware for old users since things were working
>> they'll be able to smoothly transition over to the current recommended
>> default, eg leaving old users on the old firmware by default.  That's a
>> bit of a niche use case but then hopefully all use cases for selecting a
>> non-default firmware are niche.
>>
>> It also means that people don't have to think about this so much at
>> build time, they can just turn everything on and not worry they'll cause
>> problems for people using the binary and still get the recommended
>> runtime behaviour by default unless the user actively does something

Thanks for your input, Mark.

The ultimate goal is OK but the execution is not. Take a look at the
following:

+static inline bool snd_soc_acpi_sof_parent(struct device *dev)
+{
+	return dev->parent && dev->parent->driver && dev->parent->driver->name &&
+		!strcmp(dev->parent->driver->name, "sof-audio-acpi");
+}
+

-and-

+	/* set pm ops */
+	if (sof_parent)
+		pdev->dev.driver->pm =3D &snd_soc_pm_ops;
+

-and-

+	/* set card and driver name */
+	if (snd_soc_acpi_sof_parent(&pdev->dev)) {
+		bdw_rt5650_card.name =3D SOF_CARD_NAME;
+		bdw_rt5650_card.driver_name =3D SOF_DRIVER_NAME;
+	} else {
+		bdw_rt5650_card.name =3D CARD_NAME;
+		bdw_rt5650_card.driver_name =3D DRIVER_NAME;
+	}
+

pieces that are appearing several times throughout the series.
ASoC is a framework on its own. It is by all means an extension to an
older, more general ALSA framework. With every passing month SOF code
found in /sound/soc/sof gets closer to becoming yet another framework,
one that is placed on top of ASoC. Samples taken from this series
augment this statement. If ASoC framework is missing means for its child
drivers to do specific things, it's better to update the framework than
creating yet another one.

Explicit 'ifs' asking whether we're dealing with SOF or other solution
is at best a code smell. I believe this is unnecessary complexity added
to the code especially once you realize user needs to play with module
parameters to switch between solutions. If we assume user is able to
play with module parameters then why not simply make use of blacklist
mechanism?

And last but not least: intel-dsp-config is (as already stated) a mean
for solving the HDA-runtime-driver-selection problem. Mixing it with
ACPI devices is another layer of confusion.

>=20
> Exactly. As Pierre-Louis mentions the Intel team does not have most
> of the affected hardware. Since I've been working on making BYT and CHT
> based devices work better with Linux as a side project for the last
> couple of years I have been buying these kinda devices 2nd hand when ever
...=20
> As Pierre-Louis mentioned I've already been working with him on getting
> ready to move everything BYT/CHT related over to SOF. I've already been
> testing SOF on various devices with mostly ok results so far.
> But this is a process not a switch which we can simply throw.

Hans, thanks for sharing your concerns.

I'm afraid it's basically impossible to be fully prepared as you and
Pierre pointed out. Even when speaking about catpt and BDW, we too
didn't have all the available production stuff.

And thus I don't believe there will ever be a "good moment" to switch.
Once internal validation confirms driver is stable it's better to switch
entirely to the new solution with CI and devs on standby - ready to
address any upcoming reports. Don't believe /atom/ has clean slide
anyway given the patches and issues being posted from time to time
related to said solution.

I understand you're here for atom-based products yet the patchset also
touches on catpt aka hsw/bdw. While to my knowledge old /atom/ has no
active CI running - so the switch is desirable - the same cannot be said
about catpt. Because of that, I don't see any reason for appending any
catpt-related changes here. Leave no place for confusion. One solution
for one architecture that's recommended and maintained.

Czarek

