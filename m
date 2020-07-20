Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 466A0225864
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 09:24:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E77961674;
	Mon, 20 Jul 2020 09:23:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E77961674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595229884;
	bh=L2/2ibwBLqqdhuwv2f2+x5I8UQjJjfQv2r9G0FF94gs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GThEramMWOWQKL4hZwDTYIlub6vNcD4M+gSg1Lh2Yi54oiDtn0IcqqEcJ26Obb7xn
	 Ot3i05KrtDa/JKrgwHKZegqdp0/YHMuMY+ggyplUvAw58awtD0kvkQ8pzJB1nVJvwJ
	 dEyYSoq4iOrbjcjaskq51i8rWwlZwaX2d/+R27jo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1350F802BD;
	Mon, 20 Jul 2020 09:21:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9713F8028C; Mon, 20 Jul 2020 09:21:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60061.outbound.protection.outlook.com [40.107.6.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 003CDF8014C
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 09:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 003CDF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="KUjZLHhS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uf7/4cPqZ6aPJYQmDgzMJ82XqAQMX39PpP3W7q8NuMenbsgUingDEJZse1ebdIz2tQzj15CFUYlqv2NV3OaulapACwY7W4gCTWeuBUseL6GlNagt+5TEZrhLgoHLTpLt6K1jkkqQHVUAKy9wEXakI+5MRW3FdjQOrMV5ItKEQ50f9KlEQ/t5JyAX6/4Bu/HTDACrl/y0vcPkBlIDWYC2i4siqrYoM8nKq+iG4mASb+lw9g9AXAsOwEFJlDSDy6QvBpy/BeA4/S0IbVS7ELl5ZUt3jd1K11e06ypujZzNUn+yy+gOCxTzcY/fQPZ3lhNzKgA1J13Y+gbu8pbPvnb0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ppl+MzYecAUT7GzxbaOvmkNzRp5j3+0dutQZ84AETbc=;
 b=ApmI8YJe2cKCd9HSNWXIpdnz1oTskdnLjbB8ZLVhJs4TJLQqLwavfMTiNtGlNBNR4ZCGUHdoPqcdsD8JN1bMMGa5Eq1EEJgZUE+26YugKgPcZQeETUkc38WdFgWYGUiMhR6TrFKYLttRl54c2dfuXmhUtD0eRoZCfPWaORVZOUNoihbysO5vDSjvkDF1dZX2nWx+pwAcVosTIfqbIKC5F6ZHu1FKCZ2QFEeiI4UpdaUG0QbYIaUEQPHFwf1WLWLUW57G+vBeVqhQOHgbLrlxvge/uDYqsO+mGl0337hxr6inMVlTJSNHlC3bv7Rh/YBJFrtQe7fBficecPGUvSaH6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ppl+MzYecAUT7GzxbaOvmkNzRp5j3+0dutQZ84AETbc=;
 b=KUjZLHhSVfdEmEbMZ93vyF72mvTCAiKRI0J4zrI6/cPJGT0gPy/zrafXFV7UoEI8T9W6vdl+90v4a0B8ah8PtZ10MKAaV08f5x+3b+pASOkxK2VWpm6cs5zU4NNyAxmBTTtgipJNEwkvLDP6oY/6PF6YjFgN7ABLYTrlJS1Gfy8=
Authentication-Results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0402MB3344.eurprd04.prod.outlook.com
 (2603:10a6:803:10::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Mon, 20 Jul
 2020 07:21:32 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711%5]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 07:21:32 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 4/7] ASoC: SOF: imx8m: Fix SAI DAI driver for i.MX8M
Date: Mon, 20 Jul 2020 10:20:43 +0300
Message-Id: <20200720072046.8152-5-daniel.baluta@oss.nxp.com>
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
 15.20.3216.14 via Frontend Transport; Mon, 20 Jul 2020 07:21:31 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9d298062-8980-4b5f-d930-08d82c7d8731
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3344:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3344DA150ABBF456A81D70E9B87B0@VI1PR0402MB3344.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ncil2TGu67XkcJ2/bwRp2Bgm2cCC3SftTbkWRyulmAX/ZbETa1AFdd3gIkJzymopvQxm6imKmGDmkhedw52NQEOtkbaMoZSt9y62tjVS/pUXSp176Gq+MILLttjUs+DtS3yMNZligcVoi6cafxhV6f1XvdT1qJBGqvEFSh4l7S3tgMlrmatMAGmoNPg2tqGya6/kjVYtZc/MnaSiuv5szIzLYU0wvnFzD6cz6EaKXh3VL4HPMonT5Ypkjw3cZVj++nkxzDe+EUToMprCm9I+l5wDLK8P68d84SZ/ghqOUU6FHI5ZWy+gkrvWUpqamRtIKXxaSiMuJH7olcs6sd2d+BUVmlwcJuetqr0qLmczQR7TlruLvWD223kzh5zZNEu1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2287.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(316002)(6512007)(66476007)(66946007)(83380400001)(4326008)(66556008)(6666004)(186003)(6486002)(2906002)(52116002)(4744005)(86362001)(8936002)(44832011)(26005)(1076003)(956004)(478600001)(8676002)(16526019)(6506007)(2616005)(5660300002)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Q2X24uecKSJyKnxEvEb+PoKY2M5xR3GNYhmcupyp3CwDlILVQuVIbQhI84tCRzRJIiyybpwE7Apzx3r3DJ2jCvFE+PflE0jIwCE1bQIKkQ5aEDO72OjlpudqQBrX48BzfTRJF/y5JfPZelR40KvEjzjSftlCQ0jFpFukYxdhPVzZHbwVQOLMNAioFXCl+aWsZtCGRslEq5lMAXAvGFFvxENlmTJIfKCVK0kBfP1QDy7qgqtp5ymXl9aDIGmzalfl8XRKDlEdKWcAcOp84QgtllhyqmOa3i/3HUd0UgqPPnRR2xYA/+3CjIQ5rMUG/PygdT0bYkKCjXd9lbe140xyvl6LsuOuKfWzApaa5VCiZGr0kmyK2p3wHZI5KazJGsQwdxJVJ9mMsZMkeAFcQ5BDuobiICiM1/yTmlE70trvK3ruzBGWqVkuxDzeVnRTz8hDD/r/GMhNaAfmtym2Ne6J/4lJ0hELACN6QRru4VDUjLk=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d298062-8980-4b5f-d930-08d82c7d8731
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 07:21:32.6269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1YpaxeoogqEBikH7/sc27xHp2HPpaDYxaohWXmi8+sqKeJGpPuyjUZV4cF/XL20WrIuGOuKtf27cbfZx/4q0Q==
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

This must match DAI name from topology. Also, sai-port
is too generic. Physical DAI port on i.MX8MP is labeled SAI3.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/imx/imx8m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 067d2424c682..3b9c560cd40f 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -239,7 +239,7 @@ static int imx8m_ipc_pcm_params(struct snd_sof_dev *sdev,
 
 static struct snd_soc_dai_driver imx8m_dai[] = {
 {
-	.name = "sai-port",
+	.name = "sai3",
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 32,
-- 
2.17.1

