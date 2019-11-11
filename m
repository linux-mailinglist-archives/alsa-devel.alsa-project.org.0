Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 037F7F7027
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 10:08:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 844C1166E;
	Mon, 11 Nov 2019 10:07:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 844C1166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573463285;
	bh=LYCQYdGdcKzo22ftTE7bcK2LlI5kKWgE3+PTY2B0GIE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c7MAX275T8u2lMRlejVGxAZwUs0tPlxjO05QqEuJfqgWSR+kIpY/aMpE7EjEK8Vbc
	 glu0FsevbDIepDR5t8mKVM13LMEtX+hXZhfJ4eQy+sGcvrDIK9pUW0UWcRy79i/V2/
	 zeRxPZxT31RN7rQeByIsKQPQp8BRIBxCv5yCRZ/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21652F80506;
	Mon, 11 Nov 2019 10:06:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E97D6F804FF; Mon, 11 Nov 2019 10:06:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_SPF_HELO,SPF_HELO_PASS autolearn=disabled version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::605])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D800F802E0
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 10:06:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D800F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="S/UMbi/8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADTfuy7yYb3Z7BvLnYWqg7eyFOVLTsKnHd44Ix5xyJqXA6ZwDCIDjdbgsRGe4Duq5GYYzHF0kgZAKISMCOwuemXSKkavxePNV8zUuk6B4IA3QOQKjUnJr/+iZw3fgnukeBoBoIYueWQdMRZFEUh7lYlXLJ+X9cXHvtxNctOOyoXuIVEMYkXB161Y5mWqnbTbD/EdC7WrNZYAsLcRC4p9/esywYIhiN9vrSQdlDAcU7Ds2ER0D8aYRY/w5ikzv3IUJq8MymIsHuHfY7qauAbXGFeIPExlGLN7fFwqhYJy/1ekBNaGKFbFKWi+dBGFZk7QNg1y2w96rpP+9IbkrSdyvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqfhLy15q3DKXp1ZpKfv6q73du1gcBDOB0dOCiIhhPk=;
 b=ken2ReQtxJvnk/sqZlxUZE0quTdFsYbG8V6BdktBG2K01sG7hH5qQslVdCHrcFITvEiT5Q8M81Vn1ja8wsIK3h6lkec4F4wHFsik531Fh1A76D0AyJg/alJBmP+ElWWuifBeMG2+8rTNhGkRpICPvVs9IQxCngnCm/aBLrSMsae7lTX1fVTx0RP8kaLJ+sbGUhoNQ9qSI8c1dGDeotymMMjqD5wfziAyOyOdckC77RRI7Ra5+qe+6abOsFZZpXFi/qLh1HKb+6c2gULUu3V+B4Tag7+X3bx84lTEM2lwQJnA2/D9mVyN+QY1WjtSQk/FBFRm1wzWZUBGYwUM0AxdTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqfhLy15q3DKXp1ZpKfv6q73du1gcBDOB0dOCiIhhPk=;
 b=S/UMbi/8wpmqGX0e8l8iRdvYB4Va5xSo0BAjQoww/v8L0GaVbRHVpi1BVdKXP89aQvkI3B6X89B5EFYN031nxAEpjVHDAY9VWqemes/tkijN6+AK0y41vJ42YKq1XUer8wql5lOJem3S7RFJj8429kVmWvrcwfeUyx+JUhUStlY=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.232.225) by
 VE1PR04MB6350.eurprd04.prod.outlook.com (20.179.234.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Mon, 11 Nov 2019 09:06:07 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::9c38:e113:f0b4:f9]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::9c38:e113:f0b4:f9%7]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 09:06:07 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Rob Herring <robh@kernel.org>, "nicoleotsuka@gmail.com"
 <nicoleotsuka@gmail.com>
Thread-Topic: [alsa-devel] [PATCH V2 1/2] ASoC: dt-bindings: fsl_asrc: add
 compatible string for imx8qm
Thread-Index: AdWYbsgh8IXPoWIwTOytoNQoYAeMEw==
Date: Mon, 11 Nov 2019 09:06:07 +0000
Message-ID: <VE1PR04MB6479812133EDC588EE5768BAE3740@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 432c21f6-3686-4758-eb6a-08d7668663a2
x-ms-traffictypediagnostic: VE1PR04MB6350:
x-microsoft-antispam-prvs: <VE1PR04MB6350F8CF6EC6451E9DB6CB95E3740@VE1PR04MB6350.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(199004)(189003)(186003)(54906003)(6436002)(86362001)(305945005)(55016002)(66446008)(6116002)(66066001)(66946007)(66476007)(66556008)(76116006)(102836004)(256004)(14444005)(316002)(74316002)(64756008)(6246003)(71200400001)(71190400001)(229853002)(110136005)(478600001)(25786009)(81156014)(7736002)(6506007)(2501003)(7696005)(81166006)(9686003)(26005)(14454004)(33656002)(99286004)(7416002)(2906002)(4326008)(476003)(8936002)(5660300002)(8676002)(52536014)(486006)(3846002)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6350;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BMjPrC9cSAkLC4vh8ygCcYEwlGhUbDiqnwOVMVgkjkGIXfnjaJLYLt8I4byQVqypxZ7a8wNhNGCD1x50bVnO0vP0bbv3to3jwgdylNed1xpLJ1l1xuP20Dq8xDZA2Hv/BpmZ1Kv+Eq4wCeJPFq4W3H3bgpfa0J576SYvRGmYcNOnUrJQmV6ZS3+t4hFSfZpNgiwZS44lhWdFCcL9E0eQxmDGHCFipQaLXAU+id5NWtcGXh7H0azL/U/fIsbhng9Nl/HLx+OMDhzCb1uebGRxTxMjsHdQVsZIsqAjXaCwWyKb8iVCQ3VQQlK8Nl6V2ObFmpXtBVYkilJJskLI+Bb/8SIhx874Ehefo/OfNnBlvX03NHIKpEGjDUOpNK5p5MbUtyokvizJaYfkPKa9UWy9PRp7Q6b52RLAYTQLzUiUa8eJjkso73VP6miTRQJ7c5h0
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 432c21f6-3686-4758-eb6a-08d7668663a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 09:06:07.7967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h1eigLkZycDyuWu2wlZigzxo89NFLzDid4DGzCpsE5reZ8qaEyJp+XdRB/+vq9tVgn7QdxUc3VCBHXvEPzuU4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6350
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH V2 1/2] ASoC: dt-bindings: fsl_asrc: add
 compatible string for imx8qm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Rob, Nicolin

> 
> Hi Rob
> >
> > On Wed, Oct 30, 2019 at 07:41:26PM +0800, Shengjiu Wang wrote:
> > > In order to support the two asrc modules in imx8qm, we need to add
> > > compatible string "fsl,imx8qm-asrc0" and "fsl,imx8qm-asrc1"
> >
> > Are the blocks different in some way?
> >
> > If not, why do you need to distinguish them?
> >
> The internal clock mapping is different for each module.
> 
> Or we can use one compatible string, but need add another property
> "fsl,asrc-clk-map" to distinguish the different clock map.
> 
> The change is in below.
> 
> Which one do you think is better?
> 
> Required properties:
> 
> -  - compatible         : Contains "fsl,imx35-asrc" or "fsl,imx53-asrc".
> +  - compatible         : Contains "fsl,imx35-asrc", "fsl,imx53-asrc",
> +                         "fsl,imx8qm-asrc".
> 
>    - reg                        : Offset and length of the register set for the device.
> 
> @@ -35,6 +36,11 @@ Required properties:
> 
>     - fsl,asrc-width    : Defines a mutual sample width used by DPCM Back
> Ends.
> 
> +   - fsl,asrc-clk-map   : Defines clock map used in driver. which is required
> +                         by imx8qm
> +                         <0> - select the map for asrc0
> +                         <1> - select the map for asrc1
> +
>  Optional properties:
> 

I will do a update for this change in v3.

Best regards
Wang shengjiu

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
