Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4465C3E3D62
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 02:59:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0182166F;
	Mon,  9 Aug 2021 02:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0182166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628470767;
	bh=NN4HugGswhJvLgqbSfZo7eXtRG708DrBPM1XIoVwsYY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=skQUQu+WgMN9wyWOEVvcFqndO0rWSTPHjS2g+DXOWXwZkn1f4PfhMKTcKv80w041+
	 rQsN/cfyl4INI5m2S0r/I4QhbDQdOKjAD17LORhUauunIiVXdr9Kq1RqkDoP+lxny8
	 bQRA9YB2yl1WiYpx/vr88OsbR25JiGe2+oIP5tgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26DFBF80245;
	Mon,  9 Aug 2021 02:58:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13ACDF801DB; Mon,  9 Aug 2021 02:57:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2091.outbound.protection.outlook.com [40.107.237.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA146F800FD
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 02:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA146F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="cljYwmLx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKRCF5MO5UfycEGXbHYeUE1NSXSTV6gXMXqTFMptEHBcfIoQOowJ0On7JMUPkXOQdO4Bs0cU2WlUZ9FRR01aCFuLtvaeTLXSht7deImZMcVJZDglVk+zZxqO8O5B92fHozSDTeXDUhay4D4XgPk79WAEcXR4msz0xC3JN5E4tkKhbBs1g6n39Db26pXYCb1k/Qr/GSix6X5fjaAAwgUivdRsFobyTfbBlYclXIxJa+DJHjmcPVlwaaUwsu6jL2VDNEk2ycg5+5P/huiG+xfwN+v/uYjfJIsZJBK0kRilgOONIi+LCtjjdGpWBI3HJ+MsmqzWrh5O2A7kFp4CzUnbgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Cao69goJ4KY3620o61bvt/NQROwEcneQXzj996yD8s=;
 b=E+SJTWVLfFIHBs7t0a2aRjOQKGfa7RltUAk7UbPWSixcX8XcH/saatu9E+BLB4BtJrpkJS5pvfFWCnwcfDfzyj/3+Dkw6gZL6owTRy/lwGPdT2IJglMD46hwrlbbk76DPjPGMMmh2dP2YM0Am6xF4vLtuyZ0MXyAxSlnafo4RHXW8e3chHvfZOMm1er4OWV9f+R1CWY0hppFxTd5Wfp3vM88gHhUw7rG5LAIU1shWuXvnC3gHc+HD697n4ru6sPxi0a3tL68Dg0n3cdPvXssDj2Igk2ofDYJozbr/w9aCCtEyTNu7bhMh+MN3kC7rn+2e1hO9ELdjdxRXPmk00CSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Cao69goJ4KY3620o61bvt/NQROwEcneQXzj996yD8s=;
 b=cljYwmLxUdWpJtyoU0ZVx9ypTGrPVGfg0Ru+lhPcUFiAfs1WTnypJOmS9dh9xzNUfSI5gIeMMRSkLdRofrDEtxDbMI2PvXTPbs2JPDANncaS4Ee5hd4e0DFPz3b0+Q7ZxLLZaklNttURPIsZtu9heLB/Drdn/IGEIjBbu96UKPA=
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by MWHPR1101MB2080.namprd11.prod.outlook.com (2603:10b6:301:56::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Mon, 9 Aug
 2021 00:57:49 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::adef:da48:ea32:5960]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::adef:da48:ea32:5960%3]) with mapi id 15.20.4394.021; Mon, 9 Aug 2021
 00:57:48 +0000
From: Steve Lee <SteveS.Lee@maximintegrated.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH] ASoC: max98390: Add support change dsm
 param name
Thread-Topic: [EXTERNAL] Re: [PATCH] ASoC: max98390: Add support change dsm
 param name
Thread-Index: AQHXippclk84bnNRdUe7mfrYo+58kKtmUAmAgAQN46A=
Date: Mon, 9 Aug 2021 00:57:48 +0000
Message-ID: <CO1PR11MB5089212BFBF03F82AE41E34C92F69@CO1PR11MB5089.namprd11.prod.outlook.com>
References: <20210806080834.16705-1-steves.lee@maximintegrated.com>
 <20210806110301.GW26252@sirena.org.uk>
In-Reply-To: <20210806110301.GW26252@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=maximintegrated.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a53f695f-df83-4ab4-fbdb-08d95ad0b51d
x-ms-traffictypediagnostic: MWHPR1101MB2080:
x-microsoft-antispam-prvs: <MWHPR1101MB2080B5E8EF2C88E4629D775D92F69@MWHPR1101MB2080.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MxnRvQEgKr8x+Vezppq511r6FZFgXgpltQTUZ6pZBleQFKvloHylOP5SQtFFe2MyPceOi6EtOGDErl4Hpmgsi7oadcvR+5HgkfS9te2kGHgZjEqX4wNTLbdhao9tUh6sWPLhOKuR6ZH+gQ74WKS1Zn1nXzUjPbS6PA4U/8YUOyC3LpBSYCM0eoup9u+xQjRHV84hXgRxuetrNXfKADoEJIj8qbFPUmygkZeoOqbtkVSSESwB9lXTJQz4VLK7pgHoUjIaEM58gd7GsVJYkT7YyE6Ix35ubxFi5e4a1AL3A83/WJA7IJUBgAH1y9pGR6wFdiRsNiQrEBpzVXGmRr44hdCyH7TdJvva1niU+Zwf/nUuwWHW+8Z+DC8X/Z/beMgV02eiUu/GaZ6lW5AcOvzDSIBGP8E6fEsc50hHjgHejUwT6uxg4vJjcUGXU3i+aYMA1JxH5JPlZm9wz6Ei1gAQqo9SZR8G3/ZS81wScigNdsDoBjr03TIEfrSla1zKB06pC0ieNGYGYvkcKHZi3Hctvn7KNZIASnEXQEClhgtdAiKmTOwTS+ufdyHfjEFUeebRPcaWanTmd9FcpX+R5dtfIHhmRR/lo4Ri/37Rw5B5DDjM25KujSpsq+WoWrRwkV0dISFktnzhGxewMrsF4WHVmgzLtcfIXVVgyOfSOCLN5T2sSBqjIUhBAar1v71ExYNoMKGRjbDFJOeCixOhfyIErw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39850400004)(52536014)(9686003)(83380400001)(66446008)(64756008)(66946007)(8936002)(6916009)(8676002)(66476007)(2906002)(55016002)(71200400001)(66556008)(6506007)(5660300002)(122000001)(186003)(33656002)(38070700005)(26005)(4744005)(76116006)(86362001)(7696005)(478600001)(54906003)(38100700002)(316002)(7416002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4UJDw/TLJEyRokhdqsyjglqSQIQ17vKkfyKK2a9/J6r5R3XjphHmCKKmBLw+?=
 =?us-ascii?Q?pyq550Zddn8Bj9CIOB8YnNt3/dbtXYRmmi/FifPyrtESr4QtSuxLS7AgU+qF?=
 =?us-ascii?Q?IrtgOjFRW445wV/zQGU0JYtsC34PQNVBd/dVco3feumu20WEJZEpL3U+h2nX?=
 =?us-ascii?Q?27Fx+sBAkNBQ0FwMklRGAxlVvjkU1FnXUsHCC9pei0aCt0odYUWOSeBbg6u8?=
 =?us-ascii?Q?mmAxxLqDpDc0Amu883vFyNs5Q5Wre3aYiqoRQuWd/KnNwnp3rSPGmSf7TMSz?=
 =?us-ascii?Q?I78kEbALOYUiNwUr6gxlS8KLqQoct3pJ3qBcIkcrIFRmBJ8HD7hGlIanrGND?=
 =?us-ascii?Q?PySw9HHmVBfaaq5bKy69zZQ6r7DTifzL466S2zsnazG85mQgLEXDqq1F34Sg?=
 =?us-ascii?Q?fFB2kR1eDZ0vDFinEAzZ8c9NPBCCeWga/x4gVmuSQ0gqUF7/Nfl29HPk8vKh?=
 =?us-ascii?Q?iQsXf264Yjb+EKaNmkB4EY43XSaMtZZersjzZONvHUh0uVeetBEH7B/5c5mf?=
 =?us-ascii?Q?bP+vuOQC2H+0RKR+uehLTlPM+l2z4vjsnv0BQVSU14bSuwKgr/gbx1aMHFl6?=
 =?us-ascii?Q?IQdJWb+SCnj570h0fhgLhtyG6VL55tKwwjvjgTqgZZwH8GNiTe3ns7hGGYJn?=
 =?us-ascii?Q?WZFrWvgPsqW3SKtkNrEQUn8v8plQ5x7xWHedAVhef4qr13lYZgrfIIMh45IC?=
 =?us-ascii?Q?p6kUsmv2DoBPXulix27faMdDoN0zwOaZQTGbhbuWLznr89XQlcOD8bjgNOz7?=
 =?us-ascii?Q?E8nXJdCEdD0S2cDPAb1Jr1GyR06nnHeGQitpTATF7wbTdooHPGrk4mJ/oGm4?=
 =?us-ascii?Q?TqM5xwbRdkPe1FRNMFKuVrxCrtKteV6gM9XyJGWiwAJEY+/nAT52+oAcAwKj?=
 =?us-ascii?Q?gVZTCPca99eZvG1hm77C8zdP1uhjdhSiyNoaaJWUhLWXNNd2YIldZR4SLKkD?=
 =?us-ascii?Q?BGf5suYGoKfzWmaDBPnsjYQwzbW4UGGdeKq608vtzNmK7e9BYnOHLqlSE+/+?=
 =?us-ascii?Q?PyzgNQyVIF6bcvbYXW7RQf7oU+V82THKq8TLZSEvHT38MHjBTr1WUU/PIOQw?=
 =?us-ascii?Q?gioW8mFpWSEIObLnERG9Y+4KKoLA+HCnKrohoAUa0bv9Em/qzTag+//IX2lS?=
 =?us-ascii?Q?SbzL3U7Qa9+UsUzbC76PhDnZBzgjhQOJidBAB5bt2LGrKklcij5AQbpOQAd0?=
 =?us-ascii?Q?BrEMLawruk8SWHXLjRm+YKnPRf3RVBLd1fmNf/qua/sjjEp6AuQYHI1wWAnW?=
 =?us-ascii?Q?RkB7hHWfk/CpBrFWffYgmqNbCZtMCS4njxixP9cg98FbQK49J7EoumcTW9M3?=
 =?us-ascii?Q?GGoyJaV8RPqLlGO0iN566y4n?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a53f695f-df83-4ab4-fbdb-08d95ad0b51d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2021 00:57:48.3693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CdT2d/iXdF4g4sjYJCwQ0boTBXAJdd1VX4D+Vt3jQoUkrxGqZx/VclANyeqAXO1XOBgrniQEsuVPN/ibq4E+bQTpZM4zGpPswGrScP6dZXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2080
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

On Fri, Aug 06, 2021 at 05:08:34PM +0900, Steve Lee wrote:
>=20
> >  	ret =3D request_firmware(&fw, filename, component->dev);
> >  	if (ret) {
> > -		ret =3D request_firmware(&fw, "dsm_param.bin", component-
> >dev);
> > +		ret =3D request_firmware(&fw, "dsmparam.bin", component-
> >dev);
>=20
> This will break anything using dsm_param.bin as the default - why make th=
e
> change?
 I'd like to make that as same name with other using SoF project line.
This originally production default is "dsm_param_%s_%s.bin with vendor and =
product name".
