Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A0155215F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:41:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EACF12983;
	Mon, 20 Jun 2022 17:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EACF12983
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739716;
	bh=EBK9/XxX55cR0NwTEm3JCwJ2pTI2Tsfw26Yn4NYjlY0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jRwOmY4f0KHzYHZOGmm8Yp3ob5prvrRNhjZ/Ti/cxUBjqXRW4AN0n/joSFdLlU+AZ
	 JlNm8XKw2xSFwxFN5+5J8Cq+TVqZ+vbLN4+V6lONgnnyluJhglt0sCjncgcSdoI0hi
	 HZWiCf6EwBHXeeoVldTZePcO54vHJFtKcWPB6Q6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34941F896F2;
	Mon, 20 Jun 2022 17:08:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A743EF804E5; Mon, 20 Jun 2022 17:04:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::61b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23E10F800FB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 17:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E10F800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com
 header.b="Ezc6ADUa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2xBhPQbXMxbbFmfs6dGJhppLinKJYaYAPa3tlk8kJGsP3i0shDz/e4JPnAZFElIW9dBc0ONdazk73xKPHXhisTXinvYGeB5JNZ2DzAjnzIuKEYyo+01Lx7lI7xxBSvUbLSfuZ/nrJo/twKKJjBhkLvhHJRAcKZar/aMNqzuq54imA1GVVejrycFXBUJ3WsQqF2kBgq1Yue1N2Q7ekZwxgqdUU1Ny8XYJttW2NBdq9ssDJRSyvZKrS145k9wRZXjP+mqlejshVEu3G6N5xFBPzZbFBms432LLcZHGZgDJkDgYF7nVnt4PdI8XRaR6g9oUTVjty8DRrSU4Il71MrBkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBK9/XxX55cR0NwTEm3JCwJ2pTI2Tsfw26Yn4NYjlY0=;
 b=A/3gmS48t/Yz18OhUE48lG1G8zUAeqDUNugH6MlYu82G+NagZBlZnjXTUCH1oaTMep3AhaBuy7c6K1EtKRkPAz6JTLmgSgd8j7Qzi+trntpl59E3fbPiFsXSmmZebwucj87Ws1yXaK2dbevOxn+sjklxvtOx2JmthKA/uRxi7csYlz+HEyVUxRH0pZ7zSDN6ojR1OZT5mK+rfBkXuxTp7yaImPa+5UNi1UpYjJyAKNLYESu0Cs4ha7PwE88N/HVpiM7bAaPEromfYiAYDvz9TAFTeOmsSFCvKkEBNBWCBF7AQ1OGmnJvyi4ZXS2AMJbH/iy1TLwLRIPRx/0QkBN/9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBK9/XxX55cR0NwTEm3JCwJ2pTI2Tsfw26Yn4NYjlY0=;
 b=Ezc6ADUaviw9Iua/VGNQS/HZ/xu1A/gGEeFQrmRf2qjF/46urRAHauTXJ1lXRk5n9SuHC7Xxs8qWFuVM+fRGzmsRLdzmHYlXnJsEaOeW+9RsUyA/CPNryw3xvBTk+1m+xT4u7emGPcBu2rTPE8mRU77RJStJdCDHw6LvmjGGt7x5tQ4GTFxEZ0kPaCNLmNJTmvxSkVUU+noBQsEXvKnGUwL0L+3MkuD7C5AeDCEtvZ+DPid2wXuJ20S/WORaqoTPXcfHEv8bjIWdPYiUVYXyMPFxyRPOtCP7k9Qly7pmurL4FDPH1n6hbp7ksasxqPB2LPJWeVabNUbvHs/6mdfbpA==
Received: from AM6PR08MB4376.eurprd08.prod.outlook.com (2603:10a6:20b:bb::21)
 by AM8PR08MB6612.eurprd08.prod.outlook.com (2603:10a6:20b:368::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Mon, 20 Jun
 2022 15:03:50 +0000
Received: from AM6PR08MB4376.eurprd08.prod.outlook.com
 ([fe80::3d45:c206:59e3:6539]) by AM6PR08MB4376.eurprd08.prod.outlook.com
 ([fe80::3d45:c206:59e3:6539%5]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 15:03:50 +0000
From: Pierluigi Passaro <pierluigi.p@variscite.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] ASoC: wm8904: add DMIC support
Thread-Topic: [PATCH 4/4] ASoC: wm8904: add DMIC support
Thread-Index: AQHYhLZMl9cnd+lxxUukzbs4j0AP0g==
Date: Mon, 20 Jun 2022 15:03:50 +0000
Message-ID: <AM6PR08MB4376C690036C5558058C4F16FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 97148b09-0c98-d5de-2792-1546473bcd6b
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1374c813-42c5-4511-ffde-08da52ce1568
x-ms-traffictypediagnostic: AM8PR08MB6612:EE_
x-microsoft-antispam-prvs: <AM8PR08MB6612599FFE255063A2DA5F0BFFB09@AM8PR08MB6612.eurprd08.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s+xVj6YK9NeRb9ESzW6lN/p2zXKITphIQhVi1rLJKlP9d1fSmNNjHOjKp7Ymd9VO5dFkNt+F59E7y4WhmC3+4N52Z/+J+ysbpvGMDqk1z77XGId8teZKJg5PbH5/Z6lokDs6yuN4PtsuiT/zHlQxNeQnt8+4FLqEz7ohwXsZoWZfwB1XgdHu6CZBUQFVWSI/2mSbHL0hSwcL1VrEk2RZEBK1lJky7RP9verHQiI52JaQAKHdZ/m3UBxkGoEqtVSVkBew33kjaneSM1D7maEhbnP7BfgmS4d6QKYd8zzDBkvRvBihDSEKtq1iKsldXJAbjQenMTWrcPxPwt3YL8BPuTldrob9R3qQVZhsqdFp7XEsKyMAApWMzCabUA09vdR5cwzVpkVtGNhsonTqUDmK3aEf0YY8AB/LP3TdqPk+wZj0XaAAnh42mwK2833XzQSGudCQv2D5wB4aMmTMdCf6xKnt71jWwVtwf7K3GxGzuu1VNV1inKPbRLpS3egWQOKEZEuoY7I7WlAfY1aLJgbzx/EFmsqAJRiIcMprzQ4rKnN4ZGYHZ8jKbVAm0LkLpspx6SEcWtioi4G5zM7rLrVhg7NJUKSGc1JOBkD9buo/rNX2iq+lkKffbxRBuYFoD6DWGwmlchvb8Wvune8TV/2rVA3Qzk7BIdZ6IihuRnlLA5Um/IlP9pKwTypF9f5IiHfd3f3IlEDB7mVKPDR6/NsDrg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4376.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(136003)(396003)(366004)(346002)(376002)(6506007)(66556008)(6916009)(54906003)(64756008)(4744005)(316002)(66446008)(122000001)(478600001)(7416002)(7696005)(71200400001)(91956017)(86362001)(5660300002)(8936002)(2906002)(66476007)(4326008)(8676002)(26005)(38070700005)(66946007)(52536014)(9686003)(76116006)(55016003)(186003)(41300700001)(38100700002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4m9e2KaLLru6n3NBdRi89TsS4BV7mgsPWZIdciz5V1x6PDWN2DwJlAZkSd?=
 =?iso-8859-1?Q?RHFeoPhX0RXT55GlgeAmTPUMOI9Ub5UFhbsY3q4SCi2dGWBPkM+aJx7uLb?=
 =?iso-8859-1?Q?LjPscDnIOQ92C8eqVJ4qP8W/PmHo3r8IHm3lfZBMS9bRhBKfI7NUU7BHCO?=
 =?iso-8859-1?Q?1CjKs97I2pNkOB94amcQC5K2koqdSyAjlCT+kKnukOOKMPj3hbU8KydRMl?=
 =?iso-8859-1?Q?8/wDEfmi9+rCjXiyJVTFF7TEevAlV0/B2pqNK1+6y9VtblyyA/Dk1BKEw0?=
 =?iso-8859-1?Q?KDmDxJ3puvKBTpWiBSf2nuua8NvqPUO8sV7I/XVZCGIL6U/pMJgbS4XHR8?=
 =?iso-8859-1?Q?z2MIL407/tstXLYTEJoBbBpgFMuQqaqUxeP6yUxnyzW37Cmjh+B9taN9uT?=
 =?iso-8859-1?Q?9p9GQirnve8KAxH5xrcHsLf0JelDwfi+STpCvmq2MDacWPwaelMlHg1quJ?=
 =?iso-8859-1?Q?4nth4lXMRi5DIDdpjgmBfGnCpHcXIFgPhIBpXhrz5NgxQMPzQ7Pol3f7i3?=
 =?iso-8859-1?Q?A3c3TjUpAknPwr2Vg5RsbMmQX/BXpLMJkR4zBYGurOehSK1gtunxqLzxvD?=
 =?iso-8859-1?Q?dR47HCuqQtD9a67cFX5AE081csejR4QRmQXUjOFWnvvBjX+xW/xreSiZqm?=
 =?iso-8859-1?Q?M6d2O1hCtxhhI+AdGHvxZokvc+/ycfqTdERSL4g7ZZQ77jP67uqIsViss/?=
 =?iso-8859-1?Q?uMz4ax83bSXHoXmbqf6P1Zi5HSf0wSxnAxnbLXBJ7R+c7yeXjIw7Mi5qjy?=
 =?iso-8859-1?Q?4tJT4nl6FjeeesXO8hnRlAFQzyjzhhlfIsCpElae5c9fy+HOMv3ZtU7Y3U?=
 =?iso-8859-1?Q?anTZAfP+DR5V2cNfqPDcOQYe/8ZGKe+TDphpvFVP/mFtabAlScEJuM6U+a?=
 =?iso-8859-1?Q?BiN4pjJ1lvquiiVYrn+9C0zPnWCpSOogkFcVz2Q0asa3J2vnCrRsRKGBR/?=
 =?iso-8859-1?Q?Ipjd1Hmp/Ek/IdREMOmIzrStI8fOzB0l+itmqwcG0ED0p+B9ZJA5C8BahE?=
 =?iso-8859-1?Q?70p2uj7/dX04f4PL/XxZXao5gJgidqsFOxrtY1GWVYrHpoGb41wzmn209i?=
 =?iso-8859-1?Q?dt5/Gb+Q6T/pdcIVqWRSbsW1IncGL6Pldiuz5biyl7Z2SqDNTo0TVUg1az?=
 =?iso-8859-1?Q?hxw/D5+7FRkJPW6TAOZ9J+3wIxzLl1HgB+dt2VSDtoLmgs9c52Yv9T0E5R?=
 =?iso-8859-1?Q?ij1vzSoPt+VJJae7qkLqOjCyYMrgBGZDcG21b4IP5SuLfx8dT9sCyO8c+a?=
 =?iso-8859-1?Q?BbUrOXTppune2v5ySyr00gLZ3ApTumFGdQYtppvkJjWb5CZPYtH2N69lEh?=
 =?iso-8859-1?Q?sgUEaNceEDTUOgLtiSM2VxHxZf4YOE5ptnXtEk03chMZb/I3Ttvk2sFNyb?=
 =?iso-8859-1?Q?yAcWQWrLUHRy6laepbVK68J8spjrbNC3y/pal+d9pMsD/cTEpwT2ofAC42?=
 =?iso-8859-1?Q?qmqOdQBQDXKDz6OL2n5VmOBH0psqhbrQNF6fKJ7jnfWX09JDuPT3Zn3hJk?=
 =?iso-8859-1?Q?flmldc+67ruCpYcE8fGu5rMd82Hiwy+MUOaYYwcbkzVvhBudyK3fdOWxqM?=
 =?iso-8859-1?Q?7Ko1Q9DQUTi8mA03EpRCaSXdFWAfhnumOHQVxnSzI1C9iYuAU3JFbs5P/K?=
 =?iso-8859-1?Q?7gbO+Q1GCBA7Gq+vwJ+KAcboHv0QKxo60xADpe6eEw0/I2zAtTt7O/Sqxk?=
 =?iso-8859-1?Q?JrxWAGXc8hCPhp3cM2WU1ntOxEgjQnO3rE1RHIE+NF2WJkBIB5UqyPtz71?=
 =?iso-8859-1?Q?TYZDvE8o06dsdEFobE/MXy5kqCfHIryTeWLdSQKpd5Y85MWoxdU/tahBct?=
 =?iso-8859-1?Q?Rtuou1E4NQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4376.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1374c813-42c5-4511-ffde-08da52ce1568
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 15:03:50.1821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bAfW2Yn6yDJlw+5bKghHga/2QuOV45vzhlBZdXF3oiH35H4a8ABKSTN/gQXAQlUkxtxsDFDF+Uk8g+Ozdx8xHD4FUT2lm0JtS7eHcUQCRao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6612
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:44 +0200
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Eran Matityahu <eran.m@variscite.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Alifer Willians de Moraes <alifer.m@variscite.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "festevam@gmail.com" <festevam@gmail.com>
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

> > > > +static const char *cin_text[] =3D {=0A=
> > > > +=A0=A0=A0=A0 "ADC", "DMIC"=0A=
> > > > +};=0A=
=0A=
> > > > +static SOC_ENUM_SINGLE_DECL(cin_enum,=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 WM8904_DIGITAL_MICROPHONE_0, 12, cin_text);=0A=
=0A=
> > > Why would this be runtime selectable?=A0 I'd expect the decision to u=
se=0A=
> > > an analogue or digital microphone to be made in the hardware design.=
=0A=
=0A=
> > I agree that dedicated HW is required, but currently SW side there's no=
 support at all.=0A=
> > This patch is aiming to provide a way to enable DMIC on boards using it=
.=0A=
> > Is this supposed to be managed in a different way ?=0A=
=0A=
> Via firmware description.=0A=
=0A=
Can you please provide any reference approach in the kernel code ?=
