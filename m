Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB9083FDF1
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 07:00:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D218950;
	Mon, 29 Jan 2024 07:00:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D218950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706508058;
	bh=RB6x8bhzc8yJDAX5m2LLegcKYgJO+4wrUxuQWIb1xf4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p7RJK6SbPP7jpifHU4dHGSieDExWDcsPGQz581VP4NOM1SiOMwB4aOLcKnPAMbNZK
	 fY4pKM4xRj4h4rO2QEG6d7P8HvARfC0An5uicEZknKwchtTFPrCkqss8DsMnJIuUU5
	 bI1hH8sAJX4WuUsqcA+acy4dipyBxIVmEy0euYHs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32F42F80588; Mon, 29 Jan 2024 06:59:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FF79F806CD;
	Mon, 29 Jan 2024 06:59:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B99CF80310; Mon, 29 Jan 2024 06:54:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97016F800FB;
	Mon, 29 Jan 2024 06:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97016F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xdlHAh0Y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NY8LlY/p2edxLLy7RkXEUjCKdM3fGePmAtJrzZbZWHt2gckxQeSa42icdLG1CqLzr0QunostxVwJzFpXsmaEjUefwO/lHsnEl2m4gJv62vy1BG1IwdMmjR8cn6V5xLmZzyUCLQLVLLGefT0Ht32U7gIRxNMHCevUdTwSunQZuznyzkr7NNqtq+7RGEQpJDYG3Hn9w8DRTEBVCra5kiYYHwZDIH8jSpoUqYWFzWx9Sqh9XgaWpQkOMs5capBWWca1kjEvMHiBAZScGEDPfUuGXAWZ/HVeb6dgUS6YeHVNiEzL4u65D99DFPN2ZZPvEIjZh9rffiG5mbQdQLAJSwuCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKOFoFwvwHhh0ZCco+orcSiWTrgMYHT4q2QAcVORliM=;
 b=T0OiVR67k1aLUC7Zmig8YMydcxPg4g3mTRRCXuwwxXufOLMKOJen6/0aBnR6QQI7D1qcc18OpXxBuW4b120WTbs20K0QM7iVWIiMUo0RkJ3w65sJPxvE6OjLeb8GUL1zV6xOjYi3CWDVc0crnsCGJtrKB5W+MFdkJ2sRdYwqsWtqXcAlhmGyOzJ62c3EcPx8B3nrgBwet7v77fyNqfZWc7jKS9ZAO2NHplsVB9ieomzkoGZcm+TaeyNAztFz1Bt5UEyfFU8i7ebbTKr3WIUsBctfRVrW6RN+TBjJ0zQ3KAO8GXkcWAo47PDNwDuCr2iQF6DTAboISoR1vB95V3HfSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKOFoFwvwHhh0ZCco+orcSiWTrgMYHT4q2QAcVORliM=;
 b=xdlHAh0YTgr8OHMaS90+odBztgu54gZJFQgSjz2VROFu9MCX7t1D6gw03S0b3oSo7Z5GjMgiTOKemyr6ISfParDmx7UJrxQzgWT2gJkWJe1w2Q0OltsFVy7YwmuNs3ybXDUi6Pc6nUETUq0B7YWpkI2AGGGdH/Xdk689+YwnGGU=
Received: from BN8PR12CA0023.namprd12.prod.outlook.com (2603:10b6:408:60::36)
 by PH0PR12MB7096.namprd12.prod.outlook.com (2603:10b6:510:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 05:54:17 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:60:cafe::bd) by BN8PR12CA0023.outlook.office365.com
 (2603:10b6:408:60::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32 via Frontend
 Transport; Mon, 29 Jan 2024 05:54:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 29 Jan 2024 05:54:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 28 Jan
 2024 23:54:16 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 28 Jan
 2024 23:54:07 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sun, 28 Jan 2024 23:54:01 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <vinod.koul@intel.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Emil Velikov
	<emil.velikov@collabora.com>, Mastan Katragadda <Mastan.Katragadda@amd.com>,
	V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>, "moderated list:SOUND -
 SOUND OPEN FIRMWARE (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH V4 13/13] ASoC: SOF: amd: refactor acp driver pm ops
Date: Mon, 29 Jan 2024 11:21:47 +0530
Message-ID: <20240129055147.1493853-14-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|PH0PR12MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: b5580117-1182-4d33-da83-08dc208ebab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/Z8663GJyPzkxcX06QDlfistPe1d9d43eES0MEQDzfzqvzUz7zfEp4Gb6FjTlc8vgVDGtvA1zG0dICcNQnJABW7TOlWL+x/O5qP0oG25K3TnscbgsgpGlA/7Xtn9fOLrrjPn/jVIP5mo2Sy4BljWzPzfiF+LGRQHMewTi9OXDru5YAZkjpbZPmN58gxwvbWR3iiPSz9jHIimnqbRqk/+1iYESBbtQahaE9jNyzwy3qqDbelP5lsk1ELRCd0i8Bx/NJcuTLNbq/9HU9AfgPw71sOVOJMu6+MarA53IWWKlsoLZdtsrHxMAFkqabtNfTdngNwXj1WCqWiLeU/wwXhWELGRcZ3QuYfetSSOUvZnMpTkvZb3gDhjCaOT31x4acQKnFltGlh76hyFU+i3Nyy3dkZQuYLmWWsJEX9EwNf4OjHpbmBKqdLf6pFQgaKbt96zPEqiIIL120QsfrpFMMTTlOtkm3VERHRmCWWsTKtd5w7yPLxKPqTVdsodTvo+7FUitImbf2I3cFa8k8WJ01j+5e3ukclZCMuBzGAntrhghBIErsqB8VATILfbTBtyxH7DxLbmvZkC+MXIt/b6ffQuDaEEslX5a6i7O6tA9aR0FpFixVeTcZnLq6RC4Y+L+9RBRN6XWVRX6s0sigTrjt9X9cM7Xr/f1WfQdXllFDrmJOAlCPl62jgjbceR44jE2ruQmj3GQuQ7ZEqnVkiJGYBdgI3xc1Z/pcP8rf80qXqTFt6VvLAcYYVKQ/fiCEo4kW3QqS+G3xp/+9kvJbYnqJV8mg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(82310400011)(186009)(451199024)(64100799003)(1800799012)(46966006)(36840700001)(40470700004)(36860700001)(47076005)(86362001)(41300700001)(83380400001)(36756003)(82740400003)(356005)(81166007)(478600001)(8936002)(8676002)(4326008)(316002)(70586007)(70206006)(110136005)(54906003)(26005)(336012)(426003)(1076003)(2616005)(2906002)(7416002)(6666004)(7696005)(5660300002)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 05:54:16.8961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b5580117-1182-4d33-da83-08dc208ebab1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7096
Message-ID-Hash: TVY55FWFFCJZLH2TDNHVKYVDIW32MJXX
X-Message-ID-Hash: TVY55FWFFCJZLH2TDNHVKYVDIW32MJXX
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TVY55FWFFCJZLH2TDNHVKYVDIW32MJXX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor acp driver pm ops to support SoundWire interface.

When SoundWire configuration is enabled, In case of ClockStopMode,
DSP soft reset should be applied and for rest of the scenarios
acp init/deinit sequence should be invoked.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp-dsp-offset.h |  3 ++
 sound/soc/sof/amd/acp.c            | 65 +++++++++++++++++++++++++++---
 sound/soc/sof/amd/acp.h            |  4 ++
 3 files changed, 67 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index c1bdc028a61a..59afbe2e0f42 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -103,4 +103,7 @@
 /* Cache window registers */
 #define ACP_DSP0_CACHE_OFFSET0			0x0420
 #define ACP_DSP0_CACHE_SIZE0			0x0424
+
+#define ACP_SW0_EN				0x3000
+#define ACP_SW1_EN				0x3C00
 #endif
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 0752f99cac0d..72090c33982d 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -481,6 +481,31 @@ static int acp_reset(struct snd_sof_dev *sdev)
 	return ret;
 }
 
+static int acp_dsp_reset(struct snd_sof_dev *sdev)
+{
+	unsigned int val;
+	int ret;
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SOFT_RESET, ACP_DSP_ASSERT_RESET);
+
+	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SOFT_RESET, val,
+					    val & ACP_DSP_SOFT_RESET_DONE_MASK,
+					    ACP_REG_POLL_INTERVAL, ACP_REG_POLL_TIMEOUT_US);
+	if (ret < 0) {
+		dev_err(sdev->dev, "timeout asserting reset\n");
+		return ret;
+	}
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SOFT_RESET, ACP_DSP_RELEASE_RESET);
+
+	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SOFT_RESET, val, !val,
+					    ACP_REG_POLL_INTERVAL, ACP_REG_POLL_TIMEOUT_US);
+	if (ret < 0)
+		dev_err(sdev->dev, "timeout in releasing reset\n");
+
+	return ret;
+}
+
 static int acp_init(struct snd_sof_dev *sdev)
 {
 	int ret;
@@ -497,10 +522,34 @@ static int acp_init(struct snd_sof_dev *sdev)
 	return acp_reset(sdev);
 }
 
+static bool check_acp_sdw_enable_status(struct snd_sof_dev *sdev)
+{
+	struct acp_dev_data *acp_data;
+	u32 sdw0_en, sdw1_en;
+
+	acp_data = sdev->pdata->hw_pdata;
+	if (!acp_data->sdw)
+		return false;
+
+	sdw0_en = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SW0_EN);
+	sdw1_en = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SW1_EN);
+	acp_data->sdw_en_stat = sdw0_en || sdw1_en;
+	return acp_data->sdw_en_stat;
+}
+
 int amd_sof_acp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 {
 	int ret;
 
+	/* When acp_reset() function is invoked, it will apply ACP SOFT reset and
+	 * DSP reset. ACP Soft reset sequence will cause all ACP IP registers will
+	 * be reset to default values which will break the ClockStop Mode functionality.
+	 * Add a condition check to apply DSP reset when SoundWire ClockStop mode
+	 * is selected. For the rest of the scenarios, apply acp reset sequence.
+	 */
+	if (check_acp_sdw_enable_status(sdev))
+		return acp_dsp_reset(sdev);
+
 	ret = acp_reset(sdev);
 	if (ret) {
 		dev_err(sdev->dev, "ACP Reset failed\n");
@@ -516,13 +565,19 @@ EXPORT_SYMBOL_NS(amd_sof_acp_suspend, SND_SOC_SOF_AMD_COMMON);
 int amd_sof_acp_resume(struct snd_sof_dev *sdev)
 {
 	int ret;
+	struct acp_dev_data *acp_data;
 
-	ret = acp_init(sdev);
-	if (ret) {
-		dev_err(sdev->dev, "ACP Init failed\n");
-		return ret;
+	acp_data = sdev->pdata->hw_pdata;
+	if (!acp_data->sdw_en_stat) {
+		ret = acp_init(sdev);
+		if (ret) {
+			dev_err(sdev->dev, "ACP Init failed\n");
+			return ret;
+		}
+		return acp_memory_init(sdev);
+	} else {
+		return acp_dsp_reset(sdev);
 	}
-	return acp_memory_init(sdev);
 }
 EXPORT_SYMBOL_NS(amd_sof_acp_resume, SND_SOC_SOF_AMD_COMMON);
 
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index e94713d7ff1d..947068da39b5 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -31,6 +31,9 @@
 #define ACP_ASSERT_RESET			0x01
 #define ACP_RELEASE_RESET			0x00
 #define ACP_SOFT_RESET_DONE_MASK		0x00010001
+#define ACP_DSP_ASSERT_RESET			0x04
+#define ACP_DSP_RELEASE_RESET			0x00
+#define ACP_DSP_SOFT_RESET_DONE_MASK		0x00050004
 
 #define ACP_DSP_INTR_EN_MASK			0x00000001
 #define ACP3X_SRAM_PTE_OFFSET			0x02050000
@@ -242,6 +245,7 @@ struct acp_dev_data {
 	bool enable_fw_debug;
 	bool is_dram_in_use;
 	bool is_sram_in_use;
+	bool sdw_en_stat;
 };
 
 void memcpy_to_scratch(struct snd_sof_dev *sdev, u32 offset, unsigned int *src, size_t bytes);
-- 
2.34.1

