Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD85679B161
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:54:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F6E8E91;
	Tue, 12 Sep 2023 01:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F6E8E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476445;
	bh=+gWvyT6JEwiOdEealqR6YkaOjOlMxwNQcb7q19HmMvg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W0di5BKZlmd0I+/1gsc3I1WCiWeigYcQ1S6/h0il5pc6N+ZIgcwAHOl3/b2cDLwta
	 jNfwLoPBJbOCqhhFBwqHBRewDMJUrEUnohUMBOyZE1UB/CxWX4pTti8rWeAXgaRtFf
	 NEoKSo6atUYRV6fcEJv2hIwtElTGdYMhWQ8hsMaw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1FCEF805A1; Tue, 12 Sep 2023 01:50:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACB76F80624;
	Tue, 12 Sep 2023 01:50:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89056F80431; Tue, 12 Sep 2023 01:50:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58C7CF80431
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:48:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58C7CF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=d3Nw/laS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFTVbA9DWVeAz09TmFUt+ZA2L0EykWZVEPSV+Q4faYd8Y90HHPX3QRauW66yKb4YcF1xMLSoKLfH1u1fz1aH/cucl5H/R09Dzses5nOjRmN6T7W854z49C04QHcbj+Gq0IXdEg9hAGWdItQi/cbgUAf7Om425Kno3kPAPoYtJOUb4kYdoqTukHciuKlclo7YaHF55f2uiHVQx4pBftMfsAx0vLmVw+hFa3UMco6cmdbLSP8Dxx45gqQ/Vc1Gr3uN25cctVLPkhL3RLRCUt6Dvvyiu0tsJ8KLSA9lg4JPTN2eSnYpaeChMkiy1dCDUSLGAF6f10Xpz1SxqbIsP6OWhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9Ejj/85ywczqeLIiAatVRtR2K9WO2L3RvJ5rF/khK8=;
 b=Ta9Zx0DRfHOOemIrGEEDEjdIsorhzsOYT0frsmyRpSreS0wX99W8Y2z3orMBNLPsTDgQ/bAAwXDW5cVwlizdxc0gZS3fjvxxJtfbZK+DnisntGVVmeAWyR+xtBG4sj3eQVJ5ELJT/HDPY6hILKkAg4VVRyBVIDwo4wBL/JqVesMBYrfmTkBlkmqLXfNT9F4nM0+Bkh07ePryDDJGcMtVqVzIoRLTUSqtDpuE4oNDr9iKPEicGWL6XV24SNQPmT3RTdb+3lFzqTl55JlvsHLeMSvsAjZctFPz80Zv+mnoBb1qn/OLTXuImiXzseQtduVeoQ37F6s3CFv0RsQjbyD3MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9Ejj/85ywczqeLIiAatVRtR2K9WO2L3RvJ5rF/khK8=;
 b=d3Nw/laSU5plu3lmjc6m9i2K2Y2/x9Fx4XeMzJeImtSRqPe58HPExxFr9kLWLAXG7FVzP4sEjjsvBmWI1i4vv3ULisQxmFvw2SoqFo5zKoJLLXJztwCX/UodSLgEFfR1eUVsWBRRURbIkb4iJLT9y4IJa85NobdS6PPjmO4hQ4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6192.jpnprd01.prod.outlook.com (2603:1096:400:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:48:40 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:48:40 +0000
Message-ID: <87v8cgqnjc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 15/54] ASoC: qcom: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:48:40 +0000
X-ClientProxiedBy: TYCP286CA0139.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: cec0de33-d979-40be-da96-08dbb321a011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JGtiNf5mRkw2pOGwNQUUU9m4eDEmXfJiG7VXXq+g5ZlpLm3r/cve0ukuj/vZg2JfgzS2PcU6Bo4oPdCgcfgzubNLminxUP3T56LKZ9v8CV2TcTcDclyznIESfsDsHjQMjxGYKM1o15+DJgneMLdDNk1RDfjPgftgQozecrIjBKno4RaN09L9FMLY8kKytVaVtj1LMnsSw4obXoYPNYPLRhuHjxLynj8kVmORa34GS4o/f6RS456xztxfjiY8e6Ato3SzgkJKi18yUkkibLwPadfAi2W47ZlCXm5SVvbrF3Y02ERSdQvkAebUo1PlCElfIGySP2LhIedaroxuD6AJ063pUM4Wjn6q62lTNoPmERKsQSPLhfGv2ceZ4x2nJ0DsJM/UTIJRvio0hCGGJ1UdQs/M0/CeUVdU3lN5BtqgsgVLcabi4uEG247QDO9mbvAOpKUlcbltf6zxCPHwaSUEEIAMLjd4cIYjZpS1Pm+HgPk8UZsOjt3KBnefvlsX48hwtfn4h4HGSG9uTz7+BvmLoeihQopD6VcGUEj3BVPMQrnreyiz9OsLjlI0WOE2UYGgZEmCHesgX1pce9S0hVTNs50sh82gKfpdlxNxuJJxoZwn8zygojFKEak3kXT/UbzLuYC7cqljrq2wFimwPktIpQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(52116002)(6512007)(478600001)(83380400001)(30864003)(2616005)(26005)(2906002)(66946007)(66476007)(66556008)(4326008)(5660300002)(316002)(110136005)(41300700001)(8936002)(8676002)(86362001)(36756003)(38100700002)(38350700002)(21314003)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rIQWvfBObOKyfQJroN0uzKwFZoG5SciKxXDBrRvNatt0bSfWnbsvbE0mEzSR?=
 =?us-ascii?Q?yqkFyNRcN35VCF+9Pm69PQIDFqXRkvBPnX/qKIuymosH24Wbf5V/F6oW1py+?=
 =?us-ascii?Q?PaBEnYD2KxUFi37+xYt6B0wMyCJbITBTLiX3SNExJfGPuJwQi27wYx9kANjp?=
 =?us-ascii?Q?/WET14KWM1bubSkD6etGfc4AwvO5hHqaumxDJtyNhrEOV0UvLPtsOhN80Gng?=
 =?us-ascii?Q?wWFAJWNPzGXX95TkrShGgVSd9VaNiK6TLT0mcTF34mXXXcTNU4XKVA4jf4BG?=
 =?us-ascii?Q?Gm7okSkXFfW+AwSCLpme4IV+NWzjlpbOWq4Nx7jmdOTFGxz4JMV7w1eW1dNP?=
 =?us-ascii?Q?gwHrlFtwJuPb23Kmj2m+en1I9qqPw7z1GXpzX6KII9LidxmdbKxykbFUecGh?=
 =?us-ascii?Q?Hks51mY+TlW2QAESBK1UCw/Xwux2I9b+eOPhF2P8Iu5eE3bY0xRBGl25feSL?=
 =?us-ascii?Q?gKNyZAiu7ZhGXLaNXnK+nT35EkpwyMYUiPXdCuaz9JpFVxZawqSKnjO/u98l?=
 =?us-ascii?Q?K8i0uINOvwPGJaWDg8Ob528Ejx+eZ+e9A3VDizSCQAA2EFCCOyFIWf0F9lBH?=
 =?us-ascii?Q?9SlGT3sWSgmP4BaOWfiPBB26oI1DIpKzSwoAXI3uVxtCZluIdvQ/MvNPUYxX?=
 =?us-ascii?Q?2+641wYjcF+aqixmQoCyKnOKW31rmAivazm+qTPFLmSG+/1wqs6sgX4zJB3Y?=
 =?us-ascii?Q?e/rMW/tN1fhua9s8uleLGsZuRFBldiyHz8MyfgQuP9NYRrg6sxesfKQSy0QT?=
 =?us-ascii?Q?PwFxC3gf6PKlB725qi/Bvug/MzBFw8i2Hmnf9mbCD51Yr66t1qDd58J7WLe1?=
 =?us-ascii?Q?EJqJ5jQaN5LOCM2alLM78bgPCu/njj6q21OvRWpmjHc3lW6+RzYaBj6jlzhG?=
 =?us-ascii?Q?U7nWTfsDrA4pN9FraXgySlI3/WlSMXefCGWTcU6YxZvat0/P1KAnvNhaeaeX?=
 =?us-ascii?Q?bTB6C6k2G/IEmKGL2qTMmHuZqkYQlLqVDTw/pacElD8QP0wtee4IM6PrND6S?=
 =?us-ascii?Q?vybBS1y5mZZPzdgKuBvmS8j8GVi3F8disboiIlNWZJag4npY00H9uq3lyscQ?=
 =?us-ascii?Q?2FJ9XuTIfJRynMHkn30cZi/j0J32tzN5TNbyMEzPkAzg6dzD+O4ipLU6p9m9?=
 =?us-ascii?Q?GA/HduBWs5+kcPvkAERs3LEAQPxydi7q+cTbLU+Z8wMK+KFlZGhvuvRgWc3C?=
 =?us-ascii?Q?JoyyUOFFzHsUmj8SM8bkafliW9XmL5xkKwfXVtcb6jA/YE4RipNhyArZh4bt?=
 =?us-ascii?Q?WcENvo+tLI+eTTRmG5LL8zhuLOUGfjasEnreD/gygt2FNojBQ+d85ukh49ku?=
 =?us-ascii?Q?os8XqvPrpa0JeYrhobSFeES+BY/c7TUwbt1/NJKkzlPzG4adLVvSjE8aAMYs?=
 =?us-ascii?Q?Ft8JF7AE4tg/4YN2bRF3y9ZASJAhk/Y3mD41RSvviu2yg0KScaoGjXZgksBp?=
 =?us-ascii?Q?QbUjZhx4xmFu9nTrrvxhaWk1MZxUnBJgLjQPM86eJ6sNjARD5tUTLCHeYeIh?=
 =?us-ascii?Q?YObhu3gX6d4dD2eDdtaKXdiLsAb8d3gD1BCdrOF15GZCe6dkpzEoogBCcJyX?=
 =?us-ascii?Q?HXiUdPvQOY9MWay01hUJS7C29+0jlyZ84DxWjCQrwEJqIUOd1Kz+UfulPtNM?=
 =?us-ascii?Q?SNBbdlmy+u1o1BTO5OongAQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cec0de33-d979-40be-da96-08dbb321a011
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:48:40.5768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CKlSW8l6kXrP6v2fVW648hZ7r3qeoH68dfbMQMk2r6iEzjF1EDP6KWqon42ZTmiKAVwu9C3FoxY/DCwxzywiCt9OHUFjFsDvZ3h0JVIslOvcDbRmX1Mobu3A4xbP6Tq0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6192
Message-ID-Hash: MU4ZA2CEJUWRWDQH3IYFUS4ZLITLWBX6
X-Message-ID-Hash: MU4ZA2CEJUWRWDQH3IYFUS4ZLITLWBX6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MU4ZA2CEJUWRWDQH3IYFUS4ZLITLWBX6/>
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
 sound/soc/qcom/apq8016_sbc.c     |  8 ++---
 sound/soc/qcom/apq8096.c         |  8 ++---
 sound/soc/qcom/common.c          |  6 ++--
 sound/soc/qcom/lpass-cdc-dma.c   | 16 +++++-----
 sound/soc/qcom/lpass-platform.c  | 50 ++++++++++++++++----------------
 sound/soc/qcom/qdsp6/q6apm-dai.c |  4 +--
 sound/soc/qcom/qdsp6/q6asm-dai.c | 10 +++----
 sound/soc/qcom/qdsp6/q6routing.c |  4 +--
 sound/soc/qcom/sc7180.c          | 18 ++++++------
 sound/soc/qcom/sc7280.c          | 26 ++++++++---------
 sound/soc/qcom/sc8280xp.c        |  8 ++---
 sound/soc/qcom/sdm845.c          | 36 +++++++++++------------
 sound/soc/qcom/sdw.c             |  6 ++--
 sound/soc/qcom/sm8250.c          | 10 +++----
 sound/soc/qcom/storm.c           |  4 +--
 15 files changed, 107 insertions(+), 107 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 6de533d45e7d8..ff9f6a1c95df1 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -147,7 +147,7 @@ static int apq8016_dai_init(struct snd_soc_pcm_runtime *rtd, int mi2s)
 
 static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	return apq8016_dai_init(rtd, cpu_dai->id);
 }
@@ -183,7 +183,7 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
 
 static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
 	return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
@@ -194,7 +194,7 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int mi2s, ret;
 
 	mi2s = qdsp6_dai_get_lpass_id(cpu_dai);
@@ -215,7 +215,7 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct apq8016_sbc_data *data = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int mi2s, ret;
 
 	mi2s = qdsp6_dai_get_lpass_id(cpu_dai);
diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
index 5d07b38f6d729..cddeb47dbcf21 100644
--- a/sound/soc/qcom/apq8096.c
+++ b/sound/soc/qcom/apq8096.c
@@ -30,9 +30,9 @@ static int apq8096_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int msm_snd_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	u32 rx_ch[SLIM_MAX_RX_PORTS], tx_ch[SLIM_MAX_TX_PORTS];
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret = 0;
@@ -66,7 +66,7 @@ static const struct snd_soc_ops apq8096_ops = {
 
 static int apq8096_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	/*
 	 * Codec SLIMBUS configuration
diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index e2d8c41945fad..f2d1e3009cd23 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -138,7 +138,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			}
 		} else {
 			/* DPCM frontend */
-			link->codecs	 = &asoc_dummy_dlc;
+			link->codecs	 = &snd_soc_dummy_dlc;
 			link->num_codecs = 1;
 			link->dynamic = 1;
 		}
@@ -189,8 +189,8 @@ static struct snd_soc_jack_pin qcom_headset_jack_pins[] = {
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	int rval, i;
 
diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
index 31b9f1c22beea..8221e2cbe35c1 100644
--- a/sound/soc/qcom/lpass-cdc-dma.c
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -32,8 +32,8 @@ enum codec_dma_interfaces {
 static void __lpass_get_dmactl_handle(struct snd_pcm_substream *substream, struct snd_soc_dai *dai,
 				      struct lpaif_dmactl **dmactl, int *id)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -122,8 +122,8 @@ static int __lpass_get_codec_dma_intf_type(int dai_id)
 static int __lpass_platform_codec_intf_init(struct snd_soc_dai *dai,
 					    struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpaif_dmactl *dmactl = NULL;
 	struct device *dev = soc_runtime->dev;
 	int ret, id, codec_intf;
@@ -171,7 +171,7 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 
 	switch (dai->id) {
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
@@ -194,7 +194,7 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
 				      struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 
 	switch (dai->id) {
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
@@ -214,7 +214,7 @@ static int lpass_cdc_dma_daiops_hw_params(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params,
 				      struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 	struct lpaif_dmactl *dmactl = NULL;
 	unsigned int ret, regval;
 	unsigned int channels = params_channels(params);
@@ -257,7 +257,7 @@ static int lpass_cdc_dma_daiops_hw_params(struct snd_pcm_substream *substream,
 static int lpass_cdc_dma_daiops_trigger(struct snd_pcm_substream *substream,
 				    int cmd, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 	struct lpaif_dmactl *dmactl;
 	int ret = 0, id;
 
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 990d7c33f90f5..73e3d39bd24c3 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -192,8 +192,8 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct lpass_variant *v = drvdata->variant;
 	int ret, dma_ch, dir = substream->stream;
@@ -284,8 +284,8 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
 				       struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct lpass_variant *v = drvdata->variant;
 	struct lpass_pcm_data *data;
@@ -321,8 +321,8 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
 static struct lpaif_dmactl *__lpass_get_dmactl_handle(const struct snd_pcm_substream *substream,
 				     struct snd_soc_component *component)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct lpaif_dmactl *dmactl = NULL;
 
@@ -353,8 +353,8 @@ static struct lpaif_dmactl *__lpass_get_dmactl_handle(const struct snd_pcm_subst
 static int __lpass_get_id(const struct snd_pcm_substream *substream,
 				     struct snd_soc_component *component)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -388,8 +388,8 @@ static int __lpass_get_id(const struct snd_pcm_substream *substream,
 static struct regmap *__lpass_get_regmap_handle(const struct snd_pcm_substream *substream,
 				     struct snd_soc_component *component)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct regmap *map = NULL;
 
@@ -416,8 +416,8 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 					   struct snd_pcm_substream *substream,
 					   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -569,8 +569,8 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 static int lpass_platform_pcmops_hw_free(struct snd_soc_component *component,
 					 struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -597,8 +597,8 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
 					 struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -660,8 +660,8 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 					 struct snd_pcm_substream *substream,
 					 int cmd)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -859,8 +859,8 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
 		struct snd_soc_component *component,
 		struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -911,8 +911,8 @@ static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream,
 				      struct vm_area_struct *vma)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	unsigned int dai_id = cpu_dai->driver->id;
 
 	if (is_cdc_dma_port(dai_id))
@@ -926,8 +926,8 @@ static irqreturn_t lpass_dma_interrupt_handler(
 			struct lpass_data *drvdata,
 			int chan, u32 interrupts)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_variant *v = drvdata->variant;
 	irqreturn_t ret = IRQ_NONE;
 	int rv;
@@ -1169,7 +1169,7 @@ static int lpass_platform_pcm_new(struct snd_soc_component *component,
 				  struct snd_soc_pcm_runtime *soc_runtime)
 {
 	struct snd_pcm *pcm = soc_runtime->pcm;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	unsigned int dai_id = cpu_dai->driver->id;
 
 	size_t size = lpass_platform_pcm_hardware.buffer_bytes_max;
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index c90db6daabbd8..739856a00017c 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -332,7 +332,7 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *soc_prtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_prtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_prtd, 0);
 	struct device *dev = component->dev;
 	struct q6apm_dai_data *pdata;
 	struct q6apm_dai_rtd *prtd;
@@ -478,7 +478,7 @@ static int q6apm_dai_compr_open(struct snd_soc_component *component,
 				struct snd_compr_stream *stream)
 {
 	struct snd_soc_pcm_runtime *rtd = stream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6apm_dai_rtd *prtd;
 	struct q6apm_dai_data *pdata;
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index fe0666e9fd238..5e14cd0a38deb 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -218,7 +218,7 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_prtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *soc_prtd = snd_soc_substream_to_rtd(substream);
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
 	struct q6asm_dai_data *pdata;
 	struct device *dev = component->dev;
@@ -350,8 +350,8 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 			  struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_prtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_prtd, 0);
+	struct snd_soc_pcm_runtime *soc_prtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_prtd, 0);
 	struct q6asm_dai_rtd *prtd;
 	struct q6asm_dai_data *pdata;
 	struct device *dev = component->dev;
@@ -443,7 +443,7 @@ static int q6asm_dai_close(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_prtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *soc_prtd = snd_soc_substream_to_rtd(substream);
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
 
 	if (prtd->audio_client) {
@@ -603,7 +603,7 @@ static int q6asm_dai_compr_open(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = stream->private_data;
 	struct snd_compr_runtime *runtime = stream->runtime;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct q6asm_dai_data *pdata;
 	struct device *dev = component->dev;
 	struct q6asm_dai_rtd *prtd;
diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index bba07899f8fc1..c583faae3a3e4 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -1048,9 +1048,9 @@ static int routing_hw_params(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct msm_routing_data *data = dev_get_drvdata(component->dev);
-	unsigned int be_id = asoc_rtd_to_cpu(rtd, 0)->id;
+	unsigned int be_id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct session_data *session;
 	int path_type;
 
diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index 57c5f35dfcc51..d1fd40e3f7a9d 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -57,7 +57,7 @@ static int sc7180_headset_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_jack *jack;
 	int rval;
@@ -93,7 +93,7 @@ static int sc7180_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_jack *jack;
 	int rval;
@@ -117,7 +117,7 @@ static int sc7180_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 
 static int sc7180_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -139,8 +139,8 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int pll_id, pll_source, pll_in, pll_out, clk_id, ret;
 
 	if (!strcmp(codec_dai->name, "rt5682-aif1")) {
@@ -225,7 +225,7 @@ static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -249,7 +249,7 @@ static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
 
 static int sc7180_adau7002_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -269,8 +269,8 @@ static int sc7180_adau7002_init(struct snd_soc_pcm_runtime *rtd)
 static int sc7180_adau7002_snd_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
 	switch (cpu_dai->id) {
diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index 43010e4e22420..c23df4c8f3417 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -58,8 +58,8 @@ static int sc7280_headset_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_jack *jack;
 	int rval, i;
@@ -115,7 +115,7 @@ static int sc7280_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_jack *jack;
 	int rval;
@@ -137,8 +137,8 @@ static int sc7280_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 
 static int sc7280_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
 	int ret;
@@ -176,7 +176,7 @@ static int sc7280_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 
 static int sc7280_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -205,7 +205,7 @@ static int sc7280_snd_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai;
-	const struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime;
 	int i;
@@ -236,7 +236,7 @@ static int sc7280_snd_hw_params(struct snd_pcm_substream *substream,
 static int sc7280_snd_swr_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	const struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 	int ret;
@@ -267,7 +267,7 @@ static int sc7280_snd_swr_prepare(struct snd_pcm_substream *substream)
 static int sc7280_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	const struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case LPASS_CDC_DMA_RX0:
@@ -287,7 +287,7 @@ static int sc7280_snd_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	const struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
 	switch (cpu_dai->id) {
@@ -313,7 +313,7 @@ static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -338,8 +338,8 @@ static int sc7280_snd_startup(struct snd_pcm_substream *substream)
 	unsigned int fmt = SND_SOC_DAIFMT_CBS_CFS;
 	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBS_CFS;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret = 0;
 
 	switch (cpu_dai->id) {
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 14d9fea33d16a..cfb9c8dbd5999 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -34,7 +34,7 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_interval *rate = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
@@ -62,7 +62,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 
 	return qcom_snd_sdw_hw_params(substream, params, &pdata->sruntime[cpu_dai->id]);
@@ -71,7 +71,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
@@ -83,7 +83,7 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
 	return qcom_snd_sdw_hw_free(substream, sruntime,
diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 29d23fe5dfa2d..25b964dea6c56 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -58,8 +58,8 @@ static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
 static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	struct sdm845_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 	u32 rx_ch[SLIM_MAX_RX_PORTS], tx_ch[SLIM_MAX_TX_PORTS];
@@ -98,8 +98,8 @@ static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
 static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0, j;
 	int channels, slot_width;
@@ -183,9 +183,9 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
 static int sdm845_snd_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret = 0;
 
 	switch (cpu_dai->id) {
@@ -233,8 +233,8 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdm845_snd_data *pdata = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *link = rtd->dai_link;
 	struct snd_jack *jack;
@@ -331,11 +331,11 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 {
 	unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
 	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int j;
 	int ret;
 
@@ -421,10 +421,10 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 
 static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX:
@@ -467,9 +467,9 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 
 static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 	int ret;
 
@@ -506,9 +506,9 @@ static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
 
 static int sdm845_snd_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
 	if (sruntime && data->stream_prepared[cpu_dai->id]) {
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 1a41419c7eb8f..ce89c0a33ef05 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -12,7 +12,7 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 			 bool *stream_prepared)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	if (!sruntime)
@@ -64,7 +64,7 @@ int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime;
 	int i;
 
@@ -93,7 +93,7 @@ int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
 			 struct sdw_stream_runtime *sruntime, bool *stream_prepared)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 9626a9ef78c23..6558bf2e14e83 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -51,8 +51,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
 	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case TERTIARY_MI2S_RX:
@@ -73,7 +73,7 @@ static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sm8250_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 
 	return qcom_snd_sdw_hw_params(substream, params, &pdata->sruntime[cpu_dai->id]);
@@ -82,7 +82,7 @@ static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
 static int sm8250_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
@@ -94,7 +94,7 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
 	return qcom_snd_sdw_hw_free(substream, sruntime,
diff --git a/sound/soc/qcom/storm.c b/sound/soc/qcom/storm.c
index 80c9cf2f254a7..553165f11d306 100644
--- a/sound/soc/qcom/storm.c
+++ b/sound/soc/qcom/storm.c
@@ -19,7 +19,7 @@
 static int storm_ops_hw_params(struct snd_pcm_substream *substream,
 		struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = soc_runtime->card;
 	snd_pcm_format_t format = params_format(params);
 	unsigned int rate = params_rate(params);
@@ -39,7 +39,7 @@ static int storm_ops_hw_params(struct snd_pcm_substream *substream,
 	 */
 	sysclk_freq = rate * bitwidth * 2 * STORM_SYSCLK_MULT;
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(soc_runtime, 0), 0, sysclk_freq, 0);
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(soc_runtime, 0), 0, sysclk_freq, 0);
 	if (ret) {
 		dev_err(card->dev, "error setting sysclk to %u: %d\n",
 			sysclk_freq, ret);
-- 
2.25.1

