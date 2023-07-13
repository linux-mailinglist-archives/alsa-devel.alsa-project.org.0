Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2288752203
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 14:58:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C19A3E7;
	Thu, 13 Jul 2023 14:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C19A3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689253083;
	bh=qiT/JnJ7JSVu8aYYqMBB644pLPLSk3J/2yqa39IWKIM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bKtiuI2VKQB3P3dqsimcOxa33VuPvrxpyqQMGe39oJuSbW2voJMiy7W1IbVzV40BG
	 eJ6a9TSBGQSjte2Nkicd4vnIO9Z1bGMI14aWqP9+RANVdicJuG2U2htMXr61JOvzRn
	 zvrC72mRTlDb7eV6mDh+e31mMYBeJQgB5UXsqmsA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11B52F80093; Thu, 13 Jul 2023 14:57:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7740F80236;
	Thu, 13 Jul 2023 14:57:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38FAFF80249; Thu, 13 Jul 2023 14:57:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 252CCF80093
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 14:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 252CCF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com
 header.b=IGPG7L9k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4rnplG64ssscwVFn4hicsmQ78y+c+qYbY4EYYbSzdq6n4xTjoNmASCuU1sGx+qYKtbB1mYA1Ksdr9GZK55gLuxlXxe7y3BFAZ3HlsADSeshW/S+CoBdISXvNhH5m9JfBcXrHRs/NkNXeZ2JVdXozize4EyrLMHTWE3VxhkQf9JHinRt/P+rFj3oVxilUliB17EIcACWGb6w30g8ZTy8LcPQgbCkuKRdT6JiQgZtfhHyThTz3uy6ra4EXD8rBv4dGwmc58JDzzxQ1OYHf2myO+qpA8TkAb917G/kj6r86ICz+iMSOZdxi97FjTIGKjX5P5arG7CNSo9hgjY7XIDJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALfWTbRt5CMyLdwyChWA3GtznZS9gfoeyUvr2iYGF0Y=;
 b=eJVFhJ8W8cvuz+gbQOaM2RUDVfysnaiiHBWYjY8MzJ1LOCxwbB8kHHdSmE341tyGWdUWZiFJdyzcn/8FRupThqmgtUtI84zumokdpRdd30f3VU6Jf/gVWdJzCFET0qBSVZ4aDvDvLN7KwooS0pcay7kPl7oxjlPGAmZRgrnfphSdsfXz2jMD5YkNGBQl9lxq7s+Ojfntw2yj94TYzKSYZLtjne4J4hvpxdNQT58+svleEJ1LvDn+/3xRDCfv8+ZwXqw60ItGdvUz0wQn+5giuPgWwmH2/kDaRJ9yecg5YL4EDqZECrxYLcKXVwog5b2+nIAvSf/h4fi6j6BdP4snvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=amd.corp-partner.google.com; dmarc=fail (p=reject sp=reject
 pct=100) action=oreject header.from=amd.corp-partner.google.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALfWTbRt5CMyLdwyChWA3GtznZS9gfoeyUvr2iYGF0Y=;
 b=IGPG7L9klFzpzYyQEnOty0KC6udTH/hJSzs1fSAM1ASfMgjzX5vYZ93t+2jdF/DfH+MT8xU4gZAzA8e3QmD4n5i+KuizQY+Ne+Z3j3UGvMXkDyTLLB9h0m9iwaVwm/RaeGyOxTcqDTS5tO/6KIXv9fTS9yLEGRI2X48+BpVMPaKLHsD/QMQEv1vAyIywn5XrBYUusrSqeKna7XPJB/LIUSyGHqZ1WOaejn0O5IOdgE66zLoII59YkelLV6ImrO1sDvGuTAUy+MjHGC+d2jpjtuVAkY1sfKak0xm4NpTEqDZzSPDG/vVMM4HvuYUzEjbJCSj/UShiKONG4xfwuIUsAw==
Received: from BN0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:408:e6::31)
 by DS0PR12MB8441.namprd12.prod.outlook.com (2603:10b6:8:123::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Thu, 13 Jul
 2023 12:56:52 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::f9) by BN0PR03CA0026.outlook.office365.com
 (2603:10b6:408:e6::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.25 via Frontend
 Transport; Thu, 13 Jul 2023 12:56:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.corp-partner.google.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=amd.corp-partner.google.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.corp-partner.google.com discourages use of 165.204.84.17 as permitted
 sender)
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.24 via Frontend Transport; Thu, 13 Jul 2023 12:56:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 13 Jul
 2023 07:56:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 13 Jul
 2023 07:56:49 -0500
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Thu, 13 Jul 2023 07:56:46 -0500
From: V sujith kumar Reddy <vsujithkumar.reddy@amd.corp-partner.google.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<ssabakar@amd.com>, <akondave@amd.com>, <mastan.katragadda@amd.com>, "V
 sujith kumar Reddy" <vsujithkumar.reddy@amd.corp-partner.google.com>
Subject: [PATCH 0/3] Add Probe functionality support for amd platforms.
Date: Thu, 13 Jul 2023 18:27:06 +0530
Message-ID: 
 <20230713125709.418851-1-vsujithkumar.reddy@amd.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT015:EE_|DS0PR12MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2793ab-ce2a-4cca-d977-08db83a0a117
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/XEKHbYUvhDsj8qqHOXZuP0MIQ8jsoZmLZqGjNB/UoUMUaloUSKrRpmfXgkVoopoueTzlee40pg+8GEsnQk+2ZEG++/WB/fsKj0oBcNZ0dMmU4MeQzdZt5WXLHHZk2rAj6u6T+xRttTB5joYQe4nLigKJd7er3vkSbVRZXxcnnNcLxszICfIMG9S4lF0htEpAuuYxTQ3N+/YQMhWnJJJjkiwCEcT2UMUzlpnkNPzXuGXocdaESN2DtXVKtIFqLDZJirimYM375/Bri996JwgBIgfl0GsUWRnkUG4EPVLcNf/4+lCgyhoe0c9loc8YHnVodSNi9OtJHpLd6jfaIEfPgtVpCp1H8kLI7yPPdPP48NP0LpF21FfSn4wFzGVSarexmvLMxw5WeCiUoFRhoXJxFAa4sGmeFdfB0LsX2y4gnEiKPT0pAFFwyplHiuFgm7NguxAnLJ1gIfC/hIpNF1L0541Dwmj7xxYWdcVoSk0joIC+PCRDVYkwosbmNUirIQdLHu+GQ25W5Sggo6br7cQXiOHm+Gdg+/0xeCvpm9OKKDtQq5+JatDUYqOMp5RXmUdrxzMe4BTX7FUpUf+75QAA+gQFIVM+GDSYL5g2Rqz9nxXv7ZD77MIlX8zfQHx41moXZ8Ips35J/tTbVtAFRrjfMjTrP7LGqYC2+ixIb433rVhzbeHfN47SlAIK3N2t0kVisXOzuuEc1cMp4cp19n3Y2HOP1e8dpqphmsuTFIPjlqgc8pgKr4siAeRCWwts4Xc
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(46966006)(40470700004)(498600001)(76482006)(54906003)(110136005)(6666004)(35950700001)(40480700001)(47076005)(336012)(86362001)(40460700003)(1076003)(41300700001)(82310400005)(4326008)(70586007)(26005)(2616005)(70206006)(2906002)(5660300002)(356005)(81166007)(4744005)(8676002)(316002)(82740400003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 12:56:52.3289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5b2793ab-ce2a-4cca-d977-08db83a0a117
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8441
Message-ID-Hash: ZZPUEAER3TJMXQJPPV4FIBA2OQJ7RL2O
X-Message-ID-Hash: ZZPUEAER3TJMXQJPPV4FIBA2OQJ7RL2O
X-MailFrom: bounces+SRS=HnE87=C7@amdcloud.onmicrosoft.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZPUEAER3TJMXQJPPV4FIBA2OQJ7RL2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Patch series consists of probe functionality support for amd
platforms.


V sujith kumar Reddy (3):
  ASoC: SOF: amd: Add Probe functionality support for amd platforms.
  ASoC: SOF: Add acp-probe id to sof probe client driver for
    registration.
  ASoC: SOF: amd: Add Probe register offset for renoir and rembrandt
    platform.

 sound/soc/sof/amd/Kconfig         |   8 ++
 sound/soc/sof/amd/Makefile        |   1 +
 sound/soc/sof/amd/acp-common.c    |   4 +
 sound/soc/sof/amd/acp-ipc.c       |  26 ++++++
 sound/soc/sof/amd/acp-probes.c    | 147 ++++++++++++++++++++++++++++++
 sound/soc/sof/amd/acp.h           |   9 ++
 sound/soc/sof/amd/pci-rmb.c       |   2 +
 sound/soc/sof/amd/pci-rn.c        |   2 +
 sound/soc/sof/sof-client-probes.c |   1 +
 9 files changed, 200 insertions(+)
 create mode 100644 sound/soc/sof/amd/acp-probes.c

-- 
2.25.1

