Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACC274B073
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 14:08:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 431C1203;
	Fri,  7 Jul 2023 14:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 431C1203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688731724;
	bh=MtHJS3ifUXaCBrMtUjKRGKXjJDMpV0AcDXD/ps5UVrc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=i2JmbS4LLsc7wVXKXy+Q54BKcyW6rV7AfG5KgNoe1WEd8bWaS8jA6WWRnJoqjKMnu
	 qNbFEV5mZ2dy23yI+pKezcmHwgYEAzPChh4hlL1YYsGxOoGdNPBywgyPh+/4pCIWAY
	 6VE61nL9ZLRsQliyDoF9pn8Dzf39JKDJDDUN/1cU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE056F80100; Fri,  7 Jul 2023 14:07:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 795C4F80124;
	Fri,  7 Jul 2023 14:07:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97B09F80125; Fri,  7 Jul 2023 14:07:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40C32F80100
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 14:07:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40C32F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AjVYN2AP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAyCOz+JBP8v87atTvE6sUsd/gDnRuP6wPf645SQ5gllpOI5gCuCvFFOYj0wxG2bbXKvcASwDkyq0kZ9+3ONeYCj/BuP1iwnY/NKMcDCpc3stxNRMdXLxiNdGN39603NRqE/gL73z/Zd8Mv7tKzN+/E1N0GH9NfuZkPhzcPejU4ppenXnPRk6dyh1fr/SEWcK/0FyAwsL39Nz3n3LeFeqDdDXyslt1e8vpqAoqP/M3knfXZHLp65xGpY6TQTHqexu4N37QOn6/FISoBXuQ3Zy7XREXlvImPkA55iHwdDrKENY9Q6BOb3gv1p9b8DSmf9yqsW+Wt/e/vZqAE5GfPH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uLa8INFUDoHcnAItKqQ1NsOQGSH2AA95SlstDjAuTE=;
 b=BE9yJQjXJodGplkgEnOMfVP8LazlS/8S5hsDcFYSZdrNY4asjPvpqO52rrE4n7SMWDandIWgZWk5tMUnCoph1eS09fOncn0/tjSTeqrDakgA+Xe+Ww7fAkCaqAQ5lzcl9OJd5gSO6KBE5DSSAJNCLaTIMNq1iVypuD8iHQDUsm6kk0cTzaU1d/AQYEu7SO9DZZW6Dt6S0SJZaEqD3EWRDAKnDKkahhu+LOu73bQHSifqIs2P6r2LlU4P/ZmnzSMPfYnkdTvJWLzov5CLhj6jmQrlcILlAv+4EGkOPO28VA/+df79IMd0OTTWOfGQ/GZF9Khn6xmC3nFe6oqZEzOs0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uLa8INFUDoHcnAItKqQ1NsOQGSH2AA95SlstDjAuTE=;
 b=AjVYN2APxsBykp1FmxcpMH+uR6CSn/ZUWRUGm97crDp2gkZRcHVZac/Ic0d3KC3fkHMH03kYXcrU/RNd3egurdbOnIu0DV94tFBwYYNjYBdRYE31eBYtDqBahxxEB//hIK/JE5dXoR24oaXHTbj1XeN42sYK+W2TXC+xuyjK3V8=
Received: from DS7PR03CA0357.namprd03.prod.outlook.com (2603:10b6:8:55::10) by
 PH7PR12MB7305.namprd12.prod.outlook.com (2603:10b6:510:209::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 12:07:35 +0000
Received: from DM6NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::c1) by DS7PR03CA0357.outlook.office365.com
 (2603:10b6:8:55::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25 via Frontend
 Transport; Fri, 7 Jul 2023 12:07:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT095.mail.protection.outlook.com (10.13.172.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Fri, 7 Jul 2023 12:07:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 7 Jul
 2023 07:07:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 7 Jul
 2023 07:07:34 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Fri, 7 Jul 2023 07:07:31 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <vsujithkumar.reddy@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, <mastan.katragadda@amd.com>,
	<arungopal.kondaveeti@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>
Subject: [PATCH 0/4] Add acpi mahine id's for vangogh platform and
Date: Fri, 7 Jul 2023 17:37:26 +0530
Message-ID: <20230707120730.1948445-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT095:EE_|PH7PR12MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 33733f34-4551-46a5-4be1-08db7ee2bfd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o8fNTz/AmeQHzoOL+Hl7gvKDUF2Ay9GhVogs0B1ZPc2Z/YVGFv2s6pegwfHNAvLEKrdrz3eYoCn0cIy3hiEV23+IuEeAsCZ+hkIwFfzdSLt/haq+BR8Jc0E8hPScaxoD7n2why9TNVO0dbKin46YicsjBmmU3r6yN7LdpA5kMTSDhI8F0lDLqXefZ9Be5kA9fcgUPV3YZeOXTXtDnYGGjMCCPIWu0/QO8a1/CTlWH2rFnQRV/BSTaYR/wQNjx5Qc36dBFKiDaOEC1Q/79ejiSmDpuu4o7DF34sd8R2OrXlj5t10TQvz3LaX1SwoZY96vS0iaQ1knePqK22rpC2E8lvG6bbbER3KvBrwSHrWf8dGdR6ITksq5ruJkKqFhDN8CbdB+jU2gUXF5VmFbpJFlhebI3P5DnbIzI5ybdVtgcf5WkavhG3Bt2VM8dfM4rOS+6BJorKk0H9sv25JihJWGZedfAZDYTLMfQLE3sq+lo3fHuMzNYa3eCTMA1xB9E0jzrMg6mwQ8XGHl92rfzDtUG5NRSIl5uGpzzivL951/xQ4cRTBoUn6BAcrSG/nsycZ7jxCqWwtQ9lKiewnDSLGRtRNMab67Jh4co7UQerXl3e+EpBhMxMTs6TERLaoM06L44oKlZpkfkQ5RD+FgMwdWm/4kP5aiOGJAPqSbadui1YT50ETkUjUFwu5nKhBtvMHBeEjur2PpGjnmPyCL7gHzHf7XdbbOilPwchRncqXTYtKg6s1zTByt/VCrQ8uQBchUKzKem1NFK0e+gtAXyxkU1A==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(7696005)(6666004)(40460700003)(36860700001)(186003)(426003)(26005)(47076005)(36756003)(336012)(86362001)(82310400005)(1076003)(81166007)(356005)(2616005)(82740400003)(40480700001)(5660300002)(70206006)(70586007)(4744005)(41300700001)(8936002)(8676002)(4326008)(2906002)(316002)(478600001)(110136005)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 12:07:34.8083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 33733f34-4551-46a5-4be1-08db7ee2bfd0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7305
Message-ID-Hash: HN3ZYSQ3ELSDXATYQ7H4X3VVGYOKXQIF
X-Message-ID-Hash: HN3ZYSQ3ELSDXATYQ7H4X3VVGYOKXQIF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HN3ZYSQ3ELSDXATYQ7H4X3VVGYOKXQIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series is to add acpi machine id's for vangogh platform
and add new dmi entries and machine driver support for nau8821 and
max98388 codecs.

Venkata Prasad Potturu (4):
  ASoC: amd: acp: Add machine driver support for nau8821 codec
  ASoC: amd: acp: Add machine driver support for max98388 codec
  ASoC: amd: Add acpi machine id's for vangogh platform
  ASoC: amd: Add new dmi entries to config entry

 sound/soc/amd/acp-config.c          |  33 ++++
 sound/soc/amd/acp/Kconfig           |   2 +
 sound/soc/amd/acp/acp-mach-common.c | 267 ++++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-mach.h        |   2 +
 sound/soc/amd/acp/acp-sof-mach.c    |  16 ++
 sound/soc/amd/mach-config.h         |   1 +
 6 files changed, 321 insertions(+)

-- 
2.25.1

