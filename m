Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 494C5969C04
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 13:37:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBE67E72;
	Tue,  3 Sep 2024 13:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBE67E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725363446;
	bh=CvNlxEP3SH6unceMv6raEfXf94xthuFOXRSTkaWnuZQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uxhWtUmxS9CSzgGOGOp5xUs1fUo9jjfZasCd3Tj6MzBZpG4qAblhbGDHtk4fUFb2N
	 yy/CAI4K2kAvyyR3LxLujsF+FuPQukqnl58VrCm9+lpGx9JB/KVrIOU5QikYxxQSWA
	 m10Z97fGYEDVOVu0v5UYxWWkhbNYPu6CAr63Oous=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A33A1F80686; Tue,  3 Sep 2024 13:36:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96F38F805F1;
	Tue,  3 Sep 2024 13:36:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7FC1F805FB; Tue,  3 Sep 2024 13:35:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEED7F80199
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 13:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEED7F80199
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kbM1NXL6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oizTbxx1f0IUNUrkcRG1mApb3d+Vx+RiNndybNNkJVJK2P6gD/wqaYY2oSan6s6C+NJbj3s47Eln05JKjIJxYZfC6abTglzRd52ubs3Rqwdd7ujfmRS6pPAtWmRTJ6goLYepLI0IfaIxRPgbLVlkLqFnApFUpSZVvVMr0zAkQgYWcg/uh33v/0Pz8hOgkAkWwdNVcPU3pHRd3ASDGeMKzR3v4XcPiFkcmLoBnTl6OVK1NFyZ4TjTqE5OYCy8MvueNig50NROIXeQDW0fj+LhHS87+NruTplkxvC4mXOcuvSkCN0xkQKXB7eN65fsr2y/vEnJdX7thhgW7t5yeMfYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoYfDpXZYeD4NRq1FRTE5REBJVFe8xXnmX1KJSnAlyY=;
 b=IKzs7LvUa2zdLjukXUrnPBcQeqGwyaKZvyQhlMT8OYvp/2SdKSRF+g25AJDQZl10HBOQ3GgK5KL4vHLnqDoVm69gMHYCw3xktjcILKIFNCji4P/Xyvc0sujKePtPbWw1U+duPXOWA1WIVc8NBqJHP0YR8iPI7CNwsWSaz1okPRHK/It6XU4giS8ka872cgIuhN8q5rT8p+RPYeB1KKUIIsS9Yo6tO78h46X5KXtwj7p0rIVLNfCIzQR5Ag2qIxu/FqTYA3snwDJVsDUvqgddbrXc9mAkUZjfop2h9PFAave3ecyg+gBwDegfJLNTT700IFpAingjWXzjn7V/KfAy7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoYfDpXZYeD4NRq1FRTE5REBJVFe8xXnmX1KJSnAlyY=;
 b=kbM1NXL6yaVpsL9r+LoFyAEjZe8QiO4jGhTOnVOicFiBKmHVX9EozrUufRo7gHO5kpY7U2g3fUBKzw1Y7XUatzo2F8Y7f2gexYeqUusLuFiLGTIJc6bQvkKSQu8dl6d64RG+lqeWla1t6t8yhSwR0wVQNq4T4e1TGT8LyTjviVk=
Received: from SJ0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:33a::25)
 by SJ2PR12MB8157.namprd12.prod.outlook.com (2603:10b6:a03:4fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 11:35:49 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::57) by SJ0PR03CA0020.outlook.office365.com
 (2603:10b6:a03:33a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 11:35:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 11:35:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 06:35:48 -0500
Received: from prasad-r9-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 06:35:39 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "Syed Saba Kareem" <Syed.SabaKareem@amd.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 07/12] ASoC: amd: acp: Set i2s clock for acp7.0 platform
Date: Tue, 3 Sep 2024 17:04:22 +0530
Message-ID: <20240903113427.182997-8-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
References: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|SJ2PR12MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cdb5441-6732-4dfc-4c22-08dccc0c8f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XcSjSvs2sgY/JLqsWwZKISRdCjgMY/Ftt+PKjSCLKuuFyoYgxQ6FGvfdm45t?=
 =?us-ascii?Q?YbCGie35R0EqyFQ8wEwhhZgrot1W4hu9Ljtinx36InUCcEeW1DJGFIGcrfvD?=
 =?us-ascii?Q?IO8z+aGyQbpOXhXorLDsmjwJxNFoztbFI3tuLGGbcZI5n7a5Z9CPFRvYMAEf?=
 =?us-ascii?Q?ZbefK0UUOtOrsdEqhGK8YOUyLu70mil5AoHY9j1l9f5kCu74ybpPcsQP8Xz7?=
 =?us-ascii?Q?tsuCW8V43AeS7bN8osJGDl4G7g36d3Kq3LxweAh3gOAwLMoH/r1NuayOpifn?=
 =?us-ascii?Q?aIXxiQUFRYaTJFIc7X88zxFHSe13A/zcBqQLqHrduFQHY3EIaNlMRUDZG0Bm?=
 =?us-ascii?Q?gPvAoQpJr2UR45GIpvaJNA8aemcv/7GmEEJRAYgVIU7EjRC3CNSJqRIcU2y8?=
 =?us-ascii?Q?W/W3aZ1rxlCETftLvWF3kgzAalXbBLQx/r70BbeW4BHqjlrE1P5zpPoXNcrK?=
 =?us-ascii?Q?ylfgHGGzyINlXK/Kn52CcdlmZmbcab8khCc3qRXybn1+ye7setG9Y2V4xJBK?=
 =?us-ascii?Q?ZVTTmIAkYQf8Ht4LOGZxKD8EsTSt3DWU7jqK8PXkuUlKhpSzcpFiT+f++pfs?=
 =?us-ascii?Q?HooeffqlXFruZm30+bAgVqPsLlietSebZPiT9/ApH/pkqQjzFVP87DuGuQx5?=
 =?us-ascii?Q?92Wu3vHiz+NC8Y+ytXzG5crQErFkjwITUBBhqEjQpV5JdGzA2oh2UJEzz0Lp?=
 =?us-ascii?Q?9qe3mhclznXj/1MrU8cl+ZWiQT02/T2Yp6vWBicpjHVqWf5OuK1YJiOLZ4cw?=
 =?us-ascii?Q?UZ8HjIgicFHYoN9N2EDkJRsx5csZnWE03wFiUOw8MfVSveKw+y3Imwxshe2H?=
 =?us-ascii?Q?nKHh+mtzyw6I4CPiKWK6cUuF+eb26ezoCKfsNaPsiV1SWEwlJMQAaS51SHsY?=
 =?us-ascii?Q?707A25IJxs+vugehjfKpI6Q0Sp2wj7pOKBHXb5eZBIkZTrvBG9/wGMaAhI3y?=
 =?us-ascii?Q?GZRaBz5bv/IMACQ5A6RnqQ05F0xPBo7JU1QMLROB7TS3DeuN+OlYYfTwN41V?=
 =?us-ascii?Q?GhusZ2YDWR/buU4P+SA4kjm+h6Zrx2DRg2fYWzcclhM/M8w/rxnyUrIbWKUO?=
 =?us-ascii?Q?DAQ/Wk3WVfdXRo87tOafWHCIBrMZchuq2n79P9VjMgcaFtqDAE7ldm670q27?=
 =?us-ascii?Q?LB1OQ9s/AOXNGVsrOQm5MNN2+Lj0enLvUQHqonqnF+iZcEX0VLIknAiQbcdT?=
 =?us-ascii?Q?Ih/Jy1Fm0EJdrIaw/WhDfnpTKwTnDioaZ3d3sL+rya7lxyyIeU5CYbb+MILp?=
 =?us-ascii?Q?dTvNJti4M72jK2wGh9n+NhIUJiQoGuHQwfJ25ZYv9zAjS6FjSl/YUNX3Jh8X?=
 =?us-ascii?Q?COb5cUiUdkksV+f8YFPtpn/DNjoOeoUMqITwiXmOh6fYixrRP9mek/oS5tS+?=
 =?us-ascii?Q?OTaxeT7gq6NFvMfc7G/iXkfCXundOsbxxbWLdP7icLc9/6r/5cCFEJp+Tend?=
 =?us-ascii?Q?yZFifDY7fPmUzCtdWcOUhETbfRDduiI5?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 11:35:49.0588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6cdb5441-6732-4dfc-4c22-08dccc0c8f1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8157
Message-ID-Hash: UWLI7LF2IV4WK7IP2EWFBSCMK3L662DU
X-Message-ID-Hash: UWLI7LF2IV4WK7IP2EWFBSCMK3L662DU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UWLI7LF2IV4WK7IP2EWFBSCMK3L662DU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set i2s bclk and lrclk for acp7.0 platform.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index eceffc69bf3e..31475a4dbced 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -60,6 +60,7 @@ static inline void acp_set_i2s_clk(struct acp_dev_data *adata, int dai_id)
 
 	switch (chip->acp_rev) {
 	case ACP63_DEV:
+	case ACP70_DEV:
 		val |= FIELD_PREP(ACP63_LRCLK_DIV_FIELD, adata->lrclk_div);
 		val |= FIELD_PREP(ACP63_BCLK_DIV_FIELD, adata->bclk_div);
 		break;
-- 
2.39.2

