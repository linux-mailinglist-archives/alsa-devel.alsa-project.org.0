Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 100FE806D6D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 12:08:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B96C86E;
	Wed,  6 Dec 2023 12:08:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B96C86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701860936;
	bh=cp8XA+41oN7Ki9Za/t306zbyOIBPgor3pzO1wyX/IxA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uriZmb97Gvdpxo9aFZqLAu+3VANpXzr4CKbPqeySYpAj5tXsysUvQhJ/ZDVg11qvJ
	 iMuuZ61qGB7XXKDtNW8IWhbQIna7TrGyOBCxhX+w7HPF9fRIbdQ7MLy+LTgp8tUW0Q
	 BzgI6YxPhZpRf/FTJnIOed0d+OtJDOM6x7u79AOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82D05F80580; Wed,  6 Dec 2023 12:08:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1AAFF80494;
	Wed,  6 Dec 2023 12:08:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A59D3F8028D; Wed,  6 Dec 2023 12:08:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83C1DF8057E
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 12:07:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83C1DF8057E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UfrjWdD/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbxxFAREue76lM3mP8/oMyvFKiVI0mFn8jN9MR6JSQMbRIiAvfwfg1SYLV8Ey5RwZGC9PLi+17H1G9DfpKXJA7vqh+WToZS86kXua3B8QrPq+F4TuAc90vH3UPt1B0x4op6QiJTbcP547b6Bb2wZg9bQS5PzC5ejUw6A7AcEeDvFFgsOwpASa/2mX9+XlQXTKCnd1JhaP/JGqXYFRV88KhW8tHoTtuuuikatH0Fsn7ioekpsOWoxOWWgdYSxgJZfVBlHSxFPZUoSlWtNS3+hSgaFtKEEM6OiZR0ft8IuWiDhUGY+cmpTJAEs2+n7NLj7Apix/4r7Rs+8s4JTeAadxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhwFWLv7JfCGRvb0WPD0pnr3Q3jEArGyuG8DCk0BwH4=;
 b=lQt7l8YKG58i+8L5qpN6vlSI+G+sZtbPducMKftKg3utjS3Mml4R9xlWvkro89KmZ/xIFDt7uJto+aLAdgEzkjIFquQ9aOGO2R3J7WcsW9BCXb6l9Zzijl6MRPUfx12bOFeTkViJwXbnUY3i4Vm4ABFufUUjMA9ZgUqFqvapv2KgtRds5+23o/8gEBm41j0VKk1a1w+Q++W8m/38KSy+7zv/1DRTTwoEJdZeRfrR1a913fhcZXphymaoOQTVJiSDNqdfmoBeDekUsRynBTK1sFdw68BHuh6RZ826emBEomJ7RmDBDyQ8iIMg6oI7asl+YZw5Wx6a7OHNWjFYEP15OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhwFWLv7JfCGRvb0WPD0pnr3Q3jEArGyuG8DCk0BwH4=;
 b=UfrjWdD/0xy4tyEkcDxqOzKSO4yzOP1vxC/L45iY7gpDKdN7Hh5Jv0wyFln1lMRWOohe9tgxmGoYRGvrn+bRsu70/WXHdPaQOz8Dljh/D4l8+0eHJh/8KQ5QKr8Hj0H3lSTtRO5M3E6t9k4ROcARwy7UUC3XchFQIKwpCcQWtOg=
Received: from MW4PR04CA0087.namprd04.prod.outlook.com (2603:10b6:303:6b::32)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.26; Wed, 6 Dec
 2023 11:07:43 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:303:6b:cafe::ba) by MW4PR04CA0087.outlook.office365.com
 (2603:10b6:303:6b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 11:07:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.2 via Frontend Transport; Wed, 6 Dec 2023 11:07:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 6 Dec
 2023 05:07:42 -0600
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 6 Dec 2023 05:07:33 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "Alper Nebi Yasak" <alpernebiyasak@gmail.com>, Syed Saba
 Kareem <Syed.SabaKareem@amd.com>, Marian Postevca <posteuca@mutex.one>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "open list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open
 list <linux-kernel@vger.kernel.org>
Subject: [PATCH 7/7] ASoC: amd: acp: Set bclk as source to set pll for rt5682s
 codec
Date: Wed, 6 Dec 2023 16:36:18 +0530
Message-ID: <20231206110620.1695591-7-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206110620.1695591-1-venkataprasad.potturu@amd.com>
References: <20231206110620.1695591-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 113081ba-3f16-45fb-3437-08dbf64b91de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G88pdZ5HEcsxdXUjgGVf2TW8XCnV4LV2AaWFQKVPF/SrnqSw9097J8ml1cmc8SR5tPblHXbHjEPS0MzjZ3srbuYz1h4dPG65kHFR9EOlK1Knd1vtQ6FTNgbhx8p+Mvy+kTUZD2Py/0WwDbLUZqtDfVGxCosTV6frHfAOyHCjf+tHNNG2fxmWI3kLE3Sf3hnlnATO5hQWnButsvJS+wffC6ksGasH47prbUkJATzjoiYm9Bx57uPFo/zlJxFpwH7jGW57QMkkh+AVtlcutieKQBGokJX/X2gLFygtZqb2/IGi2NZndaTFP1AlFetX+GVSDAJ2Pt7RJPSsAyoHip2NxwOZluJ5j72IIrBClWf+PAeDUtBEqlJJTcyO0WSuw3eT8lBL5bjwOu15lVckhCsBa3FV+V+JX99l28KzDRkOi1y5vYgQv+0KJR6Zt5hThyqDCo5iiNA79brLFvDCZ1V53yllD++iX3pfKeHOoSGSZY+e4MhHRAndc2+5vc+6LANDGsHnRR7DgbvMXtg2jx2WimdXTS41dyNpPR6xKVdi/W3oD11ijkALJN4wwsLQwv7bBo+NFDdWQsXEeamzTw2c7YzOOMYJ3E8x72IHGHPON6gTmp8ON97BhEiTHAmwhOIArq1z3hICpHU1ldlsOkFdeCXyQBxXAyDejBFU/qrISVPve+WKpIksBLAP6MRt+2Jc4GBQRMWRBottFH83A2YNPUV0izHMwzzDUJKoTY/tTg2z88lv0mf63OTVTklgSn9lSdZR3Q9mxb1IzIZuXcrj/A==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82310400011)(40470700004)(46966006)(36840700001)(1076003)(2616005)(41300700001)(8936002)(8676002)(4326008)(336012)(426003)(83380400001)(82740400003)(40460700003)(26005)(86362001)(478600001)(110136005)(70586007)(70206006)(316002)(54906003)(6666004)(36756003)(7696005)(36860700001)(356005)(2906002)(40480700001)(5660300002)(7416002)(81166007)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 11:07:43.1733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 113081ba-3f16-45fb-3437-08dbf64b91de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569
Message-ID-Hash: VLHJUIQKZKY72QMNXDMBRQBSH2E3EYRR
X-Message-ID-Hash: VLHJUIQKZKY72QMNXDMBRQBSH2E3EYRR
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLHJUIQKZKY72QMNXDMBRQBSH2E3EYRR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some platforms doesn't have reference mclk pin to codec,
so set bclk as a clk source for rt5682s codec pll in tdm mode.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index b72beb8e9b13..74e83c2dae53 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -464,6 +464,22 @@ static int acp_card_rt5682s_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	if (drvdata->tdm_mode) {
+		ret = snd_soc_dai_set_pll(codec_dai, RT5682S_PLL1, RT5682S_PLL_S_BCLK1,
+					  6144000, 49152000);
+		if (ret < 0) {
+			dev_err(rtd->dev, "Failed to set codec PLL: %d\n", ret);
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT5682S_SCLK_S_PLL1,
+					     49152000, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(rtd->dev, "Failed to set codec SYSCLK: %d\n", ret);
+			return ret;
+		}
+	}
+
 	/* Set tdm/i2s1 master bclk ratio */
 	ret = snd_soc_dai_set_bclk_ratio(codec_dai, ch * format);
 	if (ret < 0) {
-- 
2.25.1

