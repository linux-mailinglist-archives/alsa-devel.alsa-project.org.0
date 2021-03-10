Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B91D13333E2
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 04:37:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C102178D;
	Wed, 10 Mar 2021 04:36:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C102178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615347450;
	bh=WNQJ0n0ezk8A7bIf92ix7Qr9Z402ZvZC2H4lKs7+f4c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HQGH8ymtkJB9nwwEbD5wA6mHvNfP6YismRiTSqS9aULuwjD/xLAANsp27AXTwXeKB
	 nXRZmn17vqEvkFzC/HTDNB1crgulrnuFHG/npDCgtEGHINO96bAO59Q2oHHzp4DAMg
	 xQfFV1iSB2Z2dnv2KrVw2jYowmz8ZBIlG4sdcVSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B12CBF8016C;
	Wed, 10 Mar 2021 04:35:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50C44F801D8; Wed, 10 Mar 2021 04:35:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2105.outbound.protection.outlook.com [40.92.42.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12789F8010D
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 04:35:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12789F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="mO4Trgep"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+zYvqDoQVswM0FUXdQzgHMWYG9NHuLcgI6tS10E5jQrEQGa3gm1nOXCdRBqVzy9OGEZi9b/dM8VaDRMYQ+sHqId8TSnjk+7uFU2ntjwAA13zICIRvrIUdWvzsxGedsmXaKxrSiPDPHRx5qdQ/3aSd3Vuy3XOpb7ZcuCw+T1qXG8lynoO3PzzT8g06EtUqHKBRELwNejcrRZ8mNuSHZ3DhuXGFNPRyJYDgQk6/fzDSkob6lH56TTfc4+8K8rG9e9Gr4lXv9a6zAqmvQa56ryavbYqUWrRAHbJcNU946PnU5I0y6+ctIc8Do5wKzs6opIrHucpkQfujSByErq5X+uCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRSgiHq3ndRhAbrpN8TrsSISEuf3cTa2TUFyn1zjicM=;
 b=FRYoNVYQThQdxW8oNPlOPG5lZKmroEdbQV1iYw8pbf++CgwIhdyDh79Eh07NkE1TGzZvRgJlM9VAl4Gx+fPYoqIwGF9OlCaUxrIqi322Yh3FNZ8D+hysqaTRe7XWxne9Vje4g0zErCy+uPxwMX63gUI5z9cb80TX6e1xLdqrAZSI39s8UsKRatcwx8M3jCe6JH8CCDhBP2hUwzrcoDCY1jIguoZucHPY6Q80ujwLjjcdZVmtTH3ZH3p/7Kz9O+EaiQ3MPir0tlB6PDqxXZ2CXi0FK6svnhEPzSU30M/+cJNeKBIwb/SZXwZLSImW6XiKDi6YWXzQ4m9px7+U8RR1BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRSgiHq3ndRhAbrpN8TrsSISEuf3cTa2TUFyn1zjicM=;
 b=mO4Trgep/DtF79B2+wXbEUzAKxhrrO4Gl9CKUuIr+Ynzb7Y1xY5yQ81aOp6kldMkOnzmCZC0gjqZaoq+gtkPTCutKx9/kdJ44wOUoWAlzkoSLBrAZ86/MjnhpmB+pX7NTuekrJk8RtGR80UPSvjal6mJMOGjEncbukCdAwMmhi5F8ogPsvv8oyTd4TohbHv39EnJhCvLQTuFFHOXePXB1kBBAVHWUCIvur4UY0Ee+ytdYH5GQy/4ydtcyaysrAUhCC27z32Q2j2mcqllZfZWtnl+LXLQFx8R6sQ5qv3erzj3gQF/TYcLHKQB+BBrQjbpzRr+fJOBgefg5wFJrM9C+A==
Received: from BN7NAM10FT026.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e8f::50) by
 BN7NAM10HT014.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e8f::392)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.25; Wed, 10 Mar
 2021 03:35:38 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e8f::4c) by BN7NAM10FT026.mail.protection.outlook.com
 (2a01:111:e400:7e8f::407) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.30 via Frontend
 Transport; Wed, 10 Mar 2021 03:35:38 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3912.030; Wed, 10 Mar 2021
 03:35:38 +0000
From: Christopher Morgan <macromorgan@hotmail.com>
To: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH] Add audio driver for rk817 upstream
Thread-Topic: RE: [PATCH] Add audio driver for rk817 upstream
Thread-Index: AdcVXm0tbPZrbz/4Sw6AZ0QeOluRvw==
Date: Wed, 10 Mar 2021 03:35:38 +0000
Message-ID: <SN6PR06MB5342AB91CF7719397E81693CA5919@SN6PR06MB5342.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:51024CF62F112007AB47F332E927A82BF982A6BC98610B7F1F7589B29F86E11E;
 UpperCasedChecksum:558B47EC50337A7DFDD1A483976369F217193071EC19099EED06E5D91039C737;
 SizeAsReceived:7085; Count:42
x-tmn: [CgyccGtfLaOvu/NR16E9XxhkfCtS6fne9bVitC2/flcqAb6+WBacrlsuW+o9R3ofziGtYfz6KXU=]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 73262153-6b2a-4e11-bb2d-08d8e37592d0
x-ms-traffictypediagnostic: BN7NAM10HT014:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3fi4dXBROnFw/IMpZWaE+0JfK4/deCLvABuoyXALoYwYLZovWOSLGE3N9K568CV3Td9Cc2Pz5vuwlIQza6yNHh68J70YxeEbX3hNIoiqUdSwBzKBJxxeoVpUg4FQgrHuEmCjicWiUda58q3qogIVVJrv8EhFRYZ4s+vw35uvJZptdHfCgFEcxXrE5yPmSG/+bOBvDRkHCO2C505cYhvHXEImF9G1Q5TixeyFJ5W3oHxgeqWjMB3QWk4+h6bqhviarwxs/XF4D+oFEWGvtymkNZ/9Q+o5Ux2roheyFo7ARXlwBqmVORthO4bQ+AoNmygBHe3RmLi+fBP816Kf+1+DF763s1BTO91xcLe/OgmxhogukWfcDyK2d8SL/eEfY57YeVmyClBBXdIzVhcV2YkIS96oH02+072BT4ZPefomcs4=
x-ms-exchange-antispam-messagedata: zv+1WEORO04hfq4zbkdTkPoD3Co+3KVD1gowzakelesVUTLu7y9MU0GrMcYUoYWa0nrEHGFDUVUIGjVpt0+aHMpPU7oYei8wMkd1N7R1NxjckZpP9OP4udR+82/DIyuX3eW/uDjiwq1EF1a/jA6rM0b2oBGLrcSoSCxRFMSM0jQ529/UcN//msDxBLbnVroHtshycKTPIz9XtNQSeBYSOg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT026.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 73262153-6b2a-4e11-bb2d-08d8e37592d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 03:35:38.6137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7NAM10HT014
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>
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

Thank you.  Turns out my mail client crapped out on me (I'm trying to switc=
h to using mutt for replies and accidentally deleted the thread) so I'm afr=
aid my nice and neat reply didn't go quite as expected.  I'll work on the t=
hings you mention below and resubmit this as an RFC.  I'll include the devi=
cetree bindings that I did so you can see how things are mapped.

To answer your questions:

Acknowledged on the maintainers, the signed-off tag, the pointer, and the c=
ommit message.

I don't know for sure the best way to accomplish things, I read in the docu=
mentation that the simple-audio-card has an option of setting a GPIO which =
should automatically register with the jack for headphone or microphone sou=
rces, that's what I'm trying to do.  The specific chip I'm working with has=
 2 headphone ports (R and L), a single speaker port (let's say LR combined =
to L), and a single microphone port (L).  The codec itself supports 2 chann=
els for the DAC which either power the headphones or the speaker (or both a=
t the same time, if you don't mind either only sending L to the speaker wit=
h a proper RL split on the headphones or RL combined to the L headphone wit=
h a proper RL combined to the speaker).  There are also 2 channels on the A=
DC, but again only one microphone port which seems odd.  Register documenta=
tion here for the codec: https://rockchip.fr/RK817%20datasheet%20V1.01.pdf =
As for the specific implementation I'm working with its here: https://dn.od=
roid.com/ODROID_GO_ADVANCE/ODROID_GO_ADVANCE_rev1.1.pdf

Here's my simple-audio-card DT node:

        rk817-sound {
                compatible =3D "simple-audio-card";
                simple-audio-card,format =3D "i2s";
                simple-audio-card,name =3D "rockchip,rk817-codec";
                simple-audio-card,mclk-fs =3D <256>;
                simple-audio-card,widgets =3D
                        "Microphone", "Mic Jack",
                        "Headphone", "Headphones",
                simple-audio-card,routing =3D
                        "MIC", "Mic Jack",
                        "Headphones", "HPOL",
                        "Headphones", "HPOR",
                simple-audio-card,hp-det-gpio =3D <&gpio2 RK_PC6 GPIO_ACTIV=
E_LOW>;
                simple-audio-card,cpu {
                        sound-dai =3D <&i2s1_2ch>;
                };
                simple-audio-card,codec {
                        sound-dai =3D <&rk817_codec>;
                };
        };

I copied the rockchip code from the BSP kernel and it had some of the varia=
bles, such as the pre_path, as a long.  Since it looks like it's just check=
ing the path enums to see if there was a change, I imagine int will do just=
 fine on the pre_path. Speaking of which, that is pre as opposed to post.  =
In this specific step it's looking to see if we're going from off to on or =
on to off and setting the register values accordingly.

As for whether or not the steps are trying to bypass or reimplement somethi=
ng that should be done in DAPM, I'm not sure honestly; this is my first aud=
io driver (or any driver for that matter).  I tried to read the DAPM docume=
ntation and didn't understand much of it.  What I can say is that the code =
in question is setting the register values via I2C depending upon which aud=
io path is chosen.  For example on the SPK_PATH it sets the register at add=
ress 0x38 (RK817_CODEC_DDAC_MUTE_MIXCTL) to 0x10, which tells it to switch =
the amplifier on and combine the channels into a single channel.  The HP pa=
th likewise does the opposite, setting this same register to 0x00 which tur=
ns off the amplifier/splits it back into L+R channels.  Curiously enough, t=
his is actually a bug I found in Rockchip's BSP kernel where the channels d=
on't get split apart again when jumping from external speaker back to headp=
hones and your headphones start to output R to R and RL to L...

In regards to the DT bindings, I will document all of them, however that po=
ses a dilemma.  Most of the bindings I'm unable to test, as aside from mic-=
in-differential I'm not really using any of them on the single hardware imp=
lementation I have available to me.  Should I document them based on Rockch=
ip's BSP kernel and note that they are untested, or should I simply delete =
them and their associated functionality (and focus on that which I can test=
)?

I'll test removing the unregister_component code and see if that does anyth=
ing unexpected.

Thank you again for all of your help.

On 3/9/21 5:41 PM, Chris Morgan wrote:
> I'm wondering if you all can help me.  I'm trying to get the rk817
> codec driver working from Rockchip's BSP kernel sources (GPL per
> the license) and I'm struggling with a few parts. The first part

is to Cc: audio maintainers (Takashi Iwai and Mark Brown).

Then you need to make sure there is a Signed-off-by tag from the=20
original contribution this code is based on, along with yours. It=20
doesn't hurt to have a pointer to that code either in the commit message.

> is I'm not sure if I have my audio paths set up correctly. For example
> the sinks I have set up are for HPOL and HPOR, and the source is for
> MIC. While this does work (audio output seems fine) I'm having issues
> with the GPIO to detect headphone insertion. When I insert headphones
> I expect the audio to output to the headphones, and when I remove
> headphones I expect the audio to output to a speaker. Right now I
> have to manually change the output between the different paths.

You don't necessarily have to do everything at the kernel level, it's=20
not uncommon to have the driver set a kcontrol for jack detection, and=20
let userspace change settings on a jack detection event. PulseAudio=20
relies on UCM JackControl to switch to Headphones and Headset devices.

> Additionally, while the codec "technically" has dual channel inputs
> for the microphone, I'm only using the L channel. Should I have a
> stereo mixer? Note that I'm using the simple-audio-card to set my
> paths, widgets, and the gpio pin. They all work, just not seamlessly
> together.
>=20
> Basically, I'm wanting to know if and how I should set up my audio
> paths for the speaker and headphones, they use mostly the same pins
> and only really differ in setting the external amp settings.
> Additionally, once I set up my paths how do I ensure that the GPIO
> events will result in switching between the speaker/headphone path?
>=20
> Any help you can provide is appreciated. This is my first attempt at
> something of this magnitude (for me it's a big step), even if it's
> just trying to facilitate in getting a vendor's code ready for upstream.

> --- /dev/null
> +++ b/sound/soc/codecs/rk817_codec.c
> @@ -0,0 +1,1148 @@
> +/*
> + * Copyright (c) 2018 Rockchip Electronics Co. Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

remove and replace by an SPDX line.

> +static int rk817_playback_path_put(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_soc_kcontrol_component(kcon=
trol);
> +	struct rk817_codec_priv *rk817 =3D snd_soc_component_get_drvdata(compon=
ent);
> +	long int pre_path;

it's uncommon to see this, use either int or u32/u64 if your require a=20
specific size.

> +
> +	if (rk817->playback_path =3D=3D ucontrol->value.integer.value[0]) {
> +		return 0;
> +	}
> +
> +	pre_path =3D rk817->playback_path;

'pre' as in 'previous' or 'preamp' or as opposed to 'post'?

> +	rk817->playback_path =3D ucontrol->value.integer.value[0];
> +
> +	if (rk817->playback_path !=3D OFF)
> +		clk_prepare_enable(rk817->mclk);
> +	else
> +		clk_disable_unprepare(rk817->mclk);
> +
> +	switch (rk817->playback_path) {
> +	case OFF:
> +		if (pre_path !=3D OFF && pre_path !=3D HP_PATH) {
> +			rk817_codec_power_down(component, RK817_CODEC_PLAYBACK);
> +			if (rk817->capture_path =3D=3D 0)
> +				rk817_codec_power_down(component, RK817_CODEC_ALL);
> +		}
> +		break;
> +	case SPK_PATH:
> +		if (pre_path =3D=3D OFF)
> +			rk817_codec_power_up(component, RK817_CODEC_PLAYBACK);
> +		if (!rk817->use_ext_amplifier) {
> +			/* power on dac ibias/l/r */
> +			snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
> +						PWD_DACBIAS_ON | PWD_DACD_ON |
> +						PWD_DACL_DOWN | PWD_DACR_DOWN);
> +			/* CLASS D mode, combine LR channels */
> +			snd_soc_component_write(component,
> +						RK817_CODEC_DDAC_MUTE_MIXCTL,
> +						0x10);
> +			/* CLASS D enable */
> +			snd_soc_component_write(component,
> +						RK817_CODEC_ACLASSD_CFG1,
> +						0xa5);
> +			/* restart CLASS D, OCPP/N */
> +			snd_soc_component_write(component,
> +						RK817_CODEC_ACLASSD_CFG2,
> +						0xf7);
> +		} else {
> +			/* HP_CP_EN , CP 2.3V */
> +			snd_soc_component_write(component, RK817_CODEC_AHP_CP,
> +						0x11);
> +			/* power on HP two stage opamp ,HP amplitude 0db */
> +			snd_soc_component_write(component, RK817_CODEC_AHP_CFG0,
> +						0x80);
> +			/* power on dac ibias/l/r */
> +			snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
> +						PWD_DACBIAS_ON | PWD_DACD_DOWN |
> +						PWD_DACL_ON | PWD_DACR_ON);
> +			snd_soc_component_update_bits(component,
> +						      RK817_CODEC_DDAC_MUTE_MIXCTL,
> +						      DACMT_ENABLE, DACMT_DISABLE);
> +		}
> +		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLL,
> +					rk817->spk_volume);
> +		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLR,
> +					rk817->spk_volume);
> +		break;
> +	case HP_PATH:
> +		if (pre_path =3D=3D OFF)
> +			rk817_codec_power_up(component, RK817_CODEC_PLAYBACK);
> +		/* HP_CP_EN , CP 2.3V */
> +		snd_soc_component_write(component, RK817_CODEC_AHP_CP, 0x11);
> +		/* power on HP two stage opamp ,HP amplitude 0db */
> +		snd_soc_component_write(component, RK817_CODEC_AHP_CFG0, 0x80);
> +		/* power on dac ibias/l/r */
> +		snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
> +					PWD_DACBIAS_ON | PWD_DACD_DOWN |
> +					PWD_DACL_ON | PWD_DACR_ON);
> +		/* CLASS D mode disable, split LR channels */
> +		snd_soc_component_write(component,
> +					RK817_CODEC_DDAC_MUTE_MIXCTL,
> +					0x00);
> +
> +		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLL,
> +					rk817->hp_volume);
> +		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLR,
> +					rk817->hp_volume);
> +		break;
> +	case SPK_HP:
> +		if (pre_path =3D=3D OFF)
> +			rk817_codec_power_up(component, RK817_CODEC_PLAYBACK);
> +
> +		/* HP_CP_EN , CP 2.3V  */
> +		snd_soc_component_write(component, RK817_CODEC_AHP_CP, 0x11);
> +		/* power on HP two stage opamp ,HP amplitude 0db */
> +		snd_soc_component_write(component, RK817_CODEC_AHP_CFG0, 0x80);
> +
> +		/* power on dac ibias/l/r */
> +		snd_soc_component_write(component, RK817_CODEC_ADAC_CFG1,
> +					PWD_DACBIAS_ON | PWD_DACD_ON |
> +					PWD_DACL_ON | PWD_DACR_ON);
> +
> +		if (!rk817->use_ext_amplifier) {
> +			/* CLASS D mode, combine LR channels */
> +			snd_soc_component_write(component,
> +						RK817_CODEC_DDAC_MUTE_MIXCTL,
> +						0x10);
> +			/* CLASS D enable */
> +			snd_soc_component_write(component,
> +						RK817_CODEC_ACLASSD_CFG1,
> +						0xa5);
> +			/* restart CLASS D, OCPP/N */
> +			snd_soc_component_write(component,
> +						RK817_CODEC_ACLASSD_CFG2,
> +						0xf7);
> +		}
> +
> +		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLL,
> +					rk817->hp_volume);
> +		snd_soc_component_write(component, RK817_CODEC_DDAC_VOLR,
> +					rk817->hp_volume);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rk817_capture_path_get(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_soc_kcontrol_component(kcon=
trol);
> +	struct rk817_codec_priv *rk817 =3D snd_soc_component_get_drvdata(compon=
ent);
> +
> +	dev_dbg(component->dev, "%s:capture_path %ld\n", __func__, rk817->captu=
re_path);
> +	ucontrol->value.integer.value[0] =3D rk817->capture_path;
> +	return 0;
> +}
> +
> +static int rk817_capture_path_put(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_soc_kcontrol_component(kcon=
trol);
> +	struct rk817_codec_priv *rk817 =3D snd_soc_component_get_drvdata(compon=
ent);
> +	long int pre_path;
> +
> +	if (rk817->capture_path =3D=3D ucontrol->value.integer.value[0]) {
> +		dev_dbg(component->dev, "%s:capture_path is not changed!\n",
> +			__func__);
> +		return 0;
> +	}
> +
> +	pre_path =3D rk817->capture_path;
> +	rk817->capture_path =3D ucontrol->value.integer.value[0];
> +
> +	if (rk817->capture_path !=3D MIC_OFF)
> +		clk_prepare_enable(rk817->mclk);
> +	else
> +		clk_disable_unprepare(rk817->mclk);
> +
> +	switch (rk817->capture_path) {
> +	case MIC_OFF:
> +		if (pre_path !=3D MIC_OFF)
> +			rk817_codec_power_down(component, RK817_CODEC_CAPTURE);
> +		break;
> +	case MIC:
> +		if (pre_path =3D=3D MIC_OFF)
> +			rk817_codec_power_up(component, RK817_CODEC_CAPTURE);

these sequences look like trying to bypass DAPM or re-invent it with=20
custom state machines.

> +
> +		if (rk817->adc_for_loopback) {
> +			/* don't need to gain when adc use for loopback */
> +			snd_soc_component_update_bits(component,
> +						      RK817_CODEC_AMIC_CFG0,
> +						      0xf,
> +						      0x0);
> +			snd_soc_component_write(component,
> +						RK817_CODEC_DMIC_PGA_GAIN,
> +						0x66);
> +			snd_soc_component_write(component,
> +						RK817_CODEC_DADC_VOLL,
> +						0x00);
> +			snd_soc_component_write(component,
> +						RK817_CODEC_DADC_VOLR,
> +						0x00);
> +			break;
> +		}
> +		if (!rk817->mic_in_differential) {
> +			snd_soc_component_write(component,
> +						RK817_CODEC_DADC_VOLR,
> +						0xff);
> +			snd_soc_component_update_bits(component,
> +						      RK817_CODEC_AADC_CFG0,
> +						      ADC_R_PWD_MASK,
> +						      ADC_R_PWD_EN);
> +			snd_soc_component_update_bits(component,
> +						      RK817_CODEC_AMIC_CFG0,
> +						      PWD_PGA_R_MASK,
> +						      PWD_PGA_R_EN);
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
[...]

> +static int rk817_codec_parse_dt_property(struct device *dev,
> +					 struct rk817_codec_priv *rk817)
> +{
> +	struct device_node *node =3D dev->parent->of_node;
> +	int ret;
> +
> +	if (!node) {
> +		dev_err(dev, "%s() dev->parent->of_node is NULL\n",
> +			__func__);
> +		return -ENODEV;
> +	}
> +
> +	node =3D of_get_child_by_name(dev->parent->of_node, "codec");
> +	if (!node) {
> +		dev_err(dev, "%s() Can not get child: codec\n",
> +			__func__);
> +		return -ENODEV;
> +	}
> +
> +	rk817->hp_ctl_gpio =3D devm_gpiod_get_optional(dev, "hp-ctl",
> +						  GPIOD_OUT_LOW);
> +
> +	rk817->spk_ctl_gpio =3D devm_gpiod_get_optional(dev, "spk-ctl",
> +						  GPIOD_OUT_LOW);
> +
> +	ret =3D of_property_read_u32(node, "spk-mute-delay-ms",
> +				   &rk817->spk_mute_delay);
> +	if (ret < 0) {
> +		rk817->spk_mute_delay =3D 0;
> +	}
> +
> +	ret =3D of_property_read_u32(node, "hp-mute-delay-ms",
> +				   &rk817->hp_mute_delay);
> +	if (ret < 0) {
> +		rk817->hp_mute_delay =3D 0;
> +	}
> +
> +	ret =3D of_property_read_u32(node, "spk-volume", &rk817->spk_volume);
> +	if (ret < 0) {
> +		rk817->spk_volume =3D OUT_VOLUME;
> +	}
> +	if (rk817->spk_volume < 3)
> +		rk817->spk_volume =3D 3;
> +
> +	ret =3D of_property_read_u32(node, "hp-volume",
> +				   &rk817->hp_volume);
> +	if (ret < 0) {
> +		rk817->hp_volume =3D OUT_VOLUME;
> +	}
> +	if (rk817->hp_volume < 3)
> +		rk817->hp_volume =3D 3;
> +
> +	ret =3D of_property_read_u32(node, "capture-volume",
> +				   &rk817->capture_volume);
> +	if (ret < 0) {
> +		rk817->capture_volume =3D CAPTURE_VOLUME;
> +	}
> +
> +	rk817->mic_in_differential =3D
> +			of_property_read_bool(node, "mic-in-differential");
> +
> +	rk817->pdmdata_out_enable =3D
> +			of_property_read_bool(node, "pdmdata-out-enable");
> +
> +	rk817->use_ext_amplifier =3D
> +			of_property_read_bool(node, "use-ext-amplifier");
> +
> +	rk817->adc_for_loopback =3D
> +			of_property_read_bool(node, "adc-for-loopback");

you will need DT bindings for all these properties.

> +
> +	return 0;
> +}
> +
> +static const struct regmap_config rk817_codec_regmap_config =3D {
> +	.name =3D "rk817-codec",
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.reg_stride =3D 1,
> +	.max_register =3D 0x4f,
> +	.cache_type =3D REGCACHE_NONE,
> +	.volatile_reg =3D rk817_volatile_register,
> +	.writeable_reg =3D rk817_codec_register,
> +	.readable_reg =3D rk817_codec_register,
> +	.reg_defaults =3D rk817_reg_defaults,
> +	.num_reg_defaults =3D ARRAY_SIZE(rk817_reg_defaults),
> +};
> +
> +static int rk817_platform_probe(struct platform_device *pdev)
> +{
> +	struct rk808 *rk817 =3D dev_get_drvdata(pdev->dev.parent);
> +	struct rk817_codec_priv *rk817_codec_data;
> +	int ret;
> +
> +	if (!rk817) {
> +		dev_err(&pdev->dev, "%s : rk817 is NULL\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	rk817_codec_data =3D devm_kzalloc(&pdev->dev,
> +					sizeof(struct rk817_codec_priv),
> +					GFP_KERNEL);
> +	if (!rk817_codec_data)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, rk817_codec_data);
> +
> +	ret =3D rk817_codec_parse_dt_property(&pdev->dev, rk817_codec_data);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "%s() parse device tree property error %d\n",
> +			__func__, ret);
> +		goto err_;
> +	}
> +
> +	rk817_codec_data->regmap =3D devm_regmap_init_i2c(rk817->i2c,
> +					    &rk817_codec_regmap_config);
> +	if (IS_ERR(rk817_codec_data->regmap)) {
> +		ret =3D PTR_ERR(rk817_codec_data->regmap);
> +		dev_err(&pdev->dev, "failed to allocate register map: %d\n",
> +			ret);
> +		goto err_;
> +	}
> +
> +	rk817_codec_data->mclk =3D devm_clk_get(&pdev->dev, "mclk");
> +	if (IS_ERR(rk817_codec_data->mclk)) {
> +		dev_err(&pdev->dev, "Unable to get mclk\n");
> +		ret =3D -ENXIO;
> +		goto err_;
> +	}
> +
> +	ret =3D devm_snd_soc_register_component(&pdev->dev, &soc_codec_dev_rk81=
7,
> +					      rk817_dai, ARRAY_SIZE(rk817_dai));
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "%s() register codec error %d\n",
> +			__func__, ret);
> +		goto err_;
> +	}
> +
> +	return 0;
> +err_:
> +
> +	return ret;
> +}
> +
> +static int rk817_platform_remove(struct platform_device *pdev)
> +{
> +	snd_soc_unregister_component(&pdev->dev);

humm, that looks like a bug. If you used devm_soc_register_component()=20
in the probe, you don't need to release it here manually?


> +++ b/sound/soc/codecs/rk817_codec.h
> @@ -0,0 +1,197 @@
> +/*
> + * Copyright (c) 2018 Rockchip Electronics Co. Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

remove and use SPDX

