Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F0D597B85
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 04:32:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BEF51637;
	Thu, 18 Aug 2022 04:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BEF51637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660789957;
	bh=saKXjlxWPyeKqSHKeg0N3GTbcLC+1yF6b6MxJPETtaw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QrayPC9gN/Ce79fHJX32vXIf7xXVjOIrsaNRaKbTb6G5rWDV3gmbbrL6ZZXVk6d1r
	 1j3SA6ohw/MHUeo04O0RXcvImVha4XhdgEUtknteGi4ZZwTBm7r540++g2z54CqKGA
	 tbZhbkAgXgy/zyyPZ21DkWHJJtaC4l+I8YXYPtv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8432F800EE;
	Thu, 18 Aug 2022 04:31:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE16BF80430; Thu, 18 Aug 2022 04:31:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2073.outbound.protection.outlook.com [40.107.128.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01FCEF800B5
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 04:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01FCEF800B5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3gC+ZDGX+kxJndedRcCnNBdVyb+4ioPvFTwj7LGKNydBf3owxfnY2v5koqFMO7YESGoDukL9NlBkUbsSlP+q2dnkNP+e9cPHB+xUsj0pRZFqHY/Okda+56rpFLtqAmz9nMMwsDi83MY6i4Qg2ajOGxJ1F2lhGsUvrkjxiYpkVTW0bbSYkBbcK2D4nWBhWLuJkey/NdxI/gN3qQZYx8Bf1SIvX0y0QKBqiMlkjLzzXo/IByb892ka4hSjNCs5RwfqjwhW5FaKsAar55nWko3u4ucDVmRjwwg7/gVg9/wszCXprOzfKwuBe9bNvqjzXAcAu3UnhNaLDZ1p3pWmQOBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGKG0YCcP5k2QXBGv9A059ILDbqRh//QizcGPDJzq9E=;
 b=oE6tA7UDuUVGCqhrvoIMo/gE6Tz2uku9r82kms8DVSW09GsWpQyzG2OGJS9Xhgit3moSJsYjN1qT+PU7kUNMA4L8tTV+H7sZHsw1wuvJ7mEwkr9kmtr0jjYoe5nZu0AYDZyRCxgmijt+v/D7B2+usvnm5J5aq6ljJbN9RdNGqL7uKJdICffVMGySJs6PyRPxRsOEgnwPelF3WLtjI57+zszqXKFt91lOXWCxmYk2T8FuygVe9kX3p28rmpcn22+tnxxWHq/fR8J5MMVy/T1cyU+g13MeJbMKTe/kOW4BIWcsJClCNql8vI/JPsWniYtPUSk53H3aTK4BPS4UkK2MdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PSXP216MB0247.KORP216.PROD.OUTLOOK.COM (2603:1096:300:7::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.10; Thu, 18 Aug 2022 02:31:23 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::113f:874d:449c:f9bc]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::113f:874d:449c:f9bc%6]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 02:31:23 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
Thread-Topic: [PATCH 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
Thread-Index: AQHYsenYHp2Dqaqfw0qMbVCZJ0+FF62zAE6AgADrWDA=
Date: Thu, 18 Aug 2022 02:31:23 +0000
Message-ID: <SLXP216MB0077AFAEE29B65A8A1C62D568C6D9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20220817032938.2659-1-kiseok.jo@irondevice.com>
 <20220817032938.2659-2-kiseok.jo@irondevice.com>
 <YvzaPzUpUWT9gLL+@sirena.org.uk>
In-Reply-To: <YvzaPzUpUWT9gLL+@sirena.org.uk>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb8e6137-da83-4bfb-907f-08da80c1be07
x-ms-traffictypediagnostic: PSXP216MB0247:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4jXwQt97EQ2vmovgwseiq15fK7hvFzvBl5cp2qEQRkcNL4oSpm+pYxkXwV/AXcR6IBqJWEld8XuRO5cZE8mr1ZUI22ZssO8QnNUX8sC0oJbLyx2mX50E1Tv9Hx3IYziqw09H8eJcKhy5rGxDwtkAtZQah8MjwOPDq3b41r2KBEZUThfi9w3pmd4DCbG5X03gp4f+z4Gc+uf4mJ9E+6hOrtvFyVPyybNl8knogGEJu6voAIMnPKCT763cd+GiPsPMFVThK7vbFeufZAdFCcGuH/jG5Vm7yWBzNYtVhY2bmX4tShAVRMUhgl9AC3CyMWQgJe+7eb8/u7lW2nwEZuQJOj/en0fTogUaYdR8CNN9kH3Ka0TpQctrqiVDkyO915/0Mwf8pURjMRLpW6LDsCWj3TUbVbcYRvDRlU1hnzzw3r6TvGOw+Ek3DmsBP0nuUJXl5Wf+yWn8HcE1CHfqJwiaSVktMiGTg+3LhIOA2n0y0d3HJQBT3rucMDVYgv9uiBZJkmXEqIenbrVh/eJMsr+pMcEWAVRzvjL7uXxLOSZMQQ6BViqdT493IYAzTEHomRbskKIYWd7FylIIWk/XJxi3T1TLHBuZX89HC4F+y+NDqKq7tXrCwPLBl83vRhtuyiCmqO69mUGhupdXZ1zDTUXW3JDQGwf1nadcBhI+F333W7JOtT5THb1Nkuwt9sp+4+j7KQM+ph9RXN+0apJEXW6K9Ry44jgWSkj5dNTNkRNW8fmU/uQ0fCgffrGFLJAZU/POaO5mJaSMw3krg0oWvWm1tw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(39840400004)(346002)(136003)(376002)(26005)(33656002)(38070700005)(86362001)(122000001)(107886003)(53546011)(83380400001)(7696005)(186003)(9686003)(6506007)(55016003)(41300700001)(54906003)(71200400001)(4326008)(316002)(66476007)(8936002)(8676002)(5660300002)(52536014)(2906002)(64756008)(66946007)(6916009)(66446008)(66556008)(478600001)(38100700002)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V7OGs9qNHMpRkSEmEjAdoTt1/bvXLEhRiVG+YO5lwmX5hPmUMDgk4WFE4jOB?=
 =?us-ascii?Q?HTc1n3OoZ4u2fyo1+dR0dkoCTKfAQYzW5Rqay31TzpOnZkjNZcnppySgsZv2?=
 =?us-ascii?Q?69Tfa/gGuolH5+IpHBXfOouP8FCUE8nQyKd4eEEzayVBMGM/g7UtN/iLp0Iz?=
 =?us-ascii?Q?P6v009OXmBh1HFbDsA99bAsyULJsVIeiZeE9tX9cJ/fDw5dIW86LAptVOfDG?=
 =?us-ascii?Q?CtTveb8/gfzUQhLJ2SVFNsVjHGubEbvxKnj9pnI7rM3D+vyK/32WfOgPOj4N?=
 =?us-ascii?Q?QBK4BFw8R3uHQuXledVkPalCDAQxgUzMcxr+Eps8wlpDUmkEAylw+WqwTAWs?=
 =?us-ascii?Q?RVIwnUOhpLxaeJZu3x6of8JCqeW9RT4ipiUUq6AymuXfX+JCCY0A/xGHMEyG?=
 =?us-ascii?Q?EcPu8Ae1LAEENf8yQcAzoWC8kVGfgvxkTCfLr53lXtBac4axrE+NrkpGoT+T?=
 =?us-ascii?Q?l2CHTowKip+gJiW07pl89s1I9YCPHav2PLd4zq7v34d/GjNcU84qwqrhxxk0?=
 =?us-ascii?Q?itTArlsy+m6DS+Z4pvehF8B2rfmSzuQ5SKO2oUw/mX3uwWo31RDkYy5uX5ik?=
 =?us-ascii?Q?tlYdWDGdwHIqTu0Ft7UzAb9NW0U8CIAwOFhMVs7l0MK8kOodMtYnrsVmPkSY?=
 =?us-ascii?Q?rGDY1M3q97R7e2oI4k36hy7/pthCI+YL+iPM8ZnlxgoIqAwrHe3/lLOazyzn?=
 =?us-ascii?Q?wkdWWNhIoT0eEYdG3X10t4WlskQPYVbwmGRNtWnj6wV9JuttmxdBuy00FEpc?=
 =?us-ascii?Q?T2w8ZIXzdpcovg6wLStzfMyWiVeiUPZIlHhYXl1MhIstEi807ID0WRttrCX4?=
 =?us-ascii?Q?n8A1qCNATDAHE3W6lmQQOXoj+3b9N74ZutbZNYUYdH6hadfQ2fQYBkIhl6Yf?=
 =?us-ascii?Q?eNaHWvVdOWM7ACGRzpGDSUzWXgLk+NK0N8pTevJC5P1OsCHh4QWZVacDkXKW?=
 =?us-ascii?Q?o7kXxL50Q8X0gpNHb2xFymxUP73PrVny1sE1os9qBT+LW+UgI8+dk2L/gU8d?=
 =?us-ascii?Q?kW6MuoOg7nazDubhaIzYQiwQHfWHPmiTHJ8ey3FTT1xiKxLQc0YpecG7qrl7?=
 =?us-ascii?Q?dBhBNy1WTyVuj+dPexSI29m+bfED/kJOm2hu6I7WkFWviZHS6Sc1UjosgjkI?=
 =?us-ascii?Q?aI8LRKGT2GJleIrW6fv+rd9mvUpJ00SNlNYbda1sPEIHEBimutUNt3SFC8ck?=
 =?us-ascii?Q?C88j5gTEWVLA3+j8BuFr0Xo708E18SAJ3Ev/en/I55uKO1vV11QJ46k8RGum?=
 =?us-ascii?Q?Ed7XgbcqEcv3bFb//tEjx5Rd8rzAw2jBWUf5E7CiQSj7cfzgyCZIcak03cFl?=
 =?us-ascii?Q?reuZMAzGfGZQSzYMhqW3/K20ra6kDL41olW5Qx/qyVVV+qFhQYLyJToo7V/r?=
 =?us-ascii?Q?aqZOI5sVeiibhID9lNwdjKLVPwZr+dG/d7A78ntIBs+de0GrJQPGDhLKOA/6?=
 =?us-ascii?Q?2IW6VA7V4/6Ug0KGukniZQalseZlPpTfQmunhAEzwtjTUA5TvCpSlkmjzWsc?=
 =?us-ascii?Q?xixaZxgstL7HYOdEw+H4pQAifNJoS3A2cHW0DNEjR+GKeZl4OyP9b/fDnBnn?=
 =?us-ascii?Q?SwTQ1UJ7busm2wTKu+i1KcrvkOMhOfl00neSZuux?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8e6137-da83-4bfb-907f-08da80c1be07
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 02:31:23.0931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LZbkB9gP2Lj0itLX/W11CLaQzQdagV6BD+x4OTb3V0z20UpGSo2gNW5w00I3YCoRvAMoeAyGZkJZNfllNHl2yLMvNJPVnv92pInZXftHH8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSXP216MB0247
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Suk-Min Kang <sukmin.kang@irondevice.com>,
 Gyu-Hwa Park <gyuhwa.park@irondevice.com>
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

Dear Mark Brown,

Thank you for your detailed feedback.
I will apply what you told me as soon as possible and request it again.
I'll ask you again if there's anything wrong with the correction.

I appreciate your quick response. Thank you very much for your time

Best Regards,

Kiseok Jo
Iron Device Corporation
Tel.: +82-2-541-2896
Mobile: +82-10-3320-0376
Email: kiseok.jo@irondevice.com
The information in this email and any attachment is confidential and may be=
 legally protected. It is intended solely for the addressee. Access to this=
 email by anyone else is unauthorised. If you are not the intended recipien=
t, any disclosure or actions taken as a result of the information in this e=
mail is prohibited and may be unlawful. If you are not the intended recipie=
nt, please notify us immediately and then delete this e-mail and any attach=
ment. Thank you.

-----Original Message-----
From: Mark Brown <broonie@kernel.org>=20
Sent: Wednesday, August 17, 2022 9:09 PM
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Cc: Gyu-Hwa Park <gyuhwa.park@irondevice.com>; alsa-devel@alsa-project.org;=
 Suk-Min Kang <sukmin.kang@irondevice.com>
Subject: Re: [PATCH 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303 =
Amp

On Wed, Aug 17, 2022 at 12:29:37PM +0900, Kiseok Jo wrote:

I got part way through reviewing this driver.  The top level feedback here =
is that the driver appears to be exposing everything in the device to users=
pace as enumeration controls rather than using standard features like DAPM,=
 or appropriate other control types where there's something that's a better=
 fit than an enum.  If there's a strong reason for the driver to do somethi=
ng so unusual then theere should be something in here which explains what's=
 going on.

> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* sma1303.c -- sma1303 ALSA SoC Audio driver
> + *
> + * Copyright 2019 Iron Device Corporation

2019?

Please make the entire block a C++ one so things look more intentional.

> +static int power_up_down_control_put(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol) {
> +	struct snd_soc_component *component =3D
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct sma1303_priv *sma1303 =3D snd_soc_component_get_drvdata(componen=
t);
> +	int sel =3D (int)ucontrol->value.integer.value[0];
> +
> +	if (sel && !(sma1303->force_amp_power_down))
> +		sma1303_startup(component);
> +	else
> +		sma1303_shutdown(component);
> +
> +	return 0;
> +}

This and all the other controls need to return 1 on change, please make sur=
e a card with your driver your driver passes mixer-test cleanly - it will s=
pot this and other problems. =20

However I wouldn't expect the power controls to exist at all, generally pow=
er is managed via DAPM rather than userspace.

> +static int force_sdo_bypass_put(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol) {
> +	struct snd_soc_component *component =3D
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct sma1303_priv *sma1303 =3D snd_soc_component_get_drvdata(componen=
t);
> +	int sel =3D (int)ucontrol->value.integer.value[0];
> +
> +	sma1303->sdo_bypass_flag =3D (bool)sel;
> +
> +	return 0;
> +}

What is this bypassing?

> +static const char * const sma1303_input_format_text[] =3D {
> +	"I2S", "LJ", "Reserved", "Reserved",
> +	"RJ_16", "RJ_18", "RJ_20", "RJ_24"};
> +
> +static const struct soc_enum sma1303_input_format_enum =3D=20
> +SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_input_format_text),
> +		sma1303_input_format_text);

This should be controlled by the machine driver through set_dai_fmt() and h=
w_params().

> +static const char * const sma1303_pcm_n_slot_text[] =3D {
> +	"Slot_1", "Slot_2", "Slot_3", "Slot_4", "Slot_5", "Slot_6",
> +	"Slot_7", "Slot_8", "Slot_9", "Slot_10", "Slot_11", "Slot_12",
> +	"Slot_13", "Slot_14", "Slot_15", "Slot_16"};
> +
> +static const struct soc_enum sma1303_pcm_n_slot_enum =3D=20
> +SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_pcm_n_slot_text),
> +		sma1303_pcm_n_slot_text);

set_tdm_slot()

> +static const char * const sma1303_port_config_text[] =3D {
> +	"IN_Port", "Reserved", "OUT_Port", "Reserved"};

This should be DT properties, possibly using the pinctrl schema depending o=
n what's actually going on.

> +static const char * const sma1303_port_out_sel_text[] =3D {
> +	"Disable", "Format_C", "Mixer_out", "After_DSP",
> +	"Postscaler", "Reserved", "Reserved", "Reserved"};
> +
> +static const struct soc_enum sma1303_port_out_sel_enum =3D
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_port_out_sel_text),
> +	sma1303_port_out_sel_text);

This looks like it should be a DAPM routing control.

> +static const char * const sma1303_spk_off_slope_text[] =3D {
> +	"00", "01", "10", "11"};
> +
> +static const struct soc_enum sma1303_spk_off_slope_enum =3D
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_spk_off_slope_text),
> +	sma1303_spk_off_slope_text);

Why make this an enum and not just a numerical control with values 0-3?

> +static const char * const sma1303_spkmode_text[] =3D {
> +	"Off", "Mono", "Reserved", "Reserved",
> +	"Stereo", "Reserved", "Reserved", "Reserved"};
> +
> +static const struct soc_enum sma1303_spkmode_enum =3D
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_spkmode_text),
> +	sma1303_spkmode_text);

Use a value enum to eliminate the reserved values from user selection, howe=
ver if this is controlling if the device has mono or stereo speakers it sho=
uld be a DT property since that's unlikely to change at runtime.

> +static const char * const sma1303_input_gain_text[] =3D {
> +	"Gain_0dB", "Gain_M6dB", "Gain_M12dB", "Gain_MInf"};
> +
> +static const struct soc_enum sma1303_input_gain_enum =3D=20
> +SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_input_gain_text),
> +		sma1303_input_gain_text);

This should just be a normal volume control.

I've stopped reviewing at this point.
