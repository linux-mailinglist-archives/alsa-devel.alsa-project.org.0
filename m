Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4057A2BB91
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:35:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C4A5601EC;
	Fri,  7 Feb 2025 07:35:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C4A5601EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738910123;
	bh=HT/WYyoNb7Ak6bfRUxM2cBTsmJfApcoItYE214m88Ew=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=THUD98tK/U/90zuFzrqWuU8pqGzGG5/vszlSL7AcXwlfvafQtnzr33llua87zeixf
	 894tlC9DYBDFJ32rpoXGveMztQ6HJH6VDI5N3yP06bE/MK/nvqH7liVqCWbjY/bhMy
	 4EV+scMsoOUoSbVlwf45FWVhdOzAYNoxm4JxqVtY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF1F3F896F4; Fri,  7 Feb 2025 07:30:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56528F896E9;
	Fri,  7 Feb 2025 07:30:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2834FF80640; Fri,  7 Feb 2025 07:30:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::625])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA15AF8060D
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:30:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA15AF8060D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dw12LYll
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5s0bPvo61aAzsav3zjPY3vrbCBE+U/H8Bc7wmhvd2R69qX7BEvEjIjGO/MCvTHJNDbfZNHcArjDjlm+OJtVW346Mzm95axMLUs0AGHFClwkt24ipWhQ6aLIB9Qi+UNmyzDUhBfciiaIn9FxOn4zgQ6NkBMgxDGAss0m3gGlIxmzd302k1FHLGLd5AXuySGrV1wH5k7IkP4FiZqYeuY1l7TPZrJGVl7fD4CafOA6RgyVJ02cMhly+BToAmBl7D8G2OlDVCe7Ry9sDU9L9HYjiB9cnAQmxrpUxtkV2Zn4Oo0LMpmeYKoDsxsN+DlCdwjBcqJj4xCblEKxobwKBZYQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXi6JwICWCjhKGxjpnX3NCL2X9Gp4MZ20f4F5bwn9WQ=;
 b=S1mJLm7CxVhtcK1iv/bTStNGhTowRMDHcKJuFsQi1ChNbD6h1utTh+NQN3DZt7FdI/p9miwhfiIUVoa5AXfqVwBbY7kn83urW1eiyCEER+ajdejSAhi+NRTjg4fQndLPH+/XclHHdmNBIU4rippDvM0wrIBz4OYWYl7uTwx2S5UmuJG1DG9Sbe0ZOQ3qmy/wr2lacLS9WR0SNSf16E1aJwFhrPeqpx227z1FRG0SrZl8caTeoTb9QgAXrmshN1znR00KpqjOKgToYxrMAkW7H+Io2uTvhgFLnFBM+n5izAudYYH/AV3Rxqoi42lf0zzTct3dFyjX6Cy10oET1WqMTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXi6JwICWCjhKGxjpnX3NCL2X9Gp4MZ20f4F5bwn9WQ=;
 b=dw12LYll6G9y0qlYcBIhQzR3Htst9jKia0xoauXDvh7zmyzPvBIwTTC52TZspa/G/gyvgVjYTlSKLelvHCTpiN1WFQdvdSL9Faz+ZlZlRQvN2AlUr0ldOpMGVeAZYRl89QtCmYTPM9D1IqGU/MwB715M6SdSWQxBFUfX63zIPps=
Received: from BYAPR06CA0045.namprd06.prod.outlook.com (2603:10b6:a03:14b::22)
 by MW6PR12MB8960.namprd12.prod.outlook.com (2603:10b6:303:23e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 06:30:24 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:14b:cafe::38) by BYAPR06CA0045.outlook.office365.com
 (2603:10b6:a03:14b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Fri,
 7 Feb 2025 06:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Fri, 7 Feb 2025 06:30:23 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:30:19 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 20/25] ASoC: amd: update Pink Sardine platform Kconfig
 description
Date: Fri, 7 Feb 2025 11:58:14 +0530
Message-ID: <20250207062819.1527184-21-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|MW6PR12MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: c25e1a7d-7a1e-4679-d2c6-08dd4740e74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?h7HD1pv5JSwE1h6+bQFqsZ+tnTWhqGwPg7+1RUI5lfQqD1AqRb/+6Sbh+3iq?=
 =?us-ascii?Q?bxgauu/iSTilVYW5+hQkWle9I2ea9RJKs2nm8DShC5KtX5FLuyQb2A0Ielm5?=
 =?us-ascii?Q?QcHkLDFVoaTFHvAQO8RvNWwtAgX54nd655lj8RjYXdt1cCHf0HKBOkee9opa?=
 =?us-ascii?Q?Y5HvUOLu9yvVaGGdtjzh6FPxNRVCUkgrTy9X24utnOGejB10tRnqKhGs5ku5?=
 =?us-ascii?Q?etv5bnP0peoTxtatWtYuNMjYdai1E/eGImLoZ9x6V6G3eCgT4KG9sGwSSGsf?=
 =?us-ascii?Q?kHGmxY4xj14MXcGae1ot7pCaHQ/7WGp7loASIYNMVIX3xpBfU4zIfq9FipgV?=
 =?us-ascii?Q?/P2lP9OMbm9si8hCbL93sxOWSFH2Z7gKoMLqGUdeFqaEkpaa9XJGT776s1GC?=
 =?us-ascii?Q?8dw9sNKFlRkGb7OHEMP7Uc+zma5A7PzF6Vwwbj/mU3OmTPNMhJdrFDth/Hz7?=
 =?us-ascii?Q?/GNcjS+MvOhIcB91FjTwV1OqQzRgi7WlKAWbLCycoMgUDoCytG+KyUNsN3f6?=
 =?us-ascii?Q?P/0iQW/m7p4P4bfGE8D6jboRpp+Qa3tDkIcLtZDjkbvfS1KSrTK62DWt3Vky?=
 =?us-ascii?Q?6WZCIEYUlWmK5sTBIWR7QshX5NgzBmhlUsAD706z+dNSH6nbgCN9B+CKONVS?=
 =?us-ascii?Q?wpVr2ZDKbOt2B8kQJc8BQkD01T9rTCD+Qgg+tOepJ6hJzFfd9NPE4IVCGsXU?=
 =?us-ascii?Q?ezOKlriW1zkhe2/xVgI3Ej1uF29LqBuNr6+nTQC+3OJFXuwsvequE8MS+izp?=
 =?us-ascii?Q?aQWY8OpUw5AQTpEu5xk+7OXqcHQSUivHzV/IgHOC86rAKoOBl7tq1yRFQLbM?=
 =?us-ascii?Q?3dT4Mbxf8Yz2jLudlze2AhIeqsue4iCKkWGGYYG0cBKfIA1WhXaenpeM22Jt?=
 =?us-ascii?Q?zQeOix5qnIdgzEiMtF5gbTe8gRci7rtk3Fchc4coRmR69vtJu6K3FJFZfw/v?=
 =?us-ascii?Q?5l+md/QtxQcKhLqyv0ssnTuuPAQLyXxFsNQ8dg7PM6Xy0cv7XpGq01h4nNt3?=
 =?us-ascii?Q?m7wh0ZxceS/DYGgWnU4CKPsh/JcgpP9XDzf4dTB4R13ZwCdBzirT1YGwi0bR?=
 =?us-ascii?Q?wNw2eSI/UIKDDBr89HtCfQ7h4OoujvLZ704h00QDeIFHFYTgyBcRvY6+VqCp?=
 =?us-ascii?Q?/ctqF9+G/JueoruXoiM4wvm1McNJBnfeIYpaV4qGXXcMa1zb+8HzOgDh5nwT?=
 =?us-ascii?Q?O84zhe52y4TlGy72IfxN0ZZhT8wsFxG6YaBAdgzbprkY7SV9TFc9hKIdWtHJ?=
 =?us-ascii?Q?VFkwHZ+WmWAIwd9WjQg1C/pZYzFPiJRP+X1U3r3CEXAfPS6ycfUzeknH2E6b?=
 =?us-ascii?Q?opk29ybQg3dw2X1wMxRavUE3zxZlK1lGTO3UhRkMM6RIiMp4QwWLePJSCc+g?=
 =?us-ascii?Q?XSqXXfbPTbzdoDB9QSfn4JdeLjmJwK0ZSJMb0HsCpzLIGbxeV/pQynzotZ+8?=
 =?us-ascii?Q?dmFBkiCbmujn2VBwuGguOpJSiHHTlte5pOwekt0scWPy8kzZC0NGszaYRab4?=
 =?us-ascii?Q?v0+WxxHuQa1QDao=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:30:23.8966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c25e1a7d-7a1e-4679-d2c6-08dd4740e74c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8960
Message-ID-Hash: AXCYPVPM77HSBWW7G3MISW6S6WUJOGAG
X-Message-ID-Hash: AXCYPVPM77HSBWW7G3MISW6S6WUJOGAG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXCYPVPM77HSBWW7G3MISW6S6WUJOGAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update Pink Sardine platform Kconfig option description.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 803521178279..c7daae392d74 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -161,15 +161,15 @@ config SND_SOC_AMD_SOUNDWIRE
 	  If unsure select "N".
 
 config SND_SOC_AMD_PS
-        tristate "AMD Audio Coprocessor-v6.3 Pink Sardine support"
+        tristate "AMD Audio Coprocessor-v6.3/v7.0/v7.1 support"
 	select SND_SOC_AMD_SOUNDWIRE_LINK_BASELINE
 	select SND_SOC_ACPI_AMD_MATCH
         depends on X86 && PCI && ACPI
         help
-          This option enables Audio Coprocessor i.e ACP v6.3 support on
-          AMD Pink sardine platform. By enabling this flag build will be
-          triggered for ACP PCI driver, ACP PDM DMA driver, ACP SoundWire
-          DMA driver.
+	  This option enables Audio Coprocessor i.e ACP6.3/ACP7.0/ACP7.1
+	  variants support. By enabling this flag build will be triggered
+	  for ACP PCI driver, ACP PDM DMA driver, ACP SoundWire DMA
+	  driver.
           Say m if you have such a device.
           If unsure select "N".
 
-- 
2.34.1

