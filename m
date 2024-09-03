Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD796969BEE
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 13:35:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34CF0850;
	Tue,  3 Sep 2024 13:35:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34CF0850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725363325;
	bh=NYdJJR2I8zhQUK5jiHVBm3XfoTMBMEIV54CydxUqVOY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HIgUyWa9eBMsLs92x6J9uzvXlLxfSdGJ44IFX0nPr3VaiT36Vi+yP4tSQZF/NWSHo
	 VscZNdYTOQyWnqoEBFhueOB+xfXK55/jZte5eSRAY8OsdaCgRXN4CYWodd2CWIt/tg
	 GU5wRQ1U6XkFZs+z4XgwBKuGs6eznhv5Gmi7eU/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8790EF80107; Tue,  3 Sep 2024 13:34:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E577F80536;
	Tue,  3 Sep 2024 13:34:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 231FFF80199; Tue,  3 Sep 2024 13:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04C9BF80116
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 13:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04C9BF80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nHen3VU9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwdvXFJ3NTf5DEjSzfwwbksMIH2raM5K6S7jUK6sxmEc9foemsvHVq8USCd5usMuPuQw3QNFl2AT2I68tb9+++DuQBd+P9TVLLFbpDu0jcT3hvpIgO/M8gT3egv6Jt+xLFOHUoNkwyBjtwltfKMASO8LbIpv8+zBFWsyNYsBBhW1kCEMu3u0Btbft9s2lbTjCgXqH1KXNx6nW1wHhIKjpBEhcFQlA++tA/andDLxKdn0Jd9azqi2Hny89hnCZCD9+6ZtppUg5o8WsqR6gAdd9UCd7u96CF2O6j6w0ntG3Eg/OIOmSjTwZBLDgOOYYsBFoGwtIp5zlASAOOXgYmZu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0k3pXc9CPVIgAxjWPLiim6io5Hr3SRdkMl8wWZ0L9Y=;
 b=vVA085SWhDW5vfVdJJaQn5Wq6o2NaXGhynxEWXzn0xOsDLwuqXy0BVafwUacngsgUpV2Qze45F9iXahsve1sh4cKTLSRFkSVto9wS2CHQ7hiuoXS3yQJbERY9N/twzM7GvwEhUPg1LiiOvUlyZxlWpyiIXeyVS6qHmwIcpxTFxiQqFGoTHb0WotdkZ5/eq2O/A5kl7PbOz9BF5Ndl3Nx3j7/6QUI8l3mSkCiIZsFayYQggBt1T2OFfYGXY4W76HH66hr00Xs/2BGbRWDwUMykMjL9s+Q06oIn44PwTGiIXGA7MhXuB/N9gIvf3Bpn/cqjmRQUBebIxSEvCIKj+3XTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0k3pXc9CPVIgAxjWPLiim6io5Hr3SRdkMl8wWZ0L9Y=;
 b=nHen3VU9m1NBiGKacLnu7FuBecGelFcwISgh4AG2prI4ULDXBPgFPH0W9kM8nWtc66wCNkmaDRJuaELX3Yf96dSe/1G2XI5iOHGlnr3fdZu7te6CeNiFqDgvdMkeWCnOLmtUtu6FFTOt3LX5QmLJNez6j2ifknFXNb7T6qW7GFc=
Received: from DS7PR03CA0116.namprd03.prod.outlook.com (2603:10b6:5:3b7::31)
 by SN7PR12MB6767.namprd12.prod.outlook.com (2603:10b6:806:269::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 11:34:31 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::69) by DS7PR03CA0116.outlook.office365.com
 (2603:10b6:5:3b7::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 11:34:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 11:34:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 06:34:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 06:34:30 -0500
Received: from prasad-r9-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 06:34:28 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>
Subject: [PATCH 00/12] Add i2s/tdm support for acp7.0 and acp7.1 platforms
Date: Tue, 3 Sep 2024 17:04:15 +0530
Message-ID: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|SN7PR12MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: 3073bea2-ec7b-4ce2-ab1a-08dccc0c60d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+kMuL81CZonuifFxbstTKc4X/rruZSHbcaZyMsaneeZmDuRnO/Pv7OTv8TjC?=
 =?us-ascii?Q?fAtcEPMVjFXWJwdnfU4E62d8ceiHUl3lz9lS8nES8E+V5v6uRqnsh8rE6J8X?=
 =?us-ascii?Q?Zz+Z/ibFbGOpVmnzfUeSl0AB+iks4jJ450R4B4RWP7FK2SmzmWgqmIL0ThsM?=
 =?us-ascii?Q?isvt4r6K+n3mq42MUJxCxAnHDpqkQUJz+4E7SKuY1STBbaA3nen23MYud69S?=
 =?us-ascii?Q?Y/MOc2viQDx0eAixDPaYWapdt0eUEczXNF5bWPYqeAJ40RilsQc+wqFn8Ps3?=
 =?us-ascii?Q?xn5BZIho45IVWKz8DOQ0KX86febkn6YHF/kbMsKPSw9tuOZ7uxI/twGKM2H9?=
 =?us-ascii?Q?J4ofwCVnq9//RVCBSHkxcLRShN8KTlyLYFIUN3/oYDUXjUAP4WeffrZyiZ5N?=
 =?us-ascii?Q?3UIsFAqClu+TbuC94iSSFZednQlU7b8Y+b8twGRRWAT/BCy56JOWcUzOOMk8?=
 =?us-ascii?Q?rTHXY8/Z8LgBYWe+fXMW10iyHHfcmeHDCzgtKHQaMkfM59XkUD0/A1U8ZIrY?=
 =?us-ascii?Q?fDcsAt5KR6x21Da+dyQaUq8J8CBV3+KDnkvYFDhw+A71UESSyELasxtO4BR6?=
 =?us-ascii?Q?PGKrEfxlAXbQJ/Qwvez518+DMaH0wWzJUCmSiHZIEgGuDC50SqQU6lG9rLr4?=
 =?us-ascii?Q?6GzENIUb4vugZYulL3jWY+KRTQhjSVHqqZIu/wPMOEUyOkacCRW/N6D6hH2n?=
 =?us-ascii?Q?rvKZTOapTfK6RzREkl9AlLYBebKTM9ADkET7AjVGzCnv7JwHNpFKzcUCMGpr?=
 =?us-ascii?Q?WXWcHTbqbuLoYps0OYWzGmWY5eTrb7qhMcjFU8dnPzfqceNBKyWhUaif8gQx?=
 =?us-ascii?Q?lTcAeHiRPd6WxcTR+TBTxWLf8gTzM0JeV5nHFdtu8hFvulXmWeIeNwhXvKpJ?=
 =?us-ascii?Q?zWeUz/LhEWo5q+SSs3wMp1ONtMSG346eHtjtq5U5J726QX5e3chouDEEPwVs?=
 =?us-ascii?Q?T8PfzC1A6ZX+IFBGB69AqEBx1Vz8Gtm1mb1oBrQ+Sio6o46PNNJjrpzDidow?=
 =?us-ascii?Q?6TBGxqRlGBms1I/1OcgZGRSDSaupmI02qtu4weE4509/yoi0kHhGEAfRpM5h?=
 =?us-ascii?Q?O2bEPhBviZp6cx1ACDFGpu2nzsCR9cMjN7mUb4U7Na5tWQ9QbF02PBYLeU8/?=
 =?us-ascii?Q?9J0dFqw/piKu+dCE5hogC7Lk6XVNuKgeT/U7enpJBOkuP9RQ+O2OP3H1YWMk?=
 =?us-ascii?Q?I5p+w6KdRbTgdePPrg4+pT+MB/Y38GNm1fRrg1mtL6Z9TLZarCTplgjx2cQf?=
 =?us-ascii?Q?ruB2hPEvEACjfBaadgICuER3ha8WeTA/Y94gUmBkkCOFBfXXItMD8O81aaeA?=
 =?us-ascii?Q?iWyvYCHPjlVkCXQv+ilGzBCCErVC2g+cRCEjeOtikpYiAwQpRm8+rTKzEc73?=
 =?us-ascii?Q?VqDoggPkB+9jmpdnrPWUId1hSq7a9AnaHbycfyK8mdQEpVhc5LL+cGBGbywn?=
 =?us-ascii?Q?FxwHlai8BGKRcmwy4C4h+J15kYbZRWgM?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 11:34:31.5029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3073bea2-ec7b-4ce2-ab1a-08dccc0c60d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6767
Message-ID-Hash: 54ZBFUHXCCX3VMEYZ3G2MCQAZ7FWUVFN
X-Message-ID-Hash: 54ZBFUHXCCX3VMEYZ3G2MCQAZ7FWUVFN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/54ZBFUHXCCX3VMEYZ3G2MCQAZ7FWUVFN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

1. Refactor acp generic driver to support all platforms.
2. Add i2s/tdm and support for acp7.0  and acp7.1 platforms.

Venkata Prasad Potturu (12):
  ASoC: amd: acp: Refactor TDM slots selction based on acp revision id
  ASoC: amd: acp: Refactor I2S dai driver
  ASoC: amd: acp: Update pcm hardware capabilities for acp6.3 platform
  ASoC: amd: acp: Add I2S TDM support for acp6.3 platform
  ASoC: amd: acp: Update pcm hardware capabilities for acp7.0 platform
  ASoC: amd: acp: Add I2S master clock generation support for acp7.0
    platform
  ASoC: amd: acp: Set i2s clock for acp7.0 platform
  ASoC: amd: acp: Modify max channels and sample rate support for acp70
    dai driver
  ASoC: amd: acp: Add I2S TDM support for acp7.0 platform
  ASoC: amd: acp: Add pte configuration for ACP7.0 platform
  ASoC: amd: acp: Add i2s  master clock generation support for acp7.1
    platform
  ASoC: amd: acp: Add I2S TDM support for acp7.1 platform

 sound/soc/amd/acp/acp-i2s.c           | 188 ++++++++++++++++++++------
 sound/soc/amd/acp/acp-legacy-common.c |  32 ++---
 sound/soc/amd/acp/acp-pdm.c           |   7 +-
 sound/soc/amd/acp/acp-platform.c      | 117 ++++++++++++++--
 sound/soc/amd/acp/acp70.c             |  73 +++++++---
 sound/soc/amd/acp/amd.h               |  24 ++--
 sound/soc/amd/acp/chip_offset_byte.h  |  84 +++++++-----
 7 files changed, 387 insertions(+), 138 deletions(-)

-- 
2.39.2

