Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A92DA3531F7
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Apr 2021 03:35:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30A4116CF;
	Sat,  3 Apr 2021 03:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30A4116CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617413739;
	bh=7ghyKa5wFr/2w5citT0BQcnB8SLA9gThImMjGYKGW3M=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iJDLNbX8N+t6WX5uqXGHTbe469qI3615V5ndhMEftaiP1i42p7ghEY4NpM4zEd5xs
	 M9yFod1jYLJzzAwK4r2znn0W3Iz8VF2F3euzcYY8oS4lQZasKSAeov8ZY4lPv7GGeS
	 quFFxXd9QQ+5Z+LLoDeuemB4vxj7CuhP1kro3I0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 842E8F80147;
	Sat,  3 Apr 2021 03:34:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B736F80240; Sat,  3 Apr 2021 03:34:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2091.outbound.protection.outlook.com [40.107.92.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EE29F8013F
 for <alsa-devel@alsa-project.org>; Sat,  3 Apr 2021 03:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EE29F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="EOHDzoNx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwRoMVwPhH/G0pMy8TRh/emvTf9BdaMeQlnZyoiYx0uE/nrgmndP/iLR87ovOaL1I40o/eY3J4Hxw5JD6b7i3zKpDSx8pkGgKVwLfGCsbsq6YREqX5h5xbS2darXpscXMT4LeoAtKhsaJTF4XnHNxwDc7DdlJih7/wdjTPopnIGv17j3jpa5KFkw/NSQOhGZ762kG2O52L/I13XOHd1m9C8cerMOa3rUb+yuyeZNInXI0q6HHjw0F5uljXV3ikkMGhUuXCPu14LmLW06mte6UX+sOQxweb72GKY7hOnMAC4hs62zgdapPszvw5OGhsY8LJQmOfHzYHJlFOGf56NfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ym5JkBys+sZiqh8tuwf9vB1nqBeyHgtlzuMnHqvRVe4=;
 b=P+nC5DOJkttFMRh8Inr4QUcfnAEMX1nSIbqG/NeBgukHxYI6Q+vufXIiKkStI4Ab8CMmFbLf70OHgHZsCaR/cdFzWXpjYwMwCmVfefk+l8VQBpXzSJ7tSehYrQUuf3j3KpgAqfOoxEuOVaTO83qOsaK9GHlsFiA2NBK05KPucRTE4CWwyTt1j5uroSLqBSH8HECTpE8Ez0Ag0SfcXY6q78NPpA4Bcl6h+UVOqFYugH+bDC4svjKaUvX3i1Lu3DBJg4VqcyF3wjo25z9cE/Cz6kBm/BKiGeNS9YC5OE0bMeR4Eoqzx7BUVKQEemgG5Qv3tuRyG+7qbiXWUObcEQJyEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ym5JkBys+sZiqh8tuwf9vB1nqBeyHgtlzuMnHqvRVe4=;
 b=EOHDzoNxkOxRugGuTtZyD0ufIQ2TKVWIqdHdFyKitLS23X1ibG+Y75Nfiek6shh6A0MjLyBPRsTtP/8V0MYAPvyCQ/LJHOmYIJVooBKpDfaFqTb9t9ZBCuRs/1S4dFPDOq0+uXvqLQp0dhP7Ebv40O4uBed6lisej+9IYup8704=
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by MWHPR11MB1344.namprd11.prod.outlook.com (2603:10b6:300:23::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Sat, 3 Apr
 2021 01:33:55 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::cc39:7519:2fa6:cc8b]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::cc39:7519:2fa6:cc8b%3]) with mapi id 15.20.3999.029; Sat, 3 Apr 2021
 01:33:54 +0000
From: Steve Lee <SteveS.Lee@maximintegrated.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH] ASoC: max98390: Add controls for tx path
Thread-Topic: [EXTERNAL] Re: [PATCH] ASoC: max98390: Add controls for tx path
Thread-Index: AQHXJ3HIPe95Vf5oskirMR52I5vc/qqhWV0AgACqjsA=
Date: Sat, 3 Apr 2021 01:33:54 +0000
Message-ID: <CO1PR11MB5089B8E8108E13E9FE6D965192799@CO1PR11MB5089.namprd11.prod.outlook.com>
References: <20210402033643.12259-1-steves.lee@maximintegrated.com>
 <20210402152326.GA5402@sirena.org.uk>
In-Reply-To: <20210402152326.GA5402@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=maximintegrated.com;
x-originating-ip: [125.129.66.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf5a6b43-b7e2-43e0-7bf2-08d8f6408b50
x-ms-traffictypediagnostic: MWHPR11MB1344:
x-microsoft-antispam-prvs: <MWHPR11MB13448D56B2791A74A6A9664B92799@MWHPR11MB1344.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AlJl1NDVeag+ArIbIxzY/I4X68RZUMn3SxUHuRsQrfrr84kNoNyzj3KkvWJ3SWndim3gCh+yfEaiRSZt/44vIjo51ow/b9RM9/3KyjgpcDUCpgd63lpMhAMS/Q8vwRtIbqr291cU4ieAgkKNir21tq6FF27sJZWVOD6tMMMCzNuqorHKXbmsAu0g4jX3nir9S7c7tMmpdFaumPDx1nf+togB+QDaRwoAjijjNH07ml/N/i7KLq/VHI4dew4HAfbP9JycwoNTX9wsd+kZvHE+HXzNsW0B/Xs6MYIYqbEshwuljDp9Rf9jvbxXVGMbLy1Xg8Yd8sjocRFrvWRnBRx+QhlRRWKHZExk0PBf82aqYY1jxgLtabCpRDeG9+KfwjH6Cd+QQBGR0pCM1l5Pk3Z206wp3VJdZzQFCN0kCeTKzG80EKJsPHlkC0IRn5i60hsus7zw6G2g6n9G1CTxW0IU9yvEH/q2o3WeH2ls9GEfhQIYudxtsTBZN0Qb4tIW87hsBUekfol5JtTTrTiZFonQIZoZ1jjN6CTwt/sq8Pk/+arZ0q2svl5L1OltZuZPbBjRHu2x/9vuCu0Hd0jSwq0Q4HXV9Zz1QWfDSdgO77Gjl3ojoBAURkNZKucDKF0pzyuFRfv8Jyykm5xkznMFSLSmn0jg5IxrpNMhS4FmKj3sSr0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(54906003)(7696005)(6506007)(53546011)(83380400001)(478600001)(71200400001)(66446008)(33656002)(52536014)(64756008)(316002)(66476007)(76116006)(66946007)(4326008)(38100700001)(66556008)(26005)(2906002)(7416002)(9686003)(186003)(8936002)(86362001)(6916009)(8676002)(5660300002)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?KjhenBbJ7ZMv9YJ5JTBAb/jYU7hpybkxIX/37Xz6pCzP4t8CAe9ErgykNmOt?=
 =?us-ascii?Q?rhl2O4FZlCx8EoJjG2g//3PzN2tTBRkC7FLk0ZMpVFDQLBfxIp39F1X2i19q?=
 =?us-ascii?Q?txNwiXRv7QD8tO2Q20gOwZe8W58um1yYgwGm9n5xD9WyqQ8Dt2EJjVodF66u?=
 =?us-ascii?Q?0xY1fRjEHVbYXGoqOp2Flf2LVjSLXbpRlfh6wZ4uHfoUGFwlVAs0vgARAU82?=
 =?us-ascii?Q?gf2UeURZ2BydJ0yYmF+3UPrHUihDZ+TeKPJz3o78lwQcDKSGjDnY0rGIo2ei?=
 =?us-ascii?Q?IQgQkO+c8+TJMwagtHXMH97FBddkiYfK/NODUCNmvkdT6Qm6lz1lj1reeQ11?=
 =?us-ascii?Q?BEW7sqinqT0CCk10ujixeB7xiC9j05/dBNpMUcUvOuynfLVYbHUlTtZT6yrC?=
 =?us-ascii?Q?83R367R3OOI+5PvjlHffkvx9CpGS8WDevvXdkm6+e7ES4K2Mmy508S3GqOiA?=
 =?us-ascii?Q?mvusjxI48C18x4eS2UZOeT1xAzE530akgLXL1s4tGjPID7oodb2HyDBhhs16?=
 =?us-ascii?Q?41QB7pK6c+OD+sk04FprvAy2z/va+32L/z6KhJmQ48rHv9FgH4y2mdqI1bWk?=
 =?us-ascii?Q?A2sik87hw4arXoyYG8JwA4/Mu0DsdQVWxTtfGXhPmOQ44FMhKUZg2kPPRkjd?=
 =?us-ascii?Q?1ch/hvjZx4o6f/xe86+0R3cV0/F7G0HGNaOVLwXyQfFxSmAImCyU+urTQlqc?=
 =?us-ascii?Q?tyJlbSrnYXOwpXI3J+aJF8EWXd5ENulfP9pcFZEDne1IaGrX5Xg2XsXH44xo?=
 =?us-ascii?Q?KZ510Fre5XVgvhDMRoHwWwcPF6P9gj0Yr++GWa/nAaFobthEGfCO44QMfHuB?=
 =?us-ascii?Q?TDPf8VgxHL1p0Jf3NDoOnzMsCYQ4T/fD+YARQzx6lkcvdQLhXB37/P/o4YgE?=
 =?us-ascii?Q?vpnUb8FRr+wno26duKHwr6zJxemCyaZIa31Lq/qNZX2A8tj6vKKuBsnwxbGl?=
 =?us-ascii?Q?NH+5LWVtpMN9NMIc1DQIsC2lPjOM84QVivvcZL8BZSf20q7Jfv+DyWxL2kuU?=
 =?us-ascii?Q?UQxVjYZIvqasDuE0RpKRFcFJ4u1X//aH/8Ox6u+hYqKB6+ZP4o9vTImL0BMn?=
 =?us-ascii?Q?vRGx6MqtLrcYaXAJtRqTGfwVOaAUP9X9xFQ2FM7epe06OULKjVUtJmDjlEXK?=
 =?us-ascii?Q?UZ9Vj1cyYzO+y2dikc6dyo1zKioH+WfjLYBgTwyHDCDtjVH3YFMs8ttp3Pj3?=
 =?us-ascii?Q?91B9iBqO6A+i7WBnStHgnWBELlXrZ8M8K2Z/ppc7HBuOTqs0NdUaS0UqKDak?=
 =?us-ascii?Q?syRw2gr1NqGIBj86Z5fZIdKaHyBYKT2/Tw3afKKaYD07nkLxRF1z28Rq1p0s?=
 =?us-ascii?Q?MowtDQgyeBxkqidcSlCiydlT?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5a6b43-b7e2-43e0-7bf2-08d8f6408b50
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2021 01:33:54.7138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wi7ZfilqW03mbwB0LVTUId9RFz73NG8gGkirLuJLmM2ZE1om7szhceuaxdgmU9SU3pK4GRifVfFeVOxwo8Nv4h+w03AyWWuTwkCPuCgvAf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1344
Cc: "jack.yu@realtek.com" <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "steves.lee.maxim@gmail.com" <steves.lee.maxim@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "krzk@kernel.org" <krzk@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nuno.sa@analog.com" <nuno.sa@analog.com>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "dmurphy@ti.com" <dmurphy@ti.com>,
 "shumingf@realtek.com" <shumingf@realtek.com>,
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
> Sent: Saturday, April 3, 2021 12:23 AM
> To: Steve Lee <SteveS.Lee@maximintegrated.com>
> Cc: lgirdwood@gmail.com; perex@perex.cz; tiwai@suse.com;
> ckeepax@opensource.cirrus.com; geert@linux-m68k.org;
> rf@opensource.wolfsonmicro.com; shumingf@realtek.com;
> srinivas.kandagatla@linaro.org; krzk@kernel.org; dmurphy@ti.com;
> jack.yu@realtek.com; nuno.sa@analog.com; linux-kernel@vger.kernel.org;
> alsa-devel@alsa-project.org; ryan.lee.maxim@gmail.com;
> steves.lee.maxim@gmail.com
> Subject: [EXTERNAL] Re: [PATCH] ASoC: max98390: Add controls for tx path
>=20
> On Fri, Apr 02, 2021 at 12:36:43PM +0900, Steve Lee wrote:
>=20
> > +	SOC_SINGLE("Tx Enable Selection", MAX98390_PCM_TX_EN_A,
> > +		0, 255, 0),
>=20
> I'm not clear what this is (especially given the source selection below) =
but it
> looks like it should be a mute control?
Yes, each channel of enable and disable control.=20
I will update this also configured by TDM slot configuration. =20
>=20
> > +	SOC_SINGLE("Tx Hiz Selection", MAX98390_PCM_TX_HIZ_CTRL_A,
> > +		0, 255, 0),
>=20
> This I'd expect to be tied into machine driver configuration, either DT p=
roperties
> or TDM slot configuration - it's not something that looks like it's somet=
hing
> you'd want to control at runtime.
I will update this with either TDM slot configuration and DT properties.
>=20
> > +	SOC_SINGLE("Tx Source Selection", MAX98390_PCM_CH_SRC_2,
> > +		0, 255, 0),
>=20
> This looks like it should be a DAPM control or possibly a TDM slot config=
uration -
> look at how the Arizona devices handle routing from multiple TDM slots fo=
r the
> DAPM version.
This is for Current Sensing and Voltage sensing slot selection. I will upda=
te this as DT properties.
