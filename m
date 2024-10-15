Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DFB99DAFB
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2024 02:57:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BE31836;
	Tue, 15 Oct 2024 02:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BE31836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728953821;
	bh=9hVUyh0nW84rWzwp6AOLWjBGs/Lex572eM7hysFgP3A=;
	h=To:Cc:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sj2bwx3QMMrKtuiNfYPcm+eb5ysZA7QrL68eOR1LntXD3vJxEWePKbZ07l8LgmMoR
	 Ctn3ZKHyhJoSqL3PeoPS7EoG3lJjAtBenVjNnNtBDHqWWuXicxyb1JKALPyjr2Txnz
	 plVkWsrBqsHPpkiukCB3dbkzlb0Mz2Y/ewad0nd4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F494F8059F; Tue, 15 Oct 2024 02:56:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AE6DF8032D;
	Tue, 15 Oct 2024 02:56:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4BD7F80448; Tue, 15 Oct 2024 02:55:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 481B8F80149
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 02:55:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 481B8F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UUlAGwBh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfgjHkUm14Q2j95Dlt6KXpQOOAh23Pi5ok5dfz67k3q+nsaP4w6flHHXt+Ww8s/5g5z/X5DTqk7CyoqSz5hoMAzqTYLBGKHKp0Hxd1GmSGS3GIe8PqOGHe0GvbQEiAHbRPKqoR4mVqNaE1tAvFaFD9iCaKxfHtaQICGtazpHKL+jY29radgr6b41GKVO/2OmHdXBGTnAnZdTTLBXgfP/FRTTTkSzLUVS52PKJHQRqCd5Jq5vNHjlz/QWFnNEmDwXd+aMIxhhSct4SWKAEgAADVekPUyc9G/wC1fI6YXnWfSLzTAOIZg9zMdjfLfl3sHUlz3DnQj26fbFi/xiqdAgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZTNLtdNCehkgSgVTIkSjRLK7baQZQkmczczJ2oIPFw=;
 b=jBwqa/3j8i9vMgQF/L5tFN7Jw6WDUkkHyKN0x25AQidpg8BaENC1uFoT76I0UukfY5T41E/so7IIwaPJ+PXzrT8R136lLvs1MB9wq9Q7zIZZ7MPJd31HA4gQP8uIKhrqcrm9EWGRbdW+eTU/+PstUiRx4dxAVUbdgmzVNJD7JNE6/WRkI8t5O2sF2ibsl4dmGABAAroHeHJqylJoY1QsQ1UJ5FlfyKzB825ljY3byER79Tc4f9aM0vvEHsz5RaUaio2L+yqjkjNQA/OEzLyV4zgU6B8I7TFYgP4Ba6K72sbF9fcY5Sit0lnmFi403ON7LYbgTfuEPx+Hhhr2vf/rVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZTNLtdNCehkgSgVTIkSjRLK7baQZQkmczczJ2oIPFw=;
 b=UUlAGwBh5SRXfuqipTE+muTU4OAlCKWPwW29JrFyGEvlyg1fvpKDOg30Frkc6CJBv9CaNHxME2CF3TKRuetOJpFRZjZE3YdcrOaS2BKw1Q5qba5jvejlXPQa82k3bvgwM/bFawGvUtGy2eNe2FzwyL9K67CqXtKcpel2pKUeHOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSRPR01MB11566.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 00:55:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 00:55:44 +0000
Message-ID: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 00/13] ASoC: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Oct 2024 00:55:44 +0000
X-ClientProxiedBy: TYCPR01CA0138.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSRPR01MB11566:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cbca45b-df22-494a-80d1-08dcecb4196d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?j8h2CqL9q+HHrs3TLwxQJMaRUvJF6W1Fuo/1cXgASqPKFmvdo6b9/HBtTU6i?=
 =?us-ascii?Q?2QXKqHzGCXcEIxLKu6sPdiAv7vYSMa4NZzWJoapVrsYjnrnDPRf7k+hiKKVI?=
 =?us-ascii?Q?aKGkIoUNmSrEdA3g8OmRWbCMNoiGWuTrAJ7vcNLxRceOnIJ+XUtUPMIwEzj5?=
 =?us-ascii?Q?fz9s50t7N6wTMqDGCyUSpe/DH9iVMMfVc3g3Mf2cxEtEzf1i9Gc0xmYVud58?=
 =?us-ascii?Q?CjxgCz6tZjnX7btBL0Gkd0hpCf2SGt+5XLFXqhfQ2rLHcnCqX5Ez5mbgbBNh?=
 =?us-ascii?Q?lH9hE27VfhvqEDw0r25u7uW3wm9kLkX4hjaHgv6Cs0gxax8fzA87j70oWqmq?=
 =?us-ascii?Q?oyGeblhzzgYCjR/ONnMPm4APZSWBPyVy8VDniay2ehz0qDujEx30CGQcisUP?=
 =?us-ascii?Q?NGIq5dhNq906tpiS3PoixCO+nD4GNlvG2LbP9R3vUCpQKkDjNmJBwdtLD3Fj?=
 =?us-ascii?Q?8U6Mu4Yqc8N8hgBA+jWpBpqtDKSs0lD0uLYI6oF3YBfnLsV6NySNx2hu7Wr7?=
 =?us-ascii?Q?K7I/fv5Z8ENRWwLsu3PRlXbpbrOrAxqH3Md6WgqWsNruWioDoOD83ssc62Su?=
 =?us-ascii?Q?13GW8A0eL5aH6AzwylPcdGwGaSuTjKw/OnuvgPV3T+zVQaKYIR4KVBifmfzh?=
 =?us-ascii?Q?xDgkxro/Lwg8yJwjQ40V91T6w1mOxf9PfqxRjR5WgmqYo+eyztjaH+2TCldN?=
 =?us-ascii?Q?W68AJss1WgpWRXAQqkreaO1KLUOvlG8IeTo9N4ycoTlMyCOaSP5B12VeRV5v?=
 =?us-ascii?Q?/gsOo3AnQ5T7jact3zmIV9OpePnkFDkj4trsPB8qbtyvdLvuxVufDguhs/+i?=
 =?us-ascii?Q?C6glcZlQXYH6PdMUrXKnLPEf2eIlPxE/QJwp37d6uud7HJ9fEnY5nMOsrRk8?=
 =?us-ascii?Q?hehnKC/vmg9CGJTEwcOvHSf1yA8Fj40YXL5Ke6C7luvsJ7fKjH0fzox3oTFU?=
 =?us-ascii?Q?sQDVja7kHDCnGtUeDs/U49Jvfb183Ozq+0YSxncpWMN6LIc3S2pQLl3LiCNN?=
 =?us-ascii?Q?SeW7ORNvGfMV/e3p+Sndvrl/W5oknnLg1sryAZF5nUz/exH8OKfQ3C6Oln1y?=
 =?us-ascii?Q?UX3NUueB1PhEQNAwyo73TanF8N90MyKudKyi5DV+qyxZrzZMfcRIVsiMHB6K?=
 =?us-ascii?Q?pLvf8YNbHsrruuRc5ZDqqDVOUKhH2FmCx+8t0t8r16eLJVgbo4AqLtH9gt9G?=
 =?us-ascii?Q?urzqeal63nTJGrU9Fqldc/PKN1gxMYtl8rFDyk3P5JOLS2ng1xjR798MNAnu?=
 =?us-ascii?Q?hNvezdZ5vW5f5JXJ+FHVPwsZeoMnpq/dCkcJcx6hGFsf3owYsDiZ1X1UqUwZ?=
 =?us-ascii?Q?jGQ2nMLrtxFMD8TSKBMLwEqK7NwX5in7/WdJN7TglAcBmA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?44tdxTziGDCA9gRes9zJWN4JYeKcS6NRVZgRtXfBsfoFhjOf0kaxjKfDMgJr?=
 =?us-ascii?Q?5L3sxnvBssOFArsiEOwZypTc/6qFO7Va7iwYyDN2XrvaOFn2D+Q9Lik8OiV8?=
 =?us-ascii?Q?SeerA6vIwsuTDN3fg130cN/ol9uXGcdElWNWLWRMHI76Nzz8YNZEg587sHeg?=
 =?us-ascii?Q?QxX+KJG1Hvyqilm8KxKYIy4Tw9iU7WwznEaq8SsFh4Urp2/yirAQRgWm7n38?=
 =?us-ascii?Q?XQ3RNIjBGq1GG1MbR1HbD4ELqKsByiMbEQxubOJzxtHfbZp5XE+uEVkaEzwO?=
 =?us-ascii?Q?4RnY/k+pOmJ02Jzh8KADPD6lkvUu2ypS/EJI01Oqi7VrgY/S4nIrRMtpJ9iq?=
 =?us-ascii?Q?4A8IVOF7B8GadfgKvaKY0K5i6iL4qX+0h9Z27HKdJ82I5dRZQQKeX22AXptT?=
 =?us-ascii?Q?ToMeD42aJzDq1ViEefFk9pi3qGy+el+2XeyQTrlM5jZAqf8BWLhARykkE5b1?=
 =?us-ascii?Q?wUVO/N1nIqvg9efRVuwCXGIe8k92BIiCqyeLPzWVwnWl4x4ciGz1EsfbcdbM?=
 =?us-ascii?Q?QMLgDlmTpa2c8aFtG+OzpSPw31O/aYeQPZNaVVy6+JHILr/S+yp9IhWUpna8?=
 =?us-ascii?Q?4bj+gvlaUpceyAeRPFtbVoXvrpEcD++duCN3lIntvQNDzLIyWobDldVuMuLn?=
 =?us-ascii?Q?40plzNoBDpUuLL6w8stUM0KZsElEuUPabtr7V+2/hYShZikchLhS5G9wceZI?=
 =?us-ascii?Q?ETv8crwC+Ov7SWurKr8hk9aq4v4MHsaTfUZb6y5vsQinTxlcO9ZBfywaO3fT?=
 =?us-ascii?Q?xr6EOw6N3f4pGoh0LvaKxOKz5mPMFpFUsjuFHot0EGRykI1WdBEmpaZP/YXA?=
 =?us-ascii?Q?z1J7zPWQFr4uQPsR+5LGjkWu1zL8erdljr/gN7jpMNejlVyocfLgabMTnVYf?=
 =?us-ascii?Q?qtEmuiCjRbq9HJ6NIlY3eMlQpqqXGI91QcSrqix52N/l9XUvGXxZzEoG9ln8?=
 =?us-ascii?Q?wby0PeKxKHMtIlvTQ1FT7+MhxUyA9prgfunAnyUrrlQQ31vLgYow97xDWUG7?=
 =?us-ascii?Q?9mN8skYHvqnym4tyzWfLVOQuW/T+nSQtT4HeLZw5m7enO183XrjaS8raGCj1?=
 =?us-ascii?Q?81L3kyW+yAT7GXj0v47G93koTc43wV4/uX1OFqk8eQz/JMhqfvwptUKEn7GQ?=
 =?us-ascii?Q?EK/LiqKfJmBSl4twzUei6wszcWouRTeLl4cjQoDVUTyC0xejJ6IZ1g2t6+zh?=
 =?us-ascii?Q?VvOmPj8VGSee9FCfyzqU/bL0trkgJNNmk9aU9JaR9ZpX+ML0PgheU0yrU72o?=
 =?us-ascii?Q?rHY6bZ25RDvJxGI2Rm4wetxIj35RUmGnTMqu63b9gTtZXQOuScUTgtId+jV4?=
 =?us-ascii?Q?BSFT8eLWlGsjS5+8VzRCUSXYoKK0dbYqbdiocZmbjSp+ERL7Cagm+mvvABBv?=
 =?us-ascii?Q?GUsCEUJlNtEbC5XL5oCeVS9hGxYin9VmBfFTuwdYsQqBRZ5oWLj40CjQ+0jJ?=
 =?us-ascii?Q?NELHs18jnWMXLINOoW2k/UdMb/tVpNCvBQ8fAJaBCY51FGUZx45QoLv2ujuO?=
 =?us-ascii?Q?lWepGEUTJMRKn4riYNTL02yRww+88+DQxtNx82L1aUCxZfitcvw2jysOmMtk?=
 =?us-ascii?Q?1gGsQ7dlfP719q+VEVN6q6YN3y3J8+cQsu8iHazWM7Pi+Y1QlXA1Pv6j1y/h?=
 =?us-ascii?Q?BXcpoXmqRS1Gt87pSgJIyLM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4cbca45b-df22-494a-80d1-08dcecb4196d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 00:55:44.5466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FJmAmcDNgfTEHiDABmcbSAbDZ6UdzAuKz1bVxcE7YVwJmX3DSDsaDErndDBcLBWs0Mr3gc/id8Da5dmLyp6BVpcseCm2a/Sr1W4o5aRceRL6NMNMaWZdsHTzfBxVoMJ9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11566
Message-ID-Hash: GBDW4YRH5ZSPHJZMVLOVR7XALBDXB6WE
X-Message-ID-Hash: GBDW4YRH5ZSPHJZMVLOVR7XALBDXB6WE
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GBDW4YRH5ZSPHJZMVLOVR7XALBDXB6WE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

2 weeks past. This is v4 patch-set

Now, we don't need to use dpcm_playback/capture flags for DPCM since v6.11,
and thus we can use playback/capture_only flags instead too for DPCM,
which is same as non-DPCM.

Let's remove dpcm_playback/capture flags, and use playback/capture_only flags
instead.

[Before]			[After]
	dpcm_playback = 1;	/* no setting is needed */
	dpcm_capture  = 1;

	dpcm_playback = 1;	playback_only = 1;
	dpcm_capture  = 0;

	dpcm_playback = 0;	capture_only = 1;
	dpcm_capture  = 1;

And then, because no-one uses dpcm_xxx flags, we don't need to have the code
for both DPCM and non-DPCM. These can be handled by same code.

This patch-set is based on latest linus/master branch.

v3 -> v4
	- adjust latest amd
	- rebased on asoc/for-6.13
	
v2 -> v3
	- tidyup Intel files

v1 -> v2
	- rebased on v6.12-rc1
	- tidyup flag handling for sof

Link: https://lore.kernel.org/r/87r091lwhg.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87r0979uhx.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87y138vbv7.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (13):
  ASoC: amd: remove dpcm_xxx flags
  ASoC: fsl: remove dpcm_xxx flags
  ASoC: sof: remove dpcm_xxx flags
  ASoC: intel: remove dpcm_xxx flags
  ASoC: samsung: remove dpcm_xxx flags
  ASoC: mediatek: remove dpcm_xxx flags
  ASoC: soc-core: remove dpcm_xxx flags
  ASoC: soc-compress: remove dpcm_xxx flags
  ASoC: soc-topology: remove dpcm_xxx flags
  ASoC: intel: boards: remove dpcm_xxx flags
  ASoC: soc-pcm: remove dpcm_xxx flags
  ASoC: doc: remove dpcm_xxx flags
  ASoC: soc-pcm: merge DPCM and non-DPCM validation check

 Documentation/sound/soc/dpcm.rst              | 11 +--
 include/sound/soc.h                           |  5 -
 sound/soc/amd/acp-da7219-max98357a.c          | 20 ++--
 sound/soc/amd/acp-es8336.c                    |  2 -
 sound/soc/amd/acp/acp-mach-common.c           | 24 ++---
 sound/soc/amd/acp3x-rt5682-max9836.c          |  6 +-
 sound/soc/amd/vangogh/acp5x-mach.c            |  6 --
 sound/soc/fsl/fsl-asoc-card.c                 | 24 ++---
 sound/soc/fsl/imx-audmix.c                    | 18 ++--
 sound/soc/fsl/imx-card.c                      |  4 +-
 sound/soc/intel/avs/boards/da7219.c           |  2 -
 sound/soc/intel/avs/boards/dmic.c             |  4 +-
 sound/soc/intel/avs/boards/es8336.c           |  2 -
 sound/soc/intel/avs/boards/hdaudio.c          |  4 -
 sound/soc/intel/avs/boards/i2s_test.c         |  2 -
 sound/soc/intel/avs/boards/max98357a.c        |  2 +-
 sound/soc/intel/avs/boards/max98373.c         |  2 -
 sound/soc/intel/avs/boards/max98927.c         |  2 -
 sound/soc/intel/avs/boards/nau8825.c          |  2 -
 sound/soc/intel/avs/boards/rt274.c            |  2 -
 sound/soc/intel/avs/boards/rt286.c            |  2 -
 sound/soc/intel/avs/boards/rt298.c            |  2 -
 sound/soc/intel/avs/boards/rt5514.c           |  2 +-
 sound/soc/intel/avs/boards/rt5663.c           |  2 -
 sound/soc/intel/avs/boards/rt5682.c           |  2 -
 sound/soc/intel/avs/boards/ssm4567.c          |  2 -
 sound/soc/intel/boards/bdw-rt5650.c           |  4 -
 sound/soc/intel/boards/bdw-rt5677.c           |  4 -
 sound/soc/intel/boards/bdw_rt286.c            | 10 +-
 sound/soc/intel/boards/bytcht_cx2072x.c       |  6 +-
 sound/soc/intel/boards/bytcht_da7213.c        |  6 +-
 sound/soc/intel/boards/bytcht_es8316.c        |  6 +-
 sound/soc/intel/boards/bytcht_nocodec.c       |  6 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |  6 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |  6 +-
 sound/soc/intel/boards/bytcr_wm5102.c         |  6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |  6 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c      |  6 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |  6 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c       |  6 +-
 sound/soc/intel/boards/ehl_rt5660.c           | 14 ++-
 sound/soc/intel/boards/hsw_rt5640.c           | 10 +-
 sound/soc/intel/boards/sof_board_helpers.c    | 15 +--
 sound/soc/intel/boards/sof_es8336.c           |  8 +-
 sound/soc/intel/boards/sof_pcm512x.c          |  9 +-
 sound/soc/intel/boards/sof_wm8804.c           |  2 -
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    | 20 +---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |  6 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c     | 24 ++---
 sound/soc/mediatek/mt7986/mt7986-wm8960.c     |  6 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    | 10 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     | 10 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 34 +++----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 34 +++----
 sound/soc/mediatek/mt8186/mt8186-mt6366.c     | 86 +++++++----------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 58 ++++++------
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 78 +++++++---------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 60 ++++++------
 sound/soc/mediatek/mt8365/mt8365-mt6357.c     | 14 +--
 sound/soc/samsung/odroid.c                    | 10 +-
 sound/soc/soc-compress.c                      | 15 ++-
 sound/soc/soc-core.c                          | 20 +---
 sound/soc/soc-pcm.c                           | 93 +++++++------------
 sound/soc/soc-topology-test.c                 |  2 -
 sound/soc/soc-topology.c                      |  4 +-
 sound/soc/sof/nocodec.c                       |  7 +-
 68 files changed, 318 insertions(+), 583 deletions(-)

-- 
2.43.0

