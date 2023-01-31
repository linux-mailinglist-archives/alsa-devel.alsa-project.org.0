Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C68126821C8
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:02:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02A8A836;
	Tue, 31 Jan 2023 03:01:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02A8A836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130562;
	bh=vsculmxc1hx+N+BUkp7cdH3YTKpGnSwK8BQpqfswg1I=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LVwt92nCczrvnNKLnoyboAk+BUhgw2IU1/WK1e0eLCP3y9Xb9l/uw4ro8inPlBm81
	 zKPKZTzqBTVVjEpAZmgxq8In/tDYGIhdn97g4Gw1KGzo+4nx5dzio+ULPZFEUhYVCg
	 m0sMWmf4ifnYL7B5ysBTwNWWCi8RDLmhdWRXIu8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B4A3F80587;
	Tue, 31 Jan 2023 03:00:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCB4BF80587; Tue, 31 Jan 2023 03:00:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::720])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6FEFF8045D
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:00:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6FEFF8045D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FuLnpDN3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxU0T/89vnsPqgoWeGNOmVa3koxIeM0EuC/wsQFWl/XJpTdCBaC6HccFncFTeYMTN07yIVf4hgXfhMPrwoZhk6dueHi6OWbmbcf2JE7nZwvueWoHLa3OmXZlOKbsfZn7Re+sTiRdogpY4W5lUYK/Zk/ZmpvTVRzZ9u9H8o1BjhaCvWZVtwBjBOomJyHgFCklZzB2Iql6HEsaVCFCDYls28cRGO0Ee4BOU2uAkNW5oDtkiGLi79EQ29QP6etrLkfhkjI98NrxQ19VBEdzGquOfklgkZHxNUTgKHSRAYQhviBP86O9jcuaMW+yzNkY12Awvx8fI3EdwYvqdtViCROkIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOk8g/8a41/vqaOtTcIV6Zv9DYWHXY+9CUH4m49GtDs=;
 b=lA3OOSvJzjugzrcK51jLZ5YLCzQLtXu9pe+/n9Jm9KmvLPkHqijRZKZmGibRrKxvvbDLoBTnFFn/W34UZ/uHDGMOXq2/U5pa2S4pCK3VdOz9lNiUDIU6V9nMXcSPh2q10BGkRqtv53I52f5sj3y/VzvOZOJYOO6J8IzDKl5NnLv6mENrPPWxC0UuiUsjS/EBjynWJ4SUX7v8ES7XzAh9yr/9d7MIO3gmWz/p/P1loDdbIedJYWQAC4WHFSh44SmWbSv98qJr88Xbgjf+/eatY7ZFMYLtlVw5XqTlQJkxbXYtNy9B+9Y3wx5iRt4emQISlO4sWaJdq8xEQZROz6YZDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOk8g/8a41/vqaOtTcIV6Zv9DYWHXY+9CUH4m49GtDs=;
 b=FuLnpDN3MXqLeTbXphtehkFh8vD/lEY9k0fIuHJiSuHgvLlEdiZfxUZH3bCL7m4/y66Nf/qc36FYDBHgEkPjuWx/uE6v3F7s1+tNyCBtrsjoq0aw3SRSKIrutLbCxzIFszDF8t0oh3QOP4POBoSgc0PaGnZh5TWlygNTIY5duH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8196.jpnprd01.prod.outlook.com (2603:1096:604:176::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 02:00:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:00:24 +0000
Message-ID: <87y1pjea4n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 10/25] ASoC: cirrus: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:00:24 +0000
X-ClientProxiedBy: TYCPR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:405:4::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fbafcdc-c998-4911-f36b-08db032eead6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cv6QbsVJrLSxjkIzZHpaKbrQs3qrUaN3qDXwlXXcbGbe1VUH/V/QHv+WAJsEdW5SVwMccG+q7YOXVAxPaRojgqMMJCFFTjRu6kJ5Ke3m0Fw0JEimop9ohX5FjERfPSog8ahe6Pc6Xw1vZSkkWK/x0D5qxFPsMrYmvrcU983bXz0Ywi8Fg8sj/SahtEWAxUOfRSPLe/TqA64gBycn9ZFl1s92eDVwwIjRi762zhJSlxNFCqHBT65uFCHZEQ9cd8IKjLILKurH64vbiOgc7XxeSN1AQUR6IFuMlasLyL/6pb+uSvm4LX+t+vDKJSq84V82uUO4P+lF9UdKOzQELlFv0en5OaqejfUWomWO+PFgIWbQXnPcTMUNHXIMY0uQGuV7lUrG5XJZZT9a+rJxHgu/pFlNSkBuGHfezVSLSWEfyovf08UJiJqt5R+Gbeh1vZ91GTw+H1iCADgfz1URsjzvSI036760akpWIRlfWIKnpTEhYIj9ww4QffC40kRmL0hjjve/YkJPhEaDy0QgpqxiEoy1FBqN02AL1c7Drb1Wzy6c9p3orsgD/FCX5AG288kvqVTLcWZOptHEbSPpyb2vmKvWLkBjAnT8jwfAdBSZ5FVYC9viSKel1bYzT04wPtXje0m0aDhyzA5k/FJGWyDUxtPhaJiz+LE43+qABv7yl5Ml37KBndgvQ5bbKFfPuqsLgQJiFwcnaFUSVBRng2CeLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199018)(8936002)(2906002)(6916009)(38100700002)(4326008)(38350700002)(36756003)(478600001)(5660300002)(186003)(6486002)(6506007)(52116002)(26005)(6512007)(2616005)(86362001)(41300700001)(83380400001)(66556008)(8676002)(66946007)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SxNMu9gQcp5gUJjuRQX9oh5cqEYLAlMXzimmb/WWUUJHwUpYeANJfdlwC5ad?=
 =?us-ascii?Q?UhHmidInX9QTr5BzPhayspDVC5G8bW9sztRFKEyt/pgTHFbXdhi5zUGvWRzn?=
 =?us-ascii?Q?XRtjccrRFKFW59UOR+AZmkE615nFI8ZOXScnINhybj2DUDZhR6VJGaax94ME?=
 =?us-ascii?Q?8a9P2YuEvfRRFE38tG2U1FAvJ/QOWtRew5HaufWWRl6pyeSC35gQW+n1wU6T?=
 =?us-ascii?Q?D+p8WpOxtHgRBSoACvCzAQDW61H632cBadJmcljKw1v86s2e9s5RXROkcmGd?=
 =?us-ascii?Q?0x8l7nRiYzEV9N0gjN7llETfhID4W8dXASVLqUTE2CPamHLdI4uGpNMSXU64?=
 =?us-ascii?Q?3XwjgJzu9gzJjOV+3qLSJoqwf4xZYT/pLst3+O+koi9JpcQKYHWf1PHX10tr?=
 =?us-ascii?Q?ORC27zsrIqCFfayAunkyQJj1r7BI7YB/F/vU59Jm4/ZaGRC9sRDfcj02tHtK?=
 =?us-ascii?Q?WcPDA75d/l+4O3Kw8nX8b6IUgWgzbC4ag7yyyx1apbwqYI8u1CsMDzfpDT7f?=
 =?us-ascii?Q?Z5PE1QZJO6JR27rMfHYNfnfFJw2xsAWE424yNIB18u6rfweJJwLVov1oc8Kr?=
 =?us-ascii?Q?/zte+1KyeFJ40xM1ePWD9P62oNPjU7STFJvsM1ypbJvu+uVULd9OqYKPxYPA?=
 =?us-ascii?Q?5dfm37c87dL3F1qmimEanhDnhvoh6vqULwvEFJgygCfLfStP9Mqxae3TBcf1?=
 =?us-ascii?Q?oEC4F1nD9KwfnVh8tHzwIW8H2QnxhcMqlvMPxfPQN0zznpM9yc3P68u2qudL?=
 =?us-ascii?Q?io6pm8P38lXI2Cb08boivwtjKuGPITe0pQTRvRA7XJUAhKx04lyPLu2UN0k3?=
 =?us-ascii?Q?MgKxw0M+z6JsU0CZCSlDd3h+sYvUYqlPS/0W/sNlR/pB4385V82ZjGUd+HZw?=
 =?us-ascii?Q?5MwuH+BIUG1BMmF8gioS7TX1IXuTUIz/muL/1CRTS5QLhc/T2PyrLpJZDpEe?=
 =?us-ascii?Q?s2w/3zxTOvURZbWuwZ0pL60RAW1dZIMHguufeq3AB5jCktBbG1ioU7s07LaC?=
 =?us-ascii?Q?q8VA/Y/uJwb6Qbz2KTm6trm2yygnu4pKqyZRed7lO036TtckXrASlYMyNLZj?=
 =?us-ascii?Q?vv9g5cx07xxgCUOsr4EBulSan924iHP055x244Zk42AS4KR1Ipp7wu/RsTjC?=
 =?us-ascii?Q?dc2HW/pwAkC8BJmcDAhkezWbLhDHbf+qEIKwx0HSdO2IZmF1cFruBsXPOPdB?=
 =?us-ascii?Q?+38PU1Y365w3pf9PhEo4jk5JuRYTU1DLb5nh3b/MB1f1GqNVipQ9+QKIdhMI?=
 =?us-ascii?Q?4tfHYLcRtQguIROOucr7S28Fc3ylT3xpv0Ect4BUmkCmsxhKmu146oUjdt7j?=
 =?us-ascii?Q?Q39EPz6GfkLYZPNKxevpHq+0S/3WcSF9aXONCObqriqq8e5a5aEluCrTRWjR?=
 =?us-ascii?Q?0yfvDyAoHjsS2OGn2yVTQfYT5KMNAIbgoUwyMXIxAPqSnl39iJJ4u/CzCNzN?=
 =?us-ascii?Q?n+lQMBJG4lTqpa6hNjNviMmKOLuMCye5cH9aJ2ukjfQB0DWebH8Qu5gh2E/S?=
 =?us-ascii?Q?fcuv9WR8200mm6X0lKGR//fXvAP3SX/vJtN4YpcG4EYAS2y3yAMMcshXqNrw?=
 =?us-ascii?Q?4j07K4JR4/luM4t5qqjxEcZ6ZkQVZN78YqOZSHNapEqzqAc/AiSW+9B4yF8b?=
 =?us-ascii?Q?7AEU2T8Qv/wGdoQmsRP3KQo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbafcdc-c998-4911-f36b-08db032eead6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:00:24.7342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjXK6sVOwawo+aT9Q7rfwRJ3nXvYyeb637ojY94ELMUCViEJzzM1n4F0VdKdzCQWC/rkH1144KS8F8/iG5I+yGVrp/gw3BQ1mDwB0UVVw2lJ7rQM/7FwQCChu5Ci3Rei
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8196
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/cirrus/ep93xx-ac97.c | 4 ++--
 sound/soc/cirrus/ep93xx-i2s.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-ac97.c b/sound/soc/cirrus/ep93xx-ac97.c
index 37593abe6053..cec067c91a0f 100644
--- a/sound/soc/cirrus/ep93xx-ac97.c
+++ b/sound/soc/cirrus/ep93xx-ac97.c
@@ -323,8 +323,8 @@ static int ep93xx_ac97_dai_probe(struct snd_soc_dai *dai)
 	info->dma_params_tx.filter_data = &ep93xx_ac97_pcm_out;
 	info->dma_params_rx.filter_data = &ep93xx_ac97_pcm_in;
 
-	dai->playback_dma_data = &info->dma_params_tx;
-	dai->capture_dma_data = &info->dma_params_rx;
+	snd_soc_dai_init_dma_data(dai,	&info->dma_params_tx,
+					&info->dma_params_rx);
 
 	return 0;
 }
diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 982151330c89..8265173a7932 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -202,8 +202,8 @@ static int ep93xx_i2s_dai_probe(struct snd_soc_dai *dai)
 	info->dma_params_rx.filter_data =
 		&ep93xx_i2s_dma_data[SNDRV_PCM_STREAM_CAPTURE];
 
-	dai->playback_dma_data = &info->dma_params_tx;
-	dai->capture_dma_data = &info->dma_params_rx;
+	snd_soc_dai_init_dma_data(dai,	&info->dma_params_tx,
+					&info->dma_params_rx);
 
 	return 0;
 }
-- 
2.25.1

