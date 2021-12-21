Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEED147C453
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 18:00:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C68317BA;
	Tue, 21 Dec 2021 17:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C68317BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640106019;
	bh=Ks/DPFfL2CzZD3Da1XlMEUHLgU4bsnHxrqz4hYKqSVM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jW+m2tjAV+6rplgQpaSAhBu3pbnzy4f/b241msPIrMH3SttcS4nQoqvqNOWhkOxIe
	 r+nq1BjdtFEEndTolUTP/7SPLox7/xQNid1SIgfDQxxRDSAyEbUKyoS+4A3apa3lLK
	 96WI8nUeE+OnhowOR4H4WBqR5gPuzgUadGQMw+hQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA0A4F8050F;
	Tue, 21 Dec 2021 17:58:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8373DF804EC; Tue, 21 Dec 2021 17:58:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 948BBF804EC
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 17:58:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 948BBF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="E9Licbpw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgHTUf+BJ4eoSPoYdTdMEQzXJ4YLUrVIeb/T6jwSNkbN36gxjTtl/46/4s2CS8oiFU1YG7q9IAnCwQ/z8NfOjr+QJHxc+/nhCeu8dlrwyCnPgl1WXVVqEsd+ph4NlS+Wg6G4Cl0eXOvx2gzv7elwYoi2sN1mHdck08xfrV7H2KnnbRZxFCTozMekVHpTdihOXIj51Oiw9kVE8+b41GHqZ83hZvmuLTL/g86mNETaZUoSt0l5VsnYfdurlpwoMogvC8Za6PFQD2yIm767VsFP5ORw6LErjBOUrEArotfaPOBCRXP5TBJ37qdujKl7LUpGkvDtjcxSXmV/DEUklYaB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rItwZkKUxti8nGR81PnvwHALhzE3fm9ukB6UAKqP8EM=;
 b=eEdUtK5iDz+qGA6e4E08s0ezwJe8WfXV/p2VSsv4Dyhlkn/HlSgn8+Yipg8I0ydK77aklr6gPt0v8H9BwVCxhnTMjAdCPam4X1Lmvmw+545tmXfFL+K8oqZ/Pc9Ngfxd++35ubqSZBPnqlJASDz2e77wjeMOrlG9UH9dNQIAlLSdXQuJDuLukANbZmdQdnfJ/Kn+0EXJVZ3YycGi5TFW5MTEnuLsE7QJSJrsh3zpHC5FjaJ8B24Cs/cpBR/67NqvMsf7kiRY7p4qRkbH30jCV/BhekiM/iV/BtfAAXXIcrEgeZoy5hteiQUQmpFC5ISYhjf1xbq1SYXfBM1PY7GzVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rItwZkKUxti8nGR81PnvwHALhzE3fm9ukB6UAKqP8EM=;
 b=E9Licbpwt7Xvqz6/yaUcsJ7x7jDlSBJLfqpYe+IldPkWTq0S6Tgl1Tr/kBP25WGDwXTDPIxlHZ/6B6vBt+JihyB9zvQVGjHbiKcICijCEui/16nkKEMsABGeW5rSyjHncqmnWlPs+tER9PBseSFYiENh/aWXCscsy4J8c4Ij4AM=
Received: from BN0PR04CA0046.namprd04.prod.outlook.com (2603:10b6:408:e8::21)
 by DM5PR12MB1660.namprd12.prod.outlook.com (2603:10b6:4:9::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Tue, 21 Dec 2021 16:58:36 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::6e) by BN0PR04CA0046.outlook.office365.com
 (2603:10b6:408:e8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17 via Frontend
 Transport; Tue, 21 Dec 2021 16:58:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Tue, 21 Dec 2021 16:58:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 21 Dec
 2021 10:58:35 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 21 Dec 2021 10:58:31 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 3/3] ASoC: amd: acp-config: Update sof_tplg_filename for
 SOF machines
Date: Tue, 21 Dec 2021 22:27:59 +0530
Message-ID: <20211221165802.236843-3-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221165802.236843-1-AjitKumar.Pandey@amd.com>
References: <20211221165802.236843-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3d3da10-f21a-4d9b-40b7-08d9c4a320ff
X-MS-TrafficTypeDiagnostic: DM5PR12MB1660:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB16603DA48BEAB9C211080A4C827C9@DM5PR12MB1660.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJe3ljX38qNBC+xeg5gmtgXbr0TVHt15sWkdlSLLWibyDpToXIZp+QLDVsjAWGYDUpgmzZ7AQKtIxCnZx2TmGQFVtF+JIocoJ61oLXuOD2X3SqOS2tdM9rFzBwhPifVEngXjsoLiKz6C7zI+4OQ3GZGlaf93Re5IPMlTO8+ds8hI6paeOMmqYGf9b/UKydo5uoCz7XGIxFiinkdTOOQPcH3Jyfl2ckeBCRpiL6WGCSqDOHLCLL9ztDa3KwcgTW5dPreLeAMJUJF2vYDKUTr6K796qfW/XUBqHlUnsxj4QW5YGMqdeEZEj1cQTwudk+YUJCFQg0th0T9MLgyjmpp007bHvkJlHW+1HrMSE5h4YTkWCPIiCbSwKsMJvK4gVd9Cc7XU0E3+zkh2ysMe29ismaQPb4uK1yz2dS5PS3eF7TPht2lHVWJK6VXoj2/FK4XIX5Gc9hkUyRzkUyaFGcxmUOBIZ6Ej6rcSYs4AGL/GkvmaYM3E5qOICyqTght5CD9hhl6984vvUfVoc5S4zWpXP6QcXegeT7zYWF3j1bxOBCFbd/p5miadMjGrdzA/IxiY4y2f/Kl6JJ8d+MTdglBMnkdRFg99KNvsDwfyeE1D6MAmcDUygT31PuyvoW94R9r9IAtPN+Xli6UmVTIz5HvWVS5sLK207SFxlhUYmrYtOeEKkz31uhKWV7iANZ6/YndA5B3nAsnGzlc1XUvMR+y8dwegmWttBg3b7+O3bWiIrnZLn4aJ19HoVD+QCLQ0o2Sixivy8SVSjD+qEqaILwyEGL+JG5VCdl02wHlhIeDcCnc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(110136005)(2616005)(54906003)(7416002)(6666004)(1076003)(8676002)(40460700001)(82310400004)(508600001)(426003)(47076005)(83380400001)(86362001)(316002)(336012)(2906002)(5660300002)(186003)(8936002)(15650500001)(7696005)(70586007)(70206006)(356005)(26005)(36860700001)(81166007)(4326008)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 16:58:36.1479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d3da10-f21a-4d9b-40b7-08d9c4a320ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1660
Cc: Sunil-kumar.Dommati@amd.com, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, Curtis Malainey <curtis@malainey.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Kai Vehmanen <kai.vehmanen@intel.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com,
 Daniel Baluta <daniel.baluta@nxp.com>
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

SOF machines support different codec end points and hence required
different topologies configuration. Update tplg filename in machine
struct to load different topology files for SOF machines.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Reviewed-by: Curtis Malainey <curtis@malainey.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/amd/acp-config.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index c0bbcdb1761d..c9e1c08364f3 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -90,7 +90,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[] = {
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &amp_rt1019,
 		.fw_filename = "sof-rn.ri",
-		.sof_tplg_filename = "sof-acp.tplg",
+		.sof_tplg_filename = "sof-rn-rt5682-rt1019.tplg",
 	},
 	{
 		.id = "10EC5682",
@@ -99,7 +99,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[] = {
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &amp_max,
 		.fw_filename = "sof-rn.ri",
-		.sof_tplg_filename = "sof-acp.tplg",
+		.sof_tplg_filename = "sof-rn-rt5682-max98360.tplg",
 	},
 	{
 		.id = "RTL5682",
@@ -108,7 +108,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[] = {
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &amp_max,
 		.fw_filename = "sof-rn.ri",
-		.sof_tplg_filename = "sof-acp.tplg",
+		.sof_tplg_filename = "sof-rn-rt5682-max98360.tplg",
 	},
 	{
 		.id = "AMDI1019",
-- 
2.25.1

