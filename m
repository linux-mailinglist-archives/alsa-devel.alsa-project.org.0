Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 335C74C0D4A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 08:27:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9B88195A;
	Wed, 23 Feb 2022 08:26:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9B88195A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645601242;
	bh=7K1dBeIF0M4dMEVqDLl5D9gUvJ2I7OzzqZeCH2TZEnw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=meMwQvHLNoHrOIqvTH7VmiziYBFLVlUvSCbGLfn7a0f8Y1k4k3Dfwm5VQWoSZkbih
	 C+NMIA3J4jCsCxzAWNna7b0eDYPzbe188kvX7RU2WBogJnrVIJwvJJuvXv8JCY1fGA
	 novwCxiT1NbUYKm4XTXTo53Ts1gqc6Bt6IxYYH4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A23B8F8052F;
	Wed, 23 Feb 2022 08:25:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FA52F8052E; Wed, 23 Feb 2022 08:25:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::625])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAE47F8052D
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 08:25:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAE47F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="0JWB/TJ5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVf8p5Z5p/EA7QAT135jabXs9DjP6liX/A0xgnFudTEoXF4avuX0e4RHwi3Pg71dDd7FIMfx829GvC77mTFkag4wBD2iIQa0hUfKLnWM0RP7onv2vdCoPpl+/yB4FDH4J2aZAawjJUVG3btTHA04GtpmPuMVbMbG4pxRCjCnbEAg+U9w+meRIsOwvRfXvGS2Lgp/y96Wa/C4kIsUpUYiz0gdNJkkJApvxGrD5guTTyvZSqRNItvbqxx9zcv/nd+sbwxcEjFn+W3xPRzVAd9zrmV5KIA8hOzJ0oUSjc3rrQBpY3QI3SFQ+qv7Tdl+XigCsS8zS5YGv1HbMM2Bt3HT9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC4ndKkpKXKWwiRAMnVGzBo7zxZ8TlguMupPQfnxF50=;
 b=ecWyta1tTxxf8O4q7V9vP9j6hNqnPaR7InqtSUFK8NGYnxjcLZ0LEAWa8/tcBEe37rzhjpPJ29UAhJnTJntgQCfvHQpeUrbGTbtTIg6Z1+2EYZEu230+b15pOm61qY5OSjM0+Y02J+i7doipDDd3eoqF9/pvg0FJwV7Ry5RCYP5YhdmpIBBT+LBxrYPDD6KjvotxqK5MH3wZB7EvxXkA35mSTHfJdElGdLi027z54C3Bz8cixp4PRU+k0JFY+WNgRqoN+7vWc9i1G4hmpOeebA3sLu94cSSD1aNK0/Bn4bxGwiqyIwcVvZWeN+psCCVJqKpGQORmyj8Ny1qCYp4Ydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HC4ndKkpKXKWwiRAMnVGzBo7zxZ8TlguMupPQfnxF50=;
 b=0JWB/TJ51pQLWKvFODxmxLAv5hB5zwdGVNih6Y99Beswq3tGCOpV6JUk1BqPLelnHwkrjBjVp3Ol83x8aMaFiy1u0Mc0fgd9LI+qatk3ywcRGhJoiFBia7eEO2vLtLWNgR9Ok3LFKvlrgAN6Dv/uCOEX72T5hNv+4hHX9D04Ovg=
Received: from MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::7) by
 MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 23 Feb
 2022 07:25:18 +0000
Received: from CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::47) by MW4P221CA0002.outlook.office365.com
 (2603:10b6:303:8b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22 via Frontend
 Transport; Wed, 23 Feb 2022 07:25:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT049.mail.protection.outlook.com (10.13.175.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Wed, 23 Feb 2022 07:25:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 23 Feb
 2022 01:25:15 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 23 Feb
 2022 01:25:14 -0600
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Wed, 23 Feb 2022 01:25:12 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 9/9] ASoC: amd: vangogh: fix uninitialized symbol warning in
 machine driver
Date: Wed, 23 Feb 2022 12:49:38 +0530
Message-ID: <20220223071959.13539-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220223071959.13539-1-Vijendar.Mukunda@amd.com>
References: <20220223071959.13539-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30aa2c90-155b-474e-cf06-08d9f69da478
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB43908BBD6475A3551632AE80973C9@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F8wuWCBlam75QDvmi7hOQLnBHljZbInSLBcoW/ASINK3/pq0y2AFQAmqJ206Md1IG1j2TKzH6fh7BOoVfl6pjNRwCNoQVKFveM32qEW3H84Dwfz0DNRPmU1Iq7AoD3HhZkFa0viW9MjUgs8hT2fhu8SU9QE8h6fQThSaGXhKz1XutvU5/jgl0czSd0CtgW2R5W9poEJVvPMV1ZSMVdgv9g5g4SSvT/x2KwGkLEqg3jo0CJZoozaDexw/rNZSTqYL5tPpHH7SpRD3RibLi+UVWG1XBDU2yPtN3fM8Ojv3fJSSPWrs9u3e2srDYK/MsvgPyvEaTT83bcakVHq3kV7mTTlU466KeZDRw3/NE417z5VMamMajD6SFvtPva5G4SK3xcGwQItysLHp93NAU4YmHawd5rAzlSd0rspew0RRnMo60rqt5+21oXIvqycE2MVfyMFGe6818oHq3VUXwU0q7uZntizrrzQw8Xx3d4H3ezIsOkRNdtcPpvZsqy1qMo8rbZcTz5GV3rvVVCNmGembvw4dKyqMdPd6om+63P6QtenU1ZHiF3rYyQNMkUGw+lMQv3EaMZOgmz48u1UOti5U6oi/dNMI8c8Mpl6P/ThDOGPbYKJNB1CsW09tcA+Pzg97hxnsCPyp8ru/F0PBEYXjDnvIBry/49Lo16xUklkcwkWRzpy9TI4piwMzOSoO1yxJy+Q59sZkL/LH9V+a2HouMg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(426003)(26005)(2616005)(186003)(336012)(1076003)(70206006)(70586007)(83380400001)(86362001)(6666004)(508600001)(110136005)(316002)(82310400004)(7696005)(54906003)(2906002)(36756003)(81166007)(5660300002)(356005)(4744005)(8936002)(40460700003)(36860700001)(4326008)(47076005)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 07:25:17.7440 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30aa2c90-155b-474e-cf06-08d9f69da478
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
Cc: Sunil-kumar.Dommati@amd.com, wtli@nuvoton.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 krisman@collabora.com
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

Fixed below smatch static checker warning.
sound/soc/amd/vangogh/acp5x-mach.c:190 acp5x_cs35l41_hw_params()
error: uninitialized symbol 'ret'.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index c574e80907f0..5ae3de76283e 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -177,6 +177,7 @@ static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *substream,
 	unsigned int num_codecs = rtd->num_codecs;
 	unsigned int bclk_val;
 
+	ret = 0;
 	for (i = 0; i < num_codecs; i++) {
 		codec_dai = asoc_rtd_to_codec(rtd, i);
 		if ((strcmp(codec_dai->name, "spi-VLV1776:00") == 0) ||
-- 
2.17.1

