Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9302085F5C2
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 11:30:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07B58210;
	Thu, 22 Feb 2024 11:30:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07B58210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708597811;
	bh=YnMenzqefzuxxId75BosZ+Y2+RNDdJ30hMbo4rrkhm0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SvxMiSSyuRdvKpJhTGtCRr/SPEBR9KJ8Pai+5YnGu5dG9NdBElLwZawfAAqwWqZIz
	 hd8nOGDISKMSJLdOKi09GP/okv+nOy7GDZ0wyJTRYkpqo+SZ7kWxVQj7hV0I5aauxy
	 u8zQh8z0IFrmGLYEvYCKp3QhH1cYygxjswHr9VEI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C69FF805C6; Thu, 22 Feb 2024 11:29:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2167BF805CA;
	Thu, 22 Feb 2024 11:29:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50DDBF80496; Thu, 22 Feb 2024 11:27:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 624BEF800ED
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 11:27:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 624BEF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dcEBvBSr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMM+Mf4RZszctFOxV4qE/wgdYzt7KzybTMzGyzjmLPoc24USF2rUiuvvAOlCQF6q6I/K9E8S9Zx7zXnMAFQyT8GDPlEeyyrEaYSt17NS6e1SNbPdjsDsr/BQ+y9Hip3qztSCbYB2Iz8tYk9BN3Y7zS/GLDcAQfCOu1JtjBF9P6VzzpgfODDXvR5jMhBJFp5GXyyI51Mf/T2/fY/DoRwuuIGBo4RYHA6LLJ17gKfzjhDLe/QNVJic7zilvNIl2U90o+q9diyE/GeMD9miO4dWJlj01PksF4MuXJaMN9fWjInqG0k5TQnOmIb2STIM6G7ygnRQOq6uA2lqVAEezfuvuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iulyjs4a5ElTK+A9JbU6m+7CgVNUq5//HYRwrzYABbw=;
 b=W5ZmRVi801K6DTuAmnYJny7QX+kj85XNHT+Hpkig6kHe0oTvAdlc4idiHoY2NJDzp1gzDY/uCgEDnwp0hdaMmh3hjRQzwZF+QzzqmMunJqD2E1C/5ZWFiRjc94n052JAcxygdWsqnqmM8J0kG1Va0Rmrj0h4JMLMo8q7QEP8SSVNQGunYxUhFR2LHieatgobEt/duPQFocgr3c/ax28hApsHJX3J5HGsyXuFp+82viPToMD47O7gxX/o0GMNLWNR9LV8LCcvHy69WPeTjXqCj9Fr6Xup89xUhpwZiX7xc+uK2JU39gQu2GW9j15j8QeIRKXoGqaOtAMFGXGbycdY5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iulyjs4a5ElTK+A9JbU6m+7CgVNUq5//HYRwrzYABbw=;
 b=dcEBvBSrUnkbIZddR4YU9t86og/uCr2mYN1KzoivHKB5Zh2iuoUIUvApjHniovCiZin6BlfMBCpRkUz9ac3FG0G+w20T6q1KmWmiwrugEpaKlBAeDx23omcUznIrMQCFOrzE9YnGi4HwH/iA0VvnaR8tpp6Kq1W5BngWHaNj/e0=
Received: from MW4P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::7)
 by CH2PR12MB4118.namprd12.prod.outlook.com (2603:10b6:610:a4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Thu, 22 Feb
 2024 10:27:06 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:303:114:cafe::95) by MW4P222CA0002.outlook.office365.com
 (2603:10b6:303:114::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.43 via Frontend
 Transport; Thu, 22 Feb 2024 10:27:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 10:27:05 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 22 Feb
 2024 04:27:05 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 22 Feb
 2024 02:27:04 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Thu, 22 Feb 2024 04:27:01 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<arnd@arndb.de>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/2] ASoC: amd: ps: modify ACP register end address macro
Date: Thu, 22 Feb 2024 15:56:56 +0530
Message-ID: <20240222102656.631144-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222102656.631144-1-Vijendar.Mukunda@amd.com>
References: <20240222102656.631144-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|CH2PR12MB4118:EE_
X-MS-Office365-Filtering-Correlation-Id: b069cecf-dab7-493f-282c-08dc3390d166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E6mC5UiFfrJazwuneFLR+Gte6h2aCNtfBzhtqSmLLN0k2s5wlHFww0bA4XkfrvaAINzrVnJTe+oyDeLDB5zZl2V0vVupHAfa/K56NXEVXVLp8PyDCMf5ovvxvoA1lD4aqe6nWjUxPH8hGvMTGqB56STJRGVBGWMi+MYTU9/qRjOvfK6sMbAcQGNqzFsYZnEQ3d49xGiBFcr2Q4S4vY6qjnDN4EaoxHqXY/2+fROh6upidwwCJyE9SgsYWGSrYAWxRtpAV4yULK8s1sQWu/q52OzZIRfJNlJB/3wUFAlhEjTrP+OFjqTYUe44yiQ5TgCfdfYB8P84+KUH9tX+xJ8v73T3dxuonRiNDp28v+NKHsBo2iWylWueE3CFaXcbt+XY4hTVtJnB8KRL4wB5MSFy6T0bVRoVK+QPAszsIhMgi4pWD9QlJe1Ge8kcDAfLtIf7HJnOBu/rVXSzds2yiNoUVZFtAOA3OBtGHQmbAlg6GdLbNNbyzDF8RA40Awn5mFjUyXoyW4OmlFQ601bMAaSMirQE2prL/rZlFq9KnpuAa2ddqhrahEQStyyNk7qUaNAlry5b/ZwuRKIXLLfQUHS8CUlVNcTlv3PpbIkydsW/GGXu5qdb3qfH7Lw9BvlPuF/UrFHy8M+DOi55+abQx1jgA6oyMfccK4d6UVXLgH1wPRw=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 10:27:05.9801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b069cecf-dab7-493f-282c-08dc3390d166
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4118
Message-ID-Hash: X2H43YE5SKD662YQMP75G5224ALDALTM
X-Message-ID-Hash: X2H43YE5SKD662YQMP75G5224ALDALTM
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X2H43YE5SKD662YQMP75G5224ALDALTM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Modify ACP63_REG_END macro to access all ACP registers.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 65433184d03e..39208305dd6c 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -10,7 +10,7 @@
 
 #define ACP_DEVICE_ID 0x15E2
 #define ACP63_REG_START		0x1240000
-#define ACP63_REG_END		0x1250200
+#define ACP63_REG_END		0x125C000
 
 #define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
 #define ACP_PGFSM_CNTL_POWER_ON_MASK	1
-- 
2.34.1

