Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D74963987
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2024 06:52:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 819DCFAA;
	Thu, 29 Aug 2024 06:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 819DCFAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724907166;
	bh=gjvpgAo7EtiOhtXQLGFfDc6vG2Kh30p9nsvmoQ+77cg=;
	h=From:To:Subject:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Uozb2t7yiys7oGiq85sO9pV0rKv94eARmet0PlwXVn3dsiZM42jOMGeJze5QfzVWG
	 msnKifeCSg9B2NXNzLl8a+x6Nlvv/ynlQ7hRsOrMoeYrgypgT59GPn1Ee2s3+xXG2B
	 i9CaNQqjyNUNxa9kBBAERrrA25aCjZuIz2dfE9bM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA009F805B3; Thu, 29 Aug 2024 06:52:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6720F805B0;
	Thu, 29 Aug 2024 06:52:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F033F80518; Thu, 29 Aug 2024 06:52:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED8E3F80107
	for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2024 06:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED8E3F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=e9lmEHco
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFAOaPVCX3bpyA/Ens4jaVBiSNyvt+Tt+QUaWFos1u/Mt0a0WTrisM4qJymjFlVpNPOc7vGhEqpkCuByXCjtjcU822ZbVLtbW/UO/cNBtqYdOMBMQR0IYe4X5jMyNlJ5oi5llNqhF0Kj7Hhl9fuxZdb7L3ak7bnYdgEb6Oty/iDkv3j6z/pK8OxDSujrUbwiWn0ASfhk7ztFpiYJh+IZuHRD9DSozoldLYh2npS72c/n9ndL/0OTZmEXn3ddhD0GvbVXsZSbfNbg2uLhBjWb612OMOALQZix7JyIeeQcDWCDO98RtpJBERq/oFMyczliGZj830xAHeS514J9BNf+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IgKBA/I3YoTixCUAEssqE+zbUlmXbGdYQVhOAf5sqg=;
 b=bAVa7w054XdmpseBSTbCP4zDso9IatgtoB13dVt2P5vj5cTQ1tNelb4qck4mgx+3IJcQKnk+lotfscjexad6/6AC6/4KqzoQEiB940ZcIuXVSTuTFSMNNnk9uG3QNDI8NU+QHOziZZlbpcqOyR8CK45rbekYEfBPz5GD9nAfA//VBDbSlrH80rwJ8uF/Gx4W/BJBOvclJWRR9XmJ1bEphcW6p+yFYMreCEXctwndHZwcKxhkCZ+Gd55EYavYNKd+99JyVMYVUFEBSJaOYMYzKuERypGAKGdM4fFLgbhj1rJ6e0TI/gJTut+UNFnl4l7+2h6y4eVoNwkO2e3Y/lZXUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IgKBA/I3YoTixCUAEssqE+zbUlmXbGdYQVhOAf5sqg=;
 b=e9lmEHcoT5hlxO3G9+6jnPKA4BYsliZf5UmfK2Li9PL60orAFgh7z3KMR3P169/WRUib/0xKSqrjOfrTqJir+u9JbFxYbGnEk3PO291Md0bsvqpLH3/6Yco+A/cPsX+8Eo9wWV7wMc9ri1hO81AfIHX0mVFb3ylQbqsuQU4YghE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSOPR01MB12202.jpnprd01.prod.outlook.com
 (2603:1096:604:2dc::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 04:51:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 04:51:49 +0000
Message-ID: <8734moq6ca.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: How to handle complex Codec2Codec
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 29 Aug 2024 04:51:49 +0000
X-ClientProxiedBy: TYCP286CA0307.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSOPR01MB12202:EE_
X-MS-Office365-Filtering-Correlation-Id: 830c432f-8dea-44d8-598e-08dcc7e64b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K0R+pIPKo5sDyrIK5b7OGxt9zN5Oe42uCMzdOxSE3iELsMD8hJvnxk8euJYg?=
 =?us-ascii?Q?lZo8rTLzXsjw9SD5UE1eziQMgkCyOacS7oHAM3dZD6mzBCQ7ONrOe+NJ8yNN?=
 =?us-ascii?Q?KyC/x8xlwWNwlz0IqnWy369DNUbZKAUGb+oatmmdbuGuN/OGqX95pCRDSbUS?=
 =?us-ascii?Q?nQ44Er7X+/NcgRrhTzZrkWALEWaqGH+FBXyKfj3ku0qqr9CRoXlev2uf0nTA?=
 =?us-ascii?Q?M+ZXohQnc/G4BpjtZjXn8KaBOu7zWyxsUCEanEkQ3Wd/ZXx250CgdsVMSvIi?=
 =?us-ascii?Q?rVRSVQ9rIL+L8rkyxNh78Ois0BSvDN3yz0GMAVMfViyfZ0Ri0kYmhRLGsAW/?=
 =?us-ascii?Q?FEXWBt5Uf2Cqa5jWI46l+w8AB2rcML150YmoE3fQKRR+Vspetga2AxbxYPwH?=
 =?us-ascii?Q?qESv8J+cOEjfIPRodjt8g4sCU6KeAI2TKSKJVokiExCGuHTN9qyAzn5+IHx4?=
 =?us-ascii?Q?SnCja51fMv2Tu1zUeVRHGCMNOU92UyAc6ye8vFd1z0GVNVpmva5gNLxeTTbT?=
 =?us-ascii?Q?Qjd6z37MExU4ML/MIaGq4WaqFn5nOZ3ZqzaQnSfXnCc8HVpvpE4zpTuFxNoN?=
 =?us-ascii?Q?EzhcNXRrgGsN4adw6h62tbm6ocfREUvlpEu5i0rGDp5wvPf7wZHRaz2icBnG?=
 =?us-ascii?Q?tD3udjrwM5/okYFbJZcvRwuuAFKQl0JOvKQ9LUZWmTjv58y1Bo8BvAe71m5i?=
 =?us-ascii?Q?ohttIncHjqHTSPx5gLyMgT2OVWw1uqSV3/9kTOaUrWZvwjwwSL5wOq7o+Nqf?=
 =?us-ascii?Q?WA5tmPKXsT2TtgWhMbBi9Gm1Ou8EdELe0ml/wvFLNIqmMXiQt9AqreS6WPs6?=
 =?us-ascii?Q?lZuI3BVdIz3nzN89znPgN+LiYfhNb4t0s5qCQ1aZ6mkQnGNTG72WNfy+T+RF?=
 =?us-ascii?Q?8+uTRHynfJ8QoQkiM1wmEkP8C8UN8/kPMhlHdqVAml1SupfIpvMVlh4Kv00t?=
 =?us-ascii?Q?eh1hlBBj4qRzybFx/qJvSPPjKkqPJ/SfdqBuAI8mW5xnV3O3C1tI1FItmRiD?=
 =?us-ascii?Q?SuC1kzjoDS/HuAOnFMI+lMJ5R5344ZcBo8crx0wbSYHhJVg8+35Knj1iZvrt?=
 =?us-ascii?Q?ArAthfsxQS/lpNz4pg4lVH3I5/otu6UKL5XlJ1tZWAg1SF31YCfYojQXp2Pe?=
 =?us-ascii?Q?pUnS9QJFHXbYuoSC9WSXOsLZBD/DjD67GJs8UJ/IFXMKWLGBL6RPt+UnODqE?=
 =?us-ascii?Q?68lbGYjCIvyi6+YhzCyTUD/9sW6ocupsZR/ehlYrFF0uAOMrsUYzfYBcYgUI?=
 =?us-ascii?Q?Y1DkBAx3/pus9iE5aQrIt92iDFikCuQBlTd48SNn8FJwEi2r1fCfMYKuLn8d?=
 =?us-ascii?Q?W+Sg5k6bzJlVYvy3zOVYM0mFgdzKFFcu8TRyWVMlcz7sUlGgzaC7VrNm2wgA?=
 =?us-ascii?Q?MQs22QaoVOYkGL2uwWm0TmP6WhNHFjkAJv/HQ+p0kOg07/IG5w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fzlBjIbzjLLYB33oOo2SqF8th4rNIRBk9ZQ+myFC+EIwof2HdwflBIN7w3V4?=
 =?us-ascii?Q?j+zdGpZgV23R5LJuqv0LpuS7wJzl0bsU+MHMPSGxSYYBllZPKi5DsAcCukHV?=
 =?us-ascii?Q?rGcPDqe4wLo/Pf+467JNjAXexY++CbfrSllbakU60fUrLJv7gvVUrQIsucrw?=
 =?us-ascii?Q?XXtFQMLVaBrqOLGOIkxjUZA0CA1nLjKqhxeehcBZJ52HQjDG/bpOyW+4FbWo?=
 =?us-ascii?Q?LBmQZY9B//3059HeOz4wW11DbRJqrXHG4lZdtPAn0w6qi4b+WuihXSeYbB/S?=
 =?us-ascii?Q?mmo8Ef/juNC+prVuK0EZ+2LaP/SGNua3JWTBlP+NRnLveJyLEp20/8XPb/FE?=
 =?us-ascii?Q?of++GZLe0OQGYNxRLHWPRgbrBnngvCFFCfgqr07h6vLcLsd7CUqX3JW993qC?=
 =?us-ascii?Q?e01ZIP86b2pTf779mjfnpcVgjkrO8CHrDFN6ZxQpL7a8Sn8UDTVbQQKSyycX?=
 =?us-ascii?Q?3Oy/Aq3t+14lZI50bUxwTBde2MC9AX8VzHbAouee04xE1bgfvwE6DtC6OicL?=
 =?us-ascii?Q?3SQ8BoCBocIRzQwKXnEaBPiS/flLUK97xYvl86/svH191udyT1pmF3nDycgV?=
 =?us-ascii?Q?4hgBtMeHcKdAFcTb9q8SkG+Iih/VUEbI220ogQWr4GcezloOfxweyYvaZi1c?=
 =?us-ascii?Q?w872Py2ohMilR3e1S4LNVSjE+J50h4s3Vr/qkL2HR5cuFJODKT8Y9lIWROvf?=
 =?us-ascii?Q?Ye/7992SI0FcRdA2iNlxamunNidB4GBOWM60btwjTZvgKPN6DWiuT70/7rMJ?=
 =?us-ascii?Q?atJOxdnPozRnwQy72ASHVettptNAV41semh70R5EHG3SByKjwJ/4m3kAJIVY?=
 =?us-ascii?Q?xaCB8a+xYGn5tNlXsqzdGJ7ClM3pUEJl5GVS+l0L8ayTnGuWbxf1dqowxPDR?=
 =?us-ascii?Q?kujXzQqGc7WdkZR2LZNOwjGhMjLjLy1egnSB3TbRGlpcTKJOdTYQdNnFXZEj?=
 =?us-ascii?Q?AUYhoBIQsCMlKWIeJltKLYZph6AcKDrFozMhdLxL8Bn2ApnIoUAeEXLM3KMj?=
 =?us-ascii?Q?243dZoY0H9nh61wV3ep7QJvvj0ylq5WmeiRD8vuTQdgWEFd+a374Uio9cWPB?=
 =?us-ascii?Q?d/CwwXTl6m2WbdITEPSU+svy3oZZAPOLHa1y5t/t7njVlH/O8LEAvGej7tLT?=
 =?us-ascii?Q?tx1ZkyltiRs1awuvLMZuP6crk1P28ObR4dcs88CMshq0Nh5slc0/mdlmW4PG?=
 =?us-ascii?Q?v4CbHm4UktlMVKx9p0Gd2O7woyMGwp6fw2JFOr3/Siq9U/CAguAUl1XLYnt0?=
 =?us-ascii?Q?qyaZ6QIgHnqdTB2MdmAhINXZt0YDTMkT65zaGNQxpPprZ0vnZr5YsmQ9/IC+?=
 =?us-ascii?Q?HIa7Jmvze614PyXWrN6GuLRkIw3XYfWiqm2wZI5mF0Xxnw/VsHf8zIbWiAhi?=
 =?us-ascii?Q?Jy8scTNBnw/Rtutqd7SBP9sTD+I7yAdqfiHjyTYWCzMoDFDib2ZNpkrKrW46?=
 =?us-ascii?Q?pUnvJpc0BGnuF1yW5sVS3OwU2BSQBtT36SffYW9PXF+VfFTZ2v/xfdffLe1d?=
 =?us-ascii?Q?SlLzJyLDQ5eAZkYyjVKmUytyvktislMfjNEcZHFP/3bGvHVrLHpd8TlJ7yD2?=
 =?us-ascii?Q?+dBtZqyBq8ynfhregxnngoyeZnM+jH4gzSW6wn1zsRC8h6rE9xhYGMzzEu5U?=
 =?us-ascii?Q?J8G7ZBoVl3WI2uK32IwoaGs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 830c432f-8dea-44d8-598e-08dcc7e64b2b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 04:51:49.8212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nAlHYwQzpEaphabjiiTFEfaUqxLpSm80077ZjH/i7TCzrVOua/KBEXqARnaKMeUHNmbsGMAyn7E/rsMIMen49k7bKptpUhIw9krO2eEDeqB0H8fN0ynyJMBwVYJ++aL+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12202
Message-ID-Hash: QSLQDCAKT25SYVQANDLAXYHHVV3AS4GF
X-Message-ID-Hash: QSLQDCAKT25SYVQANDLAXYHHVV3AS4GF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QSLQDCAKT25SYVQANDLAXYHHVV3AS4GF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi ALSA ML

ALSA SoC is supporting Codec2Codec connection, and Audio Graph Card2 is
supporting it. I think its image is...

	     +------+
	+--- |Codec1| <--
	|    +------+
	|    +------+
	+--> |Codec2| -->
	     +------+

This is OK, but how to handle below ?

	+----------------------+
	|CPU                   |     +------+
	|  +--[rate convert]<--| <-- |Codec1| <--
	|  |                   |     +------+
	|  |                   |     +------+
	|  +------------------>| --> |Codec2| -->
	+----------------------+     +------+

I think there are 2 issues.
	(1) How to handle [CPU] part     on Codec2Codec ?
	(2) How to handle [rate convert] on Codec2Codec ?

I guess (1) can be handled if [CPU] was worked as platform,
but do you have any other idea/solution for it ?

I think (2) [rate convert] needs DPCM connection,
but how to use it with Codec2Codec ?

Or, can we handle Codec2Codec via DPCM somehow ??

	    FE          BE
	    +------+    +------+
	--> |Codec1| -> |Codec2| ->
	    +------+    +------+

If we can do this, both (1) and (2) can be solved, like below ?
In such case, [Codec1] need to work as [capture] when playback.
But I'm not sure how to implement it...

	    FE                              BE
	    +------+ +-----------------+    +-----+ +------+
	--> |Codec1|-|CPU[rate convert]| -> |dummy|-|Codec2|  ->
	    +------+ +-----------------+    +-----+ +------+


Thank you for your help !!

Best regards
---
Kuninori Morimoto
