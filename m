Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FA54C0D3F
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 08:25:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30628194A;
	Wed, 23 Feb 2022 08:24:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30628194A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645601135;
	bh=vo1pimwegWweai8458tuFqI4wiJTy+vsNYWQZ5E4c1Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FMftxeVykKKLCQChsGeOJ9vPO0zeRc2rT/F7FgyF8+2S/RFseRYfEB+o4NoaBAigW
	 NcIcfFbN32ADNdjDdpEMKega0AUuqXwyrExCofT37FY/pBXsKtR35eSgX/Jv9sOVlE
	 tVb3EmvZvHUUM+gf0xUp4JUJu80xTZCF3RndN10Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 128BEF80519;
	Wed, 23 Feb 2022 08:24:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68BFBF802A0; Wed, 23 Feb 2022 08:24:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::604])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D21F9F8019D
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 08:24:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D21F9F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="vuSuFqoa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiqgEdD0yo/vJosm5tAMtHiu9l5xEXo16VfGrylwa5P78d8+sMlNDLD+SXJnSuWHfEJ82wW/c+odAOG03wlTOrpup1DiU/b9xK5pgJ5G/0B8hmsmG8liXBxwoC2jgY+jWS4u1lwd5MqyNdFjx8ahDBCfwQ7fxhDjkmOTR434OLz8eILW3askIEKGzcph6NyD0xUqFrN1kmJI7TrVmyMyD4pNmfyVHg/Pro9FCM/MJcE4BNa4c6tgSwlnVHCaizlKm6UdnUC9baWcULuM7y1yIFYAgBTsb9s7omLqsyGLKZyuyZ9Jx3skIf1muzqfYnkPCDwSD7J223lfRxraY9cbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNZdMwv7f9vordSmao+DeoLfrkUT4J7OyzKY+uIv7DY=;
 b=FjUVY07YA2pcVl0KS7Xvmu/CfGuyyMw1mM9nQCibCXazme7jMkCnjlevaaQ3zZOo7KSdqxhgdsdWbkCwBntRuNBuPfBrjcQXVyxMLOHM5CzLDtfY4F+LLKjXpb9giNxlByax7P1iTMEYBXROblUgNsDPAGSGyd8C7Kl3d/tTwRvMP7g+Rwbj2XpyB72Mx5opsxTFzRLVomXkO3yEx5XwkiG1hHI8WOcHs6blDamVlihK5SQpyyC7KVIfhPapEtIc0cx+VffuHihXkhMKXCwqFTcAvOk+DGp9ZhtmAj0JgDwakfDbd1e6FdpLUn4Y9VeCrKWwwK3n9fXJ9MWr/GZAKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNZdMwv7f9vordSmao+DeoLfrkUT4J7OyzKY+uIv7DY=;
 b=vuSuFqoa49jSrINIWHEw5jeAlcxQLox863W728kRR7gRstlPtjVvPsJe+wo/pbaaAWmhvreS+i3ywp8EWq53frzvPfYR+Wv6vSEORIBcV9RzzSvAA1x5OFqnNKcuHSS0DTvNoZGglJIZ992o9T5OOrZveNTUf91mC42Ej0GJ7RI=
Received: from BN6PR14CA0042.namprd14.prod.outlook.com (2603:10b6:404:13f::28)
 by DM6PR12MB3819.namprd12.prod.outlook.com (2603:10b6:5:1c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Wed, 23 Feb
 2022 07:24:16 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:13f:cafe::88) by BN6PR14CA0042.outlook.office365.com
 (2603:10b6:404:13f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21 via Frontend
 Transport; Wed, 23 Feb 2022 07:24:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Wed, 23 Feb 2022 07:24:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 23 Feb
 2022 01:24:11 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 23 Feb
 2022 01:23:58 -0600
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Wed, 23 Feb 2022 01:23:55 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 3/9] ASoC: nau8821: enable no_capture_mute flag
Date: Wed, 23 Feb 2022 12:49:32 +0530
Message-ID: <20220223071959.13539-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220223071959.13539-1-Vijendar.Mukunda@amd.com>
References: <20220223071959.13539-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff7e0e9f-a554-43f6-ee25-08d9f69d7f9c
X-MS-TrafficTypeDiagnostic: DM6PR12MB3819:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3819EAFD54DF1DCA06604AD3973C9@DM6PR12MB3819.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9egyPvR2XUM+NrKSjjwhlT21my6TYOXVzj374RLMCE35u3GqbIVo3oQlMtZx17cFa16yGiQc0zzrq/0k89K1+p2zxQ1Aivs9cvL9B9hzBINpcEdSENUECto4fhq3PMTo1APAGMrMddp66E4fVTvTptiqb3uSA2c5tiMVUaRswrUeeTru6idASuLMJgw9kuIOvBap89OFr4pJMg6N8yS3PQNCdMFFaSPIs2oaXW4U9Bthiw4KUxlxC6MAY7IScDi5LIG1fDOYoxK5n5o1XzC7oYoRO54cwya5rkIwpdNIRdmUeeNLvEnjgXWaFDjT0mf5o98xMS11oI8l+FXgZeI5ReKm905lL2tLTwkN3RtmIp1zQCm88VG4YxRcN8l5m8eSuY/VWUyXHC8+0MpbJ+tYwmZNVmsex1v8XhTat5SDIAFyMCN9r0GBFsECbOejF/33fVydvt2CqVMrYFOmtgKP9pciyHMFki6j8j95Rq50qeTT40FTUVjG+A2eD/lpBNOHWyZeK/WGZGyjwG7kkKW3O15nvnvJMyfhnxMKHTpcQW0w0seYp2Y1EXEWUyHOKpuHS0Z0YMDSqKA8lZndqMHaQufFrYRUTg0u4fQJ3N6+kUGxwjAyoyO4RtSsalrwdhfpR7q8q8uQBP7KAyRjZYPW/PJ4OTaWK4JDrZF0V/QdrkDFw1YqD8hTo1tVTjdbAp1NFO2bn7YKQv9C2I8XQIYDXw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(4326008)(81166007)(1076003)(186003)(70206006)(70586007)(2616005)(26005)(8676002)(316002)(508600001)(82310400004)(356005)(86362001)(7696005)(83380400001)(426003)(36756003)(40460700003)(110136005)(54906003)(8936002)(47076005)(36860700001)(6666004)(4744005)(336012)(5660300002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 07:24:16.0300 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7e0e9f-a554-43f6-ee25-08d9f69d7f9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3819
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, wtli@nuvoton.com,
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

Enable no_capture_mute_flag in nau8821 codec driver.
This will fix active playback stream mute issue when capture
stream got closed.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/codecs/nau8821.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 2de818377484..d67dc27890a9 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -814,6 +814,7 @@ static const struct snd_soc_dai_ops nau8821_dai_ops = {
 	.hw_params = nau8821_hw_params,
 	.set_fmt = nau8821_set_dai_fmt,
 	.mute_stream = nau8821_digital_mute,
+	.no_capture_mute = 1,
 };
 
 #define NAU8821_RATES SNDRV_PCM_RATE_8000_192000
-- 
2.17.1

