Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D85A277515
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 17:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3516417D4;
	Thu, 24 Sep 2020 17:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3516417D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600960773;
	bh=a+eKwPfYW+BnTIVJhbFwZiYjNNcxR8bcLUvMxLttThM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUnRyxzgD5WGgYb0fWUfWCLQiFs4TY3IjlcXUcyPJbUAg8eyoar4pusqKC+zNLli0
	 M2Q1DqmkxSDIs1oykaLl+ny/oQzzVPQ1IUi7n8k363Qqs/3Um0HhSfkZQD+vxXdeBb
	 IF179lp4Sbcn547UI658XJcX5CXQRs5FkoVW/PLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FD56F802E0;
	Thu, 24 Sep 2020 17:16:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C65D8F802C3; Thu, 24 Sep 2020 17:16:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150082.outbound.protection.outlook.com [40.107.15.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 445C1F80229
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 17:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 445C1F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="Li7cX8M9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMvSr+zrSav9dVndrYMKJF8Y2765rfwC4z8PIgZYDp6OCyiFa5yHhTf6H4/DQ9unDDY+vjoy6rVcy+shGI7xMv4WzTvhz003EqLImEf57Cc+ohaHSTWwdBT9R5LSJzhe3AI7ktYKO3ouj2uHFBnVIHdsc1eKgiA8VQ3tNMWjq1MNwo2yD21iBNYZ7flfG+xfA/donsghYOMAg9Kl2J17YTYh5l75VAOXG449u5q8QV3VowGJJeFAWFknrTBdM7rdftnpQN/JNBOeagQjU0Slx/9PbA2pNGkLwJ2cxUzXo9ADTT349wN/OWUCy7/AqPOikCjenJtwlinEbvfHYy+RRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyuIaMcl3vA/atRAyuqnrUtp/MpKY/7LOwS0i5O7ibo=;
 b=Oagrpik0EfOeZqsLrIbAZUlIcEtMWI9WSQ5I7CaR58yuQYOW5/gHJ996T5X3hBNkCPLf06nW5LFVrTIUh4KEwuZEwEOlr9R3DkY1QAAp7BJUAqK3RTBLEH4AZOgKCrUJPty/MjNbYUACYxfPkI4muMdh1BLdciaR7s220JmYazbZbrJZyEtRAcx+/CVGOzaZVrzs77htVsec6Llu8MKlCR73z4NEj1GrnWDO8J1yFF/TRUBBAYYjnvaoYE6udgQ7UGc/6Y4tZ3XqX/IP8PUckFDm7W/bqRnI4C/gN/1qdHlNjHY7Efrwq2exNCuctPXS/kBA425SV9hjm+OA0vy+ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyuIaMcl3vA/atRAyuqnrUtp/MpKY/7LOwS0i5O7ibo=;
 b=Li7cX8M9DSMSKWGg6sAmII3u2VTbFiuV5dmxDULp2TEv9T/ErDxkdY9cjzNvy70uch1KB0XHUNxRFjKNXQTlrOVRKVogLZkDab2sdfOkcSRHF3EmxQoNrpoahgkX/WNXf5ncDhi8AunVX4ktloQwTblP30Lx1ze5kP62s0kL0wk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR04MB3054.eurprd04.prod.outlook.com
 (2603:10a6:802:3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.24; Thu, 24 Sep
 2020 15:16:14 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::174:edc4:7d33:9c88]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::174:edc4:7d33:9c88%12]) with mapi id 15.20.3412.023; Thu, 24 Sep 2020
 15:16:14 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: SOF: Add .prepare/.complete callbacks
Date: Thu, 24 Sep 2020 18:15:18 +0300
Message-Id: <20200924151518.15841-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200924151518.15841-1-daniel.baluta@oss.nxp.com>
References: <20200924151518.15841-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0024.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::34) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (83.217.231.2) by
 AM0P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.22 via Frontend Transport; Thu, 24 Sep 2020 15:16:13 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 84747e33-b4bf-42bb-74cd-08d8609cc704
X-MS-TrafficTypeDiagnostic: VI1PR04MB3054:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3054D46291827F84CCD054F9B8390@VI1PR04MB3054.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nf8CRnzRGc7GuHo4u+gWeurOzJSdiQHAb4fsv5XYWDzrGuH4yUF+CK/o7ZS8Y9yBcGhs8UowKt7bfx3bngr8QvIvfjx4DOMG8SzPWCcX1Lp6HyGnemd9o0c0rjKp+frdZIJ/RLxNXz/UL9NI/XmsL3ou/DGEe0unK+VUehsOBhqboIaVaA7jPTHddoDR5hZVKxM8/pvmLnrLUPfXIK2Jw+jyFjc/EHriHvFrn10p1LY99uJGau4XYYKVmlm44QOZDeJHqAvd7HykSn7UulTVyYvDnbxT22e3r0iaB6X88w/vtqSIGGE12l0Gkh1CXUJQ/XctjhkEF40JpkwhGor8ie3laXf9gXIa0yvS5RaT/AZguV/ERMlGNUHP061eK9jZVA5ut0GNezoOajfMxu1Cgjzn0fatp4z5JIdwNiKueOw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2287.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(16526019)(956004)(66556008)(66476007)(83380400001)(66946007)(8676002)(52116002)(8936002)(1076003)(6506007)(5660300002)(44832011)(2616005)(4744005)(6486002)(86362001)(478600001)(2906002)(26005)(186003)(316002)(6512007)(4326008)(6916009)(142923001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 1n1NXHB9jakB1UBmjjv28sI3LSfPfjz527eUfOPfbYMc8RmukQtnv1+/dWyA1cTiO8ozlNnzs3UkZAnbJ6JX40not7MXoWBZA4N/mlOu7sf5qyCbD3ylprXgM2e3dRaQrh4xUlHRzhmuUwook6XqLdv6HDuIZfslRYSiiEhHG7S6w51/Uhzxlm8xjZAyv1wEO0oGOhqkCQBk8/zyWhOWBd42Yy8VIkTJCkbhP9Z60NgkJNFJs58BVWS5bxrtSTMHwMLoFoBQnl1YFVaCnh1nz8xo4wR0AGCBQWB5pgpETqejpSuEDdpWzEZVk4s61sbolAWBY3AWIqGcrzNGmnMNSFL82LbWkt4KXn1mP21FavyNC14YjwBLCIVmgPQuoj1QZ0kuZTUUeWtdlKNMV4W6KuDpOfNS8dNjdr5ZJwjgri2ItH/LlKLcFRq8R6M/XLcvFseablLsgHYBFPQlBqa8UMBJTlvxui7YAFgz7OpNICBOjJ3cl21nGZWHcIse01GROr++MNE524MrDrTyw7ks46xFXQMQXYm7ryLoco35F5P0pWjviZelRxoLrORft63w90eK8XTUhOCsX9ZPV4DhWnZniKWvxuKctXL4vhoeq+fIwbsSpNM5vyEThslIDS/9Tt18EPh3CgMTJqQpmPsnGQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84747e33-b4bf-42bb-74cd-08d8609cc704
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 15:16:14.7056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9C83L4g9b5A5BxlM5RXzu6VJnG4lWlzBXBiUJYrZliBFzEiqNIWrGAAQn8oHPPYx/Ga81h7bBRzWqyyTHqhZHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3054
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Use SOF defined callbacks (snd_sof_prepare/snd_sof_complete)
in order to update internal SOF system suspend target.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/sof-of-dev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index de9acc0e33cb..85ff0db88eb7 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -46,6 +46,8 @@ static struct sof_dev_desc sof_of_imx8mp_desc = {
 #endif
 
 static const struct dev_pm_ops sof_of_pm = {
+	.prepare = snd_sof_prepare,
+	.complete = snd_sof_complete,
 	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
 	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
 			   NULL)
-- 
2.17.1

