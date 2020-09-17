Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A339D26E015
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 17:54:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 022EF16BF;
	Thu, 17 Sep 2020 17:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 022EF16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600358070;
	bh=+2rI1EnlxNwXtSwavkj8L0n/dEwB5P21i2iw1LOjLnc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kmypFJ5mhoeYOWd7U7QJ6ALLtJJ+1hwSagha7jj5I3ldhveo6HZkD2YwxHAzrH3Cq
	 /1Jn+ZLQ2TyP23JmIzMpiC8oIBwR3+1iABlc1uzeDV8jFJs9mnmmyZP7cxzTZFkVS3
	 9drq5fmjyoiVjVasjizO5xDJwHcTAfJCe91bwbQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C329F8025E;
	Thu, 17 Sep 2020 17:52:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2ED6CF80212; Thu, 17 Sep 2020 17:52:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F21D6F800E8
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 17:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F21D6F800E8
IronPort-SDR: ZCzQ6/Fr+vk94sZwqdBYObPHkwuNuZqS0p0BqePxL3eUszwtXN+fNmY6mHlRbRt1YoWYMiL6vM
 JT+524RtZMFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="157115920"
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="157115920"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 08:52:29 -0700
IronPort-SDR: ks3B85OcKLFHpzoGX80pUfcS4k0klOn9lqE//PxFESQdbk/7HhOmqbRBmk9y7xkxoFOhHEDg6C
 3BIbqIrRTB0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="483797982"
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137])
 by orsmga005.jf.intel.com with ESMTP; 17 Sep 2020 08:52:27 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 17 Sep 2020 16:52:26 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Thu, 17 Sep 2020 16:52:26 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v6 00/14] ASoC: Intel: Catpt - Lynx and Wildcat point
Thread-Topic: [PATCH v6 00/14] ASoC: Intel: Catpt - Lynx and Wildcat point
Thread-Index: AQHWjPyoC3mkKSdzTki+hw7tqKYIYKls2w4AgAAe9HA=
Date: Thu, 17 Sep 2020 15:52:26 +0000
Message-ID: <cd73e97d4d6b48b1990e69d57a2d5a96@intel.com>
References: <20200917141242.9081-1-cezary.rojewski@intel.com>
 <20200917145744.GP3956970@smile.fi.intel.com>
In-Reply-To: <20200917145744.GP3956970@smile.fi.intel.com>
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
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Proborszcz, Filip" <filip.proborszcz@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>, "Papierkowski,
 Piotr \(Habana\)" <ppapierkowski@habana.ai>, "Gopal, 
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

On 2020-09-17 4:57 PM, Andy Shevchenko wrote:
> On Thu, Sep 17, 2020 at 04:12:28PM +0200, Cezary Rojewski wrote:
>> Implement support for Lynxpoint and Wildcat Point AudioDSP. Catpt
>> solution deprecates existing sound/soc/intel/haswell which is removed in
>> the following series. This cover-letter is followed by 'Developer's deep
>> dive' message schedding light on catpt's key concepts and areas
>> addressed.
>>
...

>>
>> Changes in v6:
>> - reordered and reorganized code for patches 1/13 - 8/13 of v5, so each
>>    patches makes use of no member or function which is unavailable to it=
.
>>    Series size increased from 13 to 14 patches: addition of base members
>>    e.g.: registers has been split from addition of device.c file which
>>    describes acpi device behavior
>=20
> I like how it looks now from split perspective.
>=20
> It misses all the rest either being addressed or commented. Can you comme=
nt on
> v5 why none of the change is being addressed?
>=20

Sorry for the late answers Andy. Technically during such code shuffling
(a lot of code has been moved between the patches) one could sneak some
stuff which shouldn't be part of this series at all and it would be very
hard for reviewers to notice those. So, my approach was to avoid any
confusion, any suspicions during such procedure and be transparent. If
you diff'ed all the files after applying v5 against everything in v6,
you would notice basically no differences.

Additional impactful changes can be provided from now on.

Czarek

