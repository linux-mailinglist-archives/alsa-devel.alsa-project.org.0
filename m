Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7A7709303
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:28:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E942A1FC;
	Fri, 19 May 2023 11:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E942A1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684488514;
	bh=K15U/3KARvuYQQoNEPxezHORjxvdQ8sR2EA9AEz6W1U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OjOkwLEKxmQ4D3AWe572GBHBFDP51ybvK9jqr43LtpDS0/CZa0377KT9n32vHhK/F
	 2ovygjHwYWkkB3Eh7Vnn5EGOegMkYofzGjJbklHB4iukT4rFc2u0tHVE7RGA5CREuQ
	 8rPEsLP2sMdu0jiAQA8pGlKI74PgQrNDSK0U75oM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48A5EF8016D; Fri, 19 May 2023 11:27:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3A3CF8024E;
	Fri, 19 May 2023 11:27:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DD14F8025A; Fri, 19 May 2023 11:27:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9350F80087
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9350F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=dm.renesas.com header.i=@dm.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=OKBLdVZg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/Y/DYRcsYDiFntfnA2UGDpI4RVskvMlomDpHVAa+m9BWPar13ibuT+HIpkHHQ5WlQWHME03zazQv48UY/S5F9DslR69ZPJ4UIytjy4r8aQCpVnC2XjPejZ7K7h7MowCDsUoAvmiAHX0WlG3+IRWcgEzW9w2w9DuVrTBOSmQMM1fE2EBdIPDC4dGkSZPNywjyMU7WxU0OyQHfvXaN0pIPjy9TwbjMBU/ILmHcPUOVeqPhNi4NGmHuNADjqETprQu1tGltAA/NTSBZ9tRalFY1kkTyj8el1tEqcPftQxz2YubcNN9kyVIuIsk+Dro2UGB4LPrhCoxdd7OEmgmSGNz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/sHu7VPf/jow5IOJbA1ZWTIH6S2lqXeafN59Oi7VMw=;
 b=Rcg5jp2iEBYDhvAynVjv/hQ0oveTmiIyBOAXn9sb0FJDQBTEVZ9O4UkvTDYCPJ4qfmXWgI+ekzQgK1/wFSZCfAf9IQ9qBawCSIHCj30X91ne6NVWSwo7UID9k1+L/Aj3qimlRjopMT8CTw0UYSQhVBR4XcW/UpKqsMOdHGj8zptSdtImhp+KNbOMDzNfoxvfgbltVwS3JzQhsm7TV2CKFtm20DkSK3Sg3fQmzEwe5f8NCrnvFlC5kH1kbZKzGk0Zfgy1lEmB4CaKzskqo3Bgt/elT5GlcLN00pl68TIGErtejegUDifkqm6cfBdR2dGpI5o9gWmlQd1vi1uJxSDulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/sHu7VPf/jow5IOJbA1ZWTIH6S2lqXeafN59Oi7VMw=;
 b=OKBLdVZgbfhoh4gteMF3LwepHTyKmZT3xaIx0LsKnS9kEymIAGi5jUo9QeZpaPmOgUE40kYW2tJru4e85e/uXl/6+4E9IRH+VbtGnp1ZtUv5VdeIjWab53iiEMfwww//oseVN/FOy0uuPe5nXLNAIoeN/2mmJXhjnAiAua8x4Dw=
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com (2603:1096:604:10b::11)
 by TYCPR01MB11054.jpnprd01.prod.outlook.com (2603:1096:400:3a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 09:27:05 +0000
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157]) by OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157%6]) with mapi id 15.20.6411.017; Fri, 19 May 2023
 09:27:05 +0000
From: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>
To: Conor Dooley <conor@kernel.org>, David.Rau.opensource
	<David.Rau.opensource@dm.renesas.com>
CC: "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"support.opensource@diasemi.com" <support.opensource@diasemi.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] ASoC: dt-bindings: dialog,da7219: convert to dtschema
Thread-Topic: [PATCH] ASoC: dt-bindings: dialog,da7219: convert to dtschema
Thread-Index: AQHZiWlFaZwxsGlTVki4XJjWobXVBq9gg64AgADQwAA=
Date: Fri, 19 May 2023 09:27:05 +0000
Message-ID: 
 <OS3PR01MB6641D9BC9D36AA0D4741F84FCD7C9@OS3PR01MB6641.jpnprd01.prod.outlook.com>
References: <20230518091449.17984-1-David.Rau.opensource@dm.renesas.com>
 <20230518-voice-puppy-2a533ec28ac8@spud>
In-Reply-To: <20230518-voice-puppy-2a533ec28ac8@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6641:EE_|TYCPR01MB11054:EE_
x-ms-office365-filtering-correlation-id: 64ad9fb1-5211-4918-a047-08db584b3622
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oumM8Gd84pC/1E3Nf3k9CXmiAe3afGMVqF25XbGU2uFFjyqIguoncu4b/1pQw7y3voASqe4toiHRNOvZ7VtzNoftNXtJbK74yUVxl0kZJqVS2hOGNP3GSZe5SBR/b9k1Q7vtUEpqe5cpOLis8iFvgapQ1DDZPhtKgRn+odepSA9Ed4PwXTuCXXHdIQmJUm9HphyMsPQQkhpWqgiJq04O/JMDUSUwbaT6ttugw4O41YoO/WeQEkiBXnKHRMNLQLuOcnFJGHejPS3A9aw1JR979XYaTls+e5mqPVcyYIBKMITUxsoZDD1uziM6b1ydDUmBd7XUGJManHgDv6d3ytyx6i8pY1kW2eIZD3oZSc98Fkiqlj9Rgsf9xugtZDGJBu/aNhFag3EGJVZKFJQZihNF3uLackHo09XRDhd6M9cwTN53RGjU6FrcLAd1qthfTNAgTGPbOq+YpInXSp/TXf3e6SfORMfdTs3VmD9iWCyFpRsh0XfG+ekLvgtwY6rYEGvuX4/UyKKI6WG9AnNeBzrw8RUk5gKTszCHjo3mNYwkQ/bTAzWJa9KJfO877g+WJICn1waowYa/7w35zzvAJ0ZO9D1QTILoDwtAjbvirrAaSLQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6641.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(86362001)(33656002)(55016003)(8936002)(26005)(8676002)(5660300002)(9686003)(6506007)(53546011)(55236004)(186003)(52536014)(7416002)(316002)(54906003)(66446008)(66946007)(110136005)(66556008)(76116006)(966005)(41300700001)(64756008)(66476007)(7696005)(4326008)(478600001)(71200400001)(38100700002)(122000001)(38070700005)(83380400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?rHaX4iNBSc4Yr0YrSakalvCEyCzfaea4lh8mebkJlgtqhjkkV7TuQ8e0WxOv?=
 =?us-ascii?Q?8oAPux9u/D7Tch54mnNrvChRu0hQZSc28NW63VeDDP8+3wP/4IOi0ah0nykX?=
 =?us-ascii?Q?Fvd36rk2t9htrfxqnanVo74RKpj5MycJsixVRdsr7cVzQ88AVOSdsan1g9qQ?=
 =?us-ascii?Q?QktsiDnruTyU9FFhJHTVYBqFPSIPz3W0iJWhb/3shnWtRHIKRTmvMApL70Ki?=
 =?us-ascii?Q?rTNDPmVZYqi36o+VO6z71sZeTmmDw3sIIB2FztuXlIx3J8VCzGxwxWtTBRIZ?=
 =?us-ascii?Q?apVfkXFe7yfqrSVvnmn6PRo2CZ2Dd+Q/BYUEaGtqLr/TXzNn6XTPzcoyCnO1?=
 =?us-ascii?Q?PY3uSPUHNdwA5+l63rqz5bP0LItR7oj3CDXLkgdJNEVcz4w3z/YxFCUDKs2E?=
 =?us-ascii?Q?hOXjqbbFAbyIgEJHblrehKuXgxhPNzmHmxUcwWOyjw8guVkJYwETJaP4Ol51?=
 =?us-ascii?Q?6/w9x79JzH1Vrq+CyZkxFYemdgBTMrfYFc2qTr3FhSjJjfn+zSwfElTl9hwn?=
 =?us-ascii?Q?/0XS7XRU9h7Dx0jlnyRcR0i/6IJD3/HL8LohSjd0K3X4B940QTjFNHDkd1YN?=
 =?us-ascii?Q?bqj0g1kb3HOblKtNm8y8qnOFxg9EIwaUo4ZoGWogYzP+KdAZ1I1iu8AXqFe0?=
 =?us-ascii?Q?mWbuzqFH9o8yS9GCXBYIjfega3al3nPVgMDdgy3cASUAGWJQ3KLhD4iEy7Zc?=
 =?us-ascii?Q?DVAcQD+tipLuR9plOLWJJ+dtv7ZYtfhgNGJ3hhfrKymYAwzKtYbH5ot5VLJs?=
 =?us-ascii?Q?E48lXMXcEv3ebKrcoKVGiDDrpU4khQGp27Opv9gQ+jpIT3wbtUb/ozRJ5v2l?=
 =?us-ascii?Q?eN88MSvMcnrhF02z+jIZ2oKBzs+D26TkNqjBy9CAnuMk8EVo+av6YtsevSVg?=
 =?us-ascii?Q?pYzK7fW7JHS05eQiK3HCts/+z14X6mLO8ORxAUff3pnDrNtAZVYEUNqhB3/2?=
 =?us-ascii?Q?jyNl5bMVHc7tnoJgpXKVQ1L9k+Gs0TNhWtJFCBcSUcg/mo8o/JQmyDBTo6JQ?=
 =?us-ascii?Q?FscttDMH7OJVX2rFO0NehadUvJc1tSWT2QQulJuDWORzx427DEeCOIRpuF8l?=
 =?us-ascii?Q?ITMmZxYA6cINPvEENij9aK0POX+g79mqnrw7GflVMKcsK81SCL1bkZ5XZA8+?=
 =?us-ascii?Q?zAIRMbmLSWMBBsFpddiffPbq+RZmXIa1gS0c8Np2vVSZV2WQPD3sqrNwV6Wt?=
 =?us-ascii?Q?V6MjFKbP67MwYg5oDf7/Vp8lqKGR1Cd5biubOjLdvr+Ul17RWaABcVscL75m?=
 =?us-ascii?Q?plgrHbPmwix5ryc0aL+5XLSV581ZYkXMoDylul3QSEuVagDS0SAX/xtshxQf?=
 =?us-ascii?Q?K5p5+svVD9JBssPQiSodDvndmpxNmzk2Q4HQeDY/K2zoHIiSvWCq83DP+0WA?=
 =?us-ascii?Q?CHHG1rk6pQxngpDh5NFOsMmiQhUAicyYG6a6iXqyLPHnDKtfvGiAZ0NpJykp?=
 =?us-ascii?Q?t/HYk08mxzpDQX9dtsBHWfokKLhlQoaXOP8sFaFSdhMiUOhiy4cTxrCpZCbO?=
 =?us-ascii?Q?pVJXIkODwrhGUCFnrnBKYeUAV7zY5o93jhIznz78vnIt9rbUH/U9zJ4/6AhG?=
 =?us-ascii?Q?jvM6376q0VcuCgWX2mf6h5+tMFZOWKi4IpP/fW1U?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6641.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 64ad9fb1-5211-4918-a047-08db584b3622
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 09:27:05.7028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 D2rGvuXLBdxK3ACvWkxDLzowH2TGMVPjjCRiL8sypLYi9BTVbIr7WBe/ZstXkz4h0a40wU7mbUenj7SYWhAB4QcqT++fDb4brwidRVfmrg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11054
Message-ID-Hash: M2CNJYY4UYVVBZMPCE3MX2E6XX3JJYLD
X-Message-ID-Hash: M2CNJYY4UYVVBZMPCE3MX2E6XX3JJYLD
X-MailFrom: David.Rau.opensource@dm.renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OVA2DXPSSD5U2UMZDYQ7EPGUKHJVX6HA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



-----Original Message-----
From: Conor Dooley <conor@kernel.org>=20
Sent: Friday, May 19, 2023 04:57
To: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>
Cc: krzysztof.kozlowski+dt@linaro.org; support.opensource@diasemi.com; lgir=
dwood@gmail.com; broonie@kernel.org; robh+dt@kernel.org; conor+dt@kernel.or=
g; alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-kernel@vg=
er.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: dialog,da7219: convert to dtschema

> Hey David,

On Thu, May 18, 2023 at 09:14:49AM +0000, David Rau wrote:
> - Convert Dialog DA7219 bindings to DT schema format.
> - Add Jack insertion detection polarity selection.
> - Remove unused `dlg,ldo-lvl` parameter.

> Could you please split this out, so that the conversion is done in a patc=
h of its own, with the addition separate (unless it is my unfamiliarity wit=
h sound at play, and the addition is > required as part of the conversion).

Hey Conor,
Thanks a lot for the kind suggestions.
I just submitted another patch to do the conversion only.

> diff --git=20
> a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml=20
> b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> new file mode 100644
> index 000000000000..32dfc4559052
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> @@ -0,0 +1,240 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dialog Semiconductor DA7219 Audio Codec
> +
> +maintainers:
> +  - David Rau <David.Rau.opensource@dm.renesas.com>
> +
> +description:
> +  The DA7219 is an ultra low-power audio codec with
> +  in-built advanced accessory detection (AAD) for mobile
> +  computing and accessory applications, which supports
> +  sample rates up to 96 kHz at 24-bit resolution.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - dlg,da7219

This is just a const.

> +  reg:
> +    description:
> +      The I2C slave address of the DA7219.
> +    maxItems: 1

> Drop the description please, it's stating the obvious IMO.

> +  interrupts:
> +    description:
> +      Interrupt for DA7219 IRQ line.
> +    maxItems: 1

> Ditto here.

> +
> +  VDD-supply:
> +    description:
> +      VDD power supply for the device.

> I would say and here, but there seem to be dozens of other similar proper=
ties in sound.

> +
> +  VDDMIC-supply:
> +    description:
> +      VDDMIC power supply for the device.
> +
> +  VDDIO-supply:
> +    description:
> +      VDDIO power supply for the device.
> +
> +  interrupt-names:
> +    description:
> +      Name associated with interrupt line.
> +      Should be "wakeup" if interrupt is to be used to wake system,
> +      otherwise "irq" should be used.

> Please encode these names using the items: field. + oneOf.

> +
> +  wakeup-source:

> type: boolean

> +    description:
> +      Flag to indicate this device can wake system (suspend/resume).
> +
> +  "#clock-cells":
> +    description:
> +      Two clock sources provided.

> Drop the description here please.

> +    const: 1
> +
> +  clock-output-names:
> +    description:
> +      Names given for DAI clock outputs (WCLK & BCLK).

> Please encode these as items:

> +
> +  clocks:
> +    description:
> +      phandle and clock specifier for codec MCLK.

> maxItems: 1 & given the clock name I think you can drop both descriptions=
 from here and clock-names.


> +  "da7219_aad":

> Drop the quotes please.

> +      dlg,jack-ins-det-pty:
> +        enum: ["low", "high"]
> +        description:
> +          Polarity for jack insertion detection.
> +        $ref: /schemas/types.yaml#/definitions/string
> +        $ref: /schemas/types.yaml#/definitions/uint32

> Yeah, please do the change from txt -> yaml as one patch and this as anot=
her.

Cheers,
Conor.

