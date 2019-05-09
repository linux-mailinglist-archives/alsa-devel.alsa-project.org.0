Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2A518AC4
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 15:33:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D4B21853;
	Thu,  9 May 2019 15:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D4B21853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557408786;
	bh=Qe8SNln4qOv59rn4+rBnGM3mkkjAFqh3UIUoJExnRCU=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BfJHRHJ1XmqCnRJGL+jtWm3RPgM0Kwi8ObskJaZBhwuo4jWHui6KDWdrlnUCFRQqi
	 Ax9TKY43HdyJOmTS2DpGN6b0DHCLE9JzCkLu9P+cddzGe1j5RacZZdzRQcNAeOIz4C
	 hPrlxSisF1QQqElDxzUdTApxiA4SLLDGIrrlAu7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6C50F89724;
	Thu,  9 May 2019 15:30:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBF72F89678; Thu,  9 May 2019 15:30:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30052.outbound.protection.outlook.com [40.107.3.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E196F80796
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 15:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E196F80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="qW8x2nTA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8nEPId8Gc1wQVeEFvQHBscn8K0EIAfg1sbMmhKgNJs=;
 b=qW8x2nTA1Dxb7kn0TuhwE6avDStUAb0tFSHWN17cTwDAsjiwuACle/FokkBOotsWZ7589j7+k4aQg27byiXcV4jRhGjAu0fKG9naRoyEiY0lX5/qkdwtftOVrKzEiidxhrEOOYWNAlN5hYP4CTxy1+GtXPGP9Wx7pIQw8ONaQl4=
Received: from VI1PR04MB4704.eurprd04.prod.outlook.com (20.177.48.157) by
 VI1PR04MB4029.eurprd04.prod.outlook.com (10.171.182.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Thu, 9 May 2019 13:30:36 +0000
Received: from VI1PR04MB4704.eurprd04.prod.outlook.com
 ([fe80::18d6:6f21:db62:4fe7]) by VI1PR04MB4704.eurprd04.prod.outlook.com
 ([fe80::18d6:6f21:db62:4fe7%2]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 13:30:36 +0000
From: Viorel Suman <viorel.suman@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Viorel Suman
 <viorel.suman@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, Julia Lawall
 <Julia.Lawall@lip6.fr>, Daniel Baluta <daniel.baluta@nxp.com>, Colin Ian King
 <colin.king@canonical.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH 1/2] ASoC: ak4458: rstn_control - return a non-zero on
 error only
Thread-Index: AQHVBmtiJsyVhgNMwkeHjZewPl9IIw==
Date: Thu, 9 May 2019 13:30:36 +0000
Message-ID: <1557408607-25115-2-git-send-email-viorel.suman@nxp.com>
References: <1557408607-25115-1-git-send-email-viorel.suman@nxp.com>
In-Reply-To: <1557408607-25115-1-git-send-email-viorel.suman@nxp.com>
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
x-ms-office365-filtering-correlation-id: f166d46f-76b7-456c-8fbe-08d6d48284c9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB4029; 
x-ms-traffictypediagnostic: VI1PR04MB4029:
x-microsoft-antispam-prvs: <VI1PR04MB402908C775B33C6E94D0D7E092330@VI1PR04MB4029.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(376002)(39860400002)(396003)(346002)(199004)(189003)(68736007)(36756003)(71200400001)(50226002)(66066001)(52116002)(2501003)(76176011)(5660300002)(8936002)(86362001)(6506007)(478600001)(71190400001)(81166006)(8676002)(386003)(81156014)(2906002)(53936002)(25786009)(4326008)(476003)(305945005)(256004)(4744005)(6512007)(99286004)(7736002)(2201001)(66476007)(66556008)(64756008)(66446008)(26005)(66946007)(73956011)(110136005)(54906003)(44832011)(11346002)(446003)(486006)(14454004)(186003)(2616005)(316002)(14444005)(3846002)(6486002)(102836004)(6116002)(6436002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4029;
 H:VI1PR04MB4704.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ca4nsrRDZJUpXf5T/tPndGe5VfMrz07oDcNg8JAgQl7H+ygW+mxg07BEJ5izcrS6L3wZ0IqlhnSiNzPt+Ry2Tu5+zLHt7KFAVzl9pdGYf4+ZsUMVG7zigWhPBM6U7MM2pEkaDQZB0YwdNyKg6JYDcyyF9eXCdaQeYOURujRI/Og5wgruRaOAc+MITdmyM6w7wKAy4jZ89XcGgpDLHSJq1o730AYVK4K3NDTNR+i/aG1pcclSXbDyePxa01QSEsQZfLuBGuVq6x31AxZSOi0eS/+Z1AVzEuvUq2nfo81hFLvwDhsu5UsN2kYv1U1pBUNG4/FKCTpY1T2tx90bGg3XQlasl0/3cyA/Vwk4/41YFk1DSKhMwoDVRy5/+WkGcUN0WL5WzXgCWhRxYPqw2rDB8xOHgwhGi+aDc/Us1+cSe/A=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f166d46f-76b7-456c-8fbe-08d6d48284c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 13:30:36.0804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4029
Cc: Viorel Suman <viorel.suman@gmail.com>, dl-linux-imx <linux-imx@nxp.com>
Subject: [alsa-devel] [PATCH 1/2] ASoC: ak4458: rstn_control - return a
 non-zero on error only
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

snd_soc_component_update_bits() may return 1 if operation
was successful and the value of the register changed.
Return a non-zero in ak4458_rstn_control for an error only.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
---
 sound/soc/codecs/ak4458.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index eab7c76..4795e32 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -304,7 +304,8 @@ static int ak4458_rstn_control(struct snd_soc_component *component, int bit)
 					  AK4458_00_CONTROL1,
 					  AK4458_RSTN_MASK,
 					  0x0);
-	return ret;
+	/* Return a negative error code only. */
+	return (ret < 0 ? ret : 0);
 }
 
 static int ak4458_hw_params(struct snd_pcm_substream *substream,
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
