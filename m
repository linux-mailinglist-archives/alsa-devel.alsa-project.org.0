Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D5E1E2019
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 12:50:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CD7E174A;
	Tue, 26 May 2020 12:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CD7E174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590490221;
	bh=NBRqR0ogjrNOvL1pgddoDVPAUgmX33Rp8FReLiUp7ps=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WqkSt7ohb/KT9aANugZdYJ7OCRdYTPZCGMC3/vt338Husaepp5QSrfsf+f87dUVGj
	 d00e+S2YI4VjtRhHfNOjIkUn/ywVFOOdfPeULydIGjZkx8nCZegfHXLEqeX9EvH/pI
	 cNSOG0Nt2fXIYnle/am1f8SWRz6KG3eJ3BdV4L/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A58B5F8015C;
	Tue, 26 May 2020 12:48:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBA51F80150; Tue, 26 May 2020 12:48:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90F53F80100
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 12:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90F53F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=LenovoBeijing.onmicrosoft.com
 header.i=@LenovoBeijing.onmicrosoft.com header.b="INDqJNle"
Received: from [100.112.0.190] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.us-east-1.aws.symcld.net id 91/6D-43121-DF3FCCE5;
 Tue, 26 May 2020 10:48:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRWlGSWpSXmKPExsWSLveKXffP5zN
 xBq2v1C2uXDzEZPFy8xsmByaPDZ+b2Dw2n64OYIpizcxLyq9IYM1omLaIqWA6V8XLzoNsDYzr
 OboYuTiEBP4zShx/cZwJwnnBKHF29WtmCKeVSeLv/2YWCOcPo8TdWzPYQRxGgaXMEssnzAfKc
 AI5x1gk3m9jg0hsYJTo/vWZESTBIrCbWaL/axFE+ywmifb7X6AG32WUWLCwhwmkik1AQ2L+7J
 lgo0QE4iSWzehmBbGFBbIk2mf+YoOIZ0ssm3uOFcI2kri99DgrxAZVicUL5rGD2LwCMRKfT3U
 yg9hCAoYSX2auA5vJCVQ/610vK8SpYhLfT60B28ssIC5x68l8MFtCQEBiyZ7zzBC2qMTLx/9Y
 Id5pY5R4+uQikMMBlFCUeLm5FKJGVuLS/G5GCNtX4uPpU6wQtpbE/JMdUDOzJc5uXcwCYatJf
 H56BWq+jMTN1r/sELacxKrehywTGA1mITkJwtaRWLD7ExuErS2xbOFr5llgbwpKnJz5hGUBI8
 sqRrOkosz0jJLcxMwcXUMDA11DQyNdIGluqZdYpZukV1qsm5pYXKJrqJdYXqxXXJmbnJOil5d
 asokRmHJSChg272A8u/y93iFGSQ4mJVHebffPxAnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4P31
 CSgnWJSanlqRlpkDTH8waQkOHiUR3liQNG9xQWJucWY6ROoUozHHhJdzFzFz7Dw6bxGzEEtef
 l6qlDjvTGBiFRIAKc0ozYMbBEvLlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8/aCTOHJzC
 uB2/cK6BQmoFMurz8FckpJIkJKqoEpKyPW9uL/qwd0dSLMdooveHP/VurFRPEYDgHD5Sk6Df8
 O6TZOsm4JLG65GrQ+R2KJpxlH/hODbum6I95VE3wlOm7GlPvY+/hv+BRf15yVo7q7z0dZfPL6
 R7mdBqUOnZOy51+OKOrIc0rfq7SsY6Ez576IeTzyTrO02Tf1OCq9NNqyYXaijMXj89umH2891
 vLf2mK1QWe0d0BapKqnhNa21JUWbrUvOB+HTO8SWd2el1sUdvQy75EDG+t3ll5eeGfVt/c7jT
 xPdgSkfUr57HuBP2Cuzk6ppC3BYQLO881WOn/WLN3H/2Peq4e8YmYNPdYxr5afZrXZZRQux+c
 lk1Gg/NuJ61Fzn2Qo69ftSizFGYmGWsxFxYkAWG9RQkYEAAA=
X-Env-Sender: mpearson@lenovo.com
X-Msg-Ref: server-21.tower-386.messagelabs.com!1590490106!383970!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14285 invoked from network); 26 May 2020 10:48:28 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
 by server-21.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 May 2020 10:48:28 -0000
Received: from reswpmail02.lenovo.com (unknown [10.62.32.21])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 4B569727BB28D9DAC7F0;
 Tue, 26 May 2020 18:48:25 +0800 (CST)
Received: from reswpmail01.lenovo.com (10.62.32.20) by reswpmail02.lenovo.com
 (10.62.32.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Tue, 26 May
 2020 03:48:23 -0700
Received: from va32wusexedge02.lenovo.com (10.62.123.117) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5
 via Frontend Transport; Tue, 26 May 2020 06:48:23 -0400
Received: from APC01-PU1-obe.outbound.protection.outlook.com (104.47.126.58)
 by mail.lenovo.com (10.62.123.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1913.5; Tue, 26 May 2020 18:48:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mi2rSvGou5BaIPEshaDXk9Jj9Y5UVaVAw1F0KQZU9u5AnSh9spNgH+UNiI+SlWEXgS3rHuvIwJZmW8AwhXHpJ9vx2wWTc2/nk1d5/iKFbHSOdF+RS2QPULn9ukW3GO84CC7fOeha8ieIl4kDx7swaBTPRvYB/YDdVxarjPJ8wlH8ZEeG1UvWAagpetTx6z1on8PbAOrc8/mxdwnjr2jV7XcfpUBIkKb2tYjlrSDLrm7zXqK95pGeOBmNEdIqlBSYyXyamkCaIQ9UjpMaTbYftSJ4hTTbRrhhMJ88BUZULjiLtypH2bfbNE45S21YVL99SPLrBklarjFOBOvm3ou1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjKdwb5HMUZHYGD2PgPr773EU2kuLApk0LTKmgOKxAk=;
 b=khIHgUPE14SOFqDQNDLfQ22OvwI2GQiH0AFP4sl328oA2j6rfBPEez07tkDKBSS9CcSSMJc1penZYLh+gpvfSHn27MLgk71tjvoLYGOrmQ1OMuX9O9rDrxWyH9hG2sjEiFuDACcHg17ZSXLW6oAg+vjEp2dQ/g9dvceEWnPTLwaoMrJPC7+sjJ8XwsL8VjLpURL/042w3aF6muDjI/QNhlKKqJuJIvUsRNIWBAr6cy4S/RAeiqWevPyZNVkjvTkmR7j7aqF6bHApLZKtO4jYbSDk8sGPMofkzbsFVdbBSEErVka2UJM/4mFTkWwt7iOwcAarQRh5COmPTvozzlZnXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjKdwb5HMUZHYGD2PgPr773EU2kuLApk0LTKmgOKxAk=;
 b=INDqJNlewz51UvWtQhcHTgm0hu3mL2qUO8ywHMbOFcXM5jVgvi1qeVi+02oiqEofCf/Zw0RPuHLzhV48uHurg3wXRkrvEH0H8FPUv8w5bJvyC+/vUNF8oDrfALd/PbY1Tcp4jLs0Vk4afe7Q7oKPq1Gl7hntd8pow1ogi/hXytc=
Received: from SG2PR03MB3324.apcprd03.prod.outlook.com (2603:1096:4:19::12) by
 SG2PR03MB4847.apcprd03.prod.outlook.com (2603:1096:4:d8::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.13; Tue, 26 May 2020 10:48:20 +0000
Received: from SG2PR03MB3324.apcprd03.prod.outlook.com
 ([fe80::3417:bbb:2260:50f6]) by SG2PR03MB3324.apcprd03.prod.outlook.com
 ([fe80::3417:bbb:2260:50f6%4]) with mapi id 15.20.3045.013; Tue, 26 May 2020
 10:48:20 +0000
From: Mark Pearson <mpearson@lenovo.com>
To: Takashi Iwai <tiwai@suse.de>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [External] [PATCH] ALSA: hda/realtek - Add a model for Thinkpad
 T570 without DAC workaround
Thread-Topic: [External] [PATCH] ALSA: hda/realtek - Add a model for Thinkpad
 T570 without DAC workaround
Thread-Index: AQHWMyaT5xdWieFTHka8qf42CShk3ai6L7pA
Date: Tue, 26 May 2020 10:48:20 +0000
Message-ID: <SG2PR03MB33246200560A5E167DC209C7BDB00@SG2PR03MB3324.apcprd03.prod.outlook.com>
References: <20200526062406.9799-1-tiwai@suse.de>
In-Reply-To: <20200526062406.9799-1-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.48.229.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffb06e61-2f14-48a7-4d51-08d801624e4a
x-ms-traffictypediagnostic: SG2PR03MB4847:
x-microsoft-antispam-prvs: <SG2PR03MB4847580AB20A8850DBE3CAB8BDB00@SG2PR03MB4847.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p7rNv0GKUR5txZfvKh3Q5Cg1Cc6fNF67BJnPN2iPGIdm/CsHuP1oOqw8LlDXsb/ioSLIPrhqVqZTsFquuMOClDf4c8tWXVrXpvocu2ocYztBVpJOKS3K+xNEY7ZK1qPVWFe76cucIbtQPg68Ic/JaK2ufwBrjyGgDjtjT0SUKK0Ct7HcQvDywTf/nrdRzhmdCXIh533eMrqA25t/xWU5lb63RLN0Bx5Rmv5tugmTgoLqXDZNCs1G8mEz2NVC8qw/LRxd9B9leXfXgVJhXyiDSFnhsOAhugasWYNJRUvXprVqn8RO3yM9UJJt1grEcTHwAsAcMPaRM16Z7G64b3huag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB3324.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(66556008)(76116006)(110136005)(52536014)(64756008)(66476007)(498600001)(26005)(66446008)(6506007)(186003)(66946007)(7696005)(33656002)(8936002)(86362001)(5660300002)(2906002)(55016002)(71200400001)(9686003)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: bIyY7ibHKzLagM29O6AHzrNP+Cgje0uYsvwduB/79et2Hx0LJKENKt1MX/xqD9UQg5KVh8+1URwJYQNgdFw0ve1v9bjVNen2FYZkyKB0aEvgnRqtIMSYW1GdaR+QWysDPTUEGlbq0NifrYceySfyTHnrF2Ksoh90Hd9uzVehj895OgHHyX7xcDwwhy5agA0851xoXjrhd1I+ZrBCSIOq36LQR44BKELcZVYiUuaRGllM9MOtlr6MR4QQbPYCszjCJkLLWab3OIAYNqZtth97ontEMk+q7qLwtGDEIWterp+MJTjnpc4r3PYIFfksMRifXJYp3dopePZJX/cCoUKqOeqMYuV3hOeTNT6HYpc9LU6P136/Xv5mvDPvv3M5tlqS6EWqhzJXGcnOwSKufgXwlGaBUxbvkzMfXPg0gsT7UymKOX5u72+NUqML/6MD4NdgBCUChf18z9cdT8p/3V8eu5vsgM7DZ4KwYeZ3mrHW2qJ2tWSBty/j62pIFqzdOzIR
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb06e61-2f14-48a7-4d51-08d801624e4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 10:48:20.2651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CCiCqGtcrwy66dUiaKarn1aAGUiwri1y4qT/n6PT6u0lUcupYqn0GCC0TYJwzcOypwHR8ddk/fej6klkjX6YZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB4847
X-OriginatorOrg: lenovo.com
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

Hi

> -----Original Message-----
> From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf Of
> Takashi Iwai
> Sent: Tuesday, May 26, 2020 2:24 AM
>=20
> We fixed the regression of the speaker volume for some Thinkpad models
> (e.g. T570) by the commit 54947cd64c1b ("ALSA: hda/realtek - Fix
> speaker output regression on Thinkpad T570").  Essentially it fixes
> the DAC / pin pairing by a static table.  It was confirmed and merged
> to stable kernel later.
>=20
> Now, interestingly, we got another regression report for the very same
> model (T570) about the similar problem, and the commit above was the
> culprit.  That is, by some reason, there are devices that prefer the
> DAC1, and another device DAC2!
>=20
> Unfortunately those have the same ID and we have no idea what can
> differentiate, in this patch, a new fixup model "tpt470-dock-fix" is
> provided, so that users with such a machine can apply it manually.
> When model=3Dtpt470-dock-fix option is passed to snd-hda-intel module,
> it avoids the fixed DAC pairing and the DAC1 is assigned to the
> speaker like the earlier versions.
>=20
That's interesting - let me follow up with the HW team and see if I can
find out why this is. It would be nice to have something that works for=20
all cases automatically.

Mark (Lenovo)
