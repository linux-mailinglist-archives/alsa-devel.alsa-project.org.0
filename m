Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D47C290A738
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 09:33:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28E9DE72;
	Mon, 17 Jun 2024 09:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28E9DE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718609587;
	bh=ag9+cpmriUp5rqB9HVXP/zFzmxUzmX+ELNNavcFosuw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ot+TnqCZsFrT2zGG42DrY7casZyoloQZfr6lZec/w8gl4FWWzigUbdJaVmfXovccd
	 EDn/599pFZjR9Z0aB409ueJVJJhDg2vxBv3OiAI9Jr4d4mcUBcJym9Njezbj3XmFY7
	 7pvtMaYbifah/ns2UrZyxXQibxGswkoVXNv8nGms=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BFEDF805F3; Mon, 17 Jun 2024 09:32:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42465F805D7;
	Mon, 17 Jun 2024 09:32:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF581F80266; Mon, 17 Jun 2024 09:29:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0823AF800ED
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 09:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0823AF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qAV48hqQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2ix8LpdDpGqM+ywbuhjJK8RG4sh9XGYXQCwmlkqSAVqYqBdjNXk+Nn5bMZtChEwnB7kjAILLFCF9NVAjAko7c36fVJOieR1EAZ1XOyIHSvPXe/56upn2G4PWdj9CIVz8BpQyIcA3pemMy52m5ynG4UDo2DtSRIv8tYEfswAQft+lls60sCU2N5V0qvQe6yD0oBXAgC8BvGuyxbcYQDkvkMoaB1GB30snZfQujmpRLwIoqoCHYKvXXFjlzZNoDiHtwm++RPLqdA5e1PsssD6cVyRJoHbgw9zfnLo4yd6rcWkozvbx/SJ2F+qPSL2ho2sO/svWa53/98ylLY6rJ3grg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zs3hEKcQKwvZr7AiQAv+IHIFyPBF7+j9KMX499DrjAE=;
 b=IZlpYxlbYs6J0L4e4UACc6DhjgE/ITa+gLQQT+Qf0N/OPtxwZyyUtfqeBdmnCeDPTUGRKJnkdTTbO6GUzWbPALoZ6AsNbl1ZJ3M/IKiJ6dPddfRRlfWEqkv01MY32kgK83QQOoKLjT7OcoH+j4LLL2OT0mahGHFiCyOpH3FCYpyzLq67Savwsg3POIuoSwWlrFanr2IyYyu0+Wod1+u41GcBhOHlFIuouOkuTv5t7izraSqYeApxOAeDzEnz4EbcIiKFapp5edgvJ7H1HI0Jy3IpBcsE563Ij1g2UqdPUT53dP4Yp0XPr9pv3TruGB8I6ySMFSfxQEfcJkVv9yqmHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zs3hEKcQKwvZr7AiQAv+IHIFyPBF7+j9KMX499DrjAE=;
 b=qAV48hqQDWSVJZiZDnThMiFFvnGYanYYuZBC86BTp/n3CTYsnCw0oFIUKlQl94MALx8+CzO7pZp4dP4GJTwGoXxnEAlqw0LBl9i5ZHl0FGrzHhAy10YwKCDwyxrUHyX4RnV5VHMNeBo4kBRALO2d0QwmCxWfKw5Bq6ZAAAO1SQA=
Received: from PH7P220CA0055.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::8)
 by DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.28; Mon, 17 Jun
 2024 07:29:00 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::fd) by PH7P220CA0055.outlook.office365.com
 (2603:10b6:510:32b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Mon, 17 Jun 2024 07:29:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 07:28:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 02:28:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 02:28:55 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 17 Jun 2024 02:28:51 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <venkataprasad.potturu@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, V sujith kumar Reddy
	<Vsujithkumar.Reddy@amd.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/8] ASoC: amd: acp: remove i2s configuration check in
 acp_i2s_probe()
Date: Mon, 17 Jun 2024 12:58:35 +0530
Message-ID: <20240617072844.871468-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617072844.871468-1-Vijendar.Mukunda@amd.com>
References: <20240617072844.871468-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|DM4PR12MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b08c32e-b231-4824-1f64-08dc8e9f27cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|376011|36860700010|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a4AEZCuXVHFIyeH4bpUiRcpT790nQM1rohnuNb4CMXFowtBFv/BAN9r2Cgw5?=
 =?us-ascii?Q?dR/P44bEfqsEoWhnb8zvd/zcNOGRKk+y8C6dKdLqQZ/NwbBavFThQY04ZyFD?=
 =?us-ascii?Q?HYn3ViPd3K/HdunKQIEVatvBnj4XccUZPUkF4ysmlCHwlTqgRB9zvB5IMozY?=
 =?us-ascii?Q?uLQUS9i5vP/RHE64LkVC59JNX6z20J6d0TZSVfox01lQ7ayFf74FRZzGnTmP?=
 =?us-ascii?Q?0F71Ogm//21WMrr7InkmAI8NeSCc+eoOT9DLwvVhaeBqkAUx5Pn4dfviKxOF?=
 =?us-ascii?Q?loUiLAsencvkfmxm/w4mi6PBF0d75SyxApvoOMpihJx3nM5QarVOJI7fQvcR?=
 =?us-ascii?Q?U47YDUhqkjbkFTPu7xxRgkQEQ4B/XH4T0ftFfo0QLZGhzpbfE0ajLOjmGcBs?=
 =?us-ascii?Q?+R6IUPNvxtRv1Y/ijNTFvD+6pXDTV2EaOQ2LQlq2U6AdASx7a8qTY8uxP6k7?=
 =?us-ascii?Q?X1xcR/b8kJIhZlZ+8ebe/06iQJloQ4Efw/LQ48nx677HwCfCndAdqTw9tpeQ?=
 =?us-ascii?Q?iPss6RgEUdrhM42q4rcy1K9Ucf92zvExDuxhlK5tmS641Uml/oWm5NnpPt98?=
 =?us-ascii?Q?thXl1nCJvn0BzVMI/7spJDEozQZ86S4U9tgC3QlFVmdYk5g0KAxtrauuWHro?=
 =?us-ascii?Q?97PscaqlWmrTOKID3wr0TP5Y2rtKNnroFyWa/HNvNNWnADn8ioffrqrululg?=
 =?us-ascii?Q?VLL6191UJ8NNEWm00HY1T+7B9WQcYVt0wPtbmyYo/yGEyJQuGhwLTpkkIx82?=
 =?us-ascii?Q?i/c6ZPlP6a/VIQR5v3qz5weqhStQC11zOz7UNdHS0j35FT8n96v6VO82HqVH?=
 =?us-ascii?Q?UA1BiR9IZE4haFlE1acysLYFPaCabfMcGJ9UIspliEXCFLzmJyU/Q1gtACjv?=
 =?us-ascii?Q?RpWevQMwIeCZpEsIFfvp0W4yHRrWnnTI9GJ1kXYRIyTtB8xsc6u7GIvwHSNL?=
 =?us-ascii?Q?JaiC7TnF8gVe5m5um96eI4eat7fVE2YDBwtSGMCBXnKfp6P0m7IgZt+h9K9g?=
 =?us-ascii?Q?BueM4o0PoCLVIM1TP0TULBgt2pPCXHJ7unonkBU3Gor4mZLl1+5Ucnr5pCaJ?=
 =?us-ascii?Q?MTma/4d3RlGZdb8SD/2btWtHZPdEu+dNWRhyrkFI6OXNWuElyYC4GnLnA+5n?=
 =?us-ascii?Q?Yc9ZVktTcjyihRb+GSkwJdvy1xCSFnKIYZfWifMwXIqyYhx8T/dz97HmB8yy?=
 =?us-ascii?Q?0zauTI77m3Kost5Or4nThJzyHatYt6P4Tz09rxXcMchuJVe4PN/0HkmJbjQq?=
 =?us-ascii?Q?mxCvzRTrzwKDxtitHASG/yJoRfTuY1GqqSgVeityVJcVj3+yIWVcfo7wwWdX?=
 =?us-ascii?Q?eswENNHnVSmmdbL8fJxnaJxeirne3v13/ZeSttDVfXOkUtrlJ8GHaC+JJ16R?=
 =?us-ascii?Q?Mg6ylKcu/kyB4t0NupBZyuTkMh3s/KraQ6F7VUjFJ/jwTNrruw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(376011)(36860700010)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 07:28:59.7085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9b08c32e-b231-4824-1f64-08dc8e9f27cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8476
Message-ID-Hash: PLUW47TABTYSI4EH2OYDSCU3FJNX5NMS
X-Message-ID-Hash: PLUW47TABTYSI4EH2OYDSCU3FJNX5NMS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PLUW47TABTYSI4EH2OYDSCU3FJNX5NMS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ACP supports different pin configurations for I2S IO. Checking ACP pin
configuration value against specific value breaks the functionality for
other I2S pin configurations. This check is no longer required in i2s dai
driver probe call as i2s configuration check will be verified during acp
platform device creation sequence.
Remove i2s_mode check in acp_i2s_probe() function.

Fixes: b24484c18b10 ("ASoC: amd: acp: ACP code generic to support newer platforms")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 60cbc881be6e..ef12f97ddc69 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -588,20 +588,12 @@ static int acp_i2s_probe(struct snd_soc_dai *dai)
 {
 	struct device *dev = dai->component->dev;
 	struct acp_dev_data *adata = dev_get_drvdata(dev);
-	struct acp_resource *rsrc = adata->rsrc;
-	unsigned int val;
 
 	if (!adata->acp_base) {
 		dev_err(dev, "I2S base is NULL\n");
 		return -EINVAL;
 	}
 
-	val = readl(adata->acp_base + rsrc->i2s_pin_cfg_offset);
-	if (val != rsrc->i2s_mode) {
-		dev_err(dev, "I2S Mode not supported val %x\n", val);
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
-- 
2.34.1

