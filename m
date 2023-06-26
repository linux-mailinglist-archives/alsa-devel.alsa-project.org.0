Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B35A273DC7C
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 12:51:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CF0184D;
	Mon, 26 Jun 2023 12:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CF0184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687776695;
	bh=lCN/6l7UXtET39k4PvuBxlWQPhYxOHxGnvZGhlSwQOY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kl/cnRlOQ61UAjW6mAvcrUl/VTm/xonLiq5wq3oiejlI+rRy7BVWBoSWqtXBfqPJN
	 qe76LmcHL3AeqVsSOdEPAReDsoVdFB476OjWFSm6PB4ztH3DqR6jVEZyW0/KxiEps0
	 X4NmuzTc/kKSygj0E8ugKkv93NaHluFzWHZ37to8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F1B8F80578; Mon, 26 Jun 2023 12:49:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6351F80563;
	Mon, 26 Jun 2023 12:49:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3D11F80549; Mon, 26 Jun 2023 12:49:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A3A6F8053B
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 12:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A3A6F8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=i8+oVvpn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULhyrR8mnkMtLTqG1een1RNXJJ8FyMCapzuIU640U2/9v5DbE85MUc+2bqy6RbE+5RqJJpGHncqlf5HupJTwzflpcVxJTZTn9OiU8oaRFQv0nviH4/mad0jJEh6/64pDE0VfyBUBxsQDWQcx5AOJ447vVhIiPSe0HouLF5YKe7oKcZFRFdOPGP6FiCxwud8HTsDr5VokH2dfdA5yh5yEanJy0QTxbq6ChLt9pv8I2D0MnYHml7E1i5EOpD5Qq7yNE1NSWj/rDzD/AZdQjEhw62f0uL6Ae/34espOPdaVY8b9LYINFQqUKlIMB+yMV4zBoMl24oLviodbla5a7utHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIk2r0uvcF642nGKuMeQNKi74wEmD72eDb1fed+gnJo=;
 b=AkAT5O5et93UYUCU2Itpba/kYiRGGj/8QT+kTFmAxj9adUYJDzgBx12LMANR50M+dL/um7jhsw+ilmAbQid2mvo7aZc3ZuSagMJxGp5cGMC/4SAI1S5PhuJg90XOBgLxG+8CWEs3Wks77c0DLfNjgV5ujxm+p6uz7e08sen+9FnxEpySyDJPIUzW/zc74sx3Pq03EqWn4z9r6UYHRUBeWk2/SwS1qAGpLrOA5jowdsLiCjYr99wE00r6tBj/o5v8rESIhWISYcm2MDUD7QnUk7ggfoPq8+xt6VeTlnIhqp+EYcst1uYNdbA/bMYIVrEkXsmmKmyDbicAYtDt67y4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIk2r0uvcF642nGKuMeQNKi74wEmD72eDb1fed+gnJo=;
 b=i8+oVvpnzY5k6PbcknPR9U93jM9c7kcw9QwtL51mLJG9WEdGYcrGLJRtUFlBjCAsiD8G+ERrno80GZkxmhTsSppDzVnHTufuBIgraW3ScrmszqSY3mnumx/U7sP2L6J7iYziW8ckz5ARwQBTT4Mlrk2+A0DAHgIc4FfLNofqLkk=
Received: from BN9PR03CA0850.namprd03.prod.outlook.com (2603:10b6:408:13d::15)
 by CY8PR12MB7097.namprd12.prod.outlook.com (2603:10b6:930:63::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 10:49:40 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::7) by BN9PR03CA0850.outlook.office365.com
 (2603:10b6:408:13d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 10:49:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Mon, 26 Jun 2023 10:49:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 26 Jun
 2023 05:49:39 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Mon, 26 Jun 2023 05:49:36 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <Mastan.Katragadda@amd.com>,
	<Arungopal.kondaveeti@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/6] ASoC: amd: ps: fix for position register set for AUDIO0
 RX stream
Date: Mon, 26 Jun 2023 16:23:51 +0530
Message-ID: <20230626105356.2580125-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626105356.2580125-1-Vijendar.Mukunda@amd.com>
References: <20230626105356.2580125-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT032:EE_|CY8PR12MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: ef92b4b9-a2d7-455d-9715-08db76330aa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J5x5U72IKsS2Y29gvXZ5D3k9dykI2ZrF+cayqEAwa0cCnyPTWWLU71WKihIGqE3oS5pWynswIM264/O1S35ZX8k4XcsAmeShHnbBrw4+7mrCEMxPiiMmc4Cp3hyyxwOcxJzEHmeBf/FW5oGt+eFlbii21t6o3toUerq2zAhDuXom4BRdZzc/c3AMTP2Dizm7g+FXkY2aIb/PB+ut4w77nCe2Zfz4lnY5zeGnAAAsRCilk9bjtbgYuCPW285gitCFOBOtohAzdvOuHoa7XYXDZTuEEx09ZAmC/PRk+hbbJSNoMqVyLwGk4YidX7FYPuVVaRGP7pX/ayFQH1OVb5WJ3HdoTX19LZlKbFZjpVRCEkRZmp4xWWO0a4+LypMAZlEzqe+Vt+/784y9CgwLSKQ77J5idPlb8jqC1H3ROJsNFIpWtstNLyNeiMlijrS88b5yd+BN7ThuJTrEUAXlLBk5ZYGYJBek4lMH8+k/kOAfIJ744SB1zxl8V5EcAkgRXmPYjOfa21BnpiEEPDjLHdrZLvxXhrKQT10+0Nl6F+dgnVRqfH8gUL/2G7z5thHeGYSWq0R8wTJK2kz6nDDCPuFz2mncQk242gaMSMHVNfTLo+9aipTDrD4Qw6XOxZrJtK7NonY3xcMRHEziJjSCT4EGWdT34DkeeT5+GteNT3oj9RJCPTvwKXcWXyPnR1Np8sC+zCva9KMx9DB21DYR+ni5m/Nq/2gD0V1CsTzOLQpVpAW4rME0GfUBGvTnpzY7gt5/RI5F4YjNg/zdC2+u6boPzQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(8676002)(70206006)(8936002)(41300700001)(316002)(70586007)(6916009)(4326008)(26005)(1076003)(186003)(336012)(2616005)(54906003)(478600001)(6666004)(7696005)(40460700003)(82310400005)(2906002)(5660300002)(40480700001)(82740400003)(81166007)(356005)(36756003)(86362001)(83380400001)(36860700001)(47076005)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 10:49:39.6491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ef92b4b9-a2d7-455d-9715-08db76330aa3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7097
Message-ID-Hash: Z7YNZPPYJO7IL2Z5KVZ2A46I5ZEF6UW7
X-Message-ID-Hash: Z7YNZPPYJO7IL2Z5KVZ2A46I5ZEF6UW7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z7YNZPPYJO7IL2Z5KVZ2A46I5ZEF6UW7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For AUDIO0 RX stream, AUDIO0_RX position registers should be used.
DMA error is reported due to referring wrong position register set for
AUDIO0 RX stream.
Correct the position register set for AUDIO0 RX stream.

Fixes: f722917350ee ("ASoC: amd: ps: add SoundWire dma driver dma ops")

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/ps-sdw-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index ade130a8062a..3ab41bd1fce2 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -30,7 +30,7 @@ static struct sdw_dma_ring_buf_reg sdw0_dma_ring_buf_reg[ACP63_SDW0_DMA_MAX_STRE
 	 ACP_AUDIO2_TX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO2_TX_LINEARPOSITIONCNTR_HIGH},
 	{ACP_AUDIO0_RX_DMA_SIZE, ACP_AUDIO0_RX_FIFOADDR, ACP_AUDIO0_RX_FIFOSIZE,
 	 ACP_AUDIO0_RX_RINGBUFSIZE, ACP_AUDIO0_RX_RINGBUFADDR, ACP_AUDIO0_RX_INTR_WATERMARK_SIZE,
-	 ACP_AUDIO0_TX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO0_TX_LINEARPOSITIONCNTR_HIGH},
+	 ACP_AUDIO0_RX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO0_RX_LINEARPOSITIONCNTR_HIGH},
 	{ACP_AUDIO1_RX_DMA_SIZE, ACP_AUDIO1_RX_FIFOADDR, ACP_AUDIO1_RX_FIFOSIZE,
 	 ACP_AUDIO1_RX_RINGBUFSIZE, ACP_AUDIO1_RX_RINGBUFADDR, ACP_AUDIO1_RX_INTR_WATERMARK_SIZE,
 	 ACP_AUDIO1_RX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO1_RX_LINEARPOSITIONCNTR_HIGH},
-- 
2.34.1

