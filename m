Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F97AE5F9
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:33:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8040A1503;
	Tue, 26 Sep 2023 08:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8040A1503
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709986;
	bh=uYulVZQPgcAC8ulzMWBz46AtRDI6tyQE2UquRTMSgpo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UIxuEL4eoYiTQfEcsPNY06SHk5S8mCcTjreaZSfO9T+80L3WTEA6xzAc+U7rfhr00
	 1u9XAPIml7gFa8VWVY+78XkKn/gTb2kRBv8NKNv2s0HWDxdgLvbhQcS+DQ13ds1rXy
	 74jcZ+sZrnqhA4/ABwu9ClXmujfe0pAjospXjsQo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66FF5F80603; Tue, 26 Sep 2023 08:26:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07B0AF80603;
	Tue, 26 Sep 2023 08:26:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D22F1F806DA; Tue, 26 Sep 2023 08:25:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84819F80603
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84819F80603
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FkRQt4oP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbB8esK5XK1uZ5u29khX83pEgqWX5v7h/wJ4ivpdingEwergCO//Xn89tGdXGbSlEwp9JpZgorHvRPSwaSKPOTa8bljtT1pTlqslSIEzof9DWUCwlWlpgB35MSfmv2OMIVoNvp6u+plB3yIa39J3knynoeQqsObhXIAuSg80SmyuDyBsMGkfRRiCAjDMuHPM9hrUKdabe7o7NJyJF4+CAqM7pC0mzBqlTyOXv9n5DW0C5UtaYoUjHDINUYOm7SHsgF4lhlPtewFkcFxLoA3QVUC/w53+wa/DrrloJW1KFy+wyn00qFwFuY1ZzV7iapQ6wmTV0XOUxSlyFNf3C1gNRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C352d+IPCoCOFALMR4CyXU3Z25RWu4A/g1B1XtzALzw=;
 b=YP2YODDrX7q6ZcMwSStY3GaXdVwqT+C7d3lIilEa4WrZNC5YYKJl/c44qS7Bztfo/GJTE2m15PxB5fagmVKGI8QuX9HWEREx4BF8fFIZEt/DY2Wb0EPK4bLbn+SvdiWadgf4RhydE+8elhMilWGHi9lv3GB283g6hj+2+ETwaOAXiYxOsHYA7nt6ErVSZuL1rksU9Idf77V+uD/M1Zk1SETHy0YczCJV2GBBdodl9mF3Yle4oeXlSPoPX5bBvaB9aZJCg9KX5kPe2zBnCCyTslysetY1x1rv/Uw35KcfrjQG0pqftuKyzkSdGTFpMzKbtjsfHFFqnW6kku+jfa/T3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C352d+IPCoCOFALMR4CyXU3Z25RWu4A/g1B1XtzALzw=;
 b=FkRQt4oPHaRqgclQyCy2rEhhnCVk6Qnj0ITvUMTjO6eYyPlQ2sDn+i0biyLw0bsTXAZutnkulfsvHannyh6ZF4Ll12jubV/3Hxo5+eiUSI/IGD5Ur4dLNdr29WB/sKdl+u1ndkpbtapNGO/qaZZfgIuKoMDweFuUELcaA3B6VYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10043.jpnprd01.prod.outlook.com (2603:1096:604:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:25:44 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:25:44 +0000
Message-ID: <87pm25fo2h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
Subject: [PATCH v2 42/54] ASoC: sof: intel: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:25:43 +0000
X-ClientProxiedBy: TYCP286CA0171.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b658b86-2c7a-4fa1-7c29-08dbbe5969d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/AtgFpxXQsJz2Nu3s57T7Nz66QiwJ282uU+MDuM6LfxLDb+Pdrr83K5f43mRgWcgaFvocOshSPfCvjh24FjGHrroTt+xwjGdJyocoGuipJxPCwdMGX/ukgG8CG7kl0kgcuF0VwQ3OIqGmKEi/8j0tNgPOQhFPFZUl340eh5ZoLshiOCmQXJcmXgbr0PF5oAAod7s7Wj3Ewkd411IORoxFdthykOJ3Yt4+ODHqZ6Uy6sstiF6RMV3pi1bJS6xrVoLGdKw5pVKak6mpwP5qscKR5c+eJ56hEKX4h4dpiyIhyDz1pzgR/azl8ahovTrxZoKo18b7qqJ+6XrlhaZ6zlC1jAReIiZEL8BK8CHwwSzg2NP3GeYDU65lYqKeEu38a+ogijDFMpNw9PsMTCm1xPPNlW/fbx9P2m+B8StjbHE3eg1nG1evwRuro2BJ6fPL4j5cGNVxTy9TSIZ2C02hWTfYb7hafBCy/6XdXvd/DageCZTjK0gBT61H1BY3ekt7a+jQPHrvIVu9q+vj+ujLiaQMmdjG9jrKmKLtCzyyu6aEErVsWjBZocGj6M6JMirs9Ez+UA/F2SaT8Axq8vye2+2XqB66+CkRpTXAw3iE8iBLuxVpk8UEMdmnAZfRtlfeRHSmUcTS+jMYWSd5Vo+UH6koA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(2906002)(110136005)(66556008)(66946007)(66476007)(316002)(7416002)(4326008)(8936002)(8676002)(41300700001)(5660300002)(2616005)(26005)(83380400001)(36756003)(86362001)(38100700002)(38350700002)(6506007)(6486002)(6512007)(52116002)(478600001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QEmV74dDO72Yxk69yQQnmF+7fbt6ystZ1jTcvu36D0LO94nynd65aImZx0sT?=
 =?us-ascii?Q?OpnBzTj5Dijpe/PJP2IK8KAfs0PY5FjHzknDLwNeBExq4zq39/c49qvb87jY?=
 =?us-ascii?Q?WTX36td5RkhxfQu4186whvnMe5bsmTtIZaLeTpMAg7uTRIGMooTj5cXT7X+z?=
 =?us-ascii?Q?87aJsgaZWqbstvwPeXzlXSVd/x7meFO7Ve3MfzEqZIxRzsj/RZCjjjvfSdGl?=
 =?us-ascii?Q?KUbpMUO/7+392xTJxDIeaz40sPMn9I3JULwm57NleG29q5VROMo1z1cL2D7c?=
 =?us-ascii?Q?7pDSSLNA+0U1RCtV4Pdou/W25qSISXetXgVOR+bwVkaF8WyVfSY+RNzq8RAr?=
 =?us-ascii?Q?tVFPtj/R6X5pZ7X02P+1fbn4SDtR03ncLw/FHRqRyppTL2rd2ARzADxCQ4bw?=
 =?us-ascii?Q?7xHR9MtvKlijfDjWahfjEgzFoPOzfK6Zs5pH7yc7VYhK6snlucIoGsEG+q2v?=
 =?us-ascii?Q?Iz2iuE8Z7Dh6UEfg6qXtA4MZb8tms3NiYeGymoy5d9MHRLPoWacnqUWf7XgB?=
 =?us-ascii?Q?1NFOtCHfSG+TU7UbGwi5R/Ppsq//HbarKnZK3X5MhLRhyeoxxSz6JfDExNA6?=
 =?us-ascii?Q?07IKGV+MdsDP/ro1Zhb3+SMiKxb5hjgfg4m0xEUfujLz/yAZmycVAl+fntby?=
 =?us-ascii?Q?15um0QxYGoc6bbj//Wkkd2G7P9bSg0XA2Dg9NThgIAgJm7fQ06u/ckyiyO7i?=
 =?us-ascii?Q?baJfqYi020xRY33FrDpKqXogvFJw00fPQAe+6hCrxCcBZa8EavLfnsat0hSY?=
 =?us-ascii?Q?EdGl8Z+4fi5xjBaK8ahJPQe/9/kRZmfGA7pbgKCGwHqyw8gUNme0NKQf/3b2?=
 =?us-ascii?Q?mwoNTk2rtT7nTS7zQX8mWunL1BYtKfpuPwTQ1d9TQhciZwJKZ/xdpDO+F5Ua?=
 =?us-ascii?Q?u6785PFHV6ls0GhPxVbSM4BOIk6BPpthH3CUcWS9goLL2rKIBjcNn/mq8FQf?=
 =?us-ascii?Q?Ifuf6QABc7Dr0Nt1jYA4WdhZMlsS5MUy93QQX7ON1sdpwWAIHhH0KJfrqdZK?=
 =?us-ascii?Q?GZgOfsZl11FquO6MNbEbIR/oilw/3dKSF7D0DopOXa3VnPJDKnsiVHqaxGEZ?=
 =?us-ascii?Q?GzSDJYtnPb+BiRKImGpeIWzr8JBHWqqos6P/uwoF+MgWNmTMECi163NgQobV?=
 =?us-ascii?Q?INEeFPR7xcuKSZFK+lPwx/PQ3deLuLNKGU5Ly6fK/WnGKJ1gaYO72VRstlyO?=
 =?us-ascii?Q?tVfNgLG3Dw8b9xL5k97iNLrM/uNi8HC3tK6jWCV+xk5/lG9uuGqUzEBM4H2P?=
 =?us-ascii?Q?8YpS/rosEtQh3RQdlBdUPPU+2o87Kr4lwxfMMTmnxYL1gtLnSfhBywmDfAhU?=
 =?us-ascii?Q?h+vYwSP6HFb0QiPO2ygLlnRS483uYpgwTd94pqkOXvmqrRLdxxp4juzpVnRi?=
 =?us-ascii?Q?75CitxUQ0Qp50ceN53koMrAUQ3BHfUoL1DdRwjJ/bNu62CbRN4CsFg3d1eHF?=
 =?us-ascii?Q?Vaub8KK/YH8lX4EJhrJNczBFD+jIrczCPcTWORYYunb/vrcR87vxMqmo/aW3?=
 =?us-ascii?Q?3tve5+HuWpPAy+ttbWdr8bDcRKLZyMSz98unv8wKJyiSezRy+J1HMsDgzWaE?=
 =?us-ascii?Q?cRfy8xKsG3XI4HV4+OqCpQ8vXvz5Q/eZnF1Nz3lVNF3bK3VZxLSx7jSCi8kr?=
 =?us-ascii?Q?PysDunxRd5pRDa9gJDjoIw8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6b658b86-2c7a-4fa1-7c29-08dbbe5969d8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:25:44.1780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cXUiQWj+qZCBUbWatHL7SMH1VFOcWicBfNncoXgjLOMgkOYDopdMuoeqaOLt3rTeZs3OtYiaVLgkGAZLPUc6CLsQNDGFxBHw3fZ80tMKJJqIRvAjWZ1hhYEUx4LqUJ4m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10043
Message-ID-Hash: EM6TQK2QXMMZQQUEWY5COJJJH7C5Z5B3
X-Message-ID-Hash: EM6TQK2QXMMZQQUEWY5COJJJH7C5Z5B3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EM6TQK2QXMMZQQUEWY5COJJJH7C5Z5B3/>
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
 sound/soc/sof/intel/hda-dai-ops.c | 22 +++++++++++-----------
 sound/soc/sof/intel/hda-dai.c     |  8 ++++----
 sound/soc/sof/intel/hda-pcm.c     |  4 ++--
 sound/soc/sof/intel/hda-stream.c  |  2 +-
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 012a75f366ab..87935554b1e4 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -43,7 +43,7 @@ static bool hda_check_fes(struct snd_soc_pcm_runtime *rtd,
 static struct hdac_ext_stream *
 hda_link_stream_assign(struct hdac_bus *bus, struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sof_intel_hda_stream *hda_stream;
 	const struct sof_intel_dsp_desc *chip;
 	struct snd_sof_dev *sdev;
@@ -145,12 +145,12 @@ static struct hdac_ext_stream *hda_assign_hext_stream(struct snd_sof_dev *sdev,
 						      struct snd_soc_dai *cpu_dai,
 						      struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *dai;
 	struct hdac_ext_stream *hext_stream;
 
 	/* only allocate a stream_tag for the first DAI in the dailink */
-	dai = asoc_rtd_to_cpu(rtd, 0);
+	dai = snd_soc_rtd_to_cpu(rtd, 0);
 	if (dai == cpu_dai)
 		hext_stream = hda_link_stream_assign(sof_to_bus(sdev), substream);
 	else
@@ -168,11 +168,11 @@ static void hda_release_hext_stream(struct snd_sof_dev *sdev, struct snd_soc_dai
 				    struct snd_pcm_substream *substream)
 {
 	struct hdac_ext_stream *hext_stream = hda_get_hext_stream(sdev, cpu_dai, substream);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *dai;
 
 	/* only release a stream_tag for the first DAI in the dailink */
-	dai = asoc_rtd_to_cpu(rtd, 0);
+	dai = snd_soc_rtd_to_cpu(rtd, 0);
 	if (dai == cpu_dai)
 		snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
 	snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
@@ -193,8 +193,8 @@ static void hda_codec_dai_set_stream(struct snd_sof_dev *sdev,
 				     struct snd_pcm_substream *substream,
 				     struct hdac_stream *hstream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	/* set the hdac_stream in the codec dai */
 	snd_soc_dai_set_stream(codec_dai, hstream, substream->stream);
@@ -204,8 +204,8 @@ static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
 					   struct snd_pcm_substream *substream,
 					   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int link_bps;
 	unsigned int format_val;
 
@@ -226,8 +226,8 @@ static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
 static struct hdac_ext_link *hda_get_hlink(struct snd_sof_dev *sdev,
 					   struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
 	return snd_hdac_ext_bus_get_hlink_by_name(bus, codec_dai->component->name);
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 318a21c12cd0..a20deaf3b428 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -316,7 +316,7 @@ static int __maybe_unused hda_dai_trigger(struct snd_pcm_substream *substream, i
 
 static int hda_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int stream = substream->stream;
 
 	return hda_dai_hw_params(substream, &rtd->dpcm[stream].hw_params, dai);
@@ -408,7 +408,7 @@ static int non_hda_dai_hw_params(struct snd_pcm_substream *substream,
 static int non_hda_dai_prepare(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int stream = substream->stream;
 
 	return non_hda_dai_hw_params(substream, &rtd->dpcm[stream].hw_params, cpu_dai);
@@ -526,8 +526,8 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 			struct snd_sof_dev *sdev;
 			struct snd_sof_dai *sdai;
 
-			rtd = asoc_substream_to_rtd(hext_stream->link_substream);
-			cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+			rtd = snd_soc_substream_to_rtd(hext_stream->link_substream);
+			cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 			w = snd_soc_dai_get_widget(cpu_dai, hdac_stream(hext_stream)->direction);
 			swidget = w->dobj.private;
 			sdev = widget_to_sdev(w);
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index f23c72cdff48..18f07364d219 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -177,7 +177,7 @@ int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
 snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 				      struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *scomp = sdev->component;
 	struct hdac_stream *hstream = substream->runtime->private_data;
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
@@ -208,7 +208,7 @@ snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 		     struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_component *scomp = sdev->component;
 	struct hdac_ext_stream *dsp_stream;
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 65e9242365be..f2ebadbbcc10 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -38,7 +38,7 @@ static char *hda_hstream_dbg_get_stream_info_str(struct hdac_stream *hstream)
 	struct snd_soc_pcm_runtime *rtd;
 
 	if (hstream->substream)
-		rtd = asoc_substream_to_rtd(hstream->substream);
+		rtd = snd_soc_substream_to_rtd(hstream->substream);
 	else if (hstream->cstream)
 		rtd = hstream->cstream->private_data;
 	else
-- 
2.25.1

