Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE223C37FF
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 16:47:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A9141677;
	Tue,  1 Oct 2019 16:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A9141677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569941220;
	bh=3sa0AQOZjR4Pk/Ubt2wy+isD7GhqC062uxF9LKIGGYE=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dNQgejxtgew0lRHYgfPH3G4fnOn3fRL35svhT39lZUkOAmSMi7hIG6szQGTDpatmK
	 hbfChfXluO3ECabIO0G+0tI5dZI4XMsD/49GF6dAaqXrJo3brnZ72JBoQCjspRwxT4
	 zidfB8b3T/3xR2OMofON9lUfJIgOP8lgYsdG9svo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87678F804FF;
	Tue,  1 Oct 2019 16:45:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BC26F80506; Tue,  1 Oct 2019 16:45:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70070.outbound.protection.outlook.com [40.107.7.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 909CBF800D0
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 16:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 909CBF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="ICD79ETW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCKjlRlFk3TA8TCaneS7sIi7VoftPea6mC+tyGxK9xqcAwRdQBsqfvVZ6CzVSnpMJGGv3JpdNRMErO1ZABBpJ+PLK04AxZgOkNnC2a9SWjVbCfofSeT/cjW+xivb8UeWP52aitwq+KiNdmBGVXAPNVEBSe4hqALXJC7jHyWLy+LxdKowN+edsAbf+AFcNrXChcA02ZIRcN/mlAyg8tVCaVZ6pzomXU3pYNUJq46aNDvP1fqKwXj7NCZdgKlvlNeL3lpkXJaunSTxkRQn34GIQNRZFn0pPQ+ZrgV3fbgF3XVPgUOz9wg4LzYxMuuBew05UdNxho7URAKnONTBoHZ7Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fpk5bg8yHFceEbfXDU5pRhdled4cpLLpzt0VL11XZoE=;
 b=b9+gOeE8VPCNW+sI4HJJLaCdiy7cyX742U+7VWHztaj1+NNEjohgFF4PKYpr9EfI8tbvX+XmbnKciccj8SjO1FtluTdL4GAArU2rrdl+QPs899eYT+FAXYujaNTu09MuQ7aALx8K/xTWyNK9s93SdeVkstSYdHNOlXty+mPwm7hVhWg72DYPAvHJ6YZxXrI4WAnaf7t5Yl5wvwKxCFG8vessPbJENMS1h7bmP86r1epOpaRmZqrl/QCBSop3uXFZE7w/+EGLUemIjjkIwnXYi6xwYiN4qoKLN/wq6zNiUITjxL2UC4KS4diJsj/pTpH9fQdy2tHQtsNVc1SaGLtj6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fpk5bg8yHFceEbfXDU5pRhdled4cpLLpzt0VL11XZoE=;
 b=ICD79ETWMJtWg/DvUB9wkvJ6RQpayoQerHpl3mOKZpxDKfvmX8oDbetkooJyvi1e2dovpq4kep9iRVut7GDTY6tICZbjZqdKlnR6vl9VrqOy/x5rGbM7+X6mASqTkclGzQ+7fzTKiWxnbULY2VX9O4WPa6rT3XgMPHh39De+lgU=
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com (52.133.13.160) by
 VI1PR04MB4991.eurprd04.prod.outlook.com (20.177.49.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Tue, 1 Oct 2019 14:45:01 +0000
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::6ced:919:ea4f:5000]) by VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::6ced:919:ea4f:5000%6]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 14:45:01 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "broonie@kernel.org" <broonie@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>
Thread-Topic: [PATCH] ASoC: SOF: imx: fix reverse CONFIG_SND_SOC_SOF_OF
 dependency
Thread-Index: AQHVeGNxrQzh2sOFKEyKM74n1aPArKdF3NMA
Date: Tue, 1 Oct 2019 14:45:01 +0000
Message-ID: <100bf3142f6043e5d1615d2f99677938770e7c4b.camel@nxp.com>
References: <20191001142026.1124917-1-arnd@arndb.de>
In-Reply-To: <20191001142026.1124917-1-arnd@arndb.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69a33f01-701e-4a7e-d354-08d7467df078
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR04MB4991:|VI1PR04MB4991:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4991E9145DD1DB459AEA751FF99D0@VI1PR04MB4991.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(199004)(189003)(5660300002)(36756003)(91956017)(6512007)(256004)(76116006)(4326008)(229853002)(6486002)(81166006)(110136005)(316002)(25786009)(14454004)(8936002)(6116002)(81156014)(54906003)(118296001)(6436002)(3846002)(6246003)(50226002)(478600001)(11346002)(2616005)(66066001)(486006)(476003)(2906002)(446003)(186003)(66556008)(44832011)(2501003)(102836004)(26005)(305945005)(6506007)(7736002)(64756008)(66446008)(99286004)(71200400001)(66476007)(66946007)(86362001)(8676002)(71190400001)(7416002)(76176011)(99106002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4991;
 H:VI1PR04MB4094.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kUCTygm93eDpLDRMO7AXuGrmMIlCa6C86+AMXzWYMTYTvBTJHrnUtsGR/kn9U1CQztXnXTJNLV8BNOeOp/vUABA8FBkGN/Puu3HsAFNb27qdYLOozLrMnuoJgekKqT82cRiro824xGo2WqbBSOT6HrAa2M+OXuIK8fovA0w3lk+5tcR+/6uyYe0Pj6vM2KS+JIa+yaXBycElwlH1NWsY3wMQkH0j9/zQaRJHLrmuawsJkNs0gi4bISFkC5j6sYbFQRCB7mSDnlm+BxSJ0QN0w6bhT9kL5Qv9x2K8YXzZv7atB+zcX3PMG8bfo9HUYX95nhzcYg3VgVDHgoC0NUP0G+3Vqpsm+OJ5LcoaYm7wDuDJWPEbEsZ36w3nOXwaojJrYoZtlNhK5X6YC2XLXJyNpjvwMcvAlXmrNh8Y15UcplM=
Content-ID: <2201E3394F70494086F1E44768C0FC7B@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a33f01-701e-4a7e-d354-08d7467df078
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 14:45:01.4451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N/wCaJCl/p8Kz0edEcCdjElILRQmMXzVBmhmqK98e8FsF7j2ChE1i1FOJhdDI2+voX27yjK5lIMPRrFpSKshVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4991
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hulkci@huawei.com" <hulkci@huawei.com>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: imx: fix reverse
 CONFIG_SND_SOC_SOF_OF dependency
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

On Tue, 2019-10-01 at 16:20 +0200, Arnd Bergmann wrote:
> CONFIG_SND_SOC_SOF_IMX depends on CONFIG_SND_SOC_SOF, but is in
> turn referenced by the sof-of-dev driver. This creates a reverse
> dependency that manifests in a link error when CONFIG_SND_SOC_SOF_OF
> is built-in but CONFIG_SND_SOC_SOF_IMX=m:
> 
> sound/soc/sof/sof-of-dev.o:(.data+0x118): undefined reference to
> `sof_imx8_ops'
> 
> Make the latter a 'bool' symbol and change the Makefile so the imx8
> driver is compiled the same way as the driver using it.
> 
> A nicer way would be to reverse the layering and move all
> the imx specific bits of sof-of-dev.c into the imx driver
> itself, which can then call into the common code. Doing this
> would need more testing and can be done if we add another
> driver like the first one.
> 
> Fixes: f4df4e4042b0 ("ASoC: SOF: imx8: Fix COMPILE_TEST error")
> Fixes: 202acc565a1f ("ASoC: SOF: imx: Add i.MX8 HW support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>

Indeed we will need to somehow avoid getting sof_imx8_ops from 
sof-of-dev.c by directly referencing it. 

Will keep this in mind for the next platform.

Thanks a lot Arnd!

> ---
>  sound/soc/sof/imx/Kconfig  | 2 +-
>  sound/soc/sof/imx/Makefile | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
> index 5acae75f5750..a3891654a1fc 100644
> --- a/sound/soc/sof/imx/Kconfig
> +++ b/sound/soc/sof/imx/Kconfig
> @@ -12,7 +12,7 @@ config SND_SOC_SOF_IMX_TOPLEVEL
>  if SND_SOC_SOF_IMX_TOPLEVEL
>  
>  config SND_SOC_SOF_IMX8
> -	tristate "SOF support for i.MX8"
> +	bool "SOF support for i.MX8"
>  	depends on IMX_SCU
>  	depends on IMX_DSP
>  	help
> diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
> index 6ef908e8c807..9e8f35df0ff2 100644
> --- a/sound/soc/sof/imx/Makefile
> +++ b/sound/soc/sof/imx/Makefile
> @@ -1,4 +1,6 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>  snd-sof-imx8-objs := imx8.o
>  
> -obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
> +ifdef CONFIG_SND_SOC_SOF_IMX8
> +obj-$(CONFIG_SND_SOC_SOF_OF) += snd-sof-imx8.o
> +endif
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
