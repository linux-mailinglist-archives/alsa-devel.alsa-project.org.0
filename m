Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BEB48DBED
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 17:37:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85F391FD2;
	Thu, 13 Jan 2022 17:36:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85F391FD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642091839;
	bh=6zUsG9qYtYMH6LtbgM+EGV5W/jbeFrJEFB6JIxKaUuc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FWpLQ0YCvxHYhOMeSZ3RAEYylmfoZWdvj00ia7uoEn0/VnX9WD84FeY1JxXtXAObg
	 X3lmSXBJCyEKvcpvu8hCAYzjcAC7zabC9kDg+JLO1wlFg1lS98x5SltF6/tpV/3jiW
	 0QGiG2DpHaEUWyKUDSIrUcgPMaiVeeQEo7aUya2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60AD9F8051D;
	Thu, 13 Jan 2022 17:35:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94D19F8051C; Thu, 13 Jan 2022 17:35:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 212D9F804F2
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 17:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 212D9F804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="hLA8+6RF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/HWsp8cmLngxaHlw9HKpjDrDiZix4MLLXSm1UhnP9Itidg1FZ+4TjNgigd99JISsB5j0L6GJcWPsBwgFgtQ2iI/27zQt1ptj5yFwhlDEK3hBFPvFDzw/9Or5dUyAgqNp+edZQrd/eHTVUDTnRfqNsiXx2/i7P1t0ttuxer6IZxbhhmmlIdTy9Lk2eIe3B7uicAcYLfjSJT2DL4ipwzKF1WmwMDGK0kta9XWBk3cbYBNJf+7wg4NriVmJH+P2ZL/Wz3dEm783WS1BhE5P7ucQeeq2YykHATIzCUvurX6pB3uCtPQI2YtQ+6XgcJ0YjKUBmIexMG9D0Qwys/27kaXYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0zrcuPd4mY9R/L4Zs9eqA5JLpYh4Qq+f12LdA0fmIE=;
 b=DBaROG2tF+QmzhRCFv3voz3+7HpY7/3nsTVx2FmwXMX4vjjpjJbKhIPjYFPSl43XqETQhf+yh2oLQt8fCddm/om2x7afR6noDtObZzyY8hFOcAwW6V8mVvYij8rdw4wLSMC77n6u3zxekBmbsZjhePwj0LtjKcuW7XqLRc7dSlFhpGbe0rrMtrtzB4V347NEsylVfM06LccPpy+eak/mR13mMPEmldjYVDizQgV4svWImee7hRXRxba82e39+BRC48S1E/nKMaRZvp5uDvLApSGlU3E8M1o61Bcl1SHdsZY+XXElTzYyF5BUXXCvSiX8NIXeouYFtXxE7l/xOTz8MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0zrcuPd4mY9R/L4Zs9eqA5JLpYh4Qq+f12LdA0fmIE=;
 b=hLA8+6RF6m7Lx8NvbZ7mnRpFBI6BQI/Ev4J0g64VwNxPpsPow3TceoQqCHu/TpuQByCLEQC//3g0BzNZwHX3AdqnWqIUBE7lhDWfIBOZZkB1BQVnMzslCRP/Eg8bTiFP8B08kd9kSoDkIGZZ7qRQcBcu8f9LAy1ZR0jxT1Sp1es=
Received: from DM6PR13CA0040.namprd13.prod.outlook.com (2603:10b6:5:134::17)
 by DM4PR12MB5181.namprd12.prod.outlook.com (2603:10b6:5:394::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 16:35:38 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::c2) by DM6PR13CA0040.outlook.office365.com
 (2603:10b6:5:134::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.2 via Frontend
 Transport; Thu, 13 Jan 2022 16:35:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 16:35:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 13 Jan
 2022 10:35:38 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 13 Jan
 2022 10:35:37 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 13 Jan 2022 10:35:34 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 5/6] ASoC: amd: acp: acp-legacy: Add DMIC dai link support
 for Renoir
Date: Thu, 13 Jan 2022 22:03:47 +0530
Message-ID: <20220113163348.434108-6-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113163348.434108-1-AjitKumar.Pandey@amd.com>
References: <20220113163348.434108-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb4d5506-3fc6-4fdf-4c87-08d9d6b2bb75
X-MS-TrafficTypeDiagnostic: DM4PR12MB5181:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB51818E9D288E8A089036F6D082539@DM4PR12MB5181.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EJow5ApciIzL9vjd8dIJj0xMmZCAbvwiE0RkWnoQhDtsfT4FJ/auJcVV4zZbZKevVYGyyEUo11ED/IZVwc1HLwOfZ0DO93bTlg96r9QHLxeZKnFBzQknumTKMoBU62nK7pij1qao1B+CGFgIwSH+Yfz9kOKcAkjoH7W985V3Ds3bFDnI02Le6cRRPxRN/wwUPGGV7Fc/OcgNPekA3crU7Ik82wEognBTKy0SR7Z9NAvIDehA7sh90s7l0H/twmz89YCQwrdQbF1YNhSRehzvNCioTU+pi0BIbfugEC/9Wa2c57bbz/VT5fPuj/z58pqo2zbe24oZtt/6kUy3gVFPI83UGj9ikgFJCHK2370786mXwkyQPrHFMHhulcYueHLjcwco/9YhVgCxD8WQ6I5dZhb7TtY41Nt+sa0ylPQwDaJKu4ExOEr9TbGPsbH43vxDISIzcH/SlBCiNS9pgbSbzKYXL1U/zfMHXdieCyzlz5/djLg465GNCvZWGHnQIgkVQB17k2Fb4ibCY+wWaK0HBwBf8lZElxPGbbJYK+ovfV9RhrzxlPvd0TSac4vZ0ptDAzZX+OPEld2APAsNePrl2dDOaZ3N8Vqgx39KXHm0jsbOMLjQ1SEbsxawbzQymbwebsW6Wn6gjVJv6ELj68tZx0KsRkPOokDcWPiwRJsjsZowM6xmSHfO69khBlvn/u3+brORRHg/BrlIHBP4Lp3bdQ8i5Njqpg7IarDJtB+pmkyVtUT5rsx7/vOAteGu2YT/+nY6TPwFJC2Fa31P8ApMEEsOOKz4Wj15K2z2JG9o5+0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(36860700001)(5660300002)(508600001)(4326008)(70586007)(36756003)(81166007)(2616005)(6666004)(336012)(47076005)(356005)(426003)(70206006)(110136005)(54906003)(186003)(40460700001)(26005)(83380400001)(2906002)(8936002)(8676002)(7696005)(86362001)(1076003)(316002)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 16:35:38.6560 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4d5506-3fc6-4fdf-4c87-08d9d6b2bb75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5181
Cc: Sunil-kumar.Dommati@amd.com, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, V sujith
 kumar Reddy <vsujithkumar.reddy@amd.com>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com
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

Add DMIC related dai link for pdm-dmic dai on Renoir platform with
generic dmic codec dai.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/acp-legacy-mach.c |  4 ++--
 sound/soc/amd/acp/acp-mach-common.c | 15 +++++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
index 0ad1cf41b308..91140d15691b 100644
--- a/sound/soc/amd/acp/acp-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-legacy-mach.c
@@ -23,10 +23,10 @@
 static struct acp_card_drvdata rt5682_rt1019_data = {
 	.hs_cpu_id = I2S_SP,
 	.amp_cpu_id = I2S_SP,
-	.dmic_cpu_id = NONE,
+	.dmic_cpu_id = DMIC,
 	.hs_codec_id = RT5682,
 	.amp_codec_id = RT1019,
-	.dmic_codec_id = NONE,
+	.dmic_codec_id = DMIC,
 	.gpio_spkr_en = EN_SPKR_GPIO_GB,
 };
 
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index c9caade5cb74..b163e3a68166 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -438,6 +438,8 @@ SND_SOC_DAILINK_DEF(sof_sp,
 	DAILINK_COMP_ARRAY(COMP_CPU("acp-sof-sp")));
 SND_SOC_DAILINK_DEF(sof_dmic,
 	DAILINK_COMP_ARRAY(COMP_CPU("acp-sof-dmic")));
+SND_SOC_DAILINK_DEF(pdm_dmic,
+	DAILINK_COMP_ARRAY(COMP_CPU("acp-pdm-dmic")));
 
 int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 {
@@ -613,6 +615,19 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].ops = &acp_card_maxim_ops;
 			links[i].init = acp_card_maxim_init;
 		}
+		i++;
+	}
+
+	if (drv_data->dmic_cpu_id == DMIC) {
+		links[i].name = "acp-dmic-codec";
+		links[i].id = DMIC_BE_ID;
+		links[i].codecs = dmic_codec;
+		links[i].num_codecs = ARRAY_SIZE(dmic_codec);
+		links[i].cpus = pdm_dmic;
+		links[i].num_cpus = ARRAY_SIZE(pdm_dmic);
+		links[i].platforms = platform_component;
+		links[i].num_platforms = ARRAY_SIZE(platform_component);
+		links[i].dpcm_capture = 1;
 	}
 
 	card->dai_link = links;
-- 
2.25.1

