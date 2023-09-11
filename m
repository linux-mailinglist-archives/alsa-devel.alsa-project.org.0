Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE07979B0F9
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:50:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14D83846;
	Tue, 12 Sep 2023 01:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14D83846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476245;
	bh=KSkWG94FViTQDPP2++mHhj/Z1lM55Pm3Hmr4PN2zOXE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LU90+WQ45vP1luv38r1rb0cx0IpYICjIKcam7ZymXwygX5aUt14RP6+0dPLOPg3fH
	 4sgRmV1xKC8AhwcclFY21l5fQVoOuqwM8pZmoIO7f6kUdOoggKO8oTo5GvQkLMDCZs
	 xFPoIPrhjmaFgOVmYk28z74zHF/CWhy3hcZSJl5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47E70F80246; Tue, 12 Sep 2023 01:48:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAA86F8055A;
	Tue, 12 Sep 2023 01:48:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04DBEF805D9; Tue, 12 Sep 2023 01:48:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4C73F80571
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4C73F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MYuOIDXl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeNCsK+/0xm18pq08BDU3PJFAt89tu4xZvxi2gTgILrA1geWooxBJkaXoM6iqoTrKZN26ztcyDONQPf5sk3uyMjZvNJb2OKibICJBcZM3T8wjzX4rlTdeTn84ueRukU7RpXhtQLu4AqzARXbkzHzEjrdWDi8yXtDzS1niOgGCZ+JmaRVF0aniRQ89EuNRqc6PQzrt1vX7EHjuuVjGza+IQrkpAK7cPrUfCW1dCtQB9rrw8IX6+RPM2qOa9cOfQnMcWyE+5xLyzez3XJw7JxLYW3DRMnFt/v8xDQEToRXeSIzQC4y5twntUm/u+aXCX7mQECgtTDV05i+hfJWUmoKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TT1vtUxEeCsUnJr2EE1KBa30iWnAjSQE48IrFUhrTB0=;
 b=OCwVdZXVJQuzsEJKeRH2OYKWjIP/bnNmHSO5cao5BMNB94oiyKIZJaLtXMzRiDfebfwOva9udiiffs6uoVYS/gcR/Kos+j/aARrPUkDYi/orYweWngR5Oy5hTGDNjABtZ7hB62W+GCvwckmyFF3mbXIsB7QlXgwgeEsX+4uqVOElaLMQzKw1JPEAnTAZYwq5lwA/Kpdld0+50w6RDXaBa2GwZh8zyvAvnaSPfn6gAT+cHZPcjR1esk5WueO0knHXPOX7k6YpKDriVGNDvT8eDm1zl6rt3cdgiMnsRO7YK67cTsXa21kuFMKSEFUZZZbsbgSVevwQL7UTpOHPicTW/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TT1vtUxEeCsUnJr2EE1KBa30iWnAjSQE48IrFUhrTB0=;
 b=MYuOIDXlz2toE5/TmLhwXvt/gEvrMxX7BmgMIcdO7v50Z3wMcq0G1sa21dFPLsX/PMsPs92haysEc+PWJYKXKH6bgKCw5h7cVaNN8ikCZgIKyuRa3s/+JPoh5V+CVJJ2ibaXYlYnNh3yR6mcLGIjW4bRv/QDMc76kdrZ4A9Tt1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6192.jpnprd01.prod.outlook.com (2603:1096:400:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:48:02 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:48:02 +0000
Message-ID: <874jk0s24t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu
 Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/54] ASoC: fsl: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:48:02 +0000
X-ClientProxiedBy: TYCP286CA0110.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 45236db6-ada6-4814-b30c-08dbb3218992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xADNbX4GkfOHs/d6H/BUaVaTE9nLDRHffMH4kVY784QTGXVHBYKZtoMj6utEhJcF1fk/CFf0NySp5VFU9KPCWJWJr3C4Y1AIza23kUqINan6Qu9cPUToTv06pXfRGV5q+Hh3zplcOj1M1YvjL56u4/WRcNeAIRaxX2Jj/PQ0wopwQ4jPSV1j5gmLXqzIz75pIfGIFWvPAL/Mb8nygyu/iTAN4CKFuIc9SbINrN5uVJJvV1SvHdxo6qWdmE1Vu6Kau+Z/DU2Ex1AkRRIvdLHkP9O4twTGWbOzZemzmE1ETCoXlRy4DPXNeRPCVsGi2cnyLLdp1BsuPxPHfuVyVAPNqErVKfZkd6TxOSZzBRnjDY0TkCHljZvfbh+30dIZV6H0I/ndE1OnfaxmyB7vCbF6OapY7kaTtS74zzXUElwvnm37TizTCD0svWza3np9PQ5glalCKShLLzdVy8t8zmwA8QXd7EpFMwKTscqAVlPVFVxEuTGAjy5DUsr85glEhypDqfvbpHLxeWuW+qIUUYJcu3biYD2zzYXe3J+uze7ipPpGok4j9+xGOgqR/4oWyZIdWcES+J+eCXOXgn5D8fxVg2VnpyPiLD4myPzQrUiRLYf/d/ZSV8vNeadfvxavm837kM5POI7u8D0J7tanI7BVYw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(52116002)(6512007)(478600001)(83380400001)(30864003)(2616005)(26005)(7416002)(2906002)(66946007)(54906003)(66476007)(66556008)(4326008)(5660300002)(316002)(110136005)(41300700001)(8936002)(8676002)(86362001)(36756003)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zqQs1IL9zb9mFo8mXIJXSGdZhMnZcOhy8XI2G/MlJaYCQQbpmXOnmRH1/9AW?=
 =?us-ascii?Q?5wRYbpi5WBTfyR4QK6RMtsGNBEu6ilG4vpChObRsSR9XZmVpNAHpia5GoW/b?=
 =?us-ascii?Q?EfLJ0RoDyEHdQWtKEKAOhdkJVLh3EF864BFGqoXuS79C4CwwLmCfG9dlx3LQ?=
 =?us-ascii?Q?MwRUukZNLfaot+3HshW079u5sKwwxDOnefRJFQj13RHd7WCurTRLv6mQ3a5I?=
 =?us-ascii?Q?NdPrAUeCnmnb/1f2FhOBnzn8tJQqyIkyipmWlGDGwnWe+1Xl1HlKfsv2pie9?=
 =?us-ascii?Q?iXQH1F8d3Hd5NDJ8TExmp2qCEuhAaDUVSBC/ZOFTXWombHBaVZZem9My58Ok?=
 =?us-ascii?Q?9jCdkaH50zDOWdN8ygGc0u3cdjA7rGv5Emd6q/VNZCLr/ord/mLtI2mGaPwp?=
 =?us-ascii?Q?1Au/e769qY0hrUF+Td67WMQhNzdNNy7nohqymu9F1XiYnZPMA+G5ek2BkuiP?=
 =?us-ascii?Q?5gjPPEP1raVCmvQ9Bi4AQygIFF+QpLQUwI0weXf0PbsrtRYwIo6DQmFgaerm?=
 =?us-ascii?Q?56mavMQ1W+29r0P5bz9WUqdblI4y0b1J8isUuFekwEtPuD8cIZ1vsqOXWfzY?=
 =?us-ascii?Q?Gr0YYGOPQY/f34PwJvyI+PZY3+7g6DyRXO/JL/i8DOB8z+8hRbn8CNT5ZpMG?=
 =?us-ascii?Q?hejh9zbmWt8RtcEQgHTEN8Cv4mMt4sdXZ6andr8kLFVgrH6eBFX1CeJkfph/?=
 =?us-ascii?Q?8SlOJXpP777Jq9JQu2+SrWlsLCV6J1MRseJh5fvdEMcPNZOV3xcd72+Ak6Ho?=
 =?us-ascii?Q?CarwIhYuAC6rWcQq4JDFMe22mDXv5Q20VnGZZW3G41rx/5C2bz6J8l5ja6bw?=
 =?us-ascii?Q?b3BiDVdxLcrjLG/5hTtO6n3IB+V+LZ5eOlf0HPruKltNOolHpMuMzUsfhExw?=
 =?us-ascii?Q?78rYWGyyVxfTOf8fOdwDzuYhyfn3wZCM3wpj8QzLzTg29TMIFwnxh9/6Xmwg?=
 =?us-ascii?Q?tnpEohz8gIsgMluJBUA4mJwwdQfp2ucrKTJWptWOcsd8bSaJssfjCAYWsewD?=
 =?us-ascii?Q?nD+4U9Lo4ZyKvsjDi5uC9kzyUEOADvhAlJdPzOaSJIfmRqOGTo1xRXjJO0lq?=
 =?us-ascii?Q?F9VKacUHq28pXFOGVoPDSaiGvg4y1lzmQaQf10yhR9HT3KMfLUEnNHSGIPwY?=
 =?us-ascii?Q?VMqF6Dlm/6mwnm2zI9pB+hbqs6KZ0btbg1zyPb8xhmXK4unVJ20G8vJNKXPQ?=
 =?us-ascii?Q?p+MV6D9HP4F7ERhXgUnl8PLYJ1vuHsE232SBVQLZXH1HCGbm1WqcLOdGlDJ1?=
 =?us-ascii?Q?oklLnmU3yacPCJY6DvzyVuLFA4ZlB3/udXlekQ68R2bpmzHNTN6W47frrcap?=
 =?us-ascii?Q?kOck6DD1jvMlOnP0rlC3fNM7c13FQoFsgUstsLLfrsf8knxnKoPn1wvxcuTO?=
 =?us-ascii?Q?A6UfUw4zLx6D5XVKpV+06Txqtgr3v6GwLDfXJWeqk6Petv37jHvxqp/f3gPX?=
 =?us-ascii?Q?wUhSkaH749noFYLJE2YibuDo5WQE5IPUU87+q8lzDE8eju0uUx72wA36xPSo?=
 =?us-ascii?Q?510smvG8qzbjhFyJPt+6ScbVh/0fAhgDTBj4pGXviLMBlXK2aUuHZrddgFnU?=
 =?us-ascii?Q?hplirSm4PzJfqct4Hi4n1M8KlwzcGvyFJxG2zq1Ad7uvKXmIZRZYblpZf27o?=
 =?us-ascii?Q?MHqcxA+1B9OhEq7Yk5mNVm0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 45236db6-ada6-4814-b30c-08dbb3218992
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:48:02.7881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fiKJLJBiSMr5/jkCYKzmQCEhKcH8Hj6Mo4a0+uPJcqjMLvRjcK4bozFOTr7ORrXb1tRJe/bl7cuRtoXpG46/tz8jjlYBzD8VP1sz3JnXNgXmEGscvrgnX4WqozFHFV4P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6192
Message-ID-Hash: KQU75YLELKD42G2C45E7OOSIE2NC4LYL
X-Message-ID-Hash: KQU75YLELKD42G2C45E7OOSIE2NC4LYL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQU75YLELKD42G2C45E7OOSIE2NC4LYL/>
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
 sound/soc/fsl/eukrea-tlv320.c   |  6 +++---
 sound/soc/fsl/fsl-asoc-card.c   | 28 ++++++++++++++--------------
 sound/soc/fsl/fsl_asrc_dma.c    | 10 +++++-----
 sound/soc/fsl/fsl_dma.c         |  2 +-
 sound/soc/fsl/fsl_spdif.c       | 20 ++++++++++----------
 sound/soc/fsl/fsl_ssi.c         | 16 ++++++++--------
 sound/soc/fsl/imx-audmix.c      | 18 +++++++++---------
 sound/soc/fsl/imx-card.c        |  6 +++---
 sound/soc/fsl/imx-hdmi.c        |  4 ++--
 sound/soc/fsl/imx-pcm-rpmsg.c   | 14 +++++++-------
 sound/soc/fsl/imx-rpmsg.c       |  4 ++--
 sound/soc/fsl/imx-sgtl5000.c    |  2 +-
 sound/soc/fsl/imx-spdif.c       |  2 +-
 sound/soc/fsl/mpc5200_dma.c     | 18 +++++++++---------
 sound/soc/fsl/mpc5200_psc_i2s.c |  4 ++--
 sound/soc/fsl/mpc8610_hpcd.c    |  6 +++---
 sound/soc/fsl/p1022_ds.c        |  6 +++---
 sound/soc/fsl/p1022_rdk.c       |  6 +++---
 18 files changed, 86 insertions(+), 86 deletions(-)

diff --git a/sound/soc/fsl/eukrea-tlv320.c b/sound/soc/fsl/eukrea-tlv320.c
index e65a85feba78f..63f1f05da9476 100644
--- a/sound/soc/fsl/eukrea-tlv320.c
+++ b/sound/soc/fsl/eukrea-tlv320.c
@@ -30,9 +30,9 @@
 static int eukrea_tlv320_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, 0,
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 76b5bfc288fde..5b31c12a56f93 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -94,8 +94,8 @@ struct cpu_priv {
 
 struct fsl_asoc_card_priv {
 	struct snd_soc_dai_link dai_link[3];
-	struct asoc_simple_jack hp_jack;
-	struct asoc_simple_jack mic_jack;
+	struct simple_util_jack hp_jack;
+	struct simple_util_jack mic_jack;
 	struct platform_device *pdev;
 	struct codec_priv codec_priv;
 	struct cpu_priv cpu_priv;
@@ -167,7 +167,7 @@ static bool fsl_asoc_card_is_ac97(struct fsl_asoc_card_priv *priv)
 static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct codec_priv *codec_priv = &priv->codec_priv;
@@ -184,7 +184,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 		return 0;
 
 	/* Specific configurations of DAIs starts from here */
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), cpu_priv->sysclk_id[tx],
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0), cpu_priv->sysclk_id[tx],
 				     cpu_priv->sysclk_freq[tx],
 				     cpu_priv->sysclk_dir[tx]);
 	if (ret && ret != -ENOTSUPP) {
@@ -196,7 +196,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 		if (!cpu_priv->slot_num)
 			cpu_priv->slot_num = 2;
 
-		ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3,
+		ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), 0x3, 0x3,
 					       cpu_priv->slot_num,
 					       cpu_priv->slot_width);
 		if (ret && ret != -ENOTSUPP) {
@@ -212,7 +212,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 		else
 			pll_out = priv->sample_rate * 256;
 
-		ret = snd_soc_dai_set_pll(asoc_rtd_to_codec(rtd, 0),
+		ret = snd_soc_dai_set_pll(snd_soc_rtd_to_codec(rtd, 0),
 					  codec_priv->pll_id,
 					  codec_priv->mclk_id,
 					  codec_priv->mclk_freq, pll_out);
@@ -221,7 +221,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 			goto fail;
 		}
 
-		ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
+		ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_codec(rtd, 0),
 					     codec_priv->fll_id,
 					     pll_out, SND_SOC_CLOCK_IN);
 
@@ -250,7 +250,7 @@ static int fsl_asoc_card_hw_free(struct snd_pcm_substream *substream)
 
 	if (!priv->streams && codec_priv->pll_id && codec_priv->fll_id) {
 		/* Force freq to be free_freq to avoid error message in codec */
-		ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
+		ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_codec(rtd, 0),
 					     codec_priv->mclk_id,
 					     codec_priv->free_freq,
 					     SND_SOC_CLOCK_IN);
@@ -259,7 +259,7 @@ static int fsl_asoc_card_hw_free(struct snd_pcm_substream *substream)
 			return ret;
 		}
 
-		ret = snd_soc_dai_set_pll(asoc_rtd_to_codec(rtd, 0),
+		ret = snd_soc_dai_set_pll(snd_soc_rtd_to_codec(rtd, 0),
 					  codec_priv->pll_id, 0, 0, 0);
 		if (ret && ret != -ENOTSUPP) {
 			dev_err(dev, "failed to stop FLL: %d\n", ret);
@@ -503,14 +503,14 @@ static int fsl_asoc_card_late_probe(struct snd_soc_card *card)
 	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_pcm_runtime *rtd = list_first_entry(
 			&card->rtd_list, struct snd_soc_pcm_runtime, list);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct codec_priv *codec_priv = &priv->codec_priv;
 	struct device *dev = card->dev;
 	int ret;
 
 	if (fsl_asoc_card_is_ac97(priv)) {
 #if IS_ENABLED(CONFIG_SND_AC97_CODEC)
-		struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+		struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 		struct snd_ac97 *ac97 = snd_soc_component_get_drvdata(component);
 
 		/*
@@ -883,14 +883,14 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 
 	/*
 	 * Properties "hp-det-gpio" and "mic-det-gpio" are optional, and
-	 * asoc_simple_init_jack uses these properties for creating
+	 * simple_util_init_jack() uses these properties for creating
 	 * Headphone Jack and Microphone Jack.
 	 *
 	 * The notifier is initialized in snd_soc_card_jack_new(), then
 	 * snd_soc_jack_notifier_register can be called.
 	 */
 	if (of_property_read_bool(np, "hp-det-gpio")) {
-		ret = asoc_simple_init_jack(&priv->card, &priv->hp_jack,
+		ret = simple_util_init_jack(&priv->card, &priv->hp_jack,
 					    1, NULL, "Headphone Jack");
 		if (ret)
 			goto asrc_fail;
@@ -899,7 +899,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	}
 
 	if (of_property_read_bool(np, "mic-det-gpio")) {
-		ret = asoc_simple_init_jack(&priv->card, &priv->mic_jack,
+		ret = simple_util_init_jack(&priv->card, &priv->mic_jack,
 					    0, NULL, "Mic Jack");
 		if (ret)
 			goto asrc_fail;
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 05a7d1588d204..f501f47242fb0 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -130,7 +130,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 {
 	enum dma_slave_buswidth buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
 	enum sdma_peripheral_type be_peripheral_type = IMX_DMATYPE_SSI;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct snd_dmaengine_dai_dma_data *dma_params_fe = NULL;
 	struct snd_dmaengine_dai_dma_data *dma_params_be = NULL;
@@ -156,7 +156,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	for_each_dpcm_be(rtd, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_pcm_substream *substream_be;
-		struct snd_soc_dai *dai = asoc_rtd_to_cpu(be, 0);
+		struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(be, 0);
 
 		if (dpcm->fe != rtd)
 			continue;
@@ -173,7 +173,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	}
 
 	/* Override dma_data of the Front-End and config its dmaengine */
-	dma_params_fe = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_params_fe = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	dma_params_fe->addr = asrc->paddr + asrc->get_fifo_addr(!dir, index);
 	dma_params_fe->maxburst = dma_params_be->maxburst;
 
@@ -330,7 +330,7 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream)
 {
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	struct device *dev = component->dev;
@@ -375,7 +375,7 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
 		goto dma_chan_err;
 	}
 
-	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 
 	/* Refine the snd_imx_hardware according to caps of DMA. */
 	ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index 963f9774c883f..c4bc9395dff7d 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -200,7 +200,7 @@ static irqreturn_t fsl_dma_isr(int irq, void *dev_id)
 {
 	struct fsl_dma_private *dma_private = dev_id;
 	struct snd_pcm_substream *substream = dma_private->substream;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct device *dev = rtd->dev;
 	struct ccsr_dma_channel __iomem *dma_channel = dma_private->dma_channel;
 	irqreturn_t ret = IRQ_NONE;
diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 78d9dfbe65484..d42cc2f55baad 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -502,8 +502,8 @@ static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv, enum spdif_t
 static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 				int sample_rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct spdif_mixer_control *ctrl = &spdif_priv->fsl_spdif_control;
 	struct regmap *regmap = spdif_priv->regmap;
 	struct platform_device *pdev = spdif_priv->pdev;
@@ -605,8 +605,8 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 static int fsl_spdif_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct platform_device *pdev = spdif_priv->pdev;
 	struct regmap *regmap = spdif_priv->regmap;
 	u32 scr, mask;
@@ -647,8 +647,8 @@ static int fsl_spdif_startup(struct snd_pcm_substream *substream,
 static void fsl_spdif_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct regmap *regmap = spdif_priv->regmap;
 	u32 scr, mask;
 
@@ -701,8 +701,8 @@ static int fsl_spdif_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct spdif_mixer_control *ctrl = &spdif_priv->fsl_spdif_control;
 	struct platform_device *pdev = spdif_priv->pdev;
 	u32 sample_rate = params_rate(params);
@@ -736,8 +736,8 @@ static int fsl_spdif_hw_params(struct snd_pcm_substream *substream,
 static int fsl_spdif_trigger(struct snd_pcm_substream *substream,
 				int cmd, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct regmap *regmap = spdif_priv->regmap;
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	u32 intr = SIE_INTR_FOR(tx);
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 079ac04272b85..ab6ec19748072 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -634,8 +634,8 @@ static void fsl_ssi_setup_ac97(struct fsl_ssi *ssi)
 static int fsl_ssi_startup(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	int ret;
 
 	ret = clk_prepare_enable(ssi->clk);
@@ -658,8 +658,8 @@ static int fsl_ssi_startup(struct snd_pcm_substream *substream,
 static void fsl_ssi_shutdown(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	clk_disable_unprepare(ssi->clk);
 }
@@ -890,8 +890,8 @@ static int fsl_ssi_hw_params(struct snd_pcm_substream *substream,
 static int fsl_ssi_hw_free(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	if (fsl_ssi_is_i2s_clock_provider(ssi) &&
 	    ssi->baudclk_streams & BIT(substream->stream)) {
@@ -1107,8 +1107,8 @@ static int fsl_ssi_set_dai_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask,
 static int fsl_ssi_trigger(struct snd_pcm_substream *substream, int cmd,
 			   struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 
 	switch (cmd) {
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 0b58df56f4daa..b2c12e4ed5bf3 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -43,7 +43,7 @@ static const struct snd_pcm_hw_constraint_list imx_audmix_rate_constraints = {
 
 static int imx_audmix_fe_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct imx_audmix *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct device *dev = rtd->card->dev;
@@ -72,7 +72,7 @@ static int imx_audmix_fe_startup(struct snd_pcm_substream *substream)
 static int imx_audmix_fe_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct device *dev = rtd->card->dev;
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	unsigned int fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF;
@@ -84,13 +84,13 @@ static int imx_audmix_fe_hw_params(struct snd_pcm_substream *substream,
 	dir  = tx ? SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN;
 
 	/* set DAI configuration */
-	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0), fmt);
+	ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_cpu(rtd, 0), fmt);
 	if (ret) {
 		dev_err(dev, "failed to set cpu dai fmt: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), FSL_SAI_CLK_MAST1, 0, dir);
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0), FSL_SAI_CLK_MAST1, 0, dir);
 	if (ret) {
 		dev_err(dev, "failed to set cpu sysclk: %d\n", ret);
 		return ret;
@@ -100,7 +100,7 @@ static int imx_audmix_fe_hw_params(struct snd_pcm_substream *substream,
 	 * Per datasheet, AUDMIX expects 8 slots and 32 bits
 	 * for every slot in TDM mode.
 	 */
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), BIT(channels) - 1,
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), BIT(channels) - 1,
 				       BIT(channels) - 1, 8, 32);
 	if (ret)
 		dev_err(dev, "failed to set cpu dai tdm slot: %d\n", ret);
@@ -111,7 +111,7 @@ static int imx_audmix_fe_hw_params(struct snd_pcm_substream *substream,
 static int imx_audmix_be_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct device *dev = rtd->card->dev;
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	unsigned int fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF;
@@ -124,7 +124,7 @@ static int imx_audmix_be_hw_params(struct snd_pcm_substream *substream,
 	fmt |= SND_SOC_DAIFMT_BC_FC;
 
 	/* set AUDMIX DAI configuration */
-	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0), fmt);
+	ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_cpu(rtd, 0), fmt);
 	if (ret)
 		dev_err(dev, "failed to set AUDMIX DAI fmt: %d\n", ret);
 
@@ -247,7 +247,7 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		 */
 		priv->dai[i].cpus	=
 		priv->dai[i].platforms	= &dlc[0];
-		priv->dai[i].codecs	= &asoc_dummy_dlc;
+		priv->dai[i].codecs	= &snd_soc_dummy_dlc;
 
 		priv->dai[i].num_cpus = 1;
 		priv->dai[i].num_codecs = 1;
@@ -274,7 +274,7 @@ static int imx_audmix_probe(struct platform_device *pdev)
 			return -ENOMEM;
 
 		priv->dai[num_dai + i].cpus	= &dlc[1];
-		priv->dai[num_dai + i].codecs	= &asoc_dummy_dlc;
+		priv->dai[num_dai + i].codecs	= &snd_soc_dummy_dlc;
 
 		priv->dai[num_dai + i].num_cpus = 1;
 		priv->dai[num_dai + i].num_codecs = 1;
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 356a0bc3b126b..f71b3c1340016 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -291,7 +291,7 @@ static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct imx_card_data *data = snd_soc_card_get_drvdata(card);
 	struct dai_link_data *link_data = &data->link_data[rtd->num];
@@ -607,7 +607,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 				plat_data->type = CODEC_AK5552;
 
 		} else {
-			link->codecs	 = &asoc_dummy_dlc;
+			link->codecs	 = &snd_soc_dummy_dlc;
 			link->num_codecs = 1;
 		}
 
@@ -655,7 +655,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			snd_soc_dai_link_set_capabilities(link);
 
 		/* Get dai fmt */
-		ret = asoc_simple_parse_daifmt(dev, np, codec,
+		ret = simple_util_parse_daifmt(dev, np, codec,
 					       NULL, &link->dai_fmt);
 		if (ret)
 			link->dai_fmt = SND_SOC_DAIFMT_NB_NF |
diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index b6cc7e6c2a320..e454085c6e5cf 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -35,7 +35,7 @@ static int imx_hdmi_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct imx_hdmi_data *data = snd_soc_card_get_drvdata(rtd->card);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct device *dev = card->dev;
 	u32 slot_width = data->cpu_priv.slot_width;
@@ -70,7 +70,7 @@ static const struct snd_soc_dapm_widget imx_hdmi_widgets[] = {
 static int imx_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct imx_hdmi_data *data = snd_soc_card_get_drvdata(card);
 	int ret;
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index d63782b8bdef8..0d695e7419259 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -228,8 +228,8 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 			      struct snd_pcm_substream *substream)
 {
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
 	struct snd_pcm_hardware pcm_hardware;
 	struct rpmsg_msg *msg;
@@ -283,7 +283,7 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 static int imx_rpmsg_pcm_close(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);
 	struct rpmsg_msg *msg;
 
@@ -316,7 +316,7 @@ static int imx_rpmsg_pcm_prepare(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
 
 	/*
@@ -461,7 +461,7 @@ static int imx_rpmsg_pcm_trigger(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
 	int ret = 0;
 
@@ -515,7 +515,7 @@ static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);
 	snd_pcm_uframes_t period_size = runtime->period_size;
@@ -594,7 +594,7 @@ static int imx_rpmsg_pcm_new(struct snd_soc_component *component,
 {
 	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm *pcm = rtd->pcm;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
 	int ret;
 
diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 3c7b95db2eacc..e0c416a2eff81 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -34,7 +34,7 @@ static int imx_rpmsg_late_probe(struct snd_soc_card *card)
 	struct imx_rpmsg *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_pcm_runtime *rtd = list_first_entry(&card->rtd_list,
 							   struct snd_soc_pcm_runtime, list);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct device *dev = card->dev;
 	int ret;
 
@@ -92,7 +92,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	/* Optional codec node */
 	ret = of_parse_phandle_with_fixed_args(np, "audio-codec", 0, 0, &args);
 	if (ret) {
-		*data->dai.codecs = asoc_dummy_dlc;
+		*data->dai.codecs = snd_soc_dummy_dlc;
 	} else {
 		struct clk *clk;
 
diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index 26c22783927b8..3c1e69092d2f1 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -30,7 +30,7 @@ static int imx_sgtl5000_dai_init(struct snd_soc_pcm_runtime *rtd)
 	struct device *dev = rtd->card->dev;
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0), SGTL5000_SYSCLK,
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_codec(rtd, 0), SGTL5000_SYSCLK,
 				     data->clk_frequency, SND_SOC_CLOCK_IN);
 	if (ret) {
 		dev_err(dev, "could not set codec driver clock params\n");
diff --git a/sound/soc/fsl/imx-spdif.c b/sound/soc/fsl/imx-spdif.c
index 44463f92e5220..1e57939a7e29f 100644
--- a/sound/soc/fsl/imx-spdif.c
+++ b/sound/soc/fsl/imx-spdif.c
@@ -38,7 +38,7 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 	 */
 	data->dai.cpus		=
 	data->dai.platforms	= comp;
-	data->dai.codecs	= &asoc_dummy_dlc;
+	data->dai.codecs	= &snd_soc_dummy_dlc;
 
 	data->dai.num_cpus	= 1;
 	data->dai.num_codecs	= 1;
diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index 9014978100207..866a533fec83a 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -107,8 +107,8 @@ static irqreturn_t psc_dma_bcom_irq(int irq, void *_psc_dma_stream)
 static int psc_dma_trigger(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct psc_dma_stream *s = to_psc_dma_stream(substream, psc_dma);
 	struct mpc52xx_psc __iomem *regs = psc_dma->psc_regs;
@@ -209,8 +209,8 @@ static int psc_dma_open(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct psc_dma_stream *s;
 	int rc;
 
@@ -237,8 +237,8 @@ static int psc_dma_open(struct snd_soc_component *component,
 static int psc_dma_close(struct snd_soc_component *component,
 			 struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct psc_dma_stream *s;
 
 	dev_dbg(psc_dma->dev, "psc_dma_close(substream=%p)\n", substream);
@@ -263,8 +263,8 @@ static snd_pcm_uframes_t
 psc_dma_pointer(struct snd_soc_component *component,
 		struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct psc_dma_stream *s;
 	dma_addr_t count;
 
@@ -282,7 +282,7 @@ static int psc_dma_new(struct snd_soc_component *component,
 		       struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
-	struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_pcm *pcm = rtd->pcm;
 	size_t size = psc_dma_hardware.buffer_bytes_max;
 	int rc;
diff --git a/sound/soc/fsl/mpc5200_psc_i2s.c b/sound/soc/fsl/mpc5200_psc_i2s.c
index 413df413b5eb1..22bde475e9359 100644
--- a/sound/soc/fsl/mpc5200_psc_i2s.c
+++ b/sound/soc/fsl/mpc5200_psc_i2s.c
@@ -38,8 +38,8 @@ static int psc_i2s_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	u32 mode;
 
 	dev_dbg(psc_dma->dev, "%s(substream=%p) p_size=%i p_bytes=%i"
diff --git a/sound/soc/fsl/mpc8610_hpcd.c b/sound/soc/fsl/mpc8610_hpcd.c
index ea2076ea8afe4..a635e08f14cee 100644
--- a/sound/soc/fsl/mpc8610_hpcd.c
+++ b/sound/soc/fsl/mpc8610_hpcd.c
@@ -98,14 +98,14 @@ static int mpc8610_hpcd_machine_probe(struct snd_soc_card *card)
  */
 static int mpc8610_hpcd_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mpc8610_hpcd_data *machine_data =
 		container_of(rtd->card, struct mpc8610_hpcd_data, card);
 	struct device *dev = rtd->card->dev;
 	int ret = 0;
 
 	/* Tell the codec driver what the serial protocol is. */
-	ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0), machine_data->dai_format);
+	ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_codec(rtd, 0), machine_data->dai_format);
 	if (ret < 0) {
 		dev_err(dev, "could not set codec driver audio format\n");
 		return ret;
@@ -115,7 +115,7 @@ static int mpc8610_hpcd_startup(struct snd_pcm_substream *substream)
 	 * Tell the codec driver what the MCLK frequency is, and whether it's
 	 * a slave or master.
 	 */
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0), 0,
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_codec(rtd, 0), 0,
 				     machine_data->clk_frequency,
 				     machine_data->codec_clk_direction);
 	if (ret < 0) {
diff --git a/sound/soc/fsl/p1022_ds.c b/sound/soc/fsl/p1022_ds.c
index 0b1418abeb9c3..db09e8366944a 100644
--- a/sound/soc/fsl/p1022_ds.c
+++ b/sound/soc/fsl/p1022_ds.c
@@ -121,14 +121,14 @@ static int p1022_ds_machine_probe(struct snd_soc_card *card)
  */
 static int p1022_ds_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct machine_data *mdata =
 		container_of(rtd->card, struct machine_data, card);
 	struct device *dev = rtd->card->dev;
 	int ret = 0;
 
 	/* Tell the codec driver what the serial protocol is. */
-	ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0), mdata->dai_format);
+	ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_codec(rtd, 0), mdata->dai_format);
 	if (ret < 0) {
 		dev_err(dev, "could not set codec driver audio format\n");
 		return ret;
@@ -138,7 +138,7 @@ static int p1022_ds_startup(struct snd_pcm_substream *substream)
 	 * Tell the codec driver what the MCLK frequency is, and whether it's
 	 * a slave or master.
 	 */
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0), 0, mdata->clk_frequency,
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_codec(rtd, 0), 0, mdata->clk_frequency,
 				     mdata->codec_clk_direction);
 	if (ret < 0) {
 		dev_err(dev, "could not set codec driver clock params\n");
diff --git a/sound/soc/fsl/p1022_rdk.c b/sound/soc/fsl/p1022_rdk.c
index 4d85b742114c5..2d73502040957 100644
--- a/sound/soc/fsl/p1022_rdk.c
+++ b/sound/soc/fsl/p1022_rdk.c
@@ -127,21 +127,21 @@ static int p1022_rdk_machine_probe(struct snd_soc_card *card)
  */
 static int p1022_rdk_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct machine_data *mdata =
 		container_of(rtd->card, struct machine_data, card);
 	struct device *dev = rtd->card->dev;
 	int ret = 0;
 
 	/* Tell the codec driver what the serial protocol is. */
-	ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0), mdata->dai_format);
+	ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_codec(rtd, 0), mdata->dai_format);
 	if (ret < 0) {
 		dev_err(dev, "could not set codec driver audio format (ret=%i)\n",
 			ret);
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_pll(asoc_rtd_to_codec(rtd, 0), 0, 0, mdata->clk_frequency,
+	ret = snd_soc_dai_set_pll(snd_soc_rtd_to_codec(rtd, 0), 0, 0, mdata->clk_frequency,
 		mdata->clk_frequency);
 	if (ret < 0) {
 		dev_err(dev, "could not set codec PLL frequency (ret=%i)\n",
-- 
2.25.1

