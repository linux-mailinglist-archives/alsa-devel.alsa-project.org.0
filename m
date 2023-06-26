Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5677C73DC7D
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 12:51:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5395793A;
	Mon, 26 Jun 2023 12:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5395793A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687776714;
	bh=PsxmF4x6lKeZxZHKQRHMxEEj80/lp9AuJT0hKqcQ7X8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gdv4GH+DfLgV7XQtEIdtParj0sLYMdDMDGhiPCe3EE4p92KiQnteWv7TSDMOvmU9S
	 ctFEceODmJmsDY9Tul0Y/oZE0B81gy/I8fKUieLQZxfDG99hBoYNjJDST3pFgrLn05
	 lK5JrB4RpcbsgSx8qwKiZGRCRjxoJ9dTYcmJTCG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F01C6F8057B; Mon, 26 Jun 2023 12:49:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C1AAF80579;
	Mon, 26 Jun 2023 12:49:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B94EDF80579; Mon, 26 Jun 2023 12:49:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA066F8055A
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 12:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA066F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cwpAP9xF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpSdtCvN9DGPxwGL9e6F6IvbaB66/OXu8TRHam5+VBilwUvelagd5J9EvIaUstVv1UVwlbr2yVoTlogI4P+zsIKXZbEkfjFnhAoHOejSeNnbvapD5sBxPPQwEinoXYQ1hC3w1HWqsg+gLg3mOgekv0KqpYMWhBkkteRhEpLrWqHu636JijQitbhlHynDk5ZfGZJUoQ50PrgTFsk5uyaqKeLGGdd07/UQCXs6C4ZQM4h0yKB5IxqVWXwyNCsd2zkewi+wpt6pq6H1eDA35i3qvvi8JzLIl/BdGcmsGEXqxwBBrEnl41wiEW4DVmoFuCGhTmtPW7AwolITcxw0YOBhHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSrksC/0PHXHaJnoOkeBX10m0xsOLFS9Hz6j+Gq1pJA=;
 b=oMytg1S51Ej5Et5ro1ErW4k9LE/EhUGhouJH5Bs79C7ipDHvDY9H4xS71IOaIc7UVnf1F1UUPcQ+UtuibLu1weyG3peyG4ffbCnG2BCQ4HLCU5bMqeT4D1cW5b2BO0Vl9anrx6uNSxSqL5WYQ/WhwZ0PhthRR9gm251Uvwkp0VjVVeJDUALj8qjSZFiQJcPSxg8ijKx1HNVdS8/agRW+qRIqb7iBN4JrV6uq3RuFgKzE/P2OFoYfevwyTup4obO/i1ySsPgYpZZBwJ8+jET4pBKMTEdnicaRoUcv1fFzZgcSx9bgNXrVJaCvu2XhYfE45Y6mtpVvsWcrZkfgmtjIng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSrksC/0PHXHaJnoOkeBX10m0xsOLFS9Hz6j+Gq1pJA=;
 b=cwpAP9xFQnijIcLy9wxZp5drPn82LHp1wpMEMFI1YlS+7HrgG5aAvNPSk8LKoA0aU9AtBeJi+Q9q3bbG05s7tvk8wm0WRw7NdTN/CM/shoSN4ufMa0fPdpbIontW4QeOQbAlaXCZA3ewkpl8gCGeaGRDEjU2dHLAOpiiXrFM1Es=
Received: from BN9PR03CA0909.namprd03.prod.outlook.com (2603:10b6:408:107::14)
 by PH0PR12MB5605.namprd12.prod.outlook.com (2603:10b6:510:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 10:49:45 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::eb) by BN9PR03CA0909.outlook.office365.com
 (2603:10b6:408:107::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 10:49:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Mon, 26 Jun 2023 10:49:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 26 Jun
 2023 05:49:44 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Mon, 26 Jun 2023 05:49:41 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <Mastan.Katragadda@amd.com>,
	<Arungopal.kondaveeti@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/6] ASoC: amd: ps: add comments for DMA register mapping
Date: Mon, 26 Jun 2023 16:23:52 +0530
Message-ID: <20230626105356.2580125-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626105356.2580125-1-Vijendar.Mukunda@amd.com>
References: <20230626105356.2580125-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT034:EE_|PH0PR12MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9d07b0-afac-4be7-603f-08db76330dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tRnkt7IiMO1Idy48RDSxRzDAzKFvAXcWpVWWDwFXpOGfIMaNrILdZEZLscKgnrs/9HqXfNgVb8Jelq3/yowIW27+F3cGJk1xhbXqbJh2M8geYk9vnmVs1qViDiHsS3cANpitpOdiH8nBiUk4bi7usLbVDdHiM4XtQWIz14NGS1ydN9/6iIHefANQ3lpgfdU6LtTMO6UY6chWrW5hgDuhudch2fWclUR+ui8cxpcNllkTIt2g5LbdYWUfUpQmGTnHQabATr6Ea04qMjIGZyoBv9JA6W36uw7CleO1Qucvz9tnB/Uvf88vCHL4lM5/yPAeUeuDmKt5O19V6/GllScURiVklg5EvcTtWApHiFYztoRESBm1V9LINo3gEeVe0H/kPOL1jNpPwKmvcUxRQJ6jBQVTc34xNXaCWZMbMsfDiiwgw30UIfp9u9nnz7p88CULb5WVSq3BkWJ7z0VxK4S44I90HvZqMmbf7d6+Fy4fj5Vdj4zjxaXKtjVanvpGj+ABdmKQRrijanIAh8A2iik3Fw1ToUy3DTAVVH/q9Kjv+OMZ9JEH8b7ePenW7qQ+tDGVJeWAjhNejjOxN+yC9jxsELkXUT6cFz5TCBPnIcezgVvq1fl9xs3iuJQYiASo+EqkckgkXibsVbQ7yVEbhw/ZRF5W3uKILc99TXwvKdGs9Si7TSbh2ouy7egxtZfxF/9Ae+fzUUeFBBRWJGa4CDx3WuJKXqj8XDKwIBk+pQcBcmKMTiw1Am5VybgP0UWpo29Uu6p6j88hXbB6suA2yFA6Xg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(36860700001)(47076005)(6666004)(2616005)(7696005)(336012)(426003)(54906003)(26005)(1076003)(186003)(2906002)(478600001)(5660300002)(36756003)(40460700003)(70206006)(356005)(81166007)(70586007)(82740400003)(40480700001)(4326008)(316002)(8936002)(8676002)(41300700001)(86362001)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 10:49:44.8381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f9d07b0-afac-4be7-603f-08db76330dbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5605
Message-ID-Hash: MAKI3K7A2LYZ7R4BXGEMNFYFLJMPV2ZR
X-Message-ID-Hash: MAKI3K7A2LYZ7R4BXGEMNFYFLJMPV2ZR
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MAKI3K7A2LYZ7R4BXGEMNFYFLJMPV2ZR/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add comments for DMA register mapping for both the SoundWire manager
instances.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/ps-sdw-dma.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 3ab41bd1fce2..000ab5d96815 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -39,6 +39,11 @@ static struct sdw_dma_ring_buf_reg sdw0_dma_ring_buf_reg[ACP63_SDW0_DMA_MAX_STRE
 	 ACP_AUDIO2_RX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO2_RX_LINEARPOSITIONCNTR_HIGH}
 };
 
+/*
+ * SDW1 instance supports one TX stream and one RX stream.
+ * For TX/RX streams DMA registers programming for SDW1 instance, it uses ACP_P1_AUDIO1 register
+ * set as per hardware register documentation
+ */
 static struct sdw_dma_ring_buf_reg sdw1_dma_ring_buf_reg[ACP63_SDW1_DMA_MAX_STREAMS] =  {
 	{ACP_P1_AUDIO1_TX_DMA_SIZE, ACP_P1_AUDIO1_TX_FIFOADDR, ACP_P1_AUDIO1_TX_FIFOSIZE,
 	 ACP_P1_AUDIO1_TX_RINGBUFSIZE, ACP_P1_AUDIO1_TX_RINGBUFADDR,
@@ -59,6 +64,12 @@ static u32 sdw0_dma_enable_reg[ACP63_SDW0_DMA_MAX_STREAMS] = {
 	ACP_SW0_AUDIO2_RX_EN,
 };
 
+/*
+ * SDW1 instance supports one TX stream and one RX stream.
+ * For TX/RX streams DMA enable register programming for SDW1 instance,
+ * it uses ACP_SW1_AUDIO1_TX_EN and ACP_SW1_AUDIO1_RX_EN registers
+ * as per hardware register documentation.
+ */
 static u32 sdw1_dma_enable_reg[ACP63_SDW1_DMA_MAX_STREAMS] = {
 	ACP_SW1_AUDIO1_TX_EN,
 	ACP_SW1_AUDIO1_RX_EN,
-- 
2.34.1

