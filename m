Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DBE45A4A2
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 15:10:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1652168D;
	Tue, 23 Nov 2021 15:09:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1652168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637676600;
	bh=dCX+uGdbpQ8tWYrHKk7w4kEbK30LKGVN/wnefIjHOTc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uVlV4Q5Y1/FCCWazX8TC+wITMpwqRJblnNtuSuPhjN7HG4MZ/GXCPBPkiqlzW5UdO
	 1lWrIJKzhyI7LIP8nvydLIWgODFkYamPxsBeUBq0PCk9Db2JvtP/Nv+vlSsDlhz5gK
	 hIZTdqRIPuDlKJLOlVQMwc3PZ5jNxIBJLW2W00+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1F65F80087;
	Tue, 23 Nov 2021 15:08:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 510B9F8049E; Tue, 23 Nov 2021 15:08:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D067DF800E7
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 15:08:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D067DF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="jxrfvKJ2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlhcIxgHbDnDBy82Z1JEPt+8+rR6naX6zS48PpL5XZPM4td7+GLXaQCH9ObP9nGk+1o3G+kxCCy3mFSlxUTB3duR/Eszt/Fb7p5U6xoucxuHF4d2CeGcD21EQoygq3QwlvDjx31YGjQ+ZooT4PQ0/Jts7hkcRsUbbR2Zeew7wBTulTFtHJHd3ZZTvITPSgqNuQ4tfe6EK04/nUIh4hxABjPwYUB6tHycWy6YncNAN3DPqiQAe334sHSyKPoToh6QbwJpa8lsHjNiKT0NJd8r6+mu5WFROKwVoQqiCRw2g8eZFAcGOFJSKyOHsp3Ku1CKEoV5RhIqq/AI1qifhH/PzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtAtEDbZjKim3rmtX8lxKLp/G0Xkhs2YL+72nKHHQ/s=;
 b=H4e05SmQ6RC7EycFQ+/xLXdv//CKVDK1IIh4f/k4U/PeWsf3KE1SGLoS+gVBF7LqqAqQN8hOiUmroxMaOxsqNHK86Y1wU2clyZFbjkGuqB2ozmUp/ErtSI1259KQO8Yz4qLDNXWIUQgxJTINDcGnkJbo1ikLwf7/jcwZ1Sbpmn+OInYaclrd0BTspUI70gsxMSOSZn6abvv4DmeP5JKSGBkwPQqbXIt/ghFRptbYqFrs/3oIxgPDA2mRdeMom3Gm9ynldDns/AigZuSfPGDy16dLAd/Xap6J11C1jaWQHeEn9ESohePG7GGcBpn+1O8p5rTGXA4uBGEp4LQjp99BbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtAtEDbZjKim3rmtX8lxKLp/G0Xkhs2YL+72nKHHQ/s=;
 b=jxrfvKJ2QKcETlHX9PJfvW3PAVRwhQvhcrS41ccAr5h7rxRtsYCurxk83xBjMtzMzkhh3yIFxZO40ubisZjXK8vFlGNmdEO8SbnYxcIh79ymLtUAQx/uVptBvXflPRr14mUrqE35ttcGqumbWrwd/J/WAf2LhJmD0yyNgbq5TS7Cd/4oCswH/WW0yXlmz4bvzpCtsMWzK30XeQ3mEJ8O2qZsWZCjlmn2bdQG2t6OsqtDe3UWw6DLyL/Z/KQgutWmoArfNc97gBnVh+xILux5+fKN34Jhwh41cVcZb2kAb3yVCZmUERFf58QGksA/cYKlOUNHqAGYwKvaHRY5QCcieQ==
Received: from MWHPR18CA0044.namprd18.prod.outlook.com (2603:10b6:320:31::30)
 by DM5PR12MB2582.namprd12.prod.outlook.com (2603:10b6:4:b5::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19; Tue, 23 Nov
 2021 14:08:04 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:31:cafe::ba) by MWHPR18CA0044.outlook.office365.com
 (2603:10b6:320:31::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Tue, 23 Nov 2021 14:08:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 14:08:03 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 14:08:03 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 06:08:00 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 1/6] ASoC: tegra: Balance runtime PM count
Date: Tue, 23 Nov 2021 19:37:34 +0530
Message-ID: <1637676459-31191-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637676459-31191-1-git-send-email-spujar@nvidia.com>
References: <1637676459-31191-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0805cfd1-82d4-47b9-102a-08d9ae8aaa6f
X-MS-TrafficTypeDiagnostic: DM5PR12MB2582:
X-Microsoft-Antispam-PRVS: <DM5PR12MB25824DC8C19D945ED7B8F0D5A7609@DM5PR12MB2582.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YJr8Ay0MD7RhMgPVCns4GXgybV9wMchGMh5Ly3k9dZG4OpNB1fxTWQ0jWfjUbudAQhVT9jpbmtP5vRlTCLkkdqY0Wm9BXaSvX1xgE5JO4nwYMfPiz4m0uaMwIqKYrHjDE/72RdwFtKjezrlzIOFsrQkIOXdVLSQOvkteQqQa3BrpP/yzvOW2Oy/ZkoGIxzvWlKQenCXBW1u6e7euW1ohceFxSDtL4g4Y0+SbgoN+8BCwCmy1ZjyqBpMKP4xnRKd8UaUz5pKtAY5ij936TnhnFYmxfOBw46B3EsmbZ70a/QCbc8fk1b6v1bvmglYvfC5XLW3KHXbBBgFGcPhjwacPI5NLKEsKu0Kift+W3fLtGCSIZdGHtnJ0SNPzEk3uPe5N9LeRPWGslde1Xm/cRLu6JR5zMZI1Ws5mUBTswD7WpGBEyA93VMVEokC1/RcokVoO+ZNLNhS4cqeR3FaQmkLmjRIhdSg9/AZ5Iu3vlrXadSXulQdggAi0oDckUJQkMRtdYS4XXiIpeEc1eRAv7zI1XRvcWOI2VfX5ZCCx0gNzHM/kAjbYgt0veRr3qcFv1EKHWVp0EGWfEiRvc07DksZQoVa/SEt7VISToIOhpJV5lBnfhdOrKOd4/xXV9k+uW7q988lCBpPkfUUsD9kgjzFAPpXm2ajcqsypGwmufl5KsbgU/RMwUHeu0tHTVLkxCRUPxVH19UB7/cnPcoCWjbw24g==
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(36756003)(47076005)(54906003)(83380400001)(8936002)(82310400004)(336012)(186003)(508600001)(2616005)(7636003)(26005)(70586007)(2906002)(70206006)(86362001)(7696005)(5660300002)(356005)(4326008)(110136005)(8676002)(6666004)(316002)(36860700001)(36906005)(426003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 14:08:03.6221 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0805cfd1-82d4-47b9-102a-08d9ae8aaa6f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2582
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

After successful application of volume/mute settings via mixer control
put calls, the control returns without balancing the runtime PM count.
This makes device to be always runtime active. Fix this by allowing
control to reach pm_runtime_put() call.

Fixes: e539891f9687 ("ASoC: tegra: Add Tegra210 based MVC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_mvc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index ae00570..c9859e1 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -164,7 +164,7 @@ static int tegra210_mvc_put_mute(struct snd_kcontrol *kcontrol,
 	if (err < 0)
 		goto end;
 
-	return 1;
+	err = 1;
 
 end:
 	pm_runtime_put(cmpnt->dev);
@@ -236,7 +236,7 @@ static int tegra210_mvc_put_vol(struct snd_kcontrol *kcontrol,
 			   TEGRA210_MVC_VOLUME_SWITCH_MASK,
 			   TEGRA210_MVC_VOLUME_SWITCH_TRIGGER);
 
-	return 1;
+	err = 1;
 
 end:
 	pm_runtime_put(cmpnt->dev);
-- 
2.7.4

