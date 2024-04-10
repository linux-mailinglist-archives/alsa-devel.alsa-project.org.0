Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9EE89E84F
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 04:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86ACE231C;
	Wed, 10 Apr 2024 04:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86ACE231C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712717757;
	bh=LURRfRd56FqnYkaCL9FvHCxlBn7rB1STC/NpnocNhYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I514lxOntN/yhY6AhnQeq07do4PhvTuLWWdzBd0y6LmbM1gWMm8DUS15t2lFe3W7m
	 I3huphYksSDSdlMHYKcOSsdwHO0/RFUk5Bn6kZ0n6yw8a8iATwG0vZboVT5ZClo6JT
	 S1m9MPt/CdCxGDFq2sFYTAyIltiiMpvUUi7wdopQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B482F805C5; Wed, 10 Apr 2024 04:55:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 718DDF805C5;
	Wed, 10 Apr 2024 04:55:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A36E8F80568; Wed, 10 Apr 2024 04:55:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50BD8F8013D
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 04:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50BD8F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=f4idrBsB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DO/SwLLZ8qgnu+aJe6Dz32a6CiRvuWTVro4gRTP5mPkHqqLKnDPEvw2vCbb4+FeHDP6eBQOO5ScA1fLufQhcjbkP9sZV9a/mRsD2YAFlU8Jj+MVGXzN51x4+7x7lfe/5TC623cyXRTAJd166nGlz4tfCMZ+hCRX+IGtjgP2yLuDbgRD8JckT+nziqbxbHe3TKP5qp02QIK4RC5CPEJgeBk1KR10Q/mi9IDAgmqRcZPERPNUMkaUkDeRiQa/+F1JzIhdfZzA/jyuq7iVMqPr/RXXp6SX/uP4gMU3NcJHjtYYEJvgCqyrP9TWhSyEzAjpE1qRwMM5FMHuX3xOhcnj9YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjzZ/831kEgInZDRFiqJkPSW4jxUg+e7eAKKz11uTs8=;
 b=T7AXTam4i4orKx56p3kG8Ei5kVcG2BMxKtTaJBQNq/0dbEJGjOUNOzG+Qr4VqRcMXO/itvmVgD1Eniu5ShCmH0/7lEa66ZAEKof+fK5Z5yhWLYUXpoDKrmzZuzMzQQ3v3DQc1APu8JXbhuMvRjtL8euke3oofyIyLOKo4FMi6S7+SrkWuVMA18ATil9z60RXElInCWya1vVd1NAOY3UHZQqnGzQYSiIQMHGxqJoletfxKjgq1Jf6rzK3iqwp8ndpIM8c5TV9Gvr0NQCo8H69NkLE+1Xw0FKrAre7+jFZs7UEFRctcZcKi8AXkn1TuVO079LIIex0wtR3Qs9+CK3IbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjzZ/831kEgInZDRFiqJkPSW4jxUg+e7eAKKz11uTs8=;
 b=f4idrBsB0ffFfTiqhHba91pndwujTTuNtT9N/iGbDah0R/0VZz5W9NYah1YQIr7M4GLmtag/kRDucvWh7ipRhdoWSPVruucYHQLyJUdBeHEPTnu8dK1YZ9qjI9KplDhNHLZ3uKQkD0c76mTlDjdvLzA9DwR1MvOxoC7/hTOMRS4=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9483.jpnprd01.prod.outlook.com
 (2603:1096:604:1c8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 10 Apr
 2024 02:55:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Wed, 10 Apr 2024
 02:55:02 +0000
Message-ID: <87le5mkjuh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Jerome Brunet
 <jbrunet@baylibre.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87msq2kjvo.wl-kuninori.morimoto.gx@renesas.com>
References: <87msq2kjvo.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2.5] ASoC: soc-pcm: cleanup soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Apr 2024 02:55:02 +0000
X-ClientProxiedBy: TYCP286CA0364.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9483:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jH4a/ILoAgE20jOMSRwc6Xxnz8XxqgjcbuoFLcqsl/s7eXhyhcTWlk1poqf06JGn+5M2wVWfw/XEEvmNTYDgXtbUOsp96DHmPr6hWK0f8a3Kj2IlYWud3YqwIwBdFMUJQvabPgK/+jo6gNuz1Kbkvvk/kiodnw36xP++L5n1UsI+dV9nYhRmS2xgDR0fo2BWHReYvXtkvVoJr/PfB4Goq2UmPZIHDOGOD5gBbSCK1GzBfjoxFmeTIxIY9WCvz6aQUSTtpFC4dwQ8fAGD2UlLx+OWds5OxPdCaM8/2Vq0kLpMqBVoJI6xD5KjS3ftNFqd+rxHyPdHnWhwmGpcHugC6t6njzUJMcNgmQGxA++ajAk3PHg8GB07wsY43j8srOhbAgLsj+gLXPA2V+jIcjNtS7A+aBjb4EPP0Fwk08C74AL4Dzy6o46wb5XRGCOvvKU94MZ22iiUB1T74W0EkYspMsgHYwbfXVOArT7Lp2QFmXwyUAQIf9JRhXUosfkg+jsMMWh8uIYZwCLJRvogkw1J2gw8k376vRifgp5568Hp4/trgVkHS0g0f7cUd3mD0degYq4/YSSJzTNl6u2VmxXuNW51cb4t7nzWK+5yNuONu5EExdf5QnOSe4AlODznuehGLuJ6OxhZapJdmiABnZODVKFJ+1gLgFHtAd4CNbhsBDj+AOV1xzgHCRaxaInYkkmsJMr4EFGPbNIilfTfiM9I+avkgUxYFzyx8qVTpmaFkmM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JJGOuP9oFkByFN21WetOrpraQd+iXcmzipKAnHShgvE5JiGoYbcjo0HvqWmP?=
 =?us-ascii?Q?01cfa7tliuOtVkpqTDRYKH9h/zFDwigEY5Oe2mEm2BYw13cvaeJCtStgIgne?=
 =?us-ascii?Q?XZnFw9n2Dei4q2JGe1JnuqltJXWXUMZD2xmouNJgOctSb5maSLViOXrnzqqa?=
 =?us-ascii?Q?jXvJRXx0UfDgx/F1Fzt1zOWScDmr81mcypkwrT6DWLnabRnyjdgxm5TreoHN?=
 =?us-ascii?Q?LwgYJvFutn5CXh293id2tnyQdTaSVeXHMYHbQTbT5cdw356SdqAqsi0p3czP?=
 =?us-ascii?Q?w/nxzIl39mh5PNaVu+rMoTEZHAp5Su798pPf+k+Ng+M6Y8RCYDjzHcsM2NA+?=
 =?us-ascii?Q?lSrmzFOIw7S2HqlE3eHrjtaBNe7OZ6B3yFQdo2J60QEMjBuGr1ZoaS6ivMc6?=
 =?us-ascii?Q?rkH5oj+VRzh27/HjY9lNtB1bDc//2vG7mZknba2jMdqa/eXJUcBortaKUFS8?=
 =?us-ascii?Q?LkQT07g+K2FWnAOCvpQqsb1kEjgkoRlkgGj6md0CCLFfGGe6GEN+Fa6rvXu3?=
 =?us-ascii?Q?iSxxESsprYVIt3CWAMDd9L0u6U9E1QSZtIiMIRp5Lg+0c87esaEgv2x7EB0W?=
 =?us-ascii?Q?/jtkCr7ymMVD0I9Bgxoo62qlTL8U0afAYa/LXFlwLUg89iUsm1nm8+SrC9ta?=
 =?us-ascii?Q?JP7szCXfZVi/rXQ2/iQzrEIrrQ0miYr1UArhPBN2GCuiAdHiRfv8TYq0532H?=
 =?us-ascii?Q?fzN+Tx3EbQqQfizIRkbAznFglBniUucFCx5CHb/r9Di9sz10Hwzq0ZrVwDRk?=
 =?us-ascii?Q?YQpQqJI2wUWe1XwsJ9iysgrQ3fHZvdEYk3VaJ2MpbnRjPrxC2I4KU8K1J6jP?=
 =?us-ascii?Q?VA6F9sBLEI0hGCTjLWRlyYtBxwcBTynlWHuNZLdvwaaSm9KQ9BOpZjcHegak?=
 =?us-ascii?Q?EZRkgwg6ccWuhCriX32ExfZPCZTrdyhb4D5kKX+85QLce1ay6oGEsLGgH3Hb?=
 =?us-ascii?Q?fFm9i7qeMa/RNEwNayjsMqOKPilpJ0k+0kS3JKMPs3lGboiKh6FnmNmLGllv?=
 =?us-ascii?Q?WcRt1kIaaZXBFXdrzKRSoRWraRLSLbXZAPpkh9EdrsrMy3w1ikI7muX2Wcl7?=
 =?us-ascii?Q?rdblnr40pd8djZBSgOzhcLE9CKrPXxcvyHYbSo2Tu8uPVwKLzMcVMgW1k0FD?=
 =?us-ascii?Q?U5ODM1aHhH/U8zS/748mOZmbwaKA4iwk4LKZoxTmwxXTy3ngPOQSOC5eqWub?=
 =?us-ascii?Q?Y3gmzx39D73jZUuuxoB5l5IA28iys5JWzTPUNhoFEUlQXeVGEw/NEtoQc/4x?=
 =?us-ascii?Q?rQ3NWxgPBN7Y0O4WlP1pXGFIA/3OL1zmMefVGSehbNLGa4NmWal1rsVQTDCz?=
 =?us-ascii?Q?v5ZMAWYZ9Mab0+dERuUzOQfv9hIVeOSD1QdYF5AjTYGL6KpoLkjrn8JKZ4L1?=
 =?us-ascii?Q?ng2NP2zvCPuLKNInKtz6Hoy87zVm1dxTh9Z1fXJi0FymfluF7vyDgptoDEh4?=
 =?us-ascii?Q?FEIieNOJqJmWZc9w3WgqcTFrnR9Tar/D2VsGhn9Ss0DoSj4THJtaJVy9fEx4?=
 =?us-ascii?Q?aiPllAcnSTx4C72z/9nKLuHZVnEd45EVx23Wvc92xuDy6MRfABDe0V3Nd0Rm?=
 =?us-ascii?Q?IUZjyzqkTb2gZHq1E7Tw+xdQebxT2tqb8FhFSPuvzCyNl8X8rJpMi+ceR7sG?=
 =?us-ascii?Q?l7HwSoN0k/qyEAd7wN8U7eo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3fb6ba29-28e7-4f99-90a9-08dc59099e5b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 02:55:02.7218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fCxR36npE9IcW07gDQ59RSdzCWu8KOAd157s1IkifktqaoyEpq9R4ARffq0bxQWBFEx1vl0v/Qn7FzmmQGnvrh2+cDvOaTQlOkeb5f504PXqo1JnjXzDHtWU4kEec1SR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9483
Message-ID-Hash: R3COBU6MQR3IKII67JP7WKHBZOHZNUY7
X-Message-ID-Hash: R3COBU6MQR3IKII67JP7WKHBZOHZNUY7
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R3COBU6MQR3IKII67JP7WKHBZOHZNUY7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current soc_get_playback_capture() (A) is checking playback/capture
availability for DPCM (X) / Normal (Y) / Codec2Codec (Z) connections.

(A)	static int soc_get_playback_capture(...)
	{
		...
 ^		if (dai_link->dynamic || dai_link->no_pcm) {
 |			...
 |(a)			if (dai_link->dpcm_playback) {
 |				...
 | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 |(*)					...
 | v				}
 |				...
(X)			}
 |(b)			if (dai_link->dpcm_capture) {
 |				...
 | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 |(*)					...
 | v				}
 |				...
 v			}
		} else {
 ^ ^			/* Adapt stream for codec2codec links */
 |(Z)			int cpu_capture = ...
 | v			int cpu_playback = ...
(Y)
 | ^			for_each_rtd_ch_maps(rtd, i, ch_maps) {
 |(*)				...
 v v			}
		}
		...
	}

(*) part is checking each DAI's availability.

(X) part is for DPCM, and it checks playback/capture availability
if dai_link has dpcm_playback/capture flag (a)(b).
This availability check should be available not only for DPCM, but for
all connections. But it is not mandatory option. Let's name it as
assertion.

In case of having assertion flag, non specific side will be disabled.
For example if it has playback_assertion but not have capture_assertion,
capture will be force disabled.

	dpcm_playback -> playabck_assertion = 1

	dpcm_capture  -> capture_assertion  = 1

	playback_only -> playback_assertion = 1
	                 capture_assertion  = 0

	capture_only  -> playback_assertion = 0
	                 capture_assertion  = 1

By expanding this assertion to all connections, we can use same code
for all connections, this means code can be more cleanup.

Here, CPU / Codec validation check relationship is like this

	DPCM
		[CPU/xxxx]-[yyyy/Codec]
		^^^^        ^^^^
	non DPCM
		[CPU/Codec]
		^^^^^^^^^^^

DPCM     part (X) is checking only CPU       DAI, and
non DPCM part (Y) is checking both CPU/Codec DAI

Current validation check on DPCM ignores Codec DAI, but there is no
reason to do it.  We should check both CPU/Codec in all connection.
This patch expands validation check to all cases.

	[CPU/xxxx]-[yyyy/Codec]
	                 *****

In many case (not all case), above [xxxx][yyyy] part are "dummy" DAI
which is always valid for both playback/capture.
But unfortunately DPCM BE Codec (**** part) had been no validation
check before, and some Codec driver doesn't have necessary settings for
it. This means all cases validation check breaks compatibility on some
vender's drivers. Thus this patch temporary uses dummy DAI at BPCM BE
Codec part, and avoid compatibility error. But it should be removed in
the future.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h |  10 ++++
 sound/soc/soc-pcm.c | 132 ++++++++++++++++++++++++--------------------
 2 files changed, 82 insertions(+), 60 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 0376f7e4c15d..931816890755 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -809,6 +809,16 @@ struct snd_soc_dai_link {
 	unsigned int dpcm_capture:1;
 	unsigned int dpcm_playback:1;
 
+	/*
+	 * Capture / Playback support assertion. Having assertion flag is not mandatory. In case of
+	 * having assertion flag, non specific side will be disabled. For example if it has
+	 * playback_assertion but not have capture_assertion, capture will be force disabled
+	 * see
+	 *	soc_get_playback_capture()
+	 */
+	unsigned int capture_assertion:1;
+	unsigned int playback_assertion:1;
+
 	/* DPCM used FE & BE merged format */
 	unsigned int dpcm_merged_format:1;
 	/* DPCM used FE & BE merged channel */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 77ee103b7cd1..7a27d3e110ac 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2793,7 +2793,12 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				    int *playback, int *capture)
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *dummy_dai = snd_soc_find_dai(&snd_soc_dummy_dlc);
+	int cpu_playback;
+	int cpu_capture;
 	int has_playback = 0;
 	int has_capture  = 0;
 	int i;
@@ -2803,77 +2808,84 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		return -EINVAL;
 	}
 
-	if (dai_link->dynamic || dai_link->no_pcm) {
-		int stream;
-
-		if (dai_link->dpcm_playback) {
-			stream = SNDRV_PCM_STREAM_PLAYBACK;
-
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_playback = 1;
-					break;
-				}
-			}
-			if (!has_playback) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support playback for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
-			}
-		}
-		if (dai_link->dpcm_capture) {
-			stream = SNDRV_PCM_STREAM_CAPTURE;
+	/*
+	 * REMOVE ME
+	 *
+	 * dpcm_playback/capture will be used as playback/capture_assertion
+	 */
+	if (dai_link->playback_only && dai_link->capture_only) {
+		dev_err(rtd->dev, "both playback_only / capture_only are set\n");
+		return -EINVAL;
+	}
+	if (dai_link->playback_only)
+		dai_link->playback_assertion = 1;
+	if (dai_link->capture_only)
+		dai_link->capture_assertion = 1;
+	if (dai_link->dpcm_playback)
+		dai_link->playback_assertion = 1;
+	if (dai_link->dpcm_capture)
+		dai_link->capture_assertion = 1;
 
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_capture = 1;
-					break;
-				}
-			}
+	/* Adapt stream for codec2codec links */
+	cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
+	cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
 
-			if (!has_capture) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support capture for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
-			}
-		}
-	} else {
-		struct snd_soc_dai_link_ch_map *ch_maps;
-		struct snd_soc_dai *codec_dai;
-
-		/* Adapt stream for codec2codec links */
-		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
-		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
+	/*
+	 * see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 */
+	for_each_rtd_ch_maps(rtd, i, ch_maps) {
+		cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+		codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
 		/*
-		 * see
-		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 * FIXME
+		 *
+		 * DPCM BE Codec has been no checked before.
+		 * It should be checked, but it breaks compatibility.
+		 * It ignores BE Codec here, so far.
 		 */
-		for_each_rtd_ch_maps(rtd, i, ch_maps) {
-			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
-			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
-
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				has_playback = 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				has_capture = 1;
-		}
-	}
+		if (dai_link->no_pcm)
+			codec_dai = dummy_dai;
 
-	if (dai_link->playback_only)
-		has_capture = 0;
+		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_playback) &&
+		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
+			has_playback = 1;
+		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_capture) &&
+		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE))
+			has_capture = 1;
+	}
 
-	if (dai_link->capture_only)
-		has_playback = 0;
+	/*
+	 * Assertion check
+	 *
+	 * xxx_assertion flag is not mandatory
+	 */
+	if (dai_link->playback_assertion) {
+		if (!has_playback) {
+			dev_err(rtd->dev, "%s playback assertion check error\n", dai_link->stream_name);
+			return -EINVAL;
+		}
+		/* makes it plyaback only */
+		if (!dai_link->capture_assertion)
+			has_capture = 0;
+	}
+	if (dai_link->capture_assertion) {
+		if (!has_capture) {
+			dev_err(rtd->dev, "%s capture assertion check error\n", dai_link->stream_name);
+			return -EINVAL;
+		}
+		/* makes it capture only */
+		if (!dai_link->playback_assertion)
+			has_playback = 0;
+	}
 
+	/*
+	 * Detect Mismatch
+	 */
 	if (!has_playback && !has_capture) {
 		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
 			dai_link->stream_name);
-
 		return -EINVAL;
 	}
 
-- 
2.25.1

