Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C415843488
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 11:14:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5211C17E5;
	Thu, 13 Jun 2019 11:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5211C17E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560417252;
	bh=Wox1FWVYN0znWf6Ggh1NBh4nTvKNxW0Ad6cUlg47fjA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUABtR5vbziaHmoBhC/TvUQo+tEVSDtugoo1T9t16eb5esMizdo3tn9t9AmPgmISf
	 /m+1JoyTevypP/hLruqj7JrJIJjn298JLC8UJ0Ij7StFMeqatyBspIezjW6gogTrmS
	 ddmdF1g3nUx0s5DwLSXeWVZRTeMjkWCsy9gU7Gr8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A190F89733;
	Thu, 13 Jun 2019 11:11:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4BF6F89703; Thu, 13 Jun 2019 11:06:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00097.outbound.protection.outlook.com [40.107.0.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F4E1F8076F
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 11:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F4E1F8076F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="nbK0c+BQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5Oo7YHv3N4WeTHDMLA2HPwPovcO6ORtzEu2yX6fwgk=;
 b=nbK0c+BQms9WKYF/SXq1TlXmtU3h6ZBQL3foOY6BuuqPZPNU01h53J/QheD2foBVV1nnEozOjKU2hXF/2V8itCb4lt1yHXpcILwpFps1efVzrVoaYDXh0NuPXCp0oQ5Bqipys6LeaxP1RandG5kxJqq5dt9DZcmgxDmf64iZzxM=
Received: from VI1PR05MB6477.eurprd05.prod.outlook.com (20.179.26.150) by
 VI1PR05MB5599.eurprd05.prod.outlook.com (20.177.203.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 09:06:07 +0000
Received: from VI1PR05MB6477.eurprd05.prod.outlook.com
 ([fe80::8437:8389:cec3:452c]) by VI1PR05MB6477.eurprd05.prod.outlook.com
 ([fe80::8437:8389:cec3:452c%6]) with mapi id 15.20.1965.017; Thu, 13 Jun 2019
 09:06:07 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "festevam@gmail.com" <festevam@gmail.com>, Oleksandr Suvorov
 <oleksandr.suvorov@toradex.com>
Thread-Topic: [PATCH v1 4/6] ASoC: sgtl5000: Fix charge pump source assignment
Thread-Index: AQHVD9h2j33UZ9XhhkqUix6wZGjeSaaZbsYA
Date: Thu, 13 Jun 2019 09:06:07 +0000
Message-ID: <15af220ffe1bcd36bd0cf178ed9f8d09a332d447.camel@toradex.com>
References: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
 <20190521103619.4707-5-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190521103619.4707-5-oleksandr.suvorov@toradex.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marcel.ziswiler@toradex.com; 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d75888b-8ef6-4d6c-fb1d-08d6efde5ec9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR05MB5599; 
x-ms-traffictypediagnostic: VI1PR05MB5599:
x-microsoft-antispam-prvs: <VI1PR05MB5599A77581D1F52CAE7BA2C5FBEF0@VI1PR05MB5599.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(39850400004)(366004)(346002)(136003)(189003)(199004)(305945005)(186003)(118296001)(6636002)(11346002)(229853002)(26005)(6486002)(316002)(71190400001)(7736002)(71200400001)(54906003)(86362001)(478600001)(110136005)(14454004)(3846002)(6246003)(81156014)(99286004)(36756003)(76176011)(8676002)(6506007)(53936002)(476003)(6512007)(256004)(5660300002)(25786009)(81166006)(6436002)(8936002)(66446008)(66066001)(4326008)(2501003)(66556008)(66476007)(64756008)(68736007)(66946007)(76116006)(44832011)(2616005)(2906002)(6116002)(486006)(446003)(102836004)(73956011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB5599;
 H:VI1PR05MB6477.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bJjiAbU6LZXTXRQEDsMAPBUyZldT2reqp0wKB3olZPvROsG1HAzHebmeKUqU7a2VE/mGgOCrxWU/mfexNkWzg8tx1XnT1hRKohh7cF7eBK7ypEAhbl7iw693GgUv95xtpBO5fWQq9zOio/pJlkesYC4jJQbgQNWFkRK8WxR/SmoqJEWF4EiMAIkkdBlCCewz4AgLbqctDkadp2oZHdozjncXk7HWHfMb8fDheTN9rqR+rwX6tqe4ZE/kFPtXkoVg30PmPs5RlT+1wwYkIk+QkuMt3hDeWQ9I8s9F8ZilcpOHuG6g8IwNHIUdmsF29vyyzuv6OfkoTx2RacnaUBdz/GJhypEWtRNF+jGHy7GaoE/QPKS7I0K/iqgdxS4T4axMnYBrgo26MdKS6MI+0VS1X+dViQ/fxu/ZixIq8gSW9CQ=
Content-ID: <DE33956761B04E468ED912869CCE356D@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d75888b-8ef6-4d6c-fb1d-08d6efde5ec9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 09:06:07.0657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: marcel.ziswiler@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5599
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v1 4/6] ASoC: sgtl5000: Fix charge pump
	source assignment
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
> If VDDA != VDDIO and any of them is greater than 3.1V, charge pump
> source can be assigned automatically.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

> ---
> 
>  sound/soc/codecs/sgtl5000.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git sound/soc/codecs/sgtl5000.c sound/soc/codecs/sgtl5000.c
> index e813a37910af..ee1e4bf61322 100644
> --- sound/soc/codecs/sgtl5000.c
> +++ sound/soc/codecs/sgtl5000.c
> @@ -1174,12 +1174,16 @@ static int sgtl5000_set_power_regs(struct
> snd_soc_component *component)
>  					SGTL5000_INT_OSC_EN);
>  		/* Enable VDDC charge pump */
>  		ana_pwr |= SGTL5000_VDDC_CHRGPMP_POWERUP;
> -	} else if (vddio >= 3100 && vdda >= 3100) {
> +	} else {
>  		ana_pwr &= ~SGTL5000_VDDC_CHRGPMP_POWERUP;
> -		/* VDDC use VDDIO rail */
> -		lreg_ctrl |= SGTL5000_VDDC_ASSN_OVRD;
> -		lreg_ctrl |= SGTL5000_VDDC_MAN_ASSN_VDDIO <<
> -			    SGTL5000_VDDC_MAN_ASSN_SHIFT;
> +		/* if vddio == vdda the source of charge pump should be
> +		 * assigned manually to VDDIO
> +		 */
> +		if (vddio == vdda) {
> +			lreg_ctrl |= SGTL5000_VDDC_ASSN_OVRD;
> +			lreg_ctrl |= SGTL5000_VDDC_MAN_ASSN_VDDIO <<
> +				    SGTL5000_VDDC_MAN_ASSN_SHIFT;
> +		}
>  	}
>  
>  	snd_soc_component_write(component, SGTL5000_CHIP_LINREG_CTRL,
> lreg_ctrl);
> -- 
> 2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
