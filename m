Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A50FC9CEE9
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 14:03:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41F7F167B;
	Mon, 26 Aug 2019 14:02:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41F7F167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566820983;
	bh=66khSkxs+0gPvLSrdIkaDRf/FHvkUIDl6qeWP7eSCto=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mtd09MvbbHuu+jJwmlGqNuLKT4TSP3hsUvN1HXgeyqWQGy4+aTwCeA5ACSxecTe3G
	 OQ3mhwTyeb+2Zs1ya9tRkWtmFaTM63wAvkTmwIUVMjQ8rM3rTffU8BdebaKGW5GtjI
	 blrB+J2DiZyaK+cJ7uInD+2CxNQNMvB35c/Ru3WU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9420FF80377;
	Mon, 26 Aug 2019 14:01:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E61EEF80362; Mon, 26 Aug 2019 14:01:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::60c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9879F8014A
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 14:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9879F8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="LH4QNGEJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFzNiuSdnIkx9PEHqgug7GImtS+HIXVfrIPv8vUzgsdNnQU/c/nTwLzoLjTap7Rx0RWMmob7NSy03ZoqiKsI5iETd1CVyVwqijw4egf4w6vuRjD1neOoj7SC3VTpEJlBZ55J2BkXjcIVD88Zsi+O2oBoY4qulSNC0Nk1p9cwu2SxW5p9D6o0Ad6IU5LJt3jWxHcYyNoLjxX1gaAu7ESW5fENPyitIGqiMS5XdgaV5/XGcL0d9EuO/xiu4Py2vI/65Gpi1hvP6UnLVzA8YjLU7+UNXZwCLnCiVtOBlI9PJyoiIyc+kKuDjgAj6tfGYKO9vnFxTJ8OSvDmUwPfNbun/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPfL3lP7yr3agx+nXHsw3gbCJ5hPnRqSEzsdLBXxwB0=;
 b=HY5NgBOoO4qBC3Z3SRxAuXRjLpgzTI2u0bUqXs/upXe3FA/G0CfxoYdKDzaNVkqEsUNi+O3RBrKVUttCGY3vPNUUw9FBr0Y9IXbLmc/kSNtyx+mVuEcEWlSrJYHlsUZ68SXD8AuQArp4Y3oeaFW3368GnBLg4RYep2Iwgi/sBq2W/0qJUI2GTfjJf/FCg+kNyoloeMCXf53L+RS3NftHgAnQn8KjqPxV+jLZvH+nTTKpmg106h4mn5xq65T7Mltuqz2mWkZyaKhptB1N1Sm77yktEI2YqXuOGaMMzyLNpfNYY8DT38qdXIG3fcWqpH9/C/sLmp0Op9pHAGBJNxCWJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPfL3lP7yr3agx+nXHsw3gbCJ5hPnRqSEzsdLBXxwB0=;
 b=LH4QNGEJXWTeC4XhDkeSicuSYHgv3RGl3YHSPIQbKDwbGgj+i2ZVUlROkw9t2hw6yO07D7heYaVQWc9aIRt5SjlAilx/SJhrquxLf4FrQV3+9a5phlj9WE/PKG1mBshESL3utWvSRvG88TdzXbNrBYUHel2EjjGpeIkwv1sWjwU=
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com (52.133.13.160) by
 VI1PR04MB5152.eurprd04.prod.outlook.com (20.177.50.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 26 Aug 2019 12:01:08 +0000
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c]) by VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 12:01:07 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "perex@perex.cz" <perex@perex.cz>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>
Thread-Topic: [PATCH -next] ASoC: SOF: imx8: Fix return value check in
 imx8_probe()
Thread-Index: AQHVXAVURdTE2TLQcUqNKaWgZ7E+X6cNU9eA
Date: Mon, 26 Aug 2019 12:01:07 +0000
Message-ID: <01883a69834142f14cd3ac6c9cb97343ee432d67.camel@nxp.com>
References: <20190826120003.183279-1-weiyongjun1@huawei.com>
In-Reply-To: <20190826120003.183279-1-weiyongjun1@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cd02f12-887c-4194-f962-08d72a1d1450
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB5152; 
x-ms-traffictypediagnostic: VI1PR04MB5152:
x-microsoft-antispam-prvs: <VI1PR04MB5152316D20A6B44864EA11C7F9A10@VI1PR04MB5152.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(199004)(189003)(256004)(44832011)(25786009)(86362001)(2201001)(71200400001)(71190400001)(2906002)(229853002)(6486002)(6512007)(2501003)(446003)(102836004)(6506007)(186003)(3846002)(486006)(7416002)(76176011)(36756003)(476003)(4326008)(316002)(478600001)(14454004)(99286004)(54906003)(110136005)(6116002)(6436002)(11346002)(26005)(8936002)(50226002)(2616005)(305945005)(118296001)(7736002)(81166006)(66946007)(91956017)(76116006)(64756008)(66476007)(66446008)(8676002)(81156014)(66556008)(53936002)(5660300002)(66066001)(6246003)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5152;
 H:VI1PR04MB4094.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wf+je2M7NTeT8R3AnnHAJ/F1EOFawqW97pNKsSDI5tPD/AtPRk4HENAB3sUXWxXw5XyfCvmVTjW5M/p54LzkKi6o3PzuMWYLpgiXKIsz74SefIicUmfSdimIyiiRC/GgFZHzQgtRdcMkdudH8JDjcEtbAnO4bKNx2b+cd6xRyGB7LsAsZGFURH3gP3SzemM6fHcDrq3TKTjSp7C860UCteTiLKxyHhmBmpQUywxUif9Gy8QJspHU7jZKHcEtOItTnvDH3Vfnjv3AT9dI26s68Zc7Ybr1FFR49T4yUWurCUnb4ll6QHymEa96PYMhS0c5MMzGHRlwEp7210hRig/VTwXcffQq2sCs3NkM7pICRgLD+g3TdtuDJJbKOBeiXJLISSyiUuBMXXWdcRfErnot2L2bxzVtl3u8dbedAJrfCYg=
x-ms-exchange-transport-forked: True
Content-ID: <D2F4893BB6C8E845AC840622770CE331@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd02f12-887c-4194-f962-08d72a1d1450
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 12:01:07.7474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N1yZ+MXDkqhOtrH3M+KccXE2k6YCOw/zj2sP0zsO8L65C05/t7Rf1SDEwzyFsAce2bVgJMMsoHcV06J2k08JGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5152
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH -next] ASoC: SOF: imx8: Fix return value
 check in imx8_probe()
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

On Mon, 2019-08-26 at 12:00 +0000, Wei Yongjun wrote:
> In case of error, the function devm_ioremap_wc() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: 202acc565a1f ("ASoC: SOF: imx: Add i.MX8 HW support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Good catch. Thanks!

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  sound/soc/sof/imx/imx8.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index e502f584207f..263d4df35fe8 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -296,10 +296,10 @@ static int imx8_probe(struct snd_sof_dev *sdev)
>  	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev,
> res.start,
>  							  res.end -
> res.start +
>  							  1);
> -	if (IS_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM])) {
> +	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
>  		dev_err(sdev->dev, "failed to ioremap mem 0x%x size
> 0x%x\n",
>  			base, size);
> -		ret = PTR_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM]);
> +		ret = -ENOMEM;
>  		goto exit_pdev_unregister;
>  	}
>  	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
> 
> 
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
