Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6449A5791
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 02:00:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB89EE8E;
	Mon, 21 Oct 2024 02:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB89EE8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729468850;
	bh=pQkpjcmPEcGj2ip7jg3igqlrRArmCPbx8KHfvymo0BI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eALuEY28ke05WvDPkQPUBxIp30rfUe4P7gIM52c55nmR1QlVJRUVQ7tB4sPCWbtHP
	 +dcCUEClNo+ixfLqgN81cscUa6zucNgZzb8W2wKOtySu7gdUH0MkQVuW97TvX0zDNT
	 TH+XZknA9TClp7GDBqor856Wxnc2WpLBCGo5Iygk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B54C9F8068E; Mon, 21 Oct 2024 01:59:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8957AF80588;
	Mon, 21 Oct 2024 01:59:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3252EF805D2; Mon, 21 Oct 2024 01:59:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39162F805E5
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 01:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39162F805E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QZfDDdgI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9V92KiJrp3YmQQYzLVLWNVuZhxscdfcAQfTbMeK8CsyV08EuKtOcu4JrvFitr1pbz5G1rijK1GNBaTqCiHv//beQdAHayfvFyxQBnOSnCSL3WGaw/EonyARM4ffcLcmChqy7bt7sk9sQpAAA6QUocYhTAcAfFhH6uE7j93cnUV/qZQZN7VMOpY/sJKLfeIjcNmC6YpTTJn8KPtRCYTksRUGOYWMVV5zEZ7xI0aY8y3L41CWkyIonks2tC4MmA8wAbYRvOmptcmdHvQJ5ctYZ3oP8/sgP+U+90oggoP1DKnApgVMu5vrnNs3EkD0n151uwmlbzZayFmAXU2nGAXQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKSmbg0e1i2JyEjg01uQkSIGGs3KUauyeo8AeJYB0Cw=;
 b=Z/+7dYBfd5ikOxWqNzPECzJjaiBWEKqh6OaXTjJWiY3f80iRjDPRJx9g8IUoWAiAJupve9MM6d8O/FeEaakVLsC679BEiH5jUnvskQjy61Qw2RntreDZkPBZuOr+AoVlnmIzZc8dwOOl3Yr/sbda/7wGmXBDlyHRsgoKr0Z8U3Bd7qcNhR80RCO2nW1ZOEZeduDlLBctsw0CFE6k1O1Kr03fyd109V5+dx5M1tgCsBNX1qlkG9HBs8/9pl7Bt+yKSCk/+dN0+TdMR5GuyB5hoP9G+IIank6dgMbREWT9clIQw9kqO2nNyJ/K9rh4MJaPWF5eqWzsbzCH8WHBIe3jwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKSmbg0e1i2JyEjg01uQkSIGGs3KUauyeo8AeJYB0Cw=;
 b=QZfDDdgIwc7o0IqpbVmK1VmRxcuKcMzpEEOtvDK05+Us1MSSL6cI34qJTdL1XUl+M9gJ0YoWSHBOzWOIFIoDROVJOJt9LeLqDhp/eXidCuoA9XNS+iTxSY+F1CQiKrD5jT8T+TpnNvDEC4whQ9+qC6iWz7i6g+LmO0HLfCnFJUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12916.jpnprd01.prod.outlook.com
 (2603:1096:405:1b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 23:59:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.027; Sun, 20 Oct 2024
 23:59:09 +0000
Message-ID: <87cyju9vhu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 06/13] ASoC: mediatek: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 20 Oct 2024 23:59:09 +0000
X-ClientProxiedBy: TYCP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12916:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dea6e51-c191-4980-85aa-08dcf1633041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0mrjHftC1H4xY99J0w6LPT9wwH2T2jrz0vyTH8jRbYOAJMXJ5W5dTXCa+tri?=
 =?us-ascii?Q?1v2rz1HLBUNLiXU7nHvm5l6wsJAMGm5AuITBcfBGOHY3wwO/DEXao5CxBUfC?=
 =?us-ascii?Q?64oHyBIJevWCCr7kmDktGXqvwT2TdEa5j97SmpqeaACKOb+s7LI/imFzBvm4?=
 =?us-ascii?Q?V3hZrTHtH6SFGW/EKpmsVqPgJb2LZhsCOTnPFCmcZ1HnCmOXVXTnmKn8QrmY?=
 =?us-ascii?Q?lR+qNhag+4t/xmJVmUyp8uvX92GvegIEtTOJsq/bKhsnXq2SxLZrKS0fxEE2?=
 =?us-ascii?Q?c2EXoSP5O0QLQ9VD1Cdsn+yr1dkg2ivZUhT/FVTqk8S/+l8W8ZxZnTltHd5v?=
 =?us-ascii?Q?9lwbwqkdJmgOUTEJydhMQCqbpxjou+vqPaCGaiQ6KKBc/tFEs8ELyTbmq3DK?=
 =?us-ascii?Q?hrTT2ykvPyevyjU9TKzhv7hegN59PVocBdF2PMopz5sD0yuBPHkB71H9PcfD?=
 =?us-ascii?Q?CQU+4wfNwg2SGToKHpTKP/DfzRF7jV6z6cCm/tnKIkVmfAZ1xZNuWfQC0Bov?=
 =?us-ascii?Q?v3wThmbIRx3vwEapQZfHQJNRgrhXQ4+dqPKQWSwCwFeGqiNzO/bULiUf4gYz?=
 =?us-ascii?Q?qpYY4YjXUX5X3aExgF8fZIOKrNun2WJWHWU1yAqC4uJOo+GTyYSa+mKgYmam?=
 =?us-ascii?Q?cXeaW8OEFSZaOmBPHcfkJda61oGdbhYEmdbDWnr4W/SBvl1lNQxHShlNMmAv?=
 =?us-ascii?Q?vLIL9WLCi+m7aA0Fm9LXHVjfcJW2OD7pHGdF3xFMAEbS4z02mWzMk3P+N2Te?=
 =?us-ascii?Q?if7PaOmdsCZeidXPhghY81o7tpGKOgOSvQ6Pz6LwaIr7ONylNTWfFZ3lytN4?=
 =?us-ascii?Q?9N2L5kU384lPaDYCj2yk16vmd2Vm47OMJHaKmFJo0/tSoCVXSvLgJR2N+uoo?=
 =?us-ascii?Q?eeXcoyf8fUkwfRvPvbH/FOUHrLMlievaZTLZSA6aKt5IBNth4RABm5VziaHE?=
 =?us-ascii?Q?/sNib14HoSLp41r0tIRYWM/BIm4deKVXLzLpn28HJ262dWFivP4uBUXadEGo?=
 =?us-ascii?Q?JbSp7NNc1mnUnv1edUu2k9PS7QGL96JkYABx+m9xjMBOkpkJYemVXmWz2XLa?=
 =?us-ascii?Q?QwXqtcsQPKvdiCQyp6xgrW2vBDsnOtd4MM2i1wzcp4gEfE55+puHa/ZkjqBH?=
 =?us-ascii?Q?ZgKNhE5qKhUxgZftiZ2+YNZcVQh8DOISnQMTs2yLSxVtEQrfq61mQGG4FLAw?=
 =?us-ascii?Q?O8tln8oScZeb+p816tTlBWUW1Jk729x4IJ9dWnjDvmZgxEk31A+lMG0qbT9x?=
 =?us-ascii?Q?cRyw5BOCXKKO9KsPqKKU3T2i5iPZe8Bjn1qPZToapT9B0amVF2Sqpv3xsd3x?=
 =?us-ascii?Q?CURn4u9pCFhIXdYsNFpYkhmp752r9ETYWGEFLPGEltobHLr6N00/pB4mRXJu?=
 =?us-ascii?Q?pOGyJMs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sq5kjXby9GYehAUgbgYoq0KECWOAzMm4FPq7QJn3X8UwHgkER9jGk3PQoXRu?=
 =?us-ascii?Q?vjjW6m+BN++sbxa2qINF7aKXyth9k6ZZEDwoUwl8CWnaIVWTJ4NJ7MT62nyt?=
 =?us-ascii?Q?gsPb5UUnMebzhEGjTLuIQ2UBANt9/Acy6auxmwoc88zgtfEoeBVm2rrqLr9O?=
 =?us-ascii?Q?JBAeVZQmLO6vMcm2gDTZdGRVFTQA1CapQ4KNU2a+VbVlcv5sp1tAU4EZTKGO?=
 =?us-ascii?Q?uujU5vSSDUZdLFa2VwAh5HYJUXxhJLfs3UlWP7IohRuKDNjjoX84MbjaOJG9?=
 =?us-ascii?Q?jvImfaY6024BCN/+9bOof4lMm9Tlr28Leav70Ro4BDlSProdXpKCAwJ81ooC?=
 =?us-ascii?Q?b+T+sT/BD/lup8zbFq/NmXl62hO8Ohmmj+3tk7kn0jIra0iHeTKo/O7CpAna?=
 =?us-ascii?Q?o/SPHszGDKuNQqCM7YH+kG33185S7SELOpOcxpyNAXMmHx5Hin9GafZsnLJS?=
 =?us-ascii?Q?9rgusj/7OSi5SlT+th5+LjPa2b6JXYuh10Zff5xEhaxdCVRuC+K3P3iUnbm8?=
 =?us-ascii?Q?Zxyg6ikL7R6mBahqyjJeAibRW1ZuPHhQRhTKQNSljpDm375e+qQVOcDACoru?=
 =?us-ascii?Q?ZAja+tJDlpBq91Upj49Y3VmyzS7HX4mbbYCuPXtMFXkA6L0sznWLglpQ2b7w?=
 =?us-ascii?Q?Gs5ZJmvt8d6UAPiLQ0fyF14aXiReb4eEjJx2DAGQE9nIxFUr/n3RU/bfS9mr?=
 =?us-ascii?Q?CKdcrbVwTy31BFp49nljeBkQah0+pd9utgVZl9BWN88uej570b+Y+peiRI2G?=
 =?us-ascii?Q?S6pInkUbC75CBIB93hphQe01Fb/IFZ1M65eNQVFsIrMejtgjkW4j+5G152PP?=
 =?us-ascii?Q?cwqGHmpGqgtC7t/mCCHpVKVr0+elt+u3nEW3Y636M2lyElcBk1ojronKRoe8?=
 =?us-ascii?Q?Jcg/qmygUd31XQwbk3NniP1N5qvSai30LO5JhAwasIgnMAWQYEZhXbIGhV5a?=
 =?us-ascii?Q?jhpeTlDd4qHRPkzYsXlu8IKXQedLb79jRsxUXVjsQSoX237D8+FfqJ3vh+Sa?=
 =?us-ascii?Q?hX7Ckh4NmJNsO0FrEdlNv0ovPMt4n4J2Is6FGYxUe6BfZ6Dg9jMQzLQd7FIG?=
 =?us-ascii?Q?2MyO6KZtgyJyVE25PetHP2IjNSf2NilBW/E03p4eqnqfFtf2kZZTbsQGDFe4?=
 =?us-ascii?Q?ivVemNnrZRGCzKwyIx9UlLY7kHrBsqq0HtR2wtsDHs0WFQ4/PPtw+5RSVY+u?=
 =?us-ascii?Q?ao1TDMaU6aA9SIpYSuM3sAbRWo4Ij3QAeKVqrIyIJz1TmU9eDpgPIWwo69B7?=
 =?us-ascii?Q?x1V8bAQOoeWTlhTLWvDrEUGlTGq+p10IJJtK34WaJMkZJA3MtncvYtEhM5xe?=
 =?us-ascii?Q?V4DJRoD+cLcwab64KFP75GXhytngrTO5PlSEkPhUx9LLht38yWWlrbsfbCuu?=
 =?us-ascii?Q?za3ZvITJn4anBjzh9wnXxjz8V0YFxuzc4puX804j3ZAWHKU3QPJHKXtiReIq?=
 =?us-ascii?Q?Uqfr+DbMBrr/qH4icYABlF2V7Ik/j81nxR12fi15M049q6JBHfd4KezNS71s?=
 =?us-ascii?Q?xXUtdbAflChzom0QNnRI0o3pcrYkl7U5OXTxCn1TJyd9buOypevkpaY6XIzL?=
 =?us-ascii?Q?SJqCk2vFnYdFV//XbuGj6hOwet0AMM9yurlrL9jS5ExeuRiqmivQqjysYCQb?=
 =?us-ascii?Q?iiwY//OOm1ugHB4HuYlPm54=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2dea6e51-c191-4980-85aa-08dcf1633041
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 23:59:09.4919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 L7+KWRB0ncQhFqxEjIL2E83ZVO0dMi0PndlE08uF7fWTMMy5od+QGFtaebW1X3/HLSnHDK/Fdk+h7EgBG0ZZ98krrQySZ/Ncvm3sWU2G/iUi0hJQbI069HAmmCSP/ii0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12916
Message-ID-Hash: 3IA7KMDAWP45CPYRIFBXVMXF7XJJ466V
X-Message-ID-Hash: 3IA7KMDAWP45CPYRIFBXVMXF7XJJ466V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3IA7KMDAWP45CPYRIFBXVMXF7XJJ466V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    | 20 ++---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |  6 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c     | 24 ++----
 sound/soc/mediatek/mt7986/mt7986-wm8960.c     |  6 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    | 10 +--
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     | 10 +--
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 34 +++-----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 34 +++-----
 sound/soc/mediatek/mt8186/mt8186-mt6366.c     | 86 +++++++------------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 58 ++++++-------
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 78 ++++++++---------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 60 +++++++------
 sound/soc/mediatek/mt8365/mt8365-mt6357.c     | 14 ++-
 15 files changed, 185 insertions(+), 267 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 4974b0536b7bb..00a79867235d2 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -221,7 +221,7 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.ops = &mt2701_cs42448_48k_fe_ops,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(fe_multi_ch_out),
 	},
 	[DAI_LINK_FE_PCM0_IN] = {
@@ -231,7 +231,7 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.ops = &mt2701_cs42448_48k_fe_ops,
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(fe_pcm0_in),
 	},
 	[DAI_LINK_FE_PCM1_IN] = {
@@ -241,7 +241,7 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.ops = &mt2701_cs42448_48k_fe_ops,
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(fe_pcm1_in),
 	},
 	[DAI_LINK_FE_BT_OUT] = {
@@ -250,7 +250,7 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(fe_bt_out),
 	},
 	[DAI_LINK_FE_BT_IN] = {
@@ -259,7 +259,7 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(fe_bt_in),
 	},
 	/* BE */
@@ -269,8 +269,6 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
 			 | SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_cs42448_be_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(be_i2s0),
 	},
 	[DAI_LINK_BE_I2S1] = {
@@ -279,8 +277,6 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
 			 | SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_cs42448_be_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(be_i2s1),
 	},
 	[DAI_LINK_BE_I2S2] = {
@@ -289,8 +285,6 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
 			 | SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_cs42448_be_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(be_i2s2),
 	},
 	[DAI_LINK_BE_I2S3] = {
@@ -299,15 +293,11 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
 			 | SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_cs42448_be_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(be_i2s3),
 	},
 	[DAI_LINK_BE_MRG_BT] = {
 		.name = "mt2701-cs42448-MRG-BT",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(be_mrg_bt),
 	},
 };
diff --git a/sound/soc/mediatek/mt2701/mt2701-wm8960.c b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
index 8a6643bfe830e..2814f0570928f 100644
--- a/sound/soc/mediatek/mt2701/mt2701-wm8960.c
+++ b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
@@ -67,7 +67,7 @@ static struct snd_soc_dai_link mt2701_wm8960_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback),
 	},
 	{
@@ -76,7 +76,7 @@ static struct snd_soc_dai_link mt2701_wm8960_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture),
 	},
 	/* BE */
@@ -86,8 +86,6 @@ static struct snd_soc_dai_link mt2701_wm8960_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
 			| SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_wm8960_be_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(codec),
 	},
 };
diff --git a/sound/soc/mediatek/mt6797/mt6797-mt6351.c b/sound/soc/mediatek/mt6797/mt6797-mt6351.c
index 784c201b8fd4b..daad9544a8d41 100644
--- a/sound/soc/mediatek/mt6797/mt6797-mt6351.c
+++ b/sound/soc/mediatek/mt6797/mt6797-mt6351.c
@@ -78,7 +78,7 @@ static struct snd_soc_dai_link mt6797_mt6351_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback_1),
 	},
 	{
@@ -87,7 +87,7 @@ static struct snd_soc_dai_link mt6797_mt6351_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback_2),
 	},
 	{
@@ -96,7 +96,7 @@ static struct snd_soc_dai_link mt6797_mt6351_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback_3),
 	},
 	{
@@ -105,7 +105,7 @@ static struct snd_soc_dai_link mt6797_mt6351_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture_1),
 	},
 	{
@@ -114,7 +114,7 @@ static struct snd_soc_dai_link mt6797_mt6351_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture_2),
 	},
 	{
@@ -123,7 +123,7 @@ static struct snd_soc_dai_link mt6797_mt6351_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture_3),
 	},
 	{
@@ -132,7 +132,7 @@ static struct snd_soc_dai_link mt6797_mt6351_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture_mono_1),
 	},
 	{
@@ -141,8 +141,6 @@ static struct snd_soc_dai_link mt6797_mt6351_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_lpbk),
 	},
@@ -152,8 +150,6 @@ static struct snd_soc_dai_link mt6797_mt6351_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_speech),
 	},
@@ -161,24 +157,18 @@ static struct snd_soc_dai_link mt6797_mt6351_dai_links[] = {
 	{
 		.name = "Primary Codec",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(primary_codec),
 	},
 	{
 		.name = "PCM 1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(pcm1),
 	},
 	{
 		.name = "PCM 2",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(pcm2),
 	},
diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
index 6982e833421d6..c3d1e2eeb0e57 100644
--- a/sound/soc/mediatek/mt7986/mt7986-wm8960.c
+++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
@@ -45,7 +45,7 @@ static struct snd_soc_dai_link mt7986_wm8960_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback),
 	},
 	{
@@ -54,7 +54,7 @@ static struct snd_soc_dai_link mt7986_wm8960_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture),
 	},
 	/* BE */
@@ -65,8 +65,6 @@ static struct snd_soc_dai_link mt7986_wm8960_dai_links[] = {
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS |
 			SND_SOC_DAIFMT_GATED,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(codec),
 	},
 };
diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index 0557a287c641a..0724564cee6a6 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -104,7 +104,7 @@ static struct snd_soc_dai_link mt8173_max98090_dais[] = {
 		.stream_name = "MAX98090 Playback",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback),
 	},
 	{
@@ -112,7 +112,7 @@ static struct snd_soc_dai_link mt8173_max98090_dais[] = {
 		.stream_name = "MAX98090 Capture",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture),
 	},
 	/* Back End DAI links */
@@ -123,8 +123,6 @@ static struct snd_soc_dai_link mt8173_max98090_dais[] = {
 		.ops = &mt8173_max98090_ops,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(hifi),
 	},
 };
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index 4ed06c2690652..d8e4e70d834ce 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -139,7 +139,7 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5514_dais[] = {
 		.stream_name = "rt5650_rt5514 Playback",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback),
 	},
 	[DAI_LINK_CAPTURE] = {
@@ -147,7 +147,7 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5514_dais[] = {
 		.stream_name = "rt5650_rt5514 Capture",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture),
 	},
 	/* Back End DAI links */
@@ -159,8 +159,6 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5514_dais[] = {
 			   SND_SOC_DAIFMT_CBS_CFS,
 		.ops = &mt8173_rt5650_rt5514_ops,
 		.ignore_pmdown_time = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(codec),
 	},
 };
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index 763067c211539..488f2314dbf78 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -171,7 +171,7 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5676_dais[] = {
 		.stream_name = "rt5650_rt5676 Playback",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback),
 	},
 	[DAI_LINK_CAPTURE] = {
@@ -179,7 +179,7 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5676_dais[] = {
 		.stream_name = "rt5650_rt5676 Capture",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture),
 	},
 	[DAI_LINK_HDMI] = {
@@ -187,7 +187,7 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5676_dais[] = {
 		.stream_name = "HDMI PCM",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(hdmi_pcm),
 	},
 
@@ -200,14 +200,12 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5676_dais[] = {
 			   SND_SOC_DAIFMT_CBS_CFS,
 		.ops = &mt8173_rt5650_rt5676_ops,
 		.ignore_pmdown_time = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(codec),
 	},
 	[DAI_LINK_HDMI_I2S] = {
 		.name = "HDMI BE",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(hdmi_be),
 	},
 	/* rt5676 <-> rt5650 intercodec link: Sets rt5676 I2S2 as master */
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 466f176f8e948..59c19fdd86758 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -210,7 +210,7 @@ static struct snd_soc_dai_link mt8173_rt5650_dais[] = {
 		.stream_name = "rt5650 Playback",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback),
 	},
 	[DAI_LINK_CAPTURE] = {
@@ -218,7 +218,7 @@ static struct snd_soc_dai_link mt8173_rt5650_dais[] = {
 		.stream_name = "rt5650 Capture",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture),
 	},
 	[DAI_LINK_HDMI] = {
@@ -226,7 +226,7 @@ static struct snd_soc_dai_link mt8173_rt5650_dais[] = {
 		.stream_name = "HDMI PCM",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(hdmi_pcm),
 	},
 	/* Back End DAI links */
@@ -238,14 +238,12 @@ static struct snd_soc_dai_link mt8173_rt5650_dais[] = {
 			   SND_SOC_DAIFMT_CBS_CFS,
 		.ops = &mt8173_rt5650_ops,
 		.ignore_pmdown_time = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(codec),
 	},
 	[DAI_LINK_HDMI_I2S] = {
 		.name = "HDMI BE",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = mt8173_rt5650_hdmi_init,
 		SND_SOC_DAILINK_REG(hdmi_be),
 	},
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index f848e14b091a1..1d8881e0a361a 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -425,7 +425,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8183_da7219_max98357_ops,
 		SND_SOC_DAILINK_REG(playback1),
 	},
@@ -435,7 +435,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8183_da7219_max98357_bt_sco_ops,
 		SND_SOC_DAILINK_REG(playback2),
 	},
@@ -445,7 +445,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback3),
 	},
 	{
@@ -454,7 +454,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8183_da7219_max98357_bt_sco_ops,
 		SND_SOC_DAILINK_REG(capture1),
 	},
@@ -464,7 +464,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture2),
 	},
 	{
@@ -473,7 +473,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8183_da7219_max98357_ops,
 		SND_SOC_DAILINK_REG(capture3),
 	},
@@ -483,7 +483,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture_mono),
 	},
 	{
@@ -492,38 +492,32 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback_hdmi),
 	},
 	/* BE */
 	{
 		.name = "Primary Codec",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(primary_codec),
 	},
 	{
 		.name = "PCM 1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(pcm1),
 	},
 	{
 		.name = "PCM 2",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(pcm2),
 	},
 	{
 		.name = "I2S0",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
@@ -532,7 +526,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 	{
 		.name = "I2S1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
@@ -541,7 +535,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 	{
 		.name = "I2S2",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_da7219_i2s_ops,
@@ -551,13 +545,13 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 	{
 		.name = "I2S3",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 	},
 	{
 		.name = "I2S5",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
@@ -570,7 +564,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_IB_IF |
 			   SND_SOC_DAIFMT_CBM_CFM,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ignore = 1,
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index bb6df056a8789..6267c8554c152 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -430,7 +430,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8183_mt6358_ops,
 		SND_SOC_DAILINK_REG(playback1),
 	},
@@ -440,7 +440,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8183_mt6358_ts3a227_max98357_bt_sco_ops,
 		SND_SOC_DAILINK_REG(playback2),
 	},
@@ -450,7 +450,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback3),
 	},
 	{
@@ -459,7 +459,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8183_mt6358_ts3a227_max98357_bt_sco_ops,
 		SND_SOC_DAILINK_REG(capture1),
 	},
@@ -469,7 +469,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture2),
 	},
 	{
@@ -478,7 +478,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8183_mt6358_ops,
 		SND_SOC_DAILINK_REG(capture3),
 	},
@@ -488,7 +488,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture_mono),
 	},
 	{
@@ -497,7 +497,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback_hdmi),
 	},
 	{
@@ -513,31 +513,25 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 	{
 		.name = "Primary Codec",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(primary_codec),
 	},
 	{
 		.name = "PCM 1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(pcm1),
 	},
 	{
 		.name = "PCM 2",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(pcm2),
 	},
 	{
 		.name = "I2S0",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.ops = &mt8183_mt6358_i2s_ops,
 		SND_SOC_DAILINK_REG(i2s0),
@@ -545,7 +539,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 	{
 		.name = "I2S1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
@@ -554,7 +548,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 	{
 		.name = "I2S2",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
@@ -564,13 +558,13 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 	{
 		.name = "I2S3",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 	},
 	{
 		.name = "I2S5",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.ops = &mt8183_mt6358_i2s_ops,
 		.init = &mt8183_bt_init,
@@ -582,7 +576,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_IB_IF |
 			   SND_SOC_DAIFMT_CBM_CFM,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_tdm_ops,
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366.c b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
index 771d53611c2a4..a5ef913743d4e 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
@@ -647,7 +647,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -660,7 +660,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback12),
 	},
 	{
@@ -669,7 +669,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -681,7 +681,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -694,7 +694,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback4),
 	},
 	{
@@ -703,7 +703,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback5),
 	},
 	{
@@ -712,7 +712,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback6),
 	},
 	{
@@ -721,7 +721,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback7),
 	},
 	{
@@ -730,7 +730,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback8),
 	},
 	{
@@ -739,7 +739,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture1),
 	},
 	{
@@ -748,7 +748,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -761,7 +761,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture3),
 	},
 	{
@@ -770,7 +770,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -783,7 +783,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture5),
 	},
 	{
@@ -792,7 +792,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -804,7 +804,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture7),
 	},
 	{
@@ -813,8 +813,6 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_lpbk),
 	},
@@ -824,8 +822,6 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_fm),
 	},
@@ -835,8 +831,6 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_src1),
 	},
@@ -846,8 +840,6 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_src_bargein),
 	},
@@ -857,7 +849,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_hw_gain_aaudio),
 	},
@@ -867,8 +859,6 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_src_aaudio),
 	},
@@ -876,8 +866,6 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 	{
 		.name = "Primary Codec",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		.init = primary_codec_init,
 		SND_SOC_DAILINK_REG(adda),
@@ -888,7 +876,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_IB_IF |
 			   SND_SOC_DAIFMT_CBM_CFM,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.init = mt8186_mt6366_rt1019_rt5682s_hdmi_init,
 		SND_SOC_DAILINK_REG(i2s3),
@@ -896,7 +884,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 	{
 		.name = "I2S0",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.ops = &mt8186_rt5682s_i2s_ops,
 		SND_SOC_DAILINK_REG(i2s0),
@@ -904,7 +892,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 	{
 		.name = "I2S1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.init = mt8186_headset_codec_init,
 		SND_SOC_DAILINK_REG(i2s1),
@@ -912,46 +900,38 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 	{
 		.name = "I2S2",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(i2s2),
 	},
 	{
 		.name = "HW Gain 1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hw_gain1),
 	},
 	{
 		.name = "HW Gain 2",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hw_gain2),
 	},
 	{
 		.name = "HW_SRC_1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hw_src1),
 	},
 	{
 		.name = "HW_SRC_2",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hw_src2),
 	},
 	{
 		.name = "CONNSYS_I2S",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(connsys_i2s),
 	},
@@ -960,15 +940,13 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_IF,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(pcm1),
 	},
 	{
 		.name = "TDM IN",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(tdm_in),
 	},
@@ -976,35 +954,35 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 	{
 		.name = "Hostless_UL1",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_ul1),
 	},
 	{
 		.name = "Hostless_UL2",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_ul2),
 	},
 	{
 		.name = "Hostless_UL3",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_ul3),
 	},
 	{
 		.name = "Hostless_UL5",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_ul5),
 	},
 	{
 		.name = "Hostless_UL6",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_ul6),
 	},
@@ -1012,25 +990,25 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 	{
 		.name = "AFE_SOF_DL1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(AFE_SOF_DL1),
 	},
 	{
 		.name = "AFE_SOF_DL2",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(AFE_SOF_DL2),
 	},
 	{
 		.name = "AFE_SOF_UL1",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(AFE_SOF_UL1),
 	},
 	{
 		.name = "AFE_SOF_UL2",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(AFE_SOF_UL2),
 	},
 };
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 08ae962afeb92..84abdba9ddb6d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -932,7 +932,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
 		.dpcm_merged_format = 1,
@@ -946,7 +946,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
 		.dpcm_merged_format = 1,
@@ -960,7 +960,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
 		.dpcm_merged_format = 1,
@@ -974,7 +974,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback7),
 	},
 	[DAI_LINK_DL8_FE] = {
@@ -985,7 +985,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback8),
 	},
 	[DAI_LINK_DL10_FE] = {
@@ -996,7 +996,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback10),
 	},
 	[DAI_LINK_DL11_FE] = {
@@ -1007,7 +1007,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback11),
 	},
 	[DAI_LINK_UL1_FE] = {
@@ -1018,7 +1018,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture1),
 	},
 	[DAI_LINK_UL2_FE] = {
@@ -1029,7 +1029,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture2),
 	},
 	[DAI_LINK_UL3_FE] = {
@@ -1040,7 +1040,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture3),
 	},
 	[DAI_LINK_UL4_FE] = {
@@ -1051,7 +1051,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
 		.dpcm_merged_format = 1,
@@ -1065,7 +1065,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
 		.dpcm_merged_format = 1,
@@ -1079,7 +1079,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture6),
 	},
 	[DAI_LINK_UL8_FE] = {
@@ -1090,7 +1090,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture8),
 	},
 	[DAI_LINK_UL9_FE] = {
@@ -1101,7 +1101,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture9),
 	},
 	[DAI_LINK_UL10_FE] = {
@@ -1112,14 +1112,14 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture10),
 	},
 	/* BE */
 	[DAI_LINK_DL_SRC_BE] = {
 		.name = "DL_SRC_BE",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(dl_src),
 	},
 	[DAI_LINK_DPTX_BE] = {
@@ -1127,7 +1127,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.ops = &mt8188_dptx_ops,
 		.be_hw_params_fixup = mt8188_dptx_hw_params_fixup,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(dptx),
 	},
 	[DAI_LINK_ETDM1_IN_BE] = {
@@ -1136,7 +1136,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(etdm1_in),
 	},
@@ -1146,7 +1146,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(etdm2_in),
 	},
 	[DAI_LINK_ETDM1_OUT_BE] = {
@@ -1155,7 +1155,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(etdm1_out),
 	},
 	[DAI_LINK_ETDM2_OUT_BE] = {
@@ -1164,7 +1164,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(etdm2_out),
 	},
 	[DAI_LINK_ETDM3_OUT_BE] = {
@@ -1173,7 +1173,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(etdm3_out),
 	},
 	[DAI_LINK_PCM1_BE] = {
@@ -1182,14 +1182,12 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(pcm1),
 	},
 	[DAI_LINK_UL_SRC_BE] = {
 		.name = "UL_SRC_BE",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(ul_src),
 	},
 
@@ -1197,28 +1195,28 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	[DAI_LINK_SOF_DL2_BE] = {
 		.name = "AFE_SOF_DL2",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8188_sof_be_ops,
 		SND_SOC_DAILINK_REG(AFE_SOF_DL2),
 	},
 	[DAI_LINK_SOF_DL3_BE] = {
 		.name = "AFE_SOF_DL3",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8188_sof_be_ops,
 		SND_SOC_DAILINK_REG(AFE_SOF_DL3),
 	},
 	[DAI_LINK_SOF_UL4_BE] = {
 		.name = "AFE_SOF_UL4",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8188_sof_be_ops,
 		SND_SOC_DAILINK_REG(AFE_SOF_UL4),
 	},
 	[DAI_LINK_SOF_UL5_BE] = {
 		.name = "AFE_SOF_UL5",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8188_sof_be_ops,
 		SND_SOC_DAILINK_REG(AFE_SOF_UL5),
 	},
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index db00704e206d6..1aba9c75594eb 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -598,7 +598,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback1),
 	},
 	{
@@ -607,7 +607,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback12),
 	},
 	{
@@ -616,7 +616,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback2),
 	},
 	{
@@ -625,7 +625,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mtk_soundcard_common_playback_ops,
 		SND_SOC_DAILINK_REG(playback3),
 	},
@@ -635,7 +635,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback4),
 	},
 	{
@@ -644,7 +644,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback5),
 	},
 	{
@@ -653,7 +653,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback6),
 	},
 	{
@@ -662,7 +662,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback7),
 	},
 	{
@@ -671,7 +671,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback8),
 	},
 	{
@@ -680,7 +680,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback9),
 	},
 	{
@@ -689,7 +689,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mtk_soundcard_common_capture_ops,
 		SND_SOC_DAILINK_REG(capture1),
 	},
@@ -699,7 +699,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mtk_soundcard_common_playback_ops,
 		SND_SOC_DAILINK_REG(capture2),
 	},
@@ -709,7 +709,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture3),
 	},
 	{
@@ -718,7 +718,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture4),
 	},
 	{
@@ -727,7 +727,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture5),
 	},
 	{
@@ -736,7 +736,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture6),
 	},
 	{
@@ -745,7 +745,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture7),
 	},
 	{
@@ -754,7 +754,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture8),
 	},
 	{
@@ -763,7 +763,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture_mono1),
 	},
 	{
@@ -772,7 +772,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture_mono2),
 	},
 	{
@@ -781,7 +781,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture_mono3),
 	},
 	{
@@ -790,15 +790,13 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback_hdmi),
 	},
 	/* Back End DAI links */
 	{
 		.name = "Primary Codec",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		.init = mt8192_mt6359_init,
 		SND_SOC_DAILINK_REG(primary_codec),
@@ -806,29 +804,27 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "Primary Codec CH34",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(primary_codec_ch34),
 	},
 	{
 		.name = "AP_DMIC",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(ap_dmic),
 	},
 	{
 		.name = "AP_DMIC_CH34",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(ap_dmic_ch34),
 	},
 	{
 		.name = "I2S0",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s0),
@@ -836,7 +832,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s1),
@@ -844,7 +840,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S2",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s2),
@@ -852,7 +848,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S3",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s3),
@@ -860,7 +856,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S5",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s5),
@@ -868,7 +864,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S6",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s6),
@@ -876,7 +872,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S7",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s7),
@@ -884,7 +880,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S8",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.init = mt8192_rt5682_init,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
@@ -894,7 +890,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S9",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s9),
@@ -903,23 +899,19 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "CONNSYS_I2S",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(connsys_i2s),
 	},
 	{
 		.name = "PCM 1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(pcm1),
 	},
 	{
 		.name = "PCM 2",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(pcm2),
 	},
@@ -929,7 +921,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_DSP_A |
 			   SND_SOC_DAIFMT_IB_NF |
 			   SND_SOC_DAIFMT_CBM_CFM,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		.ignore = 1,
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 2832ef78eaed7..56b9d2433a1eb 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -913,7 +913,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mtk_soundcard_common_playback_ops,
 		SND_SOC_DAILINK_REG(DL2_FE),
 	},
@@ -925,7 +925,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mtk_soundcard_common_playback_ops,
 		SND_SOC_DAILINK_REG(DL3_FE),
 	},
@@ -937,7 +937,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mtk_soundcard_common_playback_ops,
 		SND_SOC_DAILINK_REG(DL6_FE),
 	},
@@ -949,7 +949,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(DL7_FE),
 	},
 	[DAI_LINK_DL8_FE] = {
@@ -960,7 +960,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mtk_soundcard_common_playback_ops,
 		SND_SOC_DAILINK_REG(DL8_FE),
 	},
@@ -972,7 +972,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_hdmitx_dptx_playback_ops,
 		SND_SOC_DAILINK_REG(DL10_FE),
 	},
@@ -984,7 +984,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mtk_soundcard_common_playback_ops,
 		SND_SOC_DAILINK_REG(DL11_FE),
 	},
@@ -996,7 +996,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(UL1_FE),
 	},
 	[DAI_LINK_UL2_FE] = {
@@ -1007,7 +1007,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mtk_soundcard_common_capture_ops,
 		SND_SOC_DAILINK_REG(UL2_FE),
 	},
@@ -1019,7 +1019,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mtk_soundcard_common_capture_ops,
 		SND_SOC_DAILINK_REG(UL3_FE),
 	},
@@ -1031,7 +1031,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mtk_soundcard_common_capture_ops,
 		SND_SOC_DAILINK_REG(UL4_FE),
 	},
@@ -1043,7 +1043,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mtk_soundcard_common_capture_ops,
 		SND_SOC_DAILINK_REG(UL5_FE),
 	},
@@ -1055,7 +1055,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(UL6_FE),
 	},
 	[DAI_LINK_UL8_FE] = {
@@ -1066,7 +1066,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mtk_soundcard_common_capture_ops,
 		SND_SOC_DAILINK_REG(UL8_FE),
 	},
@@ -1078,7 +1078,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mtk_soundcard_common_capture_ops,
 		SND_SOC_DAILINK_REG(UL9_FE),
 	},
@@ -1090,7 +1090,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mtk_soundcard_common_capture_ops,
 		SND_SOC_DAILINK_REG(UL10_FE),
 	},
@@ -1098,13 +1098,13 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 	[DAI_LINK_DL_SRC_BE] = {
 		.name = "DL_SRC_BE",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(DL_SRC_BE),
 	},
 	[DAI_LINK_DPTX_BE] = {
 		.name = "DPTX_BE",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_dptx_ops,
 		.be_hw_params_fixup = mt8195_dptx_hw_params_fixup,
 		SND_SOC_DAILINK_REG(DPTX_BE),
@@ -1115,7 +1115,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(ETDM1_IN_BE),
 	},
 	[DAI_LINK_ETDM2_IN_BE] = {
@@ -1124,7 +1124,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM2_IN_BE),
 	},
@@ -1134,7 +1134,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM1_OUT_BE),
 	},
@@ -1144,7 +1144,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ETDM2_OUT_BE),
 	},
 	[DAI_LINK_ETDM3_OUT_BE] = {
@@ -1153,7 +1153,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ETDM3_OUT_BE),
 	},
 	[DAI_LINK_PCM1_BE] = {
@@ -1162,48 +1162,46 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(PCM1_BE),
 	},
 	[DAI_LINK_UL_SRC1_BE] = {
 		.name = "UL_SRC1_BE",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(UL_SRC1_BE),
 	},
 	[DAI_LINK_UL_SRC2_BE] = {
 		.name = "UL_SRC2_BE",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(UL_SRC2_BE),
 	},
 	/* SOF BE */
 	[DAI_LINK_SOF_DL2_BE] = {
 		.name = "AFE_SOF_DL2",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_sof_be_ops,
 		SND_SOC_DAILINK_REG(AFE_SOF_DL2),
 	},
 	[DAI_LINK_SOF_DL3_BE] = {
 		.name = "AFE_SOF_DL3",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_sof_be_ops,
 		SND_SOC_DAILINK_REG(AFE_SOF_DL3),
 	},
 	[DAI_LINK_SOF_UL4_BE] = {
 		.name = "AFE_SOF_UL4",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_sof_be_ops,
 		SND_SOC_DAILINK_REG(AFE_SOF_UL4),
 	},
 	[DAI_LINK_SOF_UL5_BE] = {
 		.name = "AFE_SOF_UL5",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_sof_be_ops,
 		SND_SOC_DAILINK_REG(AFE_SOF_UL5),
 	},
diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
index 42cbdfdfadb55..d398e83ea0528 100644
--- a/sound/soc/mediatek/mt8365/mt8365-mt6357.c
+++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
@@ -168,7 +168,7 @@ static struct snd_soc_dai_link mt8365_mt6357_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_rate = 1,
 		SND_SOC_DAILINK_REG(playback1),
 	},
@@ -181,7 +181,7 @@ static struct snd_soc_dai_link mt8365_mt6357_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_rate = 1,
 		SND_SOC_DAILINK_REG(playback2),
 	},
@@ -194,7 +194,7 @@ static struct snd_soc_dai_link mt8365_mt6357_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_rate = 1,
 		SND_SOC_DAILINK_REG(awb_capture),
 	},
@@ -207,7 +207,7 @@ static struct snd_soc_dai_link mt8365_mt6357_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_rate = 1,
 		SND_SOC_DAILINK_REG(vul),
 	},
@@ -219,23 +219,19 @@ static struct snd_soc_dai_link mt8365_mt6357_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 				SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(i2s3),
 	},
 	[DAI_LINK_DMIC] = {
 		.name = "DMIC_BE",
 		.no_pcm = 1,
 		.id = DAI_LINK_DMIC,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(dmic),
 	},
 	[DAI_LINK_INT_ADDA] = {
 		.name = "MTK_Codec",
 		.no_pcm = 1,
 		.id = DAI_LINK_INT_ADDA,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &mt8365_mt6357_int_adda_ops,
 		SND_SOC_DAILINK_REG(primary_codec),
 	},
-- 
2.43.0

