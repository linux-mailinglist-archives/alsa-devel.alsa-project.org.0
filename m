Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3866A3F4
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 10:36:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D458C168E;
	Tue, 16 Jul 2019 10:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D458C168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563266216;
	bh=ac3HodZvF/7I1XzhEwLHuwOpEA/Qydwz1kGJfBwucCY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ag8VK6IGcxxgoI2pw30gH+c4m2Eg5NMszAmFcjGgQbDiNCbS5S4RUStXNTm8ntmdp
	 qmdm3GDzw3zqAvIzfRNwbuzZwdL1+WpPyOGpmn+XbCN/j2xyaz/TTZTtPsOpICEYLI
	 nn8Tu/Pta7X20PSOpA1Qu4kK10oJxeKbZqMx93zU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB68DF80362;
	Tue, 16 Jul 2019 10:35:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE2F0F80376; Tue, 16 Jul 2019 10:35:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_BODY_135,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50061.outbound.protection.outlook.com [40.107.5.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7476CF800C4
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 10:35:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7476CF800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="OYakxs+U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ue2tnAsAyPV4HzefiTsLC/Jy9YPXs+5yrWb/RdGiFVsLogRDYph3CW3cfoM3+Tgicm0WDnzFPLuk3PPrRYpcIqY343rKs+eIZzVK0rvSRfuzGXlIl1QQ+bwLuVfhJLtwrngL3ImCJvUdhXcAD2o6PfuQjw0vqdwFChsdlnS6V9ry5P5qjXXw6XgRNjIYwbaSbx4ETbYDjaRM199dwSNkdXRveCySOpCKyxfbsL9qN9j0N7bO5FF3OWVEznO92l4mEZLYV49XvDZztMt0gMGG+qC6TaMvMgoZc882Yk1ev3RoiDQEjhMqr5/hT3ZWpbV1ui3mjbInegFHx1kmuXOdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrgfVlGIXITtueLT5m9ub0VvAazV6tl60VvsfvnsJaI=;
 b=l+A4bAOJPGMGFMFaZH5yGmIv/qmgg+1N0FmrsK7o193MHJRmHdTujPDWRe/3vyDHl9FsE3Aq7HJQQfm0VxatUYtq/lFZxrDgsK0ldH4Rpz4PYevsu5HYPkt+MIk3MJprsZAqH+hKUNP2NgxTx1irXMRbxVdF/8+Vlb1t6yUI8jZQkcUWifLxmsMsCkccagrVm0yZv9TUvB3ADFKgj9VwZAdcXQ1jSOJm/D+VrQ7WptJGI4B961R2SIKfn6/U8g3sE80P4L1FVFZCahp7ikX4h3bRSN3suhk756sBTomOOPk6/DzefBl5icdlLd2Ia+Ugt73lHuwE0C4cAqpDd/8gow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrgfVlGIXITtueLT5m9ub0VvAazV6tl60VvsfvnsJaI=;
 b=OYakxs+UjBIl6Tc8jzMZzk4WV/+/lpt4YpvGmmnb2NTPCOyHU564eXuUQz3nhzLKOJST486RDE88W8C6IqEMeJ4X4m5NzBWX8CXxxSd0PbszwgpgBQoP2m2OHEoiEFpJxHREuUZM8n9hRN9M70bpFQpnUY9XhOml+2vA95TLvsA=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6367.eurprd04.prod.outlook.com (10.255.118.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 08:35:02 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::218e:ee37:1e81:e157]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::218e:ee37:1e81:e157%3]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 08:35:02 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: Is there a way to support TX master mode and RX slave mode?
Thread-Index: AdU7sONcEDPiFy3LSBy1LaOlx/PQWQ==
Date: Tue, 16 Jul 2019 08:35:02 +0000
Message-ID: <VE1PR04MB6479C4D2CD4B9D486209102FE3CE0@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1dd886d5-7b14-4c7a-5530-08d709c87f00
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6367; 
x-ms-traffictypediagnostic: VE1PR04MB6367:
x-microsoft-antispam-prvs: <VE1PR04MB636709BC3BAA598DB730FB44E3CE0@VE1PR04MB6367.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(189003)(199004)(81156014)(81166006)(316002)(8936002)(3846002)(6436002)(9686003)(2351001)(790700001)(99286004)(54896002)(6916009)(6306002)(71190400001)(5640700003)(55016002)(53936002)(486006)(52536014)(71200400001)(74316002)(102836004)(256004)(5660300002)(66446008)(64756008)(66556008)(76116006)(66946007)(86362001)(6116002)(66476007)(66066001)(2501003)(7696005)(2906002)(478600001)(8676002)(33656002)(26005)(7736002)(68736007)(25786009)(558084003)(476003)(186003)(14454004)(6506007)(43043002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6367;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EYkmBrezKxDN7T3ofkFiFcVbJt022GXSrF6qMzYRHsl1HTTroyJUw4ADyK0zH1hiG+FWJpVof7ea9OacrmF6m6KbxGP3PkJr1Atefoe4UfXXFjNZYCjjwqfVdGkEO0J5OxM5jPAEzmBq0ic7cDad8ybmcpLZ65tyjv0s4i2MInPhYZTLGRT9VM2Y6sLT9fL5Ibr48YrpF09uVj6k3Pahg3e2q+n+MKJzPHbdqmRjDznUqp0Ozep2V53DOOfnSfeQCOD41CssXKWJiJZcBnnmdnvF5+KKh9H2zOnGwLpBXngoj8uPse3HOcl1COojUsXPeEdD1vdKKaG5zZ8PkJpwu682/8CzOgVXUp5HQx0+GVMzx3ALtUSVVkDKlrsleWETtUQWD89OmbvaedLkfACol2TPXuIkjsgpoGW1kd535Nc=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd886d5-7b14-4c7a-5530-08d709c87f00
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 08:35:02.4012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shengjiu.wang@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6367
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Is there a way to support TX master mode and RX slave
	mode?
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

Hi  Experts

Is there a way to support TX master mode but RX slave mode?  It seems current .set_fmt only set same mode for TX and RX.


Best regards
Wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
