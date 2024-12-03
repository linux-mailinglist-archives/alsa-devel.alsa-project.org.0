Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC7A9E15A1
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2024 09:26:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF2A2F51;
	Tue,  3 Dec 2024 09:26:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF2A2F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733214407;
	bh=wN0GDYYHdJfomyNZnAlhTs1lSxfp6yXXywMRwXkb4NM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=m5ZPbhprHW94P1SZef4zbX7SORvyD1vH+MDiBelcXchjbYtbD5/hpQTyEkApNaRJD
	 Q5xPv+3JlrST+7twrza9eHDfsGhaxmEOlR0A0TBt2KrCAE0j3+1Jy/SESbTu3dRU3X
	 jEtSUZaDGc+bhihvaM35/kIT6Nb+1vUSWh6HZiSY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E524BF801C0; Tue,  3 Dec 2024 09:26:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD3CDF805AC;
	Tue,  3 Dec 2024 09:26:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47BF2F80272; Tue,  3 Dec 2024 09:26:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 160D1F80116
	for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2024 09:26:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 160D1F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SeFz6QI2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYDeFDaHx29b7yAd0fw1roOSDhWCms6X9gP0MeYMaiYK9c2nohRSOvwAJ3NPYngrwheA1tmS/YNCGDsoyNakggg6Ix/vmI3r2/j1rMIFJqUsijTKBvN7HxoXeC6yeZwJ88KY+x4irLGFdiXI0lAV5cwYRmkMRzDXv5doHziGo+75IG8hCdZa9EoeGfLOY/rBZ5NA9CerVO4JQcuvCLonTo20iOo60Glu9sWGwG4FN93pLEaHEpfv2np+OT5x5K12eIzhewssNEXoFbCDZLAtJ6TST5mm1RI70WyybcEQc+KpGVvbTbkDqrOYyfRR3a4C41FSQafWuYSVpmXmsTk/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2C+SFNo61iTrKPjrc5MN35ZVTAVPR4S0pffUVm2EVUY=;
 b=Y1J79Jt1ueFWxzewMBCRFq5aNFW2wBDoauVhup6V9Ms6lr1ZoPCH46V0YjEq7OwTV/kstRDfy9dUjWpe0UIZAfGt7Dedahp9ihVVluK+ij5U8QuheZBZbWT/TiS9sf94cJmgcUMD/T+IVrRESMK95Zwtw7v8+2IUlt6JZnYspI6P5wwv455JTX1G32tt+g8RKZGEWPiQkDdPRQtuOPVJNhQROpz9qA5xZAcs7hyltelBfpHJWsn7iNT1pBW1qvz+QgoN24+eoDIGFSfRR9aUnyYAIa5Vf933Bwr3au8poXiBR6yElEpggg9ZOjs5zgphwuTcOdwbxoKqZVAoSSbHoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2C+SFNo61iTrKPjrc5MN35ZVTAVPR4S0pffUVm2EVUY=;
 b=SeFz6QI2CzyNo+fUfWP3tXo8UbULbqXURppdtGvZ4R4Kw9d3ne0kNDTWdZVfIM9fbcYLXzMngCVfDJuHfa5UFkjXP04Kuj20Qp3u9QXd1i+UXUrf71LQpdODY/w7bZdUYB6NwxR5A1tSWkZ00kIYuTayNgzy74nk1u530CQjSAw=
Received: from BLAPR05CA0014.namprd05.prod.outlook.com (2603:10b6:208:36e::18)
 by SJ0PR12MB7081.namprd12.prod.outlook.com (2603:10b6:a03:4ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 08:25:46 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:36e:cafe::65) by BLAPR05CA0014.outlook.office365.com
 (2603:10b6:208:36e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.8 via Frontend Transport; Tue, 3
 Dec 2024 08:25:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 08:25:46 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 02:20:33 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/2] ASoC: amd: ps: update mach params subsystem_rev variable
Date: Tue, 3 Dec 2024 13:49:39 +0530
Message-ID: <20241203081940.3390281-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|SJ0PR12MB7081:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e03402d-5518-464e-431d-08dd137415ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pqf90x6cLRJRSgta0iRs2hRiG+g7dKB2FfawNhu2HM2kCFg0/mdq+ed7AxwK?=
 =?us-ascii?Q?rOd0gMvuyzn+13MhbyqLNmOGo6hI0rfzEimgMlNDE0uOVSSTV27EAGUc+UnY?=
 =?us-ascii?Q?OfdiRCux1BbLcWkll1+CrKaeQVyzk5EHAgPuMQE+TvHfzptFZY0klAhWpfyq?=
 =?us-ascii?Q?K5tlvpn7B28a2ubIXk8CBSxOchCLefvRjYRxX82kojgBvCJeFIosyjBN4JGW?=
 =?us-ascii?Q?vmF5OHWz2cPnoJvXh7iPvEbxBkaxSdGvkUYICEc3VdNiM1mtlRE1iKVgXQ8K?=
 =?us-ascii?Q?b0HYMR6WnlRsydOQflPGWQd4mZ/JSKAAN5xn3/P4ilV1m9d0jLStGiLv6N+Q?=
 =?us-ascii?Q?IewaGPzXr2TR0KZTC7QScKrIoHeV7MbdvD1GitQxWoT3ttMenjMWzK4zxZbS?=
 =?us-ascii?Q?wx5LduVuN1nRQx2so8Cai8O0gu2Dp9wQl+H9oQnQiSI3jmQBXvptqQYGrneT?=
 =?us-ascii?Q?gsDCLovDnU58f1Riv1IomwoeYkDdpZ5+Cb0Dkz8SayYLlP+RJRNRvE1ZUxDW?=
 =?us-ascii?Q?fWc/yNzmiT8FBbIZqUz9hFeSiaRadFvduXx2lby92lpvEeRx5+VUAlah5SAg?=
 =?us-ascii?Q?UMvQsfc9VxeVlnW6/QZiyE6QsAh7l7qHBV/OlBZHbXmNu1sIkqFkiGwc0NUP?=
 =?us-ascii?Q?Ee8Bgxl3Q9C5rsxkUuKuUDyaaGqnKlsyFkYMSd07/Tnu7KokaGy7k5hCp4oD?=
 =?us-ascii?Q?yDBgAWRbsXaS89Qb7dR+4Sr++Xc9a0HE7+E55KTBpnJOKbHJlghKgBb6RFOU?=
 =?us-ascii?Q?x9woEqke/hOfS6cU94jJh1kXU8TSC5xp9p51FRQUOWIRWDEJBcXHmjAMmalV?=
 =?us-ascii?Q?gz7Mzdq8EuaHkVydq6lGlMoHyg6U9K8qgBDCnygKRzhn5taKCA/KphU6XGc8?=
 =?us-ascii?Q?Zdal8arPVdDmAsrkOCDlVZQ3ZmLvkEXDDWBhhDnbMpgtb2c0N3rNE3DONvwN?=
 =?us-ascii?Q?LuS4lyy8sgVL2MwkjLRYETQDHnYW8/6W2DNSHVvi4sCWQaJN/ey2jBakn+di?=
 =?us-ascii?Q?GfAUh49Er4/f9Ro+ks1InpdG0kaUVDDr08gaXWDDbLh5fZb4hqrS1N6h8pXb?=
 =?us-ascii?Q?8ObuPGkHjdr9Z8WQf/I1lk11RI9wasxZic5O0HWhsd17+WQIpLvSlA66XUi1?=
 =?us-ascii?Q?AmfQHxZRhHNqrxLhU/1SkzPq29NeqWEOIqAvxbsetp4G/pTqoL/B/R7dulJY?=
 =?us-ascii?Q?D1+qMSKF7egJwVuGwbBz5Np4o+Mtb89OHx5t2IjbRGD+4JMZONlCsenVoz/N?=
 =?us-ascii?Q?/ilqx7PILr/xSJrWJeaEe/YFwyoin+IWR5amfBjDUpWXlkFVDx/0Vuv0vj/k?=
 =?us-ascii?Q?RY7ycWqzEs4pRxJgh1e56wUgTxQHowlMXAOYYhDKVCq1o03o+TJ+dRndpQ0Y?=
 =?us-ascii?Q?pj+YbzPgLsDP4Qon7EaRhnZxgb8bMNRVpvW7puWR0I77+L4X68a9E6XGl1gH?=
 =?us-ascii?Q?S1p2dZbmGpuLuJMtBdsw0Hl2zyrjLzxH?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:25:46.0702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8e03402d-5518-464e-431d-08dd137415ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7081
Message-ID-Hash: 3GXTDRLJ23HLDBFV33SF23W5Y64KMNTR
X-Message-ID-Hash: 3GXTDRLJ23HLDBFV33SF23W5Y64KMNTR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GXTDRLJ23HLDBFV33SF23W5Y64KMNTR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update mach_params subsystem_rev with acp_rev variable for ACP6.3
platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/pci-ps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index aef73ec6f7ef..4ed50cebadb3 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -312,6 +312,7 @@ static struct snd_soc_acpi_mach *acp63_sdw_machine_select(struct device *dev)
 		if (mach && mach->link_mask) {
 			mach->mach_params.links = mach->links;
 			mach->mach_params.link_mask = mach->link_mask;
+			mach->mach_params.subsystem_rev = acp_data->acp_rev;
 			return mach;
 		}
 	}
-- 
2.34.1

