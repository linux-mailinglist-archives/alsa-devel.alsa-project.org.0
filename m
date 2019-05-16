Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BAA20959
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 16:18:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 333B116D0;
	Thu, 16 May 2019 16:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 333B116D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558016292;
	bh=YJvpcyWJ078X84hUt+WRPukecn3yJX2/P7+5RDQEjV0=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OgQbnR1nNDtmhd0iFKpRO0vLVAxG7D1lky1ij7gaJWLueuYjBXA4kNRNixYcpzlHS
	 xaC6VEw9J3aJ7fEKvKDpog/Z/Z60MbJYBGyKV+S4/WLzPAeHxIzmMUdmS7mNavZdHw
	 W/Ih0L42FIFk0SlTdhzxmpkhsc+8BJWqeKlr40L0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C56A0F896B6;
	Thu, 16 May 2019 16:16:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57454F896B6; Thu, 16 May 2019 16:16:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50043.outbound.protection.outlook.com [40.107.5.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E793F8078F
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 16:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E793F8078F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="fDZp+pxZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrbIqiFp1FNdikz0/28kQFOCtURf9dvEzgL5XEPlD1A=;
 b=fDZp+pxZWtXW2v25kq/MkKWyQgHn1tvKE5SMsxweBONHiKBl/q6FsfMK2GNufbUj7QJvTRY3+GdWyRbeF+cJQ0Wf5SHAv2RNiWee5/sblPoHxEkxBwPQcRKgXPqfX35D7ut7z7DaNqqJll+VhoR3bJm0KQMcZaL+SELsk+hw2lM=
Received: from VI1PR0402MB3357.eurprd04.prod.outlook.com (52.134.1.18) by
 VI1PR0402MB3568.eurprd04.prod.outlook.com (52.134.4.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Thu, 16 May 2019 14:16:20 +0000
Received: from VI1PR0402MB3357.eurprd04.prod.outlook.com
 ([fe80::888f:9ea:6f65:508f]) by VI1PR0402MB3357.eurprd04.prod.outlook.com
 ([fe80::888f:9ea:6f65:508f%6]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 14:16:20 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "colin.king@canonical.com" <colin.king@canonical.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Viorel Suman
 <viorel.suman@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Julia.Lawall@lip6.fr" <Julia.Lawall@lip6.fr>, "perex@perex.cz"
 <perex@perex.cz>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH] ASoC: AK4458: add regulator for ak4458
Thread-Index: AQHVC+dix6gnGF9HoUCg65Wy4dJcvqZtzA2A
Date: Thu, 16 May 2019 14:16:20 +0000
Message-ID: <3bfeb07f8faad6f434da59571150639f4bfb52e5.camel@nxp.com>
References: <1558011640-7864-1-git-send-email-viorel.suman@nxp.com>
In-Reply-To: <1558011640-7864-1-git-send-email-viorel.suman@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a6f4962-9293-4ea6-ec14-08d6da09118c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB3568; 
x-ms-traffictypediagnostic: VI1PR0402MB3568:
x-microsoft-antispam-prvs: <VI1PR0402MB3568C70CC1DC86CCB4907028F90A0@VI1PR0402MB3568.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(396003)(39860400002)(346002)(376002)(199004)(189003)(2201001)(86362001)(7736002)(186003)(66476007)(66556008)(64756008)(81156014)(229853002)(81166006)(68736007)(14454004)(73956011)(6486002)(66946007)(6246003)(71200400001)(71190400001)(305945005)(8676002)(2906002)(36756003)(76116006)(66446008)(118296001)(8936002)(54906003)(110136005)(486006)(256004)(3846002)(6116002)(2501003)(6436002)(102836004)(2616005)(316002)(14444005)(44832011)(478600001)(5660300002)(476003)(6512007)(11346002)(66066001)(99286004)(76176011)(6506007)(446003)(25786009)(26005)(4326008)(558084003)(53936002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3568;
 H:VI1PR0402MB3357.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HWVHiq0uNgB6UBk5pA6czpcvFZUsqC6bZtJlIGS0XV8FhBGv9+UQCHjvRcOJArEgJ9OAPHqB7qxtYO3PX1dAdzUilLH8w53zN9Eb7+Sc2gnKELQtzqY4EyI6fxwnu+mLdyvs0qKZQ43JXtVoCIo402+A0vzCEJn9+EeOIcXUcSXSjfDIooxJ045qlMOdKjeeHxjRlaMbms4iTN4OV7DZLSvdiyr7xqNytGL13+sRNKg1Bi9MRjD3G8PSj5Yzl2PD1RT64BTLDpR12UslHf2Yt82uy97Lw698It42EvL3ZV1m27z4cthQZ+hH6hHO3lJs/t7FSAR/oRAZfJE/mnyfISaskVNvUuDsf+k41G2kZfNf3Ls3DPByl+yU1UV72xPKZf3BGIOpTjTnDG7CHRCq6QHcMFmSpVyH5YGDsSZN6F4=
Content-ID: <387C47A069F5BB4EA42CFCF5B3C3D313@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6f4962-9293-4ea6-ec14-08d6da09118c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 14:16:20.2903 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3568
Cc: "viorel.suman@gmail.com" <viorel.suman@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: AK4458: add regulator for ak4458
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

On Thu, 2019-05-16 at 13:00 +0000, Viorel Suman wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Add regulator for ak4458.
> 
Hi Viorel,

While at it please disable/enable the regulator in suspend/resume.

thanks,
Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
