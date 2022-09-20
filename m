Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6F75BEDFF
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 21:47:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60299857;
	Tue, 20 Sep 2022 21:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60299857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663703252;
	bh=WbPtmeeEsrtMhnOhLFl+taZqYiZfICbsyHrmId2MjIk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ImWt3rMdjTiskXFOk2usjDIgKFrZfCdU92eK93NfPv6r+vsH9yDGbuIbgXnOY+Gje
	 55m/P5N8okUFVXQCZcK1GltBtqAUxX3nqCRUEzv7v2ROMZbUW36fdeeNWDC9xri0OD
	 yBVgTfAsFpkE5wT71JPvF3/CJrHIJknBgFm5lP3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD406F804D8;
	Tue, 20 Sep 2022 21:46:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3B3EF801D5; Tue, 20 Sep 2022 21:46:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C60DBF8012B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 21:46:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C60DBF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="oy92gZ2M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0CX9lnzkldffKZDtDNxwgvuX/N2NAEGGZkWcVUNKmIcLItWUBf+nEbesIC7C3mcBcf7ia+wJ0peIx+kDP8Cr+/JqOmRms62BGE+REz+aXPsxnRp3zNMuFjBCLZc5Ma2e7sKZCVI+jNdPRfZQDYt9UD3Oc9HE5+KcX0kY5nxRchlmvbwj96vBOkD7YVO1Y/MYDbZsin3HQcBRWjypb948Y4EkI6VNGjwxv05kmAGZK3xtDWTPcbIFr9KoKYRiCkJCQbY3B+nD0cjbV8pPDoDhLkkI/poB72oKfS70Y8TjdAben5QMYKqjGihyJR0cSM+61L5zUFiVxTxqmMM07FkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KETA/lfNuwdT3pbVjMCGv3Uttsje02c/enkK/sbHbls=;
 b=a/QBMOBcwMTBmgWJUT8Bn9mXCYdD06VmhKXvEQuKkmyYYNaH8Kzx/6SQNn7okIzdwEDgV6YQNK7TjjQcHMZyVVtyXYOwuvTvwzxfDPsanYvNVvuNUwVQCcTah7XLOb11HYSrOQBweUXcaBhKt98dpvF5WnEKiSN8WA8GrQ1F/k4s5nsnoFAQP4+wrIUyXEZJcuBsszKGOtIQQnPa5Udce0RLhpslUXy++GRER+bqqMz6QcTQ4pY5vvc/A6wMuyfvLzYTUCD5u8UE6Zm9+N0MiManzbOX82NkzTy+Pyat0OAozfkot7VNTwCCCo9TuMisDPaYCtO0unyoYfx0sL/ScA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KETA/lfNuwdT3pbVjMCGv3Uttsje02c/enkK/sbHbls=;
 b=oy92gZ2Md81xbSNsOEQy1XclqyNPOKJirHU1K2F/kgOFCFCPPA1dxPjV3iApy0buQ2weJV83YEAQWn5pBBeOpJdCrBV27AikczEKkO03Yngx/vYdAAIePdrK/oxrnCspiOJ5NrtpfedMZT4WO2GT8LfDnNkgStXhbieYqEyJtqs=
Received: from MW4PR03CA0074.namprd03.prod.outlook.com (2603:10b6:303:b6::19)
 by LV2PR12MB5727.namprd12.prod.outlook.com (2603:10b6:408:17d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Tue, 20 Sep
 2022 19:46:25 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::8b) by MW4PR03CA0074.outlook.office365.com
 (2603:10b6:303:b6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14 via Frontend
 Transport; Tue, 20 Sep 2022 19:46:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 20 Sep 2022 19:46:24 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 20 Sep
 2022 14:46:23 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/2] Add some models into acp6x quirk list
Date: Tue, 20 Sep 2022 14:46:19 -0500
Message-ID: <20220920194621.19457-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT032:EE_|LV2PR12MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: a500cebd-a260-40ec-3310-08da9b40cd44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 07afbfB+Ymp0ORIJChlaW7Gz/1ij421/JTrGeaLSHnYE8iH2x/4DoZP7o6NyjaxNRg0ZW8zKEX0hselVnQPSyMX0P5OjOUNdmON+7mkywdyff1Dfeb38DCYSr2BcYsz5hw9EKBJUcEVduuDtrdupdAVLk/8NBckR2r/hgR5JfC1bu/u/8TpY4AziU5ak5V1YBLTkZiCicwCW2t1FmXVwGfpjhjNbkYhL2UMBECwkPGatuz0cDzdM8qy0o1M0qwf51RCUbJo3u4yhyKYlnnyI3cVlh+s0v7aiAZZBkM7EwyPaqJC0Nn9ZfQ2Dm65UihPyVcqvNfB77tgv+NR/3dNhCNsg5RKpyZ3/ydxGrWoDuTYhrPZ+dFC6A5mf8JH0keWSHoBjKmhktG/lA44EE67t0Nr6WSKeaCU8LpETqMhVgvRnenxHupm2Ht6+W4X1Nl3BrFGLN902UF7tnuNTh0MoEGCAB5O41266VF6VxY1f86F8UP4E0SFWfXci6zmkWvMu/M4Gcu7Lza0ym0pYoI1CoWZSSvyd+vhkywmHuR47nwM4ycQ24O2s/VldDgaax+CPf+IabEy+MSr7VzbzhuOHDyIpe1uRWKWdg9nc8KRd4DpzzxI87bT91QFbR24HpBWh0Iznzzoi5Zj2O2V5ZZqKqGeJFfWjy/esPszA2qcVyM6olXpyLpHCi5EvC8UwEktBzsS2K3DZ6bswoj87CRbZLryLpc6z1vbXRFuJrP0uImqu8xPOSR3CwdRZmk9T89N4ZbttUiW4SzQe5trhQ+mFY5nGsjNfdZF+hGnAwSCMf00T9MzWSEqp+bRyOMMghK+ROPjoUt2kNzkhyWqLkKmlWg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(316002)(36860700001)(82310400005)(426003)(47076005)(2906002)(4326008)(8676002)(44832011)(36756003)(70586007)(70206006)(86362001)(40460700003)(356005)(81166007)(82740400003)(4744005)(478600001)(40480700001)(26005)(2616005)(6916009)(8936002)(16526019)(336012)(54906003)(186003)(5660300002)(1076003)(41300700001)(6666004)(7696005)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 19:46:24.8638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a500cebd-a260-40ec-3310-08da9b40cd44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5727
Cc: Travis Glenn Hansen <travisghansen@yahoo.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Xiaoyan Li <lxy.lixiaoyan@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Sebastian S <iam@decentr.al>,
 Saba Kareem Syed <Syed.SabaKareem@amd.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Another model from ASUS and Lenovo have been identified that
don't include anything in ACPI tables to indicate they require the
ACP6x DMIC driver to be loaded.

This series adds them both to the quirk list.

changes from v1->v2:
 * Both models were independently sent in v1 but touch the same code,
   so v2 collates them together.

Mario Limonciello (1):
  ASoC: amd: yc: Add Lenovo Yoga Slim 7 Pro X to quirks table

Xiaoyan Li (1):
  ASoC: amd: yc: Add ASUS UM5302TA into DMI table

 sound/soc/amd/yc/acp6x-mach.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.34.1

