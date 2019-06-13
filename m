Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB15343482
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 11:12:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16DE017E3;
	Thu, 13 Jun 2019 11:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16DE017E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560417164;
	bh=1GsTur7QumPEj9xQvRqE4Um0W8ImZXyMa27g/zqJnpw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oQXqZV/9erOyKfWDd5ib5Nc3E9AWJTXhUeUlrQRGgmrsT82hre183YaH0J0LIkA1A
	 zAXCNJ/L975IcZSDJDf/rj2oQkPTeAATDLCOp+M1O9JCNtf56gzS7P52TDNHBod3VZ
	 pE+53W2c1cuMOa8Cyom08Az4NmEcdNGZW5k/ofQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 852DFF89711;
	Thu, 13 Jun 2019 11:10:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 793E6F8970F; Thu, 13 Jun 2019 11:05:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50133.outbound.protection.outlook.com [40.107.5.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59833F80794
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 11:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59833F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="nOkSRkUN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9Gh5ZuJt8AW5fUQtfhsxRWWsVWEyQj2kz4GoqpxY2k=;
 b=nOkSRkUN+vq9I5aNNrv2ENdBu4Znss7rAzyRIn7WVP+dv1TkxpgljUY2EhoWvRRmJEMWr22xb7jg2VhcExFtEDgSx3f7d0aXli7Zl2luYPvDY73kMQ/BtU6FItg+NV4d0zKge7j4vIMrHsZZt+Dz9Krj+9gacusMxOXNVlz/lT4=
Received: from VI1PR05MB6477.eurprd05.prod.outlook.com (20.179.26.150) by
 VI1PR05MB5599.eurprd05.prod.outlook.com (20.177.203.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 09:05:28 +0000
Received: from VI1PR05MB6477.eurprd05.prod.outlook.com
 ([fe80::8437:8389:cec3:452c]) by VI1PR05MB6477.eurprd05.prod.outlook.com
 ([fe80::8437:8389:cec3:452c%6]) with mapi id 15.20.1965.017; Thu, 13 Jun 2019
 09:05:28 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "festevam@gmail.com" <festevam@gmail.com>, Oleksandr Suvorov
 <oleksandr.suvorov@toradex.com>
Thread-Topic: [PATCH v1 2/6] ASoC: sgtl5000: add ADC mute control
Thread-Index: AQHVD9h3XsFBSZPO+0qHbd3KVI0xQKaZbpkA
Date: Thu, 13 Jun 2019 09:05:28 +0000
Message-ID: <063a08453c5d0c1c88ccb1bc8f4b1512e99ab138.camel@toradex.com>
References: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
 <20190521103619.4707-3-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190521103619.4707-3-oleksandr.suvorov@toradex.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marcel.ziswiler@toradex.com; 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe157206-9f83-4bc1-20fb-08d6efde47f4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR05MB5599; 
x-ms-traffictypediagnostic: VI1PR05MB5599:
x-microsoft-antispam-prvs: <VI1PR05MB559911E03714AABAF63160BFFBEF0@VI1PR05MB5599.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(39850400004)(366004)(346002)(136003)(189003)(199004)(305945005)(186003)(118296001)(6636002)(11346002)(229853002)(26005)(6486002)(316002)(71190400001)(7736002)(71200400001)(54906003)(86362001)(478600001)(110136005)(14454004)(3846002)(6246003)(81156014)(99286004)(36756003)(76176011)(8676002)(6506007)(53936002)(476003)(6512007)(256004)(5660300002)(25786009)(4744005)(81166006)(6436002)(8936002)(66446008)(66066001)(4326008)(2501003)(66556008)(66476007)(64756008)(68736007)(66946007)(76116006)(44832011)(2616005)(2906002)(6116002)(486006)(446003)(102836004)(73956011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB5599;
 H:VI1PR05MB6477.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UkmQQukRK6vUaAw3iqFI8oajIdla0G9a88RRHPka6/023s2x+kvAMCcKi1HpDvGTx2RS2ZfH9tA9MlKMUoHcg+fgrUGuOLlMq0GzrZ6A2UDBINx542vH89bjKX3WBPeAbQgXZJCIBl8WH3g4LrX041tVqJn1Rqr6okJrMH69DQSTWDb6z1I/NV3DN3S8XLsNIQaGEanJIo03mD/jNg1mMwZhpdtfcLDO8smEeCCjaKIQuz5JjG2dF1Nobv/WYvSviyyT0BAcOgDos3scQBWrvDV2uKeBeo1zNIJvyH5aLXH/jgH5OoK5BZ5l43CyDS+/6rJpx1CMEXcG47It6RRXExtZInZ2pdYozjEwXPmE9cE5iePKKyjA6T/4vSybq2dmrjROKpfoG9EupnMw1qyufVov93eJt7oMmJybUSnK+OQ=
Content-ID: <028F4CD25C14B6478349B18E20D4F554@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe157206-9f83-4bc1-20fb-08d6efde47f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 09:05:28.7044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: marcel.ziswiler@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5599
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v1 2/6] ASoC: sgtl5000: add ADC mute control
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
> This control mute/unmute the ADC input of SGTL5000
> using its CHIP_ANA_CTRL register.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

> ---
> 
>  sound/soc/codecs/sgtl5000.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git sound/soc/codecs/sgtl5000.c sound/soc/codecs/sgtl5000.c
> index 5e49523ee0b6..bb58c997c691 100644
> --- sound/soc/codecs/sgtl5000.c
> +++ sound/soc/codecs/sgtl5000.c
> @@ -556,6 +556,7 @@ static const struct snd_kcontrol_new
> sgtl5000_snd_controls[] = {
>  			SGTL5000_CHIP_ANA_ADC_CTRL,
>  			8, 1, 0, capture_6db_attenuate),
>  	SOC_SINGLE("Capture ZC Switch", SGTL5000_CHIP_ANA_CTRL, 1, 1,
> 0),
> +	SOC_SINGLE("Capture Switch", SGTL5000_CHIP_ANA_CTRL, 0, 1, 1),
>  
>  	SOC_DOUBLE_TLV("Headphone Playback Volume",
>  			SGTL5000_CHIP_ANA_HP_CTRL,
> -- 
> 2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
