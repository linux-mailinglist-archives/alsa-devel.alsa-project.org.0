Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6111F3CA092
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 16:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D577E1692;
	Thu, 15 Jul 2021 16:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D577E1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626358899;
	bh=kxii7HBrS2TWn3gW54F/yahv/DjFUCxzFORQwp9dyZ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=buLKS97xUQ7xgYq6jeYkNcE5E4M5DiX0WdHnUGH3LY0tKDzsSuocuplzi52oExnAb
	 jjsnmCoALG7G/CDmwuKmMSYGftAnHwxkpgMrUyUfN363xCfGOFQYmSD6XMuUhVBqid
	 hIZlHqC+299+ob9NOdRAd4Yb5eG6XiOJXAxkPz3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BB67F804F3;
	Thu, 15 Jul 2021 16:18:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34042F804E2; Thu, 15 Jul 2021 16:18:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E14E9F804D2
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 16:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E14E9F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="fE7TEPdT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzNfuLSG+bS8AXjat70HPWxtSqYMagmhkuPR+e9bFiBCH/2eClUmIDR5Xy6ilIeB7pWyLnOSOFhH6VGqxQYrq16Njt0dwUECF2oTT3MxKRd4t0hjHz3qLaBzLpeZT4wfFg3keJ+FUK4d9iIw8WyYeS0Pn6ydYNJo5+q7qPZmdnGDOk5cTGeo5JNWt+7/BSPgLlIkD+uRrta6KuAHvdYQ8AMeFd/QReunT/DJy1WJudcccrfWEJiL5pDdGbXBy65G/Ekhp8s9UOzB60bsl3ig2XtDM+SDZ+rMmrM5bxbAtYIQoCuumYHYO8DvYlj48Mcxz2yTQY67X92zHqzmlJQ4vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qaVUTJnEddSUWxBN6fQN/A6ngW4XCyIyhenaY/Jo3w=;
 b=HpZ5MAio0LdRoBLcQvSHd+Gh1YDcMeK+ko3wudADF7lw810cJJhFORGbs1zRsCOkzwJPtEqyJFGBvgjBcSvDAo+uqZkcz+vcecA64+KZOzg6ARB55/6R5Bdxs4ErBb7ql3fnCKOWkYl2gfKfyA3A4leyvXk9ddtc2IPIeK6Vrn/yQd2HwcCqr7vqMpSoUBU7aHbl9hRA8f/wtBdMTiNLvrzuafJmJtBcXE0V2+ioU2Uqe6MwZ0A6UIgtG1aaEaw2CgMnRm9EKrrkqNR1CtWSlDcwE9PNJRA2HXp1IHjof44Y3m+p4sggxlGrJx2pGSgBnzK0wPu6znKCeLrRNvm4kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qaVUTJnEddSUWxBN6fQN/A6ngW4XCyIyhenaY/Jo3w=;
 b=fE7TEPdTxRKt7dPqgXTpDuNnF++DPd+p9fr/Aq7hTPDCSS/oXs7RjA7WrXpGyLiJg7doqZZw7JUZSOjjwwk3MEw06whmG/js+ocgJakzm+TtTUSDUIur1otBN/HYG90SymUGSudjqb4wQ7KEwj50PxUZ44NAFG2R30+tAlENbLU=
Authentication-Results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM0PR04MB4916.eurprd04.prod.outlook.com (2603:10a6:208:c4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 15 Jul
 2021 14:18:39 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::1105:2d9f:b790:4ec3]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::1105:2d9f:b790:4ec3%6]) with mapi id 15.20.4331.023; Thu, 15 Jul 2021
 14:18:39 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] ASoC: SOF: Introduce machine driver name
Date: Thu, 15 Jul 2021 17:18:01 +0300
Message-Id: <20210715141802.880911-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210715141802.880911-1-daniel.baluta@oss.nxp.com>
References: <20210715141802.880911-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0085.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::38) To AM0PR04MB5140.eurprd04.prod.outlook.com
 (2603:10a6:208:ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5503:9f00:58f1:af0b:2fd9:e70)
 by VI1P195CA0085.EURP195.PROD.OUTLOOK.COM (2603:10a6:802:59::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 14:18:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9e40c58-9f64-4f2d-45b3-08d9479b70d2
X-MS-TrafficTypeDiagnostic: AM0PR04MB4916:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4916EEF0E7D681C64E311EFFB8129@AM0PR04MB4916.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JOAl3yh6CCS+L19+IPAX4+t5mhz7HpyDitJ69XwSGgD+GUpnFHQ9Q4dUYwz+I2I3du4IilzMS0qMIsXne+ApFqsoTCbgX/VQqNC4TksRmWkEnHLI6isBAZHYXvelHx0ruzqGpcNHtEmrnJIaMGrMu+CXNpyhPw0TFUwu0xu9IOkNhMVz3GB6j0uqxtobXJvRnuAAS/S3gFKVo7oBUUGs1Jtze5B0hrX/IHTHi58KxfCAYaitXLpiX/rnv55BiDpeSZKt65DyMzdTbmNWgN93rNOK4GLEVO0Fgi173tN33tw+aN8RdeRHmw8IFD7xGzez5MyR81w8y1AiBnomH2R2g4fqWL5svsmQpCY7fouh1lzj4JTL/R8wyOtX/XGPlOV6YibFxAMoyeCqhtpBnbJprkniobIm+EbU8xgZcufdmPer2p+DrQftl9t1Cfi1nbyNHhy9coTAJkPxVx9w5c8pbJXoeLsmohx0e+YnXduHqiNXtJOTzgLctrSfPJJ/L3epvbOW/NuNMatPpZtfDzQ59Iv52AAOQTIlxYSwlV4yKb3Vr6X54T3ji1fOhUb89nO3HiR4PRcV9scf+OM85gbcWp0Zhf+SqV0C2aQN9cDQSIS0K0fTM60C0NxrvoZATfp8j4UDvFrM+G0MIOX7fXZaJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(6506007)(1076003)(66946007)(66556008)(478600001)(2906002)(4326008)(6512007)(38100700002)(52116002)(8936002)(86362001)(7416002)(66476007)(6666004)(6486002)(316002)(186003)(83380400001)(44832011)(5660300002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mIQgdsFwFxQaJh3SqAHOlbU846rGDlqcNN8HlXoHZkoh7s+mZYB9SuJv2XMV?=
 =?us-ascii?Q?MNCUgQSn1JiBJx8cm+cxq2hVUY7W9jSTnWmfEx2DshP/UcBAtlGLlRwkaSz7?=
 =?us-ascii?Q?Jmg5/vYKL2DHC+Qrz05SOozaI3NHaxwIxwAVFf0q8ODjs0bakyczj8Fpvj0S?=
 =?us-ascii?Q?arFsliTomes5iVQZkSixGfeoITbHjRIqeMfr0+Ex3T4wnQqBbcyuvzUvVMDI?=
 =?us-ascii?Q?JXc5CTOxx96DNkyDgB/wkT8cnJHB/4bkkASFdAXZ1Z4Tpqt44s9zY82ZwMP7?=
 =?us-ascii?Q?X6oMjBIijEZA69b8sO6zx3qOLxOu5PhBHNoJb+SGL9qg2fVSVImsEm+KE/rr?=
 =?us-ascii?Q?qW+Zbinivcs6LefNsfJFQZiwCG6dzpUZiMPtvZteFANl7By4vrHuBehA/jnX?=
 =?us-ascii?Q?ChdS5ZBRnJkjW7roLdHw1TBTnFwsCYC1HSklheebeADkBziHQ0xJsrqHRje4?=
 =?us-ascii?Q?owFAxKtQnqYmMZxGOsfUnpo57fvA6ccsretCLa95Hfx3vVBjf0FGtvLUKXCp?=
 =?us-ascii?Q?kTcpk7RyoOC9YOmMQT2/esQas8zYyGbUueWVpY6135rMBWqp9jsPFBdIqg8Q?=
 =?us-ascii?Q?qh/3Vn1gjdMaOKZRJD5oC5dPEkIRHNvdAsd0JkPR15MRY1A1CDNvN3/055mM?=
 =?us-ascii?Q?6WggEjxaiaR4iiy0e3wPkk0xUe6L6Td/XB67RN+oTw4Pst4PqBLGfW8ZeGwr?=
 =?us-ascii?Q?M4tJpYtjOTTxHONnxzejeLMzvWfOd7+MQzwFXqRykHNQOOeilQzPCeC5o1iq?=
 =?us-ascii?Q?DfPBsQafJ9H2ZfxgP5ZnGYY6dXnuCOVs9QHvJKkMUt61XmRip7TYiggf0fGz?=
 =?us-ascii?Q?UCH/vZm/L6IUQ6scYUs76SlgNrvdMgTZtzK3L6TW+hsPaqdbjZpPNPFvKYoA?=
 =?us-ascii?Q?RwYss/fQXJG0D/hUEVXWFeVdhFJX24gUDZV3ywtw7/lN/11XzdOedVzfb9DR?=
 =?us-ascii?Q?RLtm0xW7Pn/JwpAgh+y1HVf8uogpWdtjmLW8kXm954hkdPRJ/mYUF8cOVLIx?=
 =?us-ascii?Q?Dsbj50GTP7k77pHPN2umR753gDuFHZCfSZJT3MRubpKIW90/INZgNYq2z95n?=
 =?us-ascii?Q?oaIxIH2FZRFbhXcXtmi+jMIMjVPu3mYyha0uJ0pzKfEKXzd6EAtmGixebloN?=
 =?us-ascii?Q?yoNRdOtYQjzSx6SGeFMbqMr0YBEJv7ET/rbClfKFwL+IEXtVgneHtcRcQ01h?=
 =?us-ascii?Q?Awxa07FJBs8lXKL7qUns+QcDV4vsbhrn8vMxrK2L1GlzDscGvEEz1DY1AHbX?=
 =?us-ascii?Q?oYkJKqmzyWmYQyY0tTrD6vb3cgKdmB6ZtZRa0ekr2fC1T1oeMHZbx77Q36iv?=
 =?us-ascii?Q?caCizFn01nSe7BR67X6Ik+azc6/6d7C/EmFj5tSY/Pu9Ed/h78UXNODms0+W?=
 =?us-ascii?Q?WNRlkeqbC5r6y1mWvBxNoJkTE5C+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e40c58-9f64-4f2d-45b3-08d9479b70d2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 14:18:38.9526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUGLtiCPJ4lFyAkRy0nILBwJ3k1aG38JlbGOXUNgRbfpEfpfC+5u3U0E92gLVsLu/giumSSz2OaLWtdkBC/1Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4916
Cc: daniel.baluta@gmail.com, kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>
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

ACPI creates tables with information about the machine driver.
With DT there is no need for such tables because we can directly
get all the information needed from DT file.

This patch introduces machine driver property inside dsp node.

Notice that sof_pdata->machine_drv_name is the OF equivalent of
sof_pdata->machine (snd_soc_acpi_mach). We don't need more
information than machine_drv_name for OF platforms (for now).

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/sound/sof.h        | 1 +
 sound/soc/sof/pcm.c        | 5 ++++-
 sound/soc/sof/sof-audio.c  | 2 +-
 sound/soc/sof/sof-of-dev.c | 5 +++++
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 23b374311d16..191607945432 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -51,6 +51,7 @@ struct snd_sof_pdata {
 	/* machine */
 	struct platform_device *pdev_mach;
 	const struct snd_soc_acpi_mach *machine;
+	const char *machine_drv_name; /* machine driver name, set only for OF case */
 
 	void *hw_pdata;
 };
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 27244dc043ce..47def9240e7c 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -885,7 +885,10 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 	struct snd_sof_pdata *plat_data = sdev->pdata;
 	const char *drv_name;
 
-	drv_name = plat_data->machine->drv_name;
+	if (plat_data->machine)
+		drv_name = plat_data->machine->drv_name;
+	else
+		drv_name = plat_data->machine_drv_name;
 
 	pd->name = "sof-audio-component";
 	pd->probe = sof_pcm_probe;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 10aa0d8ea186..aebfa5150fa1 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -884,7 +884,7 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 
 		/* find machine */
 		snd_sof_machine_select(sdev);
-		if (sof_pdata->machine) {
+		if (sof_pdata->machine || sof_pdata->machine_drv_name) {
 			snd_sof_set_mach_params(sof_pdata->machine, sdev);
 			return 0;
 		}
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 770935191823..18bfe5b78966 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -78,6 +78,11 @@ int sof_of_parse(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = of_property_read_string(np, "machine-drv-name",
+				      &sof_pdata->machine_drv_name);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
-- 
2.27.0

