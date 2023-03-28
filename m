Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3F26CB2B8
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 02:04:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5672B206;
	Tue, 28 Mar 2023 02:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5672B206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679961858;
	bh=eyF9/rYE6lh9IXuYlt8JG8HXh9pKN/iWWgLEWth7UCg=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bnrkC/0JP3YVRjs3523urgfFQhTP1/rQoyn+toFv+IyI24qcrUPEcml4u0wtowbqL
	 +IdAYB6DN50vr8hqelpF3bgiBDVyznuW5e8lMkDOCAR9X3HLbxj1ao4GZE90zMiKET
	 xhyCA4zl1vMPtHpEfc3hA1jLmGhx+ja8YgFXAxXs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07ED9F8021D;
	Tue, 28 Mar 2023 02:03:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 053DEF80272; Tue, 28 Mar 2023 02:03:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E7BAF8021D
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 02:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E7BAF8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=i5OQCYoL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnQLUbb3cr4ulxP26q+pWgFLTqTD6+lMZVZ62V7HnVEf4zt4vYKbALt57e23gfB6H1c0d39ayzCQA89OOEoDBbuX6HvCUZPNUc6tMCqkrx18fdRNvOG4airVQV2yzqqH2uUmneuylySrKillPZTi4IwiMMT5iRu6TNWedsMP6h7qgUycRAq1wFYwK5/GxvaKoZ45lRdF3ViaXJPx6H3GIMKHraiLUxGt3xn9Kt+JTjhT9kIZEJ+DCBEfwX7QJAyirv9FR/Wq2BQm59Dt7y5+G76N13CpBacI/uBwoBJbA4F1KejrCbDbZ03gyhJgAEdQnzOtKxlOppj8bR74uT+jzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DYekHi948MM00Nt48qlsxF+p+/pcUbUPpG2nGgPl9A=;
 b=EfCeRcOyaIV2wx6Ltv0N7Cvnpqh+0CiJQ/HlJEqhA0cqlmC59KRVX5YM17T1LqTZybxITOOzOuY6Ol3ZPlF2rimWuM41vgfkoumjJjcXi5smd3373i1rJpA1sQlMCsKpRJLMZD1cagpKerk87z8xrJDV1F+iqPltl5dyF38VDM12HTN9h/Xwrli29TagFYGeW5IQgDj9LpHFJpWONt/r2FEZx9SYRo4tBORrheF+MgIHoPzl6KrGCz8BN1xuHXdrDtF+auo2idAtp7G+h2OhMom4lPvqyPPnaEGFvuXlo3I96hXeD0nilaLbLCQtCF+IF/G9+YwGN56ny+yMxyHw8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DYekHi948MM00Nt48qlsxF+p+/pcUbUPpG2nGgPl9A=;
 b=i5OQCYoLD85nWPZIonY+pDo1VOkTGfeQe4LS/F8sg0H0haAh2eaRBMM6IjNK5piAWBAFwU2N+6/hWMkcq/UMkt9+UeBlzHykQCuc4YhTMsY4iKNS5QG4HyAuohepJRL0FlktNSj8rhJtIcFSkUCurThoJwwtCZRG4cjvI4Gy03A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYBPR01MB5357.jpnprd01.prod.outlook.com (2603:1096:404:801f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 00:03:05 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 00:03:03 +0000
Message-ID: <87mt3xg2tk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: da7213.c: add missing pm_runtime_disable()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 Mar 2023 00:03:03 +0000
X-ClientProxiedBy: TYAPR01CA0095.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYBPR01MB5357:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2c7f0b-7f28-458f-63c0-08db2f1fcd2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1QqIE+BFGyzcIAlOp7GNkCQ/ubY4l0GQI0Gdig49oNnox1cGbGJWBNc/Y4w2/HZIJ6ptwPFJ0rcmwtqWxVPfkYe2Ma/UBHpnBnT7zKOOfGfA1o/iTGjuPMnNqkSCT1T3wiR2t1hCy8SobBbX6NA1uFpvwRE0UkyR0ifLgI+mnxRLfXl6DQfrp8yJLMZqZoYrdZVbszacDUlbjmd+e0Jn0Ixxt0dMJebvJCx+Lmmlu1+ctlTF9FOsIFQaY8PfuZAyKeu0r+2TwYtgKaWOJ9fbibrkwr+aQflYbsqMtGfG0sz7Blfcic3EYTjPmd9TuJSwq8DhNvAOZ/szN039aCL310xSPHD6lcl0CaFyqQkowbZIdeThuFXAkakPwAjiTvnmVHGtgNPbwi5LmjbepTXWk6rBz4Sn2Sy8LCVKd4kAj4gr7fc/Q+t0GXFAH8z4V784f7M33rQYqYLyVnYJy16nMQo4ypvCDgLaavAIcZivgUhE5JZvB+9p0Imd2Grm2s+kNzarpxc91HwymcekVWB/+lshIy9lMrt4IG55bsZhyeyhFuo3rxQQ61bRLr42MPIYHLyokD0AJG9JXRCwyBY4M53dcg6OudfURfljHJUA5bxlTl9kOjmJQSUS7Dzww1Ed
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199021)(2616005)(52116002)(6486002)(36756003)(186003)(26005)(6506007)(6512007)(107886003)(86362001)(41300700001)(4326008)(8676002)(66556008)(66946007)(66476007)(6916009)(38100700002)(8936002)(5660300002)(316002)(54906003)(478600001)(83380400001)(2906002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oFsHTbFN4ephH+4ZEGJrHuuDIbhVVQpoGmIQ4Se9GQGp1tjsmUyp1YAPk7yG?=
 =?us-ascii?Q?AuYQMG4e1UoFPc1YBEp1sKLzH0IF8/PTESJ/es1ngdKCIa13K+/MYZmtyy2r?=
 =?us-ascii?Q?2zaxtWlxP2MBdH2K0058F/zUWuJIlIMFo2ZhoAUWZK/wmGO7f/xWwL9kyeHG?=
 =?us-ascii?Q?DKt6OzXeVATw038qiRr4AWa6PYzM99GUN8Cb9bfiF4Ff+d2M9MmMZIqJr3tC?=
 =?us-ascii?Q?/B+xK+MndB5tFtl5zA/bdmshcX2iOFB+YLLft1x309JVd5jSSFFBR5D25ANv?=
 =?us-ascii?Q?q68764oX2RdMyOzLLoSVdggt+leVibT6sqgyRLz9+D4j5sx6kZSGu43dd+6k?=
 =?us-ascii?Q?7NmkaI5mvRZjADCuQOfcgvyeacOnAjMi0wRXFaGfwFSv8KJbb5A6CevHGnQO?=
 =?us-ascii?Q?SGK+C3ni5DEGelzOACVS2YBCpZJNjEFgEwi/r7hH06zN0x7GX7mar/m3LaWG?=
 =?us-ascii?Q?0HmVLYecqdCf4R7dhXNbZ7ITofX3Spt+0kSiyPazI+II+YM9oLLlTHtgW2DH?=
 =?us-ascii?Q?lWBuWxYQDNEHVF2IAP1Yg2kckFTsp6ETEf86HgCKJwoNoC6tXWs1sDDf4TVd?=
 =?us-ascii?Q?1dd667x8DmdWSUeLLrQq7VH5RqDl4mIYUCKqkk8AOMUYzF6doPynBmzmD857?=
 =?us-ascii?Q?xTbA5zwOgFYjvXdGFA1ZQ5bLhF5O47sSNGosd/qLcJCqDOAKHtzc8CvdHmzu?=
 =?us-ascii?Q?xNaKe3CCL9Hak55sg98IDQIiJFVMspELlIy6uFsmKwTA2AJiZlukJyGWYTqU?=
 =?us-ascii?Q?iVN3yjqByaajRgsShrw2wvrnKaf1Y8cq6F23PKEtXSLYyIGhYgxLqM5js8bg?=
 =?us-ascii?Q?121ZqiqOKJpRVmZM7/Z6qR2317p3d90NcXyDzkNxxNBskHgY1EHTAUrGPJ1Y?=
 =?us-ascii?Q?C8wAnD0pqeDjxvSSHSXc3PWeaV5hivNdjw1/y4JslQzHiliGyT91q8iHhQVS?=
 =?us-ascii?Q?/55qTl9Ha0kX3LSM9n29Go3HvFhf02AiNocMCjTz4pWxB0OcWP7rf5E5YPIF?=
 =?us-ascii?Q?lwLOnbNbC5FQ+rJ6W37Ot8b9hKE61wPsNZroB+Gw2DwKeYl8mY4EKPfXukBT?=
 =?us-ascii?Q?BMl9d8T4w5cU7MexCRKBjbN7ObUd/LbhOQrJEiIUOnmFT7Kza+voMgzSN5xS?=
 =?us-ascii?Q?JzLEs0EPn8W4sctE0Uw3ybi6o6kPQyLB4mC1vENLAbq5ljxFwg6V/5OHAp0J?=
 =?us-ascii?Q?bVMb1u2FkG3Dob7Crc7vGp2U46Z9dE8IIAwBqLM1IArCD0YRp2oDi4wcFk65?=
 =?us-ascii?Q?GMax2yHOVk10yHthKLrEt0AlHY8K5Mpv1wnuZVR6BgUyqTpIqHLPPs1ZuhsJ?=
 =?us-ascii?Q?x0FvxsftulUQYzvvAIViaCWjGoAf2/NXBcsB2B1ydH2f0Q5TTAp3fGU2TUlJ?=
 =?us-ascii?Q?iiF3IYys7Fy6a5JQgUh0CKaEj4H9vXmdEPpCB+rpuwWJvDNYyLRK28Xw9eRX?=
 =?us-ascii?Q?lJb4lgfEZAriBWVFjTtkveKV0c6sY4ux6PfP7iX5WED/fyUlv8/p4xfevFqM?=
 =?us-ascii?Q?fr3hHxXeEoEz69XiVDVS4VMtOAfjx/zI9ItgLWq6yViNMe8GQyK4C0Ky4kmz?=
 =?us-ascii?Q?LRcTDMHcx2Xn5sc1GCHJxWokSIBcGhSinPUcHDUpRQpkdyUXo68H4/rXz7co?=
 =?us-ascii?Q?kQ/FlpXIhjmGCKlzNvMIQ2g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4e2c7f0b-7f28-458f-63c0-08db2f1fcd2d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 00:03:03.7267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7DeSM13Pb6f56fWoYU+RvKWpvdgD1g9R5VYTwxpoVp6NjBXsGRhDA/m6qEQ62AGFmi6DhthGJJKQIn3N+t9db+OK1dMpQumGrG1mJZ6hb7VIC3T/eEO/r+ygdcQ8uaby
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5357
Message-ID-Hash: RLMOEDSWVQQ7UKZU5ZU6YNVILAQ3T6D2
X-Message-ID-Hash: RLMOEDSWVQQ7UKZU5ZU6YNVILAQ3T6D2
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 Duy Nguyen <duy.nguyen.rh@renesas.com>, Khanh Le <khanh.le.xr@renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RLMOEDSWVQQ7UKZU5ZU6YNVILAQ3T6D2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Duy Nguyen <duy.nguyen.rh@renesas.com>

da7213.c is missing pm_runtime_disable(), thus we will get
below error when rmmod -> insmod.

	$ rmmod  snd-soc-da7213.ko
	$ insmod snd-soc-da7213.ko
	da7213 0-001a: Unbalanced pm_runtime_enable!"

[Kuninori adjusted to latest upstream]

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Khanh Le <khanh.le.xr@renesas.com>
---
v1 -> v2
	- add missing From

 sound/soc/codecs/da7213.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 0068780fe0a7..1c1f211a8e2e 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -2022,6 +2022,11 @@ static int da7213_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
+static void da7213_i2c_remove(struct i2c_client *i2c)
+{
+	pm_runtime_disable(&i2c->dev);
+}
+
 static int __maybe_unused da7213_runtime_suspend(struct device *dev)
 {
 	struct da7213_priv *da7213 = dev_get_drvdata(dev);
@@ -2065,6 +2070,7 @@ static struct i2c_driver da7213_i2c_driver = {
 		.pm = &da7213_pm,
 	},
 	.probe_new	= da7213_i2c_probe,
+	.remove		= da7213_i2c_remove,
 	.id_table	= da7213_i2c_id,
 };
 
-- 
2.25.1

