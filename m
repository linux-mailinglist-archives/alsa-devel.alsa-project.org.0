Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 767029D065
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 15:25:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF5AF1681;
	Mon, 26 Aug 2019 15:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF5AF1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566825902;
	bh=hHOCphb+oh4bBo+QRXIseLiwmEBD741aTPCs2jC80X4=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HyJAufVEDy86d5wQV3UGyyhGCZUMn/2n5P9FE/aPZ6s7meCCSItmtwDx9eebsmjF1
	 phdoksffcjJDuuamwJvF2Fl0CSUUqtx6eRjV4MiBnMccw6XcC1bWGMbiBP7qMaKRSW
	 LVu16gceb+4Q0mFgralQxx8CsyTdHJZpg7cRVHVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B99EEF80362;
	Mon, 26 Aug 2019 15:23:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D92DDF80362; Mon, 26 Aug 2019 15:23:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80079.outbound.protection.outlook.com [40.107.8.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4E7FF801ED
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 15:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4E7FF801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="IOi2E6lC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6EoZ1ogx2AHuHdRwa/Y9pXhyIM25jjuoI38AR2rjyoR1SPt1h9v82o99yePqpTJ5OCak6sWA0Cs8dGNDB7RTosf0kvELHF0CE+NTzUriXRnv+x/ofegihezmaRsUz28GpsA8JlR8CC1elYYoXcmfxa3J/PdsDs3ihMeOrr/R0TMinywNAZTGWC+wF/CjkTN1EisEmeFaH0NQjN+dwcXlbTiRbyILNfsdnXumvkk6tLBkZQjUiW+6dmFsS31rGzC1V+wsXyyCs5aZ/BVTt5tZMoMUlTuXmeqEG3sX9eVSLUULfm5bY7k7e3Q0CvO7fz8y9t6PCMZ+l+PyoAgzvTWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KnCWMhXm9BiS+56dLkTE6qe3XJa97j6yAQM+7feA7Q=;
 b=YKbiL+Hj8Q1XgR1xt6l8/g3h+iMWKhPjxjBN3q0h56c6HG5HdvfbyQAO2K5QCCoICbsFTi5lb/6HmuwJOUcB5RtJkrN9kiXpjqmjFGYpywrIYTgdz6K6H6pkX+/ECi2IZWUA/3+OnFgDu9VIxmRfK8B0OCl8y63oV5q4dSfAWbQ7AP8i/6LSyi8743lUjyS+fv3o6gjNMzsKUhtUDMXjvYMk60WJAH5o1qBQFQimKoLlV8JiBFHeNPQhCJU8QgKBhorlQhg0Yo8CR2P8HIWTDzjg15kiH/ZC0JZk5Sj2SgAv4C+i5XnjauszO24q9mLlqzMkW5wEQQ7tbvIO0+FjXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KnCWMhXm9BiS+56dLkTE6qe3XJa97j6yAQM+7feA7Q=;
 b=IOi2E6lCz5m4VpMk1OcVrEojpvIVs/rOsTl4geJ7+M3WOU1nFUzED0A4KKMWeprTJVD0xLE45q+ZHV+EAouZRmiAMb7sdVNc+EQAp+lI6aYfNrVzmWGAAP+WEt9rDcmnqKEUZUvAH/FeB3QEryMbtVDyv7DJ9Euofsoq0v2oIK8=
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com (52.133.13.160) by
 VI1PR04MB4336.eurprd04.prod.outlook.com (52.134.122.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Mon, 26 Aug 2019 13:23:08 +0000
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c]) by VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 13:23:08 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "dan.carpenter@oracle.com"
 <dan.carpenter@oracle.com>
Thread-Topic: [PATCH] ASoC: SOF: imx8: Fix an is IS_ERR() vs NULL check
Thread-Index: AQHVXBDgCtPrhV88m0i/O5piEeMtz6cNaqmA
Date: Mon, 26 Aug 2019 13:23:07 +0000
Message-ID: <17ba2fb20a06d3e167005db6a225ef68f6b78777.camel@nxp.com>
References: <20190826131855.GA6840@mwanda>
In-Reply-To: <20190826131855.GA6840@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 719f797b-aa77-4f13-98e6-08d72a2888fc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR04MB4336; 
x-ms-traffictypediagnostic: VI1PR04MB4336:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB43365BF2DC5452DC7E595A72F9A10@VI1PR04MB4336.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:262;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(199004)(189003)(14454004)(36756003)(54906003)(71200400001)(81166006)(71190400001)(50226002)(118296001)(486006)(316002)(7736002)(25786009)(81156014)(11346002)(2616005)(7416002)(229853002)(99286004)(5660300002)(476003)(6246003)(86362001)(2906002)(446003)(44832011)(6512007)(66066001)(305945005)(4326008)(76176011)(478600001)(256004)(186003)(8936002)(91956017)(76116006)(2501003)(6486002)(8676002)(6116002)(66446008)(6436002)(26005)(66946007)(64756008)(66476007)(66556008)(110136005)(3846002)(53936002)(102836004)(4744005)(6506007)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4336;
 H:VI1PR04MB4094.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tdoEPlbcEw3hNoNF/pBwE/Aug8HhSMumxOM4i7XZBzp4sHaqx7NJZbH3aTBBoyT/hVMtKhGzEmCaAcyCdexEnU5EUq70o+uo58/6ZMDkc7PM+BYkAHZS/JzN7MH63BAHJeLn15ACDmSIBFed2AAE1kf5C5bGr5jCQpFxgKew+sKaor8/WJQga1rHwJbD/x0UCUX+4bH3E7qRYVLKTiDOOiyCrxzmfszUf+hmwZ/UgM9BLi4+/mI1aZfAqXivf/7bVEFtE17IJPZuIfdAM6SaA7GsK3KNusloLVZ2ISooH17Ie40W2TMjodcVoqFHoHkzCPIYHe9DsmT3UFlXUaOzVp6Fz53OaZge4G3TUFiM1tlKnTCV2lPo1//UDWRKbq/Dis/KA1pbneXbqoXmvMZYg5cRauia45cL53DWgKC0Z0s=
Content-ID: <5C4EB5DE8D1910478CB520EFEE79939D@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719f797b-aa77-4f13-98e6-08d72a2888fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 13:23:07.9909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iRuc0UGroRKP8kYyLhswQURY8KVdWukx4m37Zrno4nqqXdZycIyostHTQaDVCLrbzoOo7PlYrx2sNgRoc3MjXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4336
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: imx8: Fix an is IS_ERR() vs
	NULL check
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

On Mon, 2019-08-26 at 16:18 +0300, Dan Carpenter wrote:
> The device_link_add() function only returns NULL on error, it doesn't
> return error pointers.
> 
> Fixes: 202acc565a1f ("ASoC: SOF: imx: Add i.MX8 HW support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan! Nice catch.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  sound/soc/sof/imx/imx8.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index e502f584207f..41ad3a310808 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -227,8 +227,8 @@ static int imx8_probe(struct snd_sof_dev *sdev)
>  						DL_FLAG_STATELESS |
>  						DL_FLAG_PM_RUNTIME |
>  						DL_FLAG_RPM_ACTIVE);
> -		if (IS_ERR(priv->link[i])) {
> -			ret = PTR_ERR(priv->link[i]);
> +		if (!priv->link[i]) {
> +			ret = -ENOMEM;
>  			dev_pm_domain_detach(priv->pd_dev[i], false);
>  			goto exit_unroll_pm;
>  		}
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
