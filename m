Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F87F74B07A
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 14:10:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48B4784A;
	Fri,  7 Jul 2023 14:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48B4784A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688731803;
	bh=QsAYhwLrPHrrOxjVVceomW3bqICMUVOZzBv6bLIHRW4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EKnJUpDjTrZiwyDVzRgdtqakpZbwkkbF62Phe2UyZLLKYDupzRBZ+of7QyslzaDXI
	 a79h/q0QnLgVsYTZ3zTR78f6Feaz47Sd/G2YZHjYj4T+bOOSXR5WDb/fjqwJB53GaP
	 zBDHZFL+iGMNm3AmyUNMI70HCPgMrJ9NRGHJq524=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8DA3F80124; Fri,  7 Jul 2023 14:08:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FEC1F8058C;
	Fri,  7 Jul 2023 14:08:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17FD8F8059F; Fri,  7 Jul 2023 14:08:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DA7BF8058C
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 14:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DA7BF8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wUG+hcFE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZ5llYbATF2kBRHBSxfdgYQo2pTnWvLai2aI61T3yH9aFcCxcy1EWWBgQGzUUr7HPZPT9Men78YGXYMZggWVlB6lWUwamrqkQMs8DA8yxe9tpImajjTfrgNLkQda6/4VWb5POfNAuCxu2Is6vPJ79WVsJh7GTBztUb5IJULrrhcVIcvfyQwnOOeA9EPO/hZoe4PWVpYZhbnCVCdMJuEnlWJCzLb0SZumFHHRYAbCEMpTyfUI+yVW61I78mIfB67XIOq+bD+A9kARSmFJ2Qw81XU30dhl7CxS3e7+Ds4kGRZUSlZwaGchwtSTNbNCkP20VFbT3rU0xxYCkJzyGQmoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzDNMqHIO6N9sjf2jUWkjtjZrLFx1DR2BU84ssyzPoA=;
 b=R1Soc1f7O5A8jsldNt9mchxEQPx9WsuA94E4yH2auZmH+b9om2R3LqD+r8ZEhCKoPLMzojrHsLUS0AX8ssi5g9q1wkeVKZ5/5ODMDIxwQmM1xN2wlGeia+UVIeK7zrkw3KoVY3SvREsKyCAUoF/pyQJuE1L/cEJ3oPNjKZsoEuw/LYTiuWMzNIojGskk69L2hVlJgVXptl2M1IOrLyu1/2mxplZ/Up3TmXpqIZSxTVslIJ8qvXcgtv57sOb9am8gh5G0eQlXOu71/5PQRwQpPzj8tMkqb8lgQQJ2RhnAELKOt5hj36fdVyjizMwuwf/f/iGgW9UDd9TTc9cgimFW0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzDNMqHIO6N9sjf2jUWkjtjZrLFx1DR2BU84ssyzPoA=;
 b=wUG+hcFEzKxNidqHYiZ3giJOB+h20H0EZELBWdlfosCRaVlKC3Ukh4C7NiKa8RMdbvRgCjGhXlmDBo+SYTR7KwIxFAo2WIioHMHZxkkItHUZOcTgRzYr+R59inpqUoCkPrr55cep/6sehzJ9xqCYPtb9S6yB1PCcZV98YHIzpsk=
Received: from SJ0PR03CA0182.namprd03.prod.outlook.com (2603:10b6:a03:2ef::7)
 by MN0PR12MB5836.namprd12.prod.outlook.com (2603:10b6:208:37b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 7 Jul
 2023 12:08:16 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:2ef:cafe::e7) by SJ0PR03CA0182.outlook.office365.com
 (2603:10b6:a03:2ef::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24 via Frontend
 Transport; Fri, 7 Jul 2023 12:08:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Fri, 7 Jul 2023 12:08:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 7 Jul
 2023 07:08:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 7 Jul
 2023 07:08:12 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Fri, 7 Jul 2023 07:08:08 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <vsujithkumar.reddy@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, <mastan.katragadda@amd.com>,
	<arungopal.kondaveeti@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] ASoC: amd: Add new dmi entries to config entry
Date: Fri, 7 Jul 2023 17:37:30 +0530
Message-ID: <20230707120730.1948445-5-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230707120730.1948445-1-venkataprasad.potturu@amd.com>
References: <20230707120730.1948445-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT005:EE_|MN0PR12MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: 443abc46-ef26-479e-cfb8-08db7ee2d7b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dsk3sb7QJBGHUbDLAfxL+Q2yRyeoXmtHbVCx24g8/Z3Szn9g0LgtB6q7OHaJGgDJmi5M7GGaOPZpzrhfpFd7u/owFvdTG3RPmoDNJs9ggiAXtMNsNurFfMkqw7USzXSa6hWvcuH5wcSxeAYo08B2rEKILY4i/fOMIofD1KmHSr4EnbP7FqHrO8/1x0I5v6mEUwuMxnGPDuZKBptW0nqrhT7kpzAsQXjfVnzW5RbxqHsY8m77J6G2XeB3Iwij0suWNCbRO12JtdlG8kv0BL2Qq4zQV/FkWx7pyoGv5UnlcjIaScmfogyWGbRbZFm8fzDOXYYWGPRC7mbCjhAHaqRbekZ+uZmAi/5K9V+9Ef8UcsyviqFTyesaTSlBXjNpuQi6pHse36lIqT93rStOpUEIrevNeOMr37NNxIHp5m9BkS8EFOLCYlRSgnrvQPz6NLiTknsuIGVV8QrVqS9K7lC4cLTo57ITfrO3ghcJCqBu7B5RBWfkWiEV0Tyxrm4iiKszwueK5Jov12JSrqN9v3UIIf0xuqVu/FDjnFk0oSJsRz/zplmEfEPbfCJG2azx7KqVnKyHRhDpeH4weZQ2GYfwdRz9al0DVn2tUGjUP/DgZFtuMdCkUFruhyRs5DUO+KvOj4QwJqQlsKt6jYzQ0rDoXrOW9xq/2yYQyzq6dbU36rPqw9zfteKy40c+//ZDSSrCfieOUtnL2RsIYJ6fkGHekDHeRYkwC589ceNTPqeiwWqwDjkPagOEnYcxvAJBCUktDPQMIaiYa9532J9APFjatg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(478600001)(82310400005)(70586007)(54906003)(110136005)(2906002)(4744005)(36756003)(41300700001)(8936002)(70206006)(4326008)(82740400003)(426003)(47076005)(81166007)(336012)(40460700003)(7696005)(6666004)(2616005)(356005)(316002)(26005)(186003)(86362001)(1076003)(36860700001)(8676002)(40480700001)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 12:08:14.8260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 443abc46-ef26-479e-cfb8-08db7ee2d7b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5836
Message-ID-Hash: U3XUWHMPQQQVLHB65Z3J6I7CPXDIFUOU
X-Message-ID-Hash: U3XUWHMPQQQVLHB65Z3J6I7CPXDIFUOU
X-MailFrom: venkataprasad.potturu@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U3XUWHMPQQQVLHB65Z3J6I7CPXDIFUOU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new dmi sys vendor, product name and product family to
config entry table to enable audio for valve boards.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp-config.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index f002397caeef..f27c27580009 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -47,6 +47,20 @@ static const struct config_entry config_table[] = {
 			{}
 		},
 	},
+	{
+		.flags = FLAG_AMD_SOF,
+		.device = ACP_PCI_DEV_ID,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Valve"),
+					DMI_MATCH(DMI_PRODUCT_NAME, "Galileo"),
+					DMI_MATCH(DMI_PRODUCT_FAMILY, "Sephiroth"),
+				},
+			},
+			{}
+		},
+	},
 };
 
 int snd_amd_acp_find_config(struct pci_dev *pci)
-- 
2.25.1

