Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B4D977BD9
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 11:07:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB9AC950;
	Fri, 13 Sep 2024 11:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB9AC950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726218473;
	bh=67QgmAMHmco+n8LJcc8yjIzjhmMa7X+JYsIcl4wRFZw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qrkVO69vZ+x9Xuk1pgH2mlaglx5zKM0eDXnrI8gjwQYYWAw03Bvl6DX09Gn9q1Db3
	 ut7JODcQigZ4Wkes8U8Q697nqI8EdfXIYhQ0vECRUQgzllrIqVc/66R/ta4wtbT5fh
	 WL3eMGwZWIcTlCONrvW2EJMBRzpF9bvTHU8L9xRA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2218CF805EA; Fri, 13 Sep 2024 11:07:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A998BF805E9;
	Fri, 13 Sep 2024 11:07:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41469F805BF; Fri, 13 Sep 2024 11:07:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B74AF800E9
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 11:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B74AF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=G5n5S/Am
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=or27utf2W9jqaIcFxB2w8Ox9Kh6KNEZiyXvjAO02mQRAYp3Ii6deoFrqFIUOxValu1xumGh3GpGlLQFpfy3YI1RfViUJocIkZv2yy5Xl8HU7B/aVKmr0GDaUzrtjVA9iKbq0rF/81cFV7j9pInqU/CKlX3jBuMrBrzj7UjnbWVxJoGMx+r60HP5Ss6q9tAPWdy2F37cmPu0G7upH7jBihrmzKtjJC7gyMga8Qu6DVyy/z9uyd7qmBb19HOttf5txZFjnw2nXv03cgCXPSUdFrxICiIVm4Gz9fpigU0eEr+3lIyoafy2+jwNAG/IF2Zj7oECpNwAdJI9MGEb7jkPkxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKJRG52gtc3gAAXgs1/Xvt5aYJVV5qg7RqE2NMVaod4=;
 b=XPlGT8tbTekcW9biWT/U1DzpJq0rr9C9nwB0Xs+ah1dgH0iHm5jjHvSurb25Ud7FPO8IM7plo7x1PvH6omrJBzDSOAzHs6lgwORTUv1CQpMrHyT6dFKSTepMJY4njt9QEC071fsLq61Yf302FQbsgcM1qno6UYWggj86WYLRQCWx9v4e4lIwSVu1FfCDgN0vUkUf4wfItfELFxp3uxLcKoj9RQPLLpaChelAv24iq+XmgHfavgXxpJ5pdi2SwlS73ImvpBio437cbNpheiOpZiDqKeDoW06hylU7aam8beKzjdOitMw/gffwSUWnFXUUm2oolm1lR9qwi6AcCH5wbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKJRG52gtc3gAAXgs1/Xvt5aYJVV5qg7RqE2NMVaod4=;
 b=G5n5S/Amguqc8m2gZKn2yX125AzI373DGDTk9qlax0YDQ3krCoNsRxXh9A7+8SaXyFALUFrHwWHc/nhXYJCIvBTannBHUWf5mkGAekzn4L/kjdD6FRAYIDOtGy/zcHNj4HkFWAjrpsLZjpmQpDJFxvcarHCX7x7AV1ZOOpMHV/M=
Received: from PH7P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::31)
 by CY8PR12MB9034.namprd12.prod.outlook.com (2603:10b6:930:76::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Fri, 13 Sep
 2024 09:06:58 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::41) by PH7P222CA0029.outlook.office365.com
 (2603:10b6:510:33a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.29 via Frontend
 Transport; Fri, 13 Sep 2024 09:06:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 09:06:58 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 04:06:52 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <kai.vehmanen@linux.intel.com>,
	<ckeepax@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/5] ASoC: intel: sof_sdw: rename soundwire endpoint and
 dailink structures
Date: Fri, 13 Sep 2024 14:36:27 +0530
Message-ID: <20240913090631.1834543-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240913090631.1834543-1-Vijendar.Mukunda@amd.com>
References: <20240913090631.1834543-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|CY8PR12MB9034:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ba93d4-9eb8-4e09-5fc9-08dcd3d36bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x2ilpS4krt+Lgryks0dV0g8YiGDtxsjuDXCqUGgtKbM0JStbb4uliPiMNC0E?=
 =?us-ascii?Q?iLbrZ+dV3avmy57L30bOrbrUEhmBdRzPGJr4a/WRXqv9CTJ4wPt3kq4UTeW1?=
 =?us-ascii?Q?QrXEmSB3f2WvaZSn2gnkxWiFb8tpzC/fRLZBk++veMpuzrLu8iw1lZtyN38x?=
 =?us-ascii?Q?T8LkhQPc1eMG8DSJaUztnle2zpkX9qbG14eF0czX7xwSFKvHNyVBdzFd7KKC?=
 =?us-ascii?Q?wA7LqBpidNAvhL4Y1ZESOkXC/hEGFG8R1mLiRafidkJDD89692JjjgTJEbu7?=
 =?us-ascii?Q?gUmOAXHMgXNPO+o9Nkfc+npW0YuzefFhUeTccryvLQYx3oI9UJSMEddUkZct?=
 =?us-ascii?Q?lNC6hdPCZhzSWnqRtsysvxgD+L9h0A8Ov5Owiz5V0QbkaOrhsqSYrVdNJYPR?=
 =?us-ascii?Q?0SgCQf3klxFXHnwLw38Jzbwl/4g5rq1beklKGm9gDrx6Wvk93/Sm3O6WCPVd?=
 =?us-ascii?Q?xA/sVfwQvgh0TfvJ4n2XFulMM1D4mZCC87ukX8ZLYIryjuIjY48e3wjeHtKO?=
 =?us-ascii?Q?xbX+i2uqOUjT0208P3b2n9/1SMa83zGyN91k2uX02npfNOnlz2XBf6iVL6lW?=
 =?us-ascii?Q?BR8OeeGFVyiGD/7yTBUM0H9fv6+w+QQ7urK+gOIASsQmgNJf6UxigPnfYZWP?=
 =?us-ascii?Q?Zz7htTr2Y2mCivgT2eWJ3jcjAK8QB4Hv4BqIgNm2dF2N0oAgZU0ztFnLaLAC?=
 =?us-ascii?Q?6scxb4+qqR76hdsUDYSNuiX0INGKQghpj/imc7pHso+majHngR/2sx9476V/?=
 =?us-ascii?Q?YAQZAzFdJC6lnWiMiv3wnAFkjCI8BYM9hVXkR0zyKCxtTXsl5lCvfmySZMbd?=
 =?us-ascii?Q?Nwx0sa5WToOLPsUjUlG1uuPmqWW1D4IuoZ6Vj7tdyniA/lgEwFYegf2pIzaW?=
 =?us-ascii?Q?k02zANi4bA5BGDFztzSrHyHe5O+FHXv4zRXTVW5lI0u5XuRZY3lDFPNZbg0U?=
 =?us-ascii?Q?3dTU76hqAmUDkoLX4e0MiQOKDlTWr9qaLJM/yY28tcZkmD9hhCqUc1mxJF5s?=
 =?us-ascii?Q?iMvszkkEGkTJ0YodtexP7+Sn17um1kgxc5X4+wsv5jnHDwxyYR1Ban1sRdj7?=
 =?us-ascii?Q?gc7wpe5u6IZDdOgZu6MyT/NzqiIPGykIekUmreMzy+cS4hmARC3/4R19xZWX?=
 =?us-ascii?Q?iui/hrI55ixjyTEPKJg/cZYVnFmB6hv+HPTvmkSQ0x0JY3NhynfkhNLfP3Lc?=
 =?us-ascii?Q?eYhZYG2s5Vk2k0NCFVZ1tzRhLorGU10AbKQb2oxAYOZuwV6eEEf27aC74W74?=
 =?us-ascii?Q?ulORvtZdgHbLUYFkv82Uo8olTlJZZUIfhCIOl6PcqRqXFf0z2OETDY5Xn4Gx?=
 =?us-ascii?Q?0AtN4457USrYrFtMqpn57tpwDO1LkZEgAVqbilZ3MSUtCXofAtCnkpr+A4mL?=
 =?us-ascii?Q?nS2GPTvsJtvilNrpmRSh86KKPpsZVjEy73WMfdX8UqNaR9VbpG/wTw86dDLg?=
 =?us-ascii?Q?ucNQeNwYB0JREujJk5GPG7Fcx4n75VVn?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 09:06:58.0171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c7ba93d4-9eb8-4e09-5fc9-08dcd3d36bed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9034
Message-ID-Hash: VDJL47XQGAIEKIJOP4IKVOX6BCPQABHD
X-Message-ID-Hash: VDJL47XQGAIEKIJOP4IKVOX6BCPQABHD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VDJL47XQGAIEKIJOP4IKVOX6BCPQABHD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename SoundWire endpoint and dai link structures with asoc tag to make it
generic.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index f10ed95770ea..6eeddced1f6f 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -617,7 +617,7 @@ static const struct snd_soc_ops sdw_ops = {
 	.shutdown = asoc_sdw_shutdown,
 };
 
-struct sof_sdw_endpoint {
+struct asoc_sdw_endpoint {
 	struct list_head list;
 
 	u32 link_mask;
@@ -629,7 +629,7 @@ struct sof_sdw_endpoint {
 	const struct asoc_sdw_dai_info *dai_info;
 };
 
-struct sof_sdw_dailink {
+struct asoc_sdw_dailink {
 	bool initialised;
 
 	u8 group_id;
@@ -660,8 +660,8 @@ static int count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *nu
 	return 0;
 }
 
-static struct sof_sdw_dailink *find_dailink(struct sof_sdw_dailink *dailinks,
-					    const struct snd_soc_acpi_endpoint *new)
+static struct asoc_sdw_dailink *find_dailink(struct asoc_sdw_dailink *dailinks,
+					     const struct snd_soc_acpi_endpoint *new)
 {
 	while (dailinks->initialised) {
 		if (new->aggregated && dailinks->group_id == new->group_id)
@@ -678,8 +678,8 @@ static struct sof_sdw_dailink *find_dailink(struct sof_sdw_dailink *dailinks,
 }
 
 static int parse_sdw_endpoints(struct snd_soc_card *card,
-			       struct sof_sdw_dailink *sof_dais,
-			       struct sof_sdw_endpoint *sof_ends,
+			       struct asoc_sdw_dailink *sof_dais,
+			       struct asoc_sdw_endpoint *sof_ends,
 			       int *num_devs)
 {
 	struct device *dev = card->dev;
@@ -687,7 +687,7 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	const struct snd_soc_acpi_link_adr *adr_link;
-	struct sof_sdw_endpoint *sof_end = sof_ends;
+	struct asoc_sdw_endpoint *sof_end = sof_ends;
 	int num_dais = 0;
 	int i, j;
 	int ret;
@@ -738,7 +738,7 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 			for (j = 0; j < adr_dev->num_endpoints; j++) {
 				const struct snd_soc_acpi_endpoint *adr_end;
 				const struct asoc_sdw_dai_info *dai_info;
-				struct sof_sdw_dailink *sof_dai;
+				struct asoc_sdw_dailink *sof_dai;
 				int stream;
 
 				adr_end = &adr_dev->endpoints[j];
@@ -799,14 +799,14 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 }
 
 static int create_sdw_dailink(struct snd_soc_card *card,
-			      struct sof_sdw_dailink *sof_dai,
+			      struct asoc_sdw_dailink *sof_dai,
 			      struct snd_soc_dai_link **dai_links,
 			      int *be_id, struct snd_soc_codec_conf **codec_conf)
 {
 	struct device *dev = card->dev;
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
-	struct sof_sdw_endpoint *sof_end;
+	struct asoc_sdw_endpoint *sof_end;
 	int stream;
 	int ret;
 
@@ -845,7 +845,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			continue;
 
 		sof_end = list_first_entry(&sof_dai->endpoints,
-					   struct sof_sdw_endpoint, list);
+					   struct asoc_sdw_endpoint, list);
 
 		*be_id = sof_end->dai_info->dailink[stream];
 		if (*be_id < 0) {
@@ -936,7 +936,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 static int create_sdw_dailinks(struct snd_soc_card *card,
 			       struct snd_soc_dai_link **dai_links, int *be_id,
-			       struct sof_sdw_dailink *sof_dais,
+			       struct asoc_sdw_dailink *sof_dais,
 			       struct snd_soc_codec_conf **codec_conf)
 {
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -1104,8 +1104,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	struct snd_soc_codec_conf *codec_conf;
 	struct asoc_sdw_codec_info *ssp_info;
-	struct sof_sdw_endpoint *sof_ends;
-	struct sof_sdw_dailink *sof_dais;
+	struct asoc_sdw_endpoint *sof_ends;
+	struct asoc_sdw_dailink *sof_dais;
 	int num_devs = 0;
 	int num_ends = 0;
 	struct snd_soc_dai_link *dai_links;
-- 
2.34.1

