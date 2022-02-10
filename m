Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B4E4B06AF
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 07:52:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74D8117F5;
	Thu, 10 Feb 2022 07:52:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74D8117F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644475973;
	bh=f4lU9uZWQQImWtpy2Wv0/tEOjOZHTqKZhQ6o1nMmLfw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g6h+L2rI1Sp5JpyATYOUGSPt/26DSJ1NC4JGkT5s6czBb8vCl1pjDFG9FAzGVgU36
	 xAdiuZw+1z9yvIIAtOfCFgIZD6tRTyAxPP8GLZ9JCMgfh1jogIHZMuRGFBFegzl0VK
	 7koorLhJfkjHBcgGCD3w+i3Lw+keu02Dv5dokzH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9807FF80515;
	Thu, 10 Feb 2022 07:51:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A55BBF80423; Thu, 10 Feb 2022 07:51:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::613])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 673AAF80423
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 07:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 673AAF80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="VVRWdu/z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYKLRTsXKNmkHeNO3wbRS4Wy2OANj/XdoU1az4NBWpYkbPaz40UMtkJofxRERC8pucG+HHP/CSdgJgUnTN78aTiBpSqbToM3H/kUWENJDOqEBNRreAiffhungRWi5KScQ3KL7giVDoQdwC1x2k/TzNp38I6Se/a1tV0sDkZsCyqbk6WUdx+j8iMTsWZT7qNw5OkOLvtzar1wtAtTtIlGZVYwhUJuRZ1eQCv2WTqX5QMVfDha1ZMuVOs6a3LZPaA0bSZjcSC52FJSps340J9kFDsVcYxq/56QoNeo8SQDhM+xvucK9HHCR/oZZKUE+c824jbdscSrgxuLFZ1J81XZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyzCqJeD1HQ0eLP5+04rVR1LsYSQBNJgx+wbf5BLld8=;
 b=hgw+TDmj2HBf1AzoNK/CEfUSro8mUmPTCsu4IWBdiZVp2Jh13HgHbV8chbuAT2lSqU30m6yaGybu1Xhynvu83QW0eT3EeFRSghbNET8bpsqQlyci9igVLPfUujRB7VVq7GHP98DGqh3+1Ongir+xr7VYoJVcy4+XU9rohx+NdsYBp/PSN/oSgcmXebdwLvXVddoT29Fyyw0l0SDlayFY3sZJVKTLVG/60jSuPE8FmzYSRE8W0SKeIoF0c5ZEr4l5afpZs+gZsKhUrRLI48kR7K/xc/pVuvC3Xhn8r5qzldukivgvd++VPQhrligEaeRcj4LjZpo7trIkNUwZ5CLuVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyzCqJeD1HQ0eLP5+04rVR1LsYSQBNJgx+wbf5BLld8=;
 b=VVRWdu/zbjCl0a/ap2w3P9Y7VIcXnS33zFKBAi19sC3rOjrIk/mA21qRgrcoJNHLq2pN2hItP4zw9hkkaVHmLYukC8mxM9VW5lqkHAWyatuw3mDlJ/W/tbV+f2s0H7LPXAK6q2YXY2XR90sklntO3U+YMBU6Itedw0BNNu+gJquZ53LZGX1VtfUplmAofZu2rd2jmue3HhBuekUewkm0T5sQA8UttoqNgCwcaEWQ8TEn6MMuiqHlQyPkH7KM5vb0YD5I0X9Xzg6V1Y2gspbhbzSzy+mMxVupVYJhD+PpNDJk9XES1A1rnLtFJK773fDeZ/wdi/NYbGplqRwHwalA5A==
Received: from DM6PR07CA0105.namprd07.prod.outlook.com (2603:10b6:5:330::8) by
 SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12; Thu, 10 Feb 2022 06:51:13 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::99) by DM6PR07CA0105.outlook.office365.com
 (2603:10b6:5:330::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12 via Frontend
 Transport; Thu, 10 Feb 2022 06:51:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 06:51:13 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 10 Feb 2022 06:51:12 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Wed, 9 Feb 2022
 22:51:11 -0800
Received: from mkumard.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Wed, 9 Feb 2022 22:51:08 -0800
From: Mohan Kumar <mkumard@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <tiwai@suse.com>, <jonathanh@nvidia.com>,
 <spujar@nvidia.com>
Subject: [PATCH v2 2/6] ALSA: hda/tegra: Hardcode GCAP ISS value on T234
Date: Thu, 10 Feb 2022 12:20:53 +0530
Message-ID: <20220210065057.13555-3-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220210065057.13555-1-mkumard@nvidia.com>
References: <20220210065057.13555-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72944eea-044b-4a13-26dc-08d9ec61ba57
X-MS-TrafficTypeDiagnostic: SA0PR12MB4446:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB4446EBF37E7005DFEAE2B1C2C12F9@SA0PR12MB4446.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +oxbnvQvITJeh+FbQWvA/EMoE4rl7lgKvwowl+Q0EEkwRsVs1BF1cTFHu2EM6ubT9b8PUuG1Ad3Ek5Ix0dv0pAkskE/zbBFoVKA6HjGXI9v4GM/cf0qKO41gBhZ7Dglbl5/tjjuDpg2xAQ8ngzvmelX/ykM01bMOmKzfg4lzf+Sx2ZIMFe6xe1VWSmW2yVaS1oXFk+5s1a6yHJZy8dRGou8m8TSqzE4KHTE3OjM+iQ2TCkFhn/1tCTfO+B5UMzH+A1MNMRy2twuwacUjgReBqYE1veFk/cpwxVoijhu9lXrjNOfsTD99PNyuThwAaCDCAyeDJbVtKt48z2sH4YqvEOldGtJx1JvN+72GhP8viadgqx+S0mp0jonzaubTrjrDfsYH14/F9AblTfb5HIkVuqcSjstYar01NW6luM+BA2iePq/JbthwDj2ko6nlK9x9N1s+8dso/9uhjNFa0CFmMV2n51drGosKDHVGRN2/RLxj6ttKcksFvNTaKkgi2J9JsWOKihsj9VSGewhGS0LX7jp6Pf4POLKNZMu9d7k4FhnAIBeSi9DCtQSNs4P+vXv6vF0FpSGptbfvLSV2iYKQG74ODOtHJh8yvLjNBqWujt2PgshEGbKc9NNTEuybXaD/sNCAbZQE6FC1/UlOfE0ynlBkG9nE5D9nfQS4Z1jC67YCfMIlj7CWCpWApXucxbiInxBmk/UmYd1o88T6AGAqK1TGIF38CH5twh4xJwqkWV4=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6666004)(2616005)(107886003)(356005)(7696005)(82310400004)(81166007)(5660300002)(316002)(508600001)(36860700001)(110136005)(6636002)(54906003)(2906002)(47076005)(40460700003)(70586007)(36756003)(336012)(70206006)(1076003)(4326008)(8676002)(8936002)(26005)(186003)(426003)(86362001)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 06:51:13.0798 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72944eea-044b-4a13-26dc-08d9ec61ba57
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mohan Kumar <mkumard@nvidia.com>
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

The GCAP register on Tegra234 implies no Input Streams(ISS)
supported, but the HW output stream descriptor programming
should start with offset 0x20*4 from base stream descriptor
address. This will be a problem while calculating the offset
for output stream descriptor which will be considering input
stream also. So here output stream starts with offset 0 which
is wrong as HW register for output stream offset starts with 4.
So hardcode the input stream numbers to 4 to avoid the issue
in offset calculation.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 95df52b0505b..2347d0304f93 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -315,6 +315,18 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	 * hardcoded value
 	 */
 	chip->capture_streams = (gcap >> 8) & 0x0f;
+
+	/* The GCAP register on Tegra234 implies no Input Streams(ISS) support,
+	 * but the HW output stream descriptor programming should start with
+	 * offset 0x20*4 from base stream descriptor address. This will be a
+	 * problem while calculating the offset for output stream descriptor
+	 * which will be considering input stream also. So here output stream
+	 * starts with offset 0 which is wrong as HW register for output stream
+	 * offset starts with 4.
+	 */
+	if (of_device_is_compatible(np, "nvidia,tegra234-hda"))
+		chip->capture_streams = 4;
+
 	chip->playback_streams = (gcap >> 12) & 0x0f;
 	if (!chip->playback_streams && !chip->capture_streams) {
 		/* gcap didn't give any info, switching to old method */
-- 
2.17.1

