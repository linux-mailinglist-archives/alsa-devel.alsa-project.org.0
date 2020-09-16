Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A29426C7A6
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 20:32:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 402701663;
	Wed, 16 Sep 2020 20:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 402701663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600281149;
	bh=Ms+7pIMM+0QCpD/kDlFn0G2YzxLJ9vQ6nTwx4i4AFT8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=edd7HAkavBTsKzHqs/QJEwDYNgHX5R70duN8Oq47bhrWtyv3bQzqqw1t7xt5LbnbH
	 UHQEKVKFJytnhVZzBmg+/lncLYTDROpwBk3Wuv8vY9+sPumeYqB/irlWp6Mx+Y9BNi
	 Dawd4D3SHk0g3vRryeZV7W1NHXLmpUjN/fym7aoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47D18F8015C;
	Wed, 16 Sep 2020 20:30:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 235C0F8015A; Wed, 16 Sep 2020 20:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 945F3F800E8
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 20:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 945F3F800E8
IronPort-SDR: F5et9GDm+MTjuAPLr1SqlQLauvcx9hYOrIcjQCOMo22gniNFMa1hXfMfMeqie4d3LTsJGyoBsE
 N1Nn3YFWNpNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="139049735"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="139049735"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 11:30:31 -0700
IronPort-SDR: yT5vLgVeTJnFPfq15eV6FEap8Y7O2q6nAP7e8IKVOeQubvuraa5DBn5MBiRmJ4BCkZABrsTGg7
 Q4YN79OewNkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="307147466"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by orsmga006.jf.intel.com with ESMTP; 16 Sep 2020 11:30:29 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 16 Sep 2020 19:30:27 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Wed, 16 Sep 2020 19:30:27 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v5 01/13] ASoC: Intel: Add catpt device
Thread-Topic: [PATCH v5 01/13] ASoC: Intel: Add catpt device
Thread-Index: AQHWi32GW37jr4EJj0CkLtYrpbvLFKlrU1CAgAAZhACAACqUUA==
Date: Wed, 16 Sep 2020 18:30:27 +0000
Message-ID: <9050ad4f60764a55a98579e494bd53f0@intel.com>
References: <20200915162944.16241-1-cezary.rojewski@intel.com>
 <20200915162944.16241-2-cezary.rojewski@intel.com>
 <20200916152455.GP3956970@smile.fi.intel.com>
 <20200916165614.GC3956970@smile.fi.intel.com>
In-Reply-To: <20200916165614.GC3956970@smile.fi.intel.com>
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

> On Wed, Sep 16, 2020 at 06:24:56PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 15, 2020 at 06:29:32PM +0200, Cezary Rojewski wrote:
> > > Declare base structures, registers and device routines for the catpt
> > > solution. Catpt deprecates and is a direct replacement for
> > > sound/soc/intel/haswell. Supports Lynxpoint and Wildcat Point both.
> >
> > Few nit-picks below. Overall looks good, FWIW,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> Actually hold on. See below.
>=20
> > > +void catpt_sram_init(struct resource *sram, u32 start, u32 size);
> > > +void catpt_sram_free(struct resource *sram);
> > > +struct resource *
> > > +catpt_request_region(struct resource *root, resource_size_t size);
>=20
> These seems dangling declarations that has to be moved to the
> corresponding
> patch. Please, revisit entire series to be sure that:
>=20
> - each patch doesn't add any warnings on W=3D1
> - each patch doesn't have dangling stuff
> - each patch is bisectable for compilation and run-time
>=20

TLDR: you want patches:
6/13 ASoC: Intel: catpt: PCM operations
5/13 ASoC: Intel: catpt: Add IPC messages
4/13 ASoC: Intel: catpt: Implement IPC protocol
3/13 ASoC: Intel: catpt: Firmware loading and context restore
2/13 ASoC: Intel: catpt: Define DSP operations
1/13 ASoC: Intel: Add catpt device

squashed. There is no other way to achieve that without combining
all the core-code together. fs and traces can be provided separately,
but not the first 6.

Czarek

