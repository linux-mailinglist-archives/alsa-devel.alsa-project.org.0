Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC1323C5AE
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 08:23:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 192CC1666;
	Wed,  5 Aug 2020 08:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 192CC1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596608600;
	bh=wInpiYqRsphtVvgj7qJh3PNpaZuwBF3Bv6TWNbOiefY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vAweaLgTF8+3fqtSO3L3DyrIq8WBKen37Z1y9d0Ky+lLTQMEP4qwoe2lQpm5iVt81
	 U6JLiMddeykDrBAIUW4qQ9v2eiGasFW2xBBDi7qBNNwzVfoC7LjJIGJ544lZIoSxF0
	 yUtcJ1er5fWf+UwOgIPUAlGhQuRWiW4wiQRcJEEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B49EF80124;
	Wed,  5 Aug 2020 08:21:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6D7DF80218; Wed,  5 Aug 2020 08:21:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54B0BF80124
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 08:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54B0BF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="Oup2B8OC"
IronPort-SDR: AMzQ7rABsAQzAX+qrgR4b7Wh6WJFy2ihriAcW7EdeUANootfP+wSFYaM5xnW/jA/kzbyRB1E6T
 CAOg2xY++s5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="216847100"
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="216847100"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2020 23:21:20 -0700
IronPort-SDR: BTmNe2T04/om56cK+Q7ho1blEFRAx01N1cdP6vIfUGaSBZ82dGvcozlfwrbAlp99lnjXwFWu7C
 HQh1flhDspdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="288827787"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 04 Aug 2020 23:21:19 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 4 Aug 2020 23:21:19 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 4 Aug 2020 23:21:19 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.54) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 4 Aug 2020 23:21:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djWKyFBU55cMK7TXWCBwHkzKC4St7EFOnGoCqV0HjclHj9/Zw3Qg336JlwqJiy5xkrNQYkT0vnYwDh0bysIjmgS7b6PgiKHutySv/LsY14jAUswhXxKZ2+CN6zIFd2QDd9ccDdguw3wHeIQjy1CiJlo08D/j1xVaetG3zHiVEI/CozSSfFZfHtBA4fKbhlrNIlGTiCZTfr6UPFdiem877CIv1LHAr7inUQRyeVKyqmln2Eb2Fde1rBtyUBPrXQ2hPlGMs/QsWtwNnSe5/1U+PE1KF4TG4xvuaSAYNAr1impW9YYi4YTkBSwtu9ujNmPhOnfbPicuJ7m9brN1m2tx2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wInpiYqRsphtVvgj7qJh3PNpaZuwBF3Bv6TWNbOiefY=;
 b=keJdRIvY+jpDk6xpQaK9EdXuldap9aGeIU8E1jwR/U3+L0UDug38m3VZZ2VkPOjCx0brmry3KtR16AYfX7I8W32g5wm4PMuLmtuPrW53A+Bb/j45g1JfwCsp6BCXvQ8mogiHWYU/g+ZrTMgH6U8UN81/Mk85CwFqb3Ph/LzDLK1NC2meE+7MHpHvBd0+EF7uSZMHU+yvY6e6euDsYRuOsakPdY9FXxkNKg6W3RUFHcAkILeANr+FqQ5TvpM4nFu3iQ44vjMk4z5GLWJCR5LNdRf+qQxnMEThG1Xx2PxXDHgr7hsoo781iG61djZUAGxi4WlGPGJcSLYmD86da+ET9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wInpiYqRsphtVvgj7qJh3PNpaZuwBF3Bv6TWNbOiefY=;
 b=Oup2B8OCNwKxSb6CWvn6sqkT89PCmZzbp014J+ADGKxvt1FJvQuzjsGOoILv0RT96QzA5XZlHaTWdNy1znnnBInArjSx1amekgZ8X6F1/X79ELo8j4MxRTd8jJymsOC5njM996nxaUMt5L8ilLbJ6Cj+MFcyL6wMZtxyPwcJ37c=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BYAPR11MB3271.namprd11.prod.outlook.com (2603:10b6:a03:7b::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Wed, 5 Aug
 2020 06:21:14 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c%3]) with mapi id 15.20.3239.021; Wed, 5 Aug 2020
 06:21:14 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
 channel-max property
Thread-Topic: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
 channel-max property
Thread-Index: AQHWZmTSECd6XhR1kUiCjOuunRmPnqklpW/ggACVP4CAAP0SgIAAplCAgAE1hHA=
Date: Wed, 5 Aug 2020 06:21:14 +0000
Message-ID: <BYAPR11MB3046BCAFC8335E7841DE8EAA9D4B0@BYAPR11MB3046.namprd11.prod.outlook.com>
References: <20200730055319.1522-1-michael.wei.hong.sit@intel.com>
 <20200730055319.1522-5-michael.wei.hong.sit@intel.com>
 <20200730112948.GB5055@sirena.org.uk>
 <BYAPR11MB3046DD82FAC2B5C672FC85B29D4D0@BYAPR11MB3046.namprd11.prod.outlook.com>
 <20200803104917.GB4502@sirena.org.uk>
 <BYAPR11MB3046E41085E470BFB11D710B9D4A0@BYAPR11MB3046.namprd11.prod.outlook.com>
 <20200804115019.GA5249@sirena.org.uk>
In-Reply-To: <20200804115019.GA5249@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [121.123.85.241]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7448d20c-005c-4926-6732-08d83907c13c
x-ms-traffictypediagnostic: BYAPR11MB3271:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3271EAE3F12FB59EFE4C46AB9D4B0@BYAPR11MB3271.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ksML4VxNnsS016eoZj/GAE++nfoITy4ylXFPAALHWP0ErcBNTTUqyzgslub4IShORGLInYnyyCQW+OkRw4GmAVfDH5zn5WaytC0t3Z2dHN+Sc/4fWoFZLn05co8WfBW515TsEDDvt82AsRJfuJbRmncXIHKVu7SDuHbG9idLmrwMr6TSLwYut6ZV0B29DZVkGZThOGvdNy6HXfqXdETOZQ1SXTwHuDECCqjsWk89iAxwYZTYFEcslsumk88gjDhOVzlqson90Urr0usp2sSt0+CZrTBNREx3qAyNgz6dwfXkSk6hwnx+RSHQ+8zQjWzE8hs/NoSuFn74fQyeEhsOdvlu/Db2JyEZQGqOPi4O0pBcsQLr4LnJPXfPkqWPe4H
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(53546011)(9686003)(4326008)(6506007)(71200400001)(8936002)(7696005)(55016002)(186003)(8676002)(26005)(33656002)(76116006)(2906002)(66946007)(478600001)(5660300002)(83380400001)(86362001)(54906003)(66556008)(64756008)(66446008)(66476007)(316002)(6916009)(52536014)(142933001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Jy6klNNPt9JevLoOLO4o29mK9Ti8qQOaElIVuPvwE0xG0n/3ZpzbPhvsLJSqjVR2x+rlV9bDPE+GVx6+jBuuzzwopZ6OP2vEvxReUqmHByPjxngVSYPksUaAVVX0R5mbIsLbHV8mCaFI4FZj/rtgOxrtWwmBzV0qACnrGEmxlnQf9pPSP8q+HzHT4MzzWjVXaj7G9cwybqUnfoajQ5iZR+tydEAdac1M7Iqd8Wn30ThTs5vtNUsix4ufjFzXUlWeptWgObb4SILiqYtFHL1zi4YN3RpgYC1RyRvoorCpRSUNTu3AMqjqkqS1UB0uP/fCWUvOotBZFw/UIM9nGips4Vf9fFm9kQhjP/pYWrMbuHAcb/dHkBALn4jiClGBJkPT7e8wm0apKAHpYlvs8MgeVMquYLLh+curWcqFT96lCEU2O4bfjc2dYNpn9F2BrCsx1TFE/1qSLBQxI0Wrr/G+4qMwThYGZGEi/Ec3+//lrtWEyv2PAgAUrMNk1aHPzvDOHZDdCtRpWKCgnkmDs9i61r+jat9QsEET5tcmOE3I/D1VdM0c/ZgPd+PPOP3ljmiziDby7SwvtchjEMZ3bVe9/1lU3/kupLaF4WfNIFABTm0TQWiJqu3K3qS9jvvrJVDA3OjGuxeowJCSEH17u6iUiQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7448d20c-005c-4926-6732-08d83907c13c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2020 06:21:14.1041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r8hd5rh5QKWW5u1yBdC15ja+Nv/NSr5O9gDNcJgPgtINoPatgqs99jCdDW2BLbPcirVdiyukBaS33TaBdE2fyNnhbwx3qM5JZxHA1wEKj3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3271
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Sia,
 Jee Heng" <jee.heng.sia@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>
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



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Tuesday, 4 August, 2020 7:50 PM
> To: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.com; pierre-
> louis.bossart@linux.intel.com; Rojewski, Cezary
> <cezary.rojewski@intel.com>; Shevchenko, Andriy
> <andriy.shevchenko@intel.com>; liam.r.girdwood@linux.intel.com;
> Sia, Jee Heng <jee.heng.sia@intel.com>
> Subject: Re: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
> channel-max property
>=20
> On Tue, Aug 04, 2020 at 01:57:23AM +0000, Sit, Michael Wei Hong
> wrote:
>=20
> > > > The platform also has 2 different interfaces which have
> different
> > > supported max-channels.
> > > > Using this value in the device-tree to determine the maximum
> > > supported channel of the interface.
>=20
> > > These should have different compatible strings, there are likely
> > > further differences between them (even if they are not currently
> > > documented).
>=20
> > The 2 different I2S ports are from the same SoC which supports
> > different number of channels, do we need different compatible
> strings for this?
> > Considering the only difference is the maximum supported
> channels is 8 and 2?
>=20
> Are you *sure* that's the only difference, or is that just the only
> difference you know about right now?

Yes, I am fairy sure that is the only difference according to the design, a=
s per the platform use case.
