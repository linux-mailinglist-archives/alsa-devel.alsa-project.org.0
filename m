Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C2A9DEFA
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 09:46:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C9FD1667;
	Tue, 27 Aug 2019 09:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C9FD1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566891976;
	bh=uFk75hZBUR+CJpQg375SuYDMQ4kwFstbClYrRTlONMs=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=crDIMTGJTaFlwa9lJ5gRAVnR57DdoR/mcGf7CS5wQ5YXZ9OPT/wKu0GyMRprvJp1S
	 lpHcK5Qb9sXcE2YMJmoV8sJ1erpiigeDuM8CKUai/42/8cK+aa/rDt5UIEMztv+nTT
	 /pL9hk+8ykbfIltqizHzZS7Y1AH5ebSSlrRZCN8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0193FF80273;
	Tue, 27 Aug 2019 09:44:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBC3EF80274; Tue, 27 Aug 2019 09:44:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40073.outbound.protection.outlook.com [40.107.4.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CA09F801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 09:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CA09F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="aDa4j5FX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpKALyCItok5SPg1doT9QiiTql2sDTp/U/cp7Lg/rwP/P35Vx2yk+NR9M6xvgcyL5xsjAs+MZmj9VHdXKF2BCQeqYb+0mN4RFpBLm3nDHN17wMcSlpe3PBPI+6h4h/VwHKZ4MdwWb4Y+od967Kwq7fHkPIah8VwqCfdzMo/coRrL++jtwLQgiLW0BejcQEwEsmeTPLwPriKWAWRon90vVavkDtDPTMV/8LQw4sroKVjY8y7bD3a1xV9k8Lv1XGM+evCIOQE93PUECR3/kDMUs05iVvuboag3l2eb47Whj+twByHNuWHLVogut9iECua1Z/tRkDnh7W7MunhFYRiDiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdFFSZtM2sPw2p5vCdHcvsqNJlIfy03d+5Kq4ViMgxo=;
 b=F8w0HLJYgyuwgoZkYDDHCSHPqRScnPa+9VPi3nVPitUBpkwHtSh0et2mnpD2BrpLxZZpLODUJATLSwaheKShwCz4u/r9v2AkqManamptIVNktrAfHQRb7CXaff4+lyGTztC+4HKYga9LqITJrn0QYiqyM+v52NluwUC0mXcE74UYblT5M7/QnCLP5gS+U2frWwVzRyVWG+Pz9TbcIp6KZD+segDNfh0g/hwuOcNXOUXTQTUev5lBljIxAI+xJMRsCp2Q7MaVrs7O+59UvXnulQx7+CJW19R8D+9EoNywAiEHgFBUUSeXOBaevFxXJX60dPfGzc3gbp1VN6ZXo0cigA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdFFSZtM2sPw2p5vCdHcvsqNJlIfy03d+5Kq4ViMgxo=;
 b=aDa4j5FX25yj44ERyT0wtbq1JknRbOhuHI8zwnRmGSgYN+eCheh/sI/OZjNldQKJ0eUSpP6yHImZvtlHpNJFcGhXrMzPPZBx0jxTaZw+AJBd7Np5CKLTiGmhW2j0rDHZ/pIEWQN9+9TgQrQIphgseaD9yyR6htWk6+hlSfQC1bc=
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com (52.133.13.160) by
 VI1PR04MB4349.eurprd04.prod.outlook.com (52.134.122.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 27 Aug 2019 07:44:20 +0000
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c]) by VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c%7]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 07:44:20 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "timur@kernel.org" <timur@kernel.org>, "Xiubo.Lee@gmail.com"
 <Xiubo.Lee@gmail.com>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, Viorel Suman
 <viorel.suman@nxp.com>, "perex@perex.cz" <perex@perex.cz>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Thread-Topic: [PATCH] ASoC: imx-audmix: register the card on a proper dev
Thread-Index: AQHVXItnJrx+gT0oHE+CkZPy//zxeKcOnWCA
Date: Tue, 27 Aug 2019 07:44:20 +0000
Message-ID: <65ef17869dbc0a785e2abe9c27df24fdfb273c16.camel@nxp.com>
References: <1566921315-23402-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1566921315-23402-1-git-send-email-shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0613489f-769b-4d1d-1420-08d72ac25f2b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB4349; 
x-ms-traffictypediagnostic: VI1PR04MB4349:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB43497917CE243D66CC79EDF9F9A00@VI1PR04MB4349.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(199004)(189003)(66476007)(5660300002)(66946007)(64756008)(6506007)(66556008)(76176011)(4326008)(54906003)(7416002)(66446008)(81156014)(76116006)(71190400001)(8676002)(99286004)(6512007)(91956017)(50226002)(14454004)(81166006)(71200400001)(102836004)(6486002)(186003)(26005)(25786009)(6436002)(8936002)(229853002)(486006)(446003)(110136005)(44832011)(305945005)(36756003)(7736002)(6246003)(2906002)(478600001)(2201001)(66066001)(3846002)(53936002)(86362001)(2501003)(316002)(256004)(476003)(2616005)(11346002)(118296001)(6116002)(99106002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4349;
 H:VI1PR04MB4094.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Nh5OoJxoi0Bymo8qndR0NU02ynGHtrTSLCH6TXplOXgA9zQkLYznUgKM5KxxneTJQJklsil5QaIZcAI36tI//DbpcKjfwpr4uokgwG2dIRIBADnN3oWywJjCT6O1mBSZrrNmY7NnaG3fi96Q/EERY6wR+VmQ2vwbywJRqn+3QUT75mpWJHGFhQjGSZO9/CnCUkzdhr5LPYsCo8LvWe38rz8O3ZPPVEJ8SdxLOtELZ7AD+GlnUAoX/33QPQLpKQgo2xa0kLSe0LXTpA13u6ry0nZgLE2/C0WR9WqeiY0QF1WQlk+Xp9F6yG1Rvdu549vGnh8HFXdbNBrRMQ2AZAROP3eupfLMRCzZifhluq0affDkCeBL/IGFjMFbPVCQJzKGd0t9ROWjbOJJGW38Prl6kNuD9aeLYEHO+O/2xc/hBIM=
Content-ID: <72DF92E13A17A0468403E9BD125780DB@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0613489f-769b-4d1d-1420-08d72ac25f2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 07:44:20.2636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7sAT+ls6inUpirlNbjRxOvH6xxJl6hu1abdQbR+3v6scGUchbh5R0+DQ6rZIJHgi+4rnRC+W1tobSlET64ui6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4349
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: imx-audmix: register the card on a
	proper dev
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

On Tue, 2019-08-27 at 11:55 -0400, Shengjiu Wang wrote:
> This platform device is registered from "fsl_audmix", which is
> its parent device. If use pdev->dev.parent for the priv->card.dev,
> the value set by dev_set_drvdata in parent device will be covered
> by the value in child device.
> 
> Fixes: b86ef5367761 ("ASoC: fsl: Add Audio Mixer machine driver")
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Thanks Shengjiu for the fix!

> ---
>  sound/soc/fsl/imx-audmix.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
> index 9e1cb18859ce..71590ca6394b 100644
> --- a/sound/soc/fsl/imx-audmix.c
> +++ b/sound/soc/fsl/imx-audmix.c
> @@ -325,14 +325,14 @@ static int imx_audmix_probe(struct
> platform_device *pdev)
>  	priv->card.num_configs = priv->num_dai_conf;
>  	priv->card.dapm_routes = priv->dapm_routes;
>  	priv->card.num_dapm_routes = priv->num_dapm_routes;
> -	priv->card.dev = pdev->dev.parent;
> +	priv->card.dev = &pdev->dev;
>  	priv->card.owner = THIS_MODULE;
>  	priv->card.name = "imx-audmix";
>  
>  	platform_set_drvdata(pdev, &priv->card);
>  	snd_soc_card_set_drvdata(&priv->card, priv);
>  
> -	ret = devm_snd_soc_register_card(pdev->dev.parent, &priv-
> >card);
> +	ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
>  	if (ret) {
>  		dev_err(&pdev->dev, "snd_soc_register_card failed\n");
>  		return ret;
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
