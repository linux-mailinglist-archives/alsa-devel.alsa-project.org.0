Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EB058ED24
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 15:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15D571640;
	Wed, 10 Aug 2022 15:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15D571640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660138050;
	bh=ZnbBKrUFi3wiaFXWe2ZPahhAkWN98Qpb9BivDIune3U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s5AeTDNd45c1bQQIdh6FRrrqkLc8thBPIcgD3ncm8nwzEDAmGKS26mSHAUMXazs1O
	 +BaspDdtqFQgQ6QSOEcFJhcC10EGMgIqgn1BM1klBtTkzqWbrEsydKGeupnQHzhInC
	 0geliGxa9KmEPforq1CX3wb7tA/TOXWqMRTugR1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 820D8F800FB;
	Wed, 10 Aug 2022 15:26:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21AF1F802E3; Wed, 10 Aug 2022 15:26:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A536F800FB
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 15:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A536F800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Uh1vJuEp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUtRxrdP3Gr+6SFvvICXRdgP8Ao9CEjztYRgpBpsgG0Da+GxAxbcasw2ECKI1PIg8wjf2SybHPvVRRM6GFCEq+4UdG8FTqwYnBU7pza7FfNDHEPFTUwSDbeTtATbDn3jhL8i7EjlKMuRnFD2efGT0RfcZpwB2XKYnqqjdGyMhFdA5Tt++8725pEfu9zJ5lIL2OBePlOIP1OR9XLYmv1oZWkL7Kz5JIBgyZWRnXMpI+Jd4/+zExL/S/bTrw63MTLilEwqhodK07TVyuZyGQlSuCniLt9V6xkVSOX/lgvupd0imxFDj9jJUVd+cc57GNUub+AjOU6Zd1uRAYUyYLk4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXlUA8GUczyuzitRMSiX9D76g7xxhGD84qZCwpHUjR0=;
 b=Kbspb4a24z+gjWwGbo1c2Z7VgYRLcAgoRdnSu3VK8ZvMWJsCpVwwK0ZKkRnOhQcYfU10NZNNEkUkojpt4s+lkJOV8ZJ64EyjXhNJweUARELN71P0pk4bY9+rEc6AeuNwWZntcW6LVBPdZtbX43knhKzkp2ZNFvREo1/D62x3SRztsTTUaSKkCg6cPZpmHt5vEvh6bodcUoQUp1QJF/qStGxQpM5xtAuUYNapv/t8tyKRQor3YYmwdwIZfqgQgxDtkUKLlCl/6gKSr038dF6Fb1yGfCOKJY5e+cg7x03DHy8AI52iiKVOUZh813M942VfhWraPb2+/ecKQ4KvSx4MKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXlUA8GUczyuzitRMSiX9D76g7xxhGD84qZCwpHUjR0=;
 b=Uh1vJuEpu5Ub36cR0gFRwc4GCAxMPvuWRNnYtP7zorJ7goRUo/T3Dmsv15BBzaIK7X2rE1purCVCtoeXhoFXZjs2DQf7L3E/slnop2wBakTqzrRQakrEtO5buPEYtQlnqSeMNIqDMKJzT5nnKD2H5yIRdoga5ql+7Dh4r/HeI84=
Received: from MW4PR03CA0234.namprd03.prod.outlook.com (2603:10b6:303:b9::29)
 by LV2PR12MB5896.namprd12.prod.outlook.com (2603:10b6:408:172::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.18; Wed, 10 Aug
 2022 13:26:17 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::ac) by MW4PR03CA0234.outlook.office365.com
 (2603:10b6:303:b9::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16 via Frontend
 Transport; Wed, 10 Aug 2022 13:26:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5525.11 via Frontend Transport; Wed, 10 Aug 2022 13:26:17 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 10 Aug
 2022 08:26:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 10 Aug
 2022 06:26:00 -0700
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Wed, 10 Aug 2022 08:25:58 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [RESEND v4 0/2] Add support for linked list to store acp_stream and
 tdm support.
Date: Wed, 10 Aug 2022 18:59:11 +0530
Message-ID: <20220810132913.1181247-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4103a794-d4fb-43ce-e3f5-08da7ad3e7cc
X-MS-TrafficTypeDiagnostic: LV2PR12MB5896:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 28QzZB2V+ralAR3/7Nk3NvWWO06T1+zOfNIg4pHJtAmpl/qDptDqafulHB2QMiBK3cqhwI3LmzzTDa+sRGtVZN+uzvYE0QdaBRaY4lp4GJK++l4JLLpx8n8lSijNXkB/nCsjxyH61szbUTGVifp35p7YKysgR8BE7R0nSCD0Sul1od5aCXS1TaJGDfuCeRdvfasOq/bDpUH+MHDxorVV/z/TZQStbgBiQNwIioejSz2n6xD8PoZgw5ME+Bi3GDpDD1IZxpFewKF8ip/panHznbOVEey77S3YzvGsuw0rdxki4ie4pVXSGqHa+85ijL0q/ZTIu+wRuGlOa/9rPfDXyc/vThwjTQ9z/fErBrLIYQ4mrKSzTfD/Q5KMlFaDybQVDUs6ekxZPSPqM9AR30XSvAZOlmA8+t2YUsqPhJHLrIPbwIqoOkjaZpovmi+QLpCOGDBsjI4QTx3Ko2UqD75/qR8lB6w031LDTenui5oGHD1zm1GGDu6nLzf8zd+KsVI46NQa7o0ecJIbMh3iplZG9hH7BfRPHl51zgVyQjsSwIc6HZt09esOyrsLm+VVDFiOt+B3bvyF3PioTveI7J/SF9Qi/JFIWWBORWC9MNlkDVVuWsBLYIdibzqTLkvuMT5GVp6ByMJjJC82/kLIOPpyuikGpqX6DUe9SEtCkU7x7KVlwvdbACxmlLSZYyDI4NMWcx61U02MeqqkNcJ1/ucVbMOk2fZXPAv15I0T2a3Tf3QzaLyxooyp7dVIpKQ1GFgY+FX3H/JmcbBya74XxKPx5lgnZmHcX1YCq17Ydc3Ci5h+B6tSpxN/Gmge03RIyIlv4wNpanutARNtx/bjf66fvA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(39860400002)(376002)(136003)(36840700001)(46966006)(40470700004)(5660300002)(86362001)(36860700001)(316002)(36756003)(478600001)(8936002)(4326008)(70586007)(26005)(70206006)(81166007)(2906002)(8676002)(356005)(40480700001)(82740400003)(4744005)(41300700001)(82310400005)(7696005)(426003)(6666004)(40460700003)(83380400001)(1076003)(47076005)(336012)(110136005)(186003)(2616005)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 13:26:17.0124 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4103a794-d4fb-43ce-e3f5-08da7ad3e7cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5896
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Basavaraj.Hiregoudar@amd.com, Vijendar.Mukunda@amd.com,
 vsujithkumar.reddy@amd.com
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

This patch is to add support for linked list to store acp_stream instead static array and 
add tdm support for acp I2S stream.


Ajit Kumar Pandey (1):
  ASoC: amd: acp: Initialize list to store acp_stream during pcm_open

Venkata Prasad Potturu (1):
  ASoC: amd: acp: Add TDM support for acp i2s stream

Changes since v3:
    -- Modify to spin_lock() in irq handler and spin_lock_irq() in dma open and close
       functions instead of spin_lock_irqsave().
    -- Add  tdm support patch to this series.
Changes since v2:
    -- Add locking mechanism in irq handler, linked list updatation and deletion.
Changes since v1:
    -- Fix compile error and remove unused variable.

 sound/soc/amd/acp/acp-i2s.c      | 80 +++++++++++++++++++++++++++++++-
 sound/soc/amd/acp/acp-platform.c | 40 ++++++++--------
 sound/soc/amd/acp/amd.h          | 16 ++++++-
 3 files changed, 113 insertions(+), 23 deletions(-)

-- 
2.25.1

