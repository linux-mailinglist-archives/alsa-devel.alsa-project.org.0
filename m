Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 406A457E2DC
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 16:15:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3AD418B8;
	Fri, 22 Jul 2022 16:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3AD418B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658499326;
	bh=hQ2NcpEN6vwO++JsoU5Q0zX3R4EZgWVYZABIwMbAyEQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QTMYHz9PK6dLWJyoWmSRzb0Cb2bW1PZA9n8hFv0F7Gm5Eim1TH/BRDHDudZjCkTko
	 0c4nAI0xdd0l2impRGU4I1OjJ+5/J+14DnQvKtTHyObTu4V+N1YCYS98cPVhGaDNAA
	 jJPVvRJppk09gRxBnDMO3+uSOhBq/anUpB2G4df0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80731F8016D;
	Fri, 22 Jul 2022 16:14:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81B6BF80246; Fri, 22 Jul 2022 16:14:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4943F8016D
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 16:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4943F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="0mNqy+d2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+AP1NIriWYL9Bt1/+XUhuQqSdcCjD7cevXQ8holC04yDRCoa9meTEEqkfqQN7NDWsUG/qSRb3hcMSKJFNRMdcQrWBHKwkMmzsODmCI+upoCFztVyG0Pxz0g0FYTZ1fDJ9uO01uUbLOZvIrNmoZdDG+l1ZdBeVsNWf0xsJMSTEBd0Zv/xbqVu2WrEtgEei3n+nFQefyJqx/XIGR3l9qAkxTuFRy8kIjHlcvYu/hpCLfBqYQNwrh8PTgExmH415w/t0oJQL90/MbOuYrVgiGFaZe0DmIeunYNBB9cgWFM0SXnY9N03dWE9elzo3mPCQ+UI5UTWmI7lKZJ2ZK0XD2DBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noNCYImTBkfK5OxOdQUdlqaoX2d9OGae+5M7dfv65lc=;
 b=WpxJl7kvHAL4BYmZL2hwqq4OQvCtIRKjPcV29E+IYTuyI3Y5C77GYti1aIPpIzj58lwmaYq/DA5nOKN2DIixhB88e5oQTeUYQZZxwBrSDbAIw0ezd4mmOtOzC0d450Xw1t30kYCczYZEO/SZKVT9e5niYeBuK3Zw7HOE8oDjLlTGUmZN72K4aVIYwUM9o1VQa+FU0gNI9ShD/jJGpgyAxaglR5bqUx1bxbBocd2MrgWiURAc4s2UtwPObSUEjg1+g5NEQXdPM3ZXMpxNt7BALO/LnQVOyU36G4DEK2gmEJyU/PHsvho6u+g+QOks59BW7US2nk4ClY401hzL1oGFNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noNCYImTBkfK5OxOdQUdlqaoX2d9OGae+5M7dfv65lc=;
 b=0mNqy+d2lGsIIZNxh5D+rLF/4fInU815TdVSVotnOF5Xdrip696k+P0djxQUy8mb2VEr3SFGnToFseVYX0AflRj9rcAvz5s2ln11GJAyNeJxSOyiE6AXyD9G2/UwzIXAKehYD2OGw4RlQA6bzcv/oUX9F3JUAz+RRVcP634DjyE=
Received: from BN9PR03CA0352.namprd03.prod.outlook.com (2603:10b6:408:f6::27)
 by BN7PR12MB2612.namprd12.prod.outlook.com (2603:10b6:408:29::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 22 Jul
 2022 14:14:11 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::3e) by BN9PR03CA0352.outlook.office365.com
 (2603:10b6:408:f6::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14 via Frontend
 Transport; Fri, 22 Jul 2022 14:14:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 14:14:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 22 Jul
 2022 09:14:10 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Fri, 22 Jul 2022 09:14:01 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: acp: Modify dai_id macros to be more generic
Date: Fri, 22 Jul 2022 19:47:03 +0530
Message-ID: <20220722141705.3340440-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29d9f084-650c-4e96-0320-08da6bec7319
X-MS-TrafficTypeDiagnostic: BN7PR12MB2612:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AKL2QyWnVzZFrcuO9emYec5cTVJT2Y+5DBk53hn3G/4MwYor5Ai9b/aqXo51FVf2xN3RXyj46VF1lJQPplazViiFKM0RkBbADJdCY5j1Ron2ajpvOdR5fkn0t8/PLT5SQXYDho78MMlPBbn435qsDrWItinN4Q/3WVMy+xZ4CZvMNw6YOyvl5CMMJwFbFJfa/CtnmnT5FeS7EEL2DNhHqJJaYf/crBx1GngL8vBXgilXfG/w9Ea1wf61LTBkjRok1u3NN1JOyGKLJYJXng/EQtubfgDJEymfjDoYMTFmSnMgIDjU0RX5+W7tu92ecZzOveiJq7oAEmqt2ZTnLrQqXxgABUVxQII5ld6TMJkeiVjzh25DM/3GoViSVQhIijxPf+KOeoGC5YNfYFlvOpOurwl6JcdX9K6zNekSKKkdffRTb969CI9PJzBYbPogPU4NbCuXk0q7NCcYkMTSuOP3q0fyXlPn+2w+YVjf18170YYJYBhG0x02bWjvURBRFt+2l+KhCUvFkcHgEfcpN7DNoGCgbDTX+INvQYUU69k0Ow2ycvzqRhGr4pEg/502JQYkEhYiCHkSzlD3nnWq+lRQJ1400PPqBKVxRxLR5LCUjaAwYOui+QzIbuiSUiev8vD4qeIojCQBHr9PvSf+pEVpcmZrgyN2GoczyU3KZtplc4LAPghJ+r+kFOSp9fN7640pIin1MUJrUcRJ5YZ+V9Py6kbTORhTEp+/5JP/wF9xaeSAQV1OA4G9+nSAIWbHXvSrjr2WKBxam8FnQsRxTvFVQa6QSCjYSIVpdeV48vqXQlMqmAFUwATEmAHNqgTcuYAj7nF838kX8r1jggXPTcJin3i/mSHjDNYWSEC/kRVtiLQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966006)(40470700004)(36840700001)(36860700001)(70586007)(40460700003)(4326008)(36756003)(8676002)(110136005)(316002)(70206006)(1076003)(54906003)(82310400005)(86362001)(40480700001)(2616005)(2906002)(26005)(41300700001)(356005)(8936002)(5660300002)(7696005)(83380400001)(336012)(426003)(47076005)(186003)(4744005)(478600001)(82740400003)(81166007)(41533002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 14:14:11.2100 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d9f084-650c-4e96-0320-08da6bec7319
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2612
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
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

Update dai_id macros to make code generic for all platforms.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/amd.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 148a9ab6206d..ff2fb476fa6c 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -21,9 +21,9 @@
 #define ACP3X_DEV			3
 #define ACP6X_DEV			6
 
-#define I2S_SP_INSTANCE			0x00
-#define I2S_BT_INSTANCE			0x01
-#define DMIC_INSTANCE			0x02
+#define DMIC_INSTANCE			0x00
+#define I2S_SP_INSTANCE			0x01
+#define I2S_BT_INSTANCE			0x02
 #define I2S_HS_INSTANCE			0x03
 
 #define MEM_WINDOW_START		0x4080000
-- 
2.25.1

