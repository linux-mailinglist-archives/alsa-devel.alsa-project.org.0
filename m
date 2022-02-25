Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D250B4C4EFB
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 20:36:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E0C81F30;
	Fri, 25 Feb 2022 20:35:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E0C81F30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645817782;
	bh=unOYrTNIhP99rs+0niudaiGnIh/L9pgziKK58SEZo58=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=le0YSgEhDNy5HGISpbDtt7h5rDHDgu75k5yfIsM2ylQm1pVopmTYkR8tVSzP2WAfI
	 5iOkx17F+MgFVuMAGkZl2cOdSOVQcaebYilXe62ONG63+gU8Z53tRuWKj4DNeys0t3
	 9kZvbHPgtKTQcp0f+2rqhWl3THJuY5B0A38MBLsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DA56F804FC;
	Fri, 25 Feb 2022 20:34:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C507F80271; Fri, 25 Feb 2022 20:34:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::628])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10E42F800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 20:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10E42F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="VIX85muY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UO26PmZjdmPV9s9b2xWAsdUwPkemqXJemMrb2oxEcaVEW+wcKFWQttUFOhYIzRn6HUQxUnqs2HuheIdEVLV35qb5q0jAMmh0eCDPPz2GQZ2DuZLIAdychcIryMcfb3pvnsQkXdFmMHBZ13wheIsDHk4P9zB3auXcTg5BCLzzS86ylRaRv9DuFfZt4rtuDVQswxWl5rVZiKHmjkzaBthwe5WE3cDxcigvl0faFjpdBlnuw99IPN0LotNZsrYVHFw2g0CTrMXLFRSYrymNPSVqrYft4bXK42dbzhthIHV/ATb/ZbtCxfTmz94o2kK0dU70i+t4p0YWzQC1bJLnNWsRdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTO65rPdmswhIwJtUcDHe4bDzdsQNBWL3CBniXbDuMQ=;
 b=H5KGnWd07FFmHwcjWv0elk9UNb1cnuZ7kCSVCd/gTsRcwowx16QzERNM6bEvHOXYlVpxrnogtoPUOWhGQPRbIoK+CEJKvi0OOXkrRiBTdgNdU+608T8CMFXrkXod4ZiRoShipyaM2+LQleVoXDFZQCM5mQLxLZLGsb0S7XjambP5Hoxv945whWyJRbzue3nHpPlBZ1CagKmcXuqLmOttAONIeQ9S5dQJVPtcsFgYQ0Dl3bS5OWMFk4g7WNtmaGc5w68TWr91IzI7ckS+CMMCps7IiJBE712SY3zDgwmI984otGPo3GbH92n5i5lA6LX2KD1IUF+JsZOLmBLyo2wgWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTO65rPdmswhIwJtUcDHe4bDzdsQNBWL3CBniXbDuMQ=;
 b=VIX85muYy4n5G6FHnRyW6uKGsnle/8pPbaYXYO71TQBlYEENprLbv1PkM2DabvG2qbTqGNpSKEL2IWP0KNse1eLTCsVeKLPb2m7Kgi5DG4YRJXtoBMSn1Q/KFk3SxwqxgP4+tealqF/LwDQCqX8DUBYgGQNi5n2eu2o0/uVL870=
Received: from BN6PR1401CA0011.namprd14.prod.outlook.com
 (2603:10b6:405:4b::21) by MWHPR12MB1712.namprd12.prod.outlook.com
 (2603:10b6:300:112::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 19:34:41 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4b:cafe::37) by BN6PR1401CA0011.outlook.office365.com
 (2603:10b6:405:4b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22 via Frontend
 Transport; Fri, 25 Feb 2022 19:34:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Fri, 25 Feb 2022 19:34:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 25 Feb
 2022 13:34:39 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 25 Feb
 2022 13:34:39 -0600
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Fri, 25 Feb 2022 13:34:35 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 2/4] ASoC: amd: vg: update DAI link name
Date: Sat, 26 Feb 2022 01:00:23 +0530
Message-ID: <20220225193054.24916-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225193054.24916-1-Vijendar.Mukunda@amd.com>
References: <20220225193054.24916-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e300b18b-d200-4d3e-4d87-08d9f895ddb5
X-MS-TrafficTypeDiagnostic: MWHPR12MB1712:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1712AD656946A8B1BA4F33BB973E9@MWHPR12MB1712.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ky+SEnyE7mIIPJCwI7fen7PKWiQx1LeenTvrhZJahxN9CwnKu/FONimjdEU8vUg04uQGpPsdNw33cJ1DVJIfgoobdidtCiMbNdOgTffBdvX162FlQO9jERY7Z/C6VSpvQL3ApU+U2TWR8V+W3ccJ1IZ+fw5CvRYoMk7ZhjjwzJCHrK8A/UtOrSdqcBnz+CGST10QoQpik6cHMP5HG7Wytc7eEH00a3v0fhTfJcj5isqmsuCm5Ynlu2kEB8iE2EKkmEkwaceZ6/cYAGBkh+Ed9yatmaXVufr7b+s1isMM1p2I6e60AFiro17jP0rT76c9uZHniajQbBLAFf5otlTaevNpOxKFPJgT1x5LSHDBbH2/4t1iXeOyfjFIML91Bi2pyZsO00oTvxs4N1ENW/xue83J9rk4Gn3O4tccRiK82BfyEQEFIA9gjIcJgj3l6Wcgd5UTXaVZ825uAPLv3S+eqaEBLZXk4fjwS5bvHPJrYmIq4MdeTo7741DrKPhYDQ+iMetvYa+43z81RjD1rIPab56TSVhK9f72vANN8MbRwhW3unUM3eiCdeDxn0b5hXtdcHVkx6KwcyUOTfPyOLWElXwAdj2xKQ9moKFSQz4tYesymVIxEn+mu6SHabx0djUY1MEi+/xy6V6Z+/Km/nUQx/gUqJZOBeVjEpmDTHBjz2/l3x/wLaW58MaD8NxKWkRB5IQZAYeCRDwUjhMUDQ05cA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36860700001)(86362001)(47076005)(70586007)(70206006)(356005)(8676002)(36756003)(2906002)(336012)(316002)(83380400001)(426003)(4326008)(2616005)(40460700003)(110136005)(15650500001)(4744005)(54906003)(186003)(1076003)(26005)(8936002)(5660300002)(81166007)(7696005)(6666004)(82310400004)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 19:34:40.2473 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e300b18b-d200-4d3e-4d87-08d9f895ddb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1712
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 krisman@collabora.com, dan.carpenter@oracle.com
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

Update DAI link name as "acp5x-8821-play".

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 18b2fdc8dc9e..287efd9282db 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -242,7 +242,7 @@ SND_SOC_DAILINK_DEF(platform,
 
 static struct snd_soc_dai_link acp5x_dai[] = {
 	{
-		.name = "acp5x-8825-play",
+		.name = "acp5x-8821-play",
 		.stream_name = "Playback/Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S  | SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-- 
2.17.1

