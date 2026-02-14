Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGrPKeJMqGmvsgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:16:50 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D26FD202691
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:16:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2AED60241;
	Wed,  4 Mar 2026 16:16:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2AED60241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772637408;
	bh=m2Athjx1ZGRXpzPnHo/i29dKgF6T2qNzz1KGT0nMgOs=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=L/4O2hMJKmGW1SI4lxCu4TcB7dXRbuD4qAzbtmBACP5AHmT0FbE8SbYdJL2/JuagP
	 om6ILQsooVbwAcMBjR8sf8dLaoWbSR86PzKA+j/GF/0sLY92jX4p8pKSkj6UULM29A
	 H9Z+YcepCZ6Yh0debyJrBbh+wT7ccUSrTuf/r79c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7678BF805EF; Wed,  4 Mar 2026 16:16:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49587F805E6;
	Wed,  4 Mar 2026 16:16:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FE4EF804F2; Sat, 14 Feb 2026 11:47:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
	URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010067.outbound.protection.outlook.com
 [52.101.193.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B9C1F8016D
	for <alsa-devel@alsa-project.org>; Sat, 14 Feb 2026 11:47:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B9C1F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=QH2sGedb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A029DpVmzd8wVuT6i+J6J2j0f3GKSBX0Nu1iBVIaC+BvnbSfUiXPjR6DPEkIg7WEmwWpZZ5vFcQS8Asp9to6oyCahCcZI6jOcT6HLhIzKZugvr04ixU3S+yl7c+HNN0YsmGkvj7oIik0Qit1RspSmbNMYeXvLkLsnnxbNPbU+gCuLnJ44r1/TMT79plnN5xFanQUO8KWN4K4psrbL6/aoh0WGhp/5oeRgmbUf+VbBQIbMGbY0vXokhBvQ1nZt3e5ozX7v3LggNCxZpCpnMaIcqTHy3gXFP473v2Wh1ehevkEkwDAR0eGbNDufSvNzTJJflhTmrKgd0e1wEp4y0t2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aw+uki0pAM9s4ur8RJ41qpxOYsHzWcxLkDfCd/YhANY=;
 b=TUSz7OCEvkI6aoKgAt/adxG9mT5VqOJ08xkSHb5ptrEleZQ3YSqQkdCnCw53ZK1Ot1e/cyQcAeNPzX+S++5oyJPsQqqlF/phoy4yMv4y7wK9l7xaIbcztXCSZLWfHUdmyVroR5Fn6eUhxeqXl1vq7cgWk29A2XONF2trhGnLH6eZq/r9eGwCJjrKXrTmhYl3xfpCCdyzeKDq8qlUHNgVeeCVvurqtMm10DTxK6XQFKcoBaoAbkxivgM0PEV5ngx47VaXOREIJAqa4pe6g2P+R+zv5/+v0Mh4rs62p4M48XwIcF5X1on+dNmQ0T/n77dZxGAG+k0LUfimjhOKKQPWrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aw+uki0pAM9s4ur8RJ41qpxOYsHzWcxLkDfCd/YhANY=;
 b=QH2sGedblQ6BRVGJ5pWAkGBwET7w+DzwGdpnHJRuIOUAPGRlksR5+n4unMPr14wNG0m4CKTgWGqtAX3Pn5NThrWn8OnayXeDDh+qGbIo0YoGZbEdW3WUq6RuFz1sXFXEn9bbd6yNFjg8x5H3k7TToBHFB49K0g1ucylqJbXwp6s=
Received: from BN9PR03CA0979.namprd03.prod.outlook.com (2603:10b6:408:109::24)
 by DM4PR10MB5918.namprd10.prod.outlook.com (2603:10b6:8:ab::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.14; Sat, 14 Feb 2026 10:47:29 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:109:cafe::dd) by BN9PR03CA0979.outlook.office365.com
 (2603:10b6:408:109::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.14 via Frontend Transport; Sat,
 14 Feb 2026 10:47:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Sat, 14 Feb 2026 10:47:29 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Feb
 2026 04:47:28 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Feb
 2026 04:47:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 14 Feb 2026 04:47:28 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.135.133])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61EAlMtP2315012;
	Sat, 14 Feb 2026 04:47:23 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <shenghao-ding@ti.com>,
	<v-hampiholi@ti.com>, <baojun.xu@ti.com>, <dan.carpenter@linaro.org>,
	<sandeepk@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1] ASoC: tas2783A: add explicit port prepare handling
Date: Sat, 14 Feb 2026 16:17:10 +0530
Message-ID: <20260214104710.632-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|DM4PR10MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f179ce-5990-4d4e-543e-08de6bb6733d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8Cpx2pmmt9udUfwfAgCLd/K8xrjgMjcvlncddHCz0pb3d2ePKwavB/rhXCWI?=
 =?us-ascii?Q?y3VxT9h593UGfp6abQI5jTZZc1GzjvMobq4m1H/PhwUCRURvZi33JQfq/Zlb?=
 =?us-ascii?Q?08AmZe23d39qFSbcjXoQ6Kv3cy4Ade98W0b+lm9yLEVm6L0PsMFrcHvnnDn2?=
 =?us-ascii?Q?Sq92ogY8ZxBQsrZCNsKRbwRWJhrdvnNxgM0cUT4lH2UOvUht4AEH/IjXFrfi?=
 =?us-ascii?Q?aqh0RYGGqdQYWjNaT9fb2qBfrYHlzTLVx5OWDSa/gqGNZoG8CItrlxoWmzAB?=
 =?us-ascii?Q?V1ooXjR43r1MCDMZ8ElaRFJW+8bwmfQx24HZ2/rzlWVKco/l+KZyq8w5IGG4?=
 =?us-ascii?Q?RSN/G8D8+50ouZ772k/tNOlvn2v2lBPTqSFbKYMYBMXsEj3gCxDlrygSMDRq?=
 =?us-ascii?Q?UThou09CmUs3U4OvaP3cJqPEXY4jY2Evx3laejTHz34NXq7w+AK0jHlNr86I?=
 =?us-ascii?Q?qS/RAoQyC9O+ZO/RcDzBPoZlHfSuJY3sAjhKiQlAyGczTDGfVPn2ulW19Cwr?=
 =?us-ascii?Q?Hu8sMuMcAm976IhecJbZvh6Ngs+WrJ/s43XIN2/b/AoR0WzB7Ik1u7QLovwb?=
 =?us-ascii?Q?YYatRuJRjsO9J691cAJhkG4YdemnCgfOW1S4KsLaOeWwk0xC5cZW82ON6on7?=
 =?us-ascii?Q?Dc5/9dRuGUp8elQ+rDRSBoT/ovabpywsXo5C7sf2xZYozXRNtNgtw0zp2hvH?=
 =?us-ascii?Q?ovcncj2pZpTD36hZK8iZDT8MehRT/+6h+Fpccrpm2mvSBTI8c6kgcNEFi1Q8?=
 =?us-ascii?Q?IRBXQvsOBi7NlDCrARlFvoc5STnBjSF1mkxAEi504k2zaAQLhyqTM85PzfP4?=
 =?us-ascii?Q?WiJkakyb39f0U5RALYCbjCwqHBDRatSB2hffx5V3om1W+rxSlFn77Byah1IF?=
 =?us-ascii?Q?vjJdZcJgpoZwqGV7XWzmZ/pC2gbNCsZi6a+DCYIuBd0zcP3eqPyqlMDNfSce?=
 =?us-ascii?Q?jDFN037KDyFv2ZfffC9jpZQBSJ4mKOgggvgWBOUO/Il0hkWzUYXKpiMX/zXe?=
 =?us-ascii?Q?dQDlnknQnQXjlUY4+aqo1DAdSge1wziRVBWNvpCRUC7HetnaOxh2KgRdh+4E?=
 =?us-ascii?Q?AwK4BlcQbhFJP20hJaRqFadhgOpUqsrkdb++nX7Q4U+3wjXYnZp2ovw1zerc?=
 =?us-ascii?Q?nhqW52IaASPXAVtrHaSGobu5pMqb02mRdl3ixQG0u1uRfYhOkueu83nlNzrA?=
 =?us-ascii?Q?M9S161PoKvcIMAa2FaDm7cM+IbFKr/8/uT7d82iU3jZsRUxPNP2Aj+zYFa6a?=
 =?us-ascii?Q?lJuuxVLnnWvR/bV8pU/sqoUUClKwD26ZVl2h8IskMTeUDdM/I52OXAYgMAOU?=
 =?us-ascii?Q?Gb3BGan2X9zFIwtH4lVFTyyrZYXjkVoqmHJeyB3/1lz2mUV/TKoScM/w6JjW?=
 =?us-ascii?Q?qLjynI/sd3zf/M2nBG5WQutzMbu7+pBLLRTnYnIwqrrs0Sih9H8SNIiKHK9D?=
 =?us-ascii?Q?ggafyIGxVctOF1quxFjZBgm+fqbhpiuVPD+DSes2swRIbTMtFpqkM8dYIQOp?=
 =?us-ascii?Q?EM87crw2cAUbidp5e0fFvJCqru7bEH1DAaBz0Z0DZRPeVzhP2RnG14MBdRdi?=
 =?us-ascii?Q?gaIjNfnL/LUovWZzWIaxwkerNFGaqtemIizCgt6e6INQeWaw/PB3QCWjVz4i?=
 =?us-ascii?Q?SF/r0j7Py0/zVCXzC5tcYliL21LWt1qxLH8XkzkkMDkCsgekXUIy5ojx13nh?=
 =?us-ascii?Q?jEqZ3Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	npRPSgjgIlc50LY0Xw0yctpzq3IX/lC4vLty3FOVSfnjc1YmF1pmDzVbxYPA460yCb6KW+L/agcneiVBWfyH/9Ww48k5CHXSOMrTH93ge7HNhwt4zJwZwfRr8r/MJsFbqsK9xbW97A4xbiGpz53yo3zH5ojGcfel1CD14ghMevalZEQXxnvOJl1S/Ak7tx2jAlYlIKJesZztI3qPnuAa6lEBZcCHYJhvZCAn+iEiCJxUV4I5z+YygIHa4T4bCJhO06CdVGYPJSc4nBNySQepviJblqLRSmJe/95KPXFhtkyBDgbW9SPC6a4loNvsdUzqX7GUdw+vd55TSnXx1GiVKaWijCy7WCzNI2cKXj3gAmWA8OWfe7DLhiiLZHXsf6kkma7exbQVq9oB2JKDUAZQFIuF8JCkbKiXb8xpS6WxrzQBhCvMOgazFGfLQaMNLrE7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 10:47:29.3595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b6f179ce-5990-4d4e-543e-08de6bb6733d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5918
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FYFZOILQQUQVFWC2E2XD3DKRQTSIZHBV
X-Message-ID-Hash: FYFZOILQQUQVFWC2E2XD3DKRQTSIZHBV
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:16:05 +0000
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FYFZOILQQUQVFWC2E2XD3DKRQTSIZHBV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: D26FD202691
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	DATE_IN_PAST(1.00)[436];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,opensource.cirrus.com,gmail.com,linux.intel.com,perex.cz,suse.com,intel.com,linux.dev,ti.com,linaro.org];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[niranjan.hy@ti.com,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,ti.com:+];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	TAGGED_RCPT(0.00)[alsa-devel];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:email,ti.com:mid,alsa-project.org:dkim]
X-Rspamd-Action: no action

 TAS2783a required port prepare bits to be set during playback
even when it is using simplified CP_SM.

 Normally, SoundWire core handles prepare sequencing automatically
depending on the type of the device available. For simplified CP_SM
there is no need to set the prepare bits. However, due to a hardware
limitation in TAS2783A, the port must still be explicitly prepared and
de-prepared by the driver to ensure reliable playback.

 Add a custom .port_prep() callback to program DPN_PREPARECTRL during
PRE_PREP and PRE_DEPREP operations.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/codecs/tas2783-sdw.c | 43 ++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 3c1fbf523..bc8dcd6f1 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1216,8 +1216,51 @@ static s32 tas_update_status(struct sdw_slave *slave,
 	return tas_io_init(&slave->dev, slave);
 }
 
+/*
+ * TAS2783 requires explicit port prepare during playback stream
+ * setup even when simple_ch_prep_sm is enabled. Without this,
+ * the port fails to enter the prepared state resulting in no audio output.
+ */
+static int tas_port_prep(struct sdw_slave *slave, struct sdw_prepare_ch *prep_ch,
+			 enum sdw_port_prep_ops pre_ops)
+{
+	struct device *dev = &slave->dev;
+	struct sdw_dpn_prop *dpn_prop;
+	u32 addr;
+	int ret;
+
+	dpn_prop = slave->prop.sink_dpn_prop;
+	if (!dpn_prop || !dpn_prop->simple_ch_prep_sm)
+		return 0;
+
+	addr = SDW_DPN_PREPARECTRL(prep_ch->num);
+	switch (pre_ops) {
+	case SDW_OPS_PORT_PRE_PREP:
+		ret = sdw_write_no_pm(slave, addr, prep_ch->ch_mask);
+		if (ret)
+			dev_err(dev, "prep failed for port %d, err=%d\n",
+					prep_ch->num, ret);
+		return ret;
+
+	case SDW_OPS_PORT_PRE_DEPREP:
+		ret = sdw_write_no_pm(slave, addr, 0x00);
+		if (ret)
+			dev_err(dev, "de-prep failed for port %d, err=%d\n",
+					prep_ch->num, ret);
+		return ret;
+
+	case SDW_OPS_PORT_POST_PREP:
+	case SDW_OPS_PORT_POST_DEPREP:
+		/* No POST handling required for TAS2783 */
+		return 0;
+	}
+
+	return 0;
+}
+
 static const struct sdw_slave_ops tas_sdw_ops = {
 	.update_status	= tas_update_status,
+	.port_prep = tas_port_prep,
 };
 
 static void tas_remove(struct tas2783_prv *tas_dev)
-- 
2.34.1

