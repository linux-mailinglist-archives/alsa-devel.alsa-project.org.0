Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1834979B3B1
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:00:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59EB5E80;
	Tue, 12 Sep 2023 01:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59EB5E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476838;
	bh=DfCEjaTDPjOKQDcDiKVAXJYLELr9t8TU402VI9kIMfs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P3ne9b2NCkmF4ljTnDdCFLLGAO/u7Nbr0GQpfP5iMWFCXUs1N2OXoibYG1coW/WKm
	 DAqlQg9/Kxif3c/ZBggC4+Xi+nz8E9h0AJeY57EKHPm8BOVtFPEItAN0R4MZYYZuq4
	 KDlzzJiuwgPmexOBPSYZGrRwnX4VMxPQ4Q8PBxmQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28F01F8072A; Tue, 12 Sep 2023 01:53:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B338FF80727;
	Tue, 12 Sep 2023 01:53:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63B26F8069D; Tue, 12 Sep 2023 01:52:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20717.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::717])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A25EF8069D
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:51:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A25EF8069D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jWDDjygc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fm79473wD3x0tvf8fNoOM2UefP4CdrCdh1FCwh4dGSINFJL/Ik0B3uc7LDXjk0oEl3L2RoHQTUGvM0qqf1b3bdB4zkgRw4T/l53hXZNdL1ZpefbMWXp/suKxC6wIUSZJaq7BbNLNJ8bqWThCjgosn6/L4Yw/WNT7ZLZiWGMvAqP9faQ/dRvloE5iOHsjdNsfmS2otiAphQkW5e8xQzzxhKSL5oxvl0ff/Q99er/uldg9F0OGKJzFdwSQf5RwopIx/T7j+x2ghxQf10/uwPlMiMSs1iCCpyPvSWnpG5oRP2oCtUn3tFfcjX7f5olSTGdH0rnN4KWaLux2bYASxx1n1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qx6VUzeAbfggzFnbcTgVqI+ULTit6h068cc9hexjlIw=;
 b=Ac/1IQ/H4RFAArXhdZYyrdHTekSdvBu/tO067c3B3QLkAwNu8nRThLSp8ldJf9QHgqlhGCSpwOMB2UIfHpjm9a/zpNq7aAJLVWCH1rT15sGiRDgTS3nhXW8+LeL6EN11ZrnMjA/+s6MWakN4TLfpDBUtp0z5xCmIVKfSFKG/PTNot3oqoiduQiuV006OfTxCselm0sZJfR/lJxO9uWKH9IdmrjZyKjGNE7yX76y/laFGtdqNErC5P391Bq5QzK2TxiPMH/DwY7fc03Hu+WaPvImYF3uGL9y+FW0+Pt06YXY3Uhn2MBbOMdJPPz8hExiJ9I4HK/u3LrEU0Xvklc0D1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qx6VUzeAbfggzFnbcTgVqI+ULTit6h068cc9hexjlIw=;
 b=jWDDjygcAYwsU2wGw5bmbuVN0s430Znd/E7JznUlcigWUGb1PfNMZV8O+b83D/gvMC2BC5Mlog89tch25N3GTdDVLkaEzBPinZUwqZSVV9alegqpgUp+0GJq4Ozzu5vFwL9wcVV9jwpg5pcoQpqYpAoohNip8kjLpNFApD/AeEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5990.jpnprd01.prod.outlook.com (2603:1096:604:d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:51:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:51:25 +0000
Message-ID: <87pm2op8ua.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 44/54] ASoC: soc-dai: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:51:25 +0000
X-ClientProxiedBy: TYAPR01CA0129.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: d345c122-85f2-45ea-78c1-08dbb322028c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DRP25NpLBqpNEYLhB6XQJW0LABxAkNdevNTYYuijdPX5BoCycWA7ldcpZ68MinbvP89bfC2gCZKRd8HJe2K0defR8u1q2TYqHWFGGYnwPqYtJI6PPGypLaN/os990n+y0KwSmlyZOmeTrP9k0PTadXB4wH8RfgpOJrQ3UCZkkBgma4YXHxN4AaM/h2Xn/5jG/UzMbVw/umKkQSZ4U0rdRt2nBP6Yxq1T7MLAket69mbCAT8v/dmP01WoshGlMMY63kYc+1VtliUyORESRxug9oNwuDjTm9mIkbyLtiPAlCHn9Ri+1Mv9r34aRVFau+QVeZk64/2LWFPXtU57KMDsCQ1xfX7zvZCnepk8KHjhs5kSjgHenglrw3DWLzDlf49kNEHopNwI6tuq2PAkXZNRVM8ygUt4fQJ1L2+t8PyrAVx8i1d9OfJrJqURiCqFw3XTRgi6Vu5I0fs2Qw+NXOpl+XIBmGO8wfQztKzn4MrlZBbVQJ4JS8JQi1oB90e9QZ2dQYvJVAMFpVnXJnxgPTBEFdTMVjiTd0DOxYheQmHybiv7aJSFao6KlQesSDIOle8huGhyo3snjmg683yNv/iO+OAJAGt1xVUnsIxJIpbKVVv6xKcMq/zQj6HTECVQYzV9dUXiPkLD8cakzND36BhRpg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(316002)(86362001)(66476007)(66946007)(8936002)(8676002)(4326008)(41300700001)(5660300002)(6506007)(52116002)(6486002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mKQDQ+yHUz0XuDTMfn8Grzmi5scP4hVe+u9uIES1w6QJFC03IPupOtTE3nKP?=
 =?us-ascii?Q?rM9mbSIX1FsCz9buaQVCFSimT86j+0K4ZqyzXrK8sZbDCJMuRvWjUVV4uQfe?=
 =?us-ascii?Q?o0vZwCfgwZrorvmlRxpPzl0cARmbgarF5XT1lGxF91/9clpJdyNWSiINwqC5?=
 =?us-ascii?Q?bKXSRUB8tjEJBZQ7Aut7ikCX/nOxHuWEMFhIryPu/VGQXe+i6rX3qwNOH/O4?=
 =?us-ascii?Q?D+XdSPLJ4B+RbUS8KvDCxBVUhLw8sb03xRCwzEcxQCh9U0+wj1UZJxjbMJrB?=
 =?us-ascii?Q?Jcdnrgh+0jcP+Tupp5rVysD6akKiJ56LjOPe8O1ZGrMzzBz6zLU2mmEBeEY1?=
 =?us-ascii?Q?++nV2hpwFbspAl4OUlUj1E0qimDAd9o0Fh2b7hHgb+UqePxOLGo6sidh/9jC?=
 =?us-ascii?Q?hGj2tgYOL2PTkG9SYYotx2zSzv7bwBFGnLMBWcxEObm8uFzZicngRDaVrF1X?=
 =?us-ascii?Q?fiX2AGrgjq1+GMKHwpm+3kDd98p8LdZLh20m3ARa5W5Xi3TPjPALRGwAkeyr?=
 =?us-ascii?Q?QdvBPekUH+LblHeuow9VZ/NNw97ouBHTFdquGHxQHwAH18tFkDg3BTg13ZY9?=
 =?us-ascii?Q?yDJbf+XI5U/maDIznNjNo/thBr6z/E4UEzvyGDXOqIgwJgbnBOqBl+1Ek0Vw?=
 =?us-ascii?Q?EeFGJcGsx//uN155dCokAVECnqbo9Z8EyT9eUZRjzusDVfI8OX409MVYVXk+?=
 =?us-ascii?Q?V/i/p5oJCtz8NslI/9df/LYKVUvqYjcqEfRv65tRHqUAMAI1GZ47JXzibSLf?=
 =?us-ascii?Q?Z4bcItR+IBTxhgdHWSZz91iyCCVAWDx19j45m5xn0wxt4lQJgvIF+7OrCtUN?=
 =?us-ascii?Q?3dQC+UI7qm1o2kUl4DDT+T1Sc5CnEYakI/ruvUBWf7h5qEPvOpIFa9DIklQd?=
 =?us-ascii?Q?53zIUYpsXcXR3+yF6ifVljcDkSVgVdV9crCGvQ6nfwmU8MSwDAMchWqcZib6?=
 =?us-ascii?Q?lBhNIPC7pcn04t6W5CzToTIG4JPkUFMSXKAfkQ+cN9TLQ2adEUc6pNCvB+Ec?=
 =?us-ascii?Q?nMW4IFOpYx64r7AvocfACeoHY0Im3WNSdfrVNohux8eMpuRDPiWeutjklEqR?=
 =?us-ascii?Q?6Ny/CGPNwd9SZ/uI4hWCu9TtG6NMleoQ8J91v7TdLyD8kNMjI/dAdGfWwRy0?=
 =?us-ascii?Q?md3wT40PTwQyHiatxgIGNZbEK/d1mJIW2+3RzomSY/l10UhGs5dmtJnDHiZU?=
 =?us-ascii?Q?YQay9wMqaVoU8Z1vwF6g5afEIqT5kWgK4X/T9b7did85j/q2yrmrphKN6gJg?=
 =?us-ascii?Q?/OUdP0pYhxqbDDG7OFWDdrmGQtfEDWhFupXA0AVXL0VtCdgCpJa6D3QYA+it?=
 =?us-ascii?Q?SbFDco4by0qcWMHxAz7Us0Vtp+wQwA4HZ1NjxDfYrr3ODNbZeEubT1j0cWx6?=
 =?us-ascii?Q?LANkIeQ2J3/67gF1p7oblPfNrUMMSRBa0d5AdPFWYe3EA9iKEgo9tJDLYAwB?=
 =?us-ascii?Q?9iVO2c1asEZ75YI6BUxCEiFbfqy3C9ttm0XaQQUKfH3aS1s1bOHPEqMjEaF1?=
 =?us-ascii?Q?iKJlnfwbFL7kmyMzl8QkIqsOXsKSVt4Xnv47EwEq6l0zanTbtYAzNfhJvvr1?=
 =?us-ascii?Q?yEhh1b38q7mJwfQVSuyu5eCox+Ks+L5Svjcijdu/Il/+GBTcCkCf7jatH+dN?=
 =?us-ascii?Q?n9tQwU4jcARzaQ8Pwj1kZ7s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d345c122-85f2-45ea-78c1-08dbb322028c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:51:25.7531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KwniP0TjikVeG3eYrQ43dYgCGy0EM7lEfGgioI33c/o+5JCSePr0+Xd6CHIidg0lP2KLPmthGI+qRMCcBJX0J50I5YZGPdwCE+2BgZr3srMK+XKgFC3ljCpFsbHOl3Zj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5990
Message-ID-Hash: SOLFBF73LF3WA3DEBXXLKYDONYCHYTRH
X-Message-ID-Hash: SOLFBF73LF3WA3DEBXXLKYDONYCHYTRH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SOLFBF73LF3WA3DEBXXLKYDONYCHYTRH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dai.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 3f33f0630ad8a..3fe1271204fc0 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -610,7 +610,7 @@ int snd_soc_pcm_dai_new(struct snd_soc_pcm_runtime *rtd)
 
 int snd_soc_pcm_dai_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *dai;
 	int i, ret;
 
@@ -646,7 +646,7 @@ static int soc_dai_trigger(struct snd_soc_dai *dai,
 int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
 			    int cmd, int rollback)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *dai;
 	int i, r, ret = 0;
 
@@ -681,7 +681,7 @@ int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
 int snd_soc_pcm_dai_bespoke_trigger(struct snd_pcm_substream *substream,
 				    int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *dai;
 	int i, ret;
 
@@ -702,7 +702,7 @@ void snd_soc_pcm_dai_delay(struct snd_pcm_substream *substream,
 			   snd_pcm_sframes_t *cpu_delay,
 			   snd_pcm_sframes_t *codec_delay)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *dai;
 	int i;
 
-- 
2.25.1

