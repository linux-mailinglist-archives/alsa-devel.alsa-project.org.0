Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50300977BE2
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 11:09:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BAA2E69;
	Fri, 13 Sep 2024 11:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BAA2E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726218545;
	bh=8X0aIkHeooPN2xRbL9E65bAn/BprQbpEzSfFWpcwO6k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IFmImEYTZbOVniHsBkTjYp85vt0vh9+VQZSH7xhz4W7vlHmkd1OW7NpkgGls3eOC/
	 1RiaFTk4UbUh5TnHNqJPUsArK2M1Ljo97PmGTtb7ocKXOkE52UOXgvKMHnD/dyqeQG
	 PIao9Cf+j8tI89olhvFocuufpmByj6bl/aQagMPw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEC26F8065E; Fri, 13 Sep 2024 11:07:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BDEFF8065C;
	Fri, 13 Sep 2024 11:07:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEFB5F805AB; Fri, 13 Sep 2024 11:07:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9375DF8060D
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 11:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9375DF8060D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UKtCONg5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKmVwCTCOOaepSd5wEb7krGdOAzai3iKiJ6S1Tr4VwLovJ4kN1CPmeoSiaD9Qj57TZSzMBhyAgWV8Zzpix072QFDYTmqMB4pHsp7zNV6cIm0T6Ga/8bCOPlDOAAdiGvyrnplNwVfSJHLRSRUpnIMmd4OEcUPOrhVbMM51Drc/AFgvSPj7ADWtCgN4siJ8muIWCMPR4VT4e8EBLZzXlkwMIFqc7hblB6fuAH7mmHKp09bpJFFwaYrlzve80hAyYh01RlsjzQCa/rICtjRgbpG852BiqkFSNDHTcoQw+JQfYohqG+Fl233z96dE23K+dHQV6CLkhpU4YBk+Fxzm+P1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eg9agBLp2CJDujLSJNf1qgNzRtrS1AFfrWUygIPzwPw=;
 b=uZDcqRAbCVqwkfGrPgVGRb3VpcqqEzHFcbrFBGoc4Hxt1ozbmEP43eBRKPQXVuJINDFnJ35A1qgfNaiCFDu9Imjez2cCIzFCOS8RIrxTDxTeRaNniYlGafelkXVqo6HW661oeIWZGotc2AZ8Ciq31lbVP5t0amPRfTqyqyZuTbK/XUAUyk4ga/tjaFZ/j9WHe4K9AWzl9r76Itz/znC2nXPdTpChma4muHpLN1ZpLB1WSkDthGHd9Aya4Aj+N3Od5aao6WCs6qPBYoQ3TkIrAEfXWIrpwlcolF1h6MRevJythrsazRNYmRm0N2CQgncHcOMS9FCeoeBhh0mvrajrdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eg9agBLp2CJDujLSJNf1qgNzRtrS1AFfrWUygIPzwPw=;
 b=UKtCONg5DqDvdEz4xAVFUs54Kugxyv6ljtb+5mpzlMhrBXYRkRD6gFdUx95Ql2sTRCLiRmw1wE2ifh6i6Er1YJDZZYWJDEBNiV9QWyVAHmTJyxZUL8Z4wFwAL34NYWMVMI3u7KObYE08UhnnjnkJYUtz36I5y9QwF8Bu0wEn5J0=
Received: from DS7PR06CA0004.namprd06.prod.outlook.com (2603:10b6:8:2a::19) by
 MW4PR12MB5625.namprd12.prod.outlook.com (2603:10b6:303:168::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.27; Fri, 13 Sep 2024 09:07:19 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:8:2a:cafe::d3) by DS7PR06CA0004.outlook.office365.com
 (2603:10b6:8:2a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26 via Frontend
 Transport; Fri, 13 Sep 2024 09:07:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 09:07:18 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 04:07:11 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <kai.vehmanen@linux.intel.com>,
	<ckeepax@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 5/5] ASoC: amd: acp: refactor SoundWire machine driver code
Date: Fri, 13 Sep 2024 14:36:31 +0530
Message-ID: <20240913090631.1834543-6-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|MW4PR12MB5625:EE_
X-MS-Office365-Filtering-Correlation-Id: aca866b1-3bb0-4d8a-d244-08dcd3d37842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|7416014|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?r661I9huaQx3zWm49JWMNQdlQawbdcBAEb/++KASe1AQNkUPI6LbkX8RH7Aj?=
 =?us-ascii?Q?04nKVkd+0SsomI8FLltmeDtnravopJEzPixhOtdbsgLfSjIatGfbgAlv+Lgv?=
 =?us-ascii?Q?BNMvW4PeyAUPzzN1pyRsKo124bogxqC+hKU34+NXLERJrz3XIThHG9uNBwQi?=
 =?us-ascii?Q?XUJL4MuXm0L5zjKhJ+52JUZrwx2/Ln1iW6yhXRaF6S83qRYXhjnu/YUbbByn?=
 =?us-ascii?Q?vj42aBirvLvA3UlviW2QD/pkyo/dThUuHkPS+LkQpPnqw38aCdH/PctV3grd?=
 =?us-ascii?Q?adeIKFQDBzx1Cz7Y1IrX0BVoJPdx82AAPjZJhiSeVJDGuFbeAL6OGIN6ankw?=
 =?us-ascii?Q?G1rXCTv5nf8u24oQkUuh/ECcfG7enGwHVwbxs96tnKAtjQy3OwXrPcf4P3aB?=
 =?us-ascii?Q?pA6T7nsusbVrGO1XCxQvbLQJD2DzJMnn/6EeVk/l72GCLNiy44OZ6EPEAJm0?=
 =?us-ascii?Q?bRphjFvC/b3oKxMJIx853FS2GLJE+5tCY+vCXXSidiVCtU6sUQkRXL/gAGNb?=
 =?us-ascii?Q?A2XOXraWHmBoPwUKuCFcbGOBW5CBcCqTHg3Rrqzva3uQ+B7N9CKqQPWiuKCH?=
 =?us-ascii?Q?IvzxBtJWP2zG0JeH5owBVjGPypi1yyzgnrepktoBocv9p+ZY2b0NTSov5xO0?=
 =?us-ascii?Q?liZdr4HONRD2az0UU7gQkNso2y47nD0YBntO2781POYMBRqpVS/LPhl7ZCxG?=
 =?us-ascii?Q?oW74NMWv/P3JPhVBPOP94PXXU/TAxkDwGtzWFnsveDAbCmaAVwBKJX9YAiuI?=
 =?us-ascii?Q?5AMF4/wwhP36JnSqyysgmM2y/n6cdFyuUpuUJVYjkMr/1KC5q3anRrAhY3e7?=
 =?us-ascii?Q?3IbkpJT5+q3FwF0m7fn3TuTieUxtaXkGwj1ZVZKvxNHlMI9rUsuBS5VtOHXQ?=
 =?us-ascii?Q?wkWQ8BqAMLqnHezNscUZIfUNKKLP+NHqZq+Yj/pzd0tIl0REIPdiNByTxIAu?=
 =?us-ascii?Q?3WSG0bHhjpj5Rsse9Q/Z8+uS19iby32+2SX8Eo3+7FGQzsDUSjcK26BJ0Adb?=
 =?us-ascii?Q?wcvgJIll2FiFgwKmqjTbOxaUMx2DfPLWGh6CYcBtxLS1KoS1TdaNHknQIJ9m?=
 =?us-ascii?Q?RwF/oYMHWruZf93UVXf9+rahc8G1HwkcgXDRlj7Jfpl8pmTiYKkC0V6ppHOU?=
 =?us-ascii?Q?rFTT/7JLFYrUT+N5TbRgsG46ymrgAL4yXiKXPFxNdgmn2FefbLw1tGwfkV/4?=
 =?us-ascii?Q?zMwlKURl3zET/VQHENGL4CCATPRlClJ+qqnvMktiJtmL+PsLFm44evONVJ4d?=
 =?us-ascii?Q?EBii22inXRD9F3tY+FacuCo0fe43qy3ogbyq6/Vkobd8Ajxrs63IzvTs3ysF?=
 =?us-ascii?Q?AwfIF+Sjdk2LhUMeNi9mr+qIAJ3TkQ1dWdtU5KpgSh4qCJgACvVf1arSE6+t?=
 =?us-ascii?Q?tH+P6O2RbJC3MPWNOooEjHmtBVIRU0SsCjbvGkRKXXbMvS/ukNkj3qgQRaqT?=
 =?us-ascii?Q?AzremGXZuBxJlV2E0ca1Tb5je2Q6k2hN?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 09:07:18.7098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aca866b1-3bb0-4d8a-d244-08dcd3d37842
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5625
Message-ID-Hash: 7NJ4N7FJT2YUU4HQ3E5ULFQXYAGISK5F
X-Message-ID-Hash: 7NJ4N7FJT2YUU4HQ3E5ULFQXYAGISK5F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7NJ4N7FJT2YUU4HQ3E5ULFQXYAGISK5F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor Soundwire machine driver code by using common SoundWire
endpoint parsing helper functions.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 540 ++++++++-------------------
 1 file changed, 154 insertions(+), 386 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index b1cd173f607d..6c50c8276538 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -64,197 +64,6 @@ static const struct snd_soc_ops sdw_ops = {
 	.shutdown = asoc_sdw_shutdown,
 };
 
-/*
- * get BE dailink number and CPU DAI number based on sdw link adr.
- * Since some sdw slaves may be aggregated, the CPU DAI number
- * may be larger than the number of BE dailinks.
- */
-static int get_dailink_info(struct device *dev,
-			    const struct snd_soc_acpi_link_adr *adr_link,
-			    int *sdw_be_num, int *codecs_num)
-{
-	bool group_visited[AMD_SDW_MAX_GROUPS];
-	int i;
-	int j;
-
-	*sdw_be_num  = 0;
-
-	if (!adr_link)
-		return -EINVAL;
-
-	for (i = 0; i < AMD_SDW_MAX_GROUPS; i++)
-		group_visited[i] = false;
-
-	for (; adr_link->num_adr; adr_link++) {
-		const struct snd_soc_acpi_endpoint *endpoint;
-		struct asoc_sdw_codec_info *codec_info;
-		int stream;
-		u64 adr;
-
-		/* make sure the link mask has a single bit set */
-		if (!is_power_of_2(adr_link->mask))
-			return -EINVAL;
-
-		for (i = 0; i < adr_link->num_adr; i++) {
-			adr = adr_link->adr_d[i].adr;
-			codec_info = asoc_sdw_find_codec_info_part(adr);
-			if (!codec_info)
-				return -EINVAL;
-
-			*codecs_num += codec_info->dai_num;
-
-			if (!adr_link->adr_d[i].name_prefix) {
-				dev_err(dev, "codec 0x%llx does not have a name prefix\n",
-					adr_link->adr_d[i].adr);
-				return -EINVAL;
-			}
-
-			endpoint = adr_link->adr_d[i].endpoints;
-			if (endpoint->aggregated && !endpoint->group_id) {
-				dev_err(dev, "invalid group id on link %x\n",
-					adr_link->mask);
-				return -EINVAL;
-			}
-
-			for (j = 0; j < codec_info->dai_num; j++) {
-				/* count DAI number for playback and capture */
-				for_each_pcm_streams(stream) {
-					if (!codec_info->dais[j].direction[stream])
-						continue;
-
-					/* count BE for each non-aggregated slave or group */
-					if (!endpoint->aggregated ||
-					    !group_visited[endpoint->group_id])
-						(*sdw_be_num)++;
-				}
-			}
-
-			if (endpoint->aggregated)
-				group_visited[endpoint->group_id] = true;
-		}
-	}
-	return 0;
-}
-
-static int fill_sdw_codec_dlc(struct device *dev,
-			      const struct snd_soc_acpi_link_adr *adr_link,
-			      struct snd_soc_dai_link_component *codec,
-			      int adr_index, int dai_index)
-{
-	u64 adr = adr_link->adr_d[adr_index].adr;
-	struct asoc_sdw_codec_info *codec_info;
-
-	codec_info = asoc_sdw_find_codec_info_part(adr);
-	if (!codec_info)
-		return -EINVAL;
-
-	codec->name = asoc_sdw_get_codec_name(dev, codec_info, adr_link, adr_index);
-	if (!codec->name)
-		return -ENOMEM;
-
-	codec->dai_name = codec_info->dais[dai_index].dai_name;
-	dev_err(dev, "codec->dai_name:%s\n", codec->dai_name);
-	return 0;
-}
-
-static int set_codec_init_func(struct snd_soc_card *card,
-			       const struct snd_soc_acpi_link_adr *adr_link,
-			       struct snd_soc_dai_link *dai_links,
-			       bool playback, int group_id, int adr_index, int dai_index)
-{
-	int i = adr_index;
-
-	do {
-		/*
-		 * Initialize the codec. If codec is part of an aggregated
-		 * group (group_id>0), initialize all codecs belonging to
-		 * same group.
-		 * The first link should start with adr_link->adr_d[adr_index]
-		 * because that is the device that we want to initialize and
-		 * we should end immediately if it is not aggregated (group_id=0)
-		 */
-		for ( ; i < adr_link->num_adr; i++) {
-			struct asoc_sdw_codec_info *codec_info;
-
-			codec_info = asoc_sdw_find_codec_info_part(adr_link->adr_d[i].adr);
-			if (!codec_info)
-				return -EINVAL;
-
-			/* The group_id is > 0 iff the codec is aggregated */
-			if (adr_link->adr_d[i].endpoints->group_id != group_id)
-				continue;
-			if (codec_info->dais[dai_index].init)
-				codec_info->dais[dai_index].init(card,
-								 dai_links,
-								 codec_info,
-								 playback);
-
-			if (!group_id)
-				return 0;
-		}
-
-		i = 0;
-		adr_link++;
-	} while (adr_link->mask);
-
-	return 0;
-}
-
-/*
- * check endpoint status in slaves and gather link ID for all slaves in
- * the same group to generate different CPU DAI. Now only support
- * one sdw link with all slaves set with only single group id.
- *
- * one slave on one sdw link with aggregated = 0
- * one sdw BE DAI <---> one-cpu DAI <---> one-codec DAI
- *
- * two or more slaves on one sdw link with aggregated = 1
- * one sdw BE DAI  <---> one-cpu DAI <---> multi-codec DAIs
- */
-static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
-			  struct device *dev, int *cpu_dai_id, int *cpu_dai_num,
-			  int *codec_num, unsigned int *group_id,
-			  int adr_index)
-{
-	int i;
-
-	if (!adr_link->adr_d[adr_index].endpoints->aggregated) {
-		cpu_dai_id[0] = ffs(adr_link->mask) - 1;
-		*cpu_dai_num = 1;
-		*codec_num = 1;
-		*group_id = 0;
-		return 0;
-	}
-
-	*codec_num = 0;
-	*cpu_dai_num = 0;
-	*group_id = adr_link->adr_d[adr_index].endpoints->group_id;
-
-	/* Count endpoints with the same group_id in the adr_link */
-	for (; adr_link && adr_link->num_adr; adr_link++) {
-		unsigned int link_codecs = 0;
-
-		for (i = 0; i < adr_link->num_adr; i++) {
-			if (adr_link->adr_d[i].endpoints->aggregated &&
-			    adr_link->adr_d[i].endpoints->group_id == *group_id)
-				link_codecs++;
-		}
-
-		if (link_codecs) {
-			*codec_num += link_codecs;
-
-			if (*cpu_dai_num >= ACP63_SDW_MAX_CPU_DAIS) {
-				dev_err(dev, "cpu_dai_id array overflowed\n");
-				return -EINVAL;
-			}
-
-			cpu_dai_id[(*cpu_dai_num)++] = ffs(adr_link->mask) - 1;
-		}
-	}
-
-	return 0;
-}
-
 static int get_acp63_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev)
 {
 	switch (sdw_link_id) {
@@ -306,116 +115,64 @@ static int get_acp63_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, str
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
 
 static int create_sdw_dailink(struct snd_soc_card *card,
+			      struct asoc_sdw_dailink *sof_dai,
 			      struct snd_soc_dai_link **dai_links,
-			      const struct snd_soc_acpi_link_adr *adr_link,
-			      struct snd_soc_codec_conf **codec_conf,
-			      int *be_id, int adr_index, int dai_index)
+			      int *be_id, struct snd_soc_codec_conf **codec_conf)
 {
+	struct device *dev = card->dev;
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct amd_mc_ctx *amd_ctx = (struct amd_mc_ctx *)ctx->private;
-	struct device *dev = card->dev;
-	const struct snd_soc_acpi_link_adr *adr_link_next;
-	struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps;
-	struct snd_soc_dai_link_component *codecs;
-	struct snd_soc_dai_link_component *cpus;
-	struct asoc_sdw_codec_info *codec_info;
-	int cpu_dai_id[ACP63_SDW_MAX_CPU_DAIS];
-	int cpu_dai_num;
-	unsigned int group_id;
-	unsigned int sdw_link_id;
-	int codec_dlc_index = 0;
-	int codec_num;
+	struct asoc_sdw_endpoint *sof_end;
+	int cpu_pin_id;
 	int stream;
-	int i = 0;
-	int j, k;
 	int ret;
-	int cpu_pin_id;
-
-	ret = get_slave_info(adr_link, dev, cpu_dai_id, &cpu_dai_num, &codec_num,
-			     &group_id, adr_index);
-	if (ret)
-		return ret;
-	codecs = devm_kcalloc(dev, codec_num, sizeof(*codecs), GFP_KERNEL);
-	if (!codecs)
-		return -ENOMEM;
 
-	sdw_codec_ch_maps = devm_kcalloc(dev, codec_num,
-					 sizeof(*sdw_codec_ch_maps), GFP_KERNEL);
-	if (!sdw_codec_ch_maps)
-		return -ENOMEM;
-
-	/* generate codec name on different links in the same group */
-	j = adr_index;
-	for (adr_link_next = adr_link; adr_link_next && adr_link_next->num_adr &&
-	     i < cpu_dai_num; adr_link_next++) {
-		/* skip the link excluded by this processed group */
-		if (cpu_dai_id[i] != ffs(adr_link_next->mask) - 1)
-			continue;
-
-		/* j reset after loop, adr_index only applies to first link */
-		for (k = 0 ; (j < adr_link_next->num_adr) && (k < codec_num) ; j++, k++) {
-			const struct snd_soc_acpi_endpoint *endpoints;
-
-			endpoints = adr_link_next->adr_d[j].endpoints;
-			if (group_id && (!endpoints->aggregated ||
-					 endpoints->group_id != group_id))
-				continue;
-
-			/* sanity check */
-			if (*codec_conf >= card->codec_conf + card->num_configs) {
-				dev_err(dev, "codec_conf array overflowed\n");
-				return -EINVAL;
-			}
+	list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
+		if (sof_end->name_prefix) {
+			(*codec_conf)->dlc.name = sof_end->codec_name;
+			(*codec_conf)->name_prefix = sof_end->name_prefix;
+			(*codec_conf)++;
+		}
 
-			ret = fill_sdw_codec_dlc(dev, adr_link_next,
-						 &codecs[codec_dlc_index],
-						 j, dai_index);
+		if (sof_end->include_sidecar) {
+			ret = sof_end->codec_info->add_sidecar(card, dai_links, codec_conf);
 			if (ret)
 				return ret;
-			(*codec_conf)->dlc = codecs[codec_dlc_index];
-			(*codec_conf)->name_prefix = adr_link_next->adr_d[j].name_prefix;
-
-			sdw_codec_ch_maps[codec_dlc_index].cpu = i;
-			sdw_codec_ch_maps[codec_dlc_index].codec = codec_dlc_index;
-
-			codec_dlc_index++;
-			(*codec_conf)++;
 		}
-		j = 0;
-
-		/* check next link to create codec dai in the processed group */
-		i++;
 	}
 
-	/* find codec info to create BE DAI */
-	codec_info = asoc_sdw_find_codec_info_part(adr_link->adr_d[adr_index].adr);
-	if (!codec_info)
-		return -EINVAL;
-
-	ctx->ignore_internal_dmic |= codec_info->ignore_internal_dmic;
-
-	sdw_link_id = (adr_link->adr_d[adr_index].adr) >> 48;
 	for_each_pcm_streams(stream) {
-		char *name, *cpu_name;
-		int playback, capture;
 		static const char * const sdw_stream_name[] = {
 			"SDW%d-PIN%d-PLAYBACK",
 			"SDW%d-PIN%d-CAPTURE",
 			"SDW%d-PIN%d-PLAYBACK-%s",
 			"SDW%d-PIN%d-CAPTURE-%s",
 		};
+		struct snd_soc_dai_link_ch_map *codec_maps;
+		struct snd_soc_dai_link_component *codecs;
+		struct snd_soc_dai_link_component *cpus;
+		int num_cpus = hweight32(sof_dai->link_mask[stream]);
+		int num_codecs = sof_dai->num_devs[stream];
+		int playback, capture;
+		int i = 0, j = 0;
+		char *name;
 
-		if (!codec_info->dais[dai_index].direction[stream])
+		if (!sof_dai->num_devs[stream])
 			continue;
 
-		*be_id = codec_info->dais[dai_index].dailink[stream];
+		sof_end = list_first_entry(&sof_dai->endpoints,
+					   struct asoc_sdw_endpoint, list);
+
+		*be_id = sof_end->dai_info->dailink[stream];
 		if (*be_id < 0) {
 			dev_err(dev, "Invalid dailink id %d\n", *be_id);
 			return -EINVAL;
 		}
+
 		switch (amd_ctx->acp_rev) {
 		case ACP63_PCI_REV:
-			ret = get_acp63_cpu_pin_id(sdw_link_id, *be_id, &cpu_pin_id, dev);
+			ret = get_acp63_cpu_pin_id(ffs(sof_end->link_mask - 1),
+						   *be_id, &cpu_pin_id, dev);
 			if (ret)
 				return ret;
 			break;
@@ -425,55 +182,105 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		/* create stream name according to first link id */
 		if (ctx->append_dai_type) {
 			name = devm_kasprintf(dev, GFP_KERNEL,
-					      sdw_stream_name[stream + 2], sdw_link_id, cpu_pin_id,
-					      type_strings[codec_info->dais[dai_index].dai_type]);
+					      sdw_stream_name[stream + 2],
+					      ffs(sof_end->link_mask) - 1,
+					      cpu_pin_id,
+					      type_strings[sof_end->dai_info->dai_type]);
 		} else {
 			name = devm_kasprintf(dev, GFP_KERNEL,
-					      sdw_stream_name[stream], sdw_link_id, cpu_pin_id);
+					      sdw_stream_name[stream],
+					      ffs(sof_end->link_mask) - 1,
+					      cpu_pin_id);
 		}
 		if (!name)
 			return -ENOMEM;
 
-		cpus = devm_kcalloc(dev, cpu_dai_num, sizeof(*cpus), GFP_KERNEL);
+		cpus = devm_kcalloc(dev, num_cpus, sizeof(*cpus), GFP_KERNEL);
 		if (!cpus)
 			return -ENOMEM;
-		/*
-		 * generate CPU DAI name base on the sdw link ID and
-		 * cpu pin id according to sdw dai driver.
-		 */
-		for (k = 0; k < cpu_dai_num; k++) {
-			cpu_name = devm_kasprintf(dev, GFP_KERNEL,
-						  "SDW%d Pin%d", sdw_link_id, cpu_pin_id);
-			if (!cpu_name)
+
+		codecs = devm_kcalloc(dev, num_codecs, sizeof(*codecs), GFP_KERNEL);
+		if (!codecs)
+			return -ENOMEM;
+
+		codec_maps = devm_kcalloc(dev, num_codecs, sizeof(*codec_maps), GFP_KERNEL);
+		if (!codec_maps)
+			return -ENOMEM;
+
+		list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
+			if (!sof_end->dai_info->direction[stream])
+				continue;
+
+			int link_num = ffs(sof_end->link_mask) - 1;
+
+			cpus[i].dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							  "SDW%d Pin%d",
+							  link_num, cpu_pin_id);
+			dev_dbg(dev, "cpu[%d].dai_name:%s\n", i, cpus[i].dai_name);
+			if (!cpus[i].dai_name)
 				return -ENOMEM;
 
-			cpus[k].dai_name = cpu_name;
+			codec_maps[j].cpu = i;
+			codec_maps[j].codec = j;
+
+			codecs[j].name = sof_end->codec_name;
+			codecs[j].dai_name = sof_end->dai_info->dai_name;
+			j++;
 		}
 
+		WARN_ON(j != num_codecs);
+
 		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
 		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
-		asoc_sdw_init_dai_link(dev, *dai_links, be_id, name,
-				       playback, capture,
-				       cpus, cpu_dai_num,
-				       platform_component, ARRAY_SIZE(platform_component),
-				       codecs, codec_num,
+
+		asoc_sdw_init_dai_link(dev, *dai_links, be_id, name, playback, capture,
+				       cpus, num_cpus, platform_component,
+				       ARRAY_SIZE(platform_component), codecs, num_codecs,
 				       asoc_sdw_rtd_init, &sdw_ops);
+
 		/*
 		 * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
 		 * based on wait_for_completion(), tag them as 'nonatomic'.
 		 */
 		(*dai_links)->nonatomic = true;
-		(*dai_links)->ch_maps = sdw_codec_ch_maps;
+		(*dai_links)->ch_maps = codec_maps;
 
-		ret = set_codec_init_func(card, adr_link, *dai_links,
-					  playback, group_id, adr_index, dai_index);
-		if (ret < 0) {
-			dev_err(dev, "failed to init codec 0x%x\n", codec_info->part_id);
-			return ret;
+		list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
+			if (sof_end->dai_info->init)
+				sof_end->dai_info->init(card, *dai_links,
+							sof_end->codec_info,
+							playback);
 		}
 
 		(*dai_links)++;
 	}
+
+	return 0;
+}
+
+static int create_sdw_dailinks(struct snd_soc_card *card,
+			       struct snd_soc_dai_link **dai_links, int *be_id,
+			       struct asoc_sdw_dailink *sof_dais,
+			       struct snd_soc_codec_conf **codec_conf)
+{
+	int ret;
+
+	/* generate DAI links by each sdw link */
+	while (sof_dais->initialised) {
+		int current_be_id;
+
+		ret = create_sdw_dailink(card, sof_dais, dai_links,
+					 &current_be_id, codec_conf);
+		if (ret)
+			return ret;
+
+		/* Update the be_id to match the highest ID used for SDW link */
+		if (*be_id < current_be_id)
+			*be_id = current_be_id;
+
+		sof_dais++;
+	}
+
 	return 0;
 }
 
@@ -504,132 +311,93 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	int sdw_be_num = 0, dmic_num = 0;
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
-	const struct snd_soc_acpi_link_adr *adr_link = mach_params->links;
 	struct snd_soc_codec_conf *codec_conf;
-	int codec_conf_num = 0;
-	bool group_generated[AMD_SDW_MAX_GROUPS] = { };
+	struct asoc_sdw_endpoint *sof_ends;
+	struct asoc_sdw_dailink *sof_dais;
 	struct snd_soc_dai_link *dai_links;
-	struct asoc_sdw_codec_info *codec_info;
+	int num_devs = 0;
+	int num_ends = 0;
 	int num_links;
-	int i, j, be_id = 0;
+	int be_id = 0;
 	int ret;
 
-	ret = get_dailink_info(dev, adr_link, &sdw_be_num, &codec_conf_num);
+	ret = asoc_sdw_count_sdw_endpoints(card, &num_devs, &num_ends);
 	if (ret < 0) {
-		dev_err(dev, "failed to get sdw link info %d\n", ret);
+		dev_err(dev, "failed to count devices/endpoints: %d\n", ret);
 		return ret;
 	}
 
+	/* One per DAI link, worst case is a DAI link for every endpoint */
+	sof_dais = kcalloc(num_ends, sizeof(*sof_dais), GFP_KERNEL);
+	if (!sof_dais)
+		return -ENOMEM;
+
+	/* One per endpoint, ie. each DAI on each codec/amp */
+	sof_ends = kcalloc(num_ends, sizeof(*sof_ends), GFP_KERNEL);
+	if (!sof_ends) {
+		ret = -ENOMEM;
+		goto err_dai;
+	}
+
+	ret = asoc_sdw_parse_sdw_endpoints(card, sof_dais, sof_ends, &num_devs);
+	if (ret < 0)
+		goto err_end;
+
+	sdw_be_num = ret;
+
 	/* enable dmic */
 	if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num)
 		dmic_num = 1;
 
 	dev_dbg(dev, "sdw %d, dmic %d", sdw_be_num, dmic_num);
 
+	codec_conf = devm_kcalloc(dev, num_devs, sizeof(*codec_conf), GFP_KERNEL);
+	if (!codec_conf) {
+		ret = -ENOMEM;
+		goto err_end;
+	}
+
 	/* allocate BE dailinks */
 	num_links = sdw_be_num + dmic_num;
 	dai_links = devm_kcalloc(dev, num_links, sizeof(*dai_links), GFP_KERNEL);
-	if (!dai_links)
-		return -ENOMEM;
-
-	/* allocate codec conf, will be populated when dailinks are created */
-	codec_conf = devm_kcalloc(dev, codec_conf_num, sizeof(*codec_conf),
-				  GFP_KERNEL);
-	if (!codec_conf)
-		return -ENOMEM;
+	if (!dai_links) {
+		ret = -ENOMEM;
+	goto err_end;
+	}
 
+	card->codec_conf = codec_conf;
+	card->num_configs = num_devs;
 	card->dai_link = dai_links;
 	card->num_links = num_links;
-	card->codec_conf = codec_conf;
-	card->num_configs = codec_conf_num;
 
 	/* SDW */
-	if (!sdw_be_num)
-		goto DMIC;
-
-	for (; adr_link->num_adr; adr_link++) {
-		/*
-		 * If there are two or more different devices on the same sdw link, we have to
-		 * append the codec type to the dai link name to prevent duplicated dai link name.
-		 * The same type devices on the same sdw link will be in the same
-		 * snd_soc_acpi_adr_device array. They won't be described in different adr_links.
-		 */
-		for (i = 0; i < adr_link->num_adr; i++) {
-			/* find codec info to get dai_num */
-			codec_info = asoc_sdw_find_codec_info_part(adr_link->adr_d[i].adr);
-			if (!codec_info)
-				return -EINVAL;
-			if (codec_info->dai_num > 1) {
-				ctx->append_dai_type = true;
-				goto out;
-			}
-			for (j = 0; j < i; j++) {
-				if ((SDW_PART_ID(adr_link->adr_d[i].adr) !=
-				    SDW_PART_ID(adr_link->adr_d[j].adr)) ||
-				    (SDW_MFG_ID(adr_link->adr_d[i].adr) !=
-				    SDW_MFG_ID(adr_link->adr_d[j].adr))) {
-					ctx->append_dai_type = true;
-					goto out;
-				}
-			}
-		}
-	}
-out:
-
-	/* generate DAI links by each sdw link */
-	for (adr_link = mach_params->links ; adr_link->num_adr; adr_link++) {
-		for (i = 0; i < adr_link->num_adr; i++) {
-			const struct snd_soc_acpi_endpoint *endpoint;
-
-			endpoint = adr_link->adr_d[i].endpoints;
-
-			/* this group has been generated */
-			if (endpoint->aggregated &&
-			    group_generated[endpoint->group_id])
-				continue;
-
-			/* find codec info to get dai_num */
-			codec_info = asoc_sdw_find_codec_info_part(adr_link->adr_d[i].adr);
-			if (!codec_info)
-				return -EINVAL;
-
-			for (j = 0; j < codec_info->dai_num ; j++) {
-				int current_be_id;
-
-				ret = create_sdw_dailink(card, &dai_links, adr_link,
-							 &codec_conf, &current_be_id,
-							 i, j);
-				if (ret < 0) {
-					dev_err(dev,
-						"failed to create dai link %d on 0x%x\n",
-						j, codec_info->part_id);
-					return ret;
-				}
-				/* Update the be_id to match the highest ID used for SDW link */
-				if (be_id < current_be_id)
-					be_id = current_be_id;
-			}
-
-			if (endpoint->aggregated)
-				group_generated[endpoint->group_id] = true;
-		}
+	if (sdw_be_num) {
+		ret = create_sdw_dailinks(card, &dai_links, &be_id,
+					  sof_dais, &codec_conf);
+		if (ret)
+			goto err_end;
 	}
 
-DMIC:
 	/* dmic */
 	if (dmic_num > 0) {
 		if (ctx->ignore_internal_dmic) {
 			dev_warn(dev, "Ignoring ACP DMIC\n");
 		} else {
-			be_id = SOC_SDW_DMIC_DAI_ID;
 			ret = create_dmic_dailinks(card, &dai_links, &be_id);
 			if (ret)
-				return ret;
+				goto err_end;
 		}
 	}
 
+	WARN_ON(codec_conf != card->codec_conf + card->num_configs);
 	WARN_ON(dai_links != card->dai_link + card->num_links);
-	return 0;
+
+err_end:
+	kfree(sof_ends);
+err_dai:
+	kfree(sof_dais);
+
+	return ret;
 }
 
 /* SoC card */
-- 
2.34.1

