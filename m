Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7FD7104DF
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 06:57:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51026836;
	Thu, 25 May 2023 06:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51026836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990627;
	bh=ZuNMos54AIJNlqmD0jq22TXyOPV/7yJ53PYTpNN2gro=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jdoHzIyXMtJpo3CfwY3x1tqinQF+Aea+oghHz8krq78TYdXVVT0kawL+vC0bfEd/4
	 wUf2u+HalIQdppyHHQwRL7EVMvI0wyWExIEyA1Zx4njqNTulhbd0uTjRBJ2EyDhwif
	 QZ5rVTwrxGMwSIYG7sN2XnDji2YE9YOQzTxt6MDY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4B99F805ED; Thu, 25 May 2023 03:18:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3978FF805E7;
	Thu, 25 May 2023 03:18:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A70ACF805E9; Thu, 25 May 2023 03:18:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::718])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14694F805E7
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14694F805E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hjpVvaSG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7lTJJdOVrWTT/JNgAcw4PhSholXkGNyblFBsl/yln+QQ577lMzGJHL57cZOv/dygkgdz/KsJor2yBuajku3I1qixRxVgRt8YwY+H3brf/qJDW2wgVwU5Mlc73YLR2XVhgzqLMF3YDxfo7m13MR/cLKpdS3CpD7EEsbVjF8HyiWHRHSHsPJjdwhL4ywhPiYUr6z4Do/JDi2uAeX7RXt4DLgVA3b1iDVdyYE//lXtjMOXLvSTF+848adr54TJtsmqhhZmKoGSmbpk+3xiplPI1o6xNZu07OOIP6a6uRx03g/d+Od6bbnzxcE4IpQVExZKMlTTB+qo09k7bjrdyzFgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oOkqhKbkTL/3SiEEeyds8HkZVDM28kI07WMjcz5kLc=;
 b=HyQERASeJV8iWHfkFokaqPGcaDnCS/bf05AkOHSuLy+QG02EHRV9sW9c8XJU6AjqkwXxkgTVmSPxIaJG8z+k+GtDStcaxIh3nF+1MuVmPYS+KoueysyzYXFZPrKL8R3NBihY6M4emlirrrQWE1Y9BVSpPAAP193dnYjpyK4mNoEE1gzMJUrCg3hDC7lKE55oM2u613nPb9TraaKnRbgn4VlmhV7ZDEM/3NiwFFZhOnbkrR9fXv4cOVUnJm4FJGVTphWZaCakOQ1aC5dksAmUz8DfwuWH5SBTLxci8BPgsVxZ5SYS2F0U2sPT1sD1U8LoS1QBOvvj+SQFXkSBY0k3Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oOkqhKbkTL/3SiEEeyds8HkZVDM28kI07WMjcz5kLc=;
 b=hjpVvaSGde+ZlJIMCII4qSWtjaM3J43pj7MALZ/Hif4xGDk4yFuTTyCLtnI6LwXiklP5cH6MqchAqLrv8g6vKbN06S7WeoJhC9Frmj9w1lnFfIWbhORtSA6iMAFnCLqhbo92PsDJzjJc4EuJTNT+FIHmhrzr9UW+QvVItnIZnKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB8485.jpnprd01.prod.outlook.com (2603:1096:400:156::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 01:18:11 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:18:11 +0000
Message-ID: <87o7m9gqek.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 04/21] ASoC: soc-pcm.c: use temporary variable at
 soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 May 2023 01:18:11 +0000
X-ClientProxiedBy: TYBP286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::33) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a05eb87-6579-4dc8-bcf2-08db5cbde82f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s4qL+axKsbrMQUwE87liaoEjnAP/OA5RL0iq6F8P+oXjDXUSjSQzrbKVofAaMREgTU7bE1mR6mYDH+V/Oylb5ocdj6dvxyK/VAFZ4Ly0524yHVZblcuNy56oD2bcZ0JnkNn9+2JO76ESnEmX1BPboLXrcPfdhrTysRWlCyPkN3R2HjeJBmFz8pswL9+X9Faut/b322WDJxZ5nwZGymb16wBJdkwWlUU+5GTom+437I1G2jTDdAjJmAEJRKEhCx90GN9Vr/K5FA7f5czcgNZWyEoE2gAoImKP56svtre6qtf3Ny1LLZsxr0XfeKtde4gArs+acCW6MsItlPBn9Yskcqsuqxk0KNGCjr+qO5aE2adNdo3x8Wtutfadx02iJ0cFyjkkDlCFZrvjteMjLE0tQqwet5CKl/cM2HBuPt7bjeVpTxvO/0qxMmWR4mJS3To5Wfebt5v/P+Mm8gBvTEG5PgtdQJdDb8FCYa2Q944uzBs5Q30hZojCfwNfEuj2197Pldb9ovmpg0G61Bd3olvWVdjznYd9N1yKhcAAuzYyjb6leiPJxchB4iuKTJxY2tH8b/I1l0S+zM51dUugpxxlXl5aARHqwtmYF76zmeB+x+uIwCV9knQBaZ6cIlkvN2uokbCtEXsxqqpb10Daoyz03w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(4326008)(83380400001)(66556008)(52116002)(66476007)(66946007)(6486002)(110136005)(2616005)(6512007)(26005)(6506007)(186003)(86362001)(2906002)(478600001)(8676002)(8936002)(5660300002)(36756003)(38350700002)(41300700001)(38100700002)(316002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QzYlNKtV0NCkLWrFS27Nk0IktMo6t5MKipNi6U23G/X0Z6n22UQKfPgjtPHi?=
 =?us-ascii?Q?1bgtYIjEP3f9BNcFpLZCkbS7DqSDUk7jD8nuP62vGW5+8fpz/rKArZUQd1vb?=
 =?us-ascii?Q?F5cutTauY/qDLZg11gSvxJYVc7SQp0FjjzskXJMbuIMYhohZKVoVst0s8G2S?=
 =?us-ascii?Q?OU09878KdzFzfSI/KSt8JaPmbHicbzyjp7Y6cwmmUZsYeX+e66TAi+JTlDne?=
 =?us-ascii?Q?VSlnrFzW8BPCSH17xlA6Yy3KCngGlYdG1oI5ittIEVz7IVJ/UZgYGPvRET2c?=
 =?us-ascii?Q?Sb3mI4oSfE6j9HrXJnOjVLpJ+8if7bIrBhWfVzuSbB0LV2N6aCOEfXF7my1e?=
 =?us-ascii?Q?4jPZEyjg/b6BB6s1uVM94cDFo3OBdSyiyvzdD5SRrglX2hH33shAIrBp4Xig?=
 =?us-ascii?Q?PEouPhspZjmnjx4gL1KLcH3yUTrllAh3zY4Z+VdAUvB4d8PsOGnnOxFqKhal?=
 =?us-ascii?Q?XfLQ4LPWKcs6ZeRN5cVTogz7+OU12HHRS+W3cnPrf63Frizc2M3EtSrYgOQ3?=
 =?us-ascii?Q?bd8VSYnGnSfYhDxO9IZnw4F7yKT4Ch3L+WnhR44l4/+VW8rcUmWrrNziKExT?=
 =?us-ascii?Q?h1pcnz/wZe0QXqQpPJX79TUFZC877omP8ySv/pMdI1awTe8qWcV8KV+RdzIw?=
 =?us-ascii?Q?RJAe5VP/S5xUfP61ag8X9pyCvUUTqW/iOiP4ZkpgxhGg7+cQDoBcURXebC8w?=
 =?us-ascii?Q?zBja6VvnX8CNgr7lgI1+qbfOOpOiMWN5xuOwstlyNRLVeWuy0OF7KOGBgv+Z?=
 =?us-ascii?Q?RsQR7OTfubZtTs3MXy0LktA9Wv4v+yDwSd8vuj8T0OoKC9tStNmrpBeVz4r3?=
 =?us-ascii?Q?Xbr7/OFZ4hDP/NcXIm0k9eawEJB4xXtxhberfoa21p9Lcd47+Vu5eFPxJvCD?=
 =?us-ascii?Q?IO9ChzLhK0hQqe5tp0e88YMOkcFxk7nrc8ytcKOp3juDDbEBwfY2SLPi/lOI?=
 =?us-ascii?Q?vtNCGwHUN0GZOAP1FwzHixsRfJ+opqAVIgL8x1TtXdNQHRCxXohrBWQLhAR/?=
 =?us-ascii?Q?G7W/o2EsWLwAWvwsxqYApgGEf464yMXoU2x5izt/MOKWBAZtz/IeihwpoTkM?=
 =?us-ascii?Q?JhfgAGBKH6GDXvK8Mf8himTRCZXQhLRxDJKvADrsEd8ePptCRv8aQl7F7DoN?=
 =?us-ascii?Q?S0hFGZ7cdYXGjOoDFDUHdhi/iSjaQMUQ0RsvnV6N2V4X/8ub2TmVtqw0lHan?=
 =?us-ascii?Q?rsCRjAN++0NpiX4oVNjNHY1cRL2ObkHMeZHR7ky1IWsj9uO32bltBnkQz42V?=
 =?us-ascii?Q?pM2Bl3j9mY0wFA3uj7k+GzBiB0jwuwI2el6qaBEUviVLzLUYJUCEO3IFdrSl?=
 =?us-ascii?Q?KE44YCy/ivcNmEgG5eyelBzXgpoF+EJJYPOqLHsNou+AsIgt/+S6rPOdHpxS?=
 =?us-ascii?Q?gdAdkICfq8L7aC9JGeW8PcbCp9fV0aQ3BgrONG9VJWQB1bv35/vG9ysE6uCR?=
 =?us-ascii?Q?Iyk25anKA7EcTSxjcT5F/WXUjViCvX4apbpxM+QLiqs+nuP9daXfGF92Aywo?=
 =?us-ascii?Q?R4Ml0BXVN807kOiYcFAj6tvdcjTyGk5fjOjH6eDQxoy95//NqF6/POKAdVRl?=
 =?us-ascii?Q?yvJc4pw/BjTsgNYDY/PtaTv7rzh3xTkOw4+FiGHKYGCUoqS73dVtsT0Y4sTP?=
 =?us-ascii?Q?ktWxmhJZ/CkBgalBHXFFMAU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9a05eb87-6579-4dc8-bcf2-08db5cbde82f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:18:11.8230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JKARucaGk9lFZOUe1Aqr2Em8fuUwot0UwB86EJNJOl44jR/nd8wMcGsMIX0/ycDfB7/WLil+mau/jvK+4p8g5BIvLdIEWSbEtcJxD0wVCdZP6UmCF1iRDLghWS4sW2U6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8485
Message-ID-Hash: HTTG6CKOBFK22CTCWVT3RZMZCRFIV2QU
X-Message-ID-Hash: HTTG6CKOBFK22CTCWVT3RZMZCRFIV2QU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HTTG6CKOBFK22CTCWVT3RZMZCRFIV2QU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) returns number of substreams for
playback/capture (B).

(A)	static int soc_get_playback_capture(...,
(B)					int *playback, int *capture)
	{
		...
		for_each_xxx(...) {
			if (xxx)
				return -EINVAL;
=>			*playback = 1;
			...
=>			*capture = 1;
			...
		}
		...
	}

But, it is directly updating playback/capture which is the result of this
function even though it might be error. It should be updated in case of
succeed only. This patch updates it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 47da3be0ff46..b3d569e7ba61 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2733,6 +2733,8 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
+	int has_playback = 0;
+	int has_capture  = 0;
 	int i;
 
 	if (dai_link->dynamic && dai_link->num_cpus > 1) {
@@ -2748,11 +2750,11 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 
 			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					*playback = 1;
+					has_playback = 1;
 					break;
 				}
 			}
-			if (!*playback) {
+			if (!has_playback) {
 				dev_err(rtd->card->dev,
 					"No CPU DAIs support playback for stream %s\n",
 					dai_link->stream_name);
@@ -2764,12 +2766,12 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 
 			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					*capture = 1;
+					has_capture = 1;
 					break;
 				}
 			}
 
-			if (!*capture) {
+			if (!has_capture) {
 				dev_err(rtd->card->dev,
 					"No CPU DAIs support capture for stream %s\n",
 					dai_link->stream_name);
@@ -2798,30 +2800,33 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				*playback = 1;
+				has_playback = 1;
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				*capture = 1;
+				has_capture = 1;
 		}
 	}
 
 	if (dai_link->playback_only) {
-		*playback = 1;
-		*capture = 0;
+		has_playback = 1;
+		has_capture = 0;
 	}
 
 	if (dai_link->capture_only) {
-		*playback = 0;
-		*capture = 1;
+		has_playback = 0;
+		has_capture = 1;
 	}
 
-	if (!*playback && !*capture) {
+	if (!has_playback && !has_capture) {
 		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
 			dai_link->stream_name);
 
 		return -EINVAL;
 	}
 
+	*playback = has_playback;
+	*capture  = has_capture;
+
 	return 0;
 }
 
-- 
2.25.1

