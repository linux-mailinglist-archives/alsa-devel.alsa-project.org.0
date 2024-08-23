Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E3895C4FF
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2024 07:49:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 998C5846;
	Fri, 23 Aug 2024 07:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 998C5846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724392148;
	bh=0GzJ+ugz+DBKSrbFCoBlMVsCsijCS7rE7chDJi/qVBg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Xbd33gZ0U83zYx5h6aV108+zd1X1JMx0yl7mTv3PMNzgzzzLzoymvktLzUPC51iYQ
	 Gc9pNAPiEXSM3UU/imtehsWbBwJEh84wn8oIBcn0xHspnBhL27E/1HG6BCSKcq0LrH
	 935UfLUlGz62gbdsfMPfMUF5nQQ/5m/Qs4aIk3RY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EC50F805C9; Fri, 23 Aug 2024 07:48:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34675F805B3;
	Fri, 23 Aug 2024 07:48:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99B15F80517; Fri, 23 Aug 2024 07:38:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68D9FF80494
	for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2024 07:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68D9FF80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Fc6mA+IR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r84s/z5LQN8ZrScto5oz+XfgAWaiHbDldZBeVdDg9G/OcwB4rufzc1z9/o5eP9cYB3vZ9rOpnH+fb1cMKp682Eo2euKt4PjVEhFAhc4zzgIzlu6WwSvQVenspu0/9Nq38hfvjX5ajprk3IgoDjTBOiS/l99sqOfPmHZ20UsrPLxGjnzTU57P0AKv5651Mibs02dcBuB1GuAW2541FpLL+f70i7/2J/W/4F4PgJfG5I3wnA7kamVatUKenkEWgYlVwgMlvjkL292qqo0DCTRcOIIgBnqv+4X6jMnWmaDqFUqIRFvPSj1f+Bu1lLWbu96iizvm4bQtEyr9g4lcOLBhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeKlnDepmMi9IDfMiUFngf9HBgG7pYCvvsYjAObbtV0=;
 b=xLGcdnNHY+4eXy8uBxSKG2stKbwJfJZOpYAnD703aJ6ek1IjhnDuFl32ybcteRvQqZf0Rh6yRKW2C8N38EFJs7m0H9yqVT6ksbPiim8S0UOWMwjycpJmVZAZC1ULoIkXflcKZ+JuIcJ+W36WLSZvkH88YeqFB3SJVLrv1dgqUobCIEmexpGUxgDccMCVj/j2y83W1rMv9Spt8sfNwSQzOj4LXsqGM1Z/SISCfDo3RzltIMNb0QWhFF6GebW/MXLHUiq2bthMLV+tVDPVUZruXMptHcz4o92BMdTWVe6zp7xFExdpPIQxraAvqOvoDs56019Ssvq3FUSr7FdAbRYyqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeKlnDepmMi9IDfMiUFngf9HBgG7pYCvvsYjAObbtV0=;
 b=Fc6mA+IR2cTopE+jH2Dm7+oIy5AzMhrzLkmbg7pu2Et+yJNXGeoL3edyY8BZ5ezzHnZdi1oSWV6mjEmstWZpp/Uq3AQsCPmEz6gN0dIEvcy+dsqteSBs3Gh0n7AtgqSENYeK4TsJPv7v77ni6oLQOP2wJk4HtwmZcE3I+R0QTe4=
Received: from SA9PR03CA0021.namprd03.prod.outlook.com (2603:10b6:806:20::26)
 by DS0PR12MB7778.namprd12.prod.outlook.com (2603:10b6:8:151::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Fri, 23 Aug
 2024 05:37:57 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:20:cafe::6e) by SA9PR03CA0021.outlook.office365.com
 (2603:10b6:806:20::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 05:37:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 05:37:56 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 00:37:51 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <cristian.ciocaltea@collabora.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 0/2] Add SOF support for ACP7.0 based platform
Date: Fri, 23 Aug 2024 11:07:37 +0530
Message-ID: <20240823053739.465187-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|DS0PR12MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6c2f0c-607f-4a58-dd64-08dcc335bde1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G+ZRS6uqax4Y4DMnZJfA2foRqpzQrD0vDIzW7seo5y6DvW+y5sBBLpiLvkSt?=
 =?us-ascii?Q?k2OWmniDN7gJjexh+lh79fG7/fueK3mzpfJbXEZZ9Dnncyg9P6eZ3GJxLtqQ?=
 =?us-ascii?Q?RNYC/0Zfv10eQNnjpK4Te5WFbDYzrpzSaAHrbP9S/zzVNE8KDEl962X8pWqj?=
 =?us-ascii?Q?o5ervTGA7Vb4LpJh60BMqJCcATZ5qH5mv0nbhlc8Dc6axdZZ/QS2JcGbADRa?=
 =?us-ascii?Q?Xvywxehd7vRgOIo+F2GRk4yxrXA0HoBDeUHIPp9fOr+ezRncHFwbTRavpbMu?=
 =?us-ascii?Q?xKrcILsrBRHc1AhSr640QRxly5nvlszO0jIHpqsNZY2Zk5El+FeG5D/QguKL?=
 =?us-ascii?Q?9oqbVn4aCZ0gm2gyyP8pZMAqT9K9GGRROKZlreX5xeTQ5/670ag2ylulcUCU?=
 =?us-ascii?Q?a6RF4LKz2uxaMJmbWo1nY5/lqJHfYp//MU+NtC/ju6EXOZJsqarPSrB/c9bm?=
 =?us-ascii?Q?xST1QwStq/vb9NDV62I+6nnCmQ2DCxlfg+lOznfTZTjoDItRWmKiwlfFE0yn?=
 =?us-ascii?Q?mXmgLPOODZUWL+1HN2YCF0MduNKE5IPXzVBrDfpQX6STCeNkaYb35IqOjQiB?=
 =?us-ascii?Q?MADKlkqY+EKa5x20H/uxwUdW1vjEEMavMr/aTf+BTLP3qS402W6Emg8lNPUO?=
 =?us-ascii?Q?w2HQlrxAUtGzy/ejuC7cdYzruATPf3zygXGwzoGqCpM6jikF1U7uwCKngsTQ?=
 =?us-ascii?Q?pnDc2bFW4FrsxSRYxQ6m6V32Cslr9DDZd1QWy8r+DTzoQVft0MDkpYvLd9uU?=
 =?us-ascii?Q?nfPX3Z3qPyYL7eVGfqd8/Xg1ghXP3uhl/kYvpaSV2x5d04hNL4cBrSmmQr6Y?=
 =?us-ascii?Q?lHHIAHcaukapjzcmla03ebG4rrcvr282Wn8+Tu4LHdTb9NPJtI1Qq20ot2dB?=
 =?us-ascii?Q?baaxLR74bWtX+LriCVLjHZYcmy3Vl7lAKcwM0XmViAk3lSbSshK1rrEHoo1e?=
 =?us-ascii?Q?VRCASnmbBL1UCmSslW7/7LjA3Yx0MgfRaYzCs0NpSi4pQoALUvHwTxrGKM/2?=
 =?us-ascii?Q?canfwFJZEPi7r0mVD8rostbf4Jk2kYQI/gdoBF0toQGu4MwBKriqwNapvYhz?=
 =?us-ascii?Q?K99dE6ic/aAZD4XamDcrn3CtBsoGacDzobSzz/R8h04sCClO8h89y91GI/u5?=
 =?us-ascii?Q?Z3vFZDB+j1i8GMipaCXUbNe6ULUXu0J/F4Nzrykzi//TqsPSJ5mrX2j5Ernu?=
 =?us-ascii?Q?/w7zT9uBdkK6gyx7FFB7mmjrkBRYxtVuRByvtUAkL+lvk4uXPVUoJ8WWbLBR?=
 =?us-ascii?Q?R3WbpvK7nvmisz7wkX/eYJiSOfpx+lZxY9+NpXRlNzExDQ/dWWWUZhAYz5IW?=
 =?us-ascii?Q?9xkioQSE+Uw0IVg8l+uLVQt1zkPAmr0gkE7/r3JudnyEKh0sPJlXJ2QNKiNZ?=
 =?us-ascii?Q?sAlZv25zjUfkbKjkzCGwg6jsPV6xZAYcwbrS9d2OCuhaHhmIoA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 05:37:56.5365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3a6c2f0c-607f-4a58-dd64-08dcc335bde1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7778
Message-ID-Hash: GGSYQGR55MABDUXKDGD7PO67XJDBHYPG
X-Message-ID-Hash: GGSYQGR55MABDUXKDGD7PO67XJDBHYPG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGSYQGR55MABDUXKDGD7PO67XJDBHYPG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series adds SOF support for ACP7.0 based platform.

Link: https://github.com/thesofproject/linux/pull/5139

Vijendar Mukunda (2):
  ASoC: amd: Add acpi machine id for acp7.0 version based platform
  ASoC: SOF: amd: add support for acp7.0 based platform

 sound/soc/amd/acp-config.c         |  12 +++
 sound/soc/amd/mach-config.h        |   1 +
 sound/soc/sof/amd/Kconfig          |  10 ++
 sound/soc/sof/amd/Makefile         |   4 +-
 sound/soc/sof/amd/acp-dsp-offset.h |  24 ++++-
 sound/soc/sof/amd/acp.c            |  65 ++++++++++---
 sound/soc/sof/amd/acp.h            |   9 ++
 sound/soc/sof/amd/acp70.c          | 142 +++++++++++++++++++++++++++++
 sound/soc/sof/amd/pci-acp70.c      | 112 +++++++++++++++++++++++
 9 files changed, 365 insertions(+), 14 deletions(-)
 create mode 100644 sound/soc/sof/amd/acp70.c
 create mode 100644 sound/soc/sof/amd/pci-acp70.c

-- 
2.34.1

