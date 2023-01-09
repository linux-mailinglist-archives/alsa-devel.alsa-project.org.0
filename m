Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C021D6626B8
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 14:18:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC633BCC4;
	Mon,  9 Jan 2023 14:17:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC633BCC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673270302;
	bh=1+FU9U47x7V6XB2rp4oAlloHJeulEHa3OdhFp4XF4Xk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sT4DU9Va4ipYf5CB00exmFeyXXgF0jpIXNFLHdW46oMdkBl5QN6Au8Rt6DsJ8bXuK
	 hYLo0SgiOgICTg0xJ2w9V6xBRKj/JXMtNmRcw6cQrtC2xZGurVL/oLJ8E0PfyD9TkX
	 W3FdR8rKBNOs5CvMlMVS2UO2LV+P2L4D3McKiC/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51473F800C7;
	Mon,  9 Jan 2023 14:17:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3380AF803DC; Mon,  9 Jan 2023 14:17:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 279EEF800C7
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 14:17:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 279EEF800C7
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uAnos+Tg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIGZJFdaJVM7CbIdtjyH7HNZwgAIs3pWciaWq9gHQeMhG8GV12UW2efBFBHcVoYuTSVA67g6P92EmVqlkPwe+7dqREELTA0KT0Kkrn0tyWwHojzDh8KCYKhM8zeHTshxyC6F4Lbo6LtQ/Yr9BDVmKZUcDPxQIn/cuQLkvj10UFpAYNd7zWQfT6efdqjapondw+X0FX8AhRUvDqvsLmiydz6Iw4tsWWrg1osk6oPuP19iuzrzz0j2eBo8/NBr15I5QW9FDPZI99DPbnZSLzUPlhqDZLFxzGYUWOUabbrWtcrTlMVDDCqgAa1r6qmQulFGRFnlYtI5sSoTgM+8z98Crg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVfB5X/ts1qYp+YxzG1vdlxFTKRYxFNv9GgQM8fTdLc=;
 b=KpP5HcCugb4h7DETDN1rBtSjU22Vgsw7T8cvreoN9EqlvJ4wmKizOwcRr40ikPjVETalMf9NYqs2ex/jTMaFm44PcyukYLJji9WlK9M1IxZU1GHUd2S5wVzFk3XFw/Oxrf19AEZ4elJf0qPRLDneYmBnsxtTcrfvNM84r58Z+aJ3i1Si0c/ToXujV5kJzlfyhjHlDBVlREXLtGB1pdPiX9TDzVTuivU8M6EAUHO2YYjNqr+INUmHtSpUw7/F0TxBmr6zeR7gbEPTQ+kQyyBw2lNTKW1OxfMX5MKV5dK1aP3RUFS1VvByVRyc3fW9FRkoS8t7ckTVtHySRg/xZjt/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVfB5X/ts1qYp+YxzG1vdlxFTKRYxFNv9GgQM8fTdLc=;
 b=uAnos+TgjX7LG9L6FWLpMfjXwEw48qYamCcCQfjCwjTom6lls5sVYuJdoxikr56NOOkZukw231yH9wGk3XZEmUY0/WlVGfUjz0P3CZS0RIZrRqlbBAEoTd9GpFxlCl1r9kBqgez9LhdNgll+ogJlQ+gkJ1dCTshY2cixQUzNUGM=
Received: from BLAPR03CA0054.namprd03.prod.outlook.com (2603:10b6:208:32d::29)
 by DM4PR12MB5889.namprd12.prod.outlook.com (2603:10b6:8:65::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 13:17:14 +0000
Received: from BL02EPF00010206.namprd05.prod.outlook.com
 (2603:10b6:208:32d:cafe::7d) by BLAPR03CA0054.outlook.office365.com
 (2603:10b6:208:32d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Mon, 9 Jan 2023 13:17:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010206.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.15 via Frontend Transport; Mon, 9 Jan 2023 13:17:13 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 9 Jan
 2023 07:17:05 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 9 Jan
 2023 05:16:49 -0800
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 9 Jan 2023 07:16:46 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 0/5] Add tdm support in acp machine driver
Date: Mon, 9 Jan 2023 18:50:59 +0530
Message-ID: <20230109132104.1259479-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010206:EE_|DM4PR12MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: 22924f2c-281f-4d8d-bf55-08daf243d2c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S4/vO41lMVVaa40u709PB0Y2DyGYCu1eIqWioWF4YT0rqdmhRhIY2sRJK2mRKrQVVLTplZ7b6DQpb+NGG/kshg9sOL3Oy9kX4to/per6o+ncuME19auj9bxQ1lPI+VizxOFSxLkCSx789IZ0XOfhlZ9VTsqJnQvGumsGdIefAyN2zyewlfN164N0Kco8R6HCTwySvMWEiBeKnQ9KBNIWZA5Pwre2AU1z5Lebkmwrmkcff08aymSk7dpB8DkSarg5k/JcnzykFXlhVjGgxYNv6Nem8sVZt81zdWzFgsY40arzvm4VCEB7alzqF/1dSAVJ95Lo4Uf5bgTmZp9jyzlthPl5oq6P8OaXMysWE4/Bqd5JkgKp9P8bYwag9iEiBZJIqNm1JrisYyR7fVZhl8ET2A3SeQyWzT6EbQD28IFpc75+qrDeiR9NTV4yY5iU85Tb53QdJlyuRIgpPRkFRyqj2CHchAzlWgBzenHC4eaQ2nllHoo0aE1Hhq4mGTdUNgGEONxpKkp85cMWBBOu8rD5Hbq6WXlOJ2e7KqCJYVS8vKZxMU/m7Dwv+RNhmEOAP6vQslVxdNCCD2XwxA6HxajPzCwcqZtg9d4aU/buWwFnokImkjgSURkmKRn81jn3mMTbR591Nwgpb2Log5jfpCyyhB1RnsfMDmrooqxXJOKg1CVAYd29lZRjxqP6GvAju8kSJ8dPIbRb+ypUNCGWOLbDEJI/nYQHiRZA4pq3/zMRPmk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199015)(40470700004)(36840700001)(46966006)(2906002)(83380400001)(82310400005)(47076005)(336012)(36860700001)(426003)(54906003)(110136005)(81166007)(1076003)(2616005)(5660300002)(7696005)(40480700001)(6666004)(26005)(186003)(36756003)(8936002)(4744005)(478600001)(70586007)(8676002)(70206006)(41300700001)(86362001)(356005)(4326008)(40460700003)(316002)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 13:17:13.8650 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22924f2c-281f-4d8d-bf55-08daf243d2c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5889
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Basavaraj.Hiregoudar@amd.com, Vijendar.Mukunda@amd.com,
 vsujithkumar.reddy@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch set is to add new cpu dai, refactor dai format
implementation and clock enable/disable and add tdm support
in acp machine driver.

Changes since v1:
    -- Fix compilation error.
    -- Reorder patch series.
    -- Modify commit message.
    -- Refactor i2s clocks programming sequence. 

Venkata Prasad Potturu (5):
  ASoC: amd: acp: Add new cpu dai's in machine driver
  ASoC: amd: acp: Refactor dai format implementation
  ASoC: amd: acp: Refactor i2s clocks programming sequence
  ASoC: amd: acp: Add i2s tdm support in machine driver
  ASoC: amd: acp: Enable i2s tdm support for skyrim platforms

 sound/soc/amd/acp/acp-legacy-mach.c |  13 +
 sound/soc/amd/acp/acp-mach-common.c | 465 ++++++++++++++++++++++------
 sound/soc/amd/acp/acp-mach.h        |   4 +
 sound/soc/amd/acp/acp-sof-mach.c    |  14 +
 4 files changed, 395 insertions(+), 101 deletions(-)

-- 
2.25.1

