Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A62806D7F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 12:10:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63308850;
	Wed,  6 Dec 2023 12:10:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63308850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701861053;
	bh=IHS8Ccjt93VLX9Ztvp0IVUhVMdSEjdQwT70fimfFofc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NjK4AlaGH4bWPuYsOxdsN4hDlW8lLG28l8MMYtzwT/bmAnc6c54tq072FN6tiwg+Y
	 KgrotJ6wYvTgCunmc6t2Wgy0Az5DizD+MS7DAKZljh163dWHUjAxo4+wMWewjczSFM
	 Icx/t3z4M2GBwqZ+kMq1o2msy2nMvWHngETYe3cM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C038F80580; Wed,  6 Dec 2023 12:10:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87740F80571;
	Wed,  6 Dec 2023 12:10:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F76BF80166; Wed,  6 Dec 2023 12:10:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15574F8059F
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 12:07:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15574F8059F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ytjFoWkc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdVsrSBpYOLoJtPm7PVtejH3QDI4F55Iej1etbEen/JwU6UvWBH2Z3qMG+rg+la1OQgHcj1yR99S08rZ+uv00aeb2yCOoDf5zDOW2/6L6wukXdRHpjXJGQzMfNfniXysefu5AcOv9JYst8kueGd5PJvbD2HQlLuu99G05EVq7Q4wdx9L8G8DJG7k7d0wNUhX27J5myXlDUunOVgyz+9amJAM8/qmG6vyQ9ZCMeijhiao6w4gqS1Ikv+1q1Hodtr4C8Rn2A4/yBuVLNnf9BqwBiHtsK1D8M3ELyOhgLFWNRCwhYeIS+p59JpI82+vjW0f07VfvVmnvNwk6JdgXyM0jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMw7UXYPOH9Pu34WBiATYbROV60mTBr8EBSemRn5xIw=;
 b=cbThn9HGjL7KG2tKjpXfoLZuuEZAFHLoO7inQUo89V8IpanRAeQeiX05nWJY0KTlMh2oXsMVWAV44+4SuDefXfi1gRKOxebcgw6S9WGTT1kYgknVm1H54yG4HiHfYvhCeI6fz1ZpWtyda29laTo98hoOYuUQjElU3IGa2BEoZ47CO9cKgUmr5dYh1Jv1abet2MLzc3X/ZYAdBRLUmfcaAgfXm++0GwXjkFo5LLO4WmEfl+aymFGzV7/iQ61tM8DhhOoUgIAVcy9iJt2q+dC0WlxMAfEnySJQjEjuxSICbx122z8JmLCcvhXJP3ycHxSPSrQYUlwJDO3NRwQPBTDB+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMw7UXYPOH9Pu34WBiATYbROV60mTBr8EBSemRn5xIw=;
 b=ytjFoWkc9gUU1bXqZP+NkYRsvdT7a5OIZBxGNfx6qkdYcM8chc3bAnX4TMM6X7CqY8rRM2ljL7ZLeQKABa07uiBpls7SnM+MCGEUIkbxaijYaDkmxcYr3Fcrm9VweNE8nTK3lG2FIj9PnNpwAQqfCBrVDSh3LQucusARZXC1sho=
Received: from MW4PR04CA0067.namprd04.prod.outlook.com (2603:10b6:303:6b::12)
 by DM4PR12MB5312.namprd12.prod.outlook.com (2603:10b6:5:39d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 11:07:35 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:303:6b:cafe::ed) by MW4PR04CA0067.outlook.office365.com
 (2603:10b6:303:6b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 11:07:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.2 via Frontend Transport; Wed, 6 Dec 2023 11:07:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 6 Dec
 2023 05:07:32 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 6 Dec
 2023 05:07:31 -0600
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 6 Dec 2023 05:07:22 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Alper Nebi Yasak <alpernebiyasak@gmail.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Marian Postevca <posteuca@mutex.one>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 6/7] ASoC: amd: acp: Enable dpcm_capture for MAX98388 codec
Date: Wed, 6 Dec 2023 16:36:17 +0530
Message-ID: <20231206110620.1695591-6-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206110620.1695591-1-venkataprasad.potturu@amd.com>
References: <20231206110620.1695591-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|DM4PR12MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: de65d562-434b-4ace-19b9-08dbf64b8d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vyE1O2QFvgdyMA2QFA2U3cRIBltU6Y2/1NSTPW4rEttdY/nWRgFc43lOXlMS4wpkQF+3a9pJi4uIS3njRxvskvAkwBh900377AWT/e4SKqiiigohj4OFF9jdqL6teYDtvtrMuwaNRuNBI8L0NqvAW5s0NXIeD49TORZHqBwpZVTA7yW+Wnp9mUcMtcT3DAx4zNDofN9CtNplBktlVW2OvzEQGJiSJiSpZq0Uak2m17CB/hxvea1QkNJMpeco7qFnMiyUA3jrFMkE/8ZLOxABxh6NX2JLP5CETIyAIJ53qGVKPdbRw5MZTaqOp2q1WTO+HGQr1Utsd3YCMnLtzVuqRIxotBoiR/PdTUjB0uvINfbYwaP11wr7noKyBlX36LQZKJGi1nhbS0NwpjuDNAFZS/EYfpVg82ZwbKWOhYFyzI4rWxpAGQk6JIum3AU3I7L4cow2YM1C0Lnq8jI/fF9OT1Zw6vv8MyVeLY4d/LAoP6eJ8Ug900g8URT0kbKKT9HJLmjNNCmmQYahQ65UjiSaA+bVHVUTsS6heFA4pZlEfKS+s9H/vqEgrml31MLWzdB1RW7DoqvWSj04yQjxk0y83qoHvmZe3ax5nrvB8LnTbQV+zc3q9wry04OXfXiaP8V/nxfpCgNnApHtRtYYWi87KdT0+Scg8y/KNO9w29NZBh/hYLPhRQWeZwt1OOr1OqeXBtceOIurSULuSRGtkmt6pWFXS3xkvRWys3NYHiB6yH72PlUDchLKWxFfhKGQAQAbNgHdcOkVvRYbWSzrwd6ajw==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(1800799012)(186009)(82310400011)(451199024)(64100799003)(36840700001)(46966006)(40470700004)(36860700001)(7696005)(40480700001)(6666004)(478600001)(110136005)(54906003)(81166007)(70586007)(70206006)(356005)(316002)(26005)(2616005)(1076003)(47076005)(4326008)(8676002)(8936002)(426003)(336012)(82740400003)(5660300002)(7416002)(2906002)(40460700003)(41300700001)(86362001)(4744005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 11:07:35.5483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 de65d562-434b-4ace-19b9-08dbf64b8d55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5312
Message-ID-Hash: WNFWO6IHM652WTACPSD7TY275LPKQLTW
X-Message-ID-Hash: WNFWO6IHM652WTACPSD7TY275LPKQLTW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WNFWO6IHM652WTACPSD7TY275LPKQLTW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enable dpcm_capture for amplifier codec MAX98388
for reference stream capture in smart amplifier case.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 4631af028f15..b72beb8e9b13 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1483,6 +1483,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 			links[i].init = acp_card_maxim_init;
 		}
 		if (drv_data->amp_codec_id == MAX98388) {
+			links[i].dpcm_capture = 1;
 			links[i].codecs = max98388;
 			links[i].num_codecs = ARRAY_SIZE(max98388);
 			links[i].ops = &acp_max98388_ops;
-- 
2.25.1

