Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E6710B37E
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 17:35:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF2EB1707;
	Wed, 27 Nov 2019 17:34:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF2EB1707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574872505;
	bh=MpLmio7AUDNiCeQkybcEowHLaAVtJMr3qPwj5hAIp6w=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rZr9YQKL5btZbBIJP+PXV6ruy1mnE0RQJb/cKAlpJLUiZnuDLlzOhiL9Nwg/zxbfr
	 wgk7B25s3/4ZZvhlJ3+vvMpdZBUhxqcj29mwM+sMq8OJPKKZsolEeRablWkD5sPrWf
	 TddeHgOETQu4NNi4aVZCD6OjvHkXML2HpcnK0Q7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36B76F80171;
	Wed, 27 Nov 2019 17:33:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F72FF8014D; Wed, 27 Nov 2019 17:33:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEC81F80109
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 17:33:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEC81F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="pqGpWIEL"
Received: from [46.226.52.194] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-6.bemta.az-b.eu-west-1.aws.symcld.net id BC/98-19153-C45AEDD5;
 Wed, 27 Nov 2019 16:33:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCJsWRWlGSWpSXmKPExsWSoc9hruu99F6
 sQfsvU4srFw8xWUx9+ITNYvO5HlaLb1c6mCwu75rDZtG5q5/V4u5rP4sN39cyOnB4bPjcxOax
 4+4SRo+ds+6ye2xa1cnmse/tMjaP9Vuusnh83iQXwB7FmpmXlF+RwJqxeNtk9oL5XBXfjq5lb
 2BcydHFyMXBKLCUWWLRjKvMEM4xFomWq8egnM2MEr97f7J1MXJysAicACrbYwOSEBKYxiTxZU
 oLI4TzkFHi16X7zCBVbAIWEpNPPADrEBGIkOi4d5kNpIhZoIlZ4v2qpYwgCWEBZ4nZ/W3MEEU
 uEoc2N0E15Euc3PaAFWKdqsS/rSvAangFEiU2/tzCDLHtGKvEhkW/mUASnAJGErM2zGMBsRkF
 ZCW+NK4Ga2AWEJe49WQ+WI2EgIDEkj3nmSFsUYmXj/+xQtSnSpxsusEIEdeROHv9CZStJDFv7
 hEoW1bi0vxuKNtXYvr3+6ww9RunfoGaaSGxpLsV6AYOIFtF4t+hSohwgcSyZ7dYIGw1ie3Xzk
 OdIyPR/rUT7BcJgQusEhdOnGaZwKg/C8nZELaOxILdn9ggbG2JZQtfM88Ch4WgxMmZT1gWMLK
 sYrRIKspMzyjJTczM0TU0MNA1NDTSNbS00DUyMtBLrNJN0kst1S1PLS7RNdRLLC/WK67MTc5J
 0ctLLdnECExwKQXH7uxgbPvwVu8QoyQHk5Ior5/XvVghvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
 ryaS4BygkWp6akVaZk5wGQLk5bg4FES4V28GCjNW1yQmFucmQ6ROsWoyzHh5dxFzEIsefl5qV
 LivAcXARUJgBRllObBjYAl/kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnPgKziycwrgdv
 0CugIJqAj9vWBHVGSiJCSamA6Gncou8snarXldj23iRZ8bxzvTi/J8H4/ca0YI8v9kuB9UdNu
 6n7de2BT/vdfG5lrTcSkH67WfCekl/Q5XutnkjqrUHlHX4PtRf35S654+LL8lzgWlMEy/8fcM
 lcG9lLlBPbPafpFU2JSJAxPpVSXe9d9W3NbQTLb89/nLbZsuYKiS/ZMYD7hzPvzAkey9bxv4f
 6Gt5oPiR6K2/CBOer2mtIypuclxZ772KT5Xc486PnOoeF1PSJK4fnPTXZXF12Zx/HAaXZlxKx
 PAeLZswROLzR73t1Ruu18Q7+71rXA4t02jRJLihK89Hdv5V8/1YBR63aYkYrEkSm2En8ilE3s
 TI7kRv45uq4m/G3NPyWW4oxEQy3mouJEAKPR+Bx3BAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-21.tower-282.messagelabs.com!1574872395!506323!1
X-Originating-IP: [104.47.8.55]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10650 invoked from network); 27 Nov 2019 16:33:15 -0000
Received: from mail-am5eur03lp2055.outbound.protection.outlook.com (HELO
 EUR03-AM5-obe.outbound.protection.outlook.com) (104.47.8.55)
 by server-21.tower-282.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Nov 2019 16:33:15 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDs4E/X6pJSVj/rD4GIMBg+fBJCMuo56bjUt9gvW7xm1PvFE4HnlZVGCExUjfO7Qk2CdzjIiSS5DbrztOWHy4J60KMaXpnMmuLFUBgqKUz49yVJb9ckW/s7tHrc3NZg6ttq6x1vrHvpJ+thXXvfCHOPL7YYIkydAtuujay6fL7EHlnaD0PcN3a0kXY/B0ciX25m+HWolht6G2nnjyxu5t3tF6EQD1U5eEgjvtQcNic34VIkMKZCpayE/kLVAzpg7+d3unAUoK2YAKQ576bWQqvD3LQ+45Xnt+YF1JFFx6O5wAmFknNG411hTqe+ylAsKh8vinx303Ju4xvaZQvTk8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC6hUQu18x9cqFusYWJz3/n+9iEyYfJnNdxUlzp2JE4=;
 b=EHIRSuempAGE/zvdPolzoXI8PfCTz/VVTwhn+54/pIUVmid1EhjEprh0t9MiVJUWHvdHWa6Yb+Q/tyyNFOOmjy4rK9RF8KYWrJiCEVcHRAXQl9du8DxFgfTU8TmhSvggcTHN0QrWTN6qxkNyp5R0n2N0LyfptuUrR4I1SJPt9R2c/snvc//T5s62aC2V3FUL5lEAomTF+BQMUiMjdyVT8K1/Z1jb2aje+/UaTD/2ztusNrXyPu2iUIxb9z+lyPzRUg9/klQFmPlvRnVEPpaa7epugVoa5O/2B+mLDut0+CvuWOQvtXsnuj5D8K0pKwRQTrYUmAlTjKp3KQUL8BpyIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC6hUQu18x9cqFusYWJz3/n+9iEyYfJnNdxUlzp2JE4=;
 b=pqGpWIELuERh8EorwCUyR0tqXX0PEvpB03rcOeWbBCKzL80sGi3z898PfkeFmk/V33x+IXHqIPaGMxbxCfRGY+U1upA/E9wJrQGWXQfc2w67UcUWr1QtP+6i7PTqhn7QGOVCjEKPs2q68mCA8hsLKs08CO4oSuy7+XhqfU0akQk=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB0979.EURPRD10.PROD.OUTLOOK.COM (10.169.155.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Wed, 27 Nov 2019 16:33:13 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 16:33:12 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Mark Brown <broonie@kernel.org>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
Thread-Topic: [PATCHv2 6/6] ASoC: da7213: Add default clock handling
Thread-Index: AQHVn7aXMyQuMXvm70+jyJLut64noaeWIihwgAeSgICAAAQ4gIAACJ3wgAADHgCAARqUMIAAHxOAgAAPlwCAACS4AIAADJyg
Date: Wed, 27 Nov 2019 16:33:12 +0000
Message-ID: <AM5PR1001MB099467ACADA4F7B6DDA5087480440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-7-sebastian.reichel@collabora.com>
 <AM5PR1001MB0994720A0D615339A978E35C804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <AM5PR1001MB0994E628439F021F97B872D480450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191126170841.GC4205@sirena.org.uk>
 <AM5PR1001MB09949D557742E8817545637F80450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191126175040.GD4205@sirena.org.uk>
 <AM5PR1001MB09940CF764711F1F13A6B37E80440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191127123317.GA4879@sirena.org.uk>
 <AM5PR1001MB0994D842A2D7051F81A7765B80440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191127154030.GD4879@sirena.org.uk>
In-Reply-To: <20191127154030.GD4879@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4dc811cf-76c5-4f23-ea8a-08d773577f2f
x-ms-traffictypediagnostic: AM5PR1001MB0979:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB09792B1A936E5D771A757619A7440@AM5PR1001MB0979.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(366004)(396003)(136003)(189003)(199004)(446003)(11346002)(66946007)(66476007)(76116006)(66446008)(6246003)(66556008)(64756008)(5660300002)(52536014)(2906002)(66066001)(33656002)(25786009)(14454004)(55016002)(9686003)(6436002)(54906003)(110136005)(99286004)(316002)(3846002)(6116002)(478600001)(229853002)(71190400001)(71200400001)(256004)(81156014)(81166006)(8936002)(8676002)(305945005)(74316002)(7736002)(6506007)(55236004)(102836004)(26005)(76176011)(7696005)(53546011)(186003)(86362001)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB0979;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7Udr+5b0wPR/GEj4BADfFayG96vCnZaDbZr0kYwBmCLkNLujw/Ij0qhvwFJs69FXKIY/dtQBaBQDVY1q76ZFHHDq7zzMNKMn5PUjt7gxG6m6GX5NGYM1etwHNTddJwVg/tYNCaigEHhl7T8j4/1qSOqNrsAtgkMorp6dm4SbLAdObaHzOtzselTsh/8hihLtJQ0LFvoP6yEmlY/3xtTJB3wvm9b2lvie/Pwnc4UIo7stcxb4zrQgTRlmrWv4p09eF99k6xYhIXgfsx2hE33MeRSmY+KBqXdrxu30l9VRgBQ1NWqtq11FmwlbRh6SCJQu1v2Ng3iUCZOxXHpP5o9MWtYjh9Hp+zuIMswA1yBDcqUzIhr2NGkZEOBlAxQrvzUxF0SHlT6DbEF4dn39j5t+9xnqQRSVQQEi5zZVadU+dAqmFmU14y+bwOOlt4bVewDI
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc811cf-76c5-4f23-ea8a-08d773577f2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 16:33:12.7800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rStooYcqh+zMnODB5AeulISbXGOri4ODkFw0TuYcD9wOkb37ie32M+rtt8Vk9nc5ga0C0wyCH65XwLcJ0RYUMF/d3krjIGY3V47EpmTd5UU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB0979
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Support Opensource <Support.Opensource@diasemi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [alsa-devel] [PATCHv2 6/6] ASoC: da7213: Add default clock
	handling
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

On 27 November 2019 15:41, Mark Brown wrote:

> On Wed, Nov 27, 2019 at 01:42:54PM +0000, Adam Thomson wrote:
> 
> > nicest solution here though. I guess we're stuck with people having to manually
> > configure the PLL for bypass when a non-generic machine driver inits, to avoid
> > the initial double config, as I don't see other options unless you have
> > something to specify at init that it's auto or manual, and this doesn't feel
> > like a DT device specific property thing as it's more software than hardware.
> > At least Sebastian's patch has a good comment block to highlight this.
> 
> Not sure I follow here - if we're configuring the PLL explicitly then
> I'd expect the PLL to be configured first, then the SYSCLK, so I'd
> expect that the automatic PLL configuration wouldn't kick in.

The PLL in the codec relies on MCLK. The MCLK rate can be specified/configured
by a machine driver using the relevant codec sysclk function, as is done in a
number of drivers. Surely that has to happen first before we configure the PLL
as the PLL functions needs to know what rate is coming in so the correct
dividers can be applied for the required internal clocking to match up with the
desired sample rates. I guess I'm still missing something regarding your
discussion around SYSCLK?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
