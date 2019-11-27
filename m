Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDDF10B07F
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 14:44:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A9E21720;
	Wed, 27 Nov 2019 14:43:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A9E21720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574862289;
	bh=Lj4PNtT8jenaI4+7ry2AyRYOf4BcNo7s56WO2EBnrp0=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dWJYw2PQlB00XbmIKQCzwhvflmkQ0zPCwtGWRVepOZICvDeRvnkd7K9vIy81Oi7Hq
	 gAwiO88h5pvE31a7DTx7oznCHuBCdL9XVcAjcd5mGnkI4Jl030eCTOMA/jxJOvJz8c
	 s/HkMB3OUjcB8AHXYSfPppEnju7znZlFY7AK+LFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7848FF80109;
	Wed, 27 Nov 2019 14:43:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5EC5F800CE; Wed, 27 Nov 2019 14:43:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93655F800CE
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 14:42:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93655F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="F40Do5fq"
Received: from [85.158.142.104] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 19/FA-12040-26D7EDD5;
 Wed, 27 Nov 2019 13:42:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTfUwbZRzHee6ux4GUHKWThwrGNUzA0fKWxUs
 Wjc5JqwR07o/N6bId5eTq2qP2ZcKchnVu0I4FAqgBZUxScNKppBV5X7SD0TIYk8HGmCXAcBEI
 zr2Bc2Ta9srU/z6/5/u5e77P5TkCFc3jEoIpMjJ6jtZI8XCMTY2kZPSHU7vTaj9OocZ+diHUJ
 zNzOOW8UC6glsfKEOpS1xc4ZemqEFDexVyqdeUb8AKhbL1jxpUdXhtQdtZ5Q5WOFguuPLPUjC
 u/+34cU95xPPl66C6BmssrLNorYOcPtwHdSHjR2VPn8RIwRFhBOAHIJhTWjg0J+OEcBtutjaH
 84ATwwfH7uH/ASDcKuxo8gUFEforAU6ve4DADYIf9a8QKwgicpGC1exr3s5jcCcumLgUklDSj
 8GZLE/AH0eRL8POKoygvbYUupzn4gArW21cDDkZugNPXOgOOkKThyO/twd08GHRUdQekMDIDd
 rtXAhIg4+HdQ/YAo2QMnJxrCDSCJAltPSMoz+vg/PWHAt5noMc8Afj1FDh8ZS7IUniivi/I8X
 C04ViQc+CZxl5kzT9/uie4TkHbsSOYFRA+ToAPXcU86uBC72beeBoecjlwnuNg6T0L6j8KJC8
 KYLWtBqsEqXX/ac1zCjzZfRvneSNs/nIRrQt8iijoqZ3DTgKsBTybp1cXsEYtrdbI0tPSZOnp
 mbJM2SY5fUBGyxmTTMVwRj3ty+T0+wa5oVir0uTLOcboAL77lv8eKugAh5eX5C4QSyDSdcLcV
 6d2iyLzCvOLWdrA7tGbNIzBBeIIQgqFpg98WZSeKWCK3lFrfLd2LYZEhFQshAd9sdCgo7UGdQ
 EfDYJMonK+vhElnPVNjagI4wo5RhIj7PCrpF9lTdyjF639AaMgXhItBCEhIaIIHaPXqo3/zxd
 ADAGk0cIL/j4Ras74aL8FXxXEVwWpnfRXMdL/RpIS5KPsq5XKEMsPZ09bfuyyTh596zHTTu2K
 WaHYp3CE731j9mAc/fjwvoG2TCRhy/CLr/3R+sSDRPfzpCfrltlmeqr2s8i/lKVLiVtW3u2uu
 D9yO3Hz+I7k8q0DRFJWTZm9/0bsYr9bEZYkHlrfs7/PsynhXnK5tkpRk/Vt1f7jfxZfTHWunt
 P9kt25HMsdyda9vbE36sSuccIoZtsxzuI90DP71ajkCpu5rZ2F3qtLqhtVv90dt1/f8Dd2udq
 oezO5PmNbU/UrST9dy50p2TExKl7NiS3NEG0fSerT7JlFGvBbl3uE/RNVvw7efE7hkYhVOeb1
 1khD28Bg84rEvX22snP65UYpZmDp9GdQvYH+B8BwW398BAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-14.tower-229.messagelabs.com!1574862177!354434!1
X-Originating-IP: [104.47.14.56]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10056 invoked from network); 27 Nov 2019 13:42:57 -0000
Received: from mail-vi1eur04lp2056.outbound.protection.outlook.com (HELO
 EUR04-VI1-obe.outbound.protection.outlook.com) (104.47.14.56)
 by server-14.tower-229.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Nov 2019 13:42:57 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5B7e+G0BvojV8oIKXkaTIBDymNAFCXgVIBji/auQyjNL4cboLxlhhVT71qTHuB/DRPYtEs0t3CgH2LISmUan+bwTN6mHYW5fr6ZAClyOOwm+cfkApxQPRqDMLu9wmhDq8cLeWfV5V7X3bW4N+IjvsKWSxWBguOhLZwJq1vZjiOi4OBOKLWje0FEiuT8u9gfCa98Xmp6xMFRUDQge9RYPfXuMYbkE/pB9CKoElrjjJ5HMH836Zs6+QqEm6N5jG8KTx0rbXkkcavb+razUHY1A/gbzz4VmcwnrDLtW7ThXFuLrJ+Bf0IeB3io31DGOSgqXjyPd+7ddty/WGKEWFFF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6rDtcEaoDpt///VPfBv4pOx9i1nEyui7M4mKGxYgJo=;
 b=Dj6Mn5saQPFGpZq/oHHVqhkyMG0q7LgAIaP8J8cm0IyERbYRIGlzddQAEtfYtGLKxAk++C+bCVm64VEp6A0xTkOpkj4Hew0Ac6HVtodURlUGsoZb4Gk15VnT6NNvDv5rAwiuO8yPgTsG9P4g8UDwqk+xs26WGd3T1kLpyhTE9nkrNLVTO9hFPKfbyV8kXQ+wK4Ls3sie+KR5X7kn1Xen2pV34lW4KcansHBS2ecttGZ+vYMDoNgfatzcmLYhvr4BARlO1Rz26Dxn0OcYEx/D/Ab/t9HZjVZb6tQoO4gXw3EuM584h5MqwNJkGnfIOWpGrOaeyZwLx5R8sGKJxCyFeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6rDtcEaoDpt///VPfBv4pOx9i1nEyui7M4mKGxYgJo=;
 b=F40Do5fq974C2rHn+2YzG/kpWHK/Jtu6F/j4uebGkNgCFjS635/tWY9fveCrDwYhH1xeSNf5MJUeJjk+UfvsHM6jD0gKk1oQom+Ht1GsvOpnWSx3CpvRjflFUOtTF+5Rt+Xt7H/DHXClbwEGh3UZW2MirPjIwatIKjNHwIB2C+s=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1043.EURPRD10.PROD.OUTLOOK.COM (10.169.155.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Wed, 27 Nov 2019 13:42:54 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 13:42:54 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Mark Brown <broonie@kernel.org>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
Thread-Topic: [PATCHv2 6/6] ASoC: da7213: Add default clock handling
Thread-Index: AQHVn7aXMyQuMXvm70+jyJLut64noaeWIihwgAeSgICAAAQ4gIAACJ3wgAADHgCAARqUMIAAHxOAgAAPlwA=
Date: Wed, 27 Nov 2019 13:42:54 +0000
Message-ID: <AM5PR1001MB0994D842A2D7051F81A7765B80440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-7-sebastian.reichel@collabora.com>
 <AM5PR1001MB0994720A0D615339A978E35C804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <AM5PR1001MB0994E628439F021F97B872D480450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191126170841.GC4205@sirena.org.uk>
 <AM5PR1001MB09949D557742E8817545637F80450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191126175040.GD4205@sirena.org.uk>
 <AM5PR1001MB09940CF764711F1F13A6B37E80440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191127123317.GA4879@sirena.org.uk>
In-Reply-To: <20191127123317.GA4879@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49f1955e-5971-4785-4eff-08d7733fb494
x-ms-traffictypediagnostic: AM5PR1001MB1043:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB10435572B3E6C806587BF9F5A7440@AM5PR1001MB1043.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(346002)(366004)(39860400002)(189003)(199004)(7736002)(7696005)(66066001)(86362001)(305945005)(76176011)(3846002)(53546011)(55236004)(74316002)(6116002)(6246003)(33656002)(6506007)(446003)(9686003)(2906002)(102836004)(186003)(71200400001)(26005)(14454004)(478600001)(71190400001)(66446008)(76116006)(256004)(81166006)(64756008)(110136005)(52536014)(66946007)(66556008)(6436002)(66476007)(99286004)(316002)(5660300002)(54906003)(11346002)(8936002)(8676002)(55016002)(229853002)(4326008)(81156014)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1043;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x7HOGKFhcJMPYO3Bc/6DKOLqorDR4oRM5qsitsdf68ABUHkPKgECyxzzayLXmOmaJ2iekrrI1CEPhSQxMkFvumw2cuZEqpec6kBTXC9DxusBXl5kQzQXLJhreG5R5HiT0tEK5oSjiZo0oIa1PePLWXxO3C4cZmwfBSr5OaeKcqaGYw31ol1+7quJ9TWZxSMkwVDjC8Gy8AAhDnjVH/BLz4KbQdrUWQKRg2WUxhCzOzJXip/ruJn8eOtl7UhsFkAjJAU/V9F3BdPR4pwEjtVcSA1TxXd216o4igJSmuUL4xkfjBX0ZlJfoykQl+B8dTfVSfZwaXeZaabUv2QuWIPhrwz4UUSSbnplSfY+x32uYlHFtSP5eGAsEYBPlcND9qoXPcei398fg+42v0rrFKnS7X6XCdilGdiPnad9n9Hai1XahU4H2BdzHI9kae++sDTq
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f1955e-5971-4785-4eff-08d7733fb494
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 13:42:54.5137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ln7wFHVTj2Jeq1016UrnhvUb25nLU9Xmpq/B+aj7Ov1Mj4R9cecT9B0LaL5utbJjJizig4n1YN1GOkn9xw9lHHs2tzXxvehj3lDpTFfinlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1043
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

On 27 November 2019 12:33, Mark Brown wrote:

> On Wed, Nov 27, 2019 at 11:32:54AM +0000, Adam Thomson wrote:
> 
> > As I said it's a small thing and requires a specific use-case to occur, but
> > having the PLL configured twice for the very first stream in that scenario
> > seems messy. Regarding the SYSCLK approach you mention, I'm not clear how
> that
> > would work so I'm obviously missing something. If we had some init stage
> > indication though that auto PLL was required then we're golden.
> 
> There's a bunch of other drivers using the SYSCLK thing, when you call
> set_sysclk() they provide a different SYSCLK number if they want to use
> manual mode.  If there's a concern about drivers doing stuff on init you
> could always ask them to set the PLL during init, even if only briefly.

Yeah OK I see what you mean; using the sysclk id. Still doesn't feel like the
nicest solution here though. I guess we're stuck with people having to manually
configure the PLL for bypass when a non-generic machine driver inits, to avoid
the initial double config, as I don't see other options unless you have
something to specify at init that it's auto or manual, and this doesn't feel
like a DT device specific property thing as it's more software than hardware.
At least Sebastian's patch has a good comment block to highlight this.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
