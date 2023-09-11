Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E6079B505
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:02:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BD7C102D;
	Tue, 12 Sep 2023 02:02:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BD7C102D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476974;
	bh=eWlE6GXvlDLzYzVqJ7P2wAZhK9Jpk7wBrZotpsnU9rs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EKIsuJoJ9gvs80HnzmeF5doplUTNOlis2w8339nduvde8vx5sMgNdBhUi369XTPzq
	 hLqvM18VAugmt+sxe4wCaDO3SC7eP3brw7LzOMLUfKRW/8BJSkWfciXKpKtZnOWysx
	 idhv9Hd23ECAVCkHpwCCcWCeumJ5WjEehTS8hllo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88BA9F80796; Tue, 12 Sep 2023 01:53:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61046F80774;
	Tue, 12 Sep 2023 01:53:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C161F805E3; Tue, 12 Sep 2023 01:53:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DBE8F8057E
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DBE8F8057E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XrjqtmkX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMeZvAySt34UOAP4sDxJ2vS0hXf5Q92nPblktrDBeHsAnwGxVubMwQ2Ct+YJyDH2jNcQSFVko5Itsjkl/6ynTxcPoH6l2nadfHxmEODuI1zCNGqQjv3oPnWUnhp5t4DZT00wWUxTOZX+tDGWD2wrVRkLgjV43GyI3DJPHDERz2zp33vREE7RKrActZD9+dGswJiE/N3mdbK9qi/CxATiuoLlv25qTK8T2n3uf58WnXXFPfRpQtlzVUfXorILaaHULLUD3xjRHrosrHhYij3WjumSPYNlh3dZbtB2MSIiZ0HsMxxXFRZ+eHLmC6iOqtc4qD0Sc4g+vWrq8wqmE4Dx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltgQKidT5IUmpB70mHGrehn+v/OCAZnqZglN70KE73M=;
 b=UKe9Mfp5eX7pTUV/9apFUPj984pDivC3ulOS3WStPktpj5E3wIEWcQhaibZxopLJRvLmoW1jh3OJZDgrjVzLSt/Wkbdx5XrTmm7RXmIvmb/yvK6NBqBbFzY40wXKCXAe8Ro6NxUzof5t8p39Ym9Nkmv4DNEmI69K/E37N8XdzKP1T+jhuuEcme13cz8wtU9cOtZUUmAxettxeEEycZibCoaWWJ/wPAj2N2NalTbvmSrKTRzLtqLS5s/VNWCFKTgyXn4nGYJuOdvIQfg1wOKFEA+zpZOLgaXVLNII/gvRZpG3riNkyqGGrWTqRCH47CuvwoZiYOlDCEjak1MWA5/JGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltgQKidT5IUmpB70mHGrehn+v/OCAZnqZglN70KE73M=;
 b=XrjqtmkXrRDaxL6bxI5fvqoPuznG2sNn/FVspOrRHppQyPwY+nosekNVlXhsivUvw6e5Wp2NRcJck2Dlw3bctvbET9r8PKGNbBlVAMHIgkQV8rMxd367uoNK2I0GE58AHWUT/YeQhKrwVQAZGMdHJlOTt51tdeSYctaDvYTP/ts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5990.jpnprd01.prod.outlook.com (2603:1096:604:d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:52:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:52:18 +0000
Message-ID: <87edj4p8st.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 52/54] ASoC: soc-component: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:52:18 +0000
X-ClientProxiedBy: TYCP286CA0266.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 58603284-8931-499f-2ac2-08dbb3222222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	41YqgP8mD6I0yuwzeeBpa+3MgZzz4KNfSObO7EgwZJx4euBTB26ZqdLs+uEsBm62CwQPBpHYhKtutSsymDviB1W4qIjxbjLwTaFr4mL4W9sglT66BppLkT7SEZ3zseax8iVkt5ci2HbjnhAG4npgbYr06cvdI2ef52hnilotSga3CJDc4MuFIT2/4NOXKm7B/v7XA6uuU4WsEghXGucWEt9CUjqM5DzF4YE4ryBSuMIPZH5z2QzHmKztO92bsDYmZhYHCUslL8zLjgg8C+kx0WKjY4IvzaIHm4s+jA0kSld8MDXK4j1Jx6oEsBnJOwTGDKAp6gpf0NDnXHEd+zBgiht8Jjc2OQ0w2kG3YJ71KHhmn0u4UMmAE4iL/FFmY/C9QMGlzSzdzSRPV4/wzJ/tUCf6PHgtNH3qvt7XK5dxlx5rb/IVryBrPt70+vlsPRSKoJ2wCQA90Reae787pQ1NPyQBBp69wdeMIsyCpnOhEJLvTCl6lzS03f1P4ya3EeIn/pzEwGiv4x3huXKzKkHk2cr0enMTz8jNLiczScP10lWGD1hPFBH7rjYUz6Bur831dnRm6Zrj2PLFYwRIis3/7uWUx4QCCMtIKX5SxxDMdR56LNll3fw4P4269Vmr/kl+10TC3NqrZxToZe98w0jj5w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(316002)(86362001)(66476007)(66946007)(8936002)(8676002)(4326008)(41300700001)(5660300002)(6506007)(52116002)(6486002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y/bC7pDl5HoWHi0mB5WYTu2BiIy5wt0Wp7wqZS9YHOOgfXQHlFI8TrY73t/M?=
 =?us-ascii?Q?kpF7JTlvhR1eD6SdySz7Wzv6/zZZ4pBZXLTHPlvss4IuTzDs8XCVuIMBLaWB?=
 =?us-ascii?Q?5DCbrLmC3xOPAhz3fjGGYr/qmtNpmctS56cBPRd0i1j1+AA3frSquPKD+BXv?=
 =?us-ascii?Q?C5JU5YnS8hC02ap6M7QglmfYkQFAGN0IKh0Sv5VwYH/sl/mdWmydZ7ylbYKW?=
 =?us-ascii?Q?LIHNCPBCS9aSptMys/rVgrM4UCOh1DF5QpyxMY823KLKCzGaiqQGADNCIfxf?=
 =?us-ascii?Q?UXCS3xTH82xFGGPIuwwCQgjibDMih2mWwEwstnCtLNxWkCm5mdKvS5EoUoai?=
 =?us-ascii?Q?cjEdcL0OKlnOhCcn1N2PQcfqNpgRzFdr52kSv2m0lXy+RgdgvP5Y/wSJDkq2?=
 =?us-ascii?Q?V59KEgl5S3stHhYmMB5vfE6oVIdHMz6dcc1HnF/q1dyGW1vDDGmE3iRKMqty?=
 =?us-ascii?Q?/QPh0vSQpcsy/jIEQbtcEDtDfzcZXMETo3dRmjQdJFoV6i5CPtnbnbsh57xT?=
 =?us-ascii?Q?ur9LpYBg5xQWdsSUoYTk73o55mv/Iqkf4vQsRANFF7+TbihC17Q2ciMz/+t9?=
 =?us-ascii?Q?8bVcZFnZHmy3ALRcwPvWloyKyeFP7qBezS+aC36v5JnJhD85lAAjGB1JVQeh?=
 =?us-ascii?Q?c7JJKrhOBcnnpPAMFvLZDbDRiz6yMVJT7R81hq14BK3aS4zuAgoDXz8oejO7?=
 =?us-ascii?Q?4AL+6KSKo0ZFXu+chqCUmOiP75HyNfCeYcOaT7scC7ylzyGFLc4Fw2SCTNcG?=
 =?us-ascii?Q?pA44NQoSCGS/nOmo1qDMkM7uBTvfM28XVOfBpWHGT7f33/2FAJxrCzzG0vSD?=
 =?us-ascii?Q?KYiaiSySBWZrJKVStgUrJpVWeLblOSN3+lmhJyQohJRaNMyHBLwKEG7Or8RH?=
 =?us-ascii?Q?Q1kOBocsXMjv3FS/Ww9KMp9ax2PLF9LD7Kz5fhKWv4SPeJYnRYlDz7Hkw/0C?=
 =?us-ascii?Q?JuGXza1TcEh2702c/GgmjoIBiIKcfyROXqrWp3ALOmc1SPoF4RyJYGj4LNFU?=
 =?us-ascii?Q?CJuHraBwE5hGZlLQNlUHGHHPiE66l9yYin3feUeQEMvSogMjl53K/lwxPkPG?=
 =?us-ascii?Q?6vsZ/1jbA94510WluUjLeizFWSg6bGDkMqsswqi5yYqx5aZTPgw/StzroTYf?=
 =?us-ascii?Q?qpYga8SlkhBfNtk37tADRGzJ2jc7owyKujbPNa31Zr7tJlPvPS/0V7exvgdX?=
 =?us-ascii?Q?gGXKbFo5xJm5HZ06w7q5X0epxX5vg/+Tx1VecbqosIBPPZrgw98fWrzVtCxV?=
 =?us-ascii?Q?8w0iw0XTgkslUmQ0y0kHl0oL2uo1lEtQ8G3l87Z+RcQqd6oM1FqqNgt5wZkv?=
 =?us-ascii?Q?aRDEdnli0FiV371bovI3Tsx3mMyBN0QuDujlGAZ/aQ80FARM4YdgfdRusKzb?=
 =?us-ascii?Q?JLBTJZ34hvAhP/m0V7ci9+OG72sgmCZagmeQnjZJ7TiygfggTAK1psd9Ar8B?=
 =?us-ascii?Q?wUWJBc2cbtPfoqoMSSwiZWFSP3a8PWh5ap9gybhOQBvj2BOVIAsvB8blSR6t?=
 =?us-ascii?Q?dNvAGtVaDp8WpGECFtPz1EDu60vGx4HaAMLrU8hFcPrYLUf0WIpAf2foE5gf?=
 =?us-ascii?Q?V8ro6+0kxI3n0+uWQK/K6oh92fU3T02glojcbruuyn5VOOy7NIoSqjOP3fAX?=
 =?us-ascii?Q?QjhueU/yU26hbQZnV8qseps=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 58603284-8931-499f-2ac2-08dbb3222222
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:52:18.6969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6seDXNwriL98FfYbNST+otfrWRIDNwji8Qhiz2Pj4RXBrEaIj+T0oFuyBn4F1v+/eVGjzXa26740QJ/MLUIP/o7VAZl/xvNuqhSsEXHoLpcYAF0L8WBsMKa4bk7pPZD9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5990
Message-ID-Hash: 2OHZ3T3PPYSCWTTXSIVIF6PRBI353WPB
X-Message-ID-Hash: 2OHZ3T3PPYSCWTTXSIVIF6PRBI353WPB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OHZ3T3PPYSCWTTXSIVIF6PRBI353WPB/>
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
 sound/soc/soc-component.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index ba7c0ae82e007..69198de39e79a 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -962,7 +962,7 @@ EXPORT_SYMBOL_GPL(snd_soc_component_test_bits);
 
 int snd_soc_pcm_component_pointer(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i;
 
@@ -992,7 +992,7 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 				 snd_pcm_sframes_t *cpu_delay,
 				 snd_pcm_sframes_t *codec_delay)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	snd_pcm_sframes_t delay;
 	int i;
@@ -1019,7 +1019,7 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
 				unsigned int cmd, void *arg)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i;
 
@@ -1036,7 +1036,7 @@ int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
 
 int snd_soc_pcm_component_sync_stop(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i, ret;
 
@@ -1056,7 +1056,7 @@ int snd_soc_pcm_component_copy(struct snd_pcm_substream *substream,
 			       int channel, unsigned long pos,
 			       struct iov_iter *iter, unsigned long bytes)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i;
 
@@ -1073,7 +1073,7 @@ int snd_soc_pcm_component_copy(struct snd_pcm_substream *substream,
 struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 					unsigned long offset)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	struct page *page;
 	int i;
@@ -1094,7 +1094,7 @@ struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 			       struct vm_area_struct *vma)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i;
 
@@ -1141,7 +1141,7 @@ void snd_soc_pcm_component_free(struct snd_soc_pcm_runtime *rtd)
 
 int snd_soc_pcm_component_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i, ret;
 
@@ -1159,7 +1159,7 @@ int snd_soc_pcm_component_prepare(struct snd_pcm_substream *substream)
 int snd_soc_pcm_component_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i, ret;
 
@@ -1180,7 +1180,7 @@ int snd_soc_pcm_component_hw_params(struct snd_pcm_substream *substream,
 void snd_soc_pcm_component_hw_free(struct snd_pcm_substream *substream,
 				   int rollback)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i, ret;
 
@@ -1214,7 +1214,7 @@ static int soc_component_trigger(struct snd_soc_component *component,
 int snd_soc_pcm_component_trigger(struct snd_pcm_substream *substream,
 				  int cmd, int rollback)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i, r, ret = 0;
 
@@ -1285,7 +1285,7 @@ void snd_soc_pcm_component_pm_runtime_put(struct snd_soc_pcm_runtime *rtd,
 
 int snd_soc_pcm_component_ack(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i;
 
-- 
2.25.1

