Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5442A2C2515
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 12:58:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5757166C;
	Tue, 24 Nov 2020 12:57:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5757166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606219104;
	bh=kFshpCSs5TfXWNmb1BG5j570FqaHlxnl/IH/XYR39jo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B5XvEyON0TwxaI24w1suwkuRJLjl00nixGvc1V1O1MKB9WyN55bJjcBpJkN5yZ4eD
	 xVTRXo+jnJ9ab859zy3GkmjQFk4EpXzj90zVZo5p3qlp3tcQL7w1vgVd3okdvriXs8
	 mMJZRsu3IeM8t6Vz2dTz0w1Uzrn1Jr82LWOoxo+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4001DF8015A;
	Tue, 24 Nov 2020 12:56:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C276F80165; Tue, 24 Nov 2020 12:56:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5A24F80128
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 12:56:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5A24F80128
IronPort-SDR: 0k5QjiuweleKCNFgqgHTnlL8Hl6phQnVTxJ8IdvG9SNQVdwlSC3rT6R9Wpc2/10Tg3rtW1y0t1
 L7tiY60TBKJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="151189987"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="151189987"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 03:56:38 -0800
IronPort-SDR: 8rfsxsvxW4kwt0hrnutncO+KVyUsgjnp7zo/17UUuK90kDKz5cdn2phRTsqb8CcXnlG8NHkFe6
 52dQ1+3y7scA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="312558512"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by fmsmga008.fm.intel.com with ESMTP; 24 Nov 2020 03:56:37 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Nov 2020 11:56:36 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Tue, 24 Nov 2020 11:56:36 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Topic: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Thread-Index: AQHWuUTISKj33SVxVku5O7g0f1ygmanF+0XggABMLQCAAASUgIAEnFAQgAAmMgCAAVQSgIAAh8aQgAAL6wCAAWXZUIAAA0eAgALUmaCAABNygIAABbuAgAAQAICAADBe4IAEff6AgAEzKOA=
Date: Tue, 24 Nov 2020 11:56:36 +0000
Message-ID: <41fbc38fa46f41f49b4ff846f9f7b5b2@intel.com>
References: <s5h1rgst6z4.wl-tiwai@suse.de>
 <0286c6975f24432082f609d45adaa14c@intel.com>
 <0badb36f-3089-dc34-f7b0-75a73b856f0d@linux.intel.com>
 <d57fa3716a974eb9ba585ddd85dbe14c@intel.com>
 <cd8e5c2f-e1c2-7fbb-bee1-cc76ec14a801@linux.intel.com>
 <d94ccf9a3c61460db88f256df1fa3240@intel.com>
 <20201120164841.GF6751@sirena.org.uk>
 <758af664b89545c5be83ca2bc81078fb@intel.com>
 <20201120180627.GI6751@sirena.org.uk>
 <c8cd5f98e7c941c1b87aaabb850ece4e@intel.com>
 <20201123173533.GL6322@sirena.org.uk>
In-Reply-To: <20201123173533.GL6322@sirena.org.uk>
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

On 2020-11-23 6:35 PM, Mark Brown wrote:
> On Fri, Nov 20, 2020 at 09:02:24PM +0000, Rojewski, Cezary wrote:
>=20
>> There are no circumstances under which Intel recommends distros to try
>> to convert out of catpt though. Don't believe aligning all the drivers
>> to some general idea just for the sake of aligning is a good move.
>> That's why drivers have their own specifics in the first place -
>> their complexity and performance could have been negatively impacted
>> otherwise.
>=20
> It could equally be that someone has stuck with the older, now
> deprecated, implementations due to compatibility fears and this could
> help them deploy the catpt implementation without worrying so much about
> breaking things for users.
>=20

Except that it (i.e.: patchset) doesn't touch old _HASWELL kconfig at
all as the code behind it is already removed.

Believe we are desync'ed here.

What the patchset presents catpt vs SOF. /sof/ runs through SOF firmware
so it cannot be account as old-implementation. It's a mix of not
recommended fw + incorrect sw flow. As old /haswell/ is no more, there
is no worrying about catpt deployment - it's your only option. As there
is no userspace involved (lack of topology files), base firmware binary
remains the same and amixer kcontrols behave 1:1 when compared to its
predecessor, compatibility is left intact.

That's exactly why we should be explicit in driver selection. Pretty
sure hsw/bdw case is still mistakenly addressed to as if it was
atom-based platform.

Czarek

