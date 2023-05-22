Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC9370B64A
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 09:17:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F40B13E7;
	Mon, 22 May 2023 09:16:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F40B13E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684739849;
	bh=RC8C67svvc6f8YMLjPm/OjxjBWdUfk+ibNR0zRfERE8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H64LiS5/DqZVDCERefwRr5Ox/ShegpZYNQ/gIzcY3BW7PgD8RbCv7weoOTjgWuyy7
	 Sqo4rNxqswP0SKa81+F32fY2CyFINpsFFSuyItBHTdCvMnd831mmKzGb0E9Am8MVUb
	 M16XDcTW1UesKxPqB2iR8+Tb/Sj266ex40j3GXtE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BFEFF80053; Mon, 22 May 2023 09:16:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1375F80249;
	Mon, 22 May 2023 09:16:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFA6DF8024E; Mon, 22 May 2023 09:16:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B12BF8016A
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 09:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B12BF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=dm.renesas.com header.i=@dm.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=itvjAsaj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z02863ezALqq0ft5JUCDCZHD9h4QWnP7DImGX1C2ESCHTz038cw6TvInBJ+X/SDlSwgp9ft8cnReE6DIMbi/su+fN0cle8Jud4gW1Bz3N9B0DsC1xxJIX7luTeBUUs/H8jSvf7ixMSzzdh5iTAmXodN5JwsZqnv7zSIZi5JJf7yqeUJ7olxUK90h2dqGHrx9qZXzdsoBfauYB0v2GQ7+DwUBsU/vpksqOMsjs0NAbwmp8ed+rd24r8R8gfPaNcW/0X5FMiA27bYlXvLyNso7+Kck+teyp+Ep0y2wiK7di+PX+9Lcb1xg3Eees/lIT9E9FIgKMn6YHVDUbXszE9gycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7x9VTHH4ol6GJdRLMjuuhEAgQTIjyR+Ffw2bs8zTkE=;
 b=dD9KhZ6ZSpwQOdZ/j3+Ed/8iVgP/MpR5uUhD2YPU5EIS7HFmNGjgiXBYr2lei6hxD+1OYrBxBHCj6gu7rhK2J92/5cGs+mHQtraV4yFvnFMNGWOueTe8B7iHsWiJhWRsRdsfEO3eptj8o3YiFgnulEDw/R8N0MaNoX6FRJS095wKCydTOnzf/OrEu5HE3dpzWt/TrJ/ztKl17iZwL9pRIxmKtlEMhGEVYERHJs8JrCpJjlVcV3rhfIfqdGskfpNhaZjQU0U5/7XAtjjndg0rWuRm7fMWmgnp9U06Ajhu5fmy8deHXDZZc/8a7SwalAWA4/rtG3xqIXLmji+ah0ojFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7x9VTHH4ol6GJdRLMjuuhEAgQTIjyR+Ffw2bs8zTkE=;
 b=itvjAsaj6bf1XMYZgl5HOX8l73aAQ6+93Sj7cjRJ7KS1wInWWP5TbbdtCuPcIVsLfOUZjoLkH537XkoNBIaKH1LQ5U8QJzoWZ4G/FZ/K/KreqmMj4l4dh5bdfGkql+JHstH0WGPlbnai7bVBkPv51T4KLN4z2EubiaoAYPU/Fyk=
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com (2603:1096:604:10b::11)
 by TYWPR01MB8316.jpnprd01.prod.outlook.com (2603:1096:400:163::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 07:16:16 +0000
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157]) by OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157%6]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 07:16:14 +0000
From: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>
To: Conor Dooley <conor@kernel.org>, David.Rau.opensource
	<David.Rau.opensource@dm.renesas.com>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"support.opensource@diasemi.com" <support.opensource@diasemi.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] ASoC: dt-bindings: dialog,da7219: convert to dtschema
Thread-Topic: [PATCH] ASoC: dt-bindings: dialog,da7219: convert to dtschema
Thread-Index: AQHZijOXgG+V1o89IUGVnF1nhvo6b69hyciAgAQWsaA=
Date: Mon, 22 May 2023 07:16:14 +0000
Message-ID: 
 <OS3PR01MB66419C57C8AB570EBD6DE147CD439@OS3PR01MB6641.jpnprd01.prod.outlook.com>
References: <20230519092321.26915-1-David.Rau.opensource@dm.renesas.com>
 <20230519-tables-stoppage-51c998e0421c@spud>
In-Reply-To: <20230519-tables-stoppage-51c998e0421c@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6641:EE_|TYWPR01MB8316:EE_
x-ms-office365-filtering-correlation-id: f3fd45c1-3cfa-4981-8fe8-08db5a946db6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 opyKXu89aHSvWIU2TJCsbuRjwZgqDLjRhqsQZzc5Xg5/5Lt9Nqbjr4ZAODHoie9f9q7odP6D7i5sv66afGlHKQLL7eyNhFstGlIqID29kQJrejunToFQd82sSo38OIN4lzv4A8tgfB9aT/sX0BmeS/jMq9WDNWx8lcejckoR1dy7EE7HwLVliCprjK3Izz+IMNsHjcfLx7vQcKagXCvhaJL3tkdJ13DAAX2cNkIA6M9ago5kcCkGqEgLfmqmzEF6WSZwO1KVqhTyCKnwQ5DoDnkkYYJ0P4lt1H6jL4x87pYb07/50U5nmWK4Jqcwo/GDxVzglu1i5zBs8STO46dC4cNwAi+WyUOI1B35mUAsa2v0sLOzUMo6A4PLoG7lV0zkSQs0jZshoPLBnoxxYgeUY3M1p0Y4GsBXcIZs7qLJzcDGZ6Wnq1Kl3pdNP5s6cV0DFipqkTfXnb/wD651J4DjJAYmGj2HM4mqKf0hgcjvDslvHDXMEoP/YZdfTbOO8p69vpV7yJQbIO5JDjdouQ6yoyzuZURpIcqWQUyJnN7RDy3vYcwJaerl7BT/qrLYmyM9glcYTzX+dX3VeG0kWrhtTVrpa9x2aJuKspadnh/pou9dlkScD+kB2JwiJwfK4TxG
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6641.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199021)(5660300002)(52536014)(8936002)(8676002)(86362001)(33656002)(6506007)(26005)(9686003)(53546011)(83380400001)(2906002)(186003)(7416002)(55016003)(66556008)(64756008)(66446008)(66476007)(4326008)(66946007)(76116006)(122000001)(71200400001)(316002)(110136005)(54906003)(38070700005)(38100700002)(478600001)(7696005)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?4jYewBz3hfyD4WTrwrXPIPBPpa46kYsWBYO63wUxT4ahsMCs3OhNeuPUjARz?=
 =?us-ascii?Q?Xj46EaDjE59+MZffe+ExsfGSjTu61Eri02sQvaps8iDk8L8fhEIEHFgBILPz?=
 =?us-ascii?Q?N8H7gnWanHZxta4F2cb6ikpFdDya7wYXudFJq8v50zfBE8zhJRFYuPADaWmu?=
 =?us-ascii?Q?16sMt3iJtC/esHi+LYzIpytJqbx4mgiLR/Ax1pOUkalqzlkOl3DxWHzpKt1v?=
 =?us-ascii?Q?dfQbnggHOeauFILxc0Tej7XY9q6xyMu8KFPrHLCbCmXTP10QHOu9vs+qq460?=
 =?us-ascii?Q?GCYkqw1Rv2hobUrH9ZIMAXEdrzsxgce+iOfHHonR2N15qqTXF+PRYlaFvDF6?=
 =?us-ascii?Q?721Apf8bxWbxqqn4btlIALinprPKxXdBewqJwzezVRZcNLyWjSDSyWtgtuR1?=
 =?us-ascii?Q?k/aXOxzTwygIaN7jS01dl0EW2fl1GzC3FkbQp7r8La74G0poST/XJlJsGqpB?=
 =?us-ascii?Q?wO6ayttoAQYrvbCay/QZz4fh3iDiMyVoOI0gh/xUvJFRwjaDd4v+mz2kpRQB?=
 =?us-ascii?Q?liBbgfDDFGhIAPHAemLwMdrcUsptqkU5DrMODrShFPivQeJAU1Fr3gpf+JaP?=
 =?us-ascii?Q?oYeIqSdb0ClNq/bKEPytSruZimUl0oXR3bcJ8lG0RLgPJIfZU96M8UUHwEf7?=
 =?us-ascii?Q?2Rs3Yw43Ogp8ulzYIA0CJFQ45p3jZieGw7Fk7qHG1WArxRintBzp9iDfTXsu?=
 =?us-ascii?Q?AD2xDKD65kQEawca8yZlNXNlRATs/+GqqPR45EdFik53tV60biQoaHkBFtZi?=
 =?us-ascii?Q?Xi24nQrwRzK9/CXLGSHpsxvyT9xzUPbRw5/8citft+BR7TyN0uA1dWFfxZKF?=
 =?us-ascii?Q?B48r4BXGf7+fzVnzNfqZ/gWMWUydTkJXTohWoC6giCNLqPJXvsxzfJpw6A89?=
 =?us-ascii?Q?guj2xum+I3Wz3TWv3S1/fQ7YeDAcOFSWXDHH2DdVGrDMF6S0ey2az+hCF+oi?=
 =?us-ascii?Q?kclJg80vZuPcUf7K5MDMY21mcBjXoTwtBAN4oeP/NDzxfUaeQMPRnI13izGv?=
 =?us-ascii?Q?WXCpZuJef0hj93jlPteJqQbD60lU2t5Ci4qw0O6b0UbZAxRq2y7EOMmI0prd?=
 =?us-ascii?Q?61MEboP8t/UmU+Idee8VLndzpfWBUmo/Cy4/TXXKZBZW2EOiRhoFUe+8f5Dv?=
 =?us-ascii?Q?p8X/NsY/QusQmOrvBldl9MJ6x1O1TBEcWIMRLjW02ND3AAIjjflUNN4VApYo?=
 =?us-ascii?Q?qsM0/I4Qdv50bAxesa/f7jc7uWAyTXJ8wBlMtgPpiKooRI2cpKYObI7oUKOZ?=
 =?us-ascii?Q?FNkXFYOQn63shi++EtzYMSIWOrrCDnJTpGNOwFBARldKkt+i3Aga69+j8huD?=
 =?us-ascii?Q?5sLIduy0KpUyMQlmx16UZDYihCeoQhck6FvJxLP+yExvYsFWFTg39ej4m577?=
 =?us-ascii?Q?xMZyuMcY59oU1YY8CycjOWE7PRoLJQu3k/Im81BAa0Pg+fGfUd1xz1RTdtfp?=
 =?us-ascii?Q?EJ7kNf/FPLebjfTpFesp+H8/yi0mLUoCqOMfKSkLr5BYpBMr5lrlqT9qr8yR?=
 =?us-ascii?Q?8jVN7ZJWqGN78Fpq5rHrRLirnddrGxe2NTkqrq++5k+3qtUYulBZNm8M1c8Z?=
 =?us-ascii?Q?6BHpj9UQ3fzeKBg3jMn2hlZvdaR4SPqVpcceAN/G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6641.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f3fd45c1-3cfa-4981-8fe8-08db5a946db6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2023 07:16:14.5070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 BG8pwwEJraheYKujaX5H0OyuIc76J2Kq/lF+/pxIHkQHTtHRFK2BsJsQD7HnAEpvWnO/dOOkHNkgoLH4w94ttUl8qWyfpbXbBuO1Itb2bes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8316
Message-ID-Hash: Z2DGLZNJEY5PYNW3NNGLCIAXD3ZNN6IL
X-Message-ID-Hash: Z2DGLZNJEY5PYNW3NNGLCIAXD3ZNN6IL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6DWFTT45OLL3UTOJMNWIOJJ2UJZBCC53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



-----Original Message-----
From: Conor Dooley <conor@kernel.org>=20
Sent: Saturday, May 20, 2023 00:30
To: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>
Cc: conor+dt@kernel.org; support.opensource@diasemi.com; lgirdwood@gmail.co=
m; broonie@kernel.org; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.or=
g; alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-kernel@vg=
er.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: dialog,da7219: convert to dtschema

> Hey David,

> I think some wires got crossed here - what I meant was send 2 patches in =
a series, where one did the conversion and the other added the new property=
.

Hi Conor,
Well noted and thanks for the kind explanation.

On Fri, May 19, 2023 at 09:23:21AM +0000, David Rau wrote:
> Convert Dialog DA7219 bindings to DT schema format.
>=20
> Signed-off-by: David Rau <David.Rau.opensource@dm.renesas.com>

> +  interrupt-names:
> +    oneOf:
> +      - items:
> +          - const: wakeup
> +      - items:
> +          - const: irq
> +    description:
> +      Name associated with interrupt line.
> +      Should be "wakeup" if interrupt is to be used to wake system,
> +      otherwise "irq" should be used.

> Hmm, that is not quite what I meant. I was thinking that you could add it=
emised descriptions for what the individual behaviours are.
> But on reflection, how about:
>  interrupt-names:
>    description:
>      Should be "wakeup" if interrupt is to be used to wake the system,
>      otherwise "irq" should be used.
>    enum:
>      - wakeup
>      - irq
Understood.
> +
> +  wakeup-source:
> +    type: boolean
> +    description:
> +      Flag to indicate this device can wake system (suspend/resume).
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clock-output-names:
> +    minItems: 2
> +    maxItems: 2

> I was thinking
> clock-output-names:
>  - items:
>      - const: WCLK
>      - const: BCLK
> (assuming I didn't misunderstand the text binding!)
I suppose the clock-output-names is not a fixed property and could be defin=
ed by users.
If no pre-defined here, the default setting will be configured by DA7219 dr=
iver.
> +    description:
> +      Name given for DAI word clock and bit clock outputs.
> +
> +  clocks:

>    maxItems: 1
I see.
> +    description:
> +      phandle and clock specifier for codec MCLK.
> +
> +  clock-names:
> +    const: mclk

> +      dlg,jack-det-rate:
> +        enum: ["32ms_64ms", "64ms_128ms", "128ms_256ms",=20
> + "256ms_512ms"]

> The "s here are not needed btw, the other enums in the tree described lik=
e this (that use strings) avoid the "s.
Understood.

> Thanks & apologies for the confusion,
> Conor.
Thanks for the kind feedback.
Your suggestions really help a lot.

David
> +        description:
> +          Jack type detection latency (3/4 pole).
> +        $ref: /schemas/types.yaml#/definitions/string
