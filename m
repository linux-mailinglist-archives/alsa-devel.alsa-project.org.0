Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F2546DBA9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 19:57:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8475252A;
	Wed,  8 Dec 2021 19:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8475252A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638989863;
	bh=Ab5ecqkUAvs0kAkKgxu0qbVyHImlVE7JA1Kg5gRt2us=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xpdx7yJc+pRzTpOv59NwvH3kbzTMPIBNxyxu4mAOp39Sskb6cgnz9iW889i7kcMS1
	 3feMdKVP91QbyHNrewnwdxoyS7TlQ+pZeNxkYWcCDYkAC4aCzg2M28S7C7ydYwaINc
	 19TM4RV0ts17M654X30qh7Bq6Hs/b1kv9oR27Snk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C4B1F804EC;
	Wed,  8 Dec 2021 19:56:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB323F804E5; Wed,  8 Dec 2021 19:56:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3563BF80217
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 19:56:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3563BF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="alfWadWJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COMTeLH6b8mrCLMD0Gjgf3sJ5xzczjt/YzU3UMkjJ2FTNUbkfncmrBlM2oYO4JH+eE2agB4xCJ4qs7tWMRbnX8GNI4BcXZR3wjsxEvbtmz9XXePHPF50EaadVHINlbYhRjpX2njxxR7SG55oZzTkNJvVPbdvjheUcODphW6JSMDwirVkyJPD2qN3BoAvGYAvNSZzllVZa7gg2Am3gWpnsgtKiSijj1Yw4onvo1Uhf0BfQYpZOJ8tbA4bfNEPwizEDG4sCnb+9Upj6iUWSSSPSuzTVFMTQDZ6barHjYNRvoXNEW7CSPiH0C9hlj2jXO3AasaoYXtUp0I4qLgPzXwnAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1+WpsvoCI9Q6hkNeH03CREgfxSzCGiGRw/7ChMfLXk=;
 b=do1QiRkI3LoenY+TR6+NI/CACSa6o1l0ykqUjm/ZHUbw89bZzl/ettXU04N2ldruHGk8ADe+z7c54j5IMBS/sHuX7kVtSlkYx4mxGceEF/nwTE2r5VvlqnASHN37srMSPKvRR90wlf/apW3pawl4Sm4NNhcOzADkl8YJhtG+GaG8ivBCTtAAsnlEDhPhuKjOm+XENDRd3TVlF5wTaD7hdG7FWXJ4Xayn1Y5Q6v5yP/46dISuwNj2JFRr0k3waqi7m6SXgWDjvnuCTodHDZoSROqgvcv3fi4tsxnCbM1bPVtzmX0kVq+vBQaRPbkoSKHKXHGelZbKjANM7fQKJZS1Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1+WpsvoCI9Q6hkNeH03CREgfxSzCGiGRw/7ChMfLXk=;
 b=alfWadWJzxcTsCYyniqALN1QblsxR6f9mxlLh6IlkGD4SjPVO5wiBLViXYgjd5F7VdnET+NOdmpZVeAy0P+B1Ed1hKfw4/DJ20/WW7OmQ3Og6ksWPpiaKiXn6/Ru9kAz/InLIaP87Eenu24xHsA293n5e8YDqRBCJwcKDpz58kI=
Received: from MWHPR18CA0042.namprd18.prod.outlook.com (2603:10b6:320:31::28)
 by CH2PR12MB4149.namprd12.prod.outlook.com (2603:10b6:610:7c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Wed, 8 Dec
 2021 18:56:19 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:31:cafe::d1) by MWHPR18CA0042.outlook.office365.com
 (2603:10b6:320:31::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21 via Frontend
 Transport; Wed, 8 Dec 2021 18:56:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 8 Dec 2021 18:56:18 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 8 Dec
 2021 12:56:18 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 8 Dec
 2021 10:56:17 -0800
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 8 Dec 2021 12:56:15 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 0/1] ASoC: rt5682s: Add dapm switch to mute/unmute HP
 playback output
Date: Thu, 9 Dec 2021 00:25:16 +0530
Message-ID: <20211208185517.1555884-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fd817e2-05bf-4de1-e2c2-08d9ba7c6b71
X-MS-TrafficTypeDiagnostic: CH2PR12MB4149:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB41493C66C98D27A0EBDDF790826F9@CH2PR12MB4149.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lqR4CQN0ehRAtnpARvbZ+nIJ8glh6UH31sZc455hUMgSGqwHTxJGfTHVONodiGe2OqKs26P0hS3xGV7Kzs6CfAlBIUJmK0KuKRp+1i5set9PvC27iFUfZ9qMcunD1jUiXN2gRYBjZaxAhHkr6rEau7DKyGXHbUi9UTs0LKfxKLGeUvSj8ptGz8scS6w9Fx+0FMgKEJW1Qu8SUx3gCDVcPbBsy7Y7o4I6P+0FtvayYzC8nYktO8aGOLedfA7vI9OL/rTN1PCGqDSl00nNq2ZJPJrIhT+Uj9V5TZM25Ux/B0J5OESzPKZwIAMcTQWeK8MPIP3Q7A03Hgdi4jzlComzfl9GY42HBkYM9oA9DLnoOmJnnMnM41JOKN+Zx/TPmeZMLLf+4DS+A/I5F5/G+jHdPMRgpjaEsBbGk4kHRfM4R7QVVO5LxJJDwtFowQQxNNjokJar6sddWJUyoZelCdgIbVZv2FjLngQETD1WemfB1HZDlmftPxojVrirLh4XBHQPF1hQlB1tAEx94bl9gSOuqqTjCOERjz6AuMggj+9lk2atjRglkYYrQm5XwUVlIQ6IFjA6LtDBfxeV60KMRjCMl1uHLrvr5kqLj7rNeOtM7yzpVs50uXPgUFeTmGUjp9D+RSu8l75MaSoEku+m/MXivrjUjU1lIuifx0HNiNmHvFFD2UYW+vTHDxvLWkiLADGoRuRWp8y8emn0hOnsTKxYmoBnmgLXniFDpDMPRHpT7Y4SsJ6tFXbWr9Iii3HeV+F8hmICwpk1CMzAwb/CF9L5cLN5XMcsXlpDKAj8C5TLS9M=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(36756003)(26005)(426003)(2616005)(2906002)(336012)(316002)(186003)(5660300002)(110136005)(7696005)(54906003)(86362001)(36860700001)(8676002)(8936002)(40460700001)(47076005)(1076003)(508600001)(558084003)(70206006)(82310400004)(356005)(70586007)(4326008)(83380400001)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 18:56:18.9409 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd817e2-05bf-4de1-e2c2-08d9ba7c6b71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4149
Cc: Alexander.Deucher@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, Vijendar.Mukunda@amd.com
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

changes since v1:
- Fix typo in commit description

Ajit Kumar Pandey (1):
  ASoC: rt5682s: Add dapm switch to mute/unmute HP playback output

 sound/soc/codecs/rt5682s.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

-- 
2.25.1

