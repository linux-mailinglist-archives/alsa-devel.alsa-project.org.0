Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B587A596C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 07:36:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2F4DA4A;
	Tue, 19 Sep 2023 07:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2F4DA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695101763;
	bh=Sh5Uuga/OqB70gjoeoxiwU9bIX19o1wj8HEYCscKB5g=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QN5FB4A0oKteDt95plQh5AX0zFrzyRvuDozLKcqazKbBAS56lyyu48VIAhVRXm4ho
	 4Ki+qTb+pNp5QUtPO67OxfWkjE3QoaPtQd885A61QATiS83nPUYt5s0JTMyVhCnrer
	 6UJe/IUIGgFWGM5kzbaJjohndGp0fU7qIqb7tChM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01EEEF8047D; Tue, 19 Sep 2023 07:34:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 652AAF801F5;
	Tue, 19 Sep 2023 07:34:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92DCAF8025A; Tue, 19 Sep 2023 07:34:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61B53F80125
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 07:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61B53F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Wnwh6aVl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ek6m7E8LxERerMLSYSoDHd1IAGMywt0rHOE2uBuxepftMJxdpeTehqptrK6QVU3izOzXkWkIPFdlocmpkJ6fvmeVZzf4FYDzMnopfNEe62HgvG0S9r8CCjII7c3F2laAyRvGkd8mhBvRBaHuq/wx3eXCDrCkRjOsVcXxRswSD26KDEYp2jzHxULFWOehLNygwfHdvnl+ox2YAsmyoGUl350LmRw9pmODxKWJzdv38REsY2MZWi3OeAFy7FxA1vys/1q1V35EQPizeW9f2OhdM4kZNVwbvzTwkZUTm4JP3yPyS7Hmq1Yt69UMCCvohe9ntqrgvk77cmJXz7s6GpCdtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTTZdYiHCkcmpM/G9vC0iDK46wnFG//HttFuHvjBVUc=;
 b=AXv7ql5j7iMuLVvMB5+93ocBrwW7TOCi9C1x/6b8bI799pzy8xx1m8VJTzvf9qrgRBVMhPqHVtPog1XQeAaL5Ih9TP7ZlFVuWHGcvheR5k46CJa73R5mA4R878mO5DCGGRbsDnmo7uYCWOP5uXHhYHGQ5iR4gIYWFOkPkdO+MDHMnhJeqERmhLp0tRyUnhn6FSna97RZkvS1WU8YvhfsVXpHmPaTJJXuYWMxInDqC/Qv06fN2WQcQnYqwevwnKWi5GtCvKd3nS7XHZkvlXoFynv3I8CyHrg0w5DB0VwPRDgxBYuQ2Rrn/eeLteYZ5kGzGyXQWuKIdcVTZ6IXIqnpVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTTZdYiHCkcmpM/G9vC0iDK46wnFG//HttFuHvjBVUc=;
 b=Wnwh6aVly8A+wWJt1DBkFRFACtvNhhmDv8cv3wODXt1TGT8+0EmJRnW+a4C5OFz8C+AvDo7UKO2qs3SH/fZjji1Ewvt+V91oSvzr7Vd0hgF2pLS550rbqjPQg3IT4I85c3+NNRwwiKwGV+jISGm0HYcFG+LTZQg9YVyJS5vSs/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8068.jpnprd01.prod.outlook.com (2603:1096:604:172::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 05:34:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 05:34:18 +0000
Message-ID: <87o7hy7mlh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: simple-card: fixup asoc_simple_probe() error handling
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 19 Sep 2023 05:34:18 +0000
X-ClientProxiedBy: TYCPR01CA0142.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 70991f86-30cc-48c3-9e45-08dbb8d211f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KEqvtHWHd6IpYsbHIjZ7FFaGJk3D9LNhw3G8F4c/1ZmRN+A5kr4pk4GOz8lScWryjlHa1RqyafX6hCqEDema8mp0nwi3851YCi5CuTwLov9DkpiR13t7kvlsKS36rx60p8HAWRdfOQ+4BZ6ZBN1MierL2zMH6zuhnu8bsNVPJ/nuQD+WYHqfafg3uvU70aY/5D9DRxg2yaiLMJyWUbxRXD16Md37d+0CRFmMhpZpCyPnnF5BBzji6tOXLcg2DaMlWyG1lLxR9oYAMA4AZULwjoLZjNLOmo2WC2asf7i0FZsiHQ+KoFfM0puTLal5gZyvKcxjyAKk+/wAxQn3Guisc9EoeB1fNagWgqs3yhkYiQweCYZhhqhD6cBUVnps01z/bfzd7yAsE1s+suNVsBHJz1WVQZEzrK/674bldt8fDsaYselsa5YAN6gxylwY+vBxnQIhQRKUGQwvo5ItPtELNgzT/3V7Y8Z75XL/z1SuQDjBDT8cNjDgFfc+Lwh7A2pzJfn0PF6uZ/CMvbnBQTc52mb7W87p7tigoNSTYK5WAlHvhOpRd2UaIuO64/wjrphJjRr1iHSLX9S2UcscDkF0n2ARVrMjVQKGshoFyCqoFNXOicFzlhxo41nx0O5ymYBXRU+LPokX+0KFmgoIteyAcQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(376002)(136003)(366004)(451199024)(1800799009)(186009)(6486002)(6506007)(36756003)(478600001)(83380400001)(26005)(86362001)(2906002)(5660300002)(2616005)(54906003)(6916009)(41300700001)(6512007)(52116002)(66476007)(316002)(66556008)(8936002)(38100700002)(8676002)(4326008)(38350700002)(66946007)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JAJnBJfgddT4osQvSxWfFB0qa8f6vsahlXVnlC266UnoI2I4LAuExXRnOWn6?=
 =?us-ascii?Q?EWUB6X+OOB4adpmq7eaxU921XJzV75uat9IL6tvKaGcCJKUkucC9yFQ4KB7D?=
 =?us-ascii?Q?kKOIG+50CDz44rLE5GG7hW89cYtwHXyyK7OIh68IhIh6fS4pZTsVtz8Sfgkq?=
 =?us-ascii?Q?yObOPumugyw83Es+Q5rOBOsgSLt0ckUaaJ9/Wd252tS3VR49blxS5H9U8idP?=
 =?us-ascii?Q?YKf7/ciWSybyadavp2/3uOp9p7879NXPv5JIvhGhp95S4KvIW9trjFyrVDAt?=
 =?us-ascii?Q?TtsWh9mpo8gi0bt6DOOIytgajo7OzDhEI+zKq/SfamsSExR7QgPrTV2Y3YqZ?=
 =?us-ascii?Q?JLAZ731OfXhRXmcJjLOGaAEvaRFoPcLu3yTrOFgg5auyXQDU8+p56PqSbr/u?=
 =?us-ascii?Q?u2XeQ21UvQubVeFlLkGWQEAan7wVB+RmqtlEaPltmJGjJUN9d1XPq39qXIKf?=
 =?us-ascii?Q?wNETmht/qP2tWpdTUgxuiEPNkrfxUsIammSJChctFglCP2SiZcjsSP+XIymv?=
 =?us-ascii?Q?+J52OVEurTUUegdiPr67pSYCbJpjwWxU8/6DZhxcGvhnLJEknX4e7TpSPFpS?=
 =?us-ascii?Q?VyJRiwNt/Mquz1cz/cMZ2c2HBZG9PIySuDjRmpLXt62J6UU/LyapYD47u2ne?=
 =?us-ascii?Q?4ZlJcduNEx6kQiqQzPtuadjl5/Q/V1D2BDrU0xOLl1FPUJkNrJ9SNduMwEOw?=
 =?us-ascii?Q?sjtfLw0hXzvQl0b/2iXhigvu+GDc70n+AAIUHCvbXZ9oAeCSFerBxAYclvJL?=
 =?us-ascii?Q?uL9RQrCxGS+mWaIKqW4/nQ7xv1Pt+Jrb84fVxidBFkUbpSBGff+/qXkBmLu1?=
 =?us-ascii?Q?pAg39+QaOvCcg5NOXbUhwpzXIu4cziD/h0fz8fTE7PzCJVZ3PbJdlUEyeafl?=
 =?us-ascii?Q?3iPt5FegoAXPQKwDcHdo3LtLNmwux6ILH87X1mG+6aY2g5qM25QQvcFrkq/+?=
 =?us-ascii?Q?vDvcqvsSGGffqDVnz31dT4p6V98i+loztQEA1PLdyN9gL8JpL+OuoqPydZ6L?=
 =?us-ascii?Q?PQzaecAzLba08eNw7gXXfSdNUW++YlmQOw9tb0wtCbMT+TP6NjAN1pVm4r7u?=
 =?us-ascii?Q?cYeL37IfPXFDXL+8XRoFUWGD128JSNS85LpoFY2GHkk6YulhrNB+qFTvJ/J1?=
 =?us-ascii?Q?Q2eOqEJCSMiUePeEF/b0ZgzC6uULOvCwW7GllstjmP4kITLizKrJ80YMw8by?=
 =?us-ascii?Q?QQ7e9KL2VyIuBs0Ck/WRhmJkJvM8wATmKQvmkpcdgerqg4igI9EEmKX4QN13?=
 =?us-ascii?Q?RvVDNNZPHSgZru8Wx9ZS/dCYLe5iDvRtfGD8kVFxZrg3/zIkPCxozxoc4seB?=
 =?us-ascii?Q?evId/Vf972xca/XaWEgjYMkAwKXFYXtlG+JN4cUsIkRJPC/zTYszHkBeVltJ?=
 =?us-ascii?Q?fFpH3Bj/lkxPOAaP/ZXVskx/xeMvuYEq2FKuW0bqRT1yxjKR2HuElih/r8/l?=
 =?us-ascii?Q?6NxfoZOFoivy1R6tnS5pFs7/oQW0BMZhfRO0RyhIzBDFqRqXSdZx2l1QCY5N?=
 =?us-ascii?Q?YXnWFzDaffTHg8lljUz/UHu5ZnUKVRzt3fzTDc6bkq9KTdFNPyXpsodAApG2?=
 =?us-ascii?Q?HFS9Ggiz9e4M/cSvmnbdbF676FQBi7nN4q/074igpjrnxynK0uJsnPmQc8jp?=
 =?us-ascii?Q?QVeKG52Rehjjt/6j0SbacxA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 70991f86-30cc-48c3-9e45-08dbb8d211f1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 05:34:18.8057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VDGthG13RG4Xx7F/6NPQtqcZB9WjfVoYTTka4ASSUVhEORVYQkbDSQhyx/G1PvD++gvTMcV2G1s9o8ZfgPomznCEzI7agK6hO3qg2U5x6G2Gzz83cJMEG27v22JQIF5a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8068
Message-ID-Hash: OI52APBT4CGVJHXZ3GWYCJOKXSSJDNQU
X-Message-ID-Hash: OI52APBT4CGVJHXZ3GWYCJOKXSSJDNQU
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OI52APBT4CGVJHXZ3GWYCJOKXSSJDNQU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

asoc_simple_probe() is used for both "DT probe" (A) and "platform probe"
(B). It uses "goto err" when error case, but it is not needed for
"platform probe" case (B). Thus it is using "return" directly there.

	static int asoc_simple_probe(...)
	{
 ^		if (...) {
 |			...
(A)			if (ret < 0)
 |				goto err;
 v		} else {
 ^			...
 |			if (ret < 0)
(B)				return -Exxx;
 v		}

		...
 ^		if (ret < 0)
(C)			goto err;
 v		...

	err:
(D)		simple_util_clean_reference(card);

		return ret;
	}

Both case are using (C) part, and it calls (D) when err case.
But (D) will do nothing for (B) case.
Because of these behavior, current code itself is not wrong,
but is confusable, and more, static analyzing tool will warning on
(B) part (should use goto err).

To avoid static analyzing tool warning, this patch uses "goto err"
on (B) part.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
Because original report was for "ASoC: generic: convert not to use asoc_xxx()"
patch, but it is not directly related to it, it doesn't have "Closes" tag.

 sound/soc/generic/simple-card.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index fbb682747f59..a8bc4e45816d 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -678,10 +678,12 @@ static int asoc_simple_probe(struct platform_device *pdev)
 		struct snd_soc_dai_link *dai_link = priv->dai_link;
 		struct simple_dai_props *dai_props = priv->dai_props;
 
+		ret = -EINVAL;
+
 		cinfo = dev->platform_data;
 		if (!cinfo) {
 			dev_err(dev, "no info for asoc-simple-card\n");
-			return -EINVAL;
+			goto err;
 		}
 
 		if (!cinfo->name ||
@@ -690,7 +692,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 		    !cinfo->platform ||
 		    !cinfo->cpu_dai.name) {
 			dev_err(dev, "insufficient asoc_simple_card_info settings\n");
-			return -EINVAL;
+			goto err;
 		}
 
 		cpus			= dai_link->cpus;
-- 
2.25.1

