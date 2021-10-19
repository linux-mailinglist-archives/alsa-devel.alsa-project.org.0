Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3102643304B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 09:58:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A475C16AE;
	Tue, 19 Oct 2021 09:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A475C16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634630338;
	bh=+pHzUpe1KCg9Vh7P56S9TyEvAW0uVOvR2B1824yVA50=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pm9iDd3wwOpTH4on8TUr7BNczeqAaxn2jjB6/4YKc1rjCfUoumTq4tcuYphnGf+V5
	 JEmeNgxmcq6VcG/nAvV2OOLbL9IxiHoZIZvScEmm7Ba7I/wc4eXkakyXw/2kO/vr8T
	 5Nl7HRQ2YngZK6ZqjPNbjlqlVGgetYhBixWhBgVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E847DF80082;
	Tue, 19 Oct 2021 09:57:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 272D0F80256; Tue, 19 Oct 2021 09:57:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,PDS_BAD_THREAD_QP_64,PRX_BODY_76,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::703])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C695F80155
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 09:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C695F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="J6TQVHnQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMBAqb4osItwAlLSv2mVXrfeESnPFBrTBGyX6Q70rnnhqqUsyAOKjuF4I0JD09gCV4+2GwjYPAAHcv8hWR/onzUwv1OzRa+2yCNjfNcPVMdRMNrkQPfjHld0ryz6DHGPsnMXAqBlXRA0ErvA7JUes86Edqw58qhcWkZJma3gNO/Xib7o7++qbeuetPfj1/it0a4s+gqMHiqYq/D6ukvgy2jTNV6WXIiItpFg/dqHCzzJyuCwIC/xA9PAv2w+M6yTp7U86BCmBuksFcoWylyVFt1O8hOdpeeSeoKrOHc1gaKKRdg1CyFR46RUREQLls+GRRIGHOjtr0QWO9Mk0mTUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+I56tpV+0lwXd/quSJ+34BJ4mXTClCIT8z2bPeuGc8=;
 b=m3rdQ8pCppVXOrfTZT7qHeQagv3Abj4eaNfTV8pFHJgS+n2fCm82O2iig7eA+/9RG4id3MTBZrYlBbk+Knpm17c25Cf3Qgp7VFdS+uV2WgIvzvVzNQeKdI3qxhtKGiw/CxiZ13M7Iv1zDtmJ97sGZIWvEqK5GdwOTjEaDff+CKQ8B9SYNr/kGfY9qmXFB2taPftgkTBO4FmzK4lDB3PbadBeSUFEaYxuIzX4JpEKhJE8iFX6JUMDTBvFVazXDZxhsFq1RLxWl6jKH2fbOp6UqNIweNjGdzw/3Kq2FHNfX33Afdmb8OwETFXJHOPdgJqZSOoQwd7omRZ6NsgydO6NPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+I56tpV+0lwXd/quSJ+34BJ4mXTClCIT8z2bPeuGc8=;
 b=J6TQVHnQyfX8O8O0QdgBXAm3XHoDVX4bStcluEVejha32x3TRpfcOGOL8+t7G7si6INmGv921oPFSWEG3Q2FtzRFkTZWuADAkvl+KHnaH06FPt+73cXTcfIg6B9hcMw+L7Pv1QJO4oAVLy2/R0AE5uwCO2pTfFK95OTvkkhT/CY=
Received: from BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15)
 by BYAPR11MB2918.namprd11.prod.outlook.com (2603:10b6:a03:92::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 07:57:27 +0000
Received: from BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94]) by BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94%6]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 07:57:27 +0000
From: George Song <George.Song@maximintegrated.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [EXTERNAL] Re: [v3 2/2] ASoC: max98520: add max98520 audio
 amplifier driver
Thread-Topic: [EXTERNAL] Re: [v3 2/2] ASoC: max98520: add max98520 audio
 amplifier driver
Thread-Index: AQHXw/s2x3A5X1ZlPEurKpXCb3FgFavYshcAgAFD2bA=
Date: Tue, 19 Oct 2021 07:57:26 +0000
Message-ID: <BYAPR11MB367106FDD5394AA4F88A42D4F4BD9@BYAPR11MB3671.namprd11.prod.outlook.com>
References: <20211018083554.5360-1-george.song@maximintegrated.com>
 <20211018083554.5360-2-george.song@maximintegrated.com>
 <YW1quluaCzsUpET0@sirena.org.uk>
In-Reply-To: <YW1quluaCzsUpET0@sirena.org.uk>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=maximintegrated.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9299050-c638-4b5e-9fc7-08d992d617e7
x-ms-traffictypediagnostic: BYAPR11MB2918:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2918C32E4D49D15B649C04F1F4BD9@BYAPR11MB2918.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b1KdyAh7+Sb2gMMtTLgAYqy1xT0tyOi/s7czLBRceYMcf6FmYz5zydZqPS6k91E257x4rObE+a3iu3+YnAZQfVW6a6e6pb5wobruyYgLB+uIQgshrcq14e7c3o9eD4JReS7vUzgTTTm2jk2StT7ZhRWNMh84Rjzykf9vQ5UNO3didFUVXiK9acX0Dm5b9nx0OTdqRKN/FZtPYJ3zQUYmmiS9HU9+gnjoP1DlWY5o04gd0Pj1Wf0HawwpccWVzUa0ODWMHgatqpPTp9Tf2n1sfT9SBbyr8qbJ0pHu4LK/wOhB7kAHDVFpL7FfI5sZ+y++iquPBhRe7cHs4aAIMUmstiFWXsZI7A4OAFyeGG5McfMTqKlNYRIrd2PdIz23zVtEuj79CmPzi6zWom28LZn3c8d9uON3qAtiIxg08wkMbsWRzAL/TzQLJS6V3KE4r4TNNYKsQp+LrJYzC0LLcjgi7UQnbVhWhYHndHJLJW9K/20cnk+Y9aWYIdMuE5D8AW/MecP1kQ8waDGZDH/RpP8B0sd4kvif7BZ3HKx6uLUk+Hfxo4AYVaq2OgLsRmjrXSHusTmc/CtAWbA0VC54pqXSKi+SQCyzj4Lnk2LDm+ij+DkJar4U51Lcf3x7sdlF+svnqdxyPTdCFG+Jypb+2EwOAQhDhrM53iYLn0rkAgByNRE2PJ7weJNCNGSgmkvMJY6iAN+zMQtB28s5o0r5ovFqqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3671.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(54906003)(71200400001)(2906002)(83380400001)(5660300002)(7696005)(122000001)(9686003)(38070700005)(66446008)(86362001)(64756008)(66556008)(508600001)(55016002)(38100700002)(8936002)(33656002)(26005)(186003)(8676002)(4326008)(76116006)(6916009)(66476007)(6506007)(52536014)(107886003)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BC6aTa8XhI5dGIRxk8XneZhPfMnGD2LcmqMPmpYu5n4/WCgwDbzKRvbyGeAG?=
 =?us-ascii?Q?3rLiCrqLPiFEmRKdQ63+oamU0k5NrxZiWNa9wtW2MmVzNqf00MLHd1eyDqH7?=
 =?us-ascii?Q?nBHdf8d7fSWgAU4K3YWZhE/0YMRANG9Bqg7DBrVe9FtXtQCs6EzT0yxCOb9i?=
 =?us-ascii?Q?ssiEdMfzEQ+9wFppPYzQVwtJoIywV3ejuxKkbzfPyD9oSNtjsMSJKjUQXWZC?=
 =?us-ascii?Q?fRmHfq469LYBarBrk6i44wFa/wMyEIVIHvRcZGb5s5wYp1r9q8f2gG6/X/ip?=
 =?us-ascii?Q?JqzOcHsj6asZf/1cH0bjCURhnmQTin4tXUAehb1YOJWvm87Fr+PCss5tO0Yw?=
 =?us-ascii?Q?y6u90N5GNEhpJbJriQczDK55iWOrghrf/0Fs/0MiMYvRZtPGfSJxCc9nrJAr?=
 =?us-ascii?Q?qRHgWVXLlxO+PFAE9pyNsjqPZNAnD2YnEt7/FJqOCox66swr5+Bm799nh1ID?=
 =?us-ascii?Q?8DSlumg4ZlurrJVuwuMF9NERu4i7I/dTp7R2QMxLiIGwiVaMFLUH0R68fLZl?=
 =?us-ascii?Q?+xpTI6LEXEXm7kvUhBorw1/2pUbRqf4TBo+RgLABzvzi1jAkuAMvnwzXJRxx?=
 =?us-ascii?Q?sItEd3rXGtEmT93FjXJ0AXRfK1YHA3tqBi4I+GYxjyeC5POAoKPlkvRVg4QW?=
 =?us-ascii?Q?kCuxLT8VuFf9sB0/3cy3lGzgNsDhEMKgnULZv94epdKQ2SUugiGkb77+c8Ml?=
 =?us-ascii?Q?WP1orveQv1USY7DtuxSiXS+vqoRxVGr99FKbmQwT6gF3/EVPt8g+OKMOAecP?=
 =?us-ascii?Q?WDhxAWeP8DzhONHsS/J5Ju3qHySHTz1sz6emfgqVdXpI7j5D6WinEeTziEre?=
 =?us-ascii?Q?85ryz4k1svxsrw1gDX0RJHaiWXkLKmftfzZ1pcQSSu1K5oRp+2S+HNmY1iDm?=
 =?us-ascii?Q?BlUCRAh0199JXIK9OI90y4cD/T1dk8+lUxvUQyCjYHqu02qEDx8wtM7EHWzg?=
 =?us-ascii?Q?J6V/fTiDKaG1qQv0fVZl8UUIsbg3pctgzPcY0jnPtWz56r4AxKZOj8lIkjA6?=
 =?us-ascii?Q?3RgHOUbfMCzSK5gOOacv6L6QPXqKaTlIB0VsZ0o691X71LU0Exj3h1M3ATRQ?=
 =?us-ascii?Q?YgA7uGG6i2c4hp6vEk/VSec56IMMG+lvIJIeqUvKXZayKNSVU6rF75u658te?=
 =?us-ascii?Q?a4fXCsLZ4HqhpEw3Nh+2KVw4h0jJHex4tx9G6CiVDePjTEYDH5R3wG5WEvjX?=
 =?us-ascii?Q?2c1+NawXjKkEb/UM3jiUs5dZwPvNR47auTov8fHKajER/0iEuthuEmg1gMU/?=
 =?us-ascii?Q?hIyf8Zg8UieBzx8ip3MYZzgAkJwTr2BR7qho06CplPTUvmGGIVIWKDxSn4If?=
 =?us-ascii?Q?qcc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9299050-c638-4b5e-9fc7-08d992d617e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 07:57:26.9938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TypROab26yg3DtcZc5rOxkFO2JjrYkqA3IAW+tQzFqKG64HQvfVyS5qPzkK/yGa7qhL8nIwzwIQsCEAn3uxByLX5hsAgG1JPCnf99Wz+kyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2918
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Steve Lee <SteveS.Lee@maximintegrated.com>,
 Ryan Lee <RyanS.Lee@maximintegrated.com>,
 "george.song@analog.com" <george.song@analog.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
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

> On Mon, Oct 18, 2021 at 05:35:54PM +0900, George Song wrote:
>=20
> > +	case SND_SOC_DAPM_POST_PMD:
> > +		dev_dbg(component->dev, " AMP OFF\n");
> > +
> > +		regmap_write(max98520->regmap, MAX98520_R210F_GLOBAL_EN, 0);
> > +		usleep_range(30000, 31000);
> > +		max98520->tdm_mode =3D false;
> > +		break;
>=20
> Why would stopping the DAC put us out of TDM mode?  Not that I can see
> anything which ever sets tdm_mode to anything other than false or checks
> the value...
It will be removed tdm_mode to false line.
>=20
> > +static const struct snd_soc_dapm_widget max98520_dapm_widgets[] =3D {
> > +	SND_SOC_DAPM_DAC_E("Amp Enable", "HiFi Playback",
> > +			   MAX98520_R209F_AMP_EN, 0, 0, max98520_dac_event,
> > +	SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
>=20
> I can't help think that the global enable ought to be a _SUPPLY widget, i=
t
> would get enabled before the DAC rather than after it but it's not clear
> that the ordering is critical here.
It will be modified SND_SOC_NOPM instead of MAX98520_R209F_AMP_EN.
>=20
> > +static DECLARE_TLV_DB_SCALE(max98520_digital_tlv, -6300, 50, 1);
> > +static const DECLARE_TLV_DB_RANGE(max98520_spk_tlv,
> > +	0, 5, TLV_DB_SCALE_ITEM(600, 300, 0), );
>=20
> Why is _digital_tlv not const?  It's also a bit weird that _spk_tlv is a
> range with one entry not a scale.
It will be added const casting in front of DECLARE_TLV_DB_SCALE.
>=20
> > +	count =3D 0;
> > +	while (count < 3) {
> > +		usleep_range(10000, 11000);
> > +		/* Software Reset Verification */
> > +		ret =3D regmap_read(max98520->regmap,
> MAX98520_R21FF_REVISION_ID, &reg);
> > +		if (!ret) {
> > +			dev_info(dev, "Reset completed (retry:%d)\n", count);
> > +			return;
> > +		}
> > +		count++;
>=20
> Does this really need to be logged?
It will be removed for logging regarding reset completed.
>=20
> > +	/* Software Reset */
> > +	max98520_reset(max98520, component->dev);
> > +	usleep_range(30000, 31000);
>=20
> Shouldn't that delay be in the reset routine?  Perhaps between the
> attempts to read the ID register?
It will be removed 30ms sleep after reset function.
>=20
> > +	/* L/R mix configuration */
> > +	regmap_write(max98520->regmap, MAX98520_R2043_PCM_RX_SRC1, 0x2);
> > +
> > +	regmap_write(max98520->regmap, MAX98520_R2044_PCM_RX_SRC2, 0x10);
>=20
> These should be exposed to the user, not hard coded - different systems
> may need different configurations.
It`s already exposed for 2043 register which is regarding mono mixer for "D=
AI Sel Mux"
It will be exposed for 2044 register which is regarding pcm input channel s=
election to dapm mixer.
>=20
> > +	/* Disable Speaker Safe Mode */
> > +	regmap_update_bits(max98520->regmap,
> > +			   MAX98520_R2092_AMP_DSP_CFG,
> MAX98520_SPK_SAFE_EN_MASK, 0);
>=20
> This seems like something that should be left as is by default given the
> name (or forced on if it were disabled by default)?
It will be removed to be left as is by default given the name.
>=20
> > +	/* Hard coded values for the experiments */
> > +	regmap_write(max98520->regmap, MAX98520_R21FF_REVISION_ID, 0x54);
> > +	regmap_write(max98520->regmap, MAX98520_R21FF_REVISION_ID, 0x4d);
> > +	regmap_write(max98520->regmap, MAX98520_R2161_BOOST_TM1, 0x2);
> > +	regmap_write(max98520->regmap, MAX98520_R2095_AMP_CFG, 0xc8);
>=20
> This doesn't seem suitable for upstream.
They will be removed.
>=20
> > +	/* Power on device */
> > +	if (gpio_is_valid(max98520->reset_gpio)) {
> > +		ret =3D devm_gpio_request(&i2c->dev, max98520->reset_gpio,
> > +					"MAX98520_RESET");
>=20
> You should use the gpiod APIs for new code, not the legacy GPIO interface=
.
> This GPIO wasn't mentioned in the DT bindings but should have been
> described there.
It will be modified to gpiod APIs like devm_gpiod_get_optional for getting =
reset_gpio (struct gpio_desc *reset_gpio).
>=20
> > +		if (ret) {
> > +			dev_err(&i2c->dev, "%s: Failed to request gpio %d\n",
> > +				__func__, max98520->reset_gpio);
> > +			return -EINVAL;
> > +		}
> > +		gpio_direction_output(max98520->reset_gpio, 0);
> > +		msleep(50);
> > +		gpio_direction_output(max98520->reset_gpio, 1);
> > +		msleep(20);
> > +	}
>=20
> Shouldn't the disable/enable of the reset GPIO be in the reset function?
It will be modified to gpiod APIs like gpiod_set_value_cansleep function in=
stead of gpio_direction_output.
