Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E76B8D00B4
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 14:59:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC0C9845;
	Mon, 27 May 2024 14:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC0C9845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716814785;
	bh=1UbkKerg24OgP5Wpouh2QlVCZ30NkmFBEHR90CtVqUg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HWMfTArlXa73sd4ePeXRxIsDfFlFdZ/bX5NDfx2nDczg/+iNS4xkjnLHMryQ33XQ/
	 STjcTDkqK1HGrSb71cwDEnHWheLbGThM3g18MWk6dRVq2P3/yhGgAVtHHeV79BUKEq
	 Od6xSjrX6q1I8tLVo71bUEgFyv5Ltx+5y4l2w3JA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE5D4F804B2; Mon, 27 May 2024 14:59:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C169EF800AC;
	Mon, 27 May 2024 14:59:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4B8CF80494; Mon, 27 May 2024 14:56:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74B67F800AC
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 14:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74B67F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=gNiqb2Ky
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTveCqg8rqp/jpjYkuRBs8rkWTEYjBWzxmATCRTWP3xYIYMv1pgrGnby5BymJnMx9Dsreq/7V4+lwhZgi1ePEr0+iz277/V5qGLWicl4F+At64JDmQeiV+2xgBBCmMEnEe+0sivM+TitOQ3pFLTJvkCCsZtteotNMaoPbfntXDsTpHUHgcssQmfl/hG0AXxlKjgO2WipE6ZjJ6mtZi0WTURrw9Y026rDCxnqg1v8lFNOp3wwBjAm2gv4ijBUzWRzYmLE2A0AyXpLmsq19tZfKiZMIxtOmfghsgZIFMEp2+35oGXxJlE9RHg2jbqi3pSoI12eCWXnYRr+iFJl+YCVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cp+1iNhoA7u+vZ+GKZHUB/wXoQQ3S6LhOlqOPPyObXg=;
 b=NrU/XfBSNp4NJwMt4OYcUlqnkGUMFXwH3Xkc5xPAjitESxcNOZLU7biNOYSJukmsHOOSQ4Ml8lPPy7mzjVkrlr0k0qjvKFqvzX0hyhfL1cNrJLu56loduYKNuFB6klEPBvgYesIzPwBSEeAbeyr1ovOnGLZeeG0I5KgzLWI8qU5PQZYa+lXAuI3yCQUH3+lx1xEQGxwp7zq5fSYx8Pb1Hi8MuqvtqBIgCrsn1gHsA6llmGUnzt2vC/nsETrAbGA4vOO8jPBSAKq9+xQyt8SXsLbyxa4N9knXXbP1gNvM+NfBIlO09edPNtBkk2rTSm6RK1Po9Ts0G94kLxCPyJvN0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cp+1iNhoA7u+vZ+GKZHUB/wXoQQ3S6LhOlqOPPyObXg=;
 b=gNiqb2KyzHR7Yc7PvKYoKDeZtJ/LEvqM+ZGBSYpXwt3vmlSn88/axJg27vUPhaUPUIeTVHtoBRWRpD1iSaSpCyO6B0hYIfBA7o62yx8kB2XmLKoVyRQSk85j1Y7oEf1nlIOgL7JMsYqLRFlmbi9SveZ+FF6TtkD91iobXUquZHn8cHKomqUkXqM0OE19fQerBeZ4BOG3UO03nhWCIEz/7nAkYn7JTv4ziIc/3glCVKXmMT60O/j/w//l8TfFfT53jYHEtmtICuRjWO1MVMBzGYCKM2KDpieEzQqY2uasD2YnvWdchPL5nJAXwBOsodYyUDuX0CMTgZPgpevgx8sSjg==
Received: from CH3P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::16)
 by DS0PR12MB9275.namprd12.prod.outlook.com (2603:10b6:8:1be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 12:56:33 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::43) by CH3P220CA0014.outlook.office365.com
 (2603:10b6:610:1e8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.53 via Frontend
 Transport; Mon, 27 May 2024 12:56:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Mon, 27 May 2024 12:56:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 05:56:19 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 05:56:19 -0700
Received: from build-spujar-20240506T080629452.internal (10.127.8.9) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Mon, 27 May 2024 05:56:19 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lgirdwood@gmail.com>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<mkumard@nvidia.com>, <spujar@nvidia.com>
Subject: [PATCH v2 0/2] Support Tegra I2S client format conversion
Date: Mon, 27 May 2024 12:56:05 +0000
Message-ID: <20240527125608.2461300-1-spujar@nvidia.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|DS0PR12MB9275:EE_
X-MS-Office365-Filtering-Correlation-Id: 35be7aa1-a6b2-4b97-7a9d-08dc7e4c6f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Y5P6O7OL7I8uMOZyPexX+ql8NLWvPNhSlklsfDOwG8sTSl653SJ/V8fotEsw?=
 =?us-ascii?Q?uMf91R8nWcZ+8dJn1KEIZk86h+M2l3ECG18gPSOSP0jlypUSwnA+qHEwWxD4?=
 =?us-ascii?Q?4KYZfUjCPXK1czCDCJzF1PdF+hplVzDM3M/f3OYydAuYsKRh1OtipP3T4ix1?=
 =?us-ascii?Q?UYi4AkY+8W4kv+8QQkRAqZiPRXaovvcy4c3QGwECiPrK7+YYjLYeq3e0bFY4?=
 =?us-ascii?Q?WSCQkgBqTr6Bc5I914E6BTLlvj9p08rPoXJc+/UKeqmuJUsnGKwO/eMcAvDu?=
 =?us-ascii?Q?TZ7sPhOI1rXk2NL5aTwWeVLtrfUh8lLFxUW9opSt41qsamsO79uTv1W0i0Ti?=
 =?us-ascii?Q?zY733k+zPj8RIIlYyxRX7NBwreGdfNxzla8TVVRftbZhL0UboWxRN07mJK3R?=
 =?us-ascii?Q?EKVQYTlr5AX/4vALXJe1gJWnCixNhQLiHQdPFZbbjPzuRpba2UtptQuHMkru?=
 =?us-ascii?Q?kCpBm3MASwZY6tE7711cc8eUufcRMqGPYcX6shEgPHzEe+xnI2cFVJmQYiZk?=
 =?us-ascii?Q?tUNGPi3VNJqeOXXR8Nwk5DrPeF0rrjAjYYa4TwVTnIDspsVS3NxgshGCK4FL?=
 =?us-ascii?Q?OIcCuvcIvgBRTcnjAAb7sYpbm9u9311kPMynU5tNbmq7iqCJefknxh6MsYAz?=
 =?us-ascii?Q?GZy62JpminXZkqPEitLRcLD7Hb9QUQoQjbtsPXpCnAFWQ4bwvcSIQ75M+857?=
 =?us-ascii?Q?vEcFIPfPhHDOhpCet6S5Lby7ZKVWsHIqm6Ijk2RA/q6zwu8w1H7ijz6CrMM+?=
 =?us-ascii?Q?sBbZdoMF5CxfhBhLfCqP/M3sxH7KS56yN/t/Wag38jBzBZo99vxf9Vq/5Atc?=
 =?us-ascii?Q?gsTfzZ5PijPOgD9Cdhxi0wKke35YyaI/RzlOm/LbeaPE/QoQpjbNWv1XqpmD?=
 =?us-ascii?Q?MLKNKbSDh10YBhhP8dfJvlX1Fe3SGt0i/x0PSIDyNKgMyOfl9sJsY9LvQQbc?=
 =?us-ascii?Q?isj+WMtSmQ7d6FkovHJRe1/Df9sxDTsrQD3OcjLW6a9iAC+xgUTxUOcNiVq3?=
 =?us-ascii?Q?LRlIv/ua9JhHFvqtyKKr+eS9pWcfOdsn3I6sGZSnHUTzHwn6K3zxD/1pNmhs?=
 =?us-ascii?Q?JQN4uznJcpgetLpR3mADdpZm/2MmkcAeCvfifmoa70I4waJ/0Qa3v9xFRioA?=
 =?us-ascii?Q?Lma/bPookV+4b77ygXZMMB9u6apx3cs1NWo6TZw1Zq9s++qzbMMwggNHYkeU?=
 =?us-ascii?Q?MBOpCYGMtnjt6R9x8QniM8W3mOSShHDJzUCKpxuh1jwQ5r+ZQpScUYAK72Gz?=
 =?us-ascii?Q?F6anjDH5uaN8wDY6hzyb52ZQJXUb3YyzI161KqxZXv9zC15KNLjvb3+Ndg0x?=
 =?us-ascii?Q?zQgFjFt61xF+ptayczdJ4QLgwkKSYmQZZisOga0+Nw+BSTLGJW0JOOrdBqKQ?=
 =?us-ascii?Q?B+b5uIo=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 12:56:33.2493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 35be7aa1-a6b2-4b97-7a9d-08dc7e4c6f8f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9275
Message-ID-Hash: T3T3WJFTBX7KSADDUURLW72KP2LWZKJA
X-Message-ID-Hash: T3T3WJFTBX7KSADDUURLW72KP2LWZKJA
X-MailFrom: spujar@nvidia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T3T3WJFTBX7KSADDUURLW72KP2LWZKJA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mohan Kumar <mkumard@nvidia.com>

The AHUB HW modules are interconnected with CIF which are capable of
supporting Channel and Sample bit format conversion. Due to this, the
I2S Client can have different Channel and Sample bit from the hw_params()
and this config is passed from CIF port of I2S DT node which can help to
perform this conversion.

- First change to split simple_fixup_sample_fmt to support returning
  sample format value
- Second patch to support Tegra I2S client channel and sample format
  programming based on CIF port from DT node.


Changelog
=========
  v2:
    - Fix sparse warning related to incorrect type assignment for
      variable 'sample_format' in hw_params() call. The defect was
      reported by "kernel test robot <lkp@intel.com>" and details
      can be found below:

      https://lore.kernel.org/oe-kbuild-all/202405211805.UMAdiH0d-lkp@intel.com/

Mohan Kumar (2):
  ASoC: simple-card-utils: Split simple_fixup_sample_fmt func
  ASoC: tegra: I2S client convert formats handling

 include/sound/simple_card_utils.h     |  2 +
 sound/soc/generic/simple-card-utils.c | 26 +++++++---
 sound/soc/tegra/tegra210_i2s.c        | 71 +++++++++++++++++++++++++--
 sound/soc/tegra/tegra210_i2s.h        |  2 +
 4 files changed, 91 insertions(+), 10 deletions(-)

-- 
2.45.1

