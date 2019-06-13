Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8666643484
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 11:13:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F2A217DF;
	Thu, 13 Jun 2019 11:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F2A217DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560417206;
	bh=8/qlxKM5HAP786le5KwfdidRAOkIfjWPD4A5Q5YLR5Q=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jOkbPpNLO2zMRM3xiH87/WIXSWaM3yjcFn1YbTjS/botxtHQFkI5l7ScfDmNeSiR3
	 Msw02bucfvBAhpk0cVld1+7sOn6NYeRTFTicG6hcpk/3PgeCqq1Pb0Imo+IxOxipgC
	 ejUZH8HGcV5g6raJJvir/M4QYgFU3GcU2vyZiRVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEAE5F8972F;
	Thu, 13 Jun 2019 11:11:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 326FAF89703; Thu, 13 Jun 2019 11:05:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on070c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::70c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25A2CF8076F
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 11:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25A2CF8076F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="cExGUxpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfoLJ2uyi9gIFrIr9NFk5yTVsbbJ4EiE2IM2iDHLCjE=;
 b=cExGUxpVqAW2zkgRMRR5wQmmWL5iFJkDvQVVxwJKke7k1g+L6Xy7n9wFD3n00VVg5bL3Gzc1nTpTEfTyS/BFIy5iSTHfF4Y4axQiCQu3dCsV74N+1476SBsQR8a1eJkys4+65N4o0drif33Puih2XNWp05mNRMjSfU4rvrVIQzg=
Received: from VI1PR05MB6477.eurprd05.prod.outlook.com (20.179.26.150) by
 VI1PR05MB5599.eurprd05.prod.outlook.com (20.177.203.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 09:05:48 +0000
Received: from VI1PR05MB6477.eurprd05.prod.outlook.com
 ([fe80::8437:8389:cec3:452c]) by VI1PR05MB6477.eurprd05.prod.outlook.com
 ([fe80::8437:8389:cec3:452c%6]) with mapi id 15.20.1965.017; Thu, 13 Jun 2019
 09:05:48 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "festevam@gmail.com" <festevam@gmail.com>, Oleksandr Suvorov
 <oleksandr.suvorov@toradex.com>
Thread-Topic: [PATCH v1 3/6] ASoC: sgtl5000: Fix of unmute outputs on probe
Thread-Index: AQHVD9h3/DmKQS3aZk+Tx9Nq7fePFaaZbq+A
Date: Thu, 13 Jun 2019 09:05:48 +0000
Message-ID: <fc1b98afcd1d243e035fddd9916241633b343404.camel@toradex.com>
References: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
 <20190521103619.4707-4-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190521103619.4707-4-oleksandr.suvorov@toradex.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marcel.ziswiler@toradex.com; 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3eb22d0-de41-4705-2b9d-08d6efde53cc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR05MB5599; 
x-ms-traffictypediagnostic: VI1PR05MB5599:
x-microsoft-antispam-prvs: <VI1PR05MB55993A5B8AC7DA35329916A9FBEF0@VI1PR05MB5599.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(39850400004)(366004)(346002)(136003)(189003)(199004)(305945005)(186003)(118296001)(6636002)(11346002)(229853002)(26005)(6486002)(316002)(71190400001)(7736002)(71200400001)(54906003)(86362001)(478600001)(110136005)(14454004)(3846002)(6246003)(81156014)(99286004)(36756003)(76176011)(8676002)(6506007)(53936002)(476003)(6512007)(256004)(5660300002)(25786009)(81166006)(14444005)(6436002)(8936002)(66446008)(66066001)(4326008)(2501003)(66556008)(66476007)(64756008)(68736007)(66946007)(76116006)(44832011)(2616005)(2906002)(6116002)(486006)(446003)(102836004)(73956011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB5599;
 H:VI1PR05MB6477.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uQqAds9iyovgrsMxLgTlXs73Zr2OoIgLEQyB2tF+VQtfESpzOLZQrcoUXi8Q3ZAHvKtBOBeKj7RIgzRaprqm2KjH9WBSOneqX4R3NEq3flzjCxHDg77TOA1ip0oBH2svkpYTbCqbrwzKnSPLUqDC5uiZl7dbH7vlv+V5McAl/AvPVyXI8dk0dv7nDjrnHBjhZXewBGR+b24Q2bTOe3QWpypZ16u5w7v5HFKb1Yo0rVN218hIbY7Vq95NvAWMoIucwO9d4ibNZMy7LAltgCYp3tgNDPSaNu9xVGwzYQG1p1akJSNbQP4idc6AhxAMwvZ0lIPeFMtSX9mulFvoyN1qOM5EJyTUDIh4Anm+B6ov9vOR5020L0lbQvKPtg7Q9Jc8fkj/UXuFSqiKxZPJo6rc0QRemuPWsx716ljHGCY6o44=
Content-ID: <FBAE2C25A90D254DAE2D3621CFBE7757@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3eb22d0-de41-4705-2b9d-08d6efde53cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 09:05:48.5562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: marcel.ziswiler@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5599
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v1 3/6] ASoC: sgtl5000: Fix of unmute
	outputs on probe
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

On Tue, 2019-05-21 at 13:36 +0300, Oleksandr Suvorov wrote:
> To enable "zero cross detect" for ADC/HP, change
> HP_ZCD_EN/ADC_ZCD_EN bits only instead of writing the whole
> CHIP_ANA_CTRL register.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

> ---
> 
>  sound/soc/codecs/sgtl5000.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git sound/soc/codecs/sgtl5000.c sound/soc/codecs/sgtl5000.c
> index bb58c997c691..e813a37910af 100644
> --- sound/soc/codecs/sgtl5000.c
> +++ sound/soc/codecs/sgtl5000.c
> @@ -1289,6 +1289,7 @@ static int sgtl5000_probe(struct
> snd_soc_component *component)
>  	int ret;
>  	u16 reg;
>  	struct sgtl5000_priv *sgtl5000 =
> snd_soc_component_get_drvdata(component);
> +	unsigned int zcd_mask = SGTL5000_HP_ZCD_EN |
> SGTL5000_ADC_ZCD_EN;
>  
>  	/* power up sgtl5000 */
>  	ret = sgtl5000_set_power_regs(component);
> @@ -1316,9 +1317,8 @@ static int sgtl5000_probe(struct
> snd_soc_component *component)
>  	       0x1f);
>  	snd_soc_component_write(component, SGTL5000_CHIP_PAD_STRENGTH,
> reg);
>  
> -	snd_soc_component_write(component, SGTL5000_CHIP_ANA_CTRL,
> -			SGTL5000_HP_ZCD_EN |
> -			SGTL5000_ADC_ZCD_EN);
> +	snd_soc_component_update_bits(component,
> SGTL5000_CHIP_ANA_CTRL,
> +		zcd_mask, zcd_mask);
>  
>  	snd_soc_component_update_bits(component,
> SGTL5000_CHIP_MIC_CTRL,
>  			SGTL5000_BIAS_R_MASK,
> -- 
> 2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
