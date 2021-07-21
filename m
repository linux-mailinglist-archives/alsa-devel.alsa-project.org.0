Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A023D167B
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 20:38:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4FC916FC;
	Wed, 21 Jul 2021 20:37:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4FC916FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626892694;
	bh=ImXwcBeMACha2qluzLY3gg6k+TaJukKFpfpkhp0PJEY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t42Qfn4+Ox62W+IFJ6fI67TYnQ4t+47vdbU7MVcr2rEY2i98AC1gVeyV7IAMf3xJG
	 3Kr9IdUMMPaNGNtP1wntviMQA1biauPlbVuO/vBR48Y+9+y+EZ/urf3EG1gbtWSYb2
	 hnHnLeaJgyUGaD7SX1dgqWY4ZAqTO4EV/P0G3FFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6989CF804AF;
	Wed, 21 Jul 2021 20:36:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10EE0F804AD; Wed, 21 Jul 2021 20:36:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E2D4F800DA
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 20:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E2D4F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="YgEUn2kO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWgl4/GyJj8y9U3Exgeq7PXYgWLL91MylVyrjmo+XPQw1JttwwHUejoBtnhs8B9T+3ZvHl60gAdpQXSXjJrzga6S4eaGRdQ5KxVueHyDGXFxHbDpz48vGc5NbK8/zuTVCyS7H07RjZ9VJn1qJ10eUhg29OX2sODb/0z9lDc4NmkT7MauEgmdWlSak1C7phm5i86dVBBSbqftAUTaHpbBDrM/ZM7jSNg5HqjbItqn41DUo0mSmqK/fQnM+dhhVrgh5IhOsFOtQN7F5m3WZwxjBg+YvFzpbjmu/uaILhaSRzp9g8UwkENahmRo+eKtiXBEcGkWFWl8oWQXnT5Eldp+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIhGBYe5EjRBZ6zUoVCBOkjTLUonzqHCEvqjaT+DjC4=;
 b=Ap7b7+F2clVhrflESVjJwskGqA2rzLOk0tg5wx3sMdUCmOCPNNSnilqsI5iB9t9wvyJdGNlL51gGSOkwAZYlNzUkJSxOc2epNBMpM18Hj4lpjv8JbXIYATHeYNIw/XUhu22dVThwXy5mFECXB8k6Ef4hLJjJ7xynH4XEn34JrkaWF5wH8erSCUSJnp6l9uZouqfrsepiJsJCv1mMUII0mmGzew5/pOU/1UEBvgUo2/hLRcRVFjY6A5RLSWLirGokvwRFSLXEydJg0M9BNFa/Bir73iTLCyLJYjvJkZSgelZH7OADmuiWERwBuo47y3TpvlKH54KcwFvV5HNLYvn3IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIhGBYe5EjRBZ6zUoVCBOkjTLUonzqHCEvqjaT+DjC4=;
 b=YgEUn2kOCBcG33OXPg/gF7tZY+tKd1CZPXOpYUH5Fm+cI8iP6UBo3zqU0Xz1JQcG8ii1HRW+tZ5xESvEA24PiiLYrATKOVn4Sf5GBGHWA336D06ui6fhFYQbWLT4yjdwrrGkTR8rd14h6L2P9i4zm10e+8KucrTbnyArfMMj/eo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4559.namprd12.prod.outlook.com (2603:10b6:806:9e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 18:36:28 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861%7]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 18:36:28 +0000
From: Mario Limonciello <mario.limonciello@amd.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org (moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM...)
Subject: [PATCH v2] ASoC: amd: Don't show messages about deferred probing by
 default
Date: Wed, 21 Jul 2021 13:36:02 -0500
Message-Id: <20210721183603.747-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:303:8c::21) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (165.204.77.1) by
 MW4PR03CA0136.namprd03.prod.outlook.com (2603:10b6:303:8c::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 21 Jul 2021 18:36:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83a49e56-e1d1-4223-8565-08d94c7673b3
X-MS-TrafficTypeDiagnostic: SA0PR12MB4559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45596E60375E9475D51DF874E2E39@SA0PR12MB4559.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kzl8YpwkucCOn7Be8x3WCemaQoTCJQrX9WFCEskVbrfz89zlqdvFZuc9pBrFjJV5L9xP3E3egyLAJ7LIHw05NL5rTwrdCGvkFzCdJ1u2WzCIcZM32AtBGEhlaxtoV1cGLDlqyWCmazEvnzYDYP4cug2ueE0iFYsaTEK1cPhEhOewwHQ3XIg1tOQ2qqelD5DYbyMfLCpGVtE5aaNJ+tibjKe+iA2bmgnMMBEvEDX1pmk2eFnSR97PElj3egMMapqP1dmzAoMrCagp1fkRWSbNEfNWkut3IV2bJWd+97nqXPG+tX4XGvClJFy1/1FQNQaeS7QKvA4NNz8LYvnpW9JlB1jbgHhfQtQtJhXatydBfrB7whZ45OhUMuzXoeFz9BbgX444uWZa/KQZ/DztX0QaAuUud1Ma5UYZ0FCPszXKc2YpbAeihXQgJP3sf5jerh7eGxRNpbMfaPuaLze8gSpPEapPcTA9K81ZRjdLc3LUZEsWX2DfwOOSM7RdN4wECY8VTiJCxnNaiTiXBbOcNeZ01O43qgSbT8LXXRFX1Mka22UrPemu7vX/vDp5HoUJkH3cS2arLQJi1YCxGomF9tl1qIEQQQF6yC2dULN/DrRbqPKYBay3PWx8nmZYwVJhFA/d2ZbQrMSkOHeRSlS8FRnm2MSKIhmwvZcq6tgsNLsyPiDvsWpmq6Ofg5wKEkGl51c5oZ/ky/hog9CWgnKxKvMX8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4510.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(54906003)(110136005)(6666004)(38350700002)(38100700002)(316002)(36756003)(52116002)(66946007)(2906002)(2616005)(86362001)(44832011)(8936002)(956004)(6486002)(15650500001)(66476007)(8676002)(66556008)(7696005)(186003)(1076003)(26005)(83380400001)(5660300002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u9LtgS851tWGLAbt9QDpNVAuNrZ7hIJRuq9v29mkJ6MGKc+2bTAB4TZHAbDq?=
 =?us-ascii?Q?zTedNlm5RlGfbM9payN8rBC/Vy8styOqbi/6QF8Hk/easKLpcaaff2c595i5?=
 =?us-ascii?Q?O74YPEHxXbnik5AqPjIX97y4YvvrtbRQpJM43/8L+OoR85nXU9yQk1epT1/f?=
 =?us-ascii?Q?4NVmyqsXDDWCywx9xlTXsekGAGhDT2hMq91dfsnI7LspUvWRjC/MO5JDcVja?=
 =?us-ascii?Q?mvZWZ1E8QxmXDhV1iNi1gTdvFIpk9T3iihyE83rtkOLoC02R7ccgBDYz5X9Y?=
 =?us-ascii?Q?GTHqmvGbko/kxkpuk2gHE03JwjA5Wc3gK0cwGi5WiwlCzejXmJWr/F8Toq/f?=
 =?us-ascii?Q?8KN1T47XJuvpp49R9+YMK+yNAY7JbCdHDlSUvd6ZIgAh4KHBM0s0UIM1fn6E?=
 =?us-ascii?Q?QutCkXNeOM5UhLAqI0Bs/0hqfSBNXAzD8sJUqFDhws5EYHLX8rVa05MWbNBm?=
 =?us-ascii?Q?QB//cHUVJPSFnXozwhPIkmK4nms2WWmkJorlSyO193qH4ydfbjETfZWIOC3z?=
 =?us-ascii?Q?PAKbo6HXfv0peU3uVYbjw7YGUJiZBvnymX3Hbge21V20uvxvhWEH/oqkfdJ+?=
 =?us-ascii?Q?UgyOAraddEDEPMRlPVUhWO4g9NKvBY+jtFbHrY28Zx4qUa0BmR/rxW+90f8L?=
 =?us-ascii?Q?gKdqdT0SNJZUUqF8hEruUBj6pHan6L88V1HtfSsuTJBfndOHS1/oY/wxvrCF?=
 =?us-ascii?Q?5qqv2Ug62PBrhDy1FM0uprTJw5TOcmBuz7QgYmnT5cJGsJVmYeMndhYibW/P?=
 =?us-ascii?Q?Ch6I8/3gpEf0seGdwubTPAmV0DOjRWA1+ZbZZwjiH4EImDKOd0mvr86sj07o?=
 =?us-ascii?Q?ubisp5Iagn6dFkYC+OZacWlRGfL+3TWsc1cZhsXtFMkvelllL7fBEbmZNz1W?=
 =?us-ascii?Q?XeOUHARwUDgg+yO00mIeIprEReiOI0g4C0ytwl9izViOEs9w77yepLoSgbSv?=
 =?us-ascii?Q?J+VB7mZ/besrsib9OlFm1hEbQpRhUac0s0JNKaVCGriCpdOamn6J2ziA3b8e?=
 =?us-ascii?Q?tye77+0oZ5FUSQwNElZ31TgPH5k/Qwcj/+tRSDEm9oftxW5IX5wUqgL4+Xcj?=
 =?us-ascii?Q?JGhad4xRv9/wIpwxDAEFSIK/fhVU23ChQWfIdJNiba+6L0Hx+ghUt0FitxVa?=
 =?us-ascii?Q?ya9eGkLPZsZzNzB8wjjL2T0DUWaPW1dX/EOdE42vsoVEASK+zct7Zy9OuAu5?=
 =?us-ascii?Q?r4bFGLiL1a+maXuDlLrDcdmm7VrAtFQVmbhO4aoR5AAWlgcNhyl/LgAmDS3C?=
 =?us-ascii?Q?s+rc0kcMkaxdmGzYUJDhQCZEe3TPyn7mz3uOYMug8yDFIMy/nTVbqwaPgb15?=
 =?us-ascii?Q?OJPvjoGRa18pBrHMV4R+o1Yn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a49e56-e1d1-4223-8565-08d94c7673b3
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 18:36:28.2653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bABr0o2NQXRNsBqvl2DMYDld+7AFbCawcb/VfipJkOximVnB6G1cCtst9hIKkRLIecEavgXnJWW/KbuzhYlH9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4559
Cc: markpearson@lenovo.com, Mario Limonciello <mario.limonciello@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Nearly every boot with a Lenovo P14s is showing
acp_pdm_mach acp_pdm_mach.0: snd_soc_register_card(acp) failed: -517

This isn't useful to a user, especially as probing will run again.
Downgrade the message to debug, and only show errors.

CC: markpearson@lenovo.com
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/amd/renoir/acp3x-rn.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

Changes from v1->v2:
 * Simplify down to one return line.

diff --git a/sound/soc/amd/renoir/acp3x-rn.c b/sound/soc/amd/renoir/acp3x-rn.c
index 306134b89a82..ed73da496744 100644
--- a/sound/soc/amd/renoir/acp3x-rn.c
+++ b/sound/soc/amd/renoir/acp3x-rn.c
@@ -54,12 +54,16 @@ static int acp_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, machine);
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev,
-			"snd_soc_register_card(%s) failed: %d\n",
-			acp_card.name, ret);
-		return ret;
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"snd_soc_register_card(%s) failed: %d\n",
+				card->name, ret);
+		else
+			dev_dbg(&pdev->dev,
+				"snd_soc_register_card(%s) probe deferred: %d\n",
+				card->name, ret);
 	}
-	return 0;
+	return ret;
 }
 
 static struct platform_driver acp_mach_driver = {
-- 
2.25.1

