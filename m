Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D20A02862E2
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 17:59:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB4316C8;
	Wed,  7 Oct 2020 17:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB4316C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602086380;
	bh=LoDWT89UTTiHo/DHySKTnKVFN2BadKth0gBUISr1FKc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WhhbrVMK4oaJV08mGd5DjOQRBBcH1l0FLMcvaWh6R1PGMXd6zyW6MR7PMbORj3LHi
	 SIV2XsPyANAngTq5TeubftkkYLuK4dg0dojmywvLgBrvPT9QwjI1qm7HvbwBiSEj4J
	 /p+/DaxRn/gGlBPhE+7KGKD4N8IwQxLJvJRlQqJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88B7CF802B0;
	Wed,  7 Oct 2020 17:54:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A23F8F8012A; Tue,  6 Oct 2020 19:50:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B060F80128
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 19:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B060F80128
IronPort-SDR: AN0b3Zt/7V+JDNQGeX1O72DourhBbTuVJbz762Ph1LQApvOmXCQ8GxPraQzggUuM0IFtiW3sZM
 96X8ET84thzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="249313454"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="249313454"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 10:50:26 -0700
IronPort-SDR: Yc8FvicxbAFK/d55UAgu1EYcs4a/MfQoxCEmyqD+X+ivCdV5FaqM5CD/pukTZ1/p1/HJ2r1hJR
 PV+d6waPX2gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="353588091"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Oct 2020 10:50:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Oct 2020 10:50:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Oct 2020 10:50:24 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.1713.004;
 Tue, 6 Oct 2020 10:50:24 -0700
From: "Saleem, Shiraz" <shiraz.saleem@intel.com>
To: Leon Romanovsky <leon@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH v2 1/6] Add ancillary bus support
Thread-Topic: [PATCH v2 1/6] Add ancillary bus support
Thread-Index: AQHWm0x+bCEx5k0iU0+RSRzmm941iKmKoH2AgACGDICAAB03gP//lu/w
Date: Tue, 6 Oct 2020 17:50:21 +0000
Message-ID: <7c188f4d06f3499bb0262599fd9b55d3@intel.com>
References: <20201005182446.977325-1-david.m.ertman@intel.com>
 <20201005182446.977325-2-david.m.ertman@intel.com>
 <20201006071821.GI1874917@unreal>
 <b4f6b5d1-2cf4-ae7a-3e57-b66230a58453@linux.intel.com>
 <20201006170241.GM1874917@unreal>
In-Reply-To: <20201006170241.GM1874917@unreal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Oct 2020 17:54:46 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "parav@mellanox.com" <parav@mellanox.com>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Ertman,
 David M" <david.m.ertman@intel.com>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "Patil, Kiran" <kiran.patil@intel.com>
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

> Subject: Re: [PATCH v2 1/6] Add ancillary bus support
>=20
> On Tue, Oct 06, 2020 at 10:18:07AM -0500, Pierre-Louis Bossart wrote:
> > Thanks for the review Leon.
> >
> > > > Add support for the Ancillary Bus, ancillary_device and ancillary_d=
river.
> > > > It enables drivers to create an ancillary_device and bind an
> > > > ancillary_driver to it.
> > >
> > > I was under impression that this name is going to be changed.
> >
> > It's part of the opens stated in the cover letter.
>=20
> ok, so what are the variants?
> system bus (sysbus), sbsystem bus (subbus), crossbus ?
>=20
> >
> > [...]
> >
> > > > +	const struct my_driver my_drv =3D {
> > > > +		.ancillary_drv =3D {
> > > > +			.driver =3D {
> > > > +				.name =3D "myancillarydrv",
> > >
> > > Why do we need to give control over driver name to the driver authors=
?
> > > It can be problematic if author puts name that already exists.
> >
> > Good point. When I used the ancillary_devices for my own SoundWire
> > test, the driver name didn't seem specifically meaningful but needed
> > to be set to something, what mattered was the id_table. Just thinking
> > aloud, maybe we can add prefixing with KMOD_BUILD, as we've done
> > already to avoid collisions between device names?
>=20
> IMHO, it shouldn't be controlled by the drivers at all and need to have k=
ernel
> module name hardwired. Users will use it later for various bind/unbind/au=
toprobe
> tricks and it will give predictability for them.
>=20

+1. This name is not used in the match. Having the bus hardwire the modname=
 sounds like a good idea.

Shiraz
