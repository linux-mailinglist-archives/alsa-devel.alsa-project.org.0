Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D320F7D1DBD
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 16:58:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 675C693A;
	Sat, 21 Oct 2023 16:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 675C693A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697900299;
	bh=0F0X0CieGc2G+pnoxPoRwozEtPLL6xUg2s2Dd56em84=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YPwaU1dfLmwQb+MQkJ6aZtdjIpcMm1wgOMfn8JVUpzHI4W0NcA8/47B7vgujqJ8rz
	 z1JdfJApwrbpnTVR9i7EEbXTz5KKbf7r+bkjNSHX7n8jEPWp49DjKgse+YN3IRFq4z
	 cCiU9C13myLDhyxxl+EOQ8FqaseBwR4MZYl9QJcg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89000F805F9; Sat, 21 Oct 2023 16:54:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 381E9F80166;
	Sat, 21 Oct 2023 16:54:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACB63F8025F; Sat, 21 Oct 2023 16:53:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEF6AF80166
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 16:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEF6AF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fOKpg3nO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wc2/uxu5nwgoKbQRpaRp+z7I3GsCRinjRpfHf8AjD5W/QGYUlRRPX5bgrtEYEfp8QSlab/PLp1UC6VykraxZ9d3TLVvM3WXcRYUWbMksggKYuXmpPg3LRumU0125eG40ARacS7dY+czi++8BwRHN6bdE8N3kmD69dj9VbQt3IxtZt5vJRCjOEEmF5wwBB+IH/AdZalN68oY0+LpdPU7UdkJinyKQekd45k6+9rgkp4Qbn+u1e18JUfYW6MOusujcWiZCF3VxD0ARVSHIrCDLNvHFdZ2CwMzJpNNH00I58ybty4mvB1tdQYc8qzkbgBfDn5VOS38jDsAgR3/EqGNYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exNq9uwFBp+7ErFmKdC05GmdLKLXetHVniuI0Li0pXA=;
 b=TF9i5Hr3uT4x3uFcA3zy1Ybv2TkhdHDHJSzx3tgxUUL0BTZk4bAoKO4CaqH/ZSax+X15XOCTMbRj8/+u1If7oMue3ltk5CgXCKKjxWOTxNbMgpLeZ/GRqKA/Q11X3m9QywehtvDlP9UgjqyEf6M5UEiQHNn0b2S2UkWmu3Cauf8OD7beI78IVjLawzjtDNw2kjXv9SvHkDkJI2iwNB2j1oQ0YpWgTfV+6oYKeMmC1ZyuE7mmUc2tUyvVS57RDKlWg0LY2GsPfS1BSREcUSiZpZxch5CcMz6yJxd5Jd/PDTynKSWMAPIgETVrdOMcl3nXwZB62+RLEG9OGXpiOoTzNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exNq9uwFBp+7ErFmKdC05GmdLKLXetHVniuI0Li0pXA=;
 b=fOKpg3nOHSGUDz0Qv85AIKteXIInKtLpgnGLY96Y3rqoP5gSwetO1YqP+a3/bdynNwNBEU8FUA5q9M9nJABd+DjrAQ0wS0of63KM4K6UGol+qFbKqZO0qwUPQU9urJ/dHzycoU2MGaj3pVMSlUrxa9IQVuziLYBtwduR44iXiE8=
Received: from DS7PR07CA0008.namprd07.prod.outlook.com (2603:10b6:5:3af::21)
 by IA0PR12MB8716.namprd12.prod.outlook.com (2603:10b6:208:485::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Sat, 21 Oct
 2023 14:53:24 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:5:3af:cafe::cf) by DS7PR07CA0008.outlook.office365.com
 (2603:10b6:5:3af::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Sat, 21 Oct 2023 14:53:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Sat, 21 Oct 2023 14:53:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 21 Oct
 2023 09:53:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 21 Oct
 2023 09:53:23 -0500
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sat, 21 Oct 2023 09:53:18 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <mario.limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <arungopal.kondaveeti@amd.com>,
	<mastan.katragadda@amd.com>, <juan.martinez@amd.com>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alper Nebi Yasak
	<alpernebiyasak@gmail.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Marian Postevca <posteuca@mutex.one>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 13/13] ASoC: amd: acp: add machine driver support for acp7.0
Date: Sat, 21 Oct 2023 20:20:54 +0530
Message-ID: <20231021145110.478744-13-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
References: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|IA0PR12MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: 3292a2c1-ad7a-4acd-fa31-08dbd24579e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HSRyx6/1uP+R/ht+u8RF+XTHpCR51EYbgkGlsYGIF8A6WgkE2eEk3ZRyRcKUltgOPTXh+aKDUgr/61joX0xWfnQBOaLf7yJKtlKAJ1dg6TtOW9a28LipSHKKyRNUlGGPIsKku7GTWUGGPrtvmL9ls9OQO3XqCK7AKrXPG6zS6kinrL6FbmN7QSAk10Lhrr6dqW8cW759jcZt3HxPR2tFcBl2XxwuX/R2LJXlpY/D8dGvuKZ1peeDuntVt1hiiOd8LKgvxTaHqWi5uKxco3t/7ryPfrAaknDczDewUZhsnoCMOR5YnTCtgaAIHHg5xzeqjf8KtzsHjhnKidv7HQOvSPqDvKBLTLrTSvpNStQrUE5dJATky+qS2HB4xxXTPjKPQHD6Rpg6zROtqAojIG+idW0UjG2RtG7/p3T3CIjl3b8PO0Xnc0y89bPYcHb0218SiUEQihV0+X2EoBSEoyaLf3LnsoGkDZfBOicK6lljtNmRsJHFCik8shrAaGFX7JDFZRLI1ehz5PQbwjOuNYxIpHEBbHIMhaYEf2NIouBLbKWRHyYokicDeopYZ8dO7+hKahEDCMnvQ4D1fgiDyoLOciitbWNcW7hX2k9Iu9LKI5QH9hJSGbPz7Z4rbgyX8UZhu5zkmqE41O6VnXioviTiXbfEk8Y1w6lOhjFvvoDj5iYOi8znkifv+C2Ba8ckEvqoBWWSDd2KG0SDwnEn9MpHBwyH8gagaFZP04E+ZjoyooVpBrbUCFcj9vrVofirhQ4dkA28935mjONxsaF3OSDOwQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39850400004)(230922051799003)(82310400011)(186009)(64100799003)(1800799009)(451199024)(36840700001)(40470700004)(46966006)(40460700003)(426003)(36860700001)(356005)(5660300002)(47076005)(2906002)(2616005)(26005)(1076003)(6666004)(81166007)(7696005)(478600001)(336012)(40480700001)(110136005)(86362001)(36756003)(70206006)(8676002)(54906003)(8936002)(82740400003)(41300700001)(316002)(70586007)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2023 14:53:24.1629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3292a2c1-ad7a-4acd-fa31-08dbd24579e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8716
Message-ID-Hash: 3VJ4NMRNOXJVB4OY4SCCSLGD44IANVNL
X-Message-ID-Hash: 3VJ4NMRNOXJVB4OY4SCCSLGD44IANVNL
X-MailFrom: Syed.SabaKareem@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3VJ4NMRNOXJVB4OY4SCCSLGD44IANVNL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

add machine driver support for ACP7.0 on legacy stack.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 88e91af47532..34b14f2611ba 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1266,6 +1266,12 @@ static struct snd_soc_dai_link_component platform_acp63_component[] = {
 	}
 };
 
+static struct snd_soc_dai_link_component platform_acp70_component[] = {
+	{
+		.name = "acp_asoc_acp70.0",
+	}
+};
+
 static struct snd_soc_dai_link_component sof_component[] = {
 	{
 		 .name = "0000:04:00.5",
@@ -1692,6 +1698,9 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		} else if (drv_data->platform == ACP63) {
 			links[i].platforms = platform_acp63_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_acp63_component);
+		} else if (drv_data->platform == ACP70) {
+			links[i].platforms = platform_acp70_component;
+			links[i].num_platforms = ARRAY_SIZE(platform_acp70_component);
 		} else {
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
-- 
2.25.1

