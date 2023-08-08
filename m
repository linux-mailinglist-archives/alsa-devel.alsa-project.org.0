Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF48774ED2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 00:59:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F72DE74;
	Wed,  9 Aug 2023 00:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F72DE74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535598;
	bh=4P7Ia+BOLTzpcSxlbwQRCF7C3HtrVemyGIVcIOKCHhU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yt5n9nydlvlPce3kFVtF5LqXfwUjCvsaezvXjPO//XVpJnCP4TMnOXYSD0VWnBHSp
	 qonm47BHn5lFCf2MXIkxgM854zw/aUnaTrYxL2wW06e1jhftjvcmxvWFgpb18gtuFt
	 aq7rh9WL1MsCDIHOfPRvngevn/ZO1194KSO8MTds=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BD9EF80588; Wed,  9 Aug 2023 00:56:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6303F805FC;
	Wed,  9 Aug 2023 00:56:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38524F80609; Wed,  9 Aug 2023 00:56:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6CC0F80603
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6CC0F80603
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=IdmQrxNt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oO3P42VhyNScekWLXff4C+f1a4HgjkwQGEw20KhzXOOOq5nCjIDxfM8m64YWniJk7XufaGxl+Efnj/hxo+UJYemE51S1HDuXMkPfuuCoKOmus8r0XkBEVvv6iguoFOd8HAYOPsE+wy9zHtgZvOhc4O6sofbsSf8dnEnINCuZKYOlvXbgZh06IH0vqoK+4gqA92d58WT0kCJpDMnWGSIO6xcxGzJVP7gh+bfFOtLpJweOLKYDx3Nxoyu3n/TXT7r0HTU47Fq9BnZkEPP54k/bWof21aalLMjLX9HlxvliPvGnh/cTUk3YfXHSVbTgGQ/dwDgq2n05kSfBiuQFnYY39Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRxwArxjvF55OwGRbGygE1p0gnhXYYcpA7e6/J03Y/c=;
 b=oexKzbtxn1fFqeWgd7BtW2+PH+7Jc8gT1WhupVgNWZ6q2TCrm9kyuGiCx5JCTid4cQV9hVAQXGYgrnvT9KozwnMwZH9J7Lz3idHmSFojg7qc9Ci0rAtD7MDJGI6xKAbhzmFvp2tQj4TKHfKkHrlKjbIWOGlESioFDXvM9DSLfb5zIXMBMUxPdfKwxmbmwKDofscS1fnYF7t3Y4sdxULqiMJnpWMkFQ/Yq0BRSOYIbSYnpBwJOF3z3HJA1IRwdLGs0JoLhO4ToNrGr+RMkbkzM0TeXeCwYPe0IbuwPwbB8BIxSEPyCye7MURrWhpvNuFpBM6eKdjJWLrjhhtSUkpC1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRxwArxjvF55OwGRbGygE1p0gnhXYYcpA7e6/J03Y/c=;
 b=IdmQrxNtN5lQw7ehXJ5IOVyvJagXpwUgmNjLt1MVWr0ZbINzsXFvVJVkdA+N/bt+B1MAYNRddWypdco42eIu9dXVtBtAj0EKe45qn+07B7VLJ3TmT8+0PLImGkGDiM7b/K6Ytp2nZOO58fYlmo+wCd/mUgLa7v3ADtKBN2PCie0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:56:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:56:23 +0000
Message-ID: <87cyzxb0tl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 14/39] ASoC: pxa: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:56:22 +0000
X-ClientProxiedBy: TYCP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e7614f-0953-49b6-ec25-08db9862b00e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jmJq3q4ZjfwnwaOqf3nzE70i6a5mF3qMdDX4NRkMrWZ3rEERMqP9V44dqNGIHDeXWT0wQP5RAgirhgD+01YMuCid4+fGF0HGMLE6jLPWedB9SUIvwcHc8OIUXWRJ5vsxw7lXAcyEjhVUilUKAHV2X9maHQ83rEO9cBs4dHQv4Ql5fw0dZNOwN0v8GgN53HlJZyQmCq3OIv9NrJU49k+j77Im3dsMa0C54rZFPBZt2u6HtUTw+pbSJCe1UKSxg70K2/PHdFBEF28UECFTNiNy66Tb02iLPzAd81PrTCimyo02XlVuu7MuH4wa8u4bop5pZ8qtpq7zyXF83mUCh92NpqRELc4k+qNk69jC7//wiSluAwpapXBzQG95L2vtPiwTq7Lsjq5bUrNnRDCxRSZlPxARy/dkt4MbdshNvPMDOw7QxbQIGagNURVTcB0D34zJ7GpehZxY6xIOw5fsihFqIm3jVibYkJSUVzO9C6hNYqtxte/1jcAGvNYyYKYoM8ld/qfh9t25JV5i9mpqG6no+F4yLKvxz9BpvNIC8UoJOnMizNhXHKOxKd/wHOEe7r9G9fRIkR1XrGaqBrajRYqnA2txdqktQqId23NqLhZg9obCD4WffNSwwnZzSjbMYstJLw/a20SuitwTKWV2HfcfWQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(4744005)(316002)(2616005)(41300700001)(86362001)(5660300002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rxSvkFdnIKkjANuiHAMgD0si7O8mPizsDce12ODdakIrdBAHfHG/PrYsRhBG?=
 =?us-ascii?Q?Ra0UOyNUGKzYoNqEnYMFWDce/AYOWFux2M6norSNn3F7AFLRN6Bay3zmCMV5?=
 =?us-ascii?Q?VR3pQ6Q+VIhqtFHBnGFSJDSYVccdLcI29ei0zjLYhudEgxpRltHcRAECGcUz?=
 =?us-ascii?Q?X6DLRbBiatk9M7LdM3W35N7QJok07pJbLVr38ShhXCqeT0wJ0BmAZIxcoSti?=
 =?us-ascii?Q?GPOO165LVchM59DfW8bI1v9qJXUS5oJeWdZcd8eBVc3QbEe1LjzPPTGxWM1s?=
 =?us-ascii?Q?hEKeTe7X3z5HSTaGKCfW1/+Tc/2jVDFFJijewnHhq79J2zMGLg2E4v4pUw2P?=
 =?us-ascii?Q?MqL0Lg41VK59AioYang7vOovtX0ysaxboStIzi0OFXbAQ7hCrPjHUrqCDmkD?=
 =?us-ascii?Q?Xx9bYy0zm/Dpqiwy5m3bcw0BCPsR7/1xawtJDZEZ3nYwy7RLFHrYKhb4lo8E?=
 =?us-ascii?Q?r6r5rpXS9jjiimdiLH9XAbnE8a1NetgzdfTPTykqezFypsv3p644SAX5Hks3?=
 =?us-ascii?Q?j2cKy4qzSaGdzflietcBMGxGOUE7/p/gPkPfM4goiVYe5XRZY59NbQMtHSmZ?=
 =?us-ascii?Q?6gabydv+/IkOIj5G+25ZcgJ4zt1pJ3iMTjyeNqlX3zQc9TDyMDNqrND2ca4i?=
 =?us-ascii?Q?7yugJCgWr0iOgisZptqjghCrhVCVmHEVPs934F/U3D+vEYRNWeaIjlI54fWo?=
 =?us-ascii?Q?c/XEy82eYF7Xpkw9pkYg0/nKnkrCK8rl3FeYjYN1jWwAthmcU6C1tEaoLL6d?=
 =?us-ascii?Q?dZnyFG0HNkGVW6YCsDQUMqs5j/DdZaFKqU8Fpffu+vjLWdsui6ULfjYwrtWL?=
 =?us-ascii?Q?A8Oa+XrV2/I9umSQsAWj5nGNlLWGwX2CK1/BrCYR4bitpBnK2CUw+kqHGhuW?=
 =?us-ascii?Q?+FQOZJgbl7AEToyW1P79vXGx7aK0rXu43Cr2/GPZsWQBg6l/8GLBN0YHwFoL?=
 =?us-ascii?Q?KjdT6y2HjULwhmglYWItWNA4G1EncwkS7TNzl1ak1t+6PLeD+A7rMJgASC/u?=
 =?us-ascii?Q?DJexTW+jSVEmcP+tqN1FkyVcmdFzo5gm3M/Ji1ZP7zHIvbMnWPB4IqDwnYaw?=
 =?us-ascii?Q?BYbYC7/0RBr8FSsNn4aygLLLuAXHCguEiItRx50vLUaanOZt25uMrR+THAf3?=
 =?us-ascii?Q?j59H1jcyD5SiZt29g6Q4yghRAw7V8QfGfKUU8o7txh3Q0YHqtyFVCkipO3Ow?=
 =?us-ascii?Q?YccIY9ZOT3tZaBWOEedPT5TXAeSfATaDWL7iAfq89/YVyyGNTPx3RLJ0u+cO?=
 =?us-ascii?Q?Kb+8ZqZooH1oinOmgxG7cpjfBIcP05Y6ab4uiweCUhvjlfuIykHIya1HUFFk?=
 =?us-ascii?Q?NEGqa2ZKMmWYKwlnNXHQ2mxwtBUCT7GSOcP0+5/1L/9dEbTn/9tVHOmG31Vj?=
 =?us-ascii?Q?OihV4HJuUaC8Z25meWTIoD0G/KRcFUeA/K3mqllsFxAssslzlN2at0L8ETgo?=
 =?us-ascii?Q?GCtlBGzhpLD+A14M+J5d7GF45s87vUZKt6jZYKMMJ7pYcc9dhRB4gR/OF3JO?=
 =?us-ascii?Q?kRZv64RbQu9SVKe+ppcY0j/3kLDuvJCFus9v1EP56QqNVxxQvgfGMWFphBaZ?=
 =?us-ascii?Q?wkniz9w6eaof+ySBaw0aAjGvyh0UqPPEO7rb/Qe7CRkTnLabAyMiBv0Sst5X?=
 =?us-ascii?Q?GfGNNc4zVk29l3KiOp6K11I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 09e7614f-0953-49b6-ec25-08db9862b00e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:56:23.2338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8i5Z2YiBnH3SUmcTG2WJLClGB1zgtpSdZqGdCSKj8kMmfWaef0QUOPpkovaHpRqgEBLD6acwwfYIao5+uaRqG3/5Wl2kbV9hiOU7fkZpqAzhk/aN3Pjf8hadpO+Cfwp0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: HLNQRGYRIOAXHTRCDLIAXZ3OODWJ4FC6
X-Message-ID-Hash: HLNQRGYRIOAXHTRCDLIAXZ3OODWJ4FC6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HLNQRGYRIOAXHTRCDLIAXZ3OODWJ4FC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/pxa/pxa-ssp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 430dd446321e..32a8490d027a 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -819,6 +819,8 @@ static int pxa_ssp_remove(struct snd_soc_dai *dai)
 #define PXA_SSP_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
 static const struct snd_soc_dai_ops pxa_ssp_dai_ops = {
+	.probe		= pxa_ssp_probe,
+	.remove		= pxa_ssp_remove,
 	.startup	= pxa_ssp_startup,
 	.shutdown	= pxa_ssp_shutdown,
 	.trigger	= pxa_ssp_trigger,
@@ -830,8 +832,6 @@ static const struct snd_soc_dai_ops pxa_ssp_dai_ops = {
 };
 
 static struct snd_soc_dai_driver pxa_ssp_dai = {
-		.probe = pxa_ssp_probe,
-		.remove = pxa_ssp_remove,
 		.playback = {
 			.channels_min = 1,
 			.channels_max = 8,
-- 
2.25.1

