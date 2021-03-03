Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EB332AEB6
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 04:05:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1079B1AF6;
	Wed,  3 Mar 2021 04:04:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1079B1AF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614740744;
	bh=/cuSexxBveHGP7YRYCXoqRCzfdxb8T4djbW+ETAfwQE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GOdpwemYHqzzTTwfwd02jFTnkFaMYuxaEHJXz5hf0D/i452aVXSXjUWPRJM7hi7Y5
	 xOsD6NiVWvNSXEpseVIM85HOGgUvQeg59+Lf8e6u/kVIoMraAmw5UfQsskzDA/+ZXK
	 OgqgTDM7/zviungdZ/4ozUl90TGx1yKrHMQScI4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48598F8026A;
	Wed,  3 Mar 2021 04:04:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55202F8012D; Wed,  3 Mar 2021 04:04:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DACCF8012D
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 04:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DACCF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="BihqzHq9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ku5AtydvgBCy+vE7rTFD4pytecvIZ+NdxOnl7F2sv4bFtjIbnqYYYVE/4BLHEQ22ReuPYEdgLwKf6elIomps44Kd2/jaI2w4eKsytGNGwwPY+tdqPeTVA9o/ihRZ8P6vq6dWOLibi2DsK8lFwQwC4eSkypozd1DBZESmTiDRKzlVm0Or4u4fSjk9KssEJJeN+qc6GNwdHZs+NicbJ4s4nj8ZwO2jl015deBjC29QwzCjBvWIvxeD/B0nrIRl0A5mQ58+ByyRCRaU9xg4CXCLvgDhl98MOj611SPDxCkj5PMuvViJYkC65TeIaObLJadAmyC4HCYSxby4vcF5t3gDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/D5nKv5wQfcTaO4BXU6pe7bIoeNphJ24FJBSJ22amvs=;
 b=NfMmh1mERKg8t1nyYIZz1cI+V+xkucRyuo1mijohPv/hZAPToLlK7lVQuzMlZRCoUbP8I+mf/RM6Gnf9tqDIjxk7+Xb+T+rgZKjlNuWn+6nfB2KpaucWnNmCV6qkk6VdaShoS7fbWT5y8nJFEeEYFg9+Ex28jSnPyIz55vSQJ2a+D0UqyCdabXsSOAp5MDj6ndRBM4y2OfSoPBG3xwohYPu54rbUUtE9MQPdkh5wxycC89WzCT9RrfRd6uw5X6GdOKUwDhiAvFcbK4nB3Wdqsssd3vOq2nVTG7Wzi5T+CCYKTuk6hSeRyNXZdAOEh+Wyql5PZMJ++GjiHIiSDS7GnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/D5nKv5wQfcTaO4BXU6pe7bIoeNphJ24FJBSJ22amvs=;
 b=BihqzHq9At4LPkdTs9HVWVl9nYR0PgS6B+onm2EeJ75ERH8CqfX+niygThwj1x3ngylUKzFigCcPy6cN1x5Zml6MFW31vQj/8UzAEHw6Dm/CYxLYpreiExNNLjlnWjDgQOA8Rk/PXPKR6yRibUR62bmMPCT2fQ2vHDIsdD5Ow7I=
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 (2603:10a6:803:11::14) by VE1PR04MB6366.eurprd04.prod.outlook.com
 (2603:10a6:803:12a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 3 Mar
 2021 03:03:58 +0000
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::44f9:8fcd:687b:5bf9]) by VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::44f9:8fcd:687b:5bf9%7]) with mapi id 15.20.3868.035; Wed, 3 Mar 2021
 03:03:58 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm8960: Remove bitclk relax condition
Thread-Topic: [PATCH] ASoC: wm8960: Remove bitclk relax condition
Thread-Index: AdcP2YkNTs9JlZUES8uQJyzzMM6bKw==
Date: Wed, 3 Mar 2021 03:03:57 +0000
Message-ID: <VI1PR0402MB33424B6B9D35C1D280BA161AE3989@VI1PR0402MB3342.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: opensource.cirrus.com; dkim=none (message not signed)
 header.d=none; opensource.cirrus.com;
 dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 40893219-1307-4fda-e145-08d8ddf0fd0a
x-ms-traffictypediagnostic: VE1PR04MB6366:
x-microsoft-antispam-prvs: <VE1PR04MB636646186EE08C31426C804BE3989@VE1PR04MB6366.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v9yDB0O+ES0vCWPdzXyin16fQazK08oSLG4mjdxTsGyyc1a+tiKuGzkvYzLYzCjzJb49XVzuPxdcrMH/MVZ/C1gUG117R32WHDy9R53Y1QW/5m9LPRWmtBuZtjDSGdRBaX3nSNNVtwoYHC7Hy+EkNTn2JOzDV46Di/VzsTHtmp1vhBWl4wWGn+lDRoIzhcvpBBeINTEONTC7Yh2eSjExgnV2g+Y7540ETdOyUWuYKVlEuUTYV8ZaV8mGvZOtMwTOGo7dm1UOHq7R46i/5Xlvg+PyJ8hlzqfwnE6PHZCx3VrYFXWuFPHQfAOosBsRFqrDv83pn/uf/qisaPjXl5pp7pK8rKqMVnQTV4gKv5QcAkTsWANYQmJ0zr+fsV+rjH0PKVDLJgrYAOFt69U9i8LuiQ2HyIf5BJJjATJ6o7iyDngTz6opSOqLbZ09W4hbLiIxejWGtC+mHKWoZ97b4lQkXbs4i8trQHABPbEMG1w9T00aXBnS94Tcihm+UnD3czuoia47pVZjHat5TdCAK+N2rQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3342.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(8936002)(55016002)(2906002)(8676002)(316002)(86362001)(71200400001)(76116006)(64756008)(66446008)(66556008)(54906003)(9686003)(66946007)(52536014)(66476007)(6916009)(478600001)(33656002)(4326008)(6506007)(83380400001)(186003)(7696005)(5660300002)(7416002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Ez9RXIizSX8b7BjzCco/fQpV8gfaeGLEBwWRNymC2HChDgOoTFWv0NgwKga6?=
 =?us-ascii?Q?F1eEFbsfo3NCnX2oXWhEb3CIh8F27U+ZYRc/AscPS7AxLnFrxWMZaSL+Hqu2?=
 =?us-ascii?Q?y6o49dQzMHeO4PqXlLoTX7c9Wx5mPEg603sQ53Hc+CHmMDWOy5nXbTeSslcH?=
 =?us-ascii?Q?aR1QyCA78RtLGq1oQXX+TGhDNgv0vRWIOM2IR6WGieFUuXQOOBlVAPO2mDy7?=
 =?us-ascii?Q?UvBxV/TYk6hv5qRxCj4YcxWRhK0zTjHdrQ8cmtEhFoTY0CXT2s3Q9ANuNF9x?=
 =?us-ascii?Q?DVAoqs+oQ0wBWy4INKR+WbV1aZPNbTja23mPCyhHuVvWTi9BKVcOtoEDVjfe?=
 =?us-ascii?Q?rzP+ppiTAWEDSX8mjkqU5EXXnPmxRNfdF2EfyU1TBuXzEQEz6fwwif6HgUBT?=
 =?us-ascii?Q?LMaVqLB5b3zho2R+BGTQEC6ZFU4b1LSbF6zPSvhN0CNXEMOXFHTrYX9rJWYU?=
 =?us-ascii?Q?Yfvk9Tyophh/gk1fIovOtpsO2PJr7P3wFGLKu5Vlw+fN9CfnXMTS8CvdB4L8?=
 =?us-ascii?Q?P9XO0ysr0qCZRmxTFI3xG6JFZUMjWmU557BHMk/Js92UgANpcxBjDXKD8BH+?=
 =?us-ascii?Q?W2s80l00Ee+5vDyne5Q+cNlMQUbiby/wXIE7DHxX+yoKDogUvh49FK6VfI78?=
 =?us-ascii?Q?s2Isd7TCt1qdNMtYo4BNaqzP8nxc5I4BtRUaYzbUDveewDgrzJ2L1hDtQXcI?=
 =?us-ascii?Q?oc59qSaL24yKKDcSHZIHQxYPGdGz3FYa4gh1ft/pKmSK4TUz+5NtQi3p4jNo?=
 =?us-ascii?Q?YyKW1VR+Ux1uqf2BY2Ob0Asg16DYzzX3lzGiDHxsc25sML2RgT1pbesO/JAq?=
 =?us-ascii?Q?OxedNcylYzQmFJhIQ311tmUW0rTXifEDYfAVTBb7VEHVzm6RMMv0hwNP/ZE/?=
 =?us-ascii?Q?2nbeFUUpjKtLer3yF9n14sSoXvf3TVAKCYDT5+hQShewGmKUmPybV6GPDPLA?=
 =?us-ascii?Q?jnlWLJftFTxjWC+gTC9NEJyYPrud995a30v+n9G59DI0J3+ELRVE4+6xtfTh?=
 =?us-ascii?Q?NpmSKJeMS9cthuitI5hY5Mn/4SBuuvM4IS2q/N1osnB3h2V6Da0I4D7gW51L?=
 =?us-ascii?Q?EwXU271rKpt7EEo+JslhKaIoadg0xkyUfwNYJK879wG900aKt2Dn9dSrO/ud?=
 =?us-ascii?Q?fxYGnqsazJIKyeXMKqtxiE5xS5EFMvXhmJtewx//WcpGHWi01YO0AVqFcrmP?=
 =?us-ascii?Q?tddKbxUHNq4Zp781tjURHsqDm+VheHTjLo08ajOtorlwAksJi3Pfpw2mV9i0?=
 =?us-ascii?Q?Aq9kGRH92wQMR0pRT9qHsPz+1owU6S/zxd/Y6SCKNDP+Q1RudtGtzieYlEoU?=
 =?us-ascii?Q?nGGl6/SUkKCU7ouOST8menTQ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3342.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40893219-1307-4fda-e145-08d8ddf0fd0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 03:03:57.8844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mFdiX3CyXtpCKryx7fXeYgLBvuMaTyvqkPC7r06wVogPhQ9MkNtxI4LSKiLpfgczNnMv6rN12l6oPb0tc2AmIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6366
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "info@metux.net" <info@metux.net>,
 "ckeepax@opensource.wolfsonmicro.com" <ckeepax@opensource.wolfsonmicro.com>,
 "allison@lohutok.net" <allison@lohutok.net>
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

> >
> > Using a higher bitclk then expected doesn't always work.
> > Here is an example:
> >
> > aplay -Dhw:0,0 -d 5 -r 48000 -f S24_LE -c 2 audio48k24b2c.wav
> >
> > In this case, the required bitclk is 48000 * 24 * 2 =3D 2304000 but the
> > closest bitclk that can be derived is 3072000. Since the clock is
> > faster than expected, it will start to send bytes from the next
> > channel so the sound will be corrupted.
> >
> > Fixes: 82bab88910ee ("ASoC: codec: wm8960: Relax bit clock computation
> > when using PLL")
> > Fixes: 3c01b9ee2ab9 ("ASoC: codec: wm8960: Relax bit clock
> > computation")
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
>=20
> I think this is probably going to need a much more involved fix.
> The problem is that there are systems that depend on this behaviour, so y=
ou
> can't just flat out revert it. And to be fair the I2S specification says =
that bit
> clock can run at a higher rate than required for the data, so the behavio=
ur is
> correct as well.
>=20
> Probably the best solution here is to add additional contraints from the
> machine driver on which rates/bit depths/channels are supported.
>=20
Just double check the issue, the real reason is in below:

    The call sequence in wm8960_configure_clocking is

       ret =3D wm8960_configure_sysclk();
       if (ret >=3D 0)
            goto configure_clock;

       ....

       ret =3D wm8960_configure_pll();

    configure_clock:
       ...

    wm8960_configure_sysclk is called before wm8960_configure_pll, as
    there is bitclk relax on both functions, so wm8960_configure_sysclk
    always return success, then wm8960_configure_pll() never be called.

    So bitclk relax condition should be removed in wm8960_configure_sysclk,
    That wm8960_configure_pll can be called, and there is also bitclk relax
    function in wm8960_configure_pll.

I will update and resend this patch.

Best regards
Wang shengjiu


