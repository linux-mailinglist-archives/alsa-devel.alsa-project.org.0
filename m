Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 192F21D800A
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:26:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B83D9177B;
	Mon, 18 May 2020 19:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B83D9177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589822774;
	bh=WjaZtelEbjALlN5+S6imYkzMnNM/t5G/jQK3RbpMMFk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pYb2tJUi+mFG9d6kIq6B/P2TyhGBALt4n3unSrA9RtUoganUAq229TAm4yg3GQp+E
	 p39XefGHrxeHX6MC/q9y8Js4ppT82DdzxOegJyQPwQAKEraC8NYhKIFPuMfcjVNeOt
	 QF36RdDp92bzm241NyxgCn5SI5xOrMzxCjCsYUk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24195F80337;
	Mon, 18 May 2020 19:17:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FD33F802E2; Mon, 18 May 2020 19:17:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67018F80299
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67018F80299
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="GDFuRb1N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVYuEOD+mCAXDLOKsmEzaIW5qlHHc5yudmqFcFr7SOwrIBtBaHT6NgPFOTKyOXGKcvsEQfg3pvgmn1vgBdPyLmv87YPl9AfVSBwf/WTFUsQSFfUcod67kWYj98q3mRcR894ZFAX42SNYC+2eiUiwG+nJh4Qdxqmz8B+lLGZ54JcqK1c2gOHT+XES6w/HSe2x0AYM+SZHDRlEL/CiEyQECiioxnzCqWEAlIZ7A2895FRJyCY47nGZEvQF5ju61kUhqsRy78YPJ7AKBEzGbVDpDIv+pGFywW4Chbi7AA5EGw0w6T+XeXX8dZK7mViCFNfdRfpciJyD76tLTQFGQN+KzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNxJqwpnt8Ux3YayoEw17Lz5syPZ1gkWLYK5/CyH2bQ=;
 b=CyU9Ae7Ayx+vMQjaKwKbaljW2kPnrIDrDiXsXbYNY2Hh0G4sj5AVDuyy60OpTHAKeaSJuFRc0ZWxm9vEYndCsQqbVXkvNTK+Y2OLxUtQtRES9zCK00Roc85vEYPJQggOXzVTTZFOeP54aFzvq3v/tfiDcDwaLfC3b8bijv29CeJijNqSbcIN0zjAiIHIl6kzDvNQ8w28qkRCoqlUTEftI1wYoYZ0JLYVKoW0ATRlsZaB/p5d+J5BtGNf7Jjyhq53QkUVABc6EVmxWL2Mx+Jz5bjJMK2txM8q0KSSjxzyJ/GsX/a31CIf6ZKFrIKzDDmK04r24yhSTIcTQ69ANqAXuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNxJqwpnt8Ux3YayoEw17Lz5syPZ1gkWLYK5/CyH2bQ=;
 b=GDFuRb1NT/YSBwXkjFqeCqbwfOTHTRkfnI+2T653jWaYIj1O3hr7R5PeewNSztNZBEMSQEVB6P65Qi0G5pYgiQ03HBY3WNy6qOE/ixL2KDCpAwRU8RU/a0GmPir9civQHmcQ9fUo3sm74L9RV1TJbNbqClaEgAXs8R9nP/xi//g=
Received: from DM6PR08CA0035.namprd08.prod.outlook.com (2603:10b6:5:80::48) by
 MN2PR12MB3918.namprd12.prod.outlook.com (2603:10b6:208:162::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Mon, 18 May
 2020 17:17:35 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::3c) by DM6PR08CA0035.outlook.office365.com
 (2603:10b6:5:80::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend
 Transport; Mon, 18 May 2020 17:17:34 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 17:17:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:33 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:33 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 18 May 2020 12:17:31 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH v3 14/14] ASoC: amd: enable build for RN machine driver
Date: Tue, 19 May 2020 01:17:04 +0800
Message-ID: <20200518171704.24999-15-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966005)(478600001)(36756003)(110136005)(336012)(316002)(47076004)(6666004)(4326008)(2616005)(8936002)(426003)(70586007)(70206006)(2906002)(186003)(26005)(7696005)(8676002)(81166007)(356005)(86362001)(82310400002)(82740400003)(54906003)(5660300002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30ff6ac0-e174-4f4b-4f0e-08d7fb4f5aaf
X-MS-TrafficTypeDiagnostic: MN2PR12MB3918:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3918DB638C6AA1141FF5D55C97B80@MN2PR12MB3918.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aNT7yfzsYwzr+dGKwod49DDKp0IcbnoP7Fx26ReLR5/MEts5leZ2MOglLpyk2rtMfcFmT9+x82Vh3TsyfJI3oO/BdcqY9OGvQ6RMxW5HSbwnp+gRQdLoeUky8M6lM8CWUXBynBxVNwPQs4YAOdjMsUzC93BOaHrIKyPwip6lmWNWyvEFwrRLAW+9RJOvbYDxQzXrkOmPu8g8F1nMnOsMFYjx9uyWNTcA9l2BicWzgJC/ChCsUSjOwyqlT30Gz67Q9f1zNFe3VHl6RP58Q2xPpxXUixsUd1J4zLKmnHsVXf3XgIuoTe1ZMaXAWXonntC33FFEFo4lJSRn0HPs7OWFAZnZCw5TErmF43FTQHDSz82Ec4YCxUUtGAU59uCRESHHbDWamNKLZlb8e1DNTu3100pw0eEE8M7Si0xf/WnF0GPgy9wZ3f0mZ9hYxsbw65JkxwcKwr/PGPiVHsgaT6GcGh0Eb0igqtlz+QXcwASgIaHbiurUvVP7MclXeLWKoExMeT3v3Sy/p54/TRzcGhgwxA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 17:17:33.7731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ff6ac0-e174-4f4b-4f0e-08d7fb4f5aaf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3918
Cc: Alexander.Deucher@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

This patch enables build for RN machine driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig         | 7 +++++++
 sound/soc/amd/renoir/Makefile | 1 +
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 5f57a47382b4..77ffdb41bee5 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -42,3 +42,10 @@ config SND_SOC_AMD_RENOIR
 	depends on X86 && PCI
 	help
 	 This option enables ACP support for Renoir platform
+
+config SND_SOC_AMD_RENOIR_MACH
+	tristate "AMD Renoir support for DMIC"
+	select SND_SOC_DMIC
+	depends on SND_SOC_AMD_RENOIR
+	help
+	 This option enables machine driver for DMIC
diff --git a/sound/soc/amd/renoir/Makefile b/sound/soc/amd/renoir/Makefile
index 43100515c7db..e4371932a55a 100644
--- a/sound/soc/amd/renoir/Makefile
+++ b/sound/soc/amd/renoir/Makefile
@@ -4,3 +4,4 @@ snd-rn-pci-acp3x-objs	:= rn-pci-acp3x.o
 snd-acp3x-pdm-dma-objs	:= acp3x-pdm-dma.o
 obj-$(CONFIG_SND_SOC_AMD_RENOIR)	 += snd-rn-pci-acp3x.o
 obj-$(CONFIG_SND_SOC_AMD_RENOIR)	 += snd-acp3x-pdm-dma.o
+obj-$(CONFIG_SND_SOC_AMD_RENOIR_MACH)	+= acp3x-rn.o
-- 
2.26.2

