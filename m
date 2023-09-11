Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A2E79B439
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:01:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 211C9F05;
	Tue, 12 Sep 2023 02:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 211C9F05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476890;
	bh=QcErEc72y7oggAoDQQthD/M0YtzYYt1ti3d+8BXxMDc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sa6UsjTUNwgkKJIJO7SpQlFDx2mtFqi4rxKNHWf1bNWjnayD7ssF1UhyIHG5IShb8
	 fiGpelYr7VWap6FtOpC8eayHxGH1efftcWZ/VqcVq5BiDE4t+HQ5GD9EmNDxwIDTbL
	 FwSUGRzgEx7La6Lv9oosB6qKaGnqVBiX5nZ05RNY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43A5CF80736; Tue, 12 Sep 2023 01:53:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CA26F805BD;
	Tue, 12 Sep 2023 01:53:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF7C0F805D6; Tue, 12 Sep 2023 01:53:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20725.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::725])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4967F806A3
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:52:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4967F806A3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lhlKcY6N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWdlzg7WRWH1LHVO/Blymnwpy/MU9rWeiLSTGvd666ydyCLLxXx0q9HD5gJTOOL1uuK+jfh7QJeZaUMNZXUxnGYiXsfUuwlj8Fw8MZS4XvKnXRaNwA6u8OL3B85SvsE60cLBoJKe68PP/28mz3/lkBPXmhrWLFjy6L0miyinG/IlRTNbbt6W65bOKNbmVyUrYEka1kKDEogWVE+rHH0owAUvkm8ZereDV2hTVxeUeio+XKNYdRVJuvBUKmUvP6pnEQuQdfeAX4q+ZH9Lx2wIyeCRs4/4VbY3qwpdgJhgznDm5CPYeh6sPj0BRduceEkirTMQ40YTGhSt+PgHVQRXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLBrlsrA/dfQvS5wz7vmf51ux/atkxxSfV+EiBOZeKk=;
 b=nmhgJ1Uda7E20PthX7l6XDlVy6V3OYxijs0YosRmHD4H4aUb3g8qSX05zpA5QVfblzg7AUkCp07tkyU99wuooQD4pJ/HQ7iT4HWsNKARfiEIJbSomE8x32MtBf/HufZkIQCOrtU9GYVXzwjVdB3LFtdzulTepxtJF2ZKAxG+SPk0wcRl4zPevGrfAneQLq92A24z+BklQwNj4yXDqCdzsApFJh7yG0R+aaFvQG6ZF4JkE9FmjYJ4yTwBlKSKEPFIzDj2jDksRdbWoZB89rAxUJwUWiIBHSQMyGNdLiN2mlYNPP6awWFR0ShzlI936NAJiSEGWsJze5uGJGcggmwQjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLBrlsrA/dfQvS5wz7vmf51ux/atkxxSfV+EiBOZeKk=;
 b=lhlKcY6Nb/HVZUSYo+ERlJmbcE1I3oQ6f+KyrzCE1NwwQEYqUPwDLBDPuy3d2foFYflAPtJaeRYmgr6QTq+wMLQRTU8vM/IV9/hOtXK0xW8cJb4fw/zvVWScvTHuOD8Bhpgh1zOS9lb5/MJnMcF/vAzecABxrLJ56QhjFMGazfw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5990.jpnprd01.prod.outlook.com (2603:1096:604:d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:51:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:51:57 +0000
Message-ID: <87jzswp8tf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 48/54] ASoC: soc-link: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:51:56 +0000
X-ClientProxiedBy: TY2PR0101CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: c63d4a22-726c-4902-e2a4-08dbb3221556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dEdH36wTjySdWwBRed32k4M4QdRqVyghKxsPm6XsXMndrW82NVtKaVaY0L3HvZ/UPWrjWH0bqsj8iRDZ1Ze6aiFNcvUyugJp+WD+XKmIQl9If+541p6pkfA1EcaZQ2kMdBHmJn5m01tpu3y3/+wB06HwLp6sH5XV5HVvTy9T8FAhEZ+S+e3hC6FIomIBn2ClvIbnW4d5VBp74ZOi5PYZXZPXeaxQDo+vVWiysZjr5Nmwy3I1/hdE19NVv6w7J5bn0c5UUz4qVjPpBamSaim9Rc9O2QHux7XU3Qwlx/2iXHNT2reAO8nPzhKDOLpCG9KQIOrjjPjmakGlSrgkdhdBk6CaTtQbDbFC2NdosiUZlnEpO8S1HklhhglHdrXMQyize3c44BDu6Hi85lnVGSmWGfSV4HogL2Um4MJIwCMzyc/wO6imDlnnz7HWr2a7FskBTQwAODgAVJ6pkyMi4XvdddLK/8h3qKm+/slz62kdYB8qdKvAxYray0LCmzK6jFZ1eaHisyL4NENuUitwKInc90cmXzIkQh7MR2N35gTP3IOPkipUPBVCm/I9UrsaJFACuARvp/l1zO4siw4txml9baMuAOF6hKWDCYAslTj3t86SgKmMxWJtAMbM3A0zbCS3syn/zjQiQPV4hIIXRyInoQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(316002)(86362001)(66476007)(66946007)(8936002)(8676002)(4326008)(41300700001)(5660300002)(6506007)(52116002)(6486002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QrGVDmxYz9UK5E0DWAAGPMcL3ClGWbjeBUv8ycaWBNeECwdFi+op2mHb/GRp?=
 =?us-ascii?Q?8oLiDAmyz6dF183z0N5YCUap5JnwUXbX2VXK+mmAlw0fr+Ahcb/pbPUxrHw2?=
 =?us-ascii?Q?M1auwE+E6bV2y+e4a7bTp71JxOG2OQYukrjKAcH5T7trwUM8rX9a6NM9Qqxa?=
 =?us-ascii?Q?zFqCPuAUFAWP1SCDIyHSuwLk+EOz8gvEoddslZPctEbxMr83Ix4UtAp5JpGe?=
 =?us-ascii?Q?tFavrWELaKJCoYluX5CFupHC2fNird8Q9fsb49xcru9/YxHDe9moKpfUPSyJ?=
 =?us-ascii?Q?xpUniBUUldDvEEvAb3ErPcVzKlJSKVO9siKapzBEss568yFdeibWeOKajwi/?=
 =?us-ascii?Q?KwFMqD1tmKhKZ5VgkGgSTh0l+8q+a2XFJJATPGYxxCEy8bq2XdME198CMFWY?=
 =?us-ascii?Q?3KHKgNOO3kDYUytJcNU2N7MtVe16Jq8E3+DI5mQXGYMPD4qwAFA+v77WEWAV?=
 =?us-ascii?Q?XHN/0+P8coVN7qeu6QAi8DkTYOUWDTuRzhJ2itS0Y5pK1kTmKph3dCl66CDp?=
 =?us-ascii?Q?tQlPbsJYoGTfPrkDbL/ndSv64rrBoUfmD4PXI+rqJCyaoKvt9GPevd1sxl6M?=
 =?us-ascii?Q?9phtT7tHPQclvt4TDcMVWG5sasaEpaUlinwY69JlIccuvFHzfYiIghhpaB1g?=
 =?us-ascii?Q?yYcEt3CevsnB3ONP/h3RwpORMKM/mugp77wTEn6W3OPgj0bdTvk0MMhmMlEJ?=
 =?us-ascii?Q?A0ZbY6C8zf2Ztkwsuqx9u2PMPn4P23biBtR56OGMz+5lWL3eUVX+cXJMzFNA?=
 =?us-ascii?Q?wKnKwLS8le0a1hZCd79eXn6jH94iJzPnuuFftYMzHj79p+eC7enjjnskep2y?=
 =?us-ascii?Q?3wsXnekejv9WCqTxWqSs//oAT1s/xeO7C2X4GiXtKXRQYhSgaLa+PaHq9B2n?=
 =?us-ascii?Q?UqDprJjp9kZl03bxLmRqAn0QZ3FTulIbk2ZLWyiDnpDK0eWGnv6lvRx3KI/C?=
 =?us-ascii?Q?u2DtyDk8A7T053Lhtk+iMm0mNSJoUrOozAGARBtkpiG8azzP5meA0t5oFJ/L?=
 =?us-ascii?Q?RUiZd/qPVifa93LMt5SnHXpFCdRyzJuNaJGFTl/568nvv+XCiTxIebHjC/zI?=
 =?us-ascii?Q?iUwU6h6SCvyWjVdFxPKNCYEC7ZkA0YYVTJIvwL75fqw+xvEV0TDMqweBuR3q?=
 =?us-ascii?Q?fM+VcXhdYfRq6u771ZnPfdSZ2z/fYDO3VRmArokeGMJOUdpB6f0T7/uUPtFy?=
 =?us-ascii?Q?EMSUNrSRCWzi8k3NBfVzu4Mpg3gnOz2Kk7PMCJvi++Vyb3g7mriMmlgvPpGC?=
 =?us-ascii?Q?zTrybmWCmCsWy9k7d/BkZXJNAcRpxbcsGPD2Xe49Io3AtvXGdS0osBiIlA9A?=
 =?us-ascii?Q?yBmg1Ms3v7zMv1OtIK+9/rnu010THlHyTEf/09t26gDDQbYFOcs2SjAoqXfC?=
 =?us-ascii?Q?jyUzCYWyDmbrXurhW77EiFNQlK71VjpnNLt2teXDbqDycjwmROccN3Id045y?=
 =?us-ascii?Q?F0/WhOYpjp9caKNgAfCe6uRVmCfuHrBcJqvW9VSLckLEsjjPEUC6gzjG1Cqw?=
 =?us-ascii?Q?1GinSSIpI+6IVlXoM02pfenjQtAkMJKI/1kY/Scue4jihJgQPcpGixFgIIJZ?=
 =?us-ascii?Q?iqlp3IXhik/cqr6ymCpQux1lv95acCtettufM2bT1dPX4oAldn3k/bmq6pjp?=
 =?us-ascii?Q?4ABZAh2EMtOphMUHTnHt7Fg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c63d4a22-726c-4902-e2a4-08dbb3221556
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:51:57.2583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CACaLRuidc6jnfW6jo2k8dZ0vZIRFvoYzDjZyXmJfdCe3phbf24WgjLys30OJKBfdRTCE7xE5B3PERelGdeCvquXylih1+mMsRHnA/9nEElOY6NBTAO4eFJAyasEnScq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5990
Message-ID-Hash: WY3E6OUDMQJPSPJ6NW6AOSH5VVUWDLYN
X-Message-ID-Hash: WY3E6OUDMQJPSPJ6NW6AOSH5VVUWDLYN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WY3E6OUDMQJPSPJ6NW6AOSH5VVUWDLYN/>
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
 sound/soc/soc-link.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-link.c b/sound/soc/soc-link.c
index 619664cc9ab95..fee4022708bc7 100644
--- a/sound/soc/soc-link.c
+++ b/sound/soc/soc-link.c
@@ -67,7 +67,7 @@ int snd_soc_link_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 
 int snd_soc_link_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret = 0;
 
 	if (rtd->dai_link->ops &&
@@ -84,7 +84,7 @@ int snd_soc_link_startup(struct snd_pcm_substream *substream)
 void snd_soc_link_shutdown(struct snd_pcm_substream *substream,
 			   int rollback)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	if (rollback && !soc_link_mark_match(rtd, substream, startup))
 		return;
@@ -99,7 +99,7 @@ void snd_soc_link_shutdown(struct snd_pcm_substream *substream,
 
 int snd_soc_link_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret = 0;
 
 	if (rtd->dai_link->ops &&
@@ -112,7 +112,7 @@ int snd_soc_link_prepare(struct snd_pcm_substream *substream)
 int snd_soc_link_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret = 0;
 
 	if (rtd->dai_link->ops &&
@@ -128,7 +128,7 @@ int snd_soc_link_hw_params(struct snd_pcm_substream *substream,
 
 void snd_soc_link_hw_free(struct snd_pcm_substream *substream, int rollback)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	if (rollback && !soc_link_mark_match(rtd, substream, hw_params))
 		return;
@@ -143,7 +143,7 @@ void snd_soc_link_hw_free(struct snd_pcm_substream *substream, int rollback)
 
 static int soc_link_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret = 0;
 
 	if (rtd->dai_link->ops &&
@@ -156,7 +156,7 @@ static int soc_link_trigger(struct snd_pcm_substream *substream, int cmd)
 int snd_soc_link_trigger(struct snd_pcm_substream *substream, int cmd,
 			 int rollback)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret = 0;
 
 	switch (cmd) {
-- 
2.25.1

