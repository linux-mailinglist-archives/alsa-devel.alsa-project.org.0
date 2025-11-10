Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8E2C47041
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 14:50:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721B860203;
	Mon, 10 Nov 2025 14:49:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721B860203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762782606;
	bh=hcNpzJ/jdVxOO5gmU/TiEyFxrx/SElTCVV08nCO/kpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rlo777B906Z9vXn5kEjekyO6bQEUH2YbLIZvZf2lcj8hVMGAQBeo1uzESDjA5vQPz
	 NSJ8AyQiEY7WV9EESDpIp+rj7sLR+FSglYIG9S1wxonrFR90Q6Qyhmybq1iPH1/nGZ
	 6qkMNxs4Onz5ngdUSmcLogbacF26l1zVac4/fOKc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7E42F805CB; Mon, 10 Nov 2025 14:49:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5408F805C5;
	Mon, 10 Nov 2025 14:49:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16EF3F80254; Mon, 10 Nov 2025 14:48:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 466CAF800E4
	for <alsa-devel@alsa-project.org>; Mon, 10 Nov 2025 14:48:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 466CAF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ajcawKrw;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=TGiD7PA2
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AA5rIn61249348;
	Mon, 10 Nov 2025 07:48:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=KMinl9TXk8qzQpz2F3
	HuTAWRKS1JPMLC4JFX59Wla14=; b=ajcawKrwiRkKR5AttpyaWmjPS42DLN71xe
	ZhG1WLe/yjfZu1UkNttBw7N1oUGvBoQ62fyVQJsLONNtRYwSBGr2uw8KUhIEV/YU
	hrV60aVckCgfXseO6cPA0ZM2ABHkCIQWWosFB0Zo+8bhcctDeQY98eR8ybKnoxhw
	k4d7rkZ+7oBqbivHgPZmZkcbFk6V/KK+5B5kS9/1kw+C9SMjce84ws9cucY5rob/
	Y8fw/4IugpdU9M5FfzF1BLKKLLBZth9C7knlWk8qqHyu4PT6t3z7zXiLswLwjleB
	Aqtq47jQTvPAKtOLBrKF8mEABOvV3nvRm3NRdNRM8Gvmv0N7MJ0Q==
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11022139.outbound.protection.outlook.com
 [40.107.200.139])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ab5fpgprj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 07:48:47 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYvNAB2DhnH/v3BA+h/5Gr9hY14iGvttQElSklVHjEI16rM+x07AN6Q7qSAU0hpAXKjUiIKBKxtZWS6IrgsWUiYztspMy5gIxKfn0MFd6ll67JnyM3oVFc0LF8/n0Ug+BidSPu0hyTXsWQQdpIGiAxBCCpu2TjcNj7d9PcoyC+vUo4vIJMu/zNBKEW7nMTtzfi0c6UPsJErH7tCa2FWDsh/NsSBG29+41SFZ0bSaEVpqZQNqdr6PowTMUVaxx+jp4ciwB/XqZo8E3YwaLvbjVeRjzsFVMKbEtZ8Vh1y6NmsUtkPCOBGh92yHuSrlhldrBHyc3q0EviJEvhM8Di89Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMinl9TXk8qzQpz2F3HuTAWRKS1JPMLC4JFX59Wla14=;
 b=lZBow6M+k4Dnff7Jiop1z4suYji7CPs+5noX/8SP+q2zxTWCED2vR9yuRLfoP3jlj2mYTiV+51TPyTmTkCK7LK//Gll2Jy/pf+pPP1oJGGymPUvHoyeRk7n3fKkxhOuN01b8YhifA8mU6QOnvtYheZOsyodXV6rJJhm0tC2SgaWTsH95SnbWtT357TFDZhkid1XY1vx7Mq6jIJ5JqmLVT+QOpAomHsk2yNyrrVhaX5NOyUyeLm5MDY6o5ZMPq6jbMBRwAMVeu2SiaUWpQGJoqyXzK/6a5i/2h4dAciMX2wurW4zw3bk8nCXdqQzMmJI4ioJHJLA7ecqz7xI71rI3Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMinl9TXk8qzQpz2F3HuTAWRKS1JPMLC4JFX59Wla14=;
 b=TGiD7PA2AX4xtyNrwriXTMO06vV629HyMiu6BB14jh8kgRfzIGSGL7hKN1xgljqkV/OjuTbJ9Iu0e5g6YuOhxBTmUCtCW6+9pTygKUQoRg44ubKeaVFp8RtbgbA/eaV6OUcVefXa0HUXcA8nRx5TT4ezXzMapQAl5KIpE44lwc4=
Received: from SA0PR12CA0028.namprd12.prod.outlook.com (2603:10b6:806:6f::33)
 by DM8PR19MB5319.namprd19.prod.outlook.com (2603:10b6:5:314::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:48:43 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:6f:cafe::4e) by SA0PR12CA0028.outlook.office365.com
 (2603:10b6:806:6f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Mon,
 10 Nov 2025 13:48:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Mon, 10 Nov 2025 13:48:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 45D93406540;
	Mon, 10 Nov 2025 13:48:40 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2F551820257;
	Mon, 10 Nov 2025 13:48:40 +0000 (UTC)
Date: Mon, 10 Nov 2025 13:48:38 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
        mstrozek@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
        kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
        navada@ti.com, shenghao-ding@ti.com, v-hampiholi@ti.com,
        baojun.xu@ti.com, dan.carpenter@linaro.org
Subject: Re: [PATCH v1] ASoC: SDCA: bug fix while parsing
 mipi-sdca-control-cn-list
Message-ID: <aRHtNhYBQpABJjJq@opensource.cirrus.com>
References: <20251110130058.818-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110130058.818-1-niranjan.hy@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|DM8PR19MB5319:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d4bf8b-2244-4a6a-9372-08de205fdbfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W91+Cik40XdF3ZxZX3NvMPlpujMwPqN29DU6jV28tNSMT0+5C3g4ZnK4vSEH?=
 =?us-ascii?Q?C9ttaxqCkSXZDzz+2VuzJE+iJ9ec/o2e3aFmLVpnqhJHL4DlpRPrnOoeN2/S?=
 =?us-ascii?Q?qIx8SmZjXKGFHJdbv4QTAD0+HzZIu+1lGBE5zLD112Bx7zNSN4Ft/1+jjjlN?=
 =?us-ascii?Q?O8mS7QH3MVaPANbhHmBwcVxh7Mwr95YQ0KNiMGPwhYtQXCaGJTaKFKhXSHaj?=
 =?us-ascii?Q?cwxckBLHqbjf+X5viJCOiPJFB80vmUbVFq2Ko7g7uUFxYlyrdKM6sXhDmR62?=
 =?us-ascii?Q?iHWQG6NLpje5zARnAYSf+O67HFD73IkZIg4WsKAddko9gCoffEZ+pqZSjRPi?=
 =?us-ascii?Q?+wkKiqXji+GmlAeyHZleydcn37Xk+gH26FmbOUzbthC7eelhhQ/8ogdtJc8A?=
 =?us-ascii?Q?+Y4mWAphQVD+3s2gyCp/ZKwIS7h5/oZhOMPn4ZiIFJfLpbj3nATRZ8CLjnXM?=
 =?us-ascii?Q?c8IhWgnbugBWflBf/9JKKLpVJW6SdakO4UQhGzrVDUtN2oQLTfxjdICWgFZ6?=
 =?us-ascii?Q?I07/o+XAunI4o4Ej/qwRySj6HwLHnJzOnblpILxGd1+/Ehhjr2GvK69dOIWZ?=
 =?us-ascii?Q?/oLRWS4CGyXtxE0yWcjqz2TFJnK4MqX+OyctpjquHlcrM8zp37PE6WC6xAWM?=
 =?us-ascii?Q?NifCuDtSjK4GSbNWK5tmK4neE8DMZHudEybDyj5rav8v8jdQQm8hxREavPNu?=
 =?us-ascii?Q?cr+NzxtUq+S6KQNaJiyt/71yXiAE5C3ACTwaWZdchqZYvdb9OUhGBxb7BeLg?=
 =?us-ascii?Q?uavyqTw+WFVRUhdcWZQ/qigl/geZOFQJGLBh8sFfnQh1b/85JJioSY4gA9xe?=
 =?us-ascii?Q?jScP07lbmxIJoBUMz+48ZhGNqFYp6Bf9bEGJBNhuNOwALPDjHNQgZztKQR1B?=
 =?us-ascii?Q?qgWikB8MNjz1476Ak7oC96bcOASvE39i4m0zxwvc1Ioze14yuYNpZEdOGn1k?=
 =?us-ascii?Q?FrZvnkkU6j55YipALfdiY+bYE8dJ0irNY8557b86ImfCA0KdTdg611yyU8So?=
 =?us-ascii?Q?yd8eSUMzlKfFc/dyHuMhyEP7BNSJEeK9gg3INgq5X7zdqBEE0mhNjoXNXm7l?=
 =?us-ascii?Q?Dnkd9tn4biCb3X0mNBtT7O2LvEpVgVkcsGhHE3OVA9rHznntnt/akuvkI83v?=
 =?us-ascii?Q?k4XgegmsnWCX06bsenPwBH/N/eYhPNu80zD2RioRGOsESKmRDXsUAqrmJQhJ?=
 =?us-ascii?Q?53UIyugtU73wXO5csKGq8pSzGC6HJI7oe1DM4sTCMDM4NO7BKnU+mBZ64e2L?=
 =?us-ascii?Q?E1Yv8lmf/PEDaJLFscFWpA5aTDCHd6xpCvUbauzkK0+LbpvDbc3zFLA928jC?=
 =?us-ascii?Q?EBmx+UeYTG8TDYfp9b2i6mgy40sdSxF76gcd1pdDW32gpVjmwLBJhTtU/RjP?=
 =?us-ascii?Q?2AVufd15SaFx5XcX4JbxjFrWTRRkEOnt0jdluSARWqESBTzid4VsBzwdCID1?=
 =?us-ascii?Q?dgOPtwMk4ZnSKZ77sCEDAFFAbXCAzv9hyLxRaieio3ffZY3zuX3COy5ylmGC?=
 =?us-ascii?Q?BVo/i9zs+q0y7fu3iftRImlYgVdUKeVhzY4CzUrN0nWGlbCqS3atpqZEufBT?=
 =?us-ascii?Q?A860i1XEuqiUu2ly9Fc=3D?=
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:48:41.4960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a5d4bf8b-2244-4a6a-9372-08de205fdbfa
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 TreatMessagesAsInternal-SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR19MB5319
X-Proofpoint-GUID: ErDwC2Z-YwHt1w9QizZctvk_GLNXmZCj
X-Proofpoint-ORIG-GUID: ErDwC2Z-YwHt1w9QizZctvk_GLNXmZCj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEyMSBTYWx0ZWRfX4eQ3Etj19yob
 bQdB9bI/vyLxYBRwqOdpkgJvhOsFEl60N87xud37gFyXmV/LKUEwaZojvWhTV1iEg2w3jqnG9c9
 ql2aZes3BCI5NXzeATmkGhvOanbsiYljIZwu0x/3g+MLG4yzUUkj+gb/QUireXfeeAXGODgp81g
 O4nRqotlLJnDFYjchLkIwBowod3z7HpWY25S84yHnsJE315R8gVha4DhE6+xm/kvZA2f50r9S2w
 cjy90euN8bKyfXmeFHShOZHl8jhX//ZjPwSGVmggo5lb984qIh3rkKMHCceiYIAdPkLByL5baaB
 l5hukjNk3EgNBGTF9xNvdz1Xgy11H5RXH1xC3MeEN3WkuYNTt8F6s2/yTgrRmr80CB5/G59WCtS
 zAeeAaRWapIPJkjG1WD9V8+qIYGAJQ==
X-Authority-Analysis: v=2.4 cv=HLvO14tv c=1 sm=1 tr=0 ts=6911ed3f cx=c_pps
 a=3IUGx84TntR8WEbolwO0nA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sozttTNsAAAA:8 a=KQB9U58JTas2KpxKsSQA:9
 a=CjuIK1q_8ugA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZETKBUVTBANC64ENDFDEV36T7FDDMC42
X-Message-ID-Hash: ZETKBUVTBANC64ENDFDEV36T7FDDMC42
X-MailFrom: prvs=0409da937c=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZETKBUVTBANC64ENDFDEV36T7FDDMC42/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Nov 10, 2025 at 06:30:58PM +0530, Niranjan H Y wrote:
> "struct sdca_control" declares "values" field as integer array.
> But the memory allocated to it is of char array. This causes
> crash for sdca_parse_function API. This patch addresses the
> issue by allocating correct data size.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---

Thanks very much for spotting this.

>  sound/soc/sdca/sdca_functions.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
> index b2e3fab9b..6975c71a9 100644
> --- a/sound/soc/sdca/sdca_functions.c
> +++ b/sound/soc/sdca/sdca_functions.c
> @@ -950,7 +950,8 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
>  		return ret;
>  	}
>  
> -	control->values = devm_kzalloc(dev, hweight64(control->cn_list), GFP_KERNEL);
> +	control->values = devm_kzalloc(dev, hweight64(control->cn_list) * sizeof(int),
> +				       GFP_KERNEL);

Should probably switch to devm_kcalloc, rather than doing the
multiply manually.

Thanks,
Charles

>  	if (!control->values)
>  		return -ENOMEM;
>  
> -- 
> 2.25.1
> 
