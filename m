Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BFsFceZlWk1SgIAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Feb 2026 11:51:51 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAE6155AA9
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Feb 2026 11:51:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F08B960214;
	Wed, 18 Feb 2026 11:51:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F08B960214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1771411910;
	bh=NNbP/tYn7WZAWPZKf62XPRR69k3bY7w/TWTCDkjM5rM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GmspkS5hOjhHw5NNX6VdFXsU7yvZQrzAxuYWYoH1iQa/aNL5juenkR0wqtgjEcqQA
	 U9OnLsLIbo5qt0/+HfSAYl+x26bVn4eU+WRFEWLmSa+UZQnXARcxGmvKEjwNLcLjGP
	 5foTEnbgB3kYGMyBepYlruEKGX2h0byFH7U1Q/+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE3A3F805E4; Wed, 18 Feb 2026 11:51:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF1E6F805E0;
	Wed, 18 Feb 2026 11:51:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 459A3F804F2; Wed, 18 Feb 2026 11:48:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013031.outbound.protection.outlook.com
 [40.93.196.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9F22F8016E
	for <alsa-devel@alsa-project.org>; Wed, 18 Feb 2026 11:47:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9F22F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4GfoxFYl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+WiFlU1HmqJmk4IaAnMpvOX+x99/2F4i/aBW82v5oJhAE3sleyPZVqSwvBKtEUMSX4ljmqFxcYHfyKE9/HvGwRc4UJf3j5JiG1YuHT5nURxa08E8tT4ggLVjoICqDASVKDkvcobVK23zCX4eR+eC0k+nEMUkPiuU2WIEv4EHpAS0u0zdHIpWGSw4oC59y/dPFfqpu/ANt6iJuVUnWB0Wx95DjOKq6ukHVMIEdFHyjCyr2rk3CsXbd6gLRrmFqrAm9I9ieSgmEeC2qboKRmTuJvWGov9JbYGmBoIRWFwWN9ylr0CkOz65yTr4HfmFcleXhfLqO+IYkZG85dGlo5V4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAmMIfwcgFxD+4p6iZLK9bM/TRdDXG8ZM4F7Z5cwEcs=;
 b=OIRT8snRbg/QrUBVDVy8r3jQ6GiP36bMQ1TUmCRP8z5SE6wv62pwxnBZ0XTVAxj+F1G68ApAWwSXi9g+39tUYfcJ42X/R2Y+CRy2PCagHAJtZKZBxZ+0wdXySZ21vHc79vDjbopJHAQKvxE8S4UeB119HwMUJXDt1pBDcSTkdRIP8F0gAWcAqQzPNeQgPAvttBbbOlGxPlvbePAg0KTRICCRwvKD5KoQTzUVOaBD2xpdctXNcJGafdd4sYEnov+uRVn9lDAaxg7JraikG2BfFNM2L6P5oADfdF+it33lmxbAWVThDlgZrBylpNrdLzwTAZ7waff7BlqcaZjbjL+Tdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAmMIfwcgFxD+4p6iZLK9bM/TRdDXG8ZM4F7Z5cwEcs=;
 b=4GfoxFYlzW6W4JRlSHVm3g8EmzPlFxFOBT3G947BH4O0m8ix49jspST1GtvCz0CvDmTmIAnYQpO/gScLBlHzN0COIrKGkv3apa4Wj+cNRt3RDojBBO+du7FWhUYQtcRzEzZDYxOcA1oYqbXXwqY5B+y595+W07IbkE7Hc9AmoEk=
Received: from BN9PR03CA0930.namprd03.prod.outlook.com (2603:10b6:408:107::35)
 by SA1PR12MB8986.namprd12.prod.outlook.com (2603:10b6:806:375::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 10:47:50 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:107:cafe::6) by BN9PR03CA0930.outlook.office365.com
 (2603:10b6:408:107::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 10:47:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 10:47:50 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Feb
 2026 04:47:47 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <mario.limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 0/2] ASoC: amd: add ACPI mach entries and quirk
Date: Wed, 18 Feb 2026 16:15:32 +0530
Message-ID: <20260218104734.3641481-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|SA1PR12MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d5cf35-7af1-4824-fdff-08de6edb297e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RGSYc8wywI7QFLpIAOj1u3aq+hEzm2u2Th/12UfOgSNmbS+ODZeh/iMseEqD?=
 =?us-ascii?Q?1vRFLPr40Gel+5KkSF1IR+lXf1OnBczfISs1IzJ8J++m5hscDl1y6nEogKV5?=
 =?us-ascii?Q?MX4zuhvmwQRU1dRmJd+a4BU3r9eRwPhfiboC1qis9W7IM0ex5ob+AbuqAho7?=
 =?us-ascii?Q?HqumyAvTfwNtTRVPLTfCDeUqLaNGVrzvgzd+JArS6k9xmRD7hPqpn2lYxSj1?=
 =?us-ascii?Q?BnUkp7Nk8AeyTVIP4fXuYnPy7H1JYUdyYEOuuDcrUUuWVTdGjYpaF4Oy6wB0?=
 =?us-ascii?Q?NadCU0VUmUg71tAmhZLZ6Sa241vpMA+sYJKsMyz9mnvmmA/mwDjYM0UUv/jt?=
 =?us-ascii?Q?ZldnaceTMLijaU/AQcQvyrE+EO4SFgYVA1B0ua2mMAyIneUC6sKHwo4VAuMm?=
 =?us-ascii?Q?GIpeSDmPZtMBK5hJA34scmpNE57asTYPGoBDth2+KYGLiD6eQaUJQOHlD5jW?=
 =?us-ascii?Q?6nKAKQrhu0Y74ly3JKCWrtp2logE4NNRXuO+8Fxh2ZHhUt1FePo6aalgboKy?=
 =?us-ascii?Q?pewmmm6k8GOSQOwwh13meD7f8qkiCOtqRM1NPTfHEbtIyHSB1wg/Y3a7aqY0?=
 =?us-ascii?Q?OKeGgjQw4BvgKZtzXerh9TaNWtixEksWmEyHhspNOdF6g9EdOF4Xbpi0HInp?=
 =?us-ascii?Q?/e5Mbt+0UX19sduWjuL57M1+wWwI5l+fIKgBhJ0GI8q0HULnWBTIYCA3KPAz?=
 =?us-ascii?Q?mB6TL/uhWYRqtPcKeZ3kHrieS+/1fTFTqWByGu3GBIZON1n7yHiComKQmv+O?=
 =?us-ascii?Q?2Mk7A37MyIAGGKl+DTxhzLIDYZZdBaTmfcnHAMSUJQyZI71jHOcsJsOo9SuY?=
 =?us-ascii?Q?i9MqrHpEc64QCSC+vkXoxaN4Oj+9E/nn87K+Wdx8jAEU57lCC9FQPtHt3Z51?=
 =?us-ascii?Q?uLqRW1CIBOZlePOIAzypeuwwGssJzagRa9Hnym1g0djWuxl5pCbSQCx3fH9V?=
 =?us-ascii?Q?BLLzq0+J6Oph/lxU+GvVVMfd1ExhQ7kl4M6nnA9oD/cXUytVzENFRvQiTfuP?=
 =?us-ascii?Q?aJRcyie3M5M8tX9TbAnB1C48YvN8Ib4XS9enPaRHWgnpmC0pvTbEQ+vUZ6Mc?=
 =?us-ascii?Q?pmDIVlv5BcY7hgJDEkz9xky2Ql4BTrySD7UgK5TiwowanEVcYU+Y6O6cMAc8?=
 =?us-ascii?Q?TVBiLS7zUNJ0yfE2MFEl6R9aysSw++7H8l3Qe4ZbfiYO1ddKlimnmg+iY4+m?=
 =?us-ascii?Q?WMlJ6zfSEWojQ1Unisd4/OnxuGix732XRMtXNbGtf7C6rUBlg+FV4D+YwmIJ?=
 =?us-ascii?Q?zPoSKMTeGyHE3oSakUKJXbpDL/rCxjCGQFGLBwCJ61t00bHIzM6tH5twZDj6?=
 =?us-ascii?Q?dWtHPEvvPOB5F0/9INq+0pYYRF4f64Kcx7mG98yYmt+9tm7Vtlkly8Kn2XkB?=
 =?us-ascii?Q?ls5+vhF+8i4G2Y2C0P7+VjIaNAMozFn7P+rrecLBXESVPxu8yA9E6n9+6bxU?=
 =?us-ascii?Q?YJ+Bb+cLlgJaz5yWiJt9Y43xjtSQKYMrZuYj+6jXXBpDBHwybaR0aVqtwVPr?=
 =?us-ascii?Q?UFoX5YkHJrQfbnlByrkJm2ccxaraeq2u7BJQa/PS9R2SvuBwBcEhqTNF3EaA?=
 =?us-ascii?Q?Q0D6ECPDbUWckLgR7rO4DSZGaXls0Dbn0TrjsHsrDJeZjNtyoykIsIRMTQas?=
 =?us-ascii?Q?Pp3r1+NxukJ0sTA+m+5eKWyte3JDRTsPHhE19PlYQrh7OOkF2zW7qbhxWciZ?=
 =?us-ascii?Q?quhpPQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	59h7/N5QBY0Yx/k7Q9nYtqIzc/MIvLLC4zVKvGVGE1pHY15d/yk/2U3+aJfMMbOb1MqMXW7+1hbeTYO0bYX3JzfewL/apFqOqBohzZ508EqaGoPlKi/7vPnS7CS7l11rVpal4/E/7tWDqw2VqiL2ToFjchnvoXzgQGggT3r7myHlNLG8AY8sL7CGOs7JwTzd6VFBf3X4Xo4jtX9NLnLAFjftNyWfvpVGl8KO/oBKtjEhnGqI19wno4LuwE7318pHVs2z3KBLo9B6hv0E2pZgRDHkjaRCRMOlosFJZR74qNtgYlBdR50cvwvkrZmAAL6gZjF+xRct3Vu+8y8C9knXUktWe5aIHgaCMmr/q+6e9POwHPwXRCxcb8IXFai5ZxCFX6n82CCL8+QdfPAJiKgRp0cZflhYPbUXJ8Dn/8NgSDyx91NHSKi+8HTqUNVyrZeB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 10:47:50.5848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d2d5cf35-7af1-4824-fdff-08de6edb297e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8986
Message-ID-Hash: ATUVIPR547KWG5RAXVH4SI33O77GULV7
X-Message-ID-Hash: ATUVIPR547KWG5RAXVH4SI33O77GULV7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATUVIPR547KWG5RAXVH4SI33O77GULV7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[alsa-project.org,gmail.com,perex.cz,suse.com,amd.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:alsa-devel@alsa-project.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:Sunil-kumar.Dommati@amd.com,m:venkataprasad.potturu@amd.com,m:mario.limonciello@amd.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:Vijendar.Mukunda@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Vijendar.Mukunda@amd.com,alsa-devel-bounces@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+,amd.com:+];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[Vijendar.Mukunda@amd.com,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: DDAE6155AA9
X-Rspamd-Action: no action

Add ACPI mach entries for ACP7.0 platform for RT1320 + RT722 combination
and include machine driver quirk for Lenovo laptops.

Vijendar Mukunda (2):
  ASoC: amd: acp: Add ACP7.0 match entries for Realtek parts
  ASoC: amd: amd_sdw: add machine driver quirk for Lenovo models

 sound/soc/amd/acp/acp-sdw-legacy-mach.c  | 16 ++++++++++
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 37 ++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

-- 
2.45.2

