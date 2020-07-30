Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 854E2233933
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 21:44:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1391C1694;
	Thu, 30 Jul 2020 21:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1391C1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596138255;
	bh=tl4ECH25znP1QekKelU3+8O/MeHmdsyot6iPOcTLCqM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ILWQgxflXMAS13IQcu2EXy7uUMptlo/isPKK+K7g7pyWtWkDfWHpnhbGM3sk3dJfG
	 2JUFGMfV+LPz5XHIUUI1j2xCcuynsC/aWWgLoMX6AcPiot5tq0ocs2h+Sl4pSPOh7f
	 topDLh4iItKdZkQ3PNmoAqIvAPBCI70oB8yVED2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39683F8021C;
	Thu, 30 Jul 2020 21:42:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D3F7F8021E; Thu, 30 Jul 2020 21:42:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5D16F80111
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 21:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5D16F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="iZ06vDzY"
IronPort-SDR: Hrq1U5V+K1LZQcqNh9b9gK9IAODcxe4w9A1x5lbLmUV8asfN5Yrc84JYHxr087IfQ5NifieMNO
 2IKAaLZxxSoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="139235642"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="139235642"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 12:42:21 -0700
IronPort-SDR: kJYaf+j66GxW4v6mqmBrprOtRnJPzcUx2iryX3fFq3sUMNshCjtCorWTZiNEBIc3oDnj5F0zgr
 DB/jqKVyjyrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="313555476"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 30 Jul 2020 12:42:21 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 30 Jul 2020 12:42:20 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 30 Jul 2020 12:42:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jul 2020 12:42:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bt9ki6gdJooSNJ1XF1CheJvUi5GBHWY37B8fPj/+JjRwP/7aqcaovrD38I2/jASkDlMvX33YeYdtu5oV/WNwqAZVxdgj8SdjynTZxFkyLuGtcpe5i5unfqS2B3hfNmVWfy4gC9J5J4YfWcLvtUXG0oSXP4kldqOJjaIsEv4o7wuGDZcDZK09fdW43Lv9LEYiyM457M2dJnS5bRoc4Tvqg7QoTvm9RMRTIMWv3uK1Yms7aDh95oJdThatU3FtZln1SnNXYuobIR/UjHwYR6Sweo7+2cUg7fdtWzLLd/nI2L91CDl31NP/KGbzpoLac9wU1daG+bsSC48u2K31JAa0VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36ZbnLgcCzOmwd93qaAVM8C+WfIbsOYqlD4Hquatn9g=;
 b=hPZDAz9T/rItQFVcYJfa2AdkN+PU1iBVlCmEdY5gmGawxlQZiq5Y41FLKNPjOiIKMSxDLKr0U2Ty0jWK9IdYqSzQ0tbbWABnYla1NCiRiuc0RXnoMRIt8qNNhzfVbM7rQJrae24GPQDemhdrCV+qncKeon+3dUX2i0qnYqnxtmXmcpk61v5EROBatCxunhr8wamHnMuuxj3IKndBQ6J3SFFWhr4mzHywfFVnflJuP9+HXbCYdjUxOcikUPQakDxhpUqHxf7NI/TuuNgrQ8JqYfcIhDwuG+xpWv8vItjsRMqCIOIBAxOLv6mM0lld4HTmn4Af/YV1oWUhqnxcwnkAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36ZbnLgcCzOmwd93qaAVM8C+WfIbsOYqlD4Hquatn9g=;
 b=iZ06vDzYn8DJ90H51YljLvwKrbUb3BQl76BRRVbawgwgJP4rOKYi0tpCMxXNB30aOb10HoJVehMTwoQK/9O8n49SBxTTPviYP0bTPXJOuab96X8rZRZ5c7ZzM8ASNGnHJGXdKC63401CpjQMDCtOSYaIwEHt8PqU9y2/h1ntpb0=
Received: from MW3PR11MB4665.namprd11.prod.outlook.com (2603:10b6:303:5d::12)
 by MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Thu, 30 Jul
 2020 19:42:18 +0000
Received: from MW3PR11MB4665.namprd11.prod.outlook.com
 ([fe80::18a3:e19c:fd98:f75a]) by MW3PR11MB4665.namprd11.prod.outlook.com
 ([fe80::18a3:e19c:fd98:f75a%9]) with mapi id 15.20.3239.017; Thu, 30 Jul 2020
 19:42:18 +0000
From: "Zhi, Yong" <yong.zhi@intel.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH] ASoC: da7219: Fix general protection fault in
 da7219_register_dai_clks
Thread-Topic: [PATCH] ASoC: da7219: Fix general protection fault in
 da7219_register_dai_clks
Thread-Index: AQHWZnpogeP0BcNIMEC2Z6w66lP9Q6kgRk4AgAAAyfCAAAY5gIAAAowAgAAIdoCAACZhgIAABdMQ
Date: Thu, 30 Jul 2020 19:42:18 +0000
Message-ID: <MW3PR11MB46656E6203AD707934F9424C85710@MW3PR11MB4665.namprd11.prod.outlook.com>
References: <1596117868-3317-1-git-send-email-yong.zhi@intel.com>
 <AM7PR10MB3640075298BCB15AFB22A9D480710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
 <MW3PR11MB4665FA01F552E3BCB69EA2F285710@MW3PR11MB4665.namprd11.prod.outlook.com>
 <AM7PR10MB3640C50CDF650A4710E7B65680710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
 <20200730162808.GD5055@sirena.org.uk>
 <6381232d-8226-fd0a-37bc-6bc42451b5e3@linux.intel.com>
 <AM7PR10MB364075C56DA64BBA164A58A480710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM7PR10MB364075C56DA64BBA164A58A480710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
authentication-results: diasemi.com; dkim=none (message not signed)
 header.d=none;diasemi.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [72.180.71.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ecf96e4-8a4c-4fc5-393f-08d834c0ab8c
x-ms-traffictypediagnostic: MW3PR11MB4668:
x-microsoft-antispam-prvs: <MW3PR11MB4668CA3A429638C5E7DED41885710@MW3PR11MB4668.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kl2XAYd/Dwk2aI5vwyVLB0rVpBVqnPv6IoaHUqFMB+rn2K7DmwVn2DW5oy/LcPMYl6qnPNbmbaqNzBbaD0ytuP+QN/970J8nyZyMp0gFrGwMTz7wO+8CJrnlcQpXoFF+FzVPwqtq6ZjRJC9AEOLX2sFCc7ch+IyRB09KppoTlz77nnwSwh2UbKiM/WNhsHeA2euKKs3cL5a35aZgB23zD6bjvD3swrLh2/nuoCxNBMM4UbDq/IKaxjOq9qUbQUSrHLh4Y7IdgeWerVvjLvF82Ey2exJg5rFGCjVij4cFZme0y/VtZMuZRFTSs7J0BGM6weWZNJl98MFQ2vJDLlgUuw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4665.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(4326008)(5660300002)(71200400001)(8936002)(6506007)(52536014)(53546011)(478600001)(76116006)(33656002)(66446008)(64756008)(66556008)(66476007)(8676002)(66946007)(83380400001)(110136005)(186003)(7696005)(26005)(9686003)(55016002)(2906002)(86362001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ZRIfMyMJVd89guyM0PibJ1B7k1gLRpncJy3I2hN95om/IrS0ibgJ27SZCTh/XDGOdxX6C0ZK4TYv+dlmdhFUl2qHAjtoyfwZ7yWT99ZJBzmaVfHrdkF3IqEf27t4CPrkwUKbmHau8vVjvshFtO04yfhkHn3sK7Y3+FxapgHz5fIQCQr7ZVECHP5KoKzonrRSBic/WNJ8xkg7avfQtpjUdv8YkKYTRyfFgCzwHHupvLDBt9uFWMJ9mbzwn+EoqULCTvOaqmkFYXtbTOraey7tqza6OClpvb61ayfur233fvHGjRA1x4d0RxtDwIqOjd4B5V+xrwl0EbT4yNvcSVtKOhFlYeZyyV3alTDC84poDZiFGxoNlOJLcyVOKpfcfJ4m8Tt8zHu1jsOs8wimapLIcUaPXx6Q3NGXwUutczNXCpnf5f4JZOSvV5MmImo29Uf74u6BzT3ehJn9wbgU2pW2pzngVJsOCSSUUsxg7W5m+GfLiZ/lOirPTluAC69JisRkPRrsMGpu1/O+fPIIyUeOweKQVQZ9mBmn1+2xbI7XfixTJzYXBNKJx9jTCRGwtq7DcAIJ4cLmy8qaYu5JookgADlmGbKBTleuDCztD+2NMagR+7QBdQeVXZBzBGRpGarlmzL2OIGmdBUwekLeD7Chwg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4665.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecf96e4-8a4c-4fc5-393f-08d834c0ab8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 19:42:18.8418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jJbwZGGre0lhDWGaZnsBvBkr1km8iqUHyuzUrp9uePhn14UUW7IyGxqxu4khX1I/Cl06k/uvrnQfjsMofoaHWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Hi, All,

> -----Original Message-----
> From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Sent: Thursday, July 30, 2020 2:16 PM
> To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>; Mark Bro=
wn
> <broonie@kernel.org>; Adam Thomson
> <Adam.Thomson.Opensource@diasemi.com>
> Cc: Zhi, Yong <yong.zhi@intel.com>; alsa-devel@alsa-project.org
> Subject: RE: [PATCH] ASoC: da7219: Fix general protection fault in
> da7219_register_dai_clks
>=20
> On 30 July 2020 17:58, Pierre-Louis Bossart wrote:
>=20
> > >>> When the card was uninstalled with modprobe -r, the da7219 codec
> > >>> was not removed, only component da7219_remove() is invoked, do you
> > >>> suggest the component driver probe and remove has to happen with
> > >>> da7219_i2_driver
> > probe
> > >>> and remove together? Thanks for the code review.
> > >
> > >> Well as far as I understand it the the devm_* allocated resources
> > >> are tied to the i2c dev. If I'm correct then unless that's removed
> > >> then those resources won't be freed. If this is a valid scenario
> > >> then we would probably have to look at avoiding all devm_ calls in
> > >> the da7219_probe() code as they wouldn't be released when doing what
> you are here.
> > >
> > >> Mark, what's your take on this? Am I missing something obvious?
> > >
> > > You're not missing anything, you shouldn't be doing devm allocations
> > > at the CODEC level only at the device model level.  I'm somewhat
> > > confused why you would be registering clocks at the device model leve=
l TBH.
>=20
> Ignorance on my part when I wrote the code I'd say.
>=20
> >
> > I am afraid we have quite a few codec drivers used in x86/ACPI
> > platforms using devm_ clk functions at the component probe level...see =
e.g.:
> >
> > da7213, da7218, da7219, es8316, es8328, max98090, max98095, rt5514,
> > rt5616, rt5640, rt5682, tlk320aic32x4
> >
> > some do even worse: nau8825, tlv320aic32x4 call devm_ functions in
> > set_sysclk.
> >
> > The module load/unload tests used for SOF remove all the drivers, so
> > as Adam was saying this should not happen if you remove the codec drive=
r.
> >
> > It already took us quite a bit of effort to make sure all resources
> > are properly allocated/released. We still have known issues when
> > removing the platform driver only, mainly with HDaudio. I wasn't aware
> > of this case for I2C codecs, I guess this just made the list of TODO
> > cleanups even longer. D'oh!
>=20
> Well, I'll make sure I at least sort the da721x drivers to rectify this d=
iscrepancy
> and provide the correct solution. On the back of this I have also spotted
> something else that looks stupid in the cold light day, so will deal with=
 that as
> well (relates to these updates).

Sounds great, thanks everyone for your attention, please ignore the current=
 patch since Adam's fix will come soon. -Yong=20
