Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB01379B167
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:55:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AD5FE96;
	Tue, 12 Sep 2023 01:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AD5FE96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476556;
	bh=rlVNM4S1S9KspnG6ekuImLazDZ5YudcCqagD9/g52fI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W+l3YB6Idh1iJhjw9OAqQM2J23B115qopVacFVQc8lhIbfgsB6YU9s+bH9meLcC2h
	 UfMTfP0pfkfs63BSV+ph6/DcyPTPE9USok/9Rzo74xhbE5a2U7zwMcCqqXpGpVtTYv
	 JfQWDM7BIX+cVx4aj1oiZgnQ2Yt8SGpGCwkQc8VY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA15DF805F8; Tue, 12 Sep 2023 01:51:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A67D3F80579;
	Tue, 12 Sep 2023 01:51:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F354F80604; Tue, 12 Sep 2023 01:51:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5EB11F805BB
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EB11F805BB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Oanlx031
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lr28muEwtqeRVHHSQEhJKHxwE0RID4JhtKsd4sZ6X333QaWu31in6IRQFGFT01GcFraYvmw0nMGYXbcq66n/+4F6iTv+DuAZpTcFq5dPs1iZLIDbPPbKt4InxD46d4DkuV6QTqL0Ov7/LAQITTBNlcLG61ZvjiQYVN5jvq1GaeJuBto4WfvmpRgTFN0VuDi/CBegOmT159VNXTUClCYUgoc3GPjYFVCP3ccs44QtrN4mnCQNLFm9kHv3VnjfWFGLtGJ1iqL0z7+K2V5ME8XAD9uuFmhbsCWZn8N+4JDqosYxdEKgS7DZO4BvOp429n7WqIP4y03R4Vuf1DHAUn+7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tW+hvFb58zbixciwApBYlqcqkrjTYHR3OTcWnrarnD8=;
 b=C27V+e1vwH/D49gUyrkBzHp4n8nWSKF0EIv8GoG3HzPT4lfeEx9/cTsc9d8dWnEoLQCA4KCVlP7U4wyM2yI/NDjVS+5esw4RXD/DTRKRsTFNnS60qARGYfCLd18fEJaORAnI2DnBLfiDZWEIAS/EgNOLc1H7+mQtaVd2tQcSIpcSjQO6EtuWL5FveSEs/eu+S63g8vmGnIVMeUPcbP7M/lMwIeyOKRZLPwi53xZGJWPCNGpY8QSZbvy5WTDbKXMdbuBRQ3Jy5kqgC6Z07Wo32KwT0Na30/gcbc8tZfosTnIovlgUZEXiZ1Yrkpg650AqzjvBU2gJ0eeZnMT9ReL4mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tW+hvFb58zbixciwApBYlqcqkrjTYHR3OTcWnrarnD8=;
 b=Oanlx031SAVv74HrkxxJZuYP+OhaZueqPftTp0u1TYau4dfnxVx/QtFhsWq2d8LmkvVT9m0ZIx/nr/KCB4BnWySnk7VfbfPa4pR/mHCQ18En3xUgah6zrnhL8pelILxizbc2NtnO8DZE+8+azad/bNrPas0HEsRsvGeEu+zS4YI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11567.jpnprd01.prod.outlook.com (2603:1096:604:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 23:49:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:49:51 +0000
Message-ID: <87edj4qnhd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 27/54] ASoC: extensa: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:49:51 +0000
X-ClientProxiedBy: TYCP286CA0155.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11567:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb3597d-22ef-47d8-6b20-08dbb321ca66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	suZFrmCQr+WTtsORaD8MH0CAsch5VUyGNvd3HTpY9DQ3yOYmxxDkuE9K0mtCGqR9RnhdT67nGOBs9CiIKTwDyxRr7LWI83JA5IsYQqqF/FHfyV5dqT922EcQ2uirR+0wgk5Fm91T4y3sTU2HoBs1Qln2+U/Xo66dmZSC+Crm1nGXzGytaP03PmK4IUWYkZGcI3PAvNvx4rkkgprnrt2tRdKDM/3AwgGdTWCM7/AfydTb+U9/lfvgVOYUJ8uo1jMdFVHAq4Ug7Svr354crZAoV5cqO19eofq59FHz5sMOmQrNjhO7SI003wAk+bmdBVU+AVBZF7JXqWQIIDznh/RNLS0O/zbJbS1crYeS06KBeTxCT7ButOnA7raLqneLAk28O2V/Gybt/TiUKMPWNOos4UOPPlLd0nvnAYOWbcjsbw0TVFAbx7E76OXVl1k+Z9EYLgOI409DTW0RmNnQDYczh4xh8sgxcRZYk1XmG3rWNpZtAX1yX3Ov11gvF/9Pc13b3O6+ji/U3RlUNuSoS1Nw/ZILI7IBWv/2UFMbmdkkEK+kO2vyY43fKO3DmCI4JaxFOCp6Ydjhh4b4m2MbJOgBvCXjR36WncDK+5nTTb86INjkfTpLLNal5WI6rf1tPCML80G+3RHmbWL3f6UPwqU2Kg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(186009)(1800799009)(451199024)(6506007)(52116002)(6486002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66556008)(66946007)(66476007)(41300700001)(110136005)(5660300002)(8676002)(4326008)(8936002)(86362001)(36756003)(38100700002)(38350700002)(316002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vT0rAUABcw9g6Vhlvm7kTOMWBzO7+G4BAqxuExvT9e/zbChRLPXItp5GY7tS?=
 =?us-ascii?Q?ECwJtq07lqjF39eGiHh8I+CF/zMDeoWRwNdpBkmNaxZkjmUDneyMjOtxtMI5?=
 =?us-ascii?Q?WBwTa5216qml1pf+8XQfdCXWp3pZJu4znL1eyveQ4yZhApMxbXsbsQqaE+Oj?=
 =?us-ascii?Q?N3m0j4g22Sbv1whQuWwGyYUVlxHPUEXQuj77smBJ3eRkp1JUfOglGm92+qIn?=
 =?us-ascii?Q?SRnKoPbbZdhscnC3gMSJKcpiUUuE8HTcSeUl1y5Fn9ZaNTOzx5BrZ6GInpaz?=
 =?us-ascii?Q?EuehFeaf68lnqo8QxcwhkY9/udKfE9+DEL7K8yacUqsRhDosAZghqvBUaPtQ?=
 =?us-ascii?Q?HPf3vPvHqc1QPj5yNIYx6N/uHsY29KqjpanPfQUtiTbR7OzROrFpP6w4GmR0?=
 =?us-ascii?Q?bAVT2qFRwOaRrD2WEBibrynpve/nXkYvwmnhWxY9DXnaVac353BKu66Qo/nr?=
 =?us-ascii?Q?f/IVr1eN34L+jKw3CSK8JWJmUFLv4vZ7zGrZJaRuynyK9MXQ9G1GpJew3+4z?=
 =?us-ascii?Q?kSrUypCT3BOoGTWgd8PIlEeSOpQAZY9Qy5p8ia8OZaDdJI5wcthDVOdPy/qd?=
 =?us-ascii?Q?GlPDaqGXo/lGbLkJvkWu5PMjorbQk6HQ5ciz6aAkEegxdQGoJdhZ/UmKX6xJ?=
 =?us-ascii?Q?QK8L3wK33ojb4l/x7/G2wzMOF2SLtzJZ5/l+7ZEAnM9ZXMTDGduTp4fpgu80?=
 =?us-ascii?Q?nF/a9Q9B3d5kAxcBAcJMcIeIeeNJrQtqcZGn0NIydJMu5it7SvDEfk8X2LGz?=
 =?us-ascii?Q?xBoupLeMabhQxPTDlfKVF+PG2c4DSMdCBoi95NbWozO5vW3724EfZApHlVK6?=
 =?us-ascii?Q?RM67xSj9NlzExSYuJX1hZNyoOj3TKBjsc47RGu9FMx0118cT45oyRNeEtpRz?=
 =?us-ascii?Q?zYVV8Hggy399QSN+v+MpfKylbGWbasbnvU7Z6ni7Vl/T3rjdVzKYxIQfnXia?=
 =?us-ascii?Q?TcYhWMxhernDm8MxyG9ERXOO56MCGDKwE/GFOAyo3LFM4AW4jaDuArP5SwCe?=
 =?us-ascii?Q?Cl6NPTmNmqDbmroc93zeeeid4oFh3/h2Y+EvfMEnIeUPWV4jHzfZLdIPki78?=
 =?us-ascii?Q?lC37r8E1S9b9utD4Lr+GY+f1H/fYvy/v0UOEzX0d2FYU3XVLqh6dAOH5I8+w?=
 =?us-ascii?Q?oQdBmBJEBJI/mZIPLiMKPDDQYOy59U1nlNQ4dZoDeaC0FNijm7iQfFVnBBiw?=
 =?us-ascii?Q?ZjAUlqbS0LlYBWWTpQUG15Tqosf40PwG4Rqg9P0Vb39KvGs896pg37Xsg/vO?=
 =?us-ascii?Q?jTTckmOpZ7yqukF/TWVsLnwBjbzWuN0Ob4jT7ZXvhT+QyVic00Xj2i1PNNlk?=
 =?us-ascii?Q?tOl/9jfN5peRJ+09yuIxGkcGCAkixSIpboJ00Y9Up5P7vRSLgItoNNLuS98t?=
 =?us-ascii?Q?XliM5PG9Gk4u7Zyo4xnqOGmEHYCsQ+G8If/keRTMOh7dPykZY0cQQoJ4DBve?=
 =?us-ascii?Q?eThqSoMJ1NsFTy/sWH/O/sd9UJCmEbwpEOvwFHm7DcOedZAk6J3HAphsRloZ?=
 =?us-ascii?Q?ipPkKkabBpHcKSuG7MSXaBRxgbanm1lqehaUh+ubMfNLQHHpfsleHJCHTkqR?=
 =?us-ascii?Q?bVaPhypZEkZOaEYPY0XVwQ4ou/Ez5KV1stVygz+8n/TNe9kqOHKvEauby8s4?=
 =?us-ascii?Q?IToB8HKhZT3QfF98BD7noOg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2eb3597d-22ef-47d8-6b20-08dbb321ca66
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:49:51.5055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9Kq2Adw4lPqdVMOBRDrMLirXjEl9mWel3xv6c5J+7mO8OngYMdCfpZG6WM2J4T8ei/5LZKo4zWLJsAG8IHNdG1ths70c+a9SMcP7BFUjyQnXxdc8vBV8W1vfcDOGuZRw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11567
Message-ID-Hash: PUCLFRZ5AX6W72BE7K3QGTEAG5OW24DH
X-Message-ID-Hash: PUCLFRZ5AX6W72BE7K3QGTEAG5OW24DH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PUCLFRZ5AX6W72BE7K3QGTEAG5OW24DH/>
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
 sound/soc/xtensa/xtfpga-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index 287407714af49..6e2b72d7a65d3 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -369,11 +369,11 @@ static int xtfpga_pcm_open(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	void *p;
 
 	snd_soc_set_runtime_hwparams(substream, &xtfpga_pcm_hardware);
-	p = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	p = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	runtime->private_data = p;
 
 	return 0;
-- 
2.25.1

