Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAA5279C4
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 11:55:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 904541668;
	Thu, 23 May 2019 11:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 904541668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558605337;
	bh=rWayEShFym5aO+AryTUlUrsK+Vd2EHQ9kgtHP52R194=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xm9l0Vz3dTiH589JF1Bi1Kz6SbNnWy8UuU1y31aRW941yn2JFV4gurGBzDWG/Imfh
	 Ix3VLVhsI6pLt3luh3mu3/RdUwPFz2INlsqqSEpiD9LbeF9tMr43zyyqgWvmrT9/0e
	 ZM9WR8g2iYqWH4TYHuSNf5Cf0aGFVahVSCJ0WrQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B9DFF89709;
	Thu, 23 May 2019 11:53:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0D73F89674; Thu, 23 May 2019 11:53:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140070.outbound.protection.outlook.com [40.107.14.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87015F80C0F
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 11:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87015F80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="YizduH/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/gJyh9U9QUhiBGH17yaDRDpDoZi1M9kFk9wSCZZuTs=;
 b=YizduH/4e0ucsOoc4AmBS7YVyq/VewABmlXTOQOaW7lvl5pXe8IbNrgnMQC+rTiTQ6BxiDKK7+X20Joct+ikRSmmVQG27Ftcn1VoVIEDYeZ4BCMQZWYo6SRvkR0yKV/pQgw1B6VRiP9VVywIDT4fWr3u4nkjIZ5CbZmLLHj8bnA=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6509.eurprd04.prod.outlook.com (20.179.233.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Thu, 23 May 2019 09:53:42 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30%7]) with mapi id 15.20.1922.016; Thu, 23 May 2019
 09:53:42 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Thread-Topic: [PATCH] ASoC: fsl_esai: fix the channel swap issue after xrun
Thread-Index: AdURTPrTY9TUCA67Tpmftem6u8zciw==
Date: Thu, 23 May 2019 09:53:42 +0000
Message-ID: <VE1PR04MB647934199C3AA60759BED888E3010@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05ec2f23-0094-4fbb-840e-08d6df648a4e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6509; 
x-ms-traffictypediagnostic: VE1PR04MB6509:
x-microsoft-antispam-prvs: <VE1PR04MB6509F50EB45686EE7F2ABB86E3010@VE1PR04MB6509.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(396003)(376002)(136003)(39860400002)(189003)(199004)(33656002)(8676002)(81156014)(68736007)(14454004)(256004)(52536014)(6116002)(3846002)(1411001)(6916009)(54906003)(6436002)(316002)(99286004)(53936002)(81166006)(2906002)(7736002)(66476007)(229853002)(6506007)(8936002)(478600001)(66556008)(7696005)(6246003)(66446008)(64756008)(305945005)(55016002)(102836004)(86362001)(186003)(9686003)(4326008)(76116006)(66946007)(5660300002)(25786009)(73956011)(486006)(71200400001)(71190400001)(4744005)(74316002)(26005)(476003)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6509;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dFFutxu6B3E6s1FFu5vXEndpXoLGmV5tfMInI7BwDXUIizLJBNKnfMirImG2Q0qUIJ6VSJRyNdGEp/5noyhhgcjjS7OUeWiTvvyLk2ULRmX3eZQ5wmSfRvBTDmVkDn4DJe1PRxYonHeMBiIG4EZM62s1TrcOFgjXHI280PA830fNnx9KUwLhbBC/LYKeKuNiu8pFMyfdQaK71htZZySxMahIg97F5YQ9/Vtz8aA+D7c4KUSzI4LvviVUmjcXxHg7/c71T0F+fK+pEFr5XaDOoBMXUocsBRyBUK5l25dqSRC7+m22K1lw8aoPQOaWzgZim/zYI4VRyq5qF9mPgIaHxn6HECMTV8K7RM4qVy/vmz2881f/Rca7TAwTJI3yjXTOQEvWnL67MfJiq1dwSl/gP1+DwLifL6k2BLpkPi7z5DA=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ec2f23-0094-4fbb-840e-08d6df648a4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 09:53:42.8529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6509
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_esai: fix the channel swap issue
	after xrun
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

Hi

> > +     /*
> > +      * Add fifo reset here, because the regcache_sync will
> > +      * write one more data to ETDR.
> > +      * Which will cause channel shift.
> 
> Sounds like a bug to me...should fix it first by marking the data registers as
> volatile.
> 

The ETDR is a writable register, it is not volatile. Even we change it to
Volatile, I don't think we can't avoid this issue. for the regcache_sync
Just to write this register, it is correct behavior.

Best regards
Wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
