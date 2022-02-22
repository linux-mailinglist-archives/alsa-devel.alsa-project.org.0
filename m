Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3909B4BF1F5
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 07:15:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCA1D1718;
	Tue, 22 Feb 2022 07:14:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCA1D1718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645510513;
	bh=SPH6cwuyPpFk50zdfv5pu3SPtsn+LgQl/1YrjkJN3h8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F01vNSm7oK9cfapeQgK6EfhsTc3X+etZ6hwOQvUnAs99SdvtdpI9G958yNnB9q0fG
	 eD5o6vPK6wR6XGKHsjDiZMg51BuvAGNWuHKNdnymAGCkYtw7nlBtIVqStjGBN090d+
	 xTMb1B6aHAKJEXkYnuS6LQUQH++7L5Gb/slEGPCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB0C6F8051D;
	Tue, 22 Feb 2022 07:13:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FB1CF8051C; Tue, 22 Feb 2022 07:13:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::614])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96765F8051A
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 07:13:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96765F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="nHhTsWEy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmE9uJDz6+aaqdBSgQ43mBQgMqWdTflhrLekf+HE1Us38acSF1ZCuH3ckyxAUkQ66hiuylBx/mqJxje1OwNvZO975xg06MRNYK4wgr97CYKfC6Zehp9crHCgfdhYvdGX9Bu4qD8VFdExr3h0ZS3TxsccAaXUQPn0w/30lnTNOiAnbSZyiLNW6GIdpL4vp7w3kTC02fZsuV/TB2r7CIwPuLZJ1Ygi7ujq+PgMynujnMm9tUjNRBYPZuBENbwuY78m8tZ7R4RYCfGeBS8+FFODN8G5+QB67PkvAjFQFqkwSM2bF+bG/a6bf4rIuQKhMQd9bceigryyulqQxzqmfzLSgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiNSGGyM0C1UPk4vM3/QgttQek1MahQKX1tvma+NlQw=;
 b=JdHnI/eOZEHGSofM8FR5yLvVOG3CMU1loEM2eqsy2nPnyB6iAnRerJctB6FOsrFEmK0GvjxTBdv1VIIffWwDYMKkTSrVgGVZ+8ZzWz37AtgNmHCa1Y7e1UHsuH/Ie5bicE5oTULxVRSNYFN2ruJL+09fcjhSau6TirygKLkDXr5f/6iHk3N4Z2S0QfcLBVzAMy9SfcNY8kRybgj9Y8UsVaQrgE/TK0oQex54Iiv4GkIrCr3TaopA7OzLbA8rCo8GxCDwYxVxjdYWobGrBmH8tHWnxGlaO3s+O+ltBdgAZIrkGuVrp28/q3IxgLJspJHRJWwrkvNtlXjrAQ1tC0xvBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiNSGGyM0C1UPk4vM3/QgttQek1MahQKX1tvma+NlQw=;
 b=nHhTsWEy2VoK3TZ9mpWXPoSWVNXE8wZb7+VDtSiFR0m+8agwZwr8KkaEkaTUXrEuoK7bb3/6uSmoijQRj+MUOgbyTa/3nyKZM1LkQsXJpFJL7Gi/V8CwlHMA/7D496ZP4eHaKgBCrIJtBUTozZKrwLdeSKcy0Qdss84O7/qEEso=
Received: from BN9PR03CA0650.namprd03.prod.outlook.com (2603:10b6:408:13b::25)
 by DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Tue, 22 Feb
 2022 06:13:27 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::6f) by BN9PR03CA0650.outlook.office365.com
 (2603:10b6:408:13b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15 via Frontend
 Transport; Tue, 22 Feb 2022 06:13:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Tue, 22 Feb 2022 06:13:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 00:13:25 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 00:13:25 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Tue, 22 Feb 2022 00:13:21 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 3/3] ASoC: amd: acp: Add DMIC machine driver ops
Date: Tue, 22 Feb 2022 11:41:28 +0530
Message-ID: <20220222061128.719400-4-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222061128.719400-1-AjitKumar.Pandey@amd.com>
References: <20220222061128.719400-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b204e90-c471-4870-db99-08d9f5ca707d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4435:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4435F71CAA15E5569388FA16823B9@DM6PR12MB4435.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eb/Ca0+NG3s73VuwzkKgr6SJ0dIbS2BjwQcn5ofA6nDM4rSQrtqpOvegji5WznEcHYK6EnzxUZYkeDKC0dq0VsApxURyywWbnv2ZMQ0+YU9nvCoXWeqps72S8EKMGeHnjgO1GVj3wbWjPf102byZPrdpYX4TT8XVpGVapZNjxb0tb3oGj9+CfYjfpRtIJ4x+q0JvkZPOeAmoYIVo1z4LC097oRGXytHPkfxbtdsHE1F9JqBBJOFRrTYvDtRUn7Skt1hnpOVklIzgb/x3/mAH/xt4X8la2MiLmgsqnm46ukDomSjE+bdvRQcDTdk5qBLQnN2XD0PL4FrBOMoUIqJEVee7uzfglDk8wdEwWpX3sU6M1bMVoxRejj4ObgvaJ9A9Uf9uFSSnD30xnrYyX7j6Li0VWeLu3tA1uQQzfDe6CtoNeaDqa07FxmbMZZ1y6oN/c7RvRKWrrh50nTN0RlTpNsDUknOzhJqlI49MYqvs9FluL92GICbg72/lrgylnjl1bqLLYuvvtcubGjsjGRD/iNFTbU8o4fo6OOrjUGJxP/mK4GDO6iEVEjxaRtPc2Q/a5EPUwdq6BpFyHd19wWL5XDUvWV9zSA890aqW+VF1Bc/ccpf7O9H5szr1GKF40lArz73DINUIN1o4uv0Kl5qW0Q+DJyXxtfz7dKyOFol/VPZGcaejVCI3duCYFqjPpWdR9TcMyMWuttHIuOmb3XHt5w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(8676002)(4326008)(70586007)(110136005)(70206006)(54906003)(316002)(508600001)(426003)(82310400004)(1076003)(8936002)(5660300002)(336012)(2616005)(2906002)(81166007)(356005)(36756003)(40460700003)(7696005)(186003)(26005)(86362001)(36860700001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 06:13:26.8193 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b204e90-c471-4870-db99-08d9f5ca707d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
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

Add dmic ops and startup callback to add snd_pcm_hw_constraint for
pdm related device node.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index b45442a56c40..d3034ee2ff59 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -291,6 +291,32 @@ static const struct snd_soc_ops acp_card_rt5682s_ops = {
 	.shutdown = acp_card_shutdown,
 };
 
+static const unsigned int dmic_channels[] = {
+	DUAL_CHANNEL, FOUR_CHANNEL,
+};
+
+static const struct snd_pcm_hw_constraint_list dmic_constraints_channels = {
+	.count = ARRAY_SIZE(dmic_channels),
+	.list = dmic_channels,
+	.mask = 0,
+};
+
+static int acp_card_dmic_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &dmic_constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+
+	return 0;
+}
+
+static const struct snd_soc_ops acp_card_dmic_ops = {
+	.startup = acp_card_dmic_startup,
+};
+
 /* Declare RT1019 codec components */
 SND_SOC_DAILINK_DEF(rt1019,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC1019:00", "rt1019-aif"),
@@ -633,6 +659,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(pdm_dmic);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
+		links[i].ops = &acp_card_dmic_ops;
 		links[i].dpcm_capture = 1;
 	}
 
-- 
2.25.1

