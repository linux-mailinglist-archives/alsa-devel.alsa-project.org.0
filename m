Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D04B225865
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 09:25:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4292F1662;
	Mon, 20 Jul 2020 09:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4292F1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595229928;
	bh=pXmXL8AwYCP2HadLyivOCQpvJXuAvQ4YquRbZ1woCSE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TE3prHAmQmw2tBzV/WeqldgBPbXsR2Xo16/CYLuxaKDo33qda+pUY78D6jIiLnDky
	 9NrZSuPOlnky7o/DecIJv4Y6/GhcIbahGZ7yyJrXtorhOcaIBkrL/DC7MOPZEIl7Eu
	 xWOI5HGNGEK2UyVdoyzGh0f1/vlyJh7i0X/5i+Eg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D40C3F802DC;
	Mon, 20 Jul 2020 09:21:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C21F9F80279; Mon, 20 Jul 2020 09:21:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60061.outbound.protection.outlook.com [40.107.6.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0345F80141
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 09:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0345F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="Rp7RQ9tk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5xKPjj87e1X6vSeLZ/UCwI4fMu7nSY1fiHBE5IJ0pmTyh6CmaXVj4u04FdbSVUt+AuEl/hMhOz9hsiFTbeAWXXIl8F8bYEmHnHgjtX3gs/TpZAI3fpyrTH3ZQ1aVjKQxkI3TDl5KUXTGEhrz2HvdCbLEeD8iwDiC5cIlbwGyUo/oel9HaNRvemUlBuA10Bx8xYb05T+MxRnu+OtXDU904lG67Dqemq/BCFT0NGExL5upZ84O8dOrbaTueO8Na3GiMgJTvgimOnkHew1iAX79N2CCB+3GdHLv2Otjc3JXLxZmHBKMnlnOxhWL5Ur7j6xaOzf7yzPigrBD5omRRynXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrFQyO5aRtGNHudKQwIZBDdAXEsLZCxckW0+MVJPsBI=;
 b=hw8iUmbGdLV4JwV/bg812UfjzXhUbQDql7eQ0ruPzo5N7uNW7/nqtNaAMRDIUSZ686/tNc0beFwvId+GHq4I6p5eP1vLa69ykUtkZLc2jo//cfXhVaCdnFc7unNpddJ+rLqsnkZh2Puq0RgT17ugZFzsgtee7p2QHMW5x+smvVai+ptmOw3qpzWbaQ9/I+YFI5MkDC6a7rEmzgQn28581rQGFkSLAY2Owt8UGdezJk5pU//tglWehW9k3Lt87KDgS+BThWoXJ3KpLGcen99qE7hUOHs8MlNB00l7YQKioVHlp88coy47kXb5J3bLr34/9sGJLRnMrRYTGN+k9Ra0bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrFQyO5aRtGNHudKQwIZBDdAXEsLZCxckW0+MVJPsBI=;
 b=Rp7RQ9tkAXdcQgULHUl0ZfYA685W9+9nK+dNeU8ss/gHTWLN2VTR8sdYlk+OwOBnBkVtXe582zL611pp6uWy8/v+jTIZl29eI/IiZrwJx+WlthYF5IwdH2pEPOAeGR9DaPYnTgbYL/oimvw8ao2lZBpTf8+MHiDJOfPX3yg6IWs=
Authentication-Results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0402MB3344.eurprd04.prod.outlook.com
 (2603:10a6:803:10::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Mon, 20 Jul
 2020 07:21:31 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711%5]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 07:21:31 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/7] ASoC: SOF: imx8: Fix ESAI DAI driver name for i.MX8/iMX8X
Date: Mon, 20 Jul 2020 10:20:42 +0300
Message-Id: <20200720072046.8152-4-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200720072046.8152-1-daniel.baluta@oss.nxp.com>
References: <20200720072046.8152-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR07CA0023.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::36) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (83.217.231.2) by
 AM0PR07CA0023.eurprd07.prod.outlook.com (2603:10a6:208:ac::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.14 via Frontend Transport; Mon, 20 Jul 2020 07:21:30 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1e43e508-29c8-4986-8817-08d82c7d869c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3344:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3344C5D9A8315A64143F081FB87B0@VI1PR0402MB3344.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LyPHiPRl7T2uQnFOI/wcLHn5gIZ1bHc2u1e2GlHPdO+yt+hfTcODCIVSh1UjSs7OO7cxJ3jhoQByl41tGW4x6Rnqor7sXMzHGE0rX4WC822LfyQpvq+G7K6nfCqP5D4muhOyL5lXmscoceqwctECrZ43sYSGtVt7DmXyBe2eFE+o+D8amzGAAGpCSfKdce6RdS4hUtam3gOR1JgtAvMdpnqEsRm05TGau4hORJIDJ1PvLl75Tj6i/DmMEEeyaLjmoYg9cU6fuvHvrZB7eafVxwPAxVeI24yk7Z7PDcV173IwRSUcC9mm3gSgixgoTZ6olkizTsIpfYJMbmriM3SL3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2287.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(316002)(6512007)(66476007)(66946007)(83380400001)(4326008)(66556008)(6666004)(186003)(6486002)(2906002)(52116002)(86362001)(8936002)(44832011)(26005)(1076003)(956004)(478600001)(8676002)(16526019)(6506007)(2616005)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: N0r6Y1BEcBaDxfUFqeqFlyu7g/QPvEhGiYy6El6CYpGhx7mJpUP4JIvuZx1YEddbBzkcykEuu58bE7gVdL8aw9/MCW7s+oRTSv5Fnhgb0jcDBgibIEl4GBJmIGhux8Oru6ws6nHqgLE3woqzjA5BfU2GnQ4v0GfH2VPOzocKSgFrHJjVBtGbuVlKLBRjynOmO4NO2eCS9nrZE7QzY1SQHehDB8UAIywdZdWlF4O+24s32T4U2C+kXfNcA7lgJ9AgcSrQXkYZdrQyBPxineUwYCySUq4vj3v7QGIIOPDhTY/tFcC+0RUqPBAE/g3IhUNGq+JfgegZlte63pYtlDrWajeqVKS4+tQ6VfhemF/uiV3qaSzsjdgDh3s4oYS/4As2b1Fd1M1+/mq+1haVHVH7MtBG0fneYPMcyWg8+hxTLoUgCw0K6xSOJ0Hyt717DSy52IqYetcivpDuNbjX7Ic/HEfKepWofIxC8DZcF+DdbUg=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e43e508-29c8-4986-8817-08d82c7d869c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 07:21:31.5703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DAkFpFTxRwg8yhV1k2MXr5mpOeEdtCRSGNdBoEzQTx+I2IwAkoPawSC7ipWlecqtqr4i/dsaXHE3R2R94untg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3344
Cc: shengjiu.wang@nxp.com, festevam@gmail.com, linux-imx@nxp.com,
 linux-kernel@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

This must match DAI name from topology. Also, esai-port is too generic
as they are 2 ESAIs on i.MX8/i.MX8X boards.

SOF integration only uses ESAI0 for now.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index c7aab646cb8e..f1308824e2cd 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -374,7 +374,7 @@ static int imx8_ipc_pcm_params(struct snd_sof_dev *sdev,
 
 static struct snd_soc_dai_driver imx8_dai[] = {
 {
-	.name = "esai-port",
+	.name = "esai0",
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 8,
-- 
2.17.1

