Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6F023B436
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 06:35:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8833A1663;
	Tue,  4 Aug 2020 06:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8833A1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596515743;
	bh=MBJFE3tOjC1azt9UKwuCUS3UUd5f2eNISGxQ+rq7DUU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=THPdZgtIUbwFEW9OiwwuXzt1zha4DHnwiu3wAtXTgLMbmEvD3G6jy0kdFwnw/zU7q
	 r9njnISbDP4sxwxZKkJbLbMZWPYTGl110G+KjgbzyN5ZinAHy6bUnj/ItdjxrlcWj6
	 wsq/PpDiUsPJ43iNXKZWVv7Zfzj9IdwXL+CEMKxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD02CF8015A;
	Tue,  4 Aug 2020 06:34:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2257DF80150; Tue,  4 Aug 2020 06:33:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C9D6F80124
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 06:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C9D6F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="UWxg39Sz"
IronPort-SDR: WHUVW1WV8ik07F6kuVTxxCAzQTJmUx8M9Kd6v9kNLOs4grfTtO0+2/CEgKdEgQl8zJGTud5PTR
 v+Bea3Jmp6cA==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="216646872"
X-IronPort-AV: E=Sophos;i="5.75,432,1589266800"; d="scan'208";a="216646872"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 21:33:48 -0700
IronPort-SDR: zb1MMxTIKP77s7vRzdTUEIE05QpGbu2kmF6SVzI0XPEniaeVlri38foCUD9V5cojzqsZ8BjcHN
 zwkOg2ctkkZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,432,1589266800"; d="scan'208";a="292415901"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 03 Aug 2020 21:33:47 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 3 Aug 2020 21:33:39 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 3 Aug 2020 21:33:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 3 Aug 2020 21:33:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Scm7KgVoeJpSz2C3oHMR5/mrdYQjZ7Zslzwz6IOifg9xaCsYk3hJmE86Esq+goA/MK70Wqp+8NWSEtbmNYO16x+Mzjsizph1vEJ45slMdMTi+SuiudXY93dcJIYLYCBgitTjhdVKZA5F+5o725t4sSZZ4tcs2aRckF45X+3APasMuv4IX6CNeI7dY77mN4BAwixXvCVDREZ32JRAKtbzGVUjuZpOVzSx6Y5TWu6zpOwkhBsR0aU7YxR+VMhhtSerHM31mus86IGietI5QkCp/+TKm57wubbGa/Eisp334vwKBWTvvUbefC7AL3x0OQRZn/oAs1VpdV0Kl0pnYgRUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FS39ASQuzjMIN603E/mdqgPHG8opqi6wVYJEuy1F0g=;
 b=LqD/RdjICBg7z+A2nd/j0fSnPbID2gtkFf4eEYhGwLbBTZpCm6Az6yM2BV6k2XnAAmmnWcMQm6pAniLz6oeLNVY4IiacbDdrAD4oGV8fYgho0Dp+02SFwQueOur5oAy4pwFTub43WsC720Nmr7l6rvd6NgebzbyBQskh1CfrHH4ZSARLuT1kEYeUfBxkbghFM+vWAHrkaMVY9GfwmlHmjZdiTkUIPNtO36IF3ggqGlu9kp+9dsLAghL+BDPjqwOGOSe1Ly8480zdlqIvM3pmvxZestglETa9+RCvpojG3v7HvyVHbrTa9AQSwReQzoVoOd68WwKQlvDjutJwsL7YqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FS39ASQuzjMIN603E/mdqgPHG8opqi6wVYJEuy1F0g=;
 b=UWxg39SzoiGT7GTdNnniEXKbmqbvwisSEphNuBDE55CxJzu1yzHXWOQXBcDciS+0mZ8aqt0o9fRPB+JJN48iWQioEPPqE0o6xu6UV+UIMOyWIG3UZophH4cox/6hsB3gqQICdfJ/0t5ngxD4y+bwum9hizp93okE5b1mDHY1IrM=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM6PR11MB3561.namprd11.prod.outlook.com (2603:10b6:5:136::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Tue, 4 Aug
 2020 04:33:31 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41%5]) with mapi id 15.20.3239.021; Tue, 4 Aug 2020
 04:33:31 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Topic: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Index: AQHWZzZzIgMFwAI7HkKT1/DPVspAl6khsDgAgAFDasCAAAm3gIADX8DAgAAlz4CAABcIUIAABbiAgACx9iA=
Date: Tue, 4 Aug 2020 04:33:31 +0000
Message-ID: <DM6PR11MB36423A9D28134811AD5A911F974A0@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
 <1596198365-10105-1-git-send-email-brent.lu@intel.com>
 <1596198365-10105-3-git-send-email-brent.lu@intel.com>
 <s5h5za3ajvb.wl-tiwai@suse.de>
 <DM6PR11MB3642AE90DF98956CCEDE6C2F974F0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <s5hd04a90o4.wl-tiwai@suse.de>
 <DM6PR11MB3642B5BC2E1E0708088526D8974D0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <63bca214-3434-16c6-1b60-adf323aec554@linux.intel.com>
 <DM6PR11MB3642D9BE1E5DAAB8B78B84B0974D0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <s5hpn873by6.wl-tiwai@suse.de>
In-Reply-To: <s5hpn873by6.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [220.136.119.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b18be5fb-4a2d-4dda-db95-08d8382f8acf
x-ms-traffictypediagnostic: DM6PR11MB3561:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3561616D50FB5BFAF2304693974A0@DM6PR11MB3561.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 49aylfAjcULRWKqRUFOIlbqyRe2QpAfqPxpjnXVVrTwhR6LSfBqn9bTAQALS9FLpdYCayDryPsQKE0TccRUp7yvwpGYITzZtHL+myNQMPlQN4ruleinX0xeAuPZt266OJrrrjUNY5zMLmtPlXx9vUqmZkwE1pW9XJB+LObr+TBVBUNa4LNp7VUjiCSjPuLrFZ9xdNVx0nWuXx2BVGK0K3wYM92pfevrhoxv2EnlW61CsBTDe+bLfvae+2zNxYTgrbbs9CND4Hbn4LGhZWeOgUn0BrBLCvX2UH4iG8KPE0PUwYYYd1ancObCEwmdCm2OkcAtIjwYWcf8oukPEx/VTzw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(186003)(26005)(6506007)(52536014)(66476007)(64756008)(66556008)(76116006)(66946007)(71200400001)(66446008)(5660300002)(83380400001)(54906003)(316002)(33656002)(86362001)(4326008)(2906002)(8936002)(55016002)(8676002)(6916009)(9686003)(7696005)(7416002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: hNn9BKQ/WRAV6Qofbrc2FkxBYXYW1yoMvPmhoCS0pq8cGRRAoxhxg7cKDqdoHht0h2EszIg923YktrmSnh66S/BXLaKetRAg7b2jU9qkP00C3z8wwj5Pd/QB3/oAkk/X39gOeyaHpwwEFK0UDSQsIW31mGbeHZjvPXVsFNa0j8rnJPCkJoHvkrYmshUdfjj5QMqf6teo8LXJVPoz6oXVW2qk33qt2+/qCLU5GIFGP4RIMab6/nEn0powidHvsQNDfqJNvlkuuuyO8FB4IWPeRF+pF0pJ8w5r9jwSIWaoO038l4WriP4g5kCPvsKCMWFF2VI6l6/QmzOMlXpRnuIvOGK4Lz0ctxmkoR3ykMMHnwfc3QDaHFm//WpwSRPVxD08+9oGT3icEuix8111UPHHRpvvvS64AEM1K1qz1AusbQ2n806W+y6b+cv58K9kPpbCxcPvu2QihxoncOALkmP5I/JCMI6XR6tRclSq5r+2v3DeBrhuEWvdWJfi8fxyxBwMmc9ogxL1mWFGRsQQ03wuqDWDs07BP/SKRSQjtywgeVd34d/Xc4v19P7wOHxbEDqNJMOIRdJspeqLkL5cxicsTHBHUFaH7VlPrDw/g0ad5kt9iRkH3VZnCGvv2HsqmlBT3fqJwIGoIT9lDiZaESRdVA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18be5fb-4a2d-4dda-db95-08d8382f8acf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2020 04:33:31.4652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YBH4EFAZuP30c2WlNZwnksGOUZw+20rEDvxzQehiE2geQtA3RoMUuVltTWOqWxSosgmFlhCCoGKRpLpIMjA/zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3561
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yuhsuan@google.com" <yuhsuan@google.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Sam
 McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Damian van Soelen <dj.vsoelen@gmail.com>
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

>=20
> For avoid further misunderstanding: it's fine that CRAS *uses* such a sho=
rt
> period.  It's often required for achieving a short latency.
>=20
> However, the question is whether the driver can set *only* this value for
> making it working.  IOW, if we don't have this constraint, what actually
> happens?  If the driver gives the period size alignment, wouldn't CRAS
> choose 240?

It won't. Without the constraint it becomes 432. Actually CRAS does not set
period size specifically so the value depends on the constraint rules.

[   52.011146] sound pcmC1D0p: hw_param
[   52.011152] sound pcmC1D0p:   ACCESS 0x1
[   52.011155] sound pcmC1D0p:   FORMAT 0x4
[   52.011158] sound pcmC1D0p:   SUBFORMAT 0x1
[   52.011161] sound pcmC1D0p:   SAMPLE_BITS [16:16]
[   52.011164] sound pcmC1D0p:   FRAME_BITS [32:32]
[   52.011167] sound pcmC1D0p:   CHANNELS [2:2]
[   52.011170] sound pcmC1D0p:   RATE [48000:48000]
[   52.011173] sound pcmC1D0p:   PERIOD_TIME [9000:9000]
[   52.011176] sound pcmC1D0p:   PERIOD_SIZE [432:432]
[   52.011179] sound pcmC1D0p:   PERIOD_BYTES [1728:1728]
[   52.011182] sound pcmC1D0p:   PERIODS [474:474]
[   52.011185] sound pcmC1D0p:   BUFFER_TIME [4266000:4266000]
[   52.011188] sound pcmC1D0p:   BUFFER_SIZE [204768:204768]
[   52.011191] sound pcmC1D0p:   BUFFER_BYTES [819072:819072]
[   52.011194] sound pcmC1D0p:   TICK_TIME [0:0]

Regards,
Brent

>=20
>=20
> Takashi


