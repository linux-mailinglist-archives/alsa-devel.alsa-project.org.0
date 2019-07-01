Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E403E5BCFE
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 15:33:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DA6F16A8;
	Mon,  1 Jul 2019 15:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DA6F16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561987992;
	bh=vNDehutyL7/fg6GmqUI9IUsxX5i9E5yceyxkAyq1gAM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KOalSn5A1LbiMxETz+eC78373F2Av8wOYhFiJfeq98W7gGyorZpEEafGdu60rpyKf
	 Up17m5Ji58x/zcoUMRKZ1guwSpWPBzmYklXEmo104DYUfkvlk32zkO8yThPWiWPdmo
	 2YN+JVg1aJ+BLf0RRe1N1sVLFYSlZwv6h9eltwqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0B60F896EC;
	Mon,  1 Jul 2019 15:31:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A19CF896EC; Mon,  1 Jul 2019 15:31:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00082.outbound.protection.outlook.com [40.107.0.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02F29F8076A
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 15:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02F29F8076A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="gjz/Q5QG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRu6nr0qIM8UXDRYiY9GFD/AHJ5otcojKSfX4XoWY4Y=;
 b=gjz/Q5QGNcOh99c6WPxP2+qp9VPLsvJUImQeZw26IIx2D2rsanJ4nefDOANeJq7A/Yadv0+BLEO+JHboTa3COkORWsI0luCxX+lmFPV8bOCVxr4yTiyrfEoNLPMxh/2I30hNwhGqGYclk8wthJa024pbCjt4kOGL+naMGGmZawI=
Received: from AM6PR04MB5207.eurprd04.prod.outlook.com (20.177.35.159) by
 AM6PR04MB6437.eurprd04.prod.outlook.com (20.179.244.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 13:31:21 +0000
Received: from AM6PR04MB5207.eurprd04.prod.outlook.com
 ([fe80::9c87:7753:43b9:6d4a]) by AM6PR04MB5207.eurprd04.prod.outlook.com
 ([fe80::9c87:7753:43b9:6d4a%4]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 13:31:21 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "perex@perex.cz" <perex@perex.cz>
Thread-Topic: ALSA repos
Thread-Index: AQHVMBFFbdURAa+Cd0uNPACFlU8fqg==
Date: Mon, 1 Jul 2019 13:31:21 +0000
Message-ID: <f9918709be17e4289c0d667b15187f88985a145c.camel@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5689f80a-f8f8-4b5a-1ff5-08d6fe286809
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR04MB6437; 
x-ms-traffictypediagnostic: AM6PR04MB6437:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <AM6PR04MB643786E261BBB7158EBF1228F9F90@AM6PR04MB6437.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(199004)(189003)(54906003)(316002)(5660300002)(66556008)(76116006)(66946007)(8676002)(66446008)(73956011)(91956017)(66476007)(221733001)(81166006)(8936002)(7116003)(81156014)(6116002)(3846002)(86362001)(3480700005)(4326008)(44832011)(71190400001)(71200400001)(64756008)(36756003)(2501003)(2616005)(25786009)(486006)(476003)(256004)(5640700003)(99286004)(7736002)(305945005)(1730700003)(53936002)(4744005)(966005)(118296001)(14454004)(478600001)(66066001)(6506007)(26005)(6436002)(186003)(50226002)(102836004)(6916009)(6486002)(6512007)(6306002)(2906002)(2351001)(68736007)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB6437;
 H:AM6PR04MB5207.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wAalFoNbaCsQKUd/fvMDClFShqikG0PCvJBbndMA7Wln9WiUsqEk/UvvE+X1NbITSbmHEHPpjn4cK5AkzIZx8uez3eJCoR9tf9mj0X4znNADZGqnxhxLRwk52VHwx3aU6iNuRkxZImJraKtxXviuf9y9lN0kd8T7oFu1MV5gEvNFcDNChJJSVWR1JK7knQKtkagDiq//a9Z5AofwVuHgBX1LbS5GqlTFdTSKKFOJh7jfCWfWI2fpxC4K8pTwc/kiP+rxzRpbIGPYqVu2UT86e8RXKsie6fcVGGIH6OBK7ks2+WRvqkWT3enFp0CKyQrnnOPUWY464pjtHySmh+d1ou3ojCD6rBemu9ifplKmG3PElGM8E7uT4umWmEc+UFcTiTbQyTOZUQMmbHoF7TJFVlrLWbzDf5qR0cTXneazDTU=
Content-ID: <7F6A40B39097AD4B9A8BA412EF70F20B@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5689f80a-f8f8-4b5a-1ff5-08d6fe286809
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 13:31:21.5520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: daniel.baluta@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6437
Cc: Carol Zhu <carol.zhu@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 Jun Zhu <junzhu@nxp.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] ALSA repos
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

Hi Jaroslav,

What are trying to understand where are the official ALSA project
repos.

We found:
 - Github: https://github.com/alsa-project
and
 - alsa-project.org: https://git.alsa-project.org/

Which one should we use for our daily builds?

For example we have been using alsa-project.org repo for tinycompress.
But in the last few days git clone didn't work! Now it seems to be back

online.

Also, we are using Yocto poky recipes:


http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-multimedia/alsa/alsa-lib_1.1.8.bb?h=warrior

which use pre-build archives from:

https://www.alsa-project.org/files/pub/

So, any clarifications on the release deliverables for ALSA project
would be highly appreciated.

thanks,
Daniel.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
