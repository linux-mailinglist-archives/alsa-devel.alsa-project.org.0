Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBD2683597
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 19:48:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC4E51F4;
	Tue, 31 Jan 2023 19:48:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC4E51F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675190933;
	bh=DloRz2y0bMEvM06on3C1wHyCZSZhB9corbwgfoBAQFw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=X/a8Yy5f+35TS31kP/efHcfY+czwXvzNX9z+H7PguCvxTANOOXEFY5Juw6gFQBwDE
	 jBvHNI5hRSjPfC5RLZJzD7nhD666fsH98DJxW0/Nv90WehRVmADq3hEQIi3/gGkmOo
	 i3O4WDnTRy1PGh/aaqxM+yN8Y7iYI0IkfCfhTLbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 834BAF8053D;
	Tue, 31 Jan 2023 19:47:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB70BF80543; Tue, 31 Jan 2023 19:47:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::61d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7648EF800A7
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 19:47:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7648EF800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=iNQ2kNqz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKkmcKW2AQa4JIRSSeS8RFYvaQJltPdP4aY/a0ez1NIlP5Cfv7sD3tDjvG7qm8aCAs/xx7xkaiYzAlJI+QLXY6+RrFpPwdmlxfqYoJkeIr/Vlyock9mvhWQoQiAaNMNTsUS+CLjgurdUfdgMYMrXO2s9ry5GF3O6LZNX26sbQH1AQYRRC4EqLAOS8bPSQMpMvLWR84Ua96ilCOi3Vz8dkgQh8RWcSkneu7JEZLZOLwfAceXt2zoS7x7CTamXT7PrTtAVIizx0h4xi9mECkeiRsiYzEzcJNH00f2hlqKU24rEbRzoxsEXDCx2BcQQ6bGCZS8b+m742pOFAzQT9jhKNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aKmvnOZr7+ZbKfC741aJVN4sW9FPDgnJEvlymWjFz8=;
 b=TkMdGWg0SpRECfgz3I5VDkqK56jjrtLJPIiEGhTK2IY8ZYfRSoqz/No6U3CCT1CqL+ez8pLz4TVQeCKKON8UQ8cO/LfyIvknTfwjCqoKXuzrWdR+II53pjtj73FtsI0GG21l+OOFQG3alEEYsC2co8VMNIB0FKDTa1GJI8vNk0Pr/oFwga8z9psDR3QE133cwOvBqZRmZp429Yda+wxsXYA4MqmDcnx3QImz0bRZFnYDz0HfOcRpy7h73PY6LBDHHPnH1a3dwShnQpoHu6i1Uk8El/Fy4gCa1YAS3XHK7BaTstTUOWC+CPjzt1ShqpkiO75wX0JXxmvufzLSXlx+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aKmvnOZr7+ZbKfC741aJVN4sW9FPDgnJEvlymWjFz8=;
 b=iNQ2kNqzbplCLg2Vdy+b2OC3FJB6KTDHenTKKp4zNPRwws3A7Uvpm8wdINKGKGhtBjSvIuLO6LWrgU5XWecCLGGkXRzSC6TRtynqz1jFw2SHQIu90ckVWrOjg8x8Js7TwDkl18UY8XtjMdC1ugWH0mtO6zAsQ3pxXFF1G4k5sQo=
Received: from BN9P222CA0019.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::24)
 by DM4PR12MB5200.namprd12.prod.outlook.com (2603:10b6:5:397::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 18:47:07 +0000
Received: from BL02EPF0000C403.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::1c) by BN9P222CA0019.outlook.office365.com
 (2603:10b6:408:10c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Tue, 31 Jan 2023 18:47:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C403.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.17 via Frontend Transport; Tue, 31 Jan 2023 18:47:07 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 12:47:06 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Jaroslav Kysela <jkysela@redhat.com>, Mukunda Vijendar
 <Vijendar.Mukunda@amd.com>, Saba Kareem Syed <Syed.SabaKareem@amd.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/6] ASoC: amd: yc: Adjust the gain for PDM DMIC
Date: Tue, 31 Jan 2023 12:46:47 -0600
Message-ID: <20230131184653.10216-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230131184653.10216-1-mario.limonciello@amd.com>
References: <20230131184653.10216-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C403:EE_|DM4PR12MB5200:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f10f85-6860-46c3-417c-08db03bb8de9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: syT24L7mFKtpSpxssJMomJ5Qc/oD2s1WOLedcb5aifty6pFR7XGea1A2L+NKxKp7HCSd5p+kThifAeaOmJj/CmTRVh6n6lJuQHdLP7YSxim8nw98IQmfBoQmELBNCUIDTuZvDc4OABEzxFGQ59WGzAtvcaOZ0GVbdqex83BmnAmvgFwMU7Ig9pi68Q7aRE+dXpykMgPD4fTrx3nWtaNA6Ck8QawWbqbCc+pI1d5lzjOMwkdQ+SpsFIvLCVi45L9H7zurQ8m+FTYKFulShlOvnzHkn0TCLlwUvQM81kovgSwsatP+C3EEasYWe6W4ZICgbbsk/Am34IWJ9LTvVyZlycFu3kC/cqWnfL99wcyYBCoteK8vZTmyV6Silm20dYNtyUO2lyWoE/ZZNe1UqCoDWIcnGS4GEXeKCsotJ9V8MibINQ/ZVbMHhdaRzXrSiOlHg1eHfnVQAcs8CXdg56ABtR9/UAqQ0FvFr7oAB6Zzu6Zb9hX6K3HLnWI3k/2esRKL/mhqkMMNZN9VzwhDlyCz6vh1dlGpBr+g66kXeh74IGBb43S4WxHHGOS5g2DlKiQ4681/9PxNIYSNdfh3MD1KGUWLU97LnTbBZ1ZbomMRAEmITMmFA6h4zu9lR588056JEURgofQpUT4IadJ2RjkP6PzjQfPGCQ8o0Gb4oQSfS4AS7A/D9D77uN7yIiLU7fYcxezhL5aOe5JMez0UWShHEKfuVMGrGX216Mn9PNnU0es=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199018)(40470700004)(36840700001)(46966006)(8936002)(16526019)(336012)(2616005)(2906002)(186003)(1076003)(6666004)(26005)(40460700003)(41300700001)(4326008)(36756003)(70206006)(8676002)(5660300002)(4744005)(40480700001)(70586007)(86362001)(82310400005)(316002)(426003)(36860700001)(47076005)(7696005)(54906003)(478600001)(110136005)(44832011)(356005)(81166007)(82740400003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 18:47:07.7230 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f10f85-6860-46c3-417c-08db03bb8de9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C403.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5200
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org,
 Pananchikkal Renjith <Renjith.Pananchikkal@amd.com>,
 Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mark Pearson <mpearson@lenovo.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A number of users for Lenovo Rembrandt based laptops are
reporting that the microphone is too quiet relative to
Windows with a dual boot.

Increase the PDM gain to overcome this problem.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/amd/yc/acp6x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x.h b/sound/soc/amd/yc/acp6x.h
index 74b596e6807ad..846ca10e24d3f 100644
--- a/sound/soc/amd/yc/acp6x.h
+++ b/sound/soc/amd/yc/acp6x.h
@@ -31,7 +31,7 @@
 #define ACP_ERROR_STAT	29
 #define PDM_DECIMATION_FACTOR	2
 #define ACP_PDM_CLK_FREQ_MASK	7
-#define ACP_WOV_MISC_CTRL_MASK	0x10
+#define ACP_WOV_MISC_CTRL_MASK	0x18
 #define ACP_PDM_ENABLE		1
 #define ACP_PDM_DISABLE		0
 #define ACP_PDM_DMA_EN_STATUS	2
-- 
2.34.1

