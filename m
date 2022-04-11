Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 200714FB4F9
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 09:33:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB74316E6;
	Mon, 11 Apr 2022 09:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB74316E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649662405;
	bh=49ha6VESED8VPVY77IjpQARjRolbTlwDaO2ECW5S60s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aFjYvyLrwfmr1MQGcqOeVFYBgFoCm/x1x0T82F9/4P64zoD2OT5dsnxHZlJgYliRv
	 FWeUAqt/rd5RtKmGnnABvuXyW+VpBf0kEWT2XyZKwFeHPnBiqPpQAYmgXt2n0gKbvD
	 BvNsZUsuqaFbmopLBU5mJGOhW91uwQIzBHPVCc9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48435F8047D;
	Mon, 11 Apr 2022 09:32:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC5D5F8032D; Mon, 11 Apr 2022 09:32:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::628])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BBE9F800E8
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 09:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BBE9F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="XgEwldK6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jq/H0UkFslAdKMhg4dN+qT8RGhloyzAuMUumGD3O2KTfR4bw9+CFryRWxedRQaFl6d1bgWb/B+INfbFcdfUXjEXeiJlH5TxqW3QldhuAFShkq0+QRITObzy/x+NY3b/tQ9v7feCmJKBsrFZvB+9KFqnNXccpgV6I6aXX2eIqDt6yyYnTN70LFR4c2H//2MscWtF4lCgdJk8U14P/EI+Xlv8hcRwwJL30f+FPyOiPfF2JzkaOTS1qyW/vJ9S5p5HwvY1PcJofq3wuMmG6xV8bA6c0ukdJYw76YSUFvH/lHYHcGS1T1bu/UBlu27hy5r3jjVPO4fLAIUR4AX4drCYAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+xxEjQUDXHiRorLLG1tGaaeekrSk+5vyK8N9IogFPI=;
 b=g3VjtSrc7UyD1ohbvzhrBDDnyAU9BGoeJMeigAgE8BRq7HfFdw1OctU5CMsVHhmv+MbhQqMyK98oNNfbZ9QJZRfVIxpg411d+DP8VfJWj0Dj8/C+n5V98q1/oAT/g4C64P8tdwJRZR8P/lfUCvtuXPkGmJk6CblzQFCY43e2C17nknKqIA068fDCbcu2q0rElIKM+bMqeaal0ABYBJN4wl0j0ehqjTfVGQg7kBWbawP2wXUSpjXSIFS+1DvZ7ZArFqfkCPqjPgkvWsmrCt4tL/Aaa4Jj7Z5fXB3YNZAm544CgM4sXO5wszSdC4tPjrCPRYn2Svdc/y/EoocoRzbY3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+xxEjQUDXHiRorLLG1tGaaeekrSk+5vyK8N9IogFPI=;
 b=XgEwldK6AOvcU/eSE0dPePUbOe+txLVkBN5Enomw6qas1pUN5ivL6Wqd4wnLRS5TjHvVriuTV3iaSKV0fBxvyS4yq05MqG2wX1sc/ulq/VWLntbFKQVmyukLJebFM3A/nIC7mpPztctf5nU2DGGteIZwAeNaJIhtjy78hB79oAaV6TnW6tuvEUKebYGRlW4k8/sbLuVYv++INMjaiHS5Jpb9oGwBEsNZUJKadgwuDUDKE0wGJw+JI34qhWFJF+hp6/6cPvwk+BAKE88kxtPyTFZKo6AiZtd4cks34CTxXLRvYLrUnn+XpCUin/mtK9RrHfMNAsL/lm3Ijcxi6/NDXg==
Received: from BN6PR12CA0046.namprd12.prod.outlook.com (2603:10b6:405:70::32)
 by MN2PR12MB3392.namprd12.prod.outlook.com (2603:10b6:208:cb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 07:32:21 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:70:cafe::71) by BN6PR12CA0046.outlook.office365.com
 (2603:10b6:405:70::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 07:32:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5144.20 via Frontend Transport; Mon, 11 Apr 2022 07:32:20 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Mon, 11 Apr 2022 07:32:19 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 11 Apr
 2022 00:32:19 -0700
Received: from mkumard.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Mon, 11 Apr 2022 00:32:16 -0700
From: Mohan Kumar <mkumard@nvidia.com>
To: <tiwai@suse.com>, <perex@perex.cz>
Subject: [PATCH 0/2] Add support for HDA Jack poll in suspend state
Date: Mon, 11 Apr 2022 13:02:08 +0530
Message-ID: <20220411073210.23445-1-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 200810bc-e28a-474f-4527-08da1b8d69dc
X-MS-TrafficTypeDiagnostic: MN2PR12MB3392:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB33924BD2B45D0DD9E7B7D949C1EA9@MN2PR12MB3392.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bUvPO7SEJIkTq0rU+Q48LY9hyFH4UBjaJt6xqNezGb8/DxQWZH44gTuFrp3wlsz6ZWa3b2xWiU+Col3hRipXjK4v/EhRxxPhs1a5ouf46+KQE54UH2oF5XRISpiWerxYd//p9Qo5ojKpeagWKQn6Y85SGnyxP95bOq85OaQQf1s0IqmSUasyyPTR7ZtmPcUd/4jiM1u7zjehrRUWBb2DB4rgv8/hfiBjdpGnlMJSc1db+88tPLi9n4ma1D1y0atHN6F9rRggxoOCyR/Ku7Q1B3qHL5d81QZV8BVyxnxb1qJK/pUSsHNI6xtA+AXZR1jXczFHKI7WEWy1A6smAH/r8q28KQc49iOTloe5BrsAq1nR31Pot4AU4T9Weo/1Z76BdC9LS/XrD8sCFmVbg3xhRRaE17ud2S++TfFAwJ/GIMA4LRf/uhou1CJPD4SJnqiFThPusq42b1PRUqMSn3RuFykH5vJn5duBxNxWM40WvEABivVOJ4etM5iTfdmtVaPXFuToRaPmhrdMkmoS0gp5I/Vso1asRi3uy/G/onC7Sv+Q7n3jnc0Tj7cbcihwWRbpYYiMC5m65JB7GWe4BBVgc4wuL4clySDyY33ESJIjSllpKKP8cM0HLVa9LJqW3dZc6riqoJKxr6J+M9yM/syfZzQRu3R7c5B1OKyQgkcySJNJv39Bv7WP7EtXWCzl+YdRulzz8Pj5QKqdnKPmc3iZEQ==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(107886003)(70206006)(2616005)(4326008)(86362001)(54906003)(110136005)(8676002)(426003)(1076003)(316002)(336012)(70586007)(81166007)(356005)(6666004)(7696005)(8936002)(83380400001)(15650500001)(2906002)(40460700003)(36756003)(36860700001)(186003)(82310400005)(26005)(5660300002)(47076005)(4744005)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 07:32:20.5009 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 200810bc-e28a-474f-4527-08da1b8d69dc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3392
Cc: alsa-devel@alsa-project.org, spujar@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, Mohan Kumar <mkumard@nvidia.com>
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

This series is to add HDA jack polling support to update the Jack mixer control
status properly even during runtime suspended state, as unsol event won't be
triggered during D3 state.

Mohan Kumar (2):
  ALSA: hda: Jack detection poll in suspend state
  ALSA: hda/tegra: Enable Jack poll for tegra

 include/sound/hda_codec.h |  3 +++
 sound/pci/hda/hda_codec.c | 11 ++++++++++-
 sound/pci/hda/hda_tegra.c |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.17.1

