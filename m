Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56331797334
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 17:05:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 577C5A4D;
	Thu,  7 Sep 2023 17:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 577C5A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694099105;
	bh=gFCnNZD7o1l3qb/7yq6PosDTDfVeMzQRZKkwPs5UEgY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LRC0ANZwLkszFd+Mb/pDqT6Nigen2E2w6CCi5d0/zLTqRuIb7nFi0pDNRxiJNKBWI
	 ZAZnGGNqcbslWnmJ66B58ieRWXyTM+91sWL2cuMeHiG6ghZr8bGq78yovfwkrVoIUa
	 q1VdMvRfKZeoeHaCDDU1sWHTpeXJeAs3uaQWS49M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18D4EF80570; Thu,  7 Sep 2023 17:03:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44A5BF80527;
	Thu,  7 Sep 2023 17:03:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 362AEF80558; Thu,  7 Sep 2023 17:03:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C47EF800F5
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 17:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C47EF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=US4WvoIA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAtgJlQpWhMSz2vrhfMzxA+EhjeeY9IIL9NYlcxB5wTDGBjCL932BduKPFTEoTfEB6XCU5FeSM3s2/d9QZtqTh3+BC1UuV7yVb4WJMsJHR/xBdsiyDfd13trtI2aDrStS9dK2WEZ1/ML/J0NxNj2cnEeoSkE+maz+qxQIaeBagdDsHNA/L//WW07QPl/gV5QQo7NFEZueHqqepDtbE9vTvhBS/zyBj2f+TmxV4A6dUnmaOuBbUCiupnYy0amQcOBslz3ObecjqVx4e8H8pi5YYKWC10vgrtI8VJ9ihbtlrY/kpzg87CGpZGWZg16pERyRS896n8Cf9FH2MWXZ3rtqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kVFG9hpI+YmUWV8Hlh3TxMYawQLy8lxnR7+ocvn0U0=;
 b=Abls5113swVWpxjhFerQ/ofjamTtN8Dnu+jv98IjKbchLxM6KjLT1q2glM+2JjJ3BviuLM1bSO5bqfFMnzZFtmHVo75qcXSa0YZAfO4LrwCFbva9mZDQBXbQsbQr1yZ8soQAopw5kdwic6BMymQy8pMo1ktTgLiXuZd9ySNudvkS0KmvZpWdxDi5KZ6NUVkQyeIXEn8YcDBLlc34t02bMqPlBa56z97vyop9jIey7ZjaPDA93l99Sbw6/SRR7maG63SXA0kzyRG3Hq7BC12YW4G0lTuavxjK4rJmcEhjY0bIiuRIgx3+DmLNA4pEfDHvPCnYNn7vmgDRYFcjaZK/Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kVFG9hpI+YmUWV8Hlh3TxMYawQLy8lxnR7+ocvn0U0=;
 b=US4WvoIAsUoCTzxlPvdrg7+GIhc+9ze/CLtrBQ0l4TGVg24pf8rbgcwYm3q7pIUiPJSXFb0pbS/8Yv//LzQ1Lb+JZ9LA4Ye+4oC2PDy7SKp6Y09hRGg0mNHbiID3DVY5iwedn3RwcFfqIOAFV5CKaqoJ6KAWSGUhY2mVQPMa2wXUJuAWWAVOsI8N1J0NLssUJunWRDrDB0VHPEDj8ZvtbJn31e+E8YP3Jhtz0W4l9EVFI0hpU1RuICZ+gdLMkX24Eur/USnM/44pFdYnX8XXdOLpq9lzqE0nnwo3CAb+GUommfhEnaYJojpW8RTvrjBT7qLL6coE3CO49wCocdVamQ==
Received: from DS7PR05CA0027.namprd05.prod.outlook.com (2603:10b6:5:3b9::32)
 by PH7PR12MB8155.namprd12.prod.outlook.com (2603:10b6:510:2b2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 15:03:15 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::7f) by DS7PR05CA0027.outlook.office365.com
 (2603:10b6:5:3b9::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.10 via Frontend
 Transport; Thu, 7 Sep 2023 15:03:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.25 via Frontend Transport; Thu, 7 Sep 2023 15:03:14 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 7 Sep 2023
 08:02:53 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Thu, 7 Sep 2023
 08:02:52 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Thu, 7 Sep
 2023 08:02:49 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <spujar@nvidia.com>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
Subject: [PATCH v2 0/2] Fix redundant PLLA update
Date: Thu, 7 Sep 2023 20:32:23 +0530
Message-ID: <1694098945-32760-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|PH7PR12MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: f7ba0939-f7f2-46ee-a2d4-08dbafb38fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ND8PgJisRC6OVkdeXQLxl4UClaSR01tdRlKSoIMKVMm3gNTc22pXtfHB7PVGoGB5mQag3oXjdpNNwJm+eYg5+cth1MqUal/Y+zPAqKKgORQ/3Zf2psrcJoCYT794/HaAJC0CnsJlUr2ia1ZQ/6KcYCD7J55ZtsoktIll56arzLvHbJRC2hrHkuVZPku0EXaOF9n09XQgkRWhru1fwkOTZ8DZ5FVUOtNmnhda2ZhHcHJiqzMGT9ET3kErXLCMCVQ88pvHXrxxAo4ba/yfmnZMP7uvD+AVbyUCC/5LZ/SjzKSNcF65/B7TUa5DAeYbXQWHkA9rJU0kOvSTcoPLZpIjU2BKHf1saV7SSf0YKMQ6AXvTSCTqgGImUYGXhi65uctF+V3yOY7ZeWXdFbWSYIIbvhdc+wpvxg4Lm34uiXHZZFmckbRk7qmn2Z/+D9D5km+x1GV9LG5EIHSfgTzFCruT+8iJwFOlIwARd2OUMw4XbbPQ6aaU66wPss4/AdNehXRGffuZgqODNXseIPbxhU4na3CpxP0L1HOnEJRrREuG615TSb08zOMktXhXGQZijeig8bq5ChveK2Ncha5UDA1PrsnYRmQHHu1FEqJinYYvt1o25yYK0QcuPph6IPuTIiYWSw9KMHQ8PIBSC7cjIQKTFDfCBmAT1G5V15MlhX3fVmc5S3TijQKEPMdv/ptt5Yzo3x0Px8bU9cgb9xSaKyxxNOsIJfTEulBvzes/A/M6cm8=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(186009)(1800799009)(451199024)(82310400011)(40470700004)(46966006)(36840700001)(40480700001)(70586007)(110136005)(70206006)(54906003)(316002)(41300700001)(7636003)(356005)(82740400003)(478600001)(40460700003)(36756003)(2906002)(86362001)(4744005)(15650500001)(8936002)(5660300002)(2616005)(8676002)(4326008)(83380400001)(426003)(336012)(26005)(36860700001)(47076005)(7696005)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 15:03:14.6022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f7ba0939-f7f2-46ee-a2d4-08dbafb38fad
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8155
Message-ID-Hash: 5CX54R3BHMP43MF3TIUGHASUBSFCUCIV
X-Message-ID-Hash: 5CX54R3BHMP43MF3TIUGHASUBSFCUCIV
X-MailFrom: spujar@nvidia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5CX54R3BHMP43MF3TIUGHASUBSFCUCIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This small series fixes redundant PLLA updates that happen for
each DAI link in the audio path. This helps to resolve DMIC clock
issue seen on Jetson TX2 platform.

Sameer Pujar (2):
  ASoC: soc-utils: Export snd_soc_dai_is_dummy() symbol
  ASoC: tegra: Fix redundant PLLA and PLLA_OUT0 updates

 sound/soc/soc-utils.c                    |  1 +
 sound/soc/tegra/tegra_audio_graph_card.c | 30 ++++++++++++++----------
 2 files changed, 18 insertions(+), 13 deletions(-)

-- 
2.17.1

