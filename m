Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC45A2BBED
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 08:00:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68C08602A9;
	Fri,  7 Feb 2025 08:00:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68C08602A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738911614;
	bh=rUDS1W7GSY9x3ufKyR5TU335l/+EBtmFCipUhA7YfhE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RMoGo8q1yswvpLdsJ6XuVptZdZtt25ieikvCXihHq03ouUBzkW9fYF5YUsCmH8yhN
	 XGDZJyS/0E9LvDqYRHhZ0Eq43s7zr9RDhjTqVpP/CWcpplr99vFJHjl/EMyuFTKPd5
	 5/QiBlOZxlHT6HuD/ZdONlJLu5529vZQrodHQc+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2170F80604; Fri,  7 Feb 2025 07:59:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6AF5F8060A;
	Fri,  7 Feb 2025 07:59:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF969F805D2; Fri,  7 Feb 2025 07:59:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::613])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D37AAF805C5
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:59:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D37AAF805C5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=R9kh928B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwViN0y+euNHxNjlVsX7Tl7KBZUVrJcSfGFVZMr53kxvVtelqFqRN0QFhJI9IcGXJfHJVUxsKu53NzOb5fh1XdfPhh1ruJW1ORSiT2DJoXD9X0SlQM0qCTpFFPh8CUPG+2mpaeFVg7y4Hp9TePPEkMDRRtkM0vjuQsg4N2M6xG+P39S/3U8J9pigthzmCx7FxssySwPB3aS36ctly1aXg65Cjtri9WOsdCGUCndclhoFB3TsFQtp5F9NCaMt1Hh6iClSCKHcpIUezwFKa9d5UdGJlDPuV5ZxHIurXbHCkbYfUNzOm9msMVD+BKjAW2HnS3sAu5xY+WFzb9vjzOvK1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+TII58PpEldSfBplN7Tj5YOOwq3yThcAXWsizYmDV4=;
 b=X5XJ9hZ6Bs9DQJ5+D7q6JL6DyuLTVP8JY2GPBqbdBHYJG9zf8LV8Gy8L5gBj4sVo4YjvNf5FvDYCgFFdLezaHHLd0Bkwi7sj5z5x6wgjEQJEx5AuJTUL2+9tDzfrKbShCpZe60OO+mH7tVou+DYjSDoAZVj6EVQzsPZ7txrLBAClASo0GcAm0okVxtbaZ9c1+9sJ1puXdg8pM32iJbzU0uWH8orwn65gBDqy/6PiIGsvECl2pyBp/JHNS3RA0h9/JeVFGQmsZaFe3oXQzRMCXDwYi5AFna/RM/SsFSuipPgjn1PgYGff9o1MnxslqFQMbC4eVDDwhJwsn/Z6GXRgZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+TII58PpEldSfBplN7Tj5YOOwq3yThcAXWsizYmDV4=;
 b=R9kh928BvLCdB1PtdTZFPI7oa6lLtxGLfdaMhWv16H5Bqe1/t+ds7YNhht84S6gfVxESipFo1JS3qyCSW2KFjr52a384cSCaxujiRl4D+xXF3cL/icmGxt++yweylZqYtcf4VM3uVJb6mUyXLX0nFPVsTTveu3LP3VK4IzGaP4k=
Received: from SJ0PR03CA0117.namprd03.prod.outlook.com (2603:10b6:a03:333::32)
 by CH3PR12MB8234.namprd12.prod.outlook.com (2603:10b6:610:125::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 06:59:09 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::7a) by SJ0PR03CA0117.outlook.office365.com
 (2603:10b6:a03:333::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Fri,
 7 Feb 2025 06:59:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:59:09 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:59:02 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V4 2/6] soundwire: amd: add debug log for soundwire wake event
Date: Fri, 7 Feb 2025 12:28:37 +0530
Message-ID: <20250207065841.4718-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207065841.4718-1-Vijendar.Mukunda@amd.com>
References: <20250207065841.4718-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|CH3PR12MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5f2359-c8b8-4192-c573-08dd4744eb93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6crXQHzAw/aZvFEAUiiH30HYo5T3RPBFcvmZsCjuwLGLxgMb3ibUBmNWY4Gm?=
 =?us-ascii?Q?hXKrrsh4Bob5bY3uJv5f/d+ANZk1mMO7FxfQqUjI1QHm+kVdfhBkiQeJi70J?=
 =?us-ascii?Q?55JSkOiBNdn38AqN/cRbrdp7EtRD5xa75GiNDEfXUwDcOMcfOLZDAb0isZBa?=
 =?us-ascii?Q?nsdOYrcqaNOblOGQOZekQLBMqJwf3ROkWoC1ZX4STw9oryZrHMUmRH9aL3g/?=
 =?us-ascii?Q?qeqs6rUXlaKxeMHdTu4Jy9XGv113XiGsNSBj6bbx1sU5gsnY1xbK+DQplhey?=
 =?us-ascii?Q?okfccAO+fpuzt2bkGZlgI4nhk/H94X2ygsWayPF5Az6vwN/LF025rdd48QQS?=
 =?us-ascii?Q?YAaA82UvM2VyQu5umUYuvLJMeBpcUGmxGeHhCx9Hi3LI/2evBL6cDAcWMyLD?=
 =?us-ascii?Q?aSw4rRlJxicfb15TlBwgiUdxPvH7o/z2/nubyBBT668Pqc8VCzRuWzDtWPfE?=
 =?us-ascii?Q?jfbr5RgppziHniUGD4wQmuT0RO0JO6qcC6+KmyHqYi/2VHBlqqMZ4JHAU75N?=
 =?us-ascii?Q?SeKVrAxPgxmJf82HukR1WloiyBcQTVswyrunjXxTgmxc9tCT6eEHMSxjtlLZ?=
 =?us-ascii?Q?llfBeu6XVxZJazhDFBp94m2MoOyiDHa2BJfYBuAEhd2L5a6jBJ1tU8htVG1U?=
 =?us-ascii?Q?3hnOrTsgA/0yn5swFA9IXEEDVUiSTmTUb1uObd7JNUCTpttrSm2FLxNWZTBB?=
 =?us-ascii?Q?z30VfjRyCB+kwRj3Y2XEUv9IQLk26sj2SYr92ejwsh2QC981Jo4OsWKWEyO+?=
 =?us-ascii?Q?e7jNE+06uWsqxjr2bo+iw799fEBUH6d4w7s4AB63ketUHEroXX0aaHSKrGIx?=
 =?us-ascii?Q?rRJJOii9x5nZ3cNgRdXNpQe2lzLYOtmcl8s2TPMgtLkzVs1QlUhDFoAH9IkH?=
 =?us-ascii?Q?Wr4dYdYLn4uSRKT4usxuRhgIaiRzeA5jcGiMt2Z5YR8ZD/C0eHxbDQsR0Dqx?=
 =?us-ascii?Q?g83Wqgl8F98vmPiAu3wQKTwKVDWAsVQ35bSMR+xgDANlwYQEJ5PYr2IC9AU8?=
 =?us-ascii?Q?MpCh+j6aO1Me4WONOO5JQcpxmY+ix90pY5x1RZnpQPSNhGrI3gP1RGHaYnYn?=
 =?us-ascii?Q?zA3ePktBNb4jwmHVTJVxu6nwmakzH4IlMW+izuvSTVGygqmDx6o8mceOocii?=
 =?us-ascii?Q?QUnbCTjucPm2XrxXoKFn+PCSz3iC2S4Nn07SSDP9DczEdfDVj4wNhlmqXpvM?=
 =?us-ascii?Q?3Puxf9+9KLirFi9bE7v/U622/J3bxRsoRRkzlCzUiosMju6/JMyhxTWQQjxk?=
 =?us-ascii?Q?vd9qn0HlHoWnXa6KKp66rIcKinAuVto4/dnCWem10MaNZsX00i7oZ4er6BpF?=
 =?us-ascii?Q?hCfbTkROMB5+Jt2pjgjRAtYYZSj02cuADIk7kT7EmUSaT1WRvmCMsWeNi1kO?=
 =?us-ascii?Q?27tz2we7aU6Ha3zzxgcBnhqpePARUtFKV8TjLuGAYaM7taYIrhzbFUheoHIK?=
 =?us-ascii?Q?dOJ4iY/yul+C/8kzISb4R8yAWuJ6oHob06Ak+OhdhDk3txdCt1UlLbNyVaQj?=
 =?us-ascii?Q?CDJxdrDd5oyDDSg=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:59:09.0594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5d5f2359-c8b8-4192-c573-08dd4744eb93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8234
Message-ID-Hash: 5F2ODTDG6RHDE2KJOOXOFQFOBULLT5X7
X-Message-ID-Hash: 5F2ODTDG6RHDE2KJOOXOFQFOBULLT5X7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5F2ODTDG6RHDE2KJOOXOFQFOBULLT5X7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add debug log in amd_sdw_process_wake_event() function.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 187006e68ad6..60be5805715e 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -849,6 +849,7 @@ static void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_chang
 
 static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
 {
+	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
 	pm_request_resume(amd_manager->dev);
 	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
-- 
2.34.1

