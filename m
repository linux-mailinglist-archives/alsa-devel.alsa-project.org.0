Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9B918AC1
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 15:32:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5C5D1852;
	Thu,  9 May 2019 15:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5C5D1852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557408748;
	bh=88vYJmLQEhP2hSxbwCZsauGZvClSFw55c1BEqFfU/f8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DZ1fWPXtWj6i6fI6ZKJBuM7lZxDnHtgm+hQDaeovnuBcUT42hc0chR0i0C23hnjjr
	 r5lZQzkTHbPecWLOtifnW1NP5siLL1pAZTRJ8WRT2wyFtExfDVYtiXloH6fTB+Rv8o
	 VKPVft8bw2pqj+BkKEzD870SybMso/T7N07cFIFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA45EF89678;
	Thu,  9 May 2019 15:30:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A13A5F89682; Thu,  9 May 2019 15:30:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30052.outbound.protection.outlook.com [40.107.3.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB180F807B5
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 15:30:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB180F807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="Y9+i2Zy8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xv7YxBuTiBgX/OfNMXlKgvXNI8tx5NgnQL9GxV+8Ew=;
 b=Y9+i2Zy8SGbPn6r4rLzcX8Xdmq6IyI9puN+625hkkqjgOIJnCSgA/g22H8AKh3hy0IfgdSgyOsbAuoIIOFh/82rGTSaJ6C+UWc+5o0JfqL1SIbBI19I87mIKqncOAsbzCpA/ydkjsC+BcOUi9t85SS0jFhTTT1/E+ovZMZDUrbc=
Received: from VI1PR04MB4704.eurprd04.prod.outlook.com (20.177.48.157) by
 VI1PR04MB4029.eurprd04.prod.outlook.com (10.171.182.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Thu, 9 May 2019 13:30:35 +0000
Received: from VI1PR04MB4704.eurprd04.prod.outlook.com
 ([fe80::18d6:6f21:db62:4fe7]) by VI1PR04MB4704.eurprd04.prod.outlook.com
 ([fe80::18d6:6f21:db62:4fe7%2]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 13:30:35 +0000
From: Viorel Suman <viorel.suman@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Viorel Suman
 <viorel.suman@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, Julia Lawall
 <Julia.Lawall@lip6.fr>, Daniel Baluta <daniel.baluta@nxp.com>, Colin Ian King
 <colin.king@canonical.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH 0/2] ASoC: ak4458: fail on probe if codec is not present
Thread-Index: AQHVBmtinATQNAne7kuK4xQqWxo8Xg==
Date: Thu, 9 May 2019 13:30:35 +0000
Message-ID: <1557408607-25115-1-git-send-email-viorel.suman@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0102.eurprd04.prod.outlook.com
 (2603:10a6:803:64::37) To VI1PR04MB4704.eurprd04.prod.outlook.com
 (2603:10a6:803:52::29)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=viorel.suman@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2db9afa-fc69-497b-dff6-08d6d4828458
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB4029; 
x-ms-traffictypediagnostic: VI1PR04MB4029:
x-microsoft-antispam-prvs: <VI1PR04MB4029411E2C9A56625766B07992330@VI1PR04MB4029.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(376002)(39860400002)(396003)(346002)(199004)(189003)(68736007)(36756003)(71200400001)(50226002)(66066001)(52116002)(2501003)(5660300002)(8936002)(86362001)(6506007)(478600001)(71190400001)(81166006)(8676002)(386003)(81156014)(2906002)(53936002)(25786009)(4326008)(476003)(305945005)(256004)(4744005)(6512007)(99286004)(7736002)(2201001)(66476007)(66556008)(64756008)(66446008)(26005)(66946007)(73956011)(110136005)(54906003)(44832011)(486006)(14454004)(186003)(2616005)(316002)(14444005)(3846002)(6486002)(102836004)(6116002)(6436002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4029;
 H:VI1PR04MB4704.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1f+rZJT6yvBFqptBV0k1nD630xRF5xxZKS5JrOliYJxrRyLhBbQnZufuzgAa6zo6fNk7ETJ7mjtwOzYiAxPC/RVUmWQprc37qTWOZfzRtMTSeqJGK+0zbWoCgLs6dSLsv8+k4yto8mfQdlEoeGCThd2sPGHe7jZkMdQ0dsapp6GcJMF17VTYV1Wa+96OrMgwa0zJK1wY3YVjG1BsdIK94R/jnUbZCfcJjrmB3zZh/UylIV4FBQ9OzlNIklZuLBuELgORkzWHvQ+iYkCraRdjey5XxKcBa3eu0omjHUqU99OrEj2qqCIQu7a9NApE6WV5opz5D129H/SPYXfEBuBKgY7x/GrR7WA7ouZmApL/xePLmWA066eBBT4YT+hc6rEG+rBIdUWcIc95brH7jurJRne8or+uffMTbOz9iC1Z9X8=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2db9afa-fc69-497b-dff6-08d6d4828458
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 13:30:35.3529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4029
Cc: Viorel Suman <viorel.suman@gmail.com>, dl-linux-imx <linux-imx@nxp.com>
Subject: [alsa-devel] [PATCH 0/2] ASoC: ak4458: fail on probe if codec is
	not present
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

AK4458 is probed successfully even if AK4458 is not present - this
is caused by probe function returning no error on i2c access failure.
The patchset fixes this.

Viorel Suman (2):
  ASoC: ak4458: rstn_control - return a non-zero on error only
  ASoC: ak4458: add return value for ak4458_probe

 sound/soc/codecs/ak4458.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
