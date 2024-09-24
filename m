Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D51983D0C
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 08:21:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75D22DEE;
	Tue, 24 Sep 2024 08:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75D22DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727158894;
	bh=KzitV1oxuy1EUDHT8QTklG1V+1PcaT0h3pPBDN287jQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cLfZJD2J1/kB2CirtZTGDOPAxsCDRbZ1s916l0LShhWCSMeh/6JRUl7qw58EhAAAP
	 aAC+4amd4rzhtxR62qTXj0nSK1cMy60cn6DK3i3MbEYg7UElwrCRa9FcFRYoJBK0Wl
	 JHF0B6+ftzOMTCTlY/ynJEl+8TzQpDCF9fX29qYM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8884DF805AD; Tue, 24 Sep 2024 08:19:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2DE7F806C5;
	Tue, 24 Sep 2024 08:19:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21A38F80634; Tue, 24 Sep 2024 08:19:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D65D5F8061A
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 08:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D65D5F8061A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=l8SjGOYm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAVXERx8N/Cz26So9hfSLydumjiBirQEtdrfhFyO00qDkVpaRMtTr+O2jkMojJV/q4VXR2gGuVBfdh93v0D8FsgHEE3W7FFzyyw7o2MTcsR6HBkcl7Rh7HyTWOnMUjUSJje2VgRyxIjMN+7MiBayKjSiRzJ/H1CjaNeUAh5rnu0BBm61Kavi1eEzGZCDfc4oUgq3YgY3KQ93iMFKITUs0cz7znq21NTb+R4SsUApY3UG8e+K0nAQ71z8kx9Ywng3o0FSQBBDtbNSHpQbTrZFilB7XTzBIEYHtinaKhfDMborRXuuZM38ubLQIt9toSTv/sfE+lsH21hKSP2FJmgwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yawNe7HEJ3hSME6919ctWPkNP2GbWKg/m6HoWKacOEU=;
 b=pZeJvfyKu8Yw0Pkj1Ys+K8SB8aglOvJ99npveDEpyY9YJBvckw6KzA1cSb9tEWrcyZ6TUsEphnbiSgqN3k6GyTYuii1VhBDuW8lFJQIFZmx75M7hAOYJsQ+JfZBEvzOoqCHFEk7fHN4RwyEFFtVoN+FVsTFrN5DRpH7wTFhVVkjCxMGBm45ukixdXyNB+qCTBQyOvSjUkJjVd8q/0b70yQpSRVVV/f8gsZPFwRyFUxA3W1CMziqqJZpIQyMay9kAqBD7Zkdg/g1oQ7or2b9U4MBlvTR08Xgqeu6bwB3wTCVm2df2NZ44nnVeQ2XQvbODKq9QvxEVwlO0pYaYHX7IrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yawNe7HEJ3hSME6919ctWPkNP2GbWKg/m6HoWKacOEU=;
 b=l8SjGOYmuNQp+mmZ5L4T3eADsCE7hWLxZ6x0/NjF8cT7NKpavf27wUVNuAhZaUrLcToWU9JQxkvTur7QFat90QrqnD+mb5RHQ7WU02pFlv1598txfM1Zen40/RX74XWfse34BagPHhHR9xHN2l57iZ/V3cAPyKrNbaE8dXlt8aM=
Received: from PH8PR07CA0030.namprd07.prod.outlook.com (2603:10b6:510:2cf::16)
 by MW4PR12MB6975.namprd12.prod.outlook.com (2603:10b6:303:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 06:19:07 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::32) by PH8PR07CA0030.outlook.office365.com
 (2603:10b6:510:2cf::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27 via Frontend
 Transport; Tue, 24 Sep 2024 06:19:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Tue, 24 Sep 2024 06:19:07 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 01:19:03 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 8/9] ASoC: amd: acp: replace adata->platform conditional
 check
Date: Tue, 24 Sep 2024 11:48:20 +0530
Message-ID: <20240924061821.1127054-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924061821.1127054-1-Vijendar.Mukunda@amd.com>
References: <20240924061821.1127054-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|MW4PR12MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: 61bd5262-a6f7-4bfa-35ce-08dcdc60cba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eAgMQS6E+AbffL5tIoTjqJlnfrHQw4j2Eg0SjadMzOzFJDVHUVHN+wDl8eFq?=
 =?us-ascii?Q?O6h7QsKUd9rsZS0FJIvF+1gpnn+JY0O0Vupi0b4M4M1DhKPHlRaPYY4cA8dE?=
 =?us-ascii?Q?FwX4f3fl/NpuUY6CxuPO5efQHL3gBUlQ4n8Hho2MZZQ1SxFlfFXjZQbWpBLN?=
 =?us-ascii?Q?cgSZWsEVUp5Jn5PvfsnBgS9ceajZYPX36fc4yy1vfu2iKs2PO1eW4TKyMUzQ?=
 =?us-ascii?Q?rgt8pElFcZMzrHHKleMvx28jhe2t+50bvWitgDxHmmmfFYnapNoHnQkyZY5F?=
 =?us-ascii?Q?FsrSP5WdxugA6zTuPEAp5iRnCrqPl/FDX0byJuXN3jLj93okhR7vtADY0DHx?=
 =?us-ascii?Q?7Y97dRtPtjcpiVe/IIjbdP5F2RIwyEvYL3USqWI62XazPmXycLR1K6SGNNdD?=
 =?us-ascii?Q?IvwbpoSwtzN1YteTOHLogitZ+nyCWry54v6TahJZuqeBvzw3JDNuNe84B16U?=
 =?us-ascii?Q?hKQClVYO/B2NAVef/ENteZsUDp+LwgdZRXSdQNYOj/i801HDzehnj4GOQM9f?=
 =?us-ascii?Q?G0t1r2SQaGNpkkW8P6WSt79dBOwpnisBZc+aV47/xzzX698wftCBltgvC0Lj?=
 =?us-ascii?Q?A/gb5PJQONSj8UxCb3sgR7k3idiy+4OVIwnUtekEKxQXn3hWKxqQX37VwZkK?=
 =?us-ascii?Q?qSL4teCqdH9iiPbtpcEkoNmnvSEvQgwSVm0FGarANbyCqYtVn2R+u9dMui1r?=
 =?us-ascii?Q?JH5N3ECLrJgXFfoWNlX/keGY4g+TqUf3GyqIb6A9RrDDBYqFxG17evM2ghDZ?=
 =?us-ascii?Q?KJR07rNiQFEjvjJC10QXbhM7gAoKHqrnQguAMyitzCVI2K2Ij+tXi620Dgk3?=
 =?us-ascii?Q?9Js1Xhmza7lD58/eRQva9ORSBfhOQFNB5u0xu/vbX70MzRcYhywXPyZqbbl3?=
 =?us-ascii?Q?2w+O2831vu5bdruEz/kdY4E+Pg+uWf5830BRY/KAMXAhKeaT76aZj36SvQ/l?=
 =?us-ascii?Q?789XfrZ4AUu88DASyvUtO4lYPryg86DWzinqJbBTISOW4FnC94GLPCR9yVxh?=
 =?us-ascii?Q?L6jGgkN/EmUiUYuD8QCOOF7FeWP3BrWiXIJunpZifmoL9xQMi59cw42iGtIV?=
 =?us-ascii?Q?z+nona8sDNE2g0IbJidMKNqeSPvfAtg+DraFmVtmOSWvPnFyIkyjL/IxFSiZ?=
 =?us-ascii?Q?vJs7HCNkKg2O2/8iVwa4P1HDAMAzQjukziCLWmAm2rrvsL5acp3fpqR9je/W?=
 =?us-ascii?Q?ihBEgEwH9w20H6DFvh/Fo/N40E1kGIZH+Q5tO1GZuHdbIeo+EPX4FxNXs5CV?=
 =?us-ascii?Q?cobiQIl7U4QwvftskYFK8rrUKCP+pW1BiJ6oAzy2/yWGNjo3vyOOD0IVMB3K?=
 =?us-ascii?Q?wjiuf1ydOVE8ASq2BNVbXr8rhj5ioXbE2bIkfNYGux6VlMgxabID98S7TNCD?=
 =?us-ascii?Q?1jf9qF8=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 06:19:07.0821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 61bd5262-a6f7-4bfa-35ce-08dcdc60cba9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6975
Message-ID-Hash: UWG2CFKFHXJKQ7F7LPQBFIXMVMPSUTIH
X-Message-ID-Hash: UWG2CFKFHXJKQ7F7LPQBFIXMVMPSUTIH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UWG2CFKFHXJKQ7F7LPQBFIXMVMPSUTIH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace adata->platform condition check with acp pci revision id
variable in config_acp_dma() & acp70_i2s_master_clock_generate()
functions.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-platform.c | 6 +++---
 sound/soc/amd/acp/acp70.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 78fcff6ea657..7be9b4ff7923 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -205,9 +205,9 @@ void config_acp_dma(struct acp_dev_data *adata, struct acp_stream *stream, int s
 	u32 low, high, val;
 	u16 page_idx;
 
-	switch (adata->platform) {
-	case ACP70:
-	case ACP71:
+	switch (adata->acp_rev) {
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		switch (stream->dai_id) {
 		case I2S_SP_INSTANCE:
 			if (stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index 82c26e4fefc1..db5dd64969b0 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -142,9 +142,9 @@ static int acp70_i2s_master_clock_generate(struct acp_dev_data *adata)
 	struct pci_dev *smn_dev;
 	u32 device_id;
 
-	if (adata->platform == ACP70)
+	if (adata->acp_rev == ACP70_PCI_ID)
 		device_id = 0x1507;
-	else if (adata->platform == ACP71)
+	else if (adata->acp_rev == ACP71_PCI_ID)
 		device_id = 0x1122;
 	else
 		return -ENODEV;
-- 
2.34.1

