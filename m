Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F03D41B43D
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 18:44:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC2F916A1;
	Tue, 28 Sep 2021 18:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC2F916A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632847490;
	bh=ovwndLdLYLQYbEdawntR0GZ+HJqoypoR0Zy2E8ZVL34=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gqi/ItnuRtaZir+/PWFSajpJSUQGl6AsiVe938RJ14M5f9RqFW4C7cd9Yxn3OGfqv
	 F3DbYbZDobY/OfdxrgbrhUJpzRpJTc8xfFvaEO2jA0qkElFJ7Kx9aNLe9mOMcZI5dM
	 E4aQafBhbBk+GUjziLtGkbYgmx1vWnT+XSqkHr7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 589B8F804BC;
	Tue, 28 Sep 2021 18:43:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F135F804AD; Tue, 28 Sep 2021 18:43:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2109.outbound.protection.outlook.com [40.107.244.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EB17F800DE
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 18:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EB17F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="HRHhK9YP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+BSeAfKM8EDOU+VDfWMZ7jNv49I/8unfadMHEe8OfUcGDEGk+stxeYSrNAP5nSvosEsxIOxQG+3BKLI1HwfhWe8bgg+wLWYR//Z9V3SB5l8cF0G+yqo/kT8+a/B9YzMQcGIgMiRBInmwpKdaBp6wz54TzD6c96P4DLQyFODfvO8AonIm+RQwYtDSMQgSqrXkh0MG/Zc35cB+St1zGTQ6X/rKiy54mx7Osnv3vtHO3f29N4W4UaSp6vW8poG/EhM2OrqpGQAm5qgXKbAdMCie/SjKTT/7a2UJT1V1cbKguEB4Yi8rN14Uu+1ytmwjS1oBEIvV/GTe5M9Q8iyUXNgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=bYq+iN+25bMDyokWwDowkf4b8s22VouY8clUMW5WL2Y=;
 b=Mmv2QH5Nv7o0jSLUPseGR/JEXJu3VbsJuJI/d49neUYKJ/WzC65Ng2yBE7EzSBIL5FgJ171AtRpsY3UEZ0d/sxV8wHq3VMTr+o5EwrV8GkDgMn+RlhMTWx6kufcrLXXPt3wLsSQQKdMQC+qORW8Vx3crWeA4KafoCnuzzZesS5pMm9qyMo3ov4KVjYbc2eIvXKt45g+TwtUB7tMfJboIMfVbuwR31GBjvxXUbcsFA+SrIdTIaMgQ+M5bQscb9W3YNWF9SzgQoY4gde5b0XECmkxSpGoJn1j2p3CaU5ZKSIqP+L3GqvmAA92w6PYyNLKRgueXX4jO8IYkqdM8ZUR1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYq+iN+25bMDyokWwDowkf4b8s22VouY8clUMW5WL2Y=;
 b=HRHhK9YP3DWf8B95vYz5Gkeaef5Dv4cczECLhOiUZMwRDxLCTU07gTt5sNiKUYbBT0urEn+yTxZTP0KkP5ee5+0kTYpyZXwP8phCwb2OPEYeaUMEaO33nmqWt/9YPBoJ5LRc3g0CLAhDDUWjqCUKcgUlh2ypymW6qYsvDBLbaLU=
Received: from SJ0PR11MB5661.namprd11.prod.outlook.com (2603:10b6:a03:3b9::5)
 by SJ0PR11MB5600.namprd11.prod.outlook.com (2603:10b6:a03:3ab::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 16:43:19 +0000
Received: from SJ0PR11MB5661.namprd11.prod.outlook.com
 ([fe80::31bb:4f91:1eb5:7178]) by SJ0PR11MB5661.namprd11.prod.outlook.com
 ([fe80::31bb:4f91:1eb5:7178%7]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 16:43:19 +0000
From: Ryan Lee <RyanS.Lee@maximintegrated.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
Thread-Topic: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
Thread-Index: AQHXsZF45/jZbOMADUKIjx+r35kUIKu3/BEAgAAPiFCAAAR+AIAAC+UAgAAGCoCAAAOCAIABhRvA
Date: Tue, 28 Sep 2021 16:43:19 +0000
Message-ID: <SJ0PR11MB56618B8B6DE3922613E83C15E7A89@SJ0PR11MB5661.namprd11.prod.outlook.com>
References: <20210924221305.17886-1-ryans.lee@maximintegrated.com>
 <1b21bbf1-12c7-726d-bff8-76ec88ff8635@linux.intel.com>
 <SJ0PR11MB566107A6AB3D18ABDEDCF245E7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
 <20210927160622.GE4199@sirena.org.uk>
 <7b8c3875-3f12-f3cb-7da8-4e850e59ee2b@linux.intel.com>
 <20210927171033.GF4199@sirena.org.uk>
 <0af258d4-e33c-15ec-5dcc-a1c9961c0740@linux.intel.com>
In-Reply-To: <0af258d4-e33c-15ec-5dcc-a1c9961c0740@linux.intel.com>
Accept-Language: en-US, ko-KR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=maximintegrated.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ec6f30c-2fb1-4ae8-dddd-08d9829f1404
x-ms-traffictypediagnostic: SJ0PR11MB5600:
x-microsoft-antispam-prvs: <SJ0PR11MB560042D830E730071A9FD269E7A89@SJ0PR11MB5600.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /BdGBqgcqXRAB1g1/Q2YyqEWdNkma+GQmtvSckQAH3ITR9adWc/4vzxEl3LF6V8E6pLDBYWZJUvvCLQsa/6D3cYBPgvb8ZIMciX3bt0Kwnn08Je+73SdCRP1x4u2R+A1QJhOJGa7BQDWPmiZyRbd5lcdsUcqq/rg6zVHNz8DTZZTIDLyzdfAFcxXuVWdGdSUuUyPDr8RCEnMe1tGJ/tX9IPx9pKZDzdM6ccQw4SRUHeZqNJgywJklaVx1pCG+vW9ALOuwtY8fFLsCVj7NjLGrq57AEmvN/jvMFAKk/R9/xmNRodeh3Hr3ZI8BBXnUvoWke+fq5UgEudYe0T8wdLwYs8U77AyrtCupT7h1GzoB4t22ao//J9nm1dm4gkQJsnbdIJKgUKdjuRG4jDB0p8nekUQcXNmfppxySLvL/MZ/iBfM7HJ/8Y7Ijfd++dQPrLvNQPeDrPEXdE6RFmeolXAwSKIvXfzKtS5y8Furws+IqZzB9GYGOZMymFA4K0m3lUMZwtrOa3toYy3zJS5DB87LETOFysNJl+smguPN16bjjAkUOV+MBJgbDNZopWon9aLYUu3LaeB+wSe4icRlxNwWCg2RAjyQiGyGHLOJWTQqVIDHSt1Ny7oQRJUJGNwZL+jhI5yJG/nuycF9lQQlEjoXYm4ixrKw48hrIdQj7AzYupWV72/+4NdTakqBqVC+r4sVlJbqkdcIIYnVJtaDxfsmslYAC+OBFDvhyBkMPx+2wkqEHF5XEGldo2i1mDzFliDj+tg8IO9rtFhXb0MplOGJ3lXzb6Cb8aLuuR1XOKGczjCMq2Wgb4uTvXVXs6sZkaQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5661.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66946007)(66556008)(122000001)(66446008)(38100700002)(64756008)(316002)(7416002)(83380400001)(8936002)(71200400001)(7696005)(26005)(76116006)(9686003)(110136005)(966005)(186003)(55016002)(5660300002)(6506007)(86362001)(2906002)(508600001)(53546011)(52536014)(4326008)(54906003)(38070700005)(33656002)(8676002)(14143004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SAp5/CgYJyb+MltA4dsBO0DbW28FTaowRRwYMG9L7QNcAKi6Ij0gzJaAqcUA?=
 =?us-ascii?Q?I0EeUJwBTZnudCpHpgaQeyIJqZxKhqGHoR/2CPKBQ/MqVDqXL/OQgX3EySO2?=
 =?us-ascii?Q?u+z0Lz6GsADnmMLMnF7/3fayS9aocYXm3Xd9qGdwe+7n9Uywr8Rpf2RQ69Ca?=
 =?us-ascii?Q?hJOQBQqtptSGEW5rOWmUYlUsQp2DvsJagSqxurYBeDJnLSTaIPl5gwCm9cj8?=
 =?us-ascii?Q?HM+DLt/O6WWBPo/kvM6iYUV1Z6l1pQPVVKUDlsYndlW0OJe+15BylLHb0vA/?=
 =?us-ascii?Q?FXdKeK62q0g8tZOEjoHvhFbK1Gus0x27m5Awl3KZ5ndROhH51sRP3xjPnReP?=
 =?us-ascii?Q?ZIehu+X5Rd+p3PadZN/SnvpWa69dtyf4SKFSSdFbD0MlZxcu439GEu7+6Gtv?=
 =?us-ascii?Q?RiPsZ7AsqeeAb/QSZn7IFa3kX2Np67R0R85p64r980hP0YLGanlWQPXP7fD8?=
 =?us-ascii?Q?gurp+NdOGaZMu96sYrP7xRskxIdi1TgyesAUohlo4udBhgh4FwwKZy/RZFd9?=
 =?us-ascii?Q?xCpYCeU81N3v758cXg328YtJ1BIGSzKer9+RwuwXxXa/wgX/0Ig5/WM6mzOz?=
 =?us-ascii?Q?FjnwjnxReG+TWfbM4/nHfSPVrbh/5OPLUU30J+fG/w2v5jq4B0Zy8WlfxNfp?=
 =?us-ascii?Q?QjMd6IRzBk2ylFZEudzYfTeNN1WNLFVbi7GKoAxU8hwRvBJPxw5hqVPvdVW5?=
 =?us-ascii?Q?060AXFbZlWRA5oys/edyuIHb631eo8zyW1CCJUKeOy6+0z3uHZYRKkyIu1N4?=
 =?us-ascii?Q?tpBw+Us4lT2yVtY1JVa9rhwYSlZyYOs9H6sl2Y95ewqe9ZutFDNjEu6Cs3CC?=
 =?us-ascii?Q?RDx4Im7XeFHr7cN++Ltj8e7bvkHg7WpZe1SqDBVBUnfNqip+ASdZ99Sk4nR6?=
 =?us-ascii?Q?wUVHrfFNotgouY/nQ9S+tN5GOQssoc6mQYSYR1wlL6aRJrT7PjbwExyE/laT?=
 =?us-ascii?Q?Pl0RGEpdUqhJj0brlLnZ/acEvLWj75yPJEmDGt6UNwUqlMRrwsRd43M27EIq?=
 =?us-ascii?Q?04XqbY5YXmVBbfOFjHQImCxgvRo7RTNiLqvypaQA6p2M/rYreS2GqjwOiyI+?=
 =?us-ascii?Q?pEYrUF8dHCSRrDPch8jtAn8oaoCMSQjf5wi5piceJzEDKZrlRgUSlrYfxdCn?=
 =?us-ascii?Q?7jHy6HrNti0MoaQCxfKMn8FxsMM1FSAmE9cp3UtRpB9Xh98PuoJmgcJe7rLT?=
 =?us-ascii?Q?B28txhmAcMFpIGsbanA3BQl3UT2mY2Y6yAth7HLMxFIBavneelflDuwElhJT?=
 =?us-ascii?Q?us+XTOj5Z2usK2rrz14EwBo2MHyCrDkCb6z5x8h8XGUBZF76T7LpG/6q194g?=
 =?us-ascii?Q?q7OX8+2On5Ztv1+pL7ijrTgJ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5661.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec6f30c-2fb1-4ae8-dddd-08d9829f1404
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 16:43:19.4888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3DbnM8OeDmGMqwpGKTH/X8a/9gnL/8jj42BA0lIgK8ovAKvPHayZKdhQH7H1wNO9gBMIqpeUDCpolsrcZFwFvLGZfRC/ylgVMFThbDDvI6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5600
Cc: "guennadi.liakhovetski@linux.intel.com"
 <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
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
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Sent: Monday, September 27, 2021 10:23 AM
> To: Mark Brown <broonie@kernel.org>
> Cc: guennadi.liakhovetski@linux.intel.com; alsa-devel@alsa-project.org;
> ryan.lee.maxim@gmail.com; Ryan Lee <RyanS.Lee@maximintegrated.com>;
> linux-kernel@vger.kernel.org; tiwai@suse.com; lgirdwood@gmail.com;
> sathya.prakash.m.r@intel.com; yung-chuan.liao@linux.intel.com
> Subject: Re: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty
> before entering sleep
>=20
> EXTERNAL EMAIL
>=20
>=20
>=20
> On 9/27/21 12:10 PM, Mark Brown wrote:
> > On Mon, Sep 27, 2021 at 11:48:56AM -0500, Pierre-Louis Bossart wrote:
> >> On 9/27/21 11:06 AM, Mark Brown wrote:
> >
> >>> More specifically what it does is make the invalidation of the
> >>> register cache unconditional.  It doesn't really matter if the
> >>> invalidation is done on suspend or resume, so long as it happens
> >>> before we attempt to resync - this could also be done by deleting the
> first_hw_init check.
> >
> >> Mark, that's exactly my point: if the amp rejoins the bus, we will
> >> *always* mark the cache as dirty, before the resync is done in the
> >> resume sequence.
> >
> > Ah, yes - I see.
> >
> >> I am really trying to figure out if we have a major flaw in the
> >> resume sequence and why things are different in the case of the Maxim
> amp.
> >
> >> Instead of changing the suspend sequence, can we please try to modify
> >> the max98373_io_init() routine to unconditionally flag the cache as
> >> dirty, maybe this points to a problem with the management of the
> >> max98373->first_hw_init flag.
> >
> > A quick survey of other drivers suggests that this pattern should be
> > factored out into some helpers as it looks like there's several ways
> > of implementing it that look very similar but not quite the same...
>=20
> No disagreement here, we tried really hard to enforce a common pattern fo=
r
> suspend-resume, but i just noticed that the maxim amp driver is different=
 on
> suspend (resume is consistent with the rest).

OK. I believe it was similar before. But it looks like 'regcache_mark_dirty=
' is being
disappeared on suspend function.

static int __maybe_unused rt5682_dev_suspend(struct device *dev)
{
	struct rt5682_priv *rt5682 =3D dev_get_drvdata(dev);

	if (!rt5682->hw_init)
		return 0;

	cancel_delayed_work_sync(&rt5682->jack_detect_work);

	regcache_cache_only(rt5682->regmap, true);
	regcache_mark_dirty(rt5682->regmap);

	return 0;
}

>=20
>=20
> static int __maybe_unused rt711_dev_suspend(struct device *dev) {
>         struct rt711_priv *rt711 =3D dev_get_drvdata(dev);
>=20
>         if (!rt711->hw_init)
>                 return 0;
>=20
>         cancel_delayed_work_sync(&rt711->jack_detect_work);
>         cancel_delayed_work_sync(&rt711->jack_btn_check_work);
>         cancel_work_sync(&rt711->calibration_work);
>=20
>         regcache_cache_only(rt711->regmap, true);
>=20
>         return 0;
> }
>=20
> static int __maybe_unused rt1308_dev_suspend(struct device *dev) {
>         struct rt1308_sdw_priv *rt1308 =3D dev_get_drvdata(dev);
>=20
>         if (!rt1308->hw_init)
>                 return 0;
>=20
>         regcache_cache_only(rt1308->regmap, true);
>=20
>         return 0;
> }
>=20
> static __maybe_unused int max98373_suspend(struct device *dev) {
>         struct max98373_priv *max98373 =3D dev_get_drvdata(dev);
>         int i;
>=20
> <<<< missing test
>=20
>         /* cache feedback register values before suspend */
>         for (i =3D 0; i < max98373->cache_num; i++)
>                 regmap_read(max98373->regmap, max98373->cache[i].reg,
> &max98373->cache[i].val);
>=20
> <<<< why is this needed???
[]=20
It looks like this was added to get a last ADC values when ADC value read i=
s not available during suspension.
https://www.spinics.net/lists/alsa-devel/msg119808.html

>=20
>         regcache_cache_only(max98373->regmap, true);
>=20
>         return 0;
> }
>=20
>=20

