Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4CB34AC81
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 17:29:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88824167F;
	Fri, 26 Mar 2021 17:28:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88824167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616776156;
	bh=litwcx81N2auY66l32y+utK2fU4VRTFlSN4+Ed7wVlU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FZtxHS5uHInBUUvkztg+81DXmPg8i0VSSmkplCv0TcEkx6T5HsxsAcuqIJE/y1pV1
	 9qFGH+GaajfEiJ/OLjRpP2WlTp7ejqguJ7yRXyCUKb14QowvBcnw1tFIWytUD9f6mS
	 3t0d+pbjXX6VpwXhCJhmIo6hZmawK/3zJfTb4qy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F97FF80103;
	Fri, 26 Mar 2021 17:27:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37D51F801EC; Fri, 26 Mar 2021 17:27:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760043.outbound.protection.outlook.com [40.107.76.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68A1DF8016B
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 17:27:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68A1DF8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="C/C+77Gy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENGBsCOyg9GaFZENHyGFp276tP4sov0jTcIqp+Bok3YiC4q26/KK/g3MA+lris8++MxV/ahBi6AV/109yFs7i3zY+eqs8u9qtdtTJCSG00c1YYE8a2yfSxrCr50R+OLUSkE1c3QO2DGorlpW9O5ToMX08do3I3/CnYZ4gRiokgQ3Y1/IhiLBm3N6lKuOFN7+T4V6lbfhsxcBx6mRVhCmIBRbKvuDlG3HcElD6IqN5XiT3KY3XhsPfYGBwQSymWdqcRG57rtJjVQYQETRP+BfaOY4lF2mPxCSxrvmFRFy5N3BQH7tZHpBhlt3MoCBpDouV/zChu521nbq7eB/tFxqoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUqWEL/gUy0HtRnKLFEWGFRN9dGdj2BLcaFu7dob4H4=;
 b=HjwkHaawmrIL9nqaEOLvbdd0V5pE7YDCEIrGwwAb6m+ZSfbwNcieeqn6B/inI4yJwBL4BqP8qYjS298Qd7khn8lUGd5IMI2ezb8o5v2F12ajlPvGVClzpEzXAbfQzwddsJVBhvb2ihRwtVeLoxq95bxWZph2p7TFwjJtDWmkUqhG8Fdwp62SU+cNUKil+v6LI6MAvH8qk3D6oe7FCFQ6s980ik0BX8rXWKvGCvAt3hbsKrtmTAGFI3ig2r8yz+m0F4//LQLNWxpYqegIEnii2OCFBuUVC2RrZyH0rsffkOU1VTddKXPbep/aLic4fqu8hzQAfThqAw5sanZTT4L2hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=amd.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUqWEL/gUy0HtRnKLFEWGFRN9dGdj2BLcaFu7dob4H4=;
 b=C/C+77GyzFw5Cquy/xw3lSzYrjqCqXTYDg6D6GXffUUHHnU1dFUBTq7tWznPBEoM1qV23dC7+y3q2v/w9gR4xFLc4pef4gDfW27wqzr6hZIqsqdDTagQgXrQg568ehgVDHAjWg3IxzwcmV7kOGn9cl1uGOcB2HOsCI0hWVBihqQ=
Received: from DS7PR05CA0003.namprd05.prod.outlook.com (2603:10b6:5:3b9::8) by
 CH2PR12MB3989.namprd12.prod.outlook.com (2603:10b6:610:23::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25; Fri, 26 Mar 2021 16:27:24 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::de) by DS7PR05CA0003.outlook.office365.com
 (2603:10b6:5:3b9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.16 via Frontend
 Transport; Fri, 26 Mar 2021 16:27:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3955.18 via Frontend Transport; Fri, 26 Mar 2021 16:27:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 26 Mar
 2021 11:27:23 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Fri, 26 Mar 2021 11:27:19 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/2] ASoC: amd: fix acpi dependency kernel warning
Date: Fri, 26 Mar 2021 22:14:31 +0530
Message-ID: <1616777074-5151-2-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616777074-5151-1-git-send-email-Vijendar.Mukunda@amd.com>
References: <1616777074-5151-1-git-send-email-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ece15673-90d6-493e-02ac-08d8f074098c
X-MS-TrafficTypeDiagnostic: CH2PR12MB3989:
X-Microsoft-Antispam-PRVS: <CH2PR12MB398904346387A64D28500BCF97619@CH2PR12MB3989.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ieq21zqiS4WaADq6zVwTzEmudHWO1x07Gd2LBp+UF3/WPXe91e5/pyEsNxWe+Q+YQ9ti9imW4zHzlpfLH9g07eMNQFZB8cHlOIT2qBoT1SY0mpieMwk7B5XtcU8MJLdtH9RH9hrVcv6hAgzT4TpGIIsLCM6M5PT7KpzMnC27MUXs0Eiy8q1BDOm1Xw+P9+ew/Q8tPqzEq6wEuBmUF5u5Lc/4G/jFyF2JD+UPHFugpuForGp5p52I2m9GLdPL4wtjYOt60vXkqeOKmOyO4T0Yv52J1X6fui7zNbw9baly21jRbNa5yJBQvIjo/j2eV3ILa8mENDdTEbvD6uLdT29n7Mu4/RYJ4BNrqKyJRgqgu3TJrbd+E45+mdEOPRcO2dr9dj0h9wt1FV8JwISLAtvadpZvtwnEbRUkEcC6g+QETGLS1mVmjEOoT9BCvihNpJqW8FUaqfpQo69q0xkIbZN2ghubhtorIs2eCeJkv2wvQFFVlTuPcJAEiNYlX7tKG4kLqR2f9AadltbNflG7S4A5JDj9xbS9T83FaY5xks5vlIFSi3J5kgbEsLFZkTLbTO54zziJklA/jOVkrZhegH3L8kD4H6fJrVhIcFFX4JQy3JTmUuq9EJtM3VKE1PKWIoTPiB8ZDskyVa/mPeLcxKzGXLRk79wOOft1TUgcJNBPrSWwafk/l9KlPv4ApP5go0Gr
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(36840700001)(46966006)(47076005)(81166007)(86362001)(336012)(70206006)(36756003)(426003)(2616005)(83380400001)(4744005)(70586007)(8676002)(82310400003)(8936002)(5660300002)(82740400003)(356005)(110136005)(6666004)(7696005)(478600001)(4326008)(316002)(2906002)(54906003)(26005)(36860700001)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 16:27:23.8949 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ece15673-90d6-493e-02ac-08d8f074098c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3989
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Arnd Bergmann <arnd@arndb.de>, open
 list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com
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

Fix ACPI dependency kernel warning produced by powerpc
allyesconfig.

sound/soc/amd/acp-da7219-max98357a.c:684:28: warning:
'cz_rt5682_card' defined but not used [-Wunused-variable]

sound/soc/amd/acp-da7219-max98357a.c:671:28: warning: 'cz_card'
defined but not used [-Wunused-variable]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 43f5d29..256c192 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -11,7 +11,7 @@ config SND_SOC_AMD_CZ_DA7219MX98357_MACH
 	select SND_SOC_MAX98357A
 	select SND_SOC_ADAU7002
 	select REGULATOR
-	depends on SND_SOC_AMD_ACP && I2C && GPIOLIB
+	depends on SND_SOC_AMD_ACP && I2C && GPIOLIB && ACPI
 	help
 	 This option enables machine driver for DA7219, RT5682 and MAX9835.
 
-- 
2.7.4

