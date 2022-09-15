Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC6C5B92D9
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 05:01:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DC9C1704;
	Thu, 15 Sep 2022 05:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DC9C1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663210879;
	bh=6Ym418tPzx6E+9btNm3wcINDFjht6GdohXN8U+acUls=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WtPoP/M9jNCFOHxJpnmWO0hFVbO7EDe307RtnsNwOW4zlWORdP1JyzZn3ZQGb1dza
	 yH5Qu8Kp5vZvOy30oWOSyi6jdkXrW6qXIQuGc+KswZTWG48rV1ya4Ot+GB0w/FCJ93
	 74smw1tJp5BQhFHILv48E6jiqe7o6RNN85haa+ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9748F8027D;
	Thu, 15 Sep 2022 05:00:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2F1EF80238; Thu, 15 Sep 2022 05:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS, T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2048.outbound.protection.outlook.com [40.107.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6044F800FE
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 04:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6044F800FE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1rCm7H5eYwAxk493sgsG4a9GK7QVxmPDffFIO/WP4vjnvZUHv5/rY29QgsoW5qcQoXR9i1jp6AjobG1mBk7gLnKF4xLcymKEeTHClPF3ByR8+Ti1EbdrHHBm3YAFR4/Qa9wOKgsgQqX6NpcViJD9SL15jqATnznNovnYp1ixfZoLLqZEWzzroH1EIWKM646n/55Q8AD/vzWRQ8MmTQXRUHMmf+I04UUIV/bP+wbcjB3MFXtp3Ec62211MhsmTk6ooaQWE2lfMEzvPUN/0JmTB++VZn7PyTpyRPZn523jUEpn2EAg8l6jbcY2Ll4gUXFBslkdHt307dBJQpnFay4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aukbIxfVyjVRh6l2nSi7VHkrkTksVvYj3BjhJA5R218=;
 b=MWDAX2Rvn0/OFBEgRKYshP6wlnXbXq0kPlRDrLIYIn9eYXYhtpA9b0twOVXoDx89Zd7/FGCo04rYkR1dXy/grLdlAwR7Emsvjjg4S6uTtFzyYzX2ZWBIEqXi53I1nfwwZ0LrFvAqg3MkcNgecs9C6noFheafkCbawb7uQCU9/RcFjJQoV8VauZAeApP2HkRi/UPHFY8YZRxIY1220rsCxYZDGswmSy+ICqmqS6n417c7Bc6JOS9c1H4UoQgJ8in2dWwgwUL2xmUeMMSmTiBSIOluGoK4+weZtCS7uV1se3PlSskepo0Xir2c7BUx3vx+TO3k+vdz8G3jTxob3RAwPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB0593.KORP216.PROD.OUTLOOK.COM (2603:1096:300:1c::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.20; Thu, 15 Sep 2022 02:59:40 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd%5]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 02:59:39 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 3/4] ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
Thread-Topic: [PATCH 3/4] ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
Thread-Index: AQHYx/arTxu5zu15b0uXQHlGHzcdwq3erQMAgAEgQzA=
Date: Thu, 15 Sep 2022 02:59:39 +0000
Message-ID: <SLXP216MB0077B0FD03F56BFF5219AB598C499@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20220914045712.8775-4-kiseok.jo@irondevice.com>
 <YyGiTHZzUDlSCEpn@sirena.org.uk>
In-Reply-To: <YyGiTHZzUDlSCEpn@sirena.org.uk>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|PS2P216MB0593:EE_
x-ms-office365-filtering-correlation-id: dd319747-de2e-4399-d169-08da96c654f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MOEU8KOxvmEiQ8IRSXkNruJPIrdUvh9vssoJjJm3pZaWH4/exmeUs+l7K4eEJyPr1cpANdzFKUCmm8MOlrtg8ugs+fXzj7Ty4XsA9Y4lPTF8nryUIO8phxylTiAJ69cmvuplt/3q6DtZAWI5P2wRLgMHGD3afpNyhkA5iV7gArFUm9QoGPEVU91kHKy5bXQW5KTtNlHs8KUqskIkFGR6tH5PcBzUCaV62X0UHcjGFwq8AIlObd4B5g2ntvNKy+FwbKzBP+WRawpG6451yfVkhtHTxHdfsfC8cwGyJ4mtNV9WOgT9efw8ZoJPCvj0aEDr3fpftnhzNDF/ph/Tr9eMfNiIDn/gB/r0s+1ygwrqKcyPKvbBd7ij4hHO1QouiLDIKS4Ai86+fuJ/hvL8lfUuROL5IW3NefS4h/lyghm/T37proh2fMQPwjJG0ev+LuYcRw13D2tv+wRnVc/wbwDqzoVHESU7PpjWHGCfMmEKKX0pSD3O0/RxthSWrLjsIyS7C/3hY/BuxKSlsxAReyb38OTEOYRuNbUdwbSI02gl3l7mfXL8zpBGbG+owS/rqZTNvsbbMfrRca0OZBbOsm1ZVA/9N5ByqOk1TNCUzSpuMILSO64Z/auu7WacjYuy+5rQ0Tq/j6PRMPIIjubv/70qVZSQ4wqSIgsDQ4si9xBNxkuOA4YU9I8XXfx4NqE4F5eNsRwf77ECC+IoN1ygE00pD+PbSVlCNgId67qNLPru7VWQsGG6eQGZSlRS1c9va36J4V173+5ScWcyhc4NRAWy0g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(376002)(39840400004)(366004)(136003)(451199015)(186003)(41300700001)(107886003)(7696005)(54906003)(83380400001)(38100700002)(8936002)(66446008)(6506007)(478600001)(76116006)(8676002)(55016003)(5660300002)(66946007)(26005)(38070700005)(53546011)(66476007)(66556008)(33656002)(2906002)(6916009)(64756008)(4326008)(86362001)(9686003)(122000001)(71200400001)(52536014)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nLxxOcyVb7CSkeFOoHoWo8UFWWIG2DZJXlEb2I2NpiFtZZUnu7CwTgp8x9S+?=
 =?us-ascii?Q?bJLD0Y/lOIElIHee9uR9bBZ75qdSqvY8i1Q39/qP35MW+jrqXhZXeMuvnqfl?=
 =?us-ascii?Q?t0mDdycqIol3ry4ILJX8a41fpTxFlBQc5epotfbnEUunLy0H0jYaEP6qCl5D?=
 =?us-ascii?Q?vGDD3DsSutMeUHxK1TE6F3Kwn2I4MOS/Wia6Mc5C1NRLlUxGawQ9MvBH6/aK?=
 =?us-ascii?Q?Sh+JpVoMu8udPxkZXC8sadUwASK4LUlk1+Dii6Fncn5/7DwTL2z8YB+BRoOT?=
 =?us-ascii?Q?U9R06Ni+BR1sNuvMi2AFsUaGg6G3Ymoj/UntFQ0xoxG6pJ8UdMXURuKRoaHG?=
 =?us-ascii?Q?Iltf0ONSQE3hfVUGgCzDnjkR7CyvF52thX9aYgPmvHHd/VFDCLr2rjuLXcAr?=
 =?us-ascii?Q?tnjI9ajudgzKXMTH4TmLZ1eIjHhWZrrLN6Im3PWXhEPWCxuEjvhPjmsMsiYq?=
 =?us-ascii?Q?yDA03DatI0tbt5TLEww8qYVqfxms2cOXMEVeGkCUZI8oTFE5xQFaSbRmjvO2?=
 =?us-ascii?Q?mTs3Mtf21mvhUvamgMKT4d+bcBJakfjT49gMBSnqbIFPgt5a2FvxHuOIk3hz?=
 =?us-ascii?Q?ParvIP9o6Kc5wuOZCKVv8xM3HLgxEJZ7qQAY+Xgu+VSMRLP6zZJDJkO14E2s?=
 =?us-ascii?Q?THTSgXWpPdvkG2r8b1Ns74TGlw6xsLW5RM6x/Tlvdy+SiML34BAIec3NVuQG?=
 =?us-ascii?Q?DBb1jq5dtPfHk7QBk0AFsMjoWUPHkMqIHeEqnNw5kRABwHZy/UNQI4fJLjQm?=
 =?us-ascii?Q?2vuG46y/ArPq8618CidNEnC1iTnluNx/ywZrKO67nVQ5s67B2/J0XE1HymcL?=
 =?us-ascii?Q?NrOSRDLfIMmZydTNNAycTIVKGKqBHVIYVPP6yiacIdJTeu9S9ACqxR4HCcSv?=
 =?us-ascii?Q?tNZ70O+XwbJx4QOTORQVBX8IH5wasR1ouZKXqodZ9no0/XrgPn56L2XfmHq4?=
 =?us-ascii?Q?wGuCn4xHnzMel0667isDWH1TZxFvXGZoUq64iL1kRogWZlrqZCMcTF8qHNNS?=
 =?us-ascii?Q?PMk/ZxuASMcMBf272joRsKPZSy5iwyJcaHYekxevrk993OKYCI/Ea9pOZTq2?=
 =?us-ascii?Q?63z2MaoxChXBc9FBfyi3cdPiKX24yHquOQm3zOnOpDj3nLPwRgPbDMV3D/9t?=
 =?us-ascii?Q?JHkqAEwLR6EAOg+HSevskmF0mPvpA+6blmbbFuOUVnaVaJEhacDb098BgMb3?=
 =?us-ascii?Q?uXLUnSnC8DfaOVFP+1u1qtzyFcsVqFcT1Xc5O79c5B/+WrmsEawYiFlfQZrz?=
 =?us-ascii?Q?arCtrSqH24YIehHZ+GiR45aN3pHcrTtGdzupgbMw7c+QSBg1y744rbZDsCM5?=
 =?us-ascii?Q?ovb6wiMfdPxzaQH5EcPcneG4TwK4bwhSsmXktCdoxaU/S0vLmIh69a6BE5N7?=
 =?us-ascii?Q?UMR9n/O8gcsd7ofK5oyiA9gfXcOQ5UJMsKg0fYHjrFFpSajYQcXoNU2JVyf8?=
 =?us-ascii?Q?7VDsGdQUf27BaASf3kHvV08GdNKAQIIHUb+RakR10rIOIYlcSh2fyXxGp55B?=
 =?us-ascii?Q?1dLq9LayOvv2GhyFoHqe8kphpG5aTA9TSC2GP2dP49WnHMy+Zu8y4G0p28MY?=
 =?us-ascii?Q?nEMMP5KgsTlwRmpSiaKci181oHi0sfb7Q3ZAtcVp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dd319747-de2e-4399-d169-08da96c654f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 02:59:39.8677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9gQJXpaBmEYvrynoxKjdVCz5smaA6wVvVjdC5WGixtFpoEFdvXuM7bO/UPv+GJej4zFtq8GF0yTV7/9JRYow9mkRp2exg7yk/WLFzcYDWBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB0593
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

I'm sorry, I'm not used to this yet. I sent it again after using 'git rebas=
e -I' as you sent me. Please check again.

Thank you for telling me how.

Best Regard,

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
ment. Thank you.

-----Original Message-----
From: Mark Brown <broonie@kernel.org>=20
Sent: Wednesday, September 14, 2022 6:44 PM
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Cc: Gyu-Hwa Park <gyuhwa.park@irondevice.com>; alsa-devel@alsa-project.org;=
 Application <application@irondevice.com>
Subject: Re: [PATCH 3/4] ASoC: sma1303: Add driver for Iron Device SMA1303 =
Amp

On Wed, Sep 14, 2022 at 01:57:10PM +0900, Kiseok Jo wrote:
> The Iron Device SMA1303 is a boosted Class-D audio amplifier.
>=20
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> Reviewed-by: Gyuhwa Park <gyuhwa.park@irondevice.com>
> ---
>  sound/soc/codecs/sma1303.c | 2781 ++++++++++--------------------------
>  sound/soc/codecs/sma1303.h |    7 +-
>  2 files changed, 762 insertions(+), 2026 deletions(-)

These look like incremental patches against some existing code (perhaps you=
r previous submission?) rather than a new post.  You should be able to comb=
ine them with the original patch using git rebase -i and resend.
