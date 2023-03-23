Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3719F6C736E
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 23:55:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58D54EE5;
	Thu, 23 Mar 2023 23:54:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58D54EE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679612141;
	bh=RVADFlP3ROZV2GD7KIZeEhmDJnc7w+NYNMzDVh81r6c=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KXb6cu2kpfVKcV7CBL1MdKAqsK3G89jib5l2oeVefxDTAXEmjm9CbhMoYeZToRBjC
	 f787K2VusV6DDF5unDdYrkJXUrkzV0Ju0ezcOdKZGTqfLUYxXonnV2ZTLfeQbu2dYX
	 2bCFU/Mqi1Dsj8afaSPMcEE8mYLuHQX/OhhgqeyA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E049F80552;
	Thu, 23 Mar 2023 23:53:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CF99F80549; Thu, 23 Mar 2023 23:53:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A73AF80533
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 23:53:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A73AF80533
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Y3/P0ylP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cB/raGyt9PjRpbY3Hh/DKMjL/bnqCN84pzhIYYwYGtMKoaY7fJmGnTg1R9asi2iWVgDW+kQaIRqyUGRW1FHngsQ8yVVKShNNLFH5JeRUlILw1638N7GuFcbeiE3IFSK1viV9OTNDE9J9rH/5wJOSXJqB778UYCvAyJgnyl+C3C/6i27jA9jkl1LZLalzIc0OpQ7id3JIiZ2+k8DUMHy0BXdMHYtWumXZpz3mSxz8KACBHl+YcWZZ6JRuovaqUYinj1/EZywHTHNB+pDyLGkcHmxuNkeZS/C/JfqeR3vf1Dm1UD632uX4/RXgZ5XAxh8mywsTLpx3GcPlBZs/sb2iFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYUuP9LJ4rQb7zUBMRMgC/zXJRDUUUhmrenTpcmryK0=;
 b=P7LXdtAI3RAG3nuGFLkjB4Y5ja9+0KoL1zQ8aCpxdaBU83sw3P/M44MYZeD4gEE9jQbEqpaTCBrV67YYSvxq58sAZVBTu1UBfQj9GrnuLnws9HDe9zmCR8tyWWQ75BC9JYUqZWnAFJWKIAJ3edLtdGO+dlu4ikxMmXeIoX22Sg8YjDt6AnrAxUQVBqQr4MYStVS6rt6nzn6Lk9k/hiJikCnpJnmzc3H163ejHoXD2EkcGAs+/FYmc3lWR5HJ1yO9WcphX1uhFe6I2fTebh/jV0NLmG/aBZCi7GaZwYCdymPi7WksB3yfUDd7W4fr9qA2kbd/4GJT/BSzJK1uzFYbJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYUuP9LJ4rQb7zUBMRMgC/zXJRDUUUhmrenTpcmryK0=;
 b=Y3/P0ylPk6in0vWRzAaigKKbMecKRZt5d5+tBO/09P7gaz27mrpjOZ1N3klCwfdgXBu5UGFNJttUB1jzpkyl37R5jnxBq9bpzIZ/BBJITUJXr29bF3EYnCapBgsncxg8QmSdr3RVtK82wL9PxdWnEVL0edyFVyaiq2aonzQWTTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB12022.jpnprd01.prod.outlook.com (2603:1096:400:37b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 22:53:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 22:53:42 +0000
Message-ID: <87lejnjczu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/4] ASoC: ti: remove unnecessary dai_link->platform
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87pm8zjd0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87pm8zjd0t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Mar 2023 22:53:41 +0000
X-ClientProxiedBy: TYCP286CA0264.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB12022:EE_
X-MS-Office365-Filtering-Correlation-Id: 775164a9-f56f-488f-95fc-08db2bf172e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tMv3Fh/SQU2kGMvuqrZGOgfxODHSu9GUq8+GYeBdOyGFBXluoRnMgoX3fno12p2NjgTPU4y+ezHO6FlZfz2Lt6EqNasj+xbi862tZjJsM+GO1pVNB0a3tQcBrU2ast//OVfStpXGLbRV60iTiclJvgfGHuhC2fnn88pH1N17oCX2Wp2E6WnV+BRFbVdNS8ExVwzpSw82StIvLCMj/FdtaWDJ3eYphO32zr0HLsXGr4sYNznXkie/ZlLMyxrVHyea1Icw9i4ZEpKjEIg1pXbSpPvl4D7jWlJ434XZ5Qtp4fG0edpl7KfASjWovnDmz4kU1SUeTEvlSAp5spcVT3a1HYhzEZL1Sb45ioZIOYQlZIWbGl+whMMfbmoTSc/OgxZfd+HnAohej8kQkQ0pj7MzajTrpBH3adIKsW0UI8uj/3nRRqGth9MZv0ctDSj2KSG2MPt6uCWOUHmtg4iP+XvRsL7T1SYlfwLNydxsx/4k3Ah8Dxytg84RTqU1RNUpnsjz0bZw5NQ1fmQR2sbNqdzrJ7kz/3c2XprTEDbdtOPzf0ow5ga5FIW8BUUtzwVdF93BmlVDs0fl1Q3sk9zCoqewV6KCjgIJKpfLw2ZsxX6l0EdwiZZsDvhdbiGYPCTrOy2SnkvwFiAVvH+G9TarS9CxQybPFjfephgWtLtA69o5+sYaL5fryfpp1Nw3XistovfEJMvs7Y2M3gBAy4MfcPKitg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199018)(316002)(478600001)(41300700001)(2906002)(8936002)(5660300002)(36756003)(38350700002)(66946007)(6916009)(4326008)(66556008)(66476007)(8676002)(38100700002)(6512007)(6506007)(26005)(86362001)(2616005)(6486002)(186003)(52116002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X241IiHA6ncWRhlP59N+goU1OePtb0cymPfyc5ovdrlCFnFU2tEAO0KqTpOp?=
 =?us-ascii?Q?56puwdrxDcbxC+R55G8P7NQ+IkjC3LKN0M8uILN2uuLWpHY/2TyhxXsUSe0I?=
 =?us-ascii?Q?iu1d7AM6iBcuwJEwBqAutsUT57S/dv9RG3iuHak3DZe035VMGAX39CU/6iVG?=
 =?us-ascii?Q?7UaVzsyKerCtsRp9/+0rZVpVKwXebe22UGcUqSvDOQBcqWmScTq4usOg43es?=
 =?us-ascii?Q?wFZfV0FdH6t1VAc6dSMxThiUvYvV3ZmNx9M7H063YUlmZqB2Pf7/Lq90F/qJ?=
 =?us-ascii?Q?PmYixnIbWruxlMAzcJCCj2PXC70BrpPj63WvoDU7k2z/vp8PlyMqOuwuPg92?=
 =?us-ascii?Q?fWsjLyrhHuMoq1omGWuMWStOlMfSgkRSH5Kghg8Fb5ol9xj0+VYAhHdCXPJS?=
 =?us-ascii?Q?zLHPxLPJ8LEUcqD1leyAHouy28izroHIiwIXgHar/X6crXPoXjlivZ5jTP3j?=
 =?us-ascii?Q?RArcUqhi7NDnHvVdHzdAlZ+sfPRI/xilssf2L40W3d45DzUUl3MBCfmxI/x3?=
 =?us-ascii?Q?J4u+39R4fYyQ+GTqhcK26Xtmb4NHC6WR1lxmkn/Zu/WKD9ZSWZvIre5Kb4md?=
 =?us-ascii?Q?7Ol+qzl9hHDU/fFcPXqgHLVO+hjJT+a6MNQ1LkaREVcJZtACnN11lP3K/83g?=
 =?us-ascii?Q?IhIaFHcYNyXdVKQEj0c64fZm8s+RpIeG1c7aAdBNRF2r+mLn7cmzND2M7V0j?=
 =?us-ascii?Q?d2Ci7x2eNQQC7ggt1KWjdDDlzv471l88GDHYCBqsXutPAW7nWvT/x8oRskFT?=
 =?us-ascii?Q?1xxp1ppMl59Nc/5B2QgiW8/C0B4vg7y31FWxN2qBn9SyVijGfsdOf4ziUzgb?=
 =?us-ascii?Q?tN9SPn/3MM8AU7NQPYBo0AXSI+9RWdzEslMUUFz3cW64D51mhSvzHn2vH5Xt?=
 =?us-ascii?Q?5Xm+zuM+TifDznUxK0urbxh5IaV7H2xfM9aKGzD14eExQ3uRFiNkVJEIEHWC?=
 =?us-ascii?Q?dq6FHXxHS04+Yoh6P/KmYW7HaADhYxy0cvzJk5/gu0uYIIenX7Rumv6ZbpJu?=
 =?us-ascii?Q?G6gqmjM1G5AjGpxdFLxUpq8JDluOQ/qAb/JNUYz6m2YUfwSmDuEVgdR3PEA3?=
 =?us-ascii?Q?9cmudBjJ00cOhfPLCQRws9TtS87c5NMB0AgxIf2mrFN7/blah6swPieE1KvH?=
 =?us-ascii?Q?jlrO9Jqj9PffR8/4E74DYTevT0zo83z0feo2mjbonmJst0P18UZ1Um1iLl3x?=
 =?us-ascii?Q?Q3abIF35fxE8cM4rVXLloU43PTjqVxRKeifDm39k6lQfrMnRsiXxOIXbUGC2?=
 =?us-ascii?Q?eQmgY1C3IiyP9i4Wav82aI/H88eXtgHmD3BgSV1p2jJfcfx5HxYciDSSpyzN?=
 =?us-ascii?Q?hGYA4OSivNkGUwWZ3N5DLZSQQ+CgrruEzuLiTLLqECHOZSc1cH6K4Hti6isp?=
 =?us-ascii?Q?nEFl9Uw5ehixgAJxkuszfH8TdBNg+lt7zUBISY4EiRWeleZ7tNUsNTfWGfLT?=
 =?us-ascii?Q?OPqgUbZ0Pm0MUsxuxZf1mIyxN1pLiRnmlpIKNyTIxPfSw4gK5pqjqmpXRcOT?=
 =?us-ascii?Q?OpPodCqLfOY//7RN2BeXY8VL9L/a+ABOVai7/1pZ8lvJZu5ydAtpV59/1mfV?=
 =?us-ascii?Q?pKF49n9rV7jI16RsF+8jY2M9Ldst4bb3l7EmnAr/sOvzIMNKoQPKb/W8xgvY?=
 =?us-ascii?Q?Z3Jz3U45oPoA7TC2SrddPuI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 775164a9-f56f-488f-95fc-08db2bf172e8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 22:53:42.1608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 majnYpjGD+5l/SHloVq0ef3nxhHzHDICsF365GFHfbcG2dnyZzThO2kRW+iAbyxX5pihdHxHPMp5yEQ+xI0zhu+6BQ8IuAoWXo0+m48MsIvtoPBuwP3Q8KkotJqbyqlG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12022
Message-ID-Hash: GNWSEZASOU2FS2W43DXZFSPGLPBMUW7S
X-Message-ID-Hash: GNWSEZASOU2FS2W43DXZFSPGLPBMUW7S
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GNWSEZASOU2FS2W43DXZFSPGLPBMUW7S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dai_link->platform is no longer needed if CPU and Platform are
same Component. This patch removes unnecessary dai_link->platform.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/omap-hdmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index ad37785e05d8..96c3569d7643 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -365,20 +365,17 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	compnent = devm_kzalloc(dev, 3 * sizeof(*compnent), GFP_KERNEL);
+	compnent = devm_kzalloc(dev, 2 * sizeof(*compnent), GFP_KERNEL);
 	if (!compnent)
 		return -ENOMEM;
 	card->dai_link->cpus		= &compnent[0];
 	card->dai_link->num_cpus	= 1;
 	card->dai_link->codecs		= &compnent[1];
 	card->dai_link->num_codecs	= 1;
-	card->dai_link->platforms	= &compnent[2];
-	card->dai_link->num_platforms	= 1;
 
 	card->dai_link->name = card->name;
 	card->dai_link->stream_name = card->name;
 	card->dai_link->cpus->dai_name = dev_name(ad->dssdev);
-	card->dai_link->platforms->name = dev_name(ad->dssdev);
 	card->dai_link->codecs->name = "snd-soc-dummy";
 	card->dai_link->codecs->dai_name = "snd-soc-dummy-dai";
 	card->num_links = 1;
-- 
2.25.1

