Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A62885F127
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 06:55:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7898D7F8;
	Thu, 22 Feb 2024 06:55:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7898D7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708581334;
	bh=fJMGBNeoW4EJZDMCUrLTw+DlcTztXzMOAHJwGY5hjas=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=N+2ywfwzppnY2mvks3LQx/MPDGPrDsMAloUHlRjt24GsuSbVnd1X5I10ioixwUPLf
	 wlurKqK9+zXLiaq5/XLvCKZDli19Xx07wR+1MRZ0JoS2iEADXgwLuUcIfYq2AL8EWW
	 aYHPrxoeer41ygaBZSAb5m/pSqFpLT5DWJAd6LiU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40A1AF805AD; Thu, 22 Feb 2024 06:55:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88884F80567;
	Thu, 22 Feb 2024 06:55:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89704F80496; Thu, 22 Feb 2024 06:51:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8B6CF8019B
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 06:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8B6CF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dTevWXyO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qbk1ryNwmd6J87+eLbdHRW6FNVmgmB8mrtDsDUvpRgrnex4ZnJ9TWWrxu6U2VqXSQ6pLO9P49csTyFAK1PINyEDj1+raLx5DZiN7j0OksiDA93Vh5fCQk1+0KSZQx6Sbh99I3C/vv40oQibuvlUROOQbr1DfCRfAj7nRQRzegxp+YFgSdn/yLJX/mS2isKYjkNJGOpL7EKdmay9zs0TyV3zjsbY4kpKWYK7+KkOBU8DUxMzxIp0CIrnNm+Dfu0oZIw79psH4Ft9k7nXmdYrg8tpVzeI9wWsUtuVYoEsSY0UE8QGXRQAs6m4wCGExx9BhaJ/QDnJyFaaecUNYLwCnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dId6wyrdvQbm6PtWe9dmskZnr/fOoozboeQbR/AKqKE=;
 b=GWE5uL6iDcARIWYfppP3DzEm6Jff0qOQVwIfSbCVGMnKeVoDyrUInvkhbnYgVNQQqW5FoTdqbumjGevWPo3xWwSYnAXmajGA3FOOUP4qB1q7TSd1tHiJx+xTqNqcKKrF0jqzvKCnxXAFsMJdc4+b8fSA6UYW9PqhD4Sl3pxd9u5X28KkWBvU19xcyv8ff7b/oCYSTNRKC4kstkcio2LgqXs9zCnZ95WyutO5lzgpTgTy1gX9QnvMD3c1fPwB74yYiGFD5LmA9PudG59nnVgwVW4xwclzgok3Iw3/uMVgnIrmTlb1svzONKRqe8R6A0hte74AjRdbO09IxAUWtxBlLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dId6wyrdvQbm6PtWe9dmskZnr/fOoozboeQbR/AKqKE=;
 b=dTevWXyO3E2p07ncGo31YMjvORmiNWGA9fxhYI0DdSTvEec61aJgTUGMJXtSpY7Djgo+4L1XWh6gk6pN6w9h1jx+/3MXCErwspV1T32V3faLbsLvhDtEM0ZfRUNIGMWKzGwi8d4/bbdq7oWam/aiKPj0XOt6jxKxgs9dxkCdqdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11410.jpnprd01.prod.outlook.com
 (2603:1096:400:409::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 05:51:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7316.018; Thu, 22 Feb 2024
 05:51:11 +0000
Message-ID: <87wmqxjbcg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-core: tidyup strcmp() param on
 snd_soc_is_matching_dai()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 22 Feb 2024 05:51:11 +0000
X-ClientProxiedBy: TYAPR01CA0160.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11410:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc27c88-4150-45d8-78e8-08dc336a4623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5oo71/HNMDAfDGx0ldB0hRDQ2H2Btd/gQi4Nkp2TzycK5LDBISntanSEtWCobgjn51ENr2gbsk1kW/M5T424sq7jHShptl3I+pMu7iDKmN+fckRFIjt89NiHSQrnLY+ih1IupYmPKwArlu5meKgOlcwU77/fQcRUu8Q2b9/9nVYTSQgxAhNIOjBo9ceMCsVgQ6MUHTpbZKbNFFAYrOzQUFgCB0Yn1pPZEPPTwryc6LNJkx2lueoln2CTYKaHy/lqRsU5TbxwK8kJEeNQvhXqZwhqez/XhG9vgvHAcd9Q8o5hT3NU3FP9XN2zaOlc1zTnv2fRIunVZLo7KY1u2BZV0feUiYURDdvrJY7qz9qGrR1KVfNkUPdCHQokVb4XQqwfYJb+88VXzxT9O4F9IYUpRTSWGzvVHQELJF69zi7mqgeNdRTjxs7V9l1CzCZjol7O1kKrfYpMYFlQj8h+iqyNswoZVu/JM0BGXjAo8GYq1OCeGeUcdLAMoDLpCAAWVe8guQCf2XVWAjTfgqaD5TqfAp8Dt+HL3m9sjnwnSHAKECRGG6AH5fx7kQ0RQsg+/I1N8SzZophsFVlc5nuKHwKEX1z50BVOF7r9BaFRoc08CVa9GSkQPa3MqAZ6cad7Ng+4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8YQ9KTOULVQc6GOfHGjiKIqmOK6vtejYvxQfVYbfub189iR8y6zyDPOtwx+a?=
 =?us-ascii?Q?J6cSkk++AYVXmSwRFXp4VWDQa4ohKqOIyMTLxz0aG4kpX1Z4cUsxMR0LZUPy?=
 =?us-ascii?Q?hB9srSuR0OuXrdF3EhOgEt2s4i6xGAJwraCue0WNov5tsDesagsaAXXbv6I4?=
 =?us-ascii?Q?E5MgLE+kxlYfXt0i1EQXWNMpZrxr6ZRLOnUU44dtMcMsjVqnz/AKSHV87lQH?=
 =?us-ascii?Q?tfj00iDmD8PxcANUYv91p5ckjh3mRf+A/NsRaUMVEmlxn8SNUjLPN4hqTH7S?=
 =?us-ascii?Q?QgcKoIV0sLVEjAy3VdRdcg6wdfRAGMRxSZx4nwRlwSeSQojV7nM8rAJRMboa?=
 =?us-ascii?Q?DnLPkoAA7tI2GZf4haS28Hnuj5pnqv+wTYRhK+1YicIemZvLX1UAq0PZslOl?=
 =?us-ascii?Q?v8hINjwalkgXJm3xRIadebwl/WNYKzkR3dDPCV+3dyerRRTvrWfU2Pja46pE?=
 =?us-ascii?Q?PmcnpTaPxOD2xyxTMcsV/6a3ktFB0OCMdNUaO2S3ckMVo60NOa5RaPqqlfL2?=
 =?us-ascii?Q?+RE9NpV1FVrD78cwVX5wBciqwwoMkF9sCBH6NqtLmGwB3eNmwMdPdOcZyapK?=
 =?us-ascii?Q?GHFaqBu71J6YO0PsktUki5czTeYU2KHdUhEb3/l1wFFuy5FNfj9igASUuBJI?=
 =?us-ascii?Q?QCh1Q6Phr0gXt0PgTL48+5xEN7HmCP0OfI15LGECoJO8qyE9ep9HnJHjfvel?=
 =?us-ascii?Q?11MRjCrutbDGj4bp37lkFu/07Dyf3ePfxbBAIyuzorIF8hwAqHqBePmmenxZ?=
 =?us-ascii?Q?e9zGB/ENNtCAzsk3OtmDu3rqs+6kWYRxbtNzwb6rDYNTjFWxhORTRB4+BC2t?=
 =?us-ascii?Q?wzSOiKG8k9DNg8zUUIUZbiFqA9yV55fmHBZYFD8tos4mlwuESKlsdO8clZTl?=
 =?us-ascii?Q?dPmMHjeiNoyQA6bQg4SMce71ePfPGsFwdUzTNTLzqsy4njI8do3vrYBMNnhE?=
 =?us-ascii?Q?z41WydSOS5h+Vf8GjJzTi1yzGqNBv/5DYANI/ab4MVy98rSx2cgmlYFH9pCX?=
 =?us-ascii?Q?N8llUtxpn2Nad67CUUBlwTs5iCsDVfbCLdmXT72TD3a16NebVWJT393FGZr5?=
 =?us-ascii?Q?/t1vlesHe1gcCc7xAs22sIRTAf5g4XoUs/HR3eWgynry3fk7jpPG8yEacBGa?=
 =?us-ascii?Q?HLYv17mkPOINA0HPrkRADdVBmsepSaZqZSDIoi4xBmelua2wIOqZStmwwdQv?=
 =?us-ascii?Q?SPeCe3bdn5w9L8L95ySjGHGPQNFGRpuMtqtW1FVkUZGK9f0+BfcPaFXj7rDg?=
 =?us-ascii?Q?SJVrdEwU8OElomAWWRdYiw/t664nzcQX158Ut2uTxoew5oGzZqaVISQSZchQ?=
 =?us-ascii?Q?k30+dHGx7vLyUidgbFhx6iXExwR+Y2cmLm7uNghrwt+p8eFvPDFdAKFiigss?=
 =?us-ascii?Q?TVETg86VDhuWtPA6MtQJs+06Sxksz4OJc2YXwbucz6K7v01bMEuxPN+m+6jR?=
 =?us-ascii?Q?2J7A1dtFofrArsdWRBWw/tkx6YS2ntRbI+zMsZWfvODLgGdET9CEuSFOvQTj?=
 =?us-ascii?Q?Wjq79dKsxfNsPmera3H0DhgKh7f/Umi6t2XzZXQdfTZ02nF8JjtVGyCrZyzG?=
 =?us-ascii?Q?KnEpUWhv0ds7EFBOuSqcHc3xFqZywj5WJcNxYkzyhO7sl5SXapH9zhcfAAkD?=
 =?us-ascii?Q?4GF8uSxeA5cVrr3R69XMJSU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8cc27c88-4150-45d8-78e8-08dc336a4623
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 05:51:11.8041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Z+Y9+a8KRLFRQs7YP2PC2OjWNxMOtQbWVWAF7H6uN+rxhhdFk+UZKD08g+yap7/Wflk6QdOH9fAGySof/qDJaDbrtr63V5Qnsp9raD6XltqeqhTecblHJh1qKp+3yOl6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11410
Message-ID-Hash: ZFHPL3I2EI6KL2J2TAAKZE7W5GA4AGWF
X-Message-ID-Hash: ZFHPL3I2EI6KL2J2TAAKZE7W5GA4AGWF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFHPL3I2EI6KL2J2TAAKZE7W5GA4AGWF/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_soc_is_matching_dai() checks DAI name, which is paired function
with snd_soc_dai_name_get().

It checks dlc->dai_name and dai->name (A) or dai->driver_name (B) or
dai->component->name (C)

	static int snd_soc_is_matching_dai(...)
	{
		...
		if (strcmp(dlc->dai_name, dai->name) == 0)
			   ~~~~~~~~~~~~~  ^^^^^^^^^(A)
		if (...
		    strcmp(dai->driver->name, dlc->dai_name) == 0)
			 (B)^^^^^^^^^^^^^^^^  ~~~~~~~~~~~~~
		if (...
		    strcmp(dlc->dai_name, dai->component->name) == 0)
			   ~~~~~~~~~~~~~  ^^^^^^^^^^^^^^^^^^(C)
		...
	}

But (B) part order is different with (A) and (C) (= ^^^^ and ~~~~).
This is not a big deal, but confusable to read. Fixup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b11b2ca5d939..507cd3015ff4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -287,7 +287,7 @@ static int snd_soc_is_matching_dai(const struct snd_soc_dai_link_component *dlc,
 		return 1;
 
 	if (dai->driver->name &&
-	    strcmp(dai->driver->name, dlc->dai_name) == 0)
+	    strcmp(dlc->dai_name, dai->driver->name) == 0)
 		return 1;
 
 	if (dai->component->name &&
-- 
2.25.1

