Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4769E26CA51
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 21:55:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28F3A112;
	Wed, 16 Sep 2020 21:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28F3A112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600286123;
	bh=C2pcznvPgKAf9jZzrQpS0iwBUifo2OIBkav09/Oj4wU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RP6E+fmzvO8Mln2PiKE1qodEL0BLtcI/IApUyfcQbn+vMjPxRqOlwbayd31buobo+
	 FUFyIIw4RCT1h43P3d47pcd/Ib3xX14nvDSYpi++WfRsSKuoikelPWk9KDmNOBxYGF
	 HlTFowp/vpP/BHIUOs2strOxHuBe+2RP5pJKAgBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49565F8015C;
	Wed, 16 Sep 2020 21:53:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C359BF8015A; Wed, 16 Sep 2020 21:53:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 966FDF800E8
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 21:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 966FDF800E8
IronPort-SDR: da9kZiGwbsGA3C+t5hPfVH7BzSbdc9R3bNFxdCP1A/3Yh0QMsvaja+mmc2y9iG3fflnr5RUTpW
 /PPcNPxCc//w==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="147242163"
X-IronPort-AV: E=Sophos;i="5.76,434,1592895600"; d="scan'208";a="147242163"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 12:53:22 -0700
IronPort-SDR: KLquimiHydZb/JxLvK7a6GqIgdwvnPW4Sjldr7PNYsnzW5PlqVQ7sN5Xz0q/64K6kmjhKX4Mbh
 DfDFM3W1ViIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,434,1592895600"; d="scan'208";a="483444491"
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137])
 by orsmga005.jf.intel.com with ESMTP; 16 Sep 2020 12:53:20 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 16 Sep 2020 20:53:19 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Wed, 16 Sep 2020 20:53:19 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v5 01/13] ASoC: Intel: Add catpt device
Thread-Topic: [PATCH v5 01/13] ASoC: Intel: Add catpt device
Thread-Index: AQHWi32GW37jr4EJj0CkLtYrpbvLFKlrU1CAgAAZhACAACqUUP//+5CAgAAWE5A=
Date: Wed, 16 Sep 2020 19:53:19 +0000
Message-ID: <d41e06595a9944afaa2c119ecb8efae1@intel.com>
References: <20200915162944.16241-1-cezary.rojewski@intel.com>
 <20200915162944.16241-2-cezary.rojewski@intel.com>
 <20200916152455.GP3956970@smile.fi.intel.com>
 <20200916165614.GC3956970@smile.fi.intel.com>
 <9050ad4f60764a55a98579e494bd53f0@intel.com>
 <20200916191245.GF3956970@smile.fi.intel.com>
In-Reply-To: <20200916191245.GF3956970@smile.fi.intel.com>
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

> On Wed, Sep 16, 2020 at 06:30:27PM +0000, Rojewski, Cezary wrote:
> > > On Wed, Sep 16, 2020 at 06:24:56PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Sep 15, 2020 at 06:29:32PM +0200, Cezary Rojewski wrote:
> > > > > Declare base structures, registers and device routines for the ca=
tpt
> > > > > solution. Catpt deprecates and is a direct replacement for
> > > > > sound/soc/intel/haswell. Supports Lynxpoint and Wildcat Point bot=
h.
> > > >
> > > > Few nit-picks below. Overall looks good, FWIW,
> > > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >
> > > Actually hold on. See below.
> > >
> > > > > +void catpt_sram_init(struct resource *sram, u32 start, u32 size)=
;
> > > > > +void catpt_sram_free(struct resource *sram);
> > > > > +struct resource *
> > > > > +catpt_request_region(struct resource *root, resource_size_t size=
);
> > >
> > > These seems dangling declarations that has to be moved to the
> > > corresponding
> > > patch. Please, revisit entire series to be sure that:
> > >
> > > - each patch doesn't add any warnings on W=3D1
> > > - each patch doesn't have dangling stuff
> > > - each patch is bisectable for compilation and run-time
> > >
> >
> > TLDR: you want patches:
> > 6/13 ASoC: Intel: catpt: PCM operations
> > 5/13 ASoC: Intel: catpt: Add IPC messages
> > 4/13 ASoC: Intel: catpt: Implement IPC protocol
> > 3/13 ASoC: Intel: catpt: Firmware loading and context restore
> > 2/13 ASoC: Intel: catpt: Define DSP operations
> > 1/13 ASoC: Intel: Add catpt device
> >
> > squashed. There is no other way to achieve that without combining
> > all the core-code together. fs and traces can be provided separately,
> > but not the first 6.
>=20
> No. My point is introduce header (declaration) with definition (c-file)
> together. Like those three of four functions.
>=20

Problem is that all of these are intertwined. I'll end up creating
patches which will be constantly updating files added by the opening
patch e.g.: core.h. Even if I'm to let's say, separate "just" pcm
operations, then the following:

int catpt_register_plat_component(struct catpt_dev *cdev);
void catpt_stream_update_position(struct catpt_dev *cdev,
                                  struct catpt_stream_runtime *stream,
                                  struct catpt_notify_position *pos);
struct catpt_stream_runtime *
catpt_stream_find(struct catpt_dev *cdev, u8 stream_hw_id);
int catpt_arm_stream_templates(struct catpt_dev *cdev);

have to removed initially from core.h. These, however, are part of
standard ipc flow and device probing. In consequence I'll have to update
the programming flow later on for these files.

I'll dig again and see what and where could be split.
Hope I'm wrong and the results won't be as ugly as I think they're
going to be.

Thanks for your input Andy, once again!
Czarek

