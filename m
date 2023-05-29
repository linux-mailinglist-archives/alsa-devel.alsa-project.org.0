Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B30B714176
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:05:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5D5D4E;
	Mon, 29 May 2023 03:04:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5D5D4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322320;
	bh=ZuNMos54AIJNlqmD0jq22TXyOPV/7yJ53PYTpNN2gro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GS6urPrGR54kUzlgVpZHdDr7atdUT8GLiWlk/Gxza4RAo59ngDwM7feseCHCoC2yQ
	 n/yJd7/hAKJE2o7ir2qtskoOGs/BGkZstg7fXQxsPa7kbeepcqmh4dlHGZoVReG3BZ
	 EJuAoMTm8d1AfGfz3OtlzemOBnVf1gwLG/yD8eHo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D563F805B3; Mon, 29 May 2023 03:03:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1411AF805AC;
	Mon, 29 May 2023 03:03:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C827FF805B0; Mon, 29 May 2023 03:03:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06486F8058C
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06486F8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RCFnT7Mk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZ5cfXu5H7VYQqM614DU5rhc4g2vBR5rmMZMKZys20kqBDjIZQ9taBVW6pjjHoDsiIUspAjg6n8Tdv9hz+NfcnlEctpHMNrz1Ci05l7zg/tEQDAozkq5FsV8pqg/CIB8fC625kYxuqPAcLXWrXp6f+hZxvxqG5Nc2lszHXIqG9Qe04rKr7okBuK9l6ge9MbU2mPLYhd468hpFXh01oPeRXH0GSvjXD2hrDJrZHY7rngr8yJQI+XTLocI/yMTXDE9S5ZO/2ciOzlyByLj5U37gJWd3F/hJdgvmgO1ihqyNqs68HfHgT3gyipbfVem6UQof0/h87Lpdp2xDfcIxBW3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oOkqhKbkTL/3SiEEeyds8HkZVDM28kI07WMjcz5kLc=;
 b=ay4uX9OiBH3lDZyhoHkx+Q9aCpAbua1gSTTySCeKU63NmjE6mVBQ2WIEDDS9gQZm3siIVSABU/nU08TfeZ3RZ1iNaosrLw7F/5Fs90NkBpSeD7powIo4a6fHT2MDNdKQs9t8gxpEvDwoqUonQiFGUvW7bKOjJ3kEXMQRlJ4VHvbZAcbZh6Y02nbUb9l9T7N1sPN7lwOciHdW3izb1eVVFv5De8wlW0bmFA6tEXRyMfTF85ROJeeJO5BrCcllTeI4uz+SxGBxUb2jm6xgvqyGOZMC78t7P1NGnQ1n7J+lGZkrQUKQoE7/n+mzGVB9QWQJtn+9L2prDJ2VKQfChOjdIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oOkqhKbkTL/3SiEEeyds8HkZVDM28kI07WMjcz5kLc=;
 b=RCFnT7MkhDCTYS4vqvcf2q79a4iDPYad49/zb9gL8V1lCDt89n1LgcsZHtfARmQwEg+JWLX0WUzYw8cg4fWuHjWMbPus1T6InMeeEP6hfPj3Ukt80tCvOsDsN2pzkog13qliN1iI8g3UeEC1pJXpgZeUV+zrz23ZtFE1d08X2wQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8658.jpnprd01.prod.outlook.com (2603:1096:400:15e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:03:14 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:03:14 +0000
Message-ID: <87ilcclzjh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 04/21] ASoC: soc-pcm.c: use temporary variable at
 soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 May 2023 01:03:14 +0000
X-ClientProxiedBy: TYWPR01CA0016.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 35fe0a33-e22b-44e9-68f5-08db5fe07b34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ly72blHgvg/6i5LLxRqRNaHDDfI/qUEzkVkSPHJ+OaV2xiaI5fTB57P7FD8eJW4fMyAvlW7pOHch7EYWCzCnKwCTVaz7J24NfcFjqQPTWN9ESZQa8eKtNcmUC4AjWjK8HwC/pjZ20Q9AU0/WjIdsbW0VzcjsgNILhPPyQLvcCjPWqIN2fz8/1IajkLqFhWs6e6NapmeTuk/1a1BtJXxja3Mr/29J6sUIFA+RGEkLyPSbV+YnKYQbP14v6NP9i7iX5NkFlKD379mdZ3C96wgkSbOH5+DBelpevmDIW4EOFSdyzG/Og47nAyLmTsANUeuOu6kGeHrHPuuSXhaf5Lov7sKR8H/dQqGzI5i4e1qzTTiXbxGUCHNBoSZPWOnxC0Yt9sfY089rsodQg4nV9wS9NlE9bqLvwEhtOnEiA3E7kCtapD3226N/GaBUc7RnS6SZiWi6AsMLXd3ERdn8dSzocfD3jM9k4MM1mR4M1dcH2NmZQqfy9GgPllxQWh5cbDxxu2/LAfWwZcsI0JCuUYM2CXI/X6WQxt3NM8rLhcAKElWlkntYxGqtVxMDkw+tkA5kJSs/D+5cZk42M+hrwTSkiLwEN4pXx+WJ70vzAHK2cCLYt/CQUgyQcbuZc3qr/CDDmpZGPKv9qGB0Wq/6u2/3/Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199021)(26005)(38350700002)(38100700002)(41300700001)(52116002)(6486002)(83380400001)(186003)(6512007)(6506007)(2616005)(478600001)(110136005)(66946007)(66556008)(66476007)(4326008)(316002)(2906002)(5660300002)(8676002)(8936002)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rypZsQTYc9freb2HjGlUXhgRYMdBDbcVwa4bpZ62Wd3U44scb/DQA1nWS+BA?=
 =?us-ascii?Q?gCuehSZx97fYYsHZMdPSRweUQVuuCxeYiXNjYsRI2k1OK4OXwJWOd5s9p/ci?=
 =?us-ascii?Q?DP3BPamz/cwiqlwLV8E5/orjDnCvdiyLjoGzgsb5wLdIMPhNHnpQlGJOvZwV?=
 =?us-ascii?Q?C3Z+MaUeKYib2NhqM72CL8bKWtLqFEo4lY4JYhyGl1si+z/NIAlBBSu3WKrF?=
 =?us-ascii?Q?5fg8mjx1cjNymKSZowCaekNIxe6QDvN95axjIDB2F7Maqo5XqhYP71rJOq4u?=
 =?us-ascii?Q?AD0mChQbnfq02nWDWPCBLmNKjMLnaJV/hO0e7rriWaUKsJcabdN/42LUJp1U?=
 =?us-ascii?Q?QDLpsCEwkniAi/vH+G8TH9GkYu4Nd2yEZ0UH8zr3CQAf49W7LgZW+oFFoSKc?=
 =?us-ascii?Q?9ToLQrAd9lunKg+iutoiQHcDLzzpg/adeyNmSw24cyG2TsQDabmsAef/w4Iv?=
 =?us-ascii?Q?h6kLH1PiJAK7NXMvUDmNiAqNQH8RZmGyNrOZyDCnCBgMqDzdCO/vjUdY2bbG?=
 =?us-ascii?Q?T6qdT4DUScui6W2Yh5bEwVLuyfzPoxS88mokiVLWopXFqr+G1bmL6cbSnIHw?=
 =?us-ascii?Q?5IUVnCaTF11Jg41HxEaBKxLx/ejHuEdzURPJJgd9MiINrPLoenrkb+Pk/wNV?=
 =?us-ascii?Q?4XegNCooeBep21sEuEfUz+dmA/l34W6Ru+jQngDTZcan7VCTJvIqlwzLbhQ1?=
 =?us-ascii?Q?xEBmZ+2bQaCCLX7eqs9n3CUEYOiCFThn0+djGWg9gwdY7AkflHDrsH7pR93K?=
 =?us-ascii?Q?/P82ouxI2PvA4WY3qO+RFRekC6Pl+ZDALqFTA2nikk3QNBA7/vHkcvSQZ3du?=
 =?us-ascii?Q?+PbZV5MqpmCwTpARcNWZGzPNbN5T9uG6PSrR0gO/6sWOQegxu63Jx7KKsHfe?=
 =?us-ascii?Q?GvrS33297Y21Mkjou1MJPlvrPjzEWoQ0CxZRuTkCwnsCoKWdRRxKLffTT8o5?=
 =?us-ascii?Q?n3UutCh0dLvLxZS7CJ5zeQANgdm1anR/xvqOccHPErtzdHof370o75w8Wpei?=
 =?us-ascii?Q?ko3Df+orHRYkhwvyccLb26nZ+1B3qevXkhqP2KdLy/2SrjKCuu11a2YB1GeM?=
 =?us-ascii?Q?waQojSplF4Vo6MtGgXK3A1OdRSkEpoV6U38KK9sPpw29mx4Uolaf6B0Sn9Ac?=
 =?us-ascii?Q?8lKAkw384nomomuypat9trzLQvIprnmfhSaXnVVas4eQvFnEb0ZQpZt/+sMH?=
 =?us-ascii?Q?28y7RhzPvSvQPvm5BIn6KmIv1uZ2lasi2iuRvwKx+byCTF5yffUWzzdWHVfc?=
 =?us-ascii?Q?Mh064CeaStrMfws+zBSYUok3ERkSuE83VU32NunALlMwVhvNgliUhhVLbgeX?=
 =?us-ascii?Q?kbNMazHj+utW6RWioYmeF/vTmKuW7o+Ibxbsy1UuCAwCLdWtdsjrPYLnxEkZ?=
 =?us-ascii?Q?AsxJSBSF4pQYT1DuU+IJy5L/RlpVI6begx1QOhkANVI31SG8+j8pI4stGO/K?=
 =?us-ascii?Q?OCXYQpoD7yn2erDIam/s6bVkNCFnQEuCFvz8oCHQmT8q8fsqMt/mLjjnCMmt?=
 =?us-ascii?Q?bIEijmfUkDGoYFOehZMBHNJA19Wy2nXujV/TFa9h9CESKVi9PtySUYyL6eM5?=
 =?us-ascii?Q?zQDGEhzCRgbEZoD0df5+sTODjIRX4jkHmeBo6nw4ys47qGQQg4qbuv5drUe7?=
 =?us-ascii?Q?kOxagG3lMTTXPTs1DW63lrs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 35fe0a33-e22b-44e9-68f5-08db5fe07b34
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:03:14.8402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jIT/Z/UhKkF6f6AoZhMWE+ge4Vpb72uhfFPkz2+VnkLHTxjsbDbwmIcsoRJ9ZTyEd0u6Si6foE0gXAu9hwJENux+PIkxAQy+4vLoCobNfHZw7od/0wHVgs+/VlydmNGh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8658
Message-ID-Hash: ZPDFS76B3LKTEP4BOGP7BPEI2CE6ZT6J
X-Message-ID-Hash: ZPDFS76B3LKTEP4BOGP7BPEI2CE6ZT6J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPDFS76B3LKTEP4BOGP7BPEI2CE6ZT6J/>
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

