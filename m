Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A35E376C1CF
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 03:01:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23B6F868;
	Wed,  2 Aug 2023 03:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23B6F868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690938116;
	bh=XoYDp1EwOo9Ng7NFdmIwngSeM6WuXRz/+1MouyvuuYs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V429Au/+xTZ1oj8BpzxEcycQPdpNGOROAheZV0D4cKmjv/JyHgvT58pziOsi+VJ0A
	 /1DUxlxanQdWQdJvzAA4Ui6fyGl32IpKkbH8iscs0rubjCuz034I77/Snk9XcGFqtI
	 XpGjIAyVTZrpB3j6Zpr1w0DvMP09gr3Qq5f8su0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EA19F80649; Wed,  2 Aug 2023 02:57:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EB18F805F3;
	Wed,  2 Aug 2023 02:57:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 026ADF805A0; Wed,  2 Aug 2023 02:57:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FAF0F8055A
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FAF0F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ejblM9vj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fC8L0ClWXokAYmRVod0IAdtmoJs66xHNtFClDBZxtvV5anZfwJmCe2rfV7Tcbf25JYHmiDQLt9afWt/PGASpCqh3wL4s37P5skNGWqB26VDojTT7tmDEWQfn7F/PT4kmvwrys1YhaIXjbutSADCAhVT74EeHI6NwSuNBASj19cemDzc9pSaJRQdMTkMNKuS70rBC0rsqB1G8yVU3psHMwxyQ/VC5Uqd15P6gQ/SUO3Rf6JRhpMDK75R6jZLx74LKsykghA9fYIyEF0h8N22OhF2RTiILRM+V5geXgArzVJbmwS5mvEaZjNKfJNU8c+gmDcw5d2SzBW3Z3LnIIfYURw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ByWVe4/WRQiC9WEzhMU2FX3yKBmb+HLj0PFpqKTgXM=;
 b=QX48LSEGlHNns8cMZFtV2eTZtzXaYCrDGuvCiwvvQ+dEQFy62fejGq4lED/gwjVWSwoLIk9LFp1JIAPyi7eFncA+ME3eWspKXCE3auTwceE+jpGcfc+qE32kMR0TJnq4iM4NIOx855BwbH+tF4k+O5+bcXO3k/0Hea4RnLlHg+teNc9c4JOD/Y6iTSKbNRVsl9QoWJsgaq6NwDefx6ytSFwIi80nQDXucQExlkbPzNCOsK6s+dtcm/g+TaIBzqibFolZQb/6JqKpajD7Knwv98JnHnYIaMIUz8lDdPZfsHeFqE/oyTCaRaTU7JMzaAkd7Pw7eRTZlAObtw8dejXmDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ByWVe4/WRQiC9WEzhMU2FX3yKBmb+HLj0PFpqKTgXM=;
 b=ejblM9vj/uBj8jAdm3HNIFlQdsRa4r6ji03xt2LmtLqUtaYwfdkC+Q1LG4FZ6kdbMJ4QFeweVH4kj181ZUdM99W/u4NHRwaR1ZnEOTjrCh9TMfdFqOYV0HlU4AbmWoD6ZagKG6UOe3cg76490+YCSumJB2ZLfdhDF0LGEe8WC40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7797.jpnprd01.prod.outlook.com (2603:1096:400:17b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:57:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:57:24 +0000
Message-ID: <873512tg5n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Yingkun Meng <mengyingkun@loongson.cn>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 30/38] ASoC: loongson: merge DAI call back functions into ops
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:57:24 +0000
X-ClientProxiedBy: TYAPR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac9e017-911a-4c18-b080-08db92f36f76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vRZpWgiQ7auoDbYAFf0W7zJIKm5RL+6AGNRJkZAfylBhZqLZ94I4myJduMyu0lNMUz1jPNU2Qd21KxXlQVbZwIl3t5z38qwUrT7pzpK07/u8RMu7AWd+vtpjpdp0vhrxOlJm4wx/OJTCQdY54oN0+9/BaSjfM6U22df+K8OKIf2JYMDPvPEvNkz2PO2XM2bk8v9/ncPIw6faKgvAbQ0NPH2l4IniNifXKPSiSzmnLz/S34mrqZgA0h2qnR7z79AY2zKALqXWGypDOE4tc4DIoOhqQ1fm9FN4BqA9GFdpx8ia8aTcmiLtM0+HiQA4MJBwpVwC/h/eBIIfSrdX/IkZzm2DgkvY3J5+DFSTdZ5Lt/Onx0rmnL/+F0eqEXb95HN1qkTNAzaVlg/IirRRPDmad3vOMCu1oPi4YtesDwjKLSYffvwVg6wB2shshcwWih9GFFiZfdFyiwSFj26vF9LXOOJ52S/hqJZyxs0oEoqVuANHiSAYs3EhBYpChRSJxMrLQYfHrj27qqVLa9IOIm2Rxc8p5CDzNH0UccU4dLvCIboEUGbb4gLontq645sTeJaCCd1khqYH0LQ/fL0AxqvZc8+BA9AlzSVp00DytZExhSolExqD7uuSh9ANinKcToSi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(52116002)(6512007)(6486002)(26005)(6506007)(186003)(2616005)(110136005)(478600001)(83380400001)(36756003)(38100700002)(2906002)(5660300002)(86362001)(8676002)(8936002)(66556008)(41300700001)(66476007)(66946007)(316002)(38350700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?txvNhOJCQlm/UKp1YfFbtN0YqZW2kktCj6rAJwLjfRyntEtPDS2q/qxzM4dk?=
 =?us-ascii?Q?/Xwy9GCMB6B7w5CwDd3bD+JXQA4ceu0BUdmV46wjxGbMZF7A1mF8+TNL8I7v?=
 =?us-ascii?Q?4AAy5ptWf9+7k9J1mk9/Vm3+wot1hcqiP9hgXMIh53+aFwyOXfSKKLbtR57P?=
 =?us-ascii?Q?LuU4yCE//FuqvcS6Bm2cNQT22RaDwMToA49klhC+TtTWvzY+Crii7uzA0o65?=
 =?us-ascii?Q?9BDmGJK+pjZ6c/pbLayQhdZU3HnROluo1MO7I+hLc5UZJC4Hokq0mIoc5H9a?=
 =?us-ascii?Q?XsnK3umFA9vfa2s1/ga4bfGZJ1ag2Gq3CuudaLcqsgVxpUNcFlE3fHAVzWj2?=
 =?us-ascii?Q?HoEXfFpRUVOmKeT4IfkDGYoRK5zmquQGJXbFVPTuUC2Z5fH+aEhrQa1PlSoH?=
 =?us-ascii?Q?CyPVaAooYnob9x8e8laAb3ivbNWf0aiW0xl3KiUeZb2+8hyojiTSvdeI2TlC?=
 =?us-ascii?Q?HfccnMtY8eNyjbGnkNkBMCVwk+AnOolIGw94Yg3KRMm+U1fAbRXmSepwm2Lu?=
 =?us-ascii?Q?p0rEsKBA4xkNxAs8+ciBXj0LwWtvZ9PDpVGPNlVXMCLtYTnflD16pcfNAawn?=
 =?us-ascii?Q?UZ7lV11T0cC7gjxNRrdKw+tHsCNKsqgsiMWKeS4zcdW2NKVMHV5IuHmb4R6v?=
 =?us-ascii?Q?6AzUofmgNIbVJnNuHWl57qTIXdouzKahunRrTfXF4SBg6vfyxhmKVmvnT+Pf?=
 =?us-ascii?Q?i8cWfVE16LHLZ5vqobvzK735B+WJnR7kiEbQy+LAMCwx/tNJFwyGQQvQ3IJP?=
 =?us-ascii?Q?akEIkhqNPPly1DAXKa75CpamkpgO3D5EMENBWTagMQ828ZW6NOxxgnePbWdP?=
 =?us-ascii?Q?TH7wTKwIoqt/d4LZlyoDcfmXtUsBvYkIPNEoA7iE9SaqlCUHfkceiaC2FNDK?=
 =?us-ascii?Q?pT9spixya/24+J9ilMd7g1UpU+OIQbw+6+SIXoH1XG4s9I3uQV97+apm+C6k?=
 =?us-ascii?Q?qedJps8y7iX6PkHXaiJSpH/5Ka2vkKganHc9iQO3YS5MxcJGjRMBqU38QfUP?=
 =?us-ascii?Q?4gdbC8kpjWW9z5WAqE78DOqz5UH3Rf+1IR6EKP0IWRobbzb5YmW8crAGL3GE?=
 =?us-ascii?Q?uRb7AkYYQ05Wx/BTOk2YACxW7qqwQkV33/lsfegZ0XBOO+wif2WjW82QWzGW?=
 =?us-ascii?Q?EowWH20abj6Vb5j799QzhkjJy1ZCS7gcKIeisPT3lMq8FrhrnFNz4tvVEKdK?=
 =?us-ascii?Q?ESMN6uSXWQtd7EqRR/6qRbpWhCzT8CzppgA1qJX+MZ7dT6I9ZOL5UW1tSnzu?=
 =?us-ascii?Q?wi+/K/2bc4hjObf7IARjsY3YsSbq75G6UaNxBQNBLSbHFCEUqc17KjDUIi3J?=
 =?us-ascii?Q?NuikVz9cVNWnrneFOSJpvEGO/6NQ8nLH4itg2FHwEtbqcLjI8qAUahDO7Aa8?=
 =?us-ascii?Q?HjHpZC7N8pgW9EzgfXa+LxsYwnNP5jnERq+6vOwCVs3aTZfZVQ17Cq3kSNuK?=
 =?us-ascii?Q?preLgG8qUGSX097jXBp2Xzc+jmEjl+gdlSGo38oL2UDHa/Oc9ZXitgttfmZ9?=
 =?us-ascii?Q?EQ/jnf+sZP1wepiCRXsNBo+SEcrA/XtDDkxGItSmbtKvy3YV4OjOsv3Dszyr?=
 =?us-ascii?Q?JDGq2H+rc/K37BqVq4HMKg0iY/9aePWWQocn8ROsIzEGFr/yI4j+HgF+0kPk?=
 =?us-ascii?Q?pFqJwn6grsS2Ku6KauqMeQo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3ac9e017-911a-4c18-b080-08db92f36f76
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:57:24.8802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 M0twSobZ7k6nkPEC7r5slFq3edYxW4qluicbsEUiH4rbArRFINqxbkhf3NgFI/kAStxhLlneCmBkEcxP1AuEYNcXYjbvHoUNFAK3CFKzsPy4olGtCkWsWWWiVask8lGE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7797
Message-ID-Hash: EHZYVLIIDFKYVYCN7SIIFND6WUU7RHUW
X-Message-ID-Hash: EHZYVLIIDFKYVYCN7SIIFND6WUU7RHUW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EHZYVLIIDFKYVYCN7SIIFND6WUU7RHUW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/loongson/loongson_i2s.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index b919f0fe8361..d45228a3a558 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -204,13 +204,6 @@ static int loongson_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-static const struct snd_soc_dai_ops loongson_i2s_dai_ops = {
-	.trigger	= loongson_i2s_trigger,
-	.hw_params	= loongson_i2s_hw_params,
-	.set_sysclk	= loongson_i2s_set_dai_sysclk,
-	.set_fmt	= loongson_i2s_set_fmt,
-};
-
 static int loongson_i2s_dai_probe(struct snd_soc_dai *cpu_dai)
 {
 	struct loongson_i2s *i2s = dev_get_drvdata(cpu_dai->dev);
@@ -222,9 +215,16 @@ static int loongson_i2s_dai_probe(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops loongson_i2s_dai_ops = {
+	.probe		= loongson_i2s_dai_probe,
+	.trigger	= loongson_i2s_trigger,
+	.hw_params	= loongson_i2s_hw_params,
+	.set_sysclk	= loongson_i2s_set_dai_sysclk,
+	.set_fmt	= loongson_i2s_set_fmt,
+};
+
 struct snd_soc_dai_driver loongson_i2s_dai = {
 	.name = "loongson-i2s",
-	.probe = loongson_i2s_dai_probe,
 	.playback = {
 		.stream_name = "CPU-Playback",
 		.channels_min = 1,
-- 
2.25.1

