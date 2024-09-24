Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D3598404F
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 10:20:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7352DE5;
	Tue, 24 Sep 2024 10:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7352DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727166049;
	bh=rY4ngI+GB6mgNB4IkVT/PhXHud9PWrFarjdHcYT9g+s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CC+6F9M8tqmqUH8KeoljoA4i7KkbhCTw6OZgLQMxdoAKZuhp+/wdjfbdLBY59Zr5z
	 Kbz3HMqGdRcf/E4SCHhIlN65PbdRACmVvZgEVthCCrxDq5hGLEKYR6F34X6K3gUQbe
	 ZBFQafakYCfzZIGBPpqc+tqJeRkLz8W2jxjQ8vZA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30DBCF80634; Tue, 24 Sep 2024 10:19:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23814F80617;
	Tue, 24 Sep 2024 10:19:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0307F805C0; Tue, 24 Sep 2024 10:19:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 271ACF805B6
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 10:19:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 271ACF805B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pUZskNLq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+qoYIar4qQPXgFDOBxpmQg/gSKL1crbiqrUh7N2pJwllgjV4CAXAYzQdbOzx9V1W5C+1k9ztXmL2+c4OWwbXb+t4FErK3sbxdDTOYAdJY0HBr5RZjB9MuV382CGZGj3hmGwT/+fLSaqXu0+4zw3OJ06T7NReFcKs30whRwb1NuSkpHIDbqnLEX2hgNsrAoBjlaa4qp0KDJPhMTfGNsSSDzT5qxvouTlWt/aEZfXYSqVRMQFT86PxFxIHu92fICUYkzfodXhCvA774C8BaEuf1iNziMvKi+YNcvq5d0Uy/5hnESwJ6AtIez3Erd/nSjyylxJIpX39uAOgn+Hp1RxqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVL7VGhErvgxR0UACqZHPVop1/A7+hCczZH5GBBrAak=;
 b=Ydm64BVC70lEHBcdnuDLIhrEjYgFAe5zxhJ9lVqOhujfuIDb7qe2t0BiEYWqLPrwP8FtbLnQj6iENrdJa+cBvB05l7o2N2dahpOREm+ULU+gCN2tM0vFtRKWAutqLvJqkUp7HJxg2mUTUSqy3kv7n7Mqg03u071iN7VVqaQ/xo7cK1fjZGGvQhOxfy+aiUvRwpcxjrevFcYEHm+arU56FU1ZASjDllWIAHIrrfnaA6MD7fkfuaZ9AtMasDWYph8aXYF6bIdVvVKdneAcUxPSXl5byCe+IDuorhOcEBE/zB+REFhpb0QqxFI4LZgRbJWHrC1pKNg2ZnEMhijB5+WB7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVL7VGhErvgxR0UACqZHPVop1/A7+hCczZH5GBBrAak=;
 b=pUZskNLqg1RlB0sddggUkDBAZxIt4c2C7lRLIuYCBwrJjgnybB0kflR/mR7z/fQODtXfPHFtqrG1T45ozooxIWnYMoGqQdJrQEcp/88TeWldUYgt6FEA0cqBleQ+M6ykZku8KRWrCo0yHgjx3gEnimMc5anwq3kH1gIkPsIdGDk=
Received: from QR2P297CA0013.MEXP297.PROD.OUTLOOK.COM (2603:10b6:3d0:6a::10)
 by IA0PR12MB9047.namprd12.prod.outlook.com (2603:10b6:208:402::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 08:19:19 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:3d0:6a:cafe::3c) by QR2P297CA0013.outlook.office365.com
 (2603:10b6:3d0:6a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27 via Frontend
 Transport; Tue, 24 Sep 2024 08:19:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 24 Sep 2024 08:19:18 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 03:19:13 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 3/4] ASoC: SOF: amd: pass acp_rev as soundwire resource data
Date: Tue, 24 Sep 2024 13:48:45 +0530
Message-ID: <20240924081846.1834612-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924081846.1834612-1-Vijendar.Mukunda@amd.com>
References: <20240924081846.1834612-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|IA0PR12MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: e9dc7e8e-ea0e-4e47-a4cf-08dcdc71960f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+rNqI6c9lVDKz6ZZ3RDcfrhdYOCTo0cqD+XYDtkdbcGLlKbZVZQcMA6C3Zzc?=
 =?us-ascii?Q?jB9Vel7UBMimnvoJ4kJPQtcZXZeuz2weLbQoGbm69PlffY92W4KVcYjJxI39?=
 =?us-ascii?Q?7RdBf3G2fuBr3IlrMkN5eHGL7WtNH3yZTMh9r720OfHvel+0meVZ9OSrwLfm?=
 =?us-ascii?Q?ksWznSjzjJVEcpk13zQtaSaG4N7zg6+Sh7YARvl+yu+FiHBZfaerAii4FOK1?=
 =?us-ascii?Q?N8dCxr+x4pOXI9bWRCQXVVpz7/k/k2iYzMvR26QTjU9nxY+x5FebTuuUOx1R?=
 =?us-ascii?Q?evMdsHaU+re8Knma5pM/SWR/F87MeELzpOeu/nZd8g0VxAXs09mW1di5x5Qn?=
 =?us-ascii?Q?9qTsj6YaRPtBRhqXz7GU+Jzf2IngFzzopEjtw3UHZ5yxdhnQX0aEqH6abImq?=
 =?us-ascii?Q?car+nDBDhUEvZyeCws/OT3RI/qg4eX0WDcVU+an6XrF7YtnK35T7o2GAo/8m?=
 =?us-ascii?Q?g2KIy1JQEkfytdQZn4MQANYenoX4GYDQwN8s9vIjIGXd0FIekH/9SudMaqGg?=
 =?us-ascii?Q?n3bZ7Png2dx0XfLsf8jMZNelFKi4edg4t95a0x3tbgGoDnVp48GXciNz9lOQ?=
 =?us-ascii?Q?Pl0to64ecu9mZt0jeSCbYQS0a0oz1YJbv7D5r1R3CidSmpodkjLEUGi3AeE0?=
 =?us-ascii?Q?Krj7R7tn+v/BXGbnzt3VJslt+HWChn2X3A6cV6aYKMjnQoF8ioTeKjxvPOjB?=
 =?us-ascii?Q?BKrPVjDsiySb733n+0ZAhML2HOR2kXKVHLVtUo7CiuPXrYdBo545Nm1rj9GT?=
 =?us-ascii?Q?f28xYBGTK7CtADZVJu2sSyXdnHZyn2Xtk5UiZMkQDq6KOWAm08trfSBwxOx4?=
 =?us-ascii?Q?dcAJcMw5opGVVkSmFR0uGlnWCQtJgyaE+pBiDruMkCP25PCp/wiUmY/cF+vz?=
 =?us-ascii?Q?mkrhOv0DNc6lWZ94PVYCTd02FYuRDYeZLfCBRTGWwfeggqnVEO87VYUzhgXa?=
 =?us-ascii?Q?gZcR764IGwOdNyP/Hpp7L50lmqpHzmViaNLmbLlpA+s4T16JHhtuaWJ2+0Ww?=
 =?us-ascii?Q?Bfr3ffRmQO18kv0Wp/xjmwnkIWdEdj4XOquZkgxSAoxHtWlc0+iyTZca1e9b?=
 =?us-ascii?Q?RBy+WT3Zyh0E+9GfrnIgVLuOS91wV1xz3i+uLs+BPm9NGwE24DlC08rO3zRv?=
 =?us-ascii?Q?gyoenXHDyB681vbV+s8RGhXpRn6UbrsQnOI4cETa1jZEFnoE1GBCVFCCeqNv?=
 =?us-ascii?Q?hEyzm1qN6AWe3UtCjFuVp6klTSuZmO+QbW8mrxAIzSXtEE14JRLKzegJdnra?=
 =?us-ascii?Q?achVZWvXzPNzV6olK7myLAhKb3eZJBuN4RclaNBZdN94D9b40lvJ/z9D72lz?=
 =?us-ascii?Q?MO/m1i9l2CUjTKNxsXJtdraAy9Iwv/OWVSXzFKnL2jS5DbrEZsWZHy7fb1Fc?=
 =?us-ascii?Q?sz+LF1o=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:19:18.5696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e9dc7e8e-ea0e-4e47-a4cf-08dcdc71960f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9047
Message-ID-Hash: WHIHBGMFXHJLU42JGGJYZYIRT3V2K6DA
X-Message-ID-Hash: WHIHBGMFXHJLU42JGGJYZYIRT3V2K6DA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WHIHBGMFXHJLU42JGGJYZYIRT3V2K6DA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Pass acp_rev(ACP pci revision id) as soundwire resource data
for SoundWire controller probe function.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index d579c3849392..f967e8498798 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -683,6 +683,7 @@ static int amd_sof_sdw_probe(struct snd_sof_dev *sdev)
 	sdw_res.count = acp_data->info.count;
 	sdw_res.link_mask = acp_data->info.link_mask;
 	sdw_res.mmio_base = sdev->bar[ACP_DSP_BAR];
+	sdw_res.acp_rev = acp_data->pci_rev;
 
 	ret = sdw_amd_probe(&sdw_res, &acp_data->sdw);
 	if (ret)
-- 
2.34.1

