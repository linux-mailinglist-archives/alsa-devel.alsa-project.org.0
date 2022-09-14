Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC085B8073
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 07:02:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E1AC17F1;
	Wed, 14 Sep 2022 07:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E1AC17F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663131756;
	bh=Gr89haMOuAokEDdoe9POES+CbE6JZEjuceiT6OP8l4k=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MPScDtKzS07wdNvbgUacYs5d2LM7QfoODVBnVxtafFu8L2SZ7366yHWTyn4W3NAoL
	 lzRJFy77hRYuEu5E7h6ktMw8v043TqzKxelqD+LvXyiJfnJ7m5iCifTV9l1BoXJpho
	 TFu719ZlAQEUPDNcLO89A2tgcNDwAcWXuz5dMDaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2461BF8014B;
	Wed, 14 Sep 2022 07:01:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AA0AF8014E; Wed, 14 Sep 2022 07:01:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2042.outbound.protection.outlook.com [40.107.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 856AEF800FE
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 07:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 856AEF800FE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3r09BuqyuLTAVEM9xsyShPeNdIhM0EQU5lX4zXW6vRKGj0jmsmmbVDf+xkgzRchAhOB6+bVGIsOo9iDNSX0Ha4vRp5gSddNlnZ8N9lArqwZHud1gyQ90GbEBrCSLPSHHUJznrWgAIcAJvGjq9d8iXvBfH+l7RnwR0YwTxd2+JM3i63AyAvF9dpigpsC22ygyVRPIyHS3SMHephYtjfnJ1U4eYCsixKbGdD3Dx4hSS6dUoGMmtPqD9NiBLuINrp22f2FuiWUltn0vjilDWs6wiGmsh4woPrUNYpLCJTr0Xw3qUvEphah0f2imSUPgwdvsV/96w4+uHQVcidQ87pvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMUYlmOjZRyS8R8lCFuTSkxhXjJ4dzawEkCIAOe0QGY=;
 b=QxuzQ7WVK3QiSegoLQfPeJOphnXJiMl7nowQA9yww7HOS9Dnhht5Fqz1PVhhjlp1bUqa6ZKknvusuCLOwtZzLtIa1Za8yCLZBSWtajQrvaJ6jb8D+71RlxtIjIH3LCH2VbhjDAe9VmkVDLZtYgNHwl11xu5Cx4BXG3dSwFTX96Ig/TdrRGYTS/Xu4ih9GUI57eRRkqF7ZGCkqG6xASXcBxzkZtG+vumSRl+CrgeB6jREDYAp27rTNEjKZmDP6cDDu/71dz6H/YJxhYuxK4QROPVR5ZNhrNRZpD990s0XW3AfK2dvotm1CO42ejw9dPjRePYTKYSiWly+1sEvi43keg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SL2P216MB0572.KORP216.PROD.OUTLOOK.COM (2603:1096:100:23::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.16; Wed, 14 Sep 2022 05:01:22 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 05:01:22 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
Thread-Topic: [PATCH 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
Thread-Index: AQHYsenYHp2Dqaqfw0qMbVCZJ0+FF62zAE6AgCteOQA=
Date: Wed, 14 Sep 2022 05:01:22 +0000
Message-ID: <SLXP216MB0077F61E694490C4A8C078DC8C469@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
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
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|SL2P216MB0572:EE_
x-ms-office365-filtering-correlation-id: 3eb05068-61f9-48b4-b647-08da960e2b1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qhS+Mfna0VGrSk7bzwqD/UgQM5zgTa+uSpwrV/ZfBBLH6gnDtAQCg1N4zT2LHvCus8bULZCmfED28hfjYX6+6xMUkJ+adkuycuff7JATGIUo1BXVYHOZPCUjwoEe/KY2QSWm+U0jGV7sBzLPAD+VPUf4j7WVDJSdmZoN24V0iaeHajXnrsP72+xRbUJruwDWcSsL7ExCxdWecUSTMDAhVyYHOyVwkdGmFJdp/UhnVVITYa9UZFw76xU2VXOr6mcCOFHa4GwqkaOUO4PrRae0p36q2+gNWKSuBxWliVT6RkcSvdPig3j//RAnQGKOWNLTq7GiKTAIznaORE+gl0eHSy+G3ItP0XBy50zUReFVHMIC0MCyRpDZGbM1NjGx75X3FQmLzj+UhhMn1NBauLVKUSEtNaMIKo7yM8j6rHYhfarMl2Iv6MQesijIMVwbrfLCo7NsIPK4yPv7rqQn+8K4Sjza87n2zc1tTtLRBV7uxwxNteGqOex/XbbwLl46MYSC2Xd9hYjkBkgBSsyGD5KbB0UuzkoMjwNfgxsKuwH+N5mbfUIv2khdckyYgUY1XLVGNxioJDXye7XhkK6bIPTSftnArxNWnj5z/m7Akl8reK7qs59rO9bVCliXVhR63a8nxHt4AftIazNDi64mBMCHmcKXmzWi5AkBjvSADpf9pcsXdTjK6MoIGFMYdajvmYT0v7zv79YY6X62fUmSyuEwhUZnwRId+LEt7WCt6ZDgaAs5zibjWuTsSzZFwfpvFK9nddXDF/iP9sXLsIz39o/NBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(136003)(396003)(39830400003)(376002)(451199015)(86362001)(33656002)(71200400001)(107886003)(66946007)(478600001)(8936002)(6506007)(41300700001)(316002)(122000001)(6916009)(8676002)(66446008)(186003)(76116006)(4326008)(9686003)(66556008)(64756008)(7696005)(66476007)(38070700005)(55016003)(26005)(38100700002)(2906002)(83380400001)(54906003)(5660300002)(53546011)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FBzN55WvQlJncvz/UZJEMaSsxYnRLuy2oRn3XZ6GQgXj1G1trlIqVEanKOur?=
 =?us-ascii?Q?6TmIex3E9m4gRkdEtCk15YyhQ1aluFMXWXUO8rZtye8N85HYSu9ruheJmAFb?=
 =?us-ascii?Q?EGd0hgi2Xl/Mk0L61PcUngZcmw5SvQ2oDxIR64Dsoq0cZrKYP+z5fPQTl6qy?=
 =?us-ascii?Q?Xjw7gDoOH8//fVvqyoxnWAHPzdT2BjOgaLvTY7wqBjfEg0KM2yKuceM1VDu3?=
 =?us-ascii?Q?PXrTmSgcEWKFxAR+WkBPEAndaZLL0mgihjipupPzRqo97aUYjF3NRmOYo4rB?=
 =?us-ascii?Q?PmefUVTAIuba6R1SBb3qqC5iEhPzSzRz04O3cvv9xPPj7lLlsgsk9h76GVEW?=
 =?us-ascii?Q?Uok0N8sFJkDhqLiuGDuENpKr827lDzSdzbPPj5fUiTx42VV6iTmIR0rO9LL7?=
 =?us-ascii?Q?QqVoztK4fgzaFle8Mrgom2+WlI2R3TZ0lfktXgl3A8SlYS6re8RQsuNuUrIV?=
 =?us-ascii?Q?MQop7vM7g6lGiTX7NHFzzn8ubE2JT6kcVKUq1TfvR2XfLcMrQlOc+xj2R4Nf?=
 =?us-ascii?Q?SIK5LiAVMU94WGmlOWOQkFk4V+U/sZN7E8+pSHo3LGGmhEkUqI9Ntvun/xKf?=
 =?us-ascii?Q?Rem7qg12s2p+floqQHTE8y8eTWqZvaOeVewMgzvpkBC2fAMIgMl+Exu0HYyA?=
 =?us-ascii?Q?/3SqC1kQ1BpIAK9/PSr3LnsGqC94zu/MoMFeiaG7ObBX1N0ng71HllOypHnf?=
 =?us-ascii?Q?lkRqkk2WpzfYTjM4SU/sE5XXulfjivPxw0JLpkEvfJ6nyZfWsHjwO43IhUJ+?=
 =?us-ascii?Q?+UI/zxCozhZFa9AOsGqXb9ZXpeau9d1Yw2C3NedCXi1WnTGCu5MSYXInbiai?=
 =?us-ascii?Q?4+Cgm1xGZOGpWf0LOhLoFTHRng6Rm7j9iOabLCe+T7rzqA7M+qnHQjh4EU4G?=
 =?us-ascii?Q?abRHLZ0Cbr8He+X54O0F0X0YxoMpR2XYMXMAe4KUSxjb/Otb16Xtr3ojMXeP?=
 =?us-ascii?Q?HIfrT4ni76/DE9FYqN8sdZBaAmuv8kDsvZ1FilWPdO8i3kthnD/OYKBUSHEg?=
 =?us-ascii?Q?Q5tRhPUr2arKY+Sk3Seijc9jVqH1Ohqno6is3BFKeEz3LJDxO7TSEViUUjDS?=
 =?us-ascii?Q?6E6vrwphfxXDZCRcbly+OhwNkNDzuV4ayTSFa2CePYFWwwMBbF1uBNsJq/lV?=
 =?us-ascii?Q?vvYg+3miMdFdwG9YlnrvVuUrP4bOi7IU9c5DC+xwiK7nnLZoQIAsOinvqSIO?=
 =?us-ascii?Q?dMcHG97LEn8IX8VSxGejZWFnO2QKLxJ2DRkgpapye3IOaJEZDbb+cQi/PVwz?=
 =?us-ascii?Q?yhWErtW0sMP1HjXZu2bIZM+J2kZCVWZ3Jo7rSYjGgR8YUm9Tf890LKLINnve?=
 =?us-ascii?Q?G8yiYJk5mbU/G43AD4qN/v0t4qVeCWAaaiyFv+WduXuGkmMMMn9QLIDKDdH+?=
 =?us-ascii?Q?rJirxtbMbwYcN2yf3Ut6a86ACx5fSNK68SeHnMBzuZHXKHMcy4u3DNBxdq9U?=
 =?us-ascii?Q?l2OoIOiZNwWDDPwkf8iJTpQXPCDJyatZBIm71ZF1rdlNMBU5Qu7KKLAYQ0tT?=
 =?us-ascii?Q?+y7FN5XMRk0x6DLywLMXvrUFzm5wt+1WLrlDwsYDcYKvnpUoaj5OxFwazbl3?=
 =?us-ascii?Q?vZQpw64uf9bxTMVqDU0cpNhLcGszcBVrHVXyq/MV?=
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb05068-61f9-48b4-b647-08da960e2b1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2022 05:01:22.2913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: goaqMUiV5fw7OxgbecUgEAjAGk8NmIwowOXI0sYU5OgdxPQq8c93yIWFxBc5tgwu7BI0zCzNSdTJA+QWRd2E3nvpgQEk6aVshbmiEXsttuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB0572
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Application <application@irondevice.com>,
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



Thanks for your detailed feedback. I'm so late in replying.

COVID-19 is going around again in Korea. I also suffered from COVID-19 this=
 time.

Please take care of yourself from COVID-19.



Anyway, I proceeded with the update again by referring to your review. And =
I added my opinion to the following. Please check the below.

If there is anything wrong, please give me a feedback again.



Thank you for your patience and cooperation.



Best regards,



Ki Seok Jo

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
ment.



-----Original Message-----
From: Mark Brown <broonie@kernel.org>
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

  # To solve the any issue by changing the value whenever there is a proble=
m during use, we registered to control all functions.

 # Since the verification was completed by mass production with the corresp=
onding setting, we removed the controls in the userspace except for a few t=
hings as you mentioned.



> +// SPDX-License-Identifier: GPL-2.0-or-later

> +/* sma1303.c -- sma1303 ALSA SoC Audio driver

> + *

> + * Copyright 2019 Iron Device Corporation



2019?

# I missed this point. Thank you!

# Changed 2019 to 2022.



Please make the entire block a C++ one so things look more intentional.

# I have modified the code a bit. I'm sorry, but I couldn't figure out exac=
tly what you were talking about.

# If there is anything that needs to be corrected, please reply again.



> +static int power_up_down_control_put(struct snd_kcontrol *kcontrol,

> +          struct snd_ctl_elem_value *ucontrol) {

> +    struct snd_soc_component *component =3D

> +          snd_soc_kcontrol_component(kcontrol);

> +    struct sma1303_priv *sma1303 =3D snd_soc_component_get_drvdata(compo=
nent);

> +    int sel =3D (int)ucontrol->value.integer.value[0];

> +

> +    if (sel && !(sma1303->force_amp_power_down))

> +          sma1303_startup(component);

> +    else

> +          sma1303_shutdown(component);

> +

> +    return 0;

> +}



This and all the other controls need to return 1 on change, please make sur=
e a card with your driver your driver passes mixer-test cleanly - it will s=
pot this and other problems.

# Added the return value for checking error.

# It's ok if the value is '0', and if a problem occurs, it returns to a val=
ue of less than 0.

# I have one question. All return values have to match the Linux standard e=
rror code?



However I wouldn't expect the power controls to exist at all, generally pow=
er is managed via DAPM rather than userspace.

# Removed the mixer control to control power from userspace.

# Automatically power control as DAC Event(DAPM), bias, set hw parameter an=
d so on..



> +static int force_sdo_bypass_put(struct snd_kcontrol *kcontrol,

> +          struct snd_ctl_elem_value *ucontrol) {

> +    struct snd_soc_component *component =3D

> +          snd_soc_kcontrol_component(kcontrol);

> +    struct sma1303_priv *sma1303 =3D snd_soc_component_get_drvdata(compo=
nent);

> +    int sel =3D (int)ucontrol->value.integer.value[0];

> +

> +    sma1303->sdo_bypass_flag =3D (bool)sel;

> +

> +    return 0;

> +}



What is this bypassing?

# In chip, this is a function to set not to output on I2S.

# The output will always be on.

# So, We removed this.



> +static const char * const sma1303_input_format_text[] =3D {

> +    "I2S", "LJ", "Reserved", "Reserved",

> +    "RJ_16", "RJ_18", "RJ_20", "RJ_24"};

> +

> +static const struct soc_enum sma1303_input_format_enum =3D

> +SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_input_format_text),

> +          sma1303_input_format_text);



This should be controlled by the machine driver through set_dai_fmt() and h=
w_params().

# It's already included in that.

# This mixer control is an additional control for debugging.

# So, We removed this.



> +static const char * const sma1303_pcm_n_slot_text[] =3D {

> +    "Slot_1", "Slot_2", "Slot_3", "Slot_4", "Slot_5", "Slot_6",

> +    "Slot_7", "Slot_8", "Slot_9", "Slot_10", "Slot_11", "Slot_12",

> +    "Slot_13", "Slot_14", "Slot_15", "Slot_16"};

> +

> +static const struct soc_enum sma1303_pcm_n_slot_enum =3D

> +SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_pcm_n_slot_text),

> +          sma1303_pcm_n_slot_text);



set_tdm_slot()

# It's already included in that.

# This mixer control is also an additional control for debugging.

# So, We removed this.



> +static const char * const sma1303_port_config_text[] =3D {

> +    "IN_Port", "Reserved", "OUT_Port", "Reserved"};



This should be DT properties, possibly using the pinctrl schema depending o=
n what's actually going on.

# I'm sorry. I think I named it wrong.

# This control is a feature that sets whether output is enabled or not. Out=
put means SDO, that is, data exported from the chip.

 # So I modified this.



> +static const char * const sma1303_port_out_sel_text[] =3D {

> +    "Disable", "Format_C", "Mixer_out", "After_DSP",

> +    "Postscaler", "Reserved", "Reserved", "Reserved"};

> +

> +static const struct soc_enum sma1303_port_out_sel_enum =3D

> +    SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_port_out_sel_text),

> +    sma1303_port_out_sel_text);



This looks like it should be a DAPM routing control.

# That's right. I added the control in route.



> +static const char * const sma1303_spk_off_slope_text[] =3D {

> +    "00", "01", "10", "11"};

> +

> +static const struct soc_enum sma1303_spk_off_slope_enum =3D

> +    SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_spk_off_slope_text),

> +    sma1303_spk_off_slope_text);



Why make this an enum and not just a numerical control with values 0-3?

# Yes. I missed this value.

# This function has been removed as users do not need to control it



> +static const char * const sma1303_spkmode_text[] =3D {

> +    "Off", "Mono", "Reserved", "Reserved",

> +    "Stereo", "Reserved", "Reserved", "Reserved"};

> +

> +static const struct soc_enum sma1303_spkmode_enum =3D

> +    SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_spkmode_text),

> +    sma1303_spkmode_text);



Use a value enum to eliminate the reserved values from user selection, howe=
ver if this is controlling if the device has mono or stereo speakers it sho=
uld be a DT property since that's unlikely to change at runtime.

# This function also includes PWM on/off.

# We have changed the enum.



> +static const char * const sma1303_input_gain_text[] =3D {

> +    "Gain_0dB", "Gain_M6dB", "Gain_M12dB", "Gain_MInf"};

> +

> +static const struct soc_enum sma1303_input_gain_enum =3D

> +SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_input_gain_text),

> +          sma1303_input_gain_text);



This should just be a normal volume control.

# We have other control for normal volume.

# So, this control has been removed.



I've stopped reviewing at this point.

# Thanks for the detailed feedback.


