Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8C12BB130
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 18:12:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60164170F;
	Fri, 20 Nov 2020 18:11:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60164170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605892336;
	bh=WaHTmwhHC78l4x7qKRYWu5o6Ay0vv3vjZR+7hGc565U=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jzT/VX41j3q/kMQfij/FuVPteWOVeugJekxY6QlUSXJ7aY+K1U9O+Mq/iAYU06O27
	 CFBDQ9WKaynzZuvyEo1+GJqCbXhiQ3GlBTT71xuVeX5hNOEqKoxh9pWc+fnAOdoI7d
	 N3EzAXnQ7hCBB26+rBWJ9/oMy/6JB+Jsg0AIhO24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BED5DF8016D;
	Fri, 20 Nov 2020 18:10:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8820F8016C; Fri, 20 Nov 2020 18:10:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EF01F80166
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 18:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EF01F80166
IronPort-SDR: TlAUKxVQn25VCb4ekXWZ3DymuHexugXAFQgdiGolMTUZ8kneT3zxdcu3BHPopfnGCSPZq706qZ
 zu66e7xg983g==
X-IronPort-AV: E=McAfee;i="6000,8403,9811"; a="235651579"
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; d="scan'208";a="235651579"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2020 09:10:32 -0800
IronPort-SDR: /Dq3v4eIIQEtxtcosJja983RLqMOuD4DOHQsXy9RL2VmoVHxS4vTlPtZSxC07tE7VSLif6m0wJ
 YXobi+QIgdvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; d="scan'208";a="360511071"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by fmsmga004.fm.intel.com with ESMTP; 20 Nov 2020 09:10:31 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 20 Nov 2020 17:10:30 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Fri, 20 Nov 2020 17:10:30 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Topic: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Index: AQHWuUTISKj33SVxVku5O7g0f1ygmanF+0XggABMLQCAAASUgIAEnFAQgAAmMgCAAVQSgIAAh8aQgAAL6wCAAWXZUIAAA0eAgALUmaCAABNygIAABbuA
Date: Fri, 20 Nov 2020 17:10:30 +0000
Message-ID: <758af664b89545c5be83ca2bc81078fb@intel.com>
References: <20201113164946.GD4828@sirena.org.uk>
 <2cf7075b-bd51-21a5-2058-3a98e6c488a7@redhat.com>
 <d462c890495e4dda8698b5ba5eb50066@intel.com>
 <f62abcd8-b67f-774b-61b5-e08cfc3d2cc7@linux.intel.com>
 <s5h1rgst6z4.wl-tiwai@suse.de> <0286c6975f24432082f609d45adaa14c@intel.com>
 <0badb36f-3089-dc34-f7b0-75a73b856f0d@linux.intel.com>
 <d57fa3716a974eb9ba585ddd85dbe14c@intel.com>
 <cd8e5c2f-e1c2-7fbb-bee1-cc76ec14a801@linux.intel.com>
 <d94ccf9a3c61460db88f256df1fa3240@intel.com>
 <20201120164841.GF6751@sirena.org.uk>
In-Reply-To: <20201120164841.GF6751@sirena.org.uk>
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
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
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

On 2020-11-20 5:48 PM, Mark Brown wrote:
> On Fri, Nov 20, 2020 at 03:40:21PM +0000, Rojewski, Cezary wrote:
>> On 2020-11-18 9:25 PM, Pierre-Louis Bossart wrote:
>=20
>>> It helps everyone to have a single build, e.g. 'make allmodconfig' or
>>> 'make allyesconfig' would select all possible drivers and bots can run
>>> wild.
>=20
>> Why should bots care about not recommended code?
>> I'm against adding external dependency (intel-dsp-config) for
>> catpt for reasons I'd mentioned several times already.
>=20
> People care about any code that's in the kernel, especially people doing
> anything treewide.  The fewer configurations people need to build to get
> code coverage the better.
>=20

Sure, but in this particular case there really shouldn't be "another
option". If catpt is the sole option, why add intel-dsp-config
dependency? The alternative shouldn't even exist in the kernel and be
instead removed just like /haswell/ and /baytrail/ were.

Czarek

