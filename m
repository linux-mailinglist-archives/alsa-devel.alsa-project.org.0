Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE5768A784
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Feb 2023 02:18:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B8D511C;
	Sat,  4 Feb 2023 02:18:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B8D511C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675473530;
	bh=E8sUgihT/mRXoLtgpvBdUzlZR6CntiizmyI9Bq4sZyU=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=I+5hxz8Nzr6N5Oj/hITNDPlmYGrSZb7Xw+chtIjP0+Pxf0BEV6R6ixkpWknLkFUl6
	 HIkpPtNuemW5sB5IFm35IPZeG9kA/XNsF77L70mOLIVRuyWTAdExgpotRtQPx2/XqV
	 J40O/EA+u9tuOvXWSdZ7HQAxg23bdywC5QPycmhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52BE0F8001D;
	Sat,  4 Feb 2023 02:17:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70670F80254; Sat,  4 Feb 2023 02:17:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::61e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD49FF800E3
 for <alsa-devel@alsa-project.org>; Sat,  4 Feb 2023 02:17:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD49FF800E3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OS6BKPvfRqf3JIAoW/FlexKILMXGudyA8D/COtRHBroH62gKntuBBsxPNEN3+mlPVDBSZk3NnzTNu7Yz1i8WtvM81ducxsqalR1slI/neBLGC2GRN1UwnZrHVmayPQsvLvhGCR8Eq+ETlxUH/PvPp+Z5YBVK+bVOqzV9Ily2F5jNTFTlIXSAe2QwdMKhsIphvcTtQYoBG2UTFFUKMCRjezS40fqh+/S5AamuudieeD/H+HRSZA0Q2xaI7JsgWthkede+/2dXjdgYR93/12CPnwNO7cAKyBPLS7vnenqqEovPRc8FPh+z4+8gs/vMu/lZB7fSSdyhBUxUjhSybk85Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iMcYH2WuCYj/PojVEDivASJuWlWd/ajXvQ8cVVZamw=;
 b=iIAgg6npBL+7VpWSelNWAmqskU1rzg1E4mFSp9aaBZvrF8vwe4i07u87w27Dk5e/7udPmUfN5jFgcrpr/9MentyzbrC2DkLaAuPSRAXd5uGSZpIeKMNa33knWghMsAdZCtfG8hsgO2vdE9sNlmLgdy2MOD+vYqN1JvhihwerEx3XNqoCQDM7eGtN/n1R9rv38RJtGQeaIO7O2WVu24387O2F7PyzcDSeWsnqmqMxA+p/3wPzVL6V9Hu4sEBmy+0hIzP5CMeyGSVt82EpIPj0Ich0A7SGXgCie2cXiZQWVNFssnbpZxIzsK57ELOclO+H4DjzOk0kbwO1e6j0EgP82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SLXP216MB1036.KORP216.PROD.OUTLOOK.COM (2603:1096:101:9::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.31; Sat, 4 Feb 2023 01:17:33 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6064.028; Sat, 4 Feb 2023
 01:17:32 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: irondevice, sma1303: Rework binding
 and add missing properties
Thread-Topic: [PATCH 1/3] ASoC: dt-bindings: irondevice,sma1303: Rework
 binding and add missing properties
Thread-Index: AQHZN7PkgH5k9OezFEKWnOFoOAGHTq69xsuAgAA2t3A=
Date: Sat, 4 Feb 2023 01:17:32 +0000
Message-ID: <SLXP216MB0077114CDB6C2FC6702875D28CD49@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230203094239.25700-1-kiseok.jo@irondevice.com>
 <20230203220143.GA947805-robh@kernel.org>
In-Reply-To: <20230203220143.GA947805-robh@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|SLXP216MB1036:EE_
x-ms-office365-filtering-correlation-id: 4dd883a4-6fb8-42cf-bc0a-08db064d97a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fZ34Katgg9ynxU9u7XVmo7/guFHrXjmgRg84W9D4YGTpMgbzCWiBv2dvl43vjRqk5Qq3OiizskEE8W4VU3cKGldv6h8S+BiHdGYycrQdzQ0rBc4Dm5ZGqtJ06zQfgIauau6osH8drjMbRV4qr8XRzadr+Q3INpyC7rVuwuUBSTYMJK5CxGMvhiotUomCm1TDBkMqc14N8ZyXe4gGkOQUyvvX8waj24BHVnkhWCpnyu7PItQLTYLr21vCJ9fYjR6e0unn0G0kSTbpxb77oHg00CwtZ0f1PqnxYboeOPIqth6X1FPehwds2LOq53UpcMAgcHyJDxJ921uSnOIv3Mmmfp1dbEJaZ6j6/Vzr7pCzY1swWqqUUzD3piMindPIScZ+moUNf1YxWuhYvY3j9qRdz0AP5svkTIBRhrRipKbbm3/R3xrpXm5JE/TLvAVr8JdyUDJ+43xC27IQcw8ytc3X1kblvITAdzhYaI2o8LNWevUGgSkh7NTe6t32vBmou73JnWk07BfkUdWw9nvICveX7VrmI5S4h8Wt4o8DZpc0db+U2/k7T3UoWr2EO32GdXTBCf7qOcsGiscKBHYVSF08YVQ3IJZmBdW70EO3zLmEboCbbz8hxAQBaethAydKPcbo8Xo0iWQYH6d4d3G5pCHUGapHr2p268uNCmklws8neWYkpDe1HXMbIwIDcD7TmKnDygW08p5aKUQAOeFo4ZusWA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39830400003)(136003)(366004)(396003)(346002)(451199018)(122000001)(38100700002)(5660300002)(54906003)(52536014)(316002)(86362001)(83380400001)(33656002)(55016003)(38070700005)(7696005)(2906002)(71200400001)(186003)(9686003)(26005)(478600001)(4744005)(6916009)(66476007)(66556008)(64756008)(66446008)(66946007)(4326008)(76116006)(6506007)(41300700001)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UE+vJPHBDVS1su9GaQHjtJDArb+24vOTrs3kD/BhoNS7wAxEKFanXCTtIUWd?=
 =?us-ascii?Q?mgZvp75w1kiaeVOJ6PZxJVExOe0TW7L4qhwInFIcRbVcDhg34tZgOiXPry9Z?=
 =?us-ascii?Q?Dt+tMgSFV3Wg9T+CSC4O9QxeS0WIHnGtqVF5T/3BcTF+AAGlg/GPYPQdTdHO?=
 =?us-ascii?Q?ZolVj+l4K3ElV0bAcSCQQvV6OClH1UucrmHG1+7CEkhAsenx2drKAxb6QWTF?=
 =?us-ascii?Q?8ugCyRu6v+jQAUkNIHyXMY5/ynZbNHmzGUIyD8RUKWKyii5tekV1t5cSOzZ5?=
 =?us-ascii?Q?t7H/MROpy0cWfy3e5W1df24x4fEL5lonIQ+f7iDY8wx/xfXRQVRoWECcYWaX?=
 =?us-ascii?Q?2HlFkwS579SwHjc+r8DOgGCaylXXN+CTqjJ2ZjyVxv6zGj1kZcsGzyOuLZD6?=
 =?us-ascii?Q?wMyZ1xXcR4HnznUlkNlP3yo8lOQrHYMvcgTD9BidgRiMuWJe2sfY9Rf6XfvX?=
 =?us-ascii?Q?IAXIDm/bPoQHLhCsA1z+WNDgjVMGg357yxGLJmzXfb1QqKSwHVNmnY+rRSHb?=
 =?us-ascii?Q?X9/Br/KxLAM+t9Oh033dH0JEvllGF+F/uGbOZ8Z+piuwsHat4/8Qq2kQ6KsF?=
 =?us-ascii?Q?xUJD2GAvjQ93qXD5ajk1Nq90eT7uEQo8oXQvYgTClt0qs/KkEEMyn/+9viBF?=
 =?us-ascii?Q?JyM6G7Hw1oA+YTGIApHH0rz3LES2lHDaDFGCfdX8v+aXa55iNf39dSGNzhWm?=
 =?us-ascii?Q?osFUDKSOB9xqJX/2pO9QTWyRxyPthaHDXQrrvxCGaB8VZ3XsXbbxNnO9/8kZ?=
 =?us-ascii?Q?BOiEHeFNaRYQqmrpBEe/pNbAXJsopDgOkwwnzVaUG75owkhFBFjJ3GycO/CZ?=
 =?us-ascii?Q?Bn4ea2KIJyU7Qo44bC/AV4HOhL3x9bF+0nZXIh/ZvRcr60A1FzSRmLGS+bl4?=
 =?us-ascii?Q?cU2lC9vkgAF3IWPsEBiV3Hlwk8B4jPoBJDdEFWli0ew2NqSSwc99sROWKBhc?=
 =?us-ascii?Q?TVGHAb3w4E7GLGsf9shFljV4XMXdcQSh+PX27ZNguxvrAv1jr2uIMPOX175o?=
 =?us-ascii?Q?t+DGSqq0b5wrLQU2FJ63xmU3vf2ernxO1+F92B88RmyA5hkA/uCostWdMUkU?=
 =?us-ascii?Q?aNxBQ1AvljUwxw2I5TcyChb2OMYl6Ua0YEZDQ4xXMlj9u0fpgMHRIsMHmJjo?=
 =?us-ascii?Q?eHYY8bQ1Y9aUbJWNRsJ+VnzBF6hHuTPOYomOup+kO1JVQy37lWKH2FHGUpM+?=
 =?us-ascii?Q?qqQYtur8vw/VjGBR2D/j60gFvIqm2fN9j8FdFV33Vcko+mC1Z7mCssjPLDiy?=
 =?us-ascii?Q?tTRI9mmvIFhlBf3vyWJaDOz0mfJGB7rJ4GlOtJpnUONES1C+RA+RK38f2+T+?=
 =?us-ascii?Q?X3pJDafTtZcltOLnOTMqHp4LImtVpUyb0bIyszjZvTBA7o/aBzHAW+EsulLV?=
 =?us-ascii?Q?S1NDSOMBMttoduuR9gLG75HuURFq4Ms2IW5+oPR47L+WlL1U8LsqwxLTOiJv?=
 =?us-ascii?Q?pxz/l6UaSX552FwfV2S77TDqvKtRxQz8argM7bXXQ8H81edYxtHsu9XdZEAt?=
 =?us-ascii?Q?adCkBGSONRL0tef2yF1FGXcjgcqAZIVb31Xfdxs+IUV5r1SZES24YFEHJc1J?=
 =?us-ascii?Q?svuGNpEPOzoCHv2xVr+eT/o5Ymbd9PCpYoQuJSdE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd883a4-6fb8-42cf-bc0a-08db064d97a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2023 01:17:32.8795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +FS8RIXcTlBNWVumxuWd/MKNmk4CmyZ8427EuQoFmHd+Qk8huARuJ/FBZRJ4r0ODQCKNZkPbFK7ceKxYezsRaGiwtcqwkaM/XpvBU0ma1OA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SLXP216MB1036
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> > Fix according to the writing-schema.rst file and tested.
> > Add the missing property as compatible, reg, sys-clk-id.
> >
> > Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> > ---
> >  .../bindings/sound/irondevice,sma1303.yaml    | 35 +++++++++++++++++--
> >  1 file changed, 32 insertions(+), 3 deletions(-)
>=20
> What's the output of 'make dt_binding_check'? Asking since linux-next has
> been broken in different ways with this schema.
>=20
> Rob

2 logs and 2 files output below:
  DTEX  irondevice,sma1303.example.dts
  DTC_CHK  irondevice,sma1303.example.dtb

And I didn't see any other error, so I thought it was okay.
Is there anything else I need to check or how? I'll try it.

Thank you!

Best Regard,
Kiseok Jo
