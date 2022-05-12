Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B72F3525171
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 17:41:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E2C01AC8;
	Thu, 12 May 2022 17:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E2C01AC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652370105;
	bh=APA1m64s5LMMNvD9DkllwSr6rFqbV9XSVQgyyAIS2Fs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xa52enaRvdnrT0gNexLxbRMhtOJgDasoxfaYKt9VAvYdxWZvsenTPPEZjzC4OKlRt
	 cdZbBI5FENPLT995R2h7ggWorSSRKcDcX8LNpBqnzE/V8QEeW/4WewpR/RhfLJYcmT
	 064g7lz739KyV3ZlOboS9hjdVoWu+ejFrTWtkRQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF4A6F80245;
	Thu, 12 May 2022 17:40:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F323BF80245; Thu, 12 May 2022 17:40:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::625])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EB49F8011C
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 17:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EB49F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="AR24s6Ef"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQLQl+rDFhmNmahC1LTzxe6xdgtpqSIavsE9zeenqLqpgl3Gnz/Nki9DPVYti8iGePkxh4l/PzI0Z9Ugk95F8yBtOJZV6gj1w/Q899rTIpdrApcllJipWBS7OxBTZeA4PapQneP2QWS37nFF3X8xDFe+FUPiEf6ZoNchYScr+5L77g7wsxdMQmdCdBXsgmeefkYM+HIPOKRgflWFjESnHfbJB5g2208BHhLcBtzQxlVCz6y+Kfo52FYUnLUx7/vZEUKj+ZXk0tafmCpUOjWwyDSx0VmI6DOrdEq6VadXUZXbCUV6XLgH8VJO83EsV4sjEiyVf0Sboxpc8LemP5AR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9A/shCSgbst7YLO/nYg9WcK5qNgMin77c0wP86Fsew=;
 b=iPv18ZyOltwyx1ch0t7KddTawPyVxUJ5t9npDKh9p6NrFRSbxVLtA2D+7gpehYB4A9aB3Pvlxb8Dv3fBPJpBl7dkBGClm83yQGh04ENhDquNr9i9lBJ0L5pq5zi6k31bW/LnoQEUVjlBW5NHOx1GgBcW7r1sk8FNPZn++Te4EDN3GAMPLncIxmhKMKGNnpYfsTcjCdnOCcfbo5HAXZvpsz8c5B75+erxruCiV9ffoNtE4KPWBjFavWg6tzTa5usbbO2VVO7nBgwoeo7D07ZdXzy++lrniHt12r9IOGtOx1ERbYuYkSGNies7MBov8eFR5AvrPnKWnPlkniGhV2ki5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9A/shCSgbst7YLO/nYg9WcK5qNgMin77c0wP86Fsew=;
 b=AR24s6Ef9HU8ysZDMoTDiMMc296+ppA9RnxH6P2yFgMm3lIJtpReQc9DqO+1b7b9BFtsh9e21MOZMgZWjbvcnukdTG2DF+AoPziLWzlBJPjgJzgaLxIW90nbcphp3pR5385PUtBL10YNnMjJWqYqYR3k2gjoyJp0y8QcTqa4d7k=
Received: from DM6PR01CA0026.prod.exchangelabs.com (2603:10b6:5:296::31) by
 BYAPR12MB2935.namprd12.prod.outlook.com (2603:10b6:a03:131::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 12 May
 2022 15:40:32 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:296:cafe::9c) by DM6PR01CA0026.outlook.office365.com
 (2603:10b6:5:296::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Thu, 12 May 2022 15:40:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 15:40:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 12 May
 2022 10:40:31 -0500
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.24
 via Frontend Transport; Thu, 12 May 2022 10:40:29 -0500
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 1/2] Revert "ASoC: amd: acp: Set gpio_spkr_en to None for max
 speaker amplifer in machine driver"
Date: Thu, 12 May 2022 21:10:22 +0530
Message-ID: <20220512154023.1185311-1-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f8947a9-2aa8-4cbe-0b78-08da342dbfbd
X-MS-TrafficTypeDiagnostic: BYAPR12MB2935:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2935D62A72EA2E4AA0DCF58B92CB9@BYAPR12MB2935.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gnlrq1zz/9LDlnNfzCVKaRaG0N3ss931lEmXrxJ7mg6/ohXk6X8d3epCjtxxtVt4H8MmIHn+k9jJXgDox93tzV7UrhG3UE5d/lbOLNV/DeAeDN/BtO3tdsUMZLdMBmHlt3vpAvNE7NaDXe76AzqRcF8cKQ+/qPQps2B1SFJyaGpkknDRpw2JyXxyh7lp5zJ9F7992nTngrKm5EGZ6QKiOo+ti1G6DOJ4sEq89qsivnfiRuCCBL6IuVBPfM02/VfhL2E5no1r42hJUxeuC80/pq/M4M4DBCZ8jb7urFfUY2LQQJmDxFmTypBMvkOO077ZYmZ2ilxDVpaZ84HPSDG976q7/SzuFThwvSgOQIUXMEW35to8J4wImUFZdc22Zn3DI5X+qAAJrPWYBRFc3RPHLc9liLkJSJKr6tCDbtsjeZxPvR19OdsbiV36skC/gm04X9u+cTaMfq27tvWOkMHNBxBf9p3LxvR+r+dsAW6kEXD4mn9MaLOaB+jWr64ezhaf4Sk+Wm15Ege1+Sl/mHMSIiR0RmQLL9Gf+6q3xTihiShy2NdHvbfp63gnDyoNosINy1nqa0MW+IqvP6WQOgiS6xJm9YJI4jF2enB7WAI9Sg6J/vX70JzFE3UHAxRf879P6/2bq8OTAMSdkC7vhumlSq1H8dqKmTL8LIIWZIdubbGbnlXF+ONxiaHvkAYeBGRrvjnTG2B4zGwRGweOl49VYlkrVyyNxjNQ6/Ki5SPb1UDKPpCr83/G7N++kLs8hFn3
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(316002)(5660300002)(8676002)(70206006)(86362001)(508600001)(8936002)(70586007)(40460700003)(36756003)(336012)(4326008)(426003)(26005)(83380400001)(47076005)(36860700001)(6666004)(1076003)(356005)(2906002)(81166007)(2616005)(82310400005)(54906003)(110136005)(186003)(7696005)(461764006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 15:40:32.0419 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8947a9-2aa8-4cbe-0b78-08da342dbfbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2935
Cc: V sujith kumar
 Reddy <Vsujithkumar.Reddy@amd.com>, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 Vijendar.Mukunda@amd.com
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

RT1019 codec has two ways of controlling the en_spkr.
one way is controlling through gpio pin method the another way is through codec register update.

Now Speaker enable/disable is controlled  through register update in BIOS.
So this patch reverse gpio logic, which is no longer in use.

This reverts commit 7fa5c33d043160eba3be9fb8e21588dff2a467c7.

Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
---
 sound/soc/amd/acp/acp-mach.h     | 1 +
 sound/soc/amd/acp/acp-sof-mach.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index c855f50d6b34..fd6299844ebe 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -21,6 +21,7 @@
 #include <linux/gpio/consumer.h>
 
 #define EN_SPKR_GPIO_GB                0x11F
+#define EN_SPKR_GPIO_NK                0x146
 #define EN_SPKR_GPIO_NONE      -EINVAL
 
 enum be_id {
diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index bf61a1726f0e..8243765d490f 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -37,7 +37,7 @@ static struct acp_card_drvdata sof_rt5682_max_data = {
 	.hs_codec_id = RT5682,
 	.amp_codec_id = MAX98360A,
 	.dmic_codec_id = DMIC,
-	.gpio_spkr_en = EN_SPKR_GPIO_NONE,
+	.gpio_spkr_en = EN_SPKR_GPIO_NK,
 };
 
 static struct acp_card_drvdata sof_rt5682s_rt1019_data = {
@@ -56,7 +56,7 @@ static struct acp_card_drvdata sof_rt5682s_max_data = {
 	.hs_codec_id = RT5682S,
 	.amp_codec_id = MAX98360A,
 	.dmic_codec_id = DMIC,
-	.gpio_spkr_en = EN_SPKR_GPIO_NONE,
+	.gpio_spkr_en = EN_SPKR_GPIO_NK,
 };
 
 static const struct snd_kcontrol_new acp_controls[] = {
-- 
2.25.1

