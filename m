Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C441E969C0A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 13:37:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E073190B;
	Tue,  3 Sep 2024 13:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E073190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725363477;
	bh=xKcLnaQDGwn0Pbq10Bo9rykUqa45KZZzp3wVIP3naWc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LrkqcFepDjh7hxpb3vfAD0FaUSjDw0jesWuHL7uI/jpL/Kw1CLUCkl8eJE0/A3UeL
	 jAPG52XKpIF1ZbfFM1AZKrvK+bpcCHxffuEYZwmPBjodUQrT2IhgTWMskud1PYYQdA
	 bMLesRZPg6wWU9Ac9VSkCN0ptH+vNTsvUhW0afI0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AFE7F80694; Tue,  3 Sep 2024 13:36:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7869F8061D;
	Tue,  3 Sep 2024 13:36:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19EA5F8060D; Tue,  3 Sep 2024 13:36:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A799F805A1
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 13:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A799F805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VUpwL/MX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPQZAAlpDpz+9kK/TMk/21kg7fX5xSUdL+Hh++51zEZEcEqtzdxS901ajGKzg6gjJeNfqP6D66IeFQQSu4uJXWwWgHEUW8KrxpGvhM7y4SIaqMGwmgbwdgR5WomPFqGRgkFhdtR7rG9pbyRthulriRDcmNYYUQblbwDCzuJkxp9+5f78HnAjblw8SLkWBBwyCuoaOaoAbkYPcjyIrd7i7IndlRB1wJwO3wUYrpkf3pwdJqccfxrBCzyw89yDncNI9OGHGo7lCWGmAF0Ua/MB3B6K8Hp8WPKY7GPzZsPjBMsM89DqHpLmIqFvQ00zcrBdo8nmKPJcOdPA5oVQ+WWiaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgNguuEw2MSrlS8j3DDY57JaEDgE8yzDudXajSgCDx0=;
 b=iS7afbp3OhV7o+2b9jiEvcQRr4jb/fM6SxErCMmAncyz1xQ73j4OETCzWvhwvGx4VlnOqNgN0jkOaV9lLH8swSGR+Fx31WNOWIsB2rnND9/Mp3t+8Vv8gkY+IOaO9FAgWj2LM2o1lDFR3bV97Fh7bE25f2YLP/HaKPczub8U92KOp9WhzwJI6Be1dk8FMXWJofeWVE2R7h+ICtQ1fRf3rPyBFKnJ79WkIF/JG0gGeJ4WgVIm1D+isZeJidzWJDmr9qd9ePOeclpk9umdF+qKjAgsNXrBx/Sq0fnRDFPkUVMms6bEV1P8xNA1kVfcjB8MzuZiAGFF6PWl4hQiQJvlGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgNguuEw2MSrlS8j3DDY57JaEDgE8yzDudXajSgCDx0=;
 b=VUpwL/MXCZocSPJJs7pLi19OW+3be3UFc/6KLAKzRKyo9ms2mto2pkAcyOIVs4YCnMXDIN4gEY1xteIqLHJsFo73mXQqOigo5MtuLNRhvwO0I4Pbnm7gg+0lQLEZ6L5bRFgzIpP+CbCH9kEmMcra5NBcRCH9lDFF1QvPVHgJKUk=
Received: from BY3PR10CA0008.namprd10.prod.outlook.com (2603:10b6:a03:255::13)
 by SA0PR12MB7479.namprd12.prod.outlook.com (2603:10b6:806:24b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 11:36:13 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::52) by BY3PR10CA0008.outlook.office365.com
 (2603:10b6:a03:255::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25 via Frontend
 Transport; Tue, 3 Sep 2024 11:36:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 11:36:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 06:36:12 -0500
Received: from prasad-r9-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 06:36:02 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "Syed Saba Kareem" <Syed.SabaKareem@amd.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 09/12] ASoC: amd: acp: Add I2S TDM support for acp7.0 platform
Date: Tue, 3 Sep 2024 17:04:24 +0530
Message-ID: <20240903113427.182997-10-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
References: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|SA0PR12MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3c1d0d-0e69-4a27-938d-08dccc0c9d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HTKpOTLIA8Ilj99V+gxcxvEJmITahrUbCR3sP95+Q0lHSZDs9FFFFBu0eSVl?=
 =?us-ascii?Q?uXHoAgzs4YQntgBIF2Ug9cHf8mAGqtj1VIFr+zP1D+O9Mo44+XbuQ83vK/RZ?=
 =?us-ascii?Q?KnqyhiQFIi4Nbh514Hf6m/YAB4Doo/n1FPqziCIMvIlbI/wFwmvGzBuys2ID?=
 =?us-ascii?Q?hW7ypHuWwmrK6oRHgxRTVhod4s9yF9hL1BS9UFr2xq68FjqXIpo6k0qgRpPK?=
 =?us-ascii?Q?l6CvwnA/4FM9LcuLxzGBOG1Lv6fjTo4WuPgKOTkwsoEyq6zSLvdVTMevD6XZ?=
 =?us-ascii?Q?WzqivFJdX4yl3PPnuKuyOq6ZnZxnk+y0nuVd/aplfXxHq9BG4SKwWsM+e5MF?=
 =?us-ascii?Q?gsR3YoqwED++xhLRoZJVvu0secUi49vj6/vVgXbJmVr9HRcnN7IWRG/Y+obF?=
 =?us-ascii?Q?jpSUzQUCLqG8/EWxrTkh8AR7XEnUjCQKIEZ73HCYQoIeMwSFYX/N2VA2U4lg?=
 =?us-ascii?Q?trhKT5Sa9AT3pFaDcRVAFp/viis0Onof886uIKC/Gum9SoB94fuYWOExQ1sL?=
 =?us-ascii?Q?aN+KYPwXRfpaJTDuXqUSznQ5l4ScFFgt21rwoaNzs5G5UHiZpdEi6cPrZ488?=
 =?us-ascii?Q?vvCqt+eBo3dOiNbagqd1+3JaINg0adksTXF8nkjEnd++RXg9+peQiu1tS8bq?=
 =?us-ascii?Q?UWGa7w3rPOh/X2yi+4o77F1nkY+bXjOCg6/G/io7NpMeh+c6kKRVWn87l6hi?=
 =?us-ascii?Q?SnTA5aDSiALrDcac/yPO9Wst71Hgbl+iGOZAk+z7J4JMflC0uHhbP3ApWy/Q?=
 =?us-ascii?Q?ozJVUkxFipI2FDdDQTRPQzvQAmNLL4awhEOBY3yBiA54p25920D83M/dxunA?=
 =?us-ascii?Q?eLq9rNzN8eF7PK7fV9kHYkbGSkn+0MCmzSyVP+VPwJD80rRRiG92XYkaAfbe?=
 =?us-ascii?Q?KWtpOUecScMkbb1jV0KTnGxNJAO+q/muTGFbPH/2mhYfh7M+AV+9MFSEDqxm?=
 =?us-ascii?Q?++0mLiRpmDf/X0sDCp1URfreRh4rFVCffU1Mg3+iIYDp6yEcRlFPWaC4/KgT?=
 =?us-ascii?Q?YXiGhmqDZ4ANQt65l3bLd9VTIg/nyp9UJ15HZeP8vBiRDVmYKZvt5O/rGjPo?=
 =?us-ascii?Q?NiQ+1mVcFbZT1Cj4IW3gYcNKTByV+ijO5eE1a0SDzk+VuKxiJj63t4UnIMj2?=
 =?us-ascii?Q?NQ3hsEqvMvmu1Q5VUwN5Rxy+BeqdENCYwwKJXLONV7PWIdoZRT78FVy0Drti?=
 =?us-ascii?Q?1CzaLM87zBVrUwppT6GKTffAeMNwQOM/5Ne2t8GG/TS00hytdRZN0Aj0IaFD?=
 =?us-ascii?Q?AO9aPXgDIhjvpdnTql1Qrx2pd9Ce/GAmRP+pfDaqwQqnq626ISSMqYE5qRHu?=
 =?us-ascii?Q?3klYHR4dbRyojw3BdGSuuYOYNQXn3IOMGj2bjPBubfaZifOYO+1CnOMMWf7x?=
 =?us-ascii?Q?ioPMQ5D3RoTYuU0SYsdsM74VTHWbq2lwH+6UUarHpLK02ZEN0IJlt0uYNjK8?=
 =?us-ascii?Q?IpkBaDEaps4tOFnrIAux+YTG6UlvkUIq?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 11:36:13.4319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0c3c1d0d-0e69-4a27-938d-08dccc0c9d9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7479
Message-ID-Hash: G7J245UPI522L2A5G5PDFVSV3VAVNT33
X-Message-ID-Hash: G7J245UPI522L2A5G5PDFVSV3VAVNT33
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G7J245UPI522L2A5G5PDFVSV3VAVNT33/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add acp70 revision id to support I2S TDM.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 31475a4dbced..2a23c52eb512 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -135,6 +135,7 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 		}
 		break;
 	case ACP63_DEV:
+	case ACP70_DEV:
 		switch (slots) {
 		case 1 ... 31:
 			no_of_slots = slots;
@@ -167,6 +168,7 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 					FRM_LEN | (slots << 15) | (slot_len << 18);
 			break;
 		case ACP63_DEV:
+		case ACP70_DEV:
 			if (tx_mask && stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
 				adata->tdm_tx_fmt[stream->dai_id - 1] =
 						FRM_LEN | (slots << 13) | (slot_len << 18);
-- 
2.39.2

