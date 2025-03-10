Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D36A5918D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 11:46:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB0B7606F7;
	Mon, 10 Mar 2025 11:46:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB0B7606F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741603613;
	bh=d9rL1tgVU+v5qETpcj/pcOwIbtyEWqbqavPJikse+do=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MIGw8nDcSsromHk6XJ5GTJXQq2keckzk8lQAsvoiq58OMMsZ2gVgaefRxbDvH0wYr
	 hvg51bXDPmfiTVOgKjO++CqLSbRhfORzhgTqbzK/JiH3mv7DQxroR2ZKXGnBD7fbuU
	 7JDzMAdD8JkavuM13ueZN+zcDnX5u305qcKt21As=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D4D4F80527; Mon, 10 Mar 2025 11:46:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06B52F80526;
	Mon, 10 Mar 2025 11:46:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF914F800ED; Mon, 10 Mar 2025 11:46:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::607])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF532F800BD
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 11:46:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF532F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=JEa+l0rR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aopdzoWXi5PQ/7xeiFDLNEfzGM4zzhnsTn3Cn2zL0UFZCYTt4qlfHnIQMEkCQTUAJeUgiWzmgoOECIxt0Y9b+XsDyG2N2FXNK5GqSOl63MVqgZnjYJktMYUuiL/4eunbJ7J6f3UDPJ5nAa6Ut/oAfGQvKwD4bn3g7Xi65c0fhTnRNOEaq+8q/ULkAmxodDTFRDhhf7iVEvTZ7rmxdJOy57ryktzFCkUC5RsagTE7v2/H0hE7VFMHYW+L9OrDwlcbfls5LNrsT2EEUFdra87Y/K0UgzW3wHX1uJefWO7PEI08Me4CrCCX9czL018sSVreaQ9jZ4roCsKdk6fbtDTOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFKhqa4KcpkhHlSSpojhQHNlU6cdHaD+FtaTRK5GURg=;
 b=tLR4jtBOlX3utJDrAIHXyt0nEEDOrz0T8i0CQdkIXKDAZPRjXaFmFQmUfbtAlotyuYZIYbLraUXgZoXlSmvgclGv19QI5We7lKGFFvPBkTBvOTEOWcAZAXiRqa2wNPE63QEBqpXWgSqCr2gf0RSSCaUZP3A6W4NomgLmVe7i2bId+HIiF2qsZ3AieEcGJTV3BLD3L6QSE7huytpDLcTYYtHDBLCeRiyOfnErdTRTOtCXMH3CXnIiUqPjU1JYz7WuklpRbHUYM2jhKKWI6N/Q9u1VBtf8i/aaTWC5eUA6t60vP/Dq9IbYXy0zEUlVxdRtfRp/adAl1GuQMgS9VEi4UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFKhqa4KcpkhHlSSpojhQHNlU6cdHaD+FtaTRK5GURg=;
 b=JEa+l0rR7S3CJ0SXtm3YTz09eeRUcSAorb3Oa8z9sIvzBrJzrZ8YHokDtDM6oLpqA5Ya+5hlR5YTNYDwDhsp6QcMIf7ru5nhYZKoqj9WohHu9ZSZJw/z5r4pzrMx5b3gPlptjmxgsM0D0iRYHOI8urIhZYpPpO9Ppnp38Mcv3jY=
Received: from CH0PR03CA0185.namprd03.prod.outlook.com (2603:10b6:610:e4::10)
 by PH7PR12MB7987.namprd12.prod.outlook.com (2603:10b6:510:27c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 10:46:06 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::82) by CH0PR03CA0185.outlook.office365.com
 (2603:10b6:610:e4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 10:46:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 10:46:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:46:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:46:04 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 05:46:02 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <mario.limonciello@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>
Subject: [PATCH 00/14] Implement acp_common_hw_ops support for all platforms
Date: Mon, 10 Mar 2025 16:15:47 +0530
Message-ID: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|PH7PR12MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: b404c28a-4ad4-4075-2d84-08dd5fc0c26a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tDh87+Dnr47cYcp9u1MbvNUwQzxrNKg8EnPOuiQnz/TJzgt89MPVd7kJ+M3i?=
 =?us-ascii?Q?L3vsbsXKEvFBMzs3eM1l8JNOOVJH2lTU4OMlUUC7Q45PHay0h2fvNRxReAJi?=
 =?us-ascii?Q?AMJuGqrSrfKVsbI8ireSevFlAF7/OG3YxXk0z5Lk3dIkZQEOhNsV6G8jGC9o?=
 =?us-ascii?Q?swbNSr+zyx1u/C9LdtkVSyom+cbOtCTydnhB7KX9r3bGhhYOqbiDuT99Zd5x?=
 =?us-ascii?Q?C91R5rPYitrpoxAIdB7xpVZPnnTg+f1kYlqsO/GEkmtGKGO069Gt7s+prNts?=
 =?us-ascii?Q?KWfgbil+OOnHVVJKerCOUgM8ehs+bkJW9IjDGmuQpNzNnHxT3QHHydm53u5Z?=
 =?us-ascii?Q?z4U7CRNJ5EXJvuQrVtHlTR6sr6eq2y0C5B8eOYMMVt8F3X9QO+gz+3BLA9G7?=
 =?us-ascii?Q?Cc14OpZBQRRWlVS4aPqfdpYkz2d/FrU8UbIYYXzhvXHcPQmOI6VvSknkygfL?=
 =?us-ascii?Q?nmVcQRjSu7SXz6dEyrNOzcF3OcbfMB0U6xtQbfun5t3KpqZVLRF8PlHbUy8k?=
 =?us-ascii?Q?vOmM4JZReIjxQtftJNfow4on5matB9jAmmW3MMbJoq9tZxT8U3RxzFY397AZ?=
 =?us-ascii?Q?yH0FHlcrZw5ZOV8ygFH67i68cARcaF1uGkIaNFlh3s9zto+MyHaWto0LRZmP?=
 =?us-ascii?Q?BituI5h1GKd/qkunYrBiMOczke8lri+BausyZnriWrof08lR/FxrJo+AKM2h?=
 =?us-ascii?Q?poj4lGC4arTLUINBljgXTX81v6bQIrw6QR+0+spFOusNvZ3kcOVBFYHPNb8w?=
 =?us-ascii?Q?fhjC2bA2spcLRgLzSKUmTSlbrZpEvXcpSDjx+USGS+s47z+uL1tgi8FLdFCm?=
 =?us-ascii?Q?CwVZ2t5JXOnf4vdcFgRPs+QDrnv5YxM0E4nt6Ni6COaihuszP7/7GyYiCshc?=
 =?us-ascii?Q?r5WjsyKmofdxS8WCnAEwqCcLEMa+PXY9IePb+jPGSKflYdEgFmxEfntG5bI3?=
 =?us-ascii?Q?LTHOjVRDFYczAfVyVHcQeP/OCJwcGVxWq0TBHVCKJk8FQ7EQMGgGw/pZw2mk?=
 =?us-ascii?Q?S9cwD2MFrfIzLK5vp8MLOYToIbKvIN70R6udfyOn3V1zEyfI5Trb2QBD7xt4?=
 =?us-ascii?Q?Wifwv4YOsj5i6LzxDTUAtFpOgR+Q1UxRtwt/P8T/HuFt8IVN7tHxnsotg14V?=
 =?us-ascii?Q?eb/KRHltkiiHuD4AIMzqYcCreo+M5Op2tEH7Z+t450dAAFGMFhPqsZ7vte4v?=
 =?us-ascii?Q?hDof6hc8F2f3fecfe/iRjs1WasUy+YBGo4vhXU+l0sYqfaYLW0f3zpflRqKG?=
 =?us-ascii?Q?zpNA7PigzF7dV9sK8XUlH49IN5qjWiv/OP0StfQJY2CYNJ1mQwLmULiutfy2?=
 =?us-ascii?Q?JyrdAUaHA1MqEwhfS/BcOvJkXkvxX2xjr9DL85h5emVQ8mO6FmeMIfYPG0Lo?=
 =?us-ascii?Q?4lAjFQnaAq39fPLORaxmWCh0Bx9CliNNQA3hh1TxaZL9BMWCm5xPB2ZGVSoH?=
 =?us-ascii?Q?TQlZDjpA/C1hDAMGQtB2rezYcllEvIlVa+dZdwvFIxtO3Q/FYXMfIw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 10:46:05.5951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b404c28a-4ad4-4075-2d84-08dd5fc0c26a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7987
Message-ID-Hash: 7NKWJTRUIP6VMFZWJ2FURTNBBNU7F3JB
X-Message-ID-Hash: 7NKWJTRUIP6VMFZWJ2FURTNBBNU7F3JB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7NKWJTRUIP6VMFZWJ2FURTNBBNU7F3JB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series is to implement acp_common_hw_ops support and
refactor interrupt handler registration and interrupt handling.

Venkata Prasad Potturu (14):
  ASoC: amd: acp: Remove redundant acp70 chip->name
  ASoC: amd: acp: Implement acp_common_hw_ops support for acp platforms
  ASoC: amd: acp: Refactor dmic-codec platform device creation
  ASoC: amd: acp: Refactor acp platform device creation
  ASoC: amd: acp: Refactor acp machine select
  ASoC: amd: acp: Add new interrupt handle callbacks in
    acp_common_hw_ops
  ASoC: amd: acp: Remove redundant acp_dev_data structure
  ASoC: amd: acp: Move spin_lock and list initialization to acp-pci
    driver
  ASoC: amd: acp: Remove white line
  ASoC: amd: acp: Refactor acp70 platform resource structure
  ASoC: amd: acp: Refactor acp63 platform resource structure
  ASoC: amd: acp: Refactor rembrant platform resource structure
  ASoC: amd: acp: Refactor renoir platform resource structure
  ASoC: amd: acp: Fix for enabling DMIC on acp platforms via _DSD entry

 sound/soc/amd/acp/acp-i2s.c           | 185 +++++++++---------
 sound/soc/amd/acp/acp-legacy-common.c | 254 ++++++++++++++++++------
 sound/soc/amd/acp/acp-pci.c           | 210 ++++++++++++--------
 sound/soc/amd/acp/acp-pdm.c           |  53 +++--
 sound/soc/amd/acp/acp-platform.c      | 145 ++++----------
 sound/soc/amd/acp/acp-rembrandt.c     | 111 +++--------
 sound/soc/amd/acp/acp-renoir.c        | 110 ++---------
 sound/soc/amd/acp/acp63.c             |  94 +++------
 sound/soc/amd/acp/acp70.c             |  84 +++-----
 sound/soc/amd/acp/amd.h               | 270 +++++++++++++++++++++-----
 sound/soc/amd/acp/chip_offset_byte.h  |  12 +-
 11 files changed, 792 insertions(+), 736 deletions(-)

-- 
2.39.2

