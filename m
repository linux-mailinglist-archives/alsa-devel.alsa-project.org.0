Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AB4A9C54
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 09:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 129681677;
	Thu,  5 Sep 2019 09:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 129681677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567670066;
	bh=LZ1pZhDJ29PxRFmbERHXsZa4UYJ8UWFvAlmHsdIp+gk=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FEUd2LNq4sSBbZWpPWsjhF0Dg6C/U6BDEeW0eFjb+26XVMF1INzQYxkb6/9Upqben
	 K8MDOUT45RwUU4RHCIE0n0KE0ar2PdZW5KBdeb9ZYMkJLQfbBO3cUZLVW3htY2X8hf
	 ZTAW8XqXaNfBYFcIz0hrq2Kb5lXCoyyGmvvUOimk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 481DDF8049B;
	Thu,  5 Sep 2019 09:52:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1F05F80448; Thu,  5 Sep 2019 09:52:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20084.outbound.protection.outlook.com [40.107.2.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B68CF80227
 for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2019 09:52:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B68CF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="cwZL6L8f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfAj7lGITKEsoy9pfh+XuBAyj8pPDO5kF96Qo0c+D7wjbeKvgKUJQa048lNesS3TsiUt6ood4uPifV6ojxbBEShPdn0Upo16j6/gAPgtMQ/fk7Qs4yQHISftm9+09ytFR+ZYdmVuQ5rP4Do7F/jQoIukvE6hx2hU65kYD0DpJB4lLIyUxvoRdo2H1fhcI7UfT+JJLOUxpWC5BYYUxrQ84zW3380QHZ6LS86+UNnuCnD81v+l4FgJ/Ndzm5uOecXqRFmO1YBQMP4Ru3zIqWdB2FlCeRhh4ZSNL8D/PrxNfvGIdBJ8a3oaXcbtAevj3Rmo4D3+AdO/OLvGKslxwolWUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQLqvk79EUKMr9LYXVcDfX8PLWyOxSgwN5hGT/140MM=;
 b=exmVlUFcG2RbZe7M6/ORCBxgV/9KuZVTfpYfLV1bjQdiLHPn/C3V4AN6qMfJle8mGMMDBULSobo/h+ZxbMDt33KD72DPFFksODSBlMsh7Ze4uXD8KtA8pCFEr3xtu03IuLX4w5e2X6gcNvsup6p2kO8hsmWNbuiQhosvgC+46VHsVQ//gDgMVe8WAPdOF+0xa7vUapYZE7N21jgzLz0utvNfoEE2HlA8TYjjXoMw+egeO58U44Ao8hoaT8bJPDw44AL1ZBwgKcXkY+SGxi3VpdRkhbaA9uxDNOO5BS8X+N5bH6gFUhJwvqqxMSfdpVaJVi7YqJWu4MP+my506bLNNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQLqvk79EUKMr9LYXVcDfX8PLWyOxSgwN5hGT/140MM=;
 b=cwZL6L8f4PD6zxQ4vNkisy+5qzfz4rxNUP7SgiKwH2HMWOl0DLaGUM8HS6O3vkfg4UBgz4A9YrdjesfZP1o/hvkf9yoc/E0boHFr5Sx64kSdBLJqf2wvtnx++bGfQV24e31Ge+v4ZLWx5gqz9Wj5BOGy16fIybMcCz/7j8HRFFA=
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com (52.133.13.160) by
 VI1PR04MB3165.eurprd04.prod.outlook.com (10.170.229.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 5 Sep 2019 07:52:31 +0000
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::6ced:919:ea4f:5000]) by VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::6ced:919:ea4f:5000%6]) with mapi id 15.20.2241.014; Thu, 5 Sep 2019
 07:52:31 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: dl-linux-imx <linux-imx@nxp.com>, "yuehaibing@huawei.com"
 <yuehaibing@huawei.com>, "festevam@gmail.com" <festevam@gmail.com>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "perex@perex.cz" <perex@perex.cz>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>
Thread-Topic: [PATCH -next] ASoC: SOF: imx8: Fix COMPILE_TEST error
Thread-Index: AQHVY7VbB4D3lAJHKUqwCvNT4h8v+Kcctk8A
Date: Thu, 5 Sep 2019 07:52:29 +0000
Message-ID: <4264c89ddbcff9d67498bc9d89ec4f1826819f46.camel@nxp.com>
References: <20190905064400.24800-1-yuehaibing@huawei.com>
In-Reply-To: <20190905064400.24800-1-yuehaibing@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f65588a-407c-4bb1-12d5-08d731d60166
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB3165; 
x-ms-traffictypediagnostic: VI1PR04MB3165:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB316549629C5742A69A189254F9BB0@VI1PR04MB3165.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(199004)(189003)(478600001)(229853002)(66066001)(86362001)(3846002)(14454004)(2201001)(2906002)(6116002)(6506007)(4326008)(6246003)(6486002)(118296001)(36756003)(25786009)(446003)(6436002)(11346002)(2616005)(186003)(53936002)(66446008)(64756008)(66556008)(66476007)(44832011)(6512007)(76116006)(91956017)(476003)(66946007)(2501003)(71190400001)(71200400001)(486006)(7416002)(102836004)(5660300002)(256004)(14444005)(26005)(81156014)(8676002)(305945005)(81166006)(316002)(99286004)(110136005)(7736002)(54906003)(76176011)(8936002)(50226002)(99106002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB3165;
 H:VI1PR04MB4094.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: H0oCHBkrKTpxB8lE6dJb/VAOqsb2qjfXSggCiA70HXAtuIb+lTg7D9AHau0gxV2t1FsuYArp5m9+ARXgsKWHVQKXZJxWqusaT7E1en/gewCiaFsTClQewHVneeFjVa9yFbbFo6ycqJ2wfFqJfA/Aps9gPPTzxneWq9QZD85bbyUa8s+Nd9X4DPhQzV2U7NpBJZ0BL8+TwRFJPo+Mg0uAkVzfIYVIX/OquNbYAVqdk/Umf64e6gt6+AADowx+7l7D3Ukq6bzgotLIRqxYDCXkJyGXujpgNuiX8baO1nHdBEC3SgObV653oqXSWYrO9zdPpMGHaj64UgCOaLrjMx1wzQr2Ju7TKIghLhSgAspAm299mbpFoE6nB9Z0YXUFpv0sA+psipprmB/EZEfPMR93eF3R5FVsJfvS39Fz7hgp4xg=
Content-ID: <62718A8F03EE39469AC1D348B4132E3C@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f65588a-407c-4bb1-12d5-08d731d60166
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 07:52:29.7612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t35Mye64P8YOO4B/5KYt85v5cg7ngXUkv51z5CA4NT84if2ZOWCZ99ujE/VY/TiFP5kLQtmmaBr0kkQN9Nx37A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3165
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH -next] ASoC: SOF: imx8: Fix COMPILE_TEST
	error
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

On Thu, 2019-09-05 at 14:44 +0800, YueHaibing wrote:
> When do compile test, if SND_SOC_SOF_OF is not set, we get:
> 
> sound/soc/sof/imx/imx8.o: In function `imx8_dsp_handle_request':
> imx8.c:(.text+0xb0): undefined reference to `snd_sof_ipc_msgs_rx'
> sound/soc/sof/imx/imx8.o: In function `imx8_ipc_msg_data':
> imx8.c:(.text+0xf4): undefined reference to `sof_mailbox_read'
> sound/soc/sof/imx/imx8.o: In function `imx8_dsp_handle_reply':
> imx8.c:(.text+0x160): undefined reference to `sof_mailbox_read'
> 
> Make SND_SOC_SOF_IMX_TOPLEVEL always depends on SND_SOC_SOF_OF
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 202acc565a1f ("ASoC: SOF: imx: Add i.MX8 HW support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  sound/soc/sof/imx/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
> index fd73d84..5acae75 100644
> --- a/sound/soc/sof/imx/Kconfig
> +++ b/sound/soc/sof/imx/Kconfig
> @@ -2,7 +2,8 @@
>  
>  config SND_SOC_SOF_IMX_TOPLEVEL
>  	bool "SOF support for NXP i.MX audio DSPs"
> -	depends on ARM64 && SND_SOC_SOF_OF || COMPILE_TEST
> +	depends on ARM64|| COMPILE_TEST
> +	depends on SND_SOC_SOF_OF
>  	help
>            This adds support for Sound Open Firmware for NXP i.MX
> platforms.
>            Say Y if you have such a device.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
