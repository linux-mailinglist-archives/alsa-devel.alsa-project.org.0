Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F62C454401
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:43:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4412E181A;
	Wed, 17 Nov 2021 10:42:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4412E181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142185;
	bh=rJfwFl14RfI50Vosu9zJowwWDDp1tMi1aqiDwZseXRk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RbYNrT8WkeOEVxSKW7JYNfF/JIgmNsAnAXEuDnO8wKFeuNSFtBiogMKzzCd2fQ89t
	 Z89JHScYRsgPGfOxIT2QaeYVmi9jyQpdVTtUajsuVpmfzoyWfsf6EBrpCkOJFNJkaM
	 Toj9n7fXhSKiargQdGKn5FZqtvJANgIfgJE8Ab6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21683F80544;
	Wed, 17 Nov 2021 10:38:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00924F804FD; Wed, 17 Nov 2021 10:38:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D045CF804D6
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D045CF804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="ELVQHfiL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZAkfrk6W6+OdGIdDhC/UB6MZPI1ttZolA9NU9uKk8Cxm31PjB872pZcFFhe6moXBdrbq+/Sj75VDFrMiYcFWwcdGc80lyNQ6Lfm5KiH81AZ1v37i7BI9JjieS5twbqlkmw6d0O2Iy/gFzjv4skVxcuOGO+cNoNwVFraZAq+d4JTi2IjIrTFd4kQap8uvl7eBLj+v1OZoZzKTWNyD1UdPZObQL2VscZg40gvev9KMv6GWizl38sYbQ86ceNmKj0HmafZIpcqS3AXxrA+02MQ5Mu5LaZ7yC6S65oJwOaJe9KryntSgwLW/mREg7L7euTFxCmQzXblb+51aCZJ3oEOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHUH4Cd4ZYtfRYW75IGB/V1A4cXMLi5M1GrNapeEmoo=;
 b=Lp0br1VRzoVEigeGCT6A2+LoefzbAMr6L7luA3ZSX0UaCD9vr6qYTqKlSOxKuxmdHckjQyBTgEFHR9tMQJF+b8F7+oFw2Yi8+71ChxMJlJnHi97ASQLFUX0irUE2nX1rejkEJgXnlnNvRLc8YuIWGCvKESfkL9nBGX2sK17Ox08j0T6uISr3ywdz2F/Xj7RLQGYW/SywQ41ouhpdbwLDoISzaooBmu2uI5DPDGGlyW1yyCESAyhYBun8KlRZEl5yVunHTupChh+Br9T4H08DfArBoUeJ/qW1pQXrwkawpm06YMIg2z4fv7jvQWFdn4mPOAt0qnnLQHONo0i8veeHyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHUH4Cd4ZYtfRYW75IGB/V1A4cXMLi5M1GrNapeEmoo=;
 b=ELVQHfiL+6/O7Pn2M2ZFSCFVXh858NFRE09s/vfl5hDlDva5B2lzfOQ8/bhHQkYrGpxEL+RLe12qY6qTP391Oh8FanYrcPPBByC2CKCiDnfrJGmtibrt0w2FR9Ku20Et87RJg5xgYpP8lxEhX1nKqL3LTG3Ln6eiwPbGTSoG5rQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB3039.eurprd04.prod.outlook.com (2603:10a6:802:b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Wed, 17 Nov
 2021 09:38:23 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:23 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 10/21] ASoC: amd: acp-config: Remove legacy acpi based machine
 struct
Date: Wed, 17 Nov 2021 11:37:23 +0200
Message-Id: <20211117093734.17407-11-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM3PR03CA0060.eurprd03.prod.outlook.com
 (2603:10a6:207:5::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:22bb:b216:ffff:73e1)
 by AM3PR03CA0060.eurprd03.prod.outlook.com (2603:10a6:207:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Wed, 17 Nov 2021 09:38:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8501f176-cd72-405f-36e0-08d9a9adff2c
X-MS-TrafficTypeDiagnostic: VI1PR04MB3039:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3039C14A3AD4853F9E2FC512B89A9@VI1PR04MB3039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d8MBTTM77iKsY6l1DNvKCN1EgDCRiUT9UlDjZFtS6n4ro71xXR0tWboWfFi123hcBdinGVievlwAqjKzi4edK5c0scfGozTurB1P9gBzFhc28WdVZ6LBOoC6P0iKP5FtCntlYatXL3c3wahT30peg4oMqqKOp21v1Y5m03zoKA8QNvul0jSaOjfU/eObP/HJKcuCoDs5+Gp2HR7zFzBGIc9urQak7/FN4Xf+bR8KcADnFAYlLDEgj1xSAzT55hhuWMjZtLFMCCnGoKSi1sxMziLmeOvRvR0IRyg5mCWEp5+9fm+9YD0G3JN9VD4xyzlhwpHGLEMxqMCbRVKs2hhojPs1fRmf7PemPL651bH8bS/KBy81RtlQNKgI7dUcw8vorh2y/upj6E7oFRUyJtfP6DwFY+chSJLKsSlPw4AQ//rVbN9nDxmHpxatOLvXJLcsTBw5eV+8XQNOQyc8xvHqvJyFHeZ/506HUcF6umq+RSToYwgoM9hZn4Cj5j4WQuHZAUKb5B674RRdkgJCaU6KMQE65G36q0ctyjzQVGNZEX4wPq8Nx33bhrJv41YEeFnI2/wC6q2O31Xe44MiqhAwEEWqn0WhIlh3knSvNbAqkFPuwm5XQABdphStWwsq4t6diXwpBDgZp+4FCcpT8qA+/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(186003)(44832011)(52116002)(6486002)(5660300002)(66556008)(6512007)(6506007)(4326008)(7416002)(2616005)(8936002)(8676002)(1076003)(2906002)(66946007)(83380400001)(508600001)(86362001)(316002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0+IjNLG/gBPchNwU2WNmIc/vyomVtLmRMtv1eyjkoChtj1YLt5h2Hn8MKrxJ?=
 =?us-ascii?Q?TRp59LbxOCEye32z5lc+Akz5el8nkQ21crgq8J5ZGA496jIdJ/V09OiqjE2x?=
 =?us-ascii?Q?+arNhqLlpTBWtF8D8eICFc9z7TeqlsmvlgrEmdAmTDlvzhYqs39L7Q67cJF/?=
 =?us-ascii?Q?1MGlmHYARD9PJgvOcC6oQSl659v0N6ZXKBlYlROHiFuDstEBnzO25V25xPKf?=
 =?us-ascii?Q?M16sCiPCbn/HSm+AQCzb+PnLheq8hGYd7ekgj3/0y6guzZQVoIwV17ArTA7K?=
 =?us-ascii?Q?ZJAa9yRohunHODK8P4a43HRvW0od2Moolk//yhBMlVDjdB6Uxsxew5JlI4gm?=
 =?us-ascii?Q?ab/Oz/V/5S7w/ZbQbGJuhn6vXprru+0s9MdumBnfHSdWuU7TJxJCopafLa86?=
 =?us-ascii?Q?JeAvaZNf5Ul1wC1WsZ9iFJqanAiPiU8RD4o5FBdf17nnt9x+tdN1WPAgtfrO?=
 =?us-ascii?Q?0HBjgqIb/bThZ6Vk8XbgK9QhvDOOpcfiojQ87Yl851GilkGxbKY1QPLxzSej?=
 =?us-ascii?Q?PTUTrVC61x/2vjYDEVyKyJxKY65eCsTIx7HpbleZw7SgPGaUZHqg9vTVAF3r?=
 =?us-ascii?Q?KG+qYnTVGst1PlsYjCEgp4ICwPfAkeSRRIfj3zWu36F9ZSAHJ9IwqrqgrWSi?=
 =?us-ascii?Q?B9P1qaMlswMjh/5yRo04asRCeq5X7ANk1PagZjf6wHq/14sgh3s2dT0c9UUO?=
 =?us-ascii?Q?OHRwtPIpynnH4ZRp2iDU10U7s6UFaFujeTljVP7xoP1oCgyJfIa1hEn8qNSK?=
 =?us-ascii?Q?sopDCTxw+c4LheOTk3f2Baty7SRecHktZtLTgfe2HJOd0Wqs5tWq43wJDKSB?=
 =?us-ascii?Q?7KtJ+w5pIMaohDwAMMUFHLTT/LRXajiQ3SSRQ9/cJxSkQULfeZCAWaQ4jlCq?=
 =?us-ascii?Q?z0PGNZ1QJ/kpy6qSyA2W3GimcpA1FwRscz9Qx1RbmoXddpyWyhc8RLZ2Xs8/?=
 =?us-ascii?Q?HjEaJqvJj8iOQS8rDPO4h1DxvXkd28Vpscnz0+q5v/4JTK1MjTf/7Xu9XBST?=
 =?us-ascii?Q?eMpNnONsIVSuWIY8JMjz6TmzIwh1rpfnVYtYnszHe3HiqP4tLQsxeAxgA2wT?=
 =?us-ascii?Q?In+MotBuRvIN3QQJX6s0dK4D+ZdbpluRkuvuw7Ui4PUDstv4Bf8H2GO192UW?=
 =?us-ascii?Q?bCRa5homGOKKYqhkWmZ2aF8IhEXSijHTlahJfYLXTnmIGKw/wowjH+SHwt3n?=
 =?us-ascii?Q?OREjArb9klEzYMDVWG/5H9FVHRVBrAui2TZOnvRkBnUzEeAMprH5Zr1LMAQk?=
 =?us-ascii?Q?cp4iYJxro44UQWFNUIq8sTgLilRv6Du1d2cv9zspWW7wU0B8KcH0xcD0SrAj?=
 =?us-ascii?Q?w9MFkmrWI/4ISo1LsLJb91cMfbEXSwnE/lqHtJp9virfrg/7AjyTiqgIpY20?=
 =?us-ascii?Q?ItzPDI7muY7wS6m8ub9Hj+mZwDkyjFDnntIjJFh+l2JoS/YNx6aWp/dmDBQq?=
 =?us-ascii?Q?npSqThI5KuCmg+DuBp0ZT3tc76Lp4W/l6nb3dBvcSbFnzdsJhDgTXa+4st6J?=
 =?us-ascii?Q?PSEFMI3/90qU9+o0gibasv4+dYLJFh7c3b8a1/qERCTzza9HsJga2X6+4m92?=
 =?us-ascii?Q?8wC28DW9NSzoJAz0JBiVIrA+yW7VKOhyjd8p/dh/Nx6a9NqmimigIyHGC/AB?=
 =?us-ascii?Q?wX7cc+SkW0XBPF0AiM3fY3AElb4SLncBg3EbRXUsBdPjOz3PEad+cIdSk4bX?=
 =?us-ascii?Q?EnLlpfFngABsouaiXyrph2xxd8Q=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8501f176-cd72-405f-36e0-08d9a9adff2c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:22.6649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3gBnH+ASvmxTJaMSB1yNKvA6sWXRX5P41ztAr25iE0eF50USzjItjayCi+PAs7YTRhB4HrZZEG2VXCmR61iEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3039
Cc: daniel.baluta@gmail.com, AjitKumar.Pandey@amd.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, Julian.Schroeder@amd.com,
 linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, daniel.baluta@nxp.com
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

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

We have moved legacy based machine struct into platform driver to
resolve module dependency with non-SOF ALSA build, hence removed
it from acp-config driver module.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/amd/acp-config.c  | 10 ----------
 sound/soc/amd/mach-config.h |  1 -
 2 files changed, 11 deletions(-)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index c9abbb46b6f5..1493d52c9290 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -68,14 +68,4 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[] = {
 };
 EXPORT_SYMBOL(snd_soc_acpi_amd_sof_machines);
 
-struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[] = {
-	{
-		.id = "AMDI1019",
-		.drv_name = "renoir-acp",
-		.pdata = (void *)&acp_quirk_data,
-	},
-	{},
-};
-EXPORT_SYMBOL(snd_soc_acpi_amd_acp_machines);
-
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index 608f1e199775..feb3756d9ac4 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -18,7 +18,6 @@
 #define ACP_PCI_DEV_ID			0x15E2
 
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[];
-extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[];
 
 struct config_entry {
 	u32 flags;
-- 
2.27.0

