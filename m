Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7431CA2BB62
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:30:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D1BB601F5;
	Fri,  7 Feb 2025 07:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D1BB601F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738909805;
	bh=jzeVjXhv5uiyBGXh33F81xCkdC8p6HEt2U2lUh/BTJI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ft5XroC5/PVZ8qyQIHY8zjO4jRipOodDv+gEb+XBRDVEVRZ52OBqhWuVAfgyb5Pqk
	 ZxNRjuSewsQSk+iDWb9zv/CNfc1DRIUCn/sGiPSvT8zAi2j+6CL2qRLzxnPj7h1uz/
	 H/uPVCaINsKjeQV/78Xsocoi02n1LGDX9ROapv2I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8F02F80609; Fri,  7 Feb 2025 07:28:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69A44F805FF;
	Fri,  7 Feb 2025 07:28:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC7F3F805C9; Fri,  7 Feb 2025 07:28:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::61f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE5A4F805BB
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:28:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE5A4F805BB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ssdqTO3A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGsB1ktL8UTY82mfqHxXAEHOiyhu9b0nj9qRSFQ3rt199YL9Khse8pu9xtjFS64QdWUhqCq0sDOHJIdwTbzZ/3Es4cGZdmCCUjBqrlVqz91+2RNqzcz8aEhYLgRu+E42lnhRtc1UGrjklKCZcPKy2OLukMEgfC1myCtHL8ECg7mMsUeAxMeIjv1wqhQa203ehHgxojjUm8tism83tvA9JlJTadLMp9SsDi3fqfCYNeOKHhGhJff75Eir5B64SZZrGCrabvFyTNqK7k5lKmXjWOjOAquH09Oqd50dnwVg8barJNvJchlVjsDDVuO2kKTt0jt8IPk6S0s0vrkcDGCFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFb61OH0mFLBExao2E8yR9kmGe8kkKhgNGK5EE/NwoU=;
 b=o0UFDGurAUNeleqyTCyTo67ZUK2JfIhGmTznBX5IyC0hLWiPIlSDh+beRxsV4uCbgTV0nH/Rp0kR6WNjUX5c+qTz+ZWNO6D9PdJQ0zPDqacUn5xcXZok3dr5QZbgXmQte97N2eLjZvJJOnTMOdQy2r2fl93Mu1bXcjZF6JCRhCO8Z/Yd503po/vY2OPr3OwC+vo0ja7uyik2eCxlL461w4kJ7a2nTHTR1tj8kgb53cECK8cIxBwef8BGG+EwjkC7JAhL4kcml5NcZkKhLAWaxdElk5zaRf3/a0gAj/LpPgGUIj6puGwteqaUSFqxcrBNmVxn89Efj5Ys8HYfDe2X3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFb61OH0mFLBExao2E8yR9kmGe8kkKhgNGK5EE/NwoU=;
 b=ssdqTO3AvFkCb2uzA4+cpy9JFkFugXtvjMaUXTfepxM8CjL5UtSnhJAdYPEdsNOrMZDpGkZ8cqdTW0+ujRf/fKzFbvMGaXYofsDG60uwB8XCU1KgyQJH+tix2LfuZfZEy8GAaznNXBImzE17Ia+QyGjim7jRy4neOG81cae2iwM=
Received: from BN9PR03CA0945.namprd03.prod.outlook.com (2603:10b6:408:108::20)
 by SA1PR12MB7174.namprd12.prod.outlook.com (2603:10b6:806:2b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 06:28:43 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::b3) by BN9PR03CA0945.outlook.office365.com
 (2603:10b6:408:108::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Fri,
 7 Feb 2025 06:28:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:28:43 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:28:38 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 02/25] ASoC: amd: ps: use macro for ACP6.3 pci revision id
Date: Fri, 7 Feb 2025 11:57:56 +0530
Message-ID: <20250207062819.1527184-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
References: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|SA1PR12MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e49f269-1738-4e8f-d949-08dd4740ab66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UacJu/H9rE8AL0BH31oKP6cG4F6eMwdTQ9rGzn7PkfjtDfZ1g641GxHG6U1S?=
 =?us-ascii?Q?nGdgDMP+arn/wW+LWgtALZNvgMGT9Uq9I0Aj0K3Z6Ent2wSeLg2coA+CBaYN?=
 =?us-ascii?Q?tW3VDpegCRShRVvddZb5uUvREgbGxS7x61bJpfv2rwBV4GYI2JqA4dVH/Upv?=
 =?us-ascii?Q?1OouRoDHDOqpIOn0ptqVWZ02f+8X5GnpUQz7nqeUcL8mooH+N/GFCkfmHCjX?=
 =?us-ascii?Q?EynQhXvhvw6R87GxmdfJ1JqxEsXWUyZTDI4caKVtPM2tNdvAsRspSFrM3rhC?=
 =?us-ascii?Q?FWsXwFTXhMy5vnEu5asSKhocze4aEEzDE7zfcKmNR/zwIXKXmSmowCNNBnd0?=
 =?us-ascii?Q?hz78oFd9oceabqtYumJYXAdfkxijkGmW0X2e7SEuTzZEHmWR5KiVifU5AHP3?=
 =?us-ascii?Q?IOFNOsbOqZCM49QAUrmlOWEyIDAk2x5EqGbtKxdmNLxjKG8cQCcqGkJzg0+F?=
 =?us-ascii?Q?v0xuP0vJc8kgjsc0kb9+YHqoiozMgElykRUzCCnkC/0l2Ojuxb3cx9dyJB3p?=
 =?us-ascii?Q?t5ACO/xXeXTRIXBz2nAXQ/8nqHsRPq90h4qTDQ6dgk22cZ2onVskCIKDkC+Q?=
 =?us-ascii?Q?ZBkv4yhun5ASp42mRSl5M4I25y6BCOkTRfZkjjl4hb3KnavK+ZgZWbQf8w6W?=
 =?us-ascii?Q?BheivbQcLemleJn9DKyoa5pJyDLjy/qnxIc3UJzm11q1a/5J74NSiLr2JAsc?=
 =?us-ascii?Q?htr1L0c50myDOpPuWTWueaeERPW1PxRh3U1Efq/Ya1bQopL0xlWWjfA3kYCA?=
 =?us-ascii?Q?89K21hIep87Cq42uiN6BlfpoijnlpduA2STZ7vWgsXE39AAMyBSYP+tlIfGJ?=
 =?us-ascii?Q?IRPGd9Txr937QpRHnyOxVljKHmJqVCNTxrrsz9Vqk3beRcoo9VSPCJVyWuqL?=
 =?us-ascii?Q?0MPN0WwobjvKbqTIBPJDv0s/y2bsrW2EP4x7tEY4bwl767d3n1/ICdRkmcFi?=
 =?us-ascii?Q?5pPoU16A8XrQXrig0J6MGf3d6/5TJnfPkltVp1RE7WeGkUuSI+Zgar1dNlpm?=
 =?us-ascii?Q?2tQCyCSgRTZtzmTJt37LBEYKEJAYrjRJZ95717SrY1rY88wYBLzKO3vNU/Rk?=
 =?us-ascii?Q?z4K+f2mcpZg0S0ShgnneyiTr6BZJnVtDP0B2O8qWPJBexJWKTGPtItJmYP9s?=
 =?us-ascii?Q?9F/b8B2lr4M6GUU09gxO2dsglVgbiTQZKwb1YdYzx9tGJgo0om8tEO38JF+A?=
 =?us-ascii?Q?/+tIhEfJUI+u7R2PLMVmcujuVpcTxACMFt65Ff9+azZ6W2wM5mSYcn7KqHDI?=
 =?us-ascii?Q?ORfuoWuRsxZSTW+Gimb5g2mE9jlTjw71jSPmnTl3HNr4rthxTYHU2IyLcWw4?=
 =?us-ascii?Q?kb2UhiFvdr+wyJSU3ktvq8bwH/dQBZK2ey48TcYh5BF5ek1jog79CFhReZGT?=
 =?us-ascii?Q?ZZ/6Yaa944CmbDhBmryakKAvzo0To6Ei3sVxIuvdsw6dhY2hk9jboNXzrILw?=
 =?us-ascii?Q?UZ03aZmDwIg/IfN4se6E/T/EVJnWTfnEEVGqcYnmfuhIDB2vH9pp/3Iqqk+A?=
 =?us-ascii?Q?Vj5hmF68xIz41dk=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:28:43.4976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0e49f269-1738-4e8f-d949-08dd4740ab66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7174
Message-ID-Hash: WP5ZCZA7K7OQPXAZG5BLE744PA4EJKAQ
X-Message-ID-Hash: WP5ZCZA7K7OQPXAZG5BLE744PA4EJKAQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WP5ZCZA7K7OQPXAZG5BLE744PA4EJKAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use macro for ACP6.3 PCI revision id instead of hard coded value.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h  | 1 +
 sound/soc/amd/ps/pci-ps.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 01910273624b..8f3a597f658b 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -11,6 +11,7 @@
 #define ACP_DEVICE_ID 0x15E2
 #define ACP63_REG_START		0x1240000
 #define ACP63_REG_END		0x125C000
+#define ACP63_PCI_REV		0x63
 
 #define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
 #define ACP63_PGFSM_CNTL_POWER_ON_MASK	1
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index f5beb7f14913..9cc66a807ad9 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -562,7 +562,7 @@ static int snd_acp63_probe(struct pci_dev *pci,
 
 	/* Pink Sardine device check */
 	switch (pci->revision) {
-	case 0x63:
+	case ACP63_PCI_REV:
 		break;
 	default:
 		dev_dbg(&pci->dev, "acp63 pci device not found\n");
-- 
2.34.1

