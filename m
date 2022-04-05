Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3EB4F20C8
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 04:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEDBA16C1;
	Tue,  5 Apr 2022 04:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEDBA16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649124489;
	bh=ecX5pbJIgI8anrPM00fUNERBOwMY+VpV0tur9+zcBYk=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NyCVBzkg3qo9uoSu7IQKxYmEAceQm8eI77Lv7ijOUlB4FJXZ6mIuQebC/4D9xOstv
	 t7NSvWU4fY2gM1OutWumgF0VX+eqNSXXQEaUSurLMlTEdY4jYomnof74H1/Yg2lALn
	 2Stmy3AzcXSs1/TjZYj5uj3ZHUukFMs/UsVRXQDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AEB8F80525;
	Tue,  5 Apr 2022 04:06:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17A12F8051F; Tue,  5 Apr 2022 04:06:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::703])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2B16F8051F
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 04:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2B16F8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="Az0g6H4d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEm0G4HQv3lO0x3wiH0QOodUMBb4Ib66e0zS7nqBLb2JeHAo1c14REow7bIdJtfsb+udHXBhTmPObHHu1gFwgOIxbRbLOkgFjUgvx90nxfbRSE7/D4EZyp9t1BYuyuqHsQ48EE8qbPiyf2d2S0eSh5V3XFlKAiN16nmQA8Qzn0cZZsDuXp65qENzs6dZ/d/KcQdTmE9TjRfNhy2CvfkkfncqRDzAD1r/LuvzB2Cq4XboLCNDMSFZ+b7yUJamZf6JAfF/vzU1EKAacFtdG9CYPS9kgB5UoJWgDRGvDB11LZNhgYoOng5Ixl2NWGi0MSfGArYVHJeJm2HNXJVSdmtxGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0gSSk1Ks6fgN/vquU3zY4cQMEp00tOANumYwhdxhKM=;
 b=hetkLuJJB4BKYsWMsAjqtIoiw3Ef3Ot4bTfufnS0CyeUF3Sqs/VZb+Me/LxsR6LUuxb/r0oncFajsOf4/CEH2ZpkHNMtyK2jN1ERrpsKPnMyQDJSBEQZpCqGrij2S7IfFR97NRvRjpEvAAsFrdvUOH+64LR57rkTzlAvIxWSh2XizJQhmOqkYDj5jJv9FifF6biCfFtg2lqo6m0mewi7QjKLVF1Qx++TSQ3wKB+T3GS+WKlUDd4u27ZATZFAqFwpe8OqguUYdmcPPi2KJMyuO+3u5OVurQFyiLiTc063qn3Up8IuS4fM7/M9TMy2I0jfQTUzMpqnSbuLpsvFtoepzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0gSSk1Ks6fgN/vquU3zY4cQMEp00tOANumYwhdxhKM=;
 b=Az0g6H4d8ZFF9jgplW8GZPcxfxMvrxJW3g7dwPhuZnYPQKcrxA1khwk4kjuKmyCawtok/cij0NuHNFOMwtEaV1cKCCdWiRnR1xbZluFCFfOVfFODdpzojHiE2AqCRVApbHsr8Ed6VM4btLMbhPsaVZhIgWQMcQ7Lv9l2c2z82Sw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8525.jpnprd01.prod.outlook.com (2603:1096:400:172::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Tue, 5 Apr
 2022 02:06:26 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3da4:1dbe:7a91:8167%3]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 02:06:26 +0000
Message-ID: <87czhwp9lq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/6] ASoC: ak4613: return error if it was setup as clock
 provider
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
References: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 5 Apr 2022 02:06:25 +0000
X-ClientProxiedBy: TY2PR0101CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7e615c8-7441-4134-6625-08da16a8e3df
X-MS-TrafficTypeDiagnostic: TYWPR01MB8525:EE_
X-Microsoft-Antispam-PRVS: <TYWPR01MB85259E6CAC8AAA6138F3DAACD4E49@TYWPR01MB8525.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OnGhuIzLSJPNZ7CIMC+BQdSwDhUof1lluKeAm2mYUBIU53OMfI5ukhIYvK/BCcH4528thv/MbOQnPU+cW+b6eqVkhhBCoGSEbZsV+Fo5AcWPaftUrgtZPNWtsXKJL3mpajZQH5hIGBaptJ089lpVbV6arU2IDJ9z7VSQLLqV+kOQ0pzsRbqAd8uVdnqf3DRht0GJHuCWsAZ0yKLZmkn2htCnpu4RmO6ybC/OnjGd5wo+WJnI2dYrrSxVZAy5FDzaKJdOdF7iOtOWfZGXzGGRAzXRxbRFg7y3IM8FG0eQvd5uY49yE0DwQ868C8ZUo3lmEo0diCJ+rA+MWPjxYaIIlvBcL3/KpY1u0saU5c9RUvgopPS69UJkShETxZnSYo3rh5Sv1SK6fYf6KATWlIq5vyLKyfEMpKDreUOcPQNrV5vwcIzffePkTmrOneDJAZMPXMlyZ4qOFTNDJEcBS1RzRlNSnMmEeIzouWLcZQSbGDZwuz/8rQLWKvMDO8JDb+1JvepcxtG7QxnaMtC7H/St2Hd2oxlOPK3OG7a7BBPww1HFpHzOUou4AW037nxr0Ee89XMsDY3abrrrjGZ/5+thKc379BemZlEcfTnTimg2jeffhenlXGTLVWd6GPyIt15gyPtl8YA4txgqKN+uIH+0cOB0Ohc03t7yiCQQ/NHwC/2WWwFHglzpKqL2M8SXYgR+Vk7mpr14c3jji1+hKTgxBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(8936002)(5660300002)(36756003)(6486002)(2906002)(316002)(66946007)(66556008)(6916009)(66476007)(508600001)(6512007)(2616005)(186003)(38350700002)(86362001)(26005)(83380400001)(52116002)(38100700002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PzL0851nMrjH8M7cpEjWC6p//PrET9gY1jDSD61WbaBCjAwl6ivAEzqon0tD?=
 =?us-ascii?Q?F384NuiijDMQ+RwMG0CPFFsC4fvKi7SuqzjmIm7yWsvn6DKasUk/G+boZkTY?=
 =?us-ascii?Q?e0ff7JZVut9RP1Ag3ZworyhOf5Rze3acNjgIhu61wTUZddJZah6v9j8S9dh9?=
 =?us-ascii?Q?w+0vNtyr4UbD2cZdoucrrv5JiWl8Bo1WjvAb7fsABMEYrKVbc+Tc0hrp8C3p?=
 =?us-ascii?Q?n7p4zBrxmUbz06tl9CoAPyNnzz91S3f5rRZR1Twnezq4R51k9L9FdSkBT3Kr?=
 =?us-ascii?Q?yYJfmIFMNlPoZUeBK2jbwulluDFM4MZUvyOdoBvndVWo37Dzd2UrNQprP/cZ?=
 =?us-ascii?Q?1TCXP9K1yQBha3f4ICN2pUDwpqv0actXqRCBZQbkovjcLupE+pUDiGzpMzgt?=
 =?us-ascii?Q?gMgoeJUS+ZjuJ6wc9W6aecrcWRtO+1qb974oPMBdo/hmaZz9xiVtynpci5SH?=
 =?us-ascii?Q?JMnw95/4uW+OT88NT7YES0A1cGHEKcrxisAKkaL2gskDd8iiThDMN2D7zoiJ?=
 =?us-ascii?Q?GVAua/vO6J7HKDwafV+f7PmfhJNfCfsKow64E4Ri55xy+LDtIVyvQSugi93J?=
 =?us-ascii?Q?NNk3zTj0zks3lYYke53DVjydlasxR0B58KVtFizgDKiriL1T13IKayGbEGFH?=
 =?us-ascii?Q?w3V6YnYDhFJ5li1Ac/Hfcs5Q+mPu0tZ40X0ZJvtjBy2vbx07jcrKxS6ksOuO?=
 =?us-ascii?Q?RoC6woZ6awOkh9RcIwBUda5BoHgPQTpiPACTeG5+kT2P/NmXnf0fzF/m6o1E?=
 =?us-ascii?Q?uzZabvABrk/E6jS/q8r5qSejqXfUFzrRQ7o52/UCyGR9ma9QpXoT7Tbqbi6b?=
 =?us-ascii?Q?pgt3m0aftmzZQbvXAY8MsRi+ez2feEVgiM2RGS4u7nCeuGFG9ZNulz5br73X?=
 =?us-ascii?Q?P98yxQVP+l0vxtry/PkvcfTvzScg2cadzhTjbVZ28zEre5qLd3OsG60mtBaF?=
 =?us-ascii?Q?V2AWyd+MTcwyQV+18XGZ/eHLNS3fCUOymp0jM6Q7FsfsdQ73LnY/vXT7ohZJ?=
 =?us-ascii?Q?/ZBKin5OKcR3jYfT3bXk+qziJNoBLXwyNcEhsjplqmj/OzJR0gSSdxyhvmVv?=
 =?us-ascii?Q?13oIDNt3j+ojTLwRpoX9lCaTUrgKboU3t0kCWS/gUVe6BTbXiADwdNGCIHF8?=
 =?us-ascii?Q?ZLmvZGwsERbWBaTg/CyjY6DBdgVmmT6+Ah/Ci2Y1cYRY4b26K8taYHHhCiRo?=
 =?us-ascii?Q?kJBzsJ1bichte7j0gMJ59kxQWcgWgvg3nRVSUhOzrXxDd7DMKWyUMiVwGkYy?=
 =?us-ascii?Q?vYQEoUCGMuZPAN+pTKBJIIJ2Qlhdra5uJS4BJX/wmkUNfArkGnSuaKqdXfUX?=
 =?us-ascii?Q?1AsAPeqbFWq17SQALigmRqxL+P6Fy+9zcNIc1TF3zrcQ6iuFlnr15RJrOOmA?=
 =?us-ascii?Q?jbenR65bIUQ3j3u4uHsxm4Z2t1EMt+2hisg6uJ+o7cqBNiOsD9OvXnsF/iPz?=
 =?us-ascii?Q?SUoNGl4viQxI0SW2Xm9mnM3jZT7FDkLmeNTW5/Gnjg2ETI9NEGvvJVT0C2mb?=
 =?us-ascii?Q?3urz1d2LjV5P4Jz2eIZN+gDv4tJHMKzCLhTnS++eqwVInh5eEsSebXrfh6Sk?=
 =?us-ascii?Q?72zbhNQtls8+bF3T3SN7ysYBY6i1O/wbUANPHJDyyQnw27chN76Z7wf6iRJQ?=
 =?us-ascii?Q?SvTMtX0Fof6TD4sa7mCKbh/yd6lqqvsPy0yJGQW33lAkWxV15E/h77H1TLzr?=
 =?us-ascii?Q?/XZOR8H0DBokCJ94iFWsMH1jsiXLWHSRLQC0gyWzKzHxtHE0e7u7LLLHftwv?=
 =?us-ascii?Q?7k6r6AfL+O6ZxYXyhdbo9QadnYkefMu44ZtA6cvoYb+5QINJnL9J?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e615c8-7441-4134-6625-08da16a8e3df
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 02:06:26.0356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLNMq1RoX3/G9aLf98II4cgnUAITmQAR7Z+loeURg+3dQXx5Js9xnTMbL+5OkZzMf9VGRoJWFXZPo3jRoMVfsO623b0Wn5dSkO9WxC1JvAzZO3H3x88MdLN0QYJdzUjW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8525
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Renesas is only user of ak4613 on upstream, and it is tested
only under "clock consumer" because of board mounting situation.

Thus, "clock provider" is not supperted/tested.
This patch return error if it was setup as clock provider.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4613.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index a20bbf82e8df..b19c7c4a1971 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -329,13 +329,13 @@ static int ak4613_dai_set_sysclk(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
-static int ak4613_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+static int ak4613_dai_set_fmt(struct snd_soc_dai *dai, unsigned int format)
 {
 	struct snd_soc_component *component = dai->component;
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
+	unsigned int fmt;
 
-	fmt &= SND_SOC_DAIFMT_FORMAT_MASK;
-
+	fmt = format & SND_SOC_DAIFMT_FORMAT_MASK;
 	switch (fmt) {
 	case SND_SOC_DAIFMT_LEFT_J:
 	case SND_SOC_DAIFMT_I2S:
@@ -345,6 +345,19 @@ static int ak4613_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
+	fmt = format & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
+	switch (fmt) {
+	case SND_SOC_DAIFMT_CBC_CFC:
+		break;
+	default:
+		/*
+		 * SUPPORTME
+		 *
+		 * "clock provider" is not yet supperted
+		 */
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.25.1

