Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E218F22E3CE
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 04:02:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75D83169C;
	Mon, 27 Jul 2020 04:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75D83169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595815329;
	bh=8UdL9qvel7ZtKUWUX1jqVVgJQnqUt9EzBq/pU7/BgOA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PXCMRyHsohEbD2mFrLbP8MDifwWOCo7OZ/N41EIXGmAqjs50WTQ2J/LHF+LtyWjb0
	 QByPQ72sgU1uPyrIP7zK6NuY2w0HI25m6pKx1TCVZ4SCyZsugg7JR7ako6fogKIkJF
	 x0hbdYvegBETs3M+H5M9s3BI/Vsz7j9XyJC71IcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98E83F800AD;
	Mon, 27 Jul 2020 04:00:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAF9AF80171; Mon, 27 Jul 2020 04:00:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2103.outbound.protection.outlook.com [40.107.94.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8215BF800DE
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 04:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8215BF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="RH217IGe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qk6zkvsqsvLC0mOLnnEXBKT7o+Icre5pGqCcZHV9lakEzPsDtbVMQJsS8jdZSqDEVf6xN6yeZKg1GvMDTTAz4nSY+S2JSN72SeekQrHMpynRtrKkleizRehzpoa4LWWyBYArmXS6hXI03HEWjbndoqzHpjqcUKwcU10tdRqLa17hXW/0X2kdh06LpUMmwLVRXIeAPGxEurBjWgEg72PVNKtiqHbWX8I685Enz3cjIx2E4ZFWwNUszNnO43/pbi279lLr3o9MSvVqpZCmHjFVx6QdzgbSZthVmWQe6/Cke5MAXNxXx2MPQJblEh+Mop1dCG3VaPgEDtDkE+YycXp1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Z8vR0vZusoOGBdKuhfpQCkHnG3GovnIOcTN3y8HhuE=;
 b=JPkBm1laOo8xOGFvGaA6llh2kHobu3pvwbpBqmTGwYhBkLeNhZplQI9/ag9TQ0G0r86yW1TKAsfb57DJTbZ50pmY8Dmsiyk1WTKoBQT+dRtUDp3WIbjhGxV4dTC07n9lwxyngJFGj05D5RuC7LdYa5N7m2l4nQUPBuEl91jp5YWX9vKQ6VnYmsd/u8bCb6UwDHr8gnxWLN5ECD4tRBXCVwmOO7FBYdXuGnVeKViQ9Cpa7rmvTVLuP2qVXRHd/L9W2DvKvQEr57Kt/8lTituR8lHU5Cku6Q/24EGzyUBZ+k3I+uPlOWNS2Ud0yF8zWV9831W0nc4cVDMsVPLB4IgCRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Z8vR0vZusoOGBdKuhfpQCkHnG3GovnIOcTN3y8HhuE=;
 b=RH217IGeFkHVPjWLnnapRwjdpv2tkwqebdBQeWbGmU1apMHhyXMKXL1ZUyNJBkapv3sSNHQYb7TpyrniHPtiGlvrItg7XD8OuWXPcOKBZ6xckHvrMUU/EgUI64zGjkbVbU29aJeZxhmOa+dH9VR2cEtFZ18Or/nGytNDbAnXT2U=
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MWHPR1101MB2205.namprd11.prod.outlook.com (2603:10b6:301:59::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Mon, 27 Jul
 2020 02:00:10 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::d9e8:a3eb:4f08:e795]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::d9e8:a3eb:4f08:e795%5]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 02:00:10 +0000
From: Steve Lee <SteveS.Lee@maximintegrated.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 3/3] ASoC: max98390: update dsm param bin max size
Thread-Topic: [PATCH 3/3] ASoC: max98390: update dsm param bin max size
Thread-Index: AQHWYZh9qD+EsXpBKU+c1fLFOfcsSqkWjXCAgAQirUA=
Date: Mon, 27 Jul 2020 02:00:09 +0000
Message-ID: <MWHPR11MB204753BF80DED8923AD3BEA292720@MWHPR11MB2047.namprd11.prod.outlook.com>
References: <20200724085644.9837-1-steves.lee@maximintegrated.com>
 <20200724105059.GA5664@sirena.org.uk>
In-Reply-To: <20200724105059.GA5664@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=maximintegrated.com;
x-originating-ip: [211.35.184.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e13587f4-4fef-448a-2014-08d831d0cafc
x-ms-traffictypediagnostic: MWHPR1101MB2205:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2205FC319066E5F4974BBAF492720@MWHPR1101MB2205.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pG/6T2k5ZvT8FheJ5DDst5ozd4XT32MCi483BA419rlCCp+DUF020AbxKw11KhfzwavjLe6e9ajjOJao4QcJDZwpld9bpQIgyjiR1Iy1baQLuGuw0nm0XNr8pCyFCfSiNuF9IyTlE6iexeXgfIG7BKrzfpSURdF3z3YSKbHLyhTNeIPZZFxQ2VnHBOqA7NdXV4CtbQ5fsjT04e0prBNnOytQtGzCJhcUpi8kfKlpJWPySr2jr3tWZENGXEBX92I/82DL+1me8Y3xgEfI7V76L2rpa1XTlcYuWw9wUplYdL7EBeo3bN4hXPZ+w98GiL74
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(71200400001)(478600001)(55016002)(9686003)(2906002)(6916009)(316002)(54906003)(186003)(26005)(8676002)(8936002)(15650500001)(4326008)(76116006)(66946007)(53546011)(6506007)(7696005)(66476007)(66556008)(64756008)(83380400001)(66446008)(33656002)(7416002)(5660300002)(4744005)(52536014)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: MyIjzU82/e5PIKuYcHdTi5Nfx4euZieqrz7TRGdXMXJTPs2x5ACn670LwBnxqIrumz9ZqLww8u/epyaLU6ppDdG0XKTTxaojsUgGGn3GqtnL9ZVG1h96Fig0ol+ef7VDDsFuoU+CkvP8Afsf5gaFUHgbJWMcK78QZTZDh8nFnCTgMpMNEhuhsFfU3WHSD0O7Lx949CJnvk4FhufOgfDC3vLhZAC9nILZLN2MrE8VxgMzuaI4MqpPyPFwMeiGkA4qF/8vOW0YA0GU5qxqptgTCEpvyxSZC8wc5CxslXVuQzodFoN5rBzgB+8AoMB54O5kmDNqBasO9q/x4kkOKw0JqpSwz7TP47pq0MHPU1CfezEKsTRAywCRnV5hnahPL7thehntZ4k4YEEJcq1p5kAfmLlTYsnqSF3ZoBEnhEdZ2IhYZsn1ToCfpT38xa4HIu5jon6smBhvDYZlJg4lC6WyWZrnyDKNPAFpIoxEAxKSOo4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB2047.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e13587f4-4fef-448a-2014-08d831d0cafc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 02:00:09.9765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7fUX855C5YwdD8EPgkSIjPt8Us1iDc4i1SAQjyj7cDkL6+B/vtQyZt1rF6POALH4rKLA7Y9xHupiwxWFVdkHYhCdHHzyFprzy60+m4xMtlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2205
Cc: "jack.yu@realtek.com" <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 Ryan Lee <RyanS.Lee@maximintegrated.com>,
 "steves.lee.maxim@gmail.com" <steves.lee.maxim@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "krzk@kernel.org" <krzk@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nuno.sa@analog.com" <nuno.sa@analog.com>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "dmurphy@ti.com" <dmurphy@ti.com>,
 "shumingf@realtek.com" <shumingf@realtek.com>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "rf@opensource.wolfsonmicro.com" <rf@opensource.wolfsonmicro.com>
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
> Sent: Friday, July 24, 2020 7:51 PM
> To: Steve Lee <SteveS.Lee@maximintegrated.com>
> Cc: lgirdwood@gmail.com; perex@perex.cz; tiwai@suse.com;
> ckeepax@opensource.cirrus.com; geert@linux-m68k.org;
> rf@opensource.wolfsonmicro.com; shumingf@realtek.com;
> srinivas.kandagatla@linaro.org; krzk@kernel.org; dmurphy@ti.com;
> jack.yu@realtek.com; nuno.sa@analog.com; linux-kernel@vger.kernel.org;
> alsa-devel@alsa-project.org; ryan.lee.maxim@gmail.com; Ryan Lee
> <RyanS.Lee@maximintegrated.com>; steves.lee.maxim@gmail.com
> Subject: Re: [PATCH 3/3] ASoC: max98390: update dsm param bin max size
>=20
> On Fri, Jul 24, 2020 at 05:56:44PM +0900, Steve Lee wrote:
> >  MAX98390_DSM_PARAM_MAX_SIZE is changed to support extended  register
> > update.
>=20
> I'm missing patches 1-2 and have no cover letter - what's the story with
> dependencies?
 I will re-send patch ang please ignore this patch.=20
DSM init param is extended to cover more register so that DSM MAX PARAM SIZ=
E value is changed.
Thanks.!
