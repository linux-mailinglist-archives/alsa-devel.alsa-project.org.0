Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D72EB818672
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 12:33:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5824EE80;
	Tue, 19 Dec 2023 12:33:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5824EE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702985624;
	bh=o+Tvur/q0nfb60xbIr92lpdDHPJePbRMdQY6PUV7kTc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iaMoBgZ5w3wQcYPjiKmHv7YnkX0IDkcuOEmj5eD/Ag6jQeWVuxUg4ZQUjk/4217aJ
	 /jJozL4y3a3p1iXU7eU3BcXwSO3pA58Ku5vkZdYJx3SqkirOs5qdaUuDSBo1PR3TcL
	 LKRtXHxEkj5y+gvpZzW86JRcAA8zeW4G7Cu2Zrdg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0831F80617; Tue, 19 Dec 2023 12:32:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74056F80608;
	Tue, 19 Dec 2023 12:32:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A6F6F80557; Tue, 19 Dec 2023 12:25:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F00AEF800D2;
	Tue, 19 Dec 2023 12:25:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F00AEF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=f++hItl2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lg8q6tOKUtB5BNl6sBapQzcQ/S4TLYDl8YMOefdBbigDJ32XrOHxiMqqqxU3jEgxaUBYXH6qQewjCeW9ucXNsvZ+Itba2hvOiut4J24jqmOiJlr8AFgnFjcLabS/zybd67f9Ly1TwN6mGsPE2SReDM2IuWgT1Mfbng9sG3IqmcIKIOINDS6qmoXZk2T/Gpgtl0O5BKqIqS+GrpY3xsOHQkzH562mjowa4HGMlxVGtgdxj2CeNhjrI3uSjxzC6/dxMz4nqoparDXKWzv4mJz+zj0NhQdPakXJ1uyATn9/8DlI/BWwWGMg5uM9xM5fmUYzoDscYyoF60AijCShgla57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzX83JgePZ9kiLGXxJ8ZzTJZTphemMdcgbdFXqAf8/8=;
 b=Doii/DkUvdIHCdnP8cDOF04Gzbrwd8JPVG/O5cfEf2UUVU5qNRsGMkZulIMJ+ZDwQ31ar765+/YqUkRI+nzDMfv9TidQ2Nsu/yIgnmXN/owuuvlYhAqol1ofwxsyHm5pOY2KH/g9Jz6JqYvbO/SybJQJrUvIERFynllNoTlCu3YSPJRyAuW0PzFZ7QlSp+C1DyMbdKdczz/N1q9JBHRHz7ufUHcKsdgU/LdM70ln8A6aiDITEaX4EkO/emUh3UIPWTjarkfzpwXwEsrhQu3TWyLGrtbIenl4lO7Efh+tr/+1/dJ7DoRAWMa3nM/h+htMLwKvcqkU1xIJi6jG7oo9vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzX83JgePZ9kiLGXxJ8ZzTJZTphemMdcgbdFXqAf8/8=;
 b=f++hItl2MU11qp+ZgiBAh0A1nuraY1RSZAuHFf9GJFfnNNoJES6n6VsDLbNi+M9w0n/0J0Y9esGOfNrzr0G62VH8MK6TbX74EJMQYYb8vc9quEsq2CCoBt25IuIPQR/5KrZYtHmGdxqJ5MJtw8fBGxpCSWBh/fAW86Iy9zVNxYE=
Received: from CY5PR17CA0034.namprd17.prod.outlook.com (2603:10b6:930:12::19)
 by MN2PR12MB4486.namprd12.prod.outlook.com (2603:10b6:208:263::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 11:25:00 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:12:cafe::2e) by CY5PR17CA0034.outlook.office365.com
 (2603:10b6:930:12::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.39 via Frontend
 Transport; Tue, 19 Dec 2023 11:24:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Tue, 19 Dec 2023 11:24:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 05:24:48 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 05:24:48 -0600
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 19 Dec 2023 05:24:43 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>,
	<cristian.ciocaltea@collabora.com>, <emil.velikov@collabora.com>, "Venkata
 Prasad Potturu" <venkataprasad.potturu@amd.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mastan Katragadda
	<Mastan.Katragadda@amd.com>, V sujith kumar Reddy
	<Vsujithkumar.Reddy@amd.com>, "moderated list:SOUND - SOUND OPEN FIRMWARE
 (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>, "open list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/5] ASoC: SOF: amd: Add acp-psp mailbox interface for
 iram-dram fence register modification
Date: Tue, 19 Dec 2023 16:54:13 +0530
Message-ID: <20231219112416.3334928-5-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231219112416.3334928-1-venkataprasad.potturu@amd.com>
References: <20231219112416.3334928-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|MN2PR12MB4486:EE_
X-MS-Office365-Filtering-Correlation-Id: a841392c-3d98-438d-9328-08dc00852315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AKoNwYm6YA6IkPG5jd0gL9uF9yO4PnGx2/kMPIJNyJbNttZ34mrEzua8zifx/xqRyeipI1JQ9JYnWCzts3mnPFFkQRsbuMzfiEnxZr9UIUosj/O+9OzeSJO57EZ0ZhGYZf0RulQx2gzKVRzy4d9mnsrte09IsihGZtHk+Exp90HRKjxgXUDiLfHjHBwAdqrWRk66iVHJlv1RTHNdLz12JKMT+s6S2UVZhjGudrfHIaM9M8XF3MZFRgz8wGisJLu3YnbH2lIZZXWh9jGf8e0Z24HrsuowASv+CTiaEf1H/wmwmlPNW3/YohN8flKOSiH7x/B76EIEzLZMoN0Apa0QhPu+h2MWovZfU3vXkiEzvd5Gx28tweKD2gdU6ByNijEirAzzNOAdq0nE4o5hVOVXHAQMXizLTF7q8idZYtPv7wUZBdTSaRcfwl7qsgoYixwHLf66ThXWcGScY48jA/MgP8STVNrDPFtWLHUcN9ztAg7baACndBUXqwSZuvLb5fS4G2EZhH1Y0pLoWzVITkNe8XsCDwCh/3guttFWrd3hHHJ82Bey12QjFEmUuyVMvWZz9sGG/ew7dPOvNtMcVw32y3vZ4gr1AL3LlJYQ09ESgS8nwBrbMNbkouHlzJteEQAA86yJVdlSupBY9Z+irZZB+4EO2v0IVtIxUuVCDWbOoaIrfu5lYh/JlWAEpHM1lw1e300oPNhXwos3JZCPZUbCl7bUXAWKqKGRqaZVXArUoR0Jjzz/m2/PSIzzQcOoZbQ0xfjV66cwv7RHcY+HDvjwSQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(82310400011)(186009)(36840700001)(40470700004)(46966006)(40460700003)(336012)(426003)(83380400001)(47076005)(1076003)(478600001)(26005)(2616005)(36860700001)(41300700001)(15650500001)(8676002)(7416002)(4326008)(2906002)(70206006)(316002)(8936002)(7696005)(54906003)(5660300002)(6666004)(70586007)(36756003)(86362001)(81166007)(110136005)(356005)(82740400003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 11:24:52.7940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a841392c-3d98-438d-9328-08dc00852315
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4486
Message-ID-Hash: 7GEU2FWTW4ANGFYJARENTKRUSRX5FXB2
X-Message-ID-Hash: 7GEU2FWTW4ANGFYJARENTKRUSRX5FXB2
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7GEU2FWTW4ANGFYJARENTKRUSRX5FXB2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add acp-psp mailbox communication interface for iram-dram size
modification to notify psp.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/sof/amd/acp.c | 11 +++++++++++
 sound/soc/sof/amd/acp.h |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 7860724c4d2d..32a741fcb84f 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -278,6 +278,17 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 			return ret;
 	}
 
+	/* psp_send_cmd only required for vangogh platform (rev - 5) */
+	if (desc->rev == 5) {
+		/* Modify IRAM and DRAM size */
+		ret = psp_send_cmd(adata, MBOX_ACP_IRAM_DRAM_FENCE_COMMAND | IRAM_DRAM_FENCE_2);
+		if (ret)
+			return ret;
+		ret = psp_send_cmd(adata, MBOX_ACP_IRAM_DRAM_FENCE_COMMAND | MBOX_ISREADY_FLAG);
+		if (ret)
+			return ret;
+	}
+
 	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SHA_DSP_FW_QUALIFIER,
 					    fw_qualifier, fw_qualifier & DSP_FW_RUN_ENABLE,
 					    ACP_REG_POLL_INTERVAL, ACP_DMA_COMPLETE_TIMEOUT_US);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index c536cfde0e44..c645aee216fd 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -74,9 +74,14 @@
 #define MP0_C2PMSG_114_REG			0x3810AC8
 #define MP0_C2PMSG_73_REG			0x3810A24
 #define MBOX_ACP_SHA_DMA_COMMAND		0x70000
+#define MBOX_ACP_IRAM_DRAM_FENCE_COMMAND	0x80000
 #define MBOX_DELAY_US				1000
 #define MBOX_READY_MASK				0x80000000
 #define MBOX_STATUS_MASK			0xFFFF
+#define MBOX_ISREADY_FLAG			0x40000000
+#define IRAM_DRAM_FENCE_0			0X0
+#define IRAM_DRAM_FENCE_1			0X01
+#define IRAM_DRAM_FENCE_2			0X02
 
 #define BOX_SIZE_512				0x200
 #define BOX_SIZE_1024				0x400
-- 
2.25.1

