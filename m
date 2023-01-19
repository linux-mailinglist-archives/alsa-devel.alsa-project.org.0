Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4084673378
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 09:18:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36E5B7F1F;
	Thu, 19 Jan 2023 09:17:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36E5B7F1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674116281;
	bh=fN/fYWWadpPdf63ZVoi6ilagkm5xAHBxaiNhogMm62g=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=s/0SN/8HdB5xM6Lc5NnDHxsQkrpMmR9xfVzIRAQWNBZhqr3UsoRhX33pjEIj/vFex
	 xpE4F2Kqpc7Q3PwN3WTywBXYgRWFBAUD8m+VYEqdUaK9V3vLD7J76uKwlXks9lXbAM
	 I0gF+czNxralvzxO8gXrM/QrqxE08om5g+8Cm3Ns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91DA1F80083;
	Thu, 19 Jan 2023 09:17:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76D69F8047B; Thu, 19 Jan 2023 09:17:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2051.outbound.protection.outlook.com [40.107.129.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BCDDF8024D
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 09:16:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BCDDF8024D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xd0L65v35ApvLOzF0qszXzlNLL6X46O1CSUrVmWf/eTE4cB0accXOjGezZoKHHtCbiSa5b7kHZeD6hF/85XgCQ3GKGL8xFtgJqloVqEiIJlpNq7NWU2KhuFrz8tScCjp/B6lieK8vo1fRZwCPCjKvcfYT8nv9fabbXrLxqCtlmQAih8br76TxqM2R7yqR1pgI18/dhVRwiEHCajIjqHjahZeZNC2imrducFB5PcsL8WBwoWYLSgdGvo3efvhUkpxic7xkjNgJIQyzRXOFJSvQrSZkELpIKPrqtv8Sr9PVS26Lp8hMqSwRjjxoY7MLiiidrMqxt/r2CKkQmXbI+Ys6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtyZwMor/wDKmelAJUWF35apIOhA5bje4sMf/gOBdKY=;
 b=hl7QGueWiPGuWteHo4vV7iG7x3nLaN28NtIp41AM9IFxK/f87alUKmQxxEvI4DcutXKgLI19xWudyF6kJQfBm6/ZdJ+IMBKlPjk6TU/EZPuh2cmKmqsD0fhy+ZIKlIYD9VvRvPQ6fRiyrV28q1O8ZfNBx+eRKIcODNw62omfcwnpkZj11ry7Tp/4IsiCOWzIPI1+1gBvh0enY1IWtwVKiC0rW+GcVpt4xZ2hcg7neT5fvlSc3uxAgFpT/XwhaoV/Ta0KKrj66eVQM4vBurlU7kHz3jn13vI69pmdjlhP05XFKNSkg9AX2vCrcFEjneauHPPM47Q537Uk+QNpoKrl2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PSXP216MB0181.KORP216.PROD.OUTLOOK.COM (2603:1096:300:9::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Thu, 19 Jan 2023 08:16:53 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 08:16:52 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v2 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303
 Amp
Thread-Topic: [PATCH v2 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303
 Amp
Thread-Index: AQHZJArIVEzVfU9li06XNzQ4m2TLv66cgOuAgAiI19A=
Date: Thu, 19 Jan 2023 08:16:52 +0000
Message-ID: <SLXP216MB0077F86978B363B5F4ECEBC78CC49@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230109091402.11790-3-kiseok.jo@irondevice.com>
 <Y8F5+7vgl+f9rytb@sirena.org.uk>
In-Reply-To: <Y8F5+7vgl+f9rytb@sirena.org.uk>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|PSXP216MB0181:EE_
x-ms-office365-filtering-correlation-id: bd93029a-21b5-4dde-4580-08daf9f58590
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KY1w/lApBSwYdlHD+SNDQ4BuU+QOUmNqjccoF+JZvfHPC5z2qd47mvlZHTA+uPfTtpyjudz65Q2f8LFU0LcRnmHSq28suzOm61YcUybDnXkkAAA8lCYke5/AWDLcmAYSAuflE4EJ5J8nx5w/IzeAbTvwtzDaMZ4LWmn65crkeqM4ItABoDptm8+iE4NcfxoLTDjNCcXZ58eFLlFrZaLUT1iAFBHPsdPlLzjxn/lgbZo8R0zdELo1Pyp6/HdgQvBziLMDMiEU+6WGkDVQfd2Izh9cniVbel7tWcgoOfYSYI9S4TK41doXFQ4eF+hAMknAIMs+6LGZFX4+w+l1/LUdmYIZaH2tXEIaitfQuRCP1GPKkg5Lycdmb1YFV3fiXbR+m0mrYZGjXLPK4LewJueYH85yR1HL5Zjbe1lzxJyaaeF2AZkIGjwXztfW52NxMxoAcbf5hImPzzGdesCnuaJ4ZQIJ8Qx0wzJHHGgsLRpmTX5s3IXUdeFuUZjY5UKyKMupyifyHKLTcbeuwki6EijO5cAo8fcJIsLrWqif++c24UtM2S079UoawDBOw89lJ1OvPxQfGCOW+JLP2/SZ6bqm2c1VEmpmhoDOJ7OazeEc+LtYphGuyqRRgEpDhrjwtrz7Lkpo71pT93xF/i4OzK0J68RKiCsZgOP1ABLQNPGLToEPvYpyp3stqRYFdT0SdTy9x2vL0IgCqEWGuDQBSYsaew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(39830400003)(396003)(136003)(346002)(366004)(376002)(451199015)(55016003)(33656002)(66946007)(4326008)(8676002)(41300700001)(66446008)(6916009)(66556008)(64756008)(76116006)(66476007)(52536014)(83380400001)(186003)(9686003)(478600001)(107886003)(26005)(6506007)(8936002)(54906003)(316002)(71200400001)(7696005)(5660300002)(38070700005)(86362001)(2906002)(122000001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5JuIoGFukJxkrpUnlJbUF04maxi5K+xsTtM9dhgCcIZMgg6t2nZy2qljgRfY?=
 =?us-ascii?Q?8MDLAueyidBE0Rx5daX9veFBcns9r7HgL0E9a88VbXdb5C9BIktjj7qAVZNM?=
 =?us-ascii?Q?2XK/yhBF6aGiCelmNx7TWCHhKHS7iSxLe6NrG82Gw5ZjK9NtcWiGgvaoCh+m?=
 =?us-ascii?Q?+rl85D4Q9/d0X41YlPkO6GgIQXbLT6r+OD9gOmRpeh5rDGlk9S5LyNm8XoXG?=
 =?us-ascii?Q?Pn3MuKNDNVopdwyJEaeUHdrE6udNoFeJ0i2x7eLFhtcoT5z6cXkueWWoEpI7?=
 =?us-ascii?Q?qsj7p8uaNFnrTZCxzcwJttasECtLYIeA3MdNZOQ2HbBRVUsLC+gPaWLvRYES?=
 =?us-ascii?Q?AvPe2zcrITfTeiW6fxW0JjfZFiMDkgC/hffkHu777esAZG4C/TBCbLeTI/mM?=
 =?us-ascii?Q?EjSVOzZCt00y3jeAvPq5I69fgu03vkstJkH4j2gn+Y8lE/h4cYiFe2xAldOb?=
 =?us-ascii?Q?tww19y6Y5xH+bcr8Wy4xeKCuc4JuoFkdIaay4wLvnYK+OfF/xI5wiZ2h3uTW?=
 =?us-ascii?Q?soHTW5q7iTLznKJ/e98A4gwP3Fff6GLIaDInbq2PQL1qx4dmWy6KUgyJOaVG?=
 =?us-ascii?Q?mkolVS3lcakix7H6iAPxWYdJzoZCz2pZQozrBvBC448gRa1MT9EXol72eYH+?=
 =?us-ascii?Q?6+yfStP2Sl5YZv9RtZ5CaKQUhGEKgy0fWtb777WTknRk3zF0qAmPGvOQcU1h?=
 =?us-ascii?Q?B1g6B2VabG4dRnqzFCssT6BFuc2jJmi9ft/n9hoSPJTOQLkhVVhcuewIzvei?=
 =?us-ascii?Q?PVj0ITGz8Z77Us5ym1xlogMJnSWvkB3/R+YT8vjELExRQs4EIp5BPUzX771s?=
 =?us-ascii?Q?U+QiOHCo0qj2iw5xxkYCKtiSfX+fHNuYKVnsAdUIuZA6m+mJOTgPOY86v0i+?=
 =?us-ascii?Q?fw63+z/xdZ1iNvUW0yLFeoU3n2EBRK0AWzAKMmQP/XurqZ1grSeAZzojeqUz?=
 =?us-ascii?Q?SdeyQ59TwrxmqA3BwKSU+QhfBzyzkUzI355ip1QQW8MLUJHPZiKivv2SxCrX?=
 =?us-ascii?Q?Wh01iYEubWKup5UWifZv/HuAF7UeIhGqPiMyYpctrCDxwMbOwwDAIxXZ5GVE?=
 =?us-ascii?Q?5K5kaJH/oXLY1VL7XqkbqB2MuPNvA9X266jBaMgXcU3C7kBiEwwKgQgwbMkK?=
 =?us-ascii?Q?6aTn/wklNGggdr1WNbi5IUGCUq87pnwrtR9h+Cqzt2velLbDtgI2ZZSY3dTV?=
 =?us-ascii?Q?MCgugFYRBZOifumQX3DViPkgmO9r/XftpvyG5FK6CAQTAlHdQ49YdVJavCXX?=
 =?us-ascii?Q?z+5wzXr2qvrYLQFqyL4R11dDNC2wtwuByv6WDkojj1ZUiUBx+sGKTOzc7+8A?=
 =?us-ascii?Q?rVZL9gZ+Vgf9RNWCAFotFpqfOvzH8ATAc6qg8nifGpw6AD2iCfqPPKtidzvt?=
 =?us-ascii?Q?elgj41sUbQpOHYhLkni8WpXSTyuip6nKBzgMV8H0R3ct/jTsYVP++U8jh6zS?=
 =?us-ascii?Q?D45LLOL0cwmddFjzeqNVDbs58fsrDtZgB4XKiQWjhnFViIkZiYL6sVojfAv6?=
 =?us-ascii?Q?Dc1xikmLGjMRSo9eUaF85GR+3jEKtuO1AJvpx/3RTNfcJ3bkOH87U3IDdDEm?=
 =?us-ascii?Q?hL0v1Cd9UscFtO0xCUMvhrDezgu+3pUMRaE4IUOP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bd93029a-21b5-4dde-4580-08daf9f58590
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 08:16:52.9006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VKsZl4pAxXCMDks7vHmPsBTcrw3z/gT8XfVFMvLZihCiL73RV0j1ccSSgo0tXg7EGsqhH1QQ9gRPui+ofbLWTeOCiby2QHB0c7tIJ7DaFzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSXP216MB0181
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Application <application@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Thank you for your kindly feedback.

I have some questions and answers.

> > +	if (!(sma1303->amp_power_status)) {
> > +		dev_info(component->dev, "%s : %s\n",
> > +			__func__, "Already AMP Shutdown");
> > +		return ret;
> > +	}
> > +
> > +	cancel_delayed_work_sync(&sma1303->check_fault_work);
> > +
> > +	msleep(55);
> > +

> That sleep looks odd - what are we delaying after? =20

It need for IC(Amp) issue.


> > +static int sma1303_dai_mute(struct snd_soc_dai *dai, int mute, int=20
> > +stream) {
> > +	struct snd_soc_component *component =3D dai->component;
> > +	struct sma1303_priv *sma1303 =3D snd_soc_component_get_drvdata(compon=
ent);
> > +	int ret =3D 0;
> > +
> > +	if (stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
> > +		return ret;
> > +
> > +	if (!(sma1303->amp_power_status)) {
> > +		dev_info(component->dev, "%s : %s\n",
> > +			__func__, "Already AMP Shutdown");
> > +		return ret;
> > +	}
> > +
> > +	if (mute) {
> > +		dev_info(component->dev, "%s : %s\n", __func__, "MUTE");
> > +
> > +		ret +=3D sma1303_regmap_update_bits(sma1303,
> > +				SMA1303_0E_MUTE_VOL_CTRL,
> > +				SMA1303_SPK_MUTE_MASK,
> > +				SMA1303_SPK_MUTE);
> > +	} else {
> > +		if (!sma1303->force_mute_status) {
> > +			dev_info(component->dev, "%s : %s\n",
> > +					__func__, "UNMUTE");
> > +			ret +=3D sma1303_regmap_update_bits(sma1303,
> > +					SMA1303_0E_MUTE_VOL_CTRL,
> > +					SMA1303_SPK_MUTE_MASK,
> > +					SMA1303_SPK_UNMUTE);
> > +		} else {
> > +			dev_info(sma1303->dev,
> > +					"%s : FORCE MUTE!!!\n", __func__);
> > +		}
> > +	}

> If you need to shut the device down to implement mute then it's better to=
 just not implement it, you shouldn't emulate features in the driver but in=
stead let the core worry about how to handle that case.  AFAICT this is why=
 there's the startup/shutdown thing for the speaker amp?

This is not power down device. It's only make zero signal level(only mute i=
n amp).
I removed checking power status.


> > +static void sma1303_check_fault_worker(struct work_struct *work) {
> > +	struct sma1303_priv *sma1303 =3D
> > +		container_of(work, struct sma1303_priv, check_fault_work.work);
> > +	int ret =3D 0;
> > +	unsigned int over_temp, ocp_val, uvlo_val;
> > +
> > +	mutex_lock(&sma1303->lock);
> > +

> It looks like this mutex is only taken in this function, is it needed?

This function is in workqueue. So, I think it can be done at the same time.=
=20

