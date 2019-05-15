Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C021E86A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 08:44:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C0841667;
	Wed, 15 May 2019 08:44:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C0841667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557902690;
	bh=YRGeHX0nblwFajQqbwrp9RK25lZzcyBem8DSxj/8g7M=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pl92pHIYAHV643WK0HIAS7WZEyYMMdwEJCaImdS1aKCsw6bcOuVRL0+7jOdnN2Vdb
	 Zcbok4p8S3kHQ5Op93fYWSev8z/d5K3ZIT7GxWoXg2O/R0m5E36MBFS2odBWx3fNFH
	 SzhbsSthtBQbDuABryYTk49CTmQiya9TO8i6aPs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A447F89708;
	Wed, 15 May 2019 08:42:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BBB4F89719; Wed, 15 May 2019 08:42:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10064.outbound.protection.outlook.com [40.107.1.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0DE3F89684
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 08:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0DE3F89684
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="AUDccNie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMg9ZVIa8dXUpzoLDfUYE/YUksUyBF9oPpsSHNOjgLY=;
 b=AUDccNie6mJmLwJRHAgZirc0jThhBEET7od09nz4NJy1Q5hRrvDExIoVm1hk6eUJF2CCjuHdnIA8dS9yfLyxoXR2tk0Bqpo2SE7kUA7/zrJC6gHRBJNt8VI/YlHTD3xRMA8n29hoOCvyPFSv40ZnHvD1H5Iis1auJhsnpNytm9A=
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com (20.179.253.81) by
 AM0PR04MB4513.eurprd04.prod.outlook.com (52.135.149.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Wed, 15 May 2019 06:42:18 +0000
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::659b:59f5:6a7e:1862]) by AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::659b:59f5:6a7e:1862%5]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 06:42:18 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "timur@kernel.org" <timur@kernel.org>, "nicoleotsuka@gmail.com"
 <nicoleotsuka@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH RESEND V6 1/3] ASoC: fsl_asrc: Fix the issue about
 unsupported rate
Thread-Index: AQHVCulX/msqLPxGqkq8Gi2IHVVNxw==
Date: Wed, 15 May 2019 06:42:18 +0000
Message-ID: <e0c519d616b48a1481c9f239646517b453e7ce50.1557901312.git.shengjiu.wang@nxp.com>
References: <cover.1557901312.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1557901312.git.shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HK2PR03CA0054.apcprd03.prod.outlook.com
 (2603:1096:202:17::24) To AM0PR04MB6468.eurprd04.prod.outlook.com
 (2603:10a6:208:16e::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbf31ce8-e3fe-473f-ed66-08d6d90078d0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB4513; 
x-ms-traffictypediagnostic: AM0PR04MB4513:
x-microsoft-antispam-prvs: <AM0PR04MB4513BCFA7E5BC854130DA98DE3090@AM0PR04MB4513.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(136003)(396003)(346002)(376002)(199004)(189003)(14454004)(26005)(71200400001)(71190400001)(110136005)(52116002)(54906003)(14444005)(256004)(5660300002)(316002)(3846002)(102836004)(68736007)(66946007)(73956011)(2906002)(64756008)(66556008)(66476007)(66446008)(476003)(186003)(76176011)(486006)(8936002)(81166006)(6512007)(8676002)(6486002)(2616005)(81156014)(50226002)(66066001)(4326008)(7736002)(11346002)(305945005)(6436002)(6116002)(36756003)(446003)(25786009)(6506007)(386003)(99286004)(2501003)(53936002)(86362001)(2201001)(118296001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB4513;
 H:AM0PR04MB6468.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u7Ww0c/plYua5RAnsQSirtXxk9qf4D7fXbkKSdPOfDJk8QFTNr2ZkC6vT7/FQBUPdrZQ6juGpbbWZRf+OCEPECzRNmc/Gk6LbES8aM3RNGiXxxFm2YEQwMWDDIKLinaL6TU2V0eanxRRvPfxXuQKLvxzNFV+rxoyU4re/bGNzzOTGLP8K0M8yfkX38ex2tfIcxGPaZxAt82yDX7IZNlFTyft8FDHOPud+6oNMsmwWZiHr/NcsES0YxofId0ymPnWF2i/2EPTx3TTTYl3DM+Pd1k+Gr8W7XPi3RvcG6zPpayi/ZscaB7XSXdLgJElxHIvIbL5xBCCLsQgvrzPEBwjuyWivpkLDEZBWHo8JoLGCthlVJhs2fi6ITtzzy5qxT/pxP/zgGJnAzTI+w8shlApeLJzlfFi1LyMadqZSEWTNKg=
Content-ID: <C3D24C1B9165C043B8EE814B59C43C14@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf31ce8-e3fe-473f-ed66-08d6d90078d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 06:42:18.5070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4513
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [PATCH RESEND V6 1/3] ASoC: fsl_asrc: Fix the issue
 about unsupported rate
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

When the output sample rate is [8kHz, 30kHz], the limitation
of the supported ratio range is [1/24, 8]. In the driver
we use (8kHz, 30kHz) instead of [8kHz, 30kHz].
So this patch is to fix this issue and the potential rounding
issue with divider.

Fixes: fff6e03c7b65 ("ASoC: fsl_asrc: add support for 8-30kHz
output sample rate")
Cc: <stable@vger.kernel.org>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 0b937924d2e4..ea035c12a325 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -282,8 +282,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 		return -EINVAL;
 	}
 
-	if ((outrate > 8000 && outrate < 30000) &&
-	    (outrate/inrate > 24 || inrate/outrate > 8)) {
+	if ((outrate >= 8000 && outrate <= 30000) &&
+	    (outrate > 24 * inrate || inrate > 8 * outrate)) {
 		pair_err("exceed supported ratio range [1/24, 8] for \
 				inrate/outrate: %d/%d\n", inrate, outrate);
 		return -EINVAL;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
