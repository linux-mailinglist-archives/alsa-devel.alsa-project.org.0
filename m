Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FD890A73F
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 09:33:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 665E014F;
	Mon, 17 Jun 2024 09:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 665E014F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718609624;
	bh=4rA4MoY1oD/sjElxw+DPC+1Xw5Eh/R1KWGwYB6X+YKc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FQBo7fRQokYmDguDWvcWHQrcP47y5Zvx0DUh1OTfzvY7koyTPMRgeWOeLdYN1ooE0
	 TmhXV5XwppGA4EiuUksoSpmfOoG7J1Cd7sf4Z7ZRedSEo/+DtzbUleCDp7gqlg7MCe
	 +W4A/yBg0fh7+crJ2MF/sgNqoC4KItaJptTDAq6g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BBF0F805B3; Mon, 17 Jun 2024 09:33:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDD44F805AE;
	Mon, 17 Jun 2024 09:33:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6222EF80266; Mon, 17 Jun 2024 09:29:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D945BF801EB
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 09:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D945BF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=EhUrnHGz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlOtMcjEv50EZieYsqUTdigG1iQUohLUC5i8lyWqTHs5VcjpFxCgc9hXEYRa9Fj1yUrUaHCQYdFkklFBD4ExY+Tq6zWV86pcf3M6OwkbiXW2IGnzkoEv9yLTQXITAwSEDoIuyfc21uXXQvR6huIgXcFVUD2B0K0QUKf15axNSI/0/haJQwGqbUeyfX9AF/NjLsgApLlBnvFhPICv1OYkVjf4Rt2dqRwpMNnOy3zDRwDVaEJaUhaaH4Pu/wM746JSWbwbIjJu7/pR70O3ia33ZD/1ukU/LRBCJcIoxbb1ZgCrmSVw4HaetPeErRJmRohVEwE/WmFaHmm6p+lTU0viWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Dyv1NDMNED30ORLfcqKTahNsT7sXpi25pcbmL3aF6A=;
 b=ZAPr2Bmm213uLig9uk6mjInfxLzRG+SbENfArVblt6K5uMRCYhX6zlJSgBXRxqWW1J2Ev+nUd7eS0GnCjropVNLgjOSi7HfugIcsUT7ojr5LX3E+YP0rVUrt225LrkFp12TWyUjFxlJ53ISVZ/p6tEhVJb1opSoFtP37Kcx+McnbwqguHxCCXU/NSUgdV0/j1z3oRuJTkxc9aPnB6yLnMJJq1WBV89VaBsyS/v6TeNj1Rntz7/GXJ1RWeRpY/SApzhgOu0iA0rriaANbjsKBvVMzbyoyH8OLX4p+yxO+m9stQDsntUh+n8bAC7pqzYL6/krx1+G5yLFf7KWx5DrC1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Dyv1NDMNED30ORLfcqKTahNsT7sXpi25pcbmL3aF6A=;
 b=EhUrnHGzc31i7Ghar2oBsvefF3iZrcqityXN0oh3TMSWgu8/ejFnK9qjPM9Z6hxBk+54BCOcczQVZb5q/gC4zYQdWjKj/wEAzCWFk9ADiTPvGC/PUr9ryjayTr7iEP3lCjWVjGyUyuHof/UO2QL0DX0T1Am1fhBgDMeJERGXnqk=
Received: from BYAPR06CA0064.namprd06.prod.outlook.com (2603:10b6:a03:14b::41)
 by IA1PR12MB8263.namprd12.prod.outlook.com (2603:10b6:208:3f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 07:29:09 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::ce) by BYAPR06CA0064.outlook.office365.com
 (2603:10b6:a03:14b::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.28 via Frontend
 Transport; Mon, 17 Jun 2024 07:29:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 07:29:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 02:29:08 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 17 Jun 2024 02:29:04 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <venkataprasad.potturu@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 4/8] ASoC: amd: acp: remove acp_i2s_probe function
Date: Mon, 17 Jun 2024 12:58:37 +0530
Message-ID: <20240617072844.871468-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617072844.871468-1-Vijendar.Mukunda@amd.com>
References: <20240617072844.871468-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|IA1PR12MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6bc5e6-113a-4d72-bb3a-08dc8e9f2d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|36860700010|376011|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lOUt+RM091FCQ0Re8ADtkX2ldVh/9HlIJwHq4xmJxMRfm4cfwokEtmbaG07s?=
 =?us-ascii?Q?N8P2tiz4sTr0V83O26UFERlNhHUevZbb3+ATZz2XDZkc0OwjDiNo/5nxzguR?=
 =?us-ascii?Q?uRFIfq6ZJfgjIjgck0KI7QSTvquMQC5Vs6y3gZhW4OwLnGn7Zm5Is43pi58y?=
 =?us-ascii?Q?rYcS6R8OZZuUd+IdIy0Dxv53uGySd9nD1yaTilYakBiPA91uYCoIoqnH1WQU?=
 =?us-ascii?Q?hirqY3Q9AvWdnQA5fXAn4VcyWixBj8Xb4DNNyqd/DADXJn022/c4eVmNKHSq?=
 =?us-ascii?Q?Jc1g/M/VAbNTliMzI7ubFjs1oFwL+AvPBzhOJAA4iC0sbMRLAyX1Dn54xlbj?=
 =?us-ascii?Q?g/SEd+V8YjDy7yLLr9oIVHMJRlLwn0lMjruRRsnZkeV/SEQIAgSf0TZleBOZ?=
 =?us-ascii?Q?PF7xyDsJUrR6h5WtuwKV4Lci/4Bcy/CF8ZX0cMN0/7odnO3GvDoq0wrGKFr2?=
 =?us-ascii?Q?ZAV14xx6wfHnB19/wD/KNzwbt37yExiS8gYKd7lE7s0vGL2++3CHd4z+K9PE?=
 =?us-ascii?Q?RxtTmNjj+lJY+pTJW4W/dAmZwFR79lTOaoOCNa53+tv6jccKwrglBIJQ8zHw?=
 =?us-ascii?Q?ofnF2lGrdPzvJFI1gir0Ft+2ZYoBPnMv/+fuONUOR0j8xGpLtedfrtp6hddX?=
 =?us-ascii?Q?Bqwam4wxkXHv5iIaA9CAAwYLmZa++Mm33CnBMhDtrv/Q8UyzLxxZXf1T+Ckj?=
 =?us-ascii?Q?wdssYwTPiOTWJpullKCwKRuxjfaNAp+K1Menog6mDeSekdK9clEnq3gtugpU?=
 =?us-ascii?Q?mz7+oDIQSPJLYbvzBA05fbPlfrPBYSP5FjvfGv14VMJEkXfNvwA/qeSfoEgW?=
 =?us-ascii?Q?5LiIQGC4L3vb2IH08PEtxu4y3ONvtNuKMi+xURCi8udxThCTq1C29plkKKoK?=
 =?us-ascii?Q?qCoqqaJbnjXY8L/fllHiRoMpT1E/YSE+RbXXg2pzoxZAeq7tp8jzlKMDgN2Y?=
 =?us-ascii?Q?JTMPVFHH+ftcTJ7B9otfqLYrle92VEWfUc8OlQmKFM5E31CuI0fvvO+46Z0M?=
 =?us-ascii?Q?cCltCSJY2QsvVtsRiGGMDaOq9K1ReAFFTX3Nd04WSuljytd0FiZwIrpD0sh7?=
 =?us-ascii?Q?aLE0HzFMjzI88Uceso5+LCchowRqrshdOdKoXHdDy4FnstCxgqr3/4HdFzk5?=
 =?us-ascii?Q?vIbk8AdVWGsgA7I3eRJWunksE+cdrjwxRRQ004CQo44lCZcXU9qrd3WK/MKQ?=
 =?us-ascii?Q?Fh3d6pADaxYJ4ufTTHETNn1f9uN+KfQ9F9FV2nl2UFPOByRJenA9yJ+F7LCn?=
 =?us-ascii?Q?SIUS7dD2xGmAB4frc+Las+OjNoD/3ztTg+6xmY/wW5nRY/tBJAEGXxOgQglr?=
 =?us-ascii?Q?quoaYkZ4ZPVb6GdtmVYhEQEU33FGiBSU6SffT1tFn2Vlm8TGuHNZziVODSmC?=
 =?us-ascii?Q?Kg3NPCCXGnFTHtVm4+NBodU6FNpMSy14S5weje1gjV0mbXl6nA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(36860700010)(376011)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 07:29:09.0750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2e6bc5e6-113a-4d72-bb3a-08dc8e9f2d62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8263
Message-ID-Hash: T6K2TXLENGJLDMJXPJW7OYYVJFRDFBTP
X-Message-ID-Hash: T6K2TXLENGJLDMJXPJW7OYYVJFRDFBTP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T6K2TXLENGJLDMJXPJW7OYYVJFRDFBTP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In acp_i2s_probe(), acp_base null check is verified.
As already acp_base null check will be verified in acp platform
driver probe sequence, additional NULL check in acp_i2s_probe() is not
needed. Remove acp_i2s_probe() function.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index ef12f97ddc69..7da414bc3b96 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -584,21 +584,7 @@ static int acp_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	return 0;
 }
 
-static int acp_i2s_probe(struct snd_soc_dai *dai)
-{
-	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
-
-	if (!adata->acp_base) {
-		dev_err(dev, "I2S base is NULL\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
-	.probe		= acp_i2s_probe,
 	.startup	= acp_i2s_startup,
 	.hw_params	= acp_i2s_hwparams,
 	.prepare	= acp_i2s_prepare,
-- 
2.34.1

