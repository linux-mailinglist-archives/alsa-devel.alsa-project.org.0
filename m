Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB04372734B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 01:46:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D479184B;
	Thu,  8 Jun 2023 01:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D479184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686181584;
	bh=IOidb0KOJw2PZdJPCPxY3EIQgxosKqGOKSt+bmuTIcA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=toUQmOuHMjo3axe70MtMVpb+RYUdG4GG9bSMpKVR/58Zc8iYayMF+K79wUjbffjMh
	 bQcp7GsfNIJ+y2T4Cy3ZML7JopqkDiby6uKqF96cj3UGe3UsX09fV2TU+dHrLUwMtY
	 i4OJ89/FVCm7mvOxzuUOJlaop8eSaetY3RLD289w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0F4BF80130; Thu,  8 Jun 2023 01:44:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CBDAF805A1;
	Thu,  8 Jun 2023 01:44:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE57AF805A8; Thu,  8 Jun 2023 01:44:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B22ACF80587
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 01:44:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B22ACF80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DLoiZ3Lj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeU2hHI0puQnB7aMaHsmjGDqtZmQdp/Wo0b6IOgKaQmCEYZB9QFuYg0UPGhZPZHqfssbR6MR3p0wlqZL4L41gI2jD4H34f4BcGKq4KvtzPmdJfykN8s8T8wLu7nO2VKKuW+9gVkmCHcTHayAcG/H/rl3hSrgQBEgkyCwuPoGVkOxHiAxgbIb3J2tc0GrG15Wd13ALEq7vWtZB52IzpBvWOZ/lqEVV8xcQG3ipKLEmM8rVcTNe6sSPBJjTdgkdwJZa155b/O9hePxif/6G6ii0zs/OCNeURSvIyFTgq3ApgWYaK1gPNLow+PeddUQL9FJgQugoJkY1vQ7kE4REabjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tPEznnJM588OZuXM6JHjE2cAcDpZbIwvSmG4ObtO6I=;
 b=L588GmPW+klUXwWPRNVsaxDukjs2mcdZwKakeYyIPzKTh3ta4zUzzjYqe2h0J91Caw42eXGCM1rPA07rcfNzbD8/CScoPSEgS2St7LZGBQzeTWMQoxm2u2FZjzFz+D/4O+X0BORInl8XTARW7lR+fs2fjjJ4u3b3dNvI3Ju5wuH+FSWSOWjZdA0jjiDsAtnIyILzM2oDWM1nKjgVMpYriPYWYd7rryMM00FiT/6fPU6Mr5CpWCerTIE3h3QjtTOvte8V/gTiKTbwt7YP4jbvY64SeslryL7npD91p0YSzI42sACYjYh5rFb+VXst1AA7IIxnslAG1gZKKVYWdDEqjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tPEznnJM588OZuXM6JHjE2cAcDpZbIwvSmG4ObtO6I=;
 b=DLoiZ3LjUpgVnfv+z3zWHwE7/t860Bs98y4pwltrmZ6pASMIYXRykOBQrjuQCl/6inWsbputmsXnD3+vV0HpoVKff0QlYclM6UBPcgxzi7HRywgPn73hhoUigWWldOPABLKshbEdPXop3/TnIiO4p1YaMtYzVAD1oexB4TkEhZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB9745.jpnprd01.prod.outlook.com (2603:1096:400:22e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Wed, 7 Jun
 2023 23:44:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 23:44:15 +0000
Message-ID: <87y1kug7n7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: remove old trigger ordering method
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <874jnihm8y.wl-kuninori.morimoto.gx@renesas.com>
References: <874jnihm8y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 7 Jun 2023 23:44:15 +0000
X-ClientProxiedBy: TYWPR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB9745:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc20695-1022-4b64-b9e8-08db67b11aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A+enixtbs2xNFFKFhqrd0MxdpQZdGFx0e2wi79q2Z+4qRBn7mksFxmy7grY94UiR3oLqQxtielOUHFsaRG4tR4VWt1IaOU86/UcQogs/UEgYy5uWKdjV03yixopLuMIHgi46Cj6v6EQPOqSNWIEfdABcVnJp2Gl3aQ6080+kLrcjz+dLQpbtlX+DiK4dlAUcyOZ/MD2Ksc/VDTODX4OpHZX3hiWJ+pCnlXBZ4A+afBNGhtzEOi1KcC9yFdgreK77Yv6PNNzEE8lvO9FxtSSt9Snucs4W99ctnrySZThXsQ/CXO2dOkawuOs8ol082uHQwi7PhwZUsjoLnJVZaf9RtV0R7PsSBYkm5OAxJz1vWJlcswKjzmmCfH4Rz1cwKy284H1vT0EGG0TNHLzILXBllv1VmvZoK6VOk3X+GgVJ12n8UhopGU1oUz7n7NfhbgmGUFmf3TZqhf/Wbh0n7PPBH8YO0h/nMVHg/xIejaAkEZSMylRYUPpkbajvstS5ff+tidaBuOV3h7cHBiVG7RymcnHppU1f/igAzEcvNPiIZSUNxolpjf2M2Xj9buIV07jF9LDMEWImmTdv3Qd/rzT74UqsXTNxqXxrat+v7sItnwbe4X4qOzBLETaRJCNLj7Em
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(186003)(5660300002)(26005)(6506007)(110136005)(6512007)(2906002)(52116002)(86362001)(6486002)(478600001)(36756003)(38350700002)(38100700002)(66556008)(4326008)(316002)(2616005)(66946007)(8676002)(66476007)(8936002)(41300700001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1jQXZcynY6h2Q7EclqJOd1cA1DoQ1yNyRcNM+MLm0ZJNVg/nO+h+kbpk1xEB?=
 =?us-ascii?Q?ZhsJkBPWpymLvK/Gt1JHkYLA7STa9YmfqF4bLbt8Ve7XaO8Ca4ZUxGPvVl4C?=
 =?us-ascii?Q?kEjgL7x5IQx4XPL8jZ1D+STu3jk5oBJ4iJnFylDiayt28KozheDBpEfa0VP5?=
 =?us-ascii?Q?t8bAo1OLfmFrCens25jkORqdwJAPOuCq9xN3Wd+pzxsi0k0Zo7AvseWGj2Sz?=
 =?us-ascii?Q?qFdpwPUCg1ya/oa9gEjo4zHqoSz1nfX7y3tpwbVHJSN5dWWODidopUKhq65q?=
 =?us-ascii?Q?950Li+aAm52iwXc5G/iVa0ASWNXFzSI9h4Tqtic38d9ePq0L9YMmsBoT3LkG?=
 =?us-ascii?Q?AG7FoK9g9FlW0bOI3hcW3/k8JC4+RnRFxuyhqs7r1SGATBebdkNpMH39Iekg?=
 =?us-ascii?Q?4KhCVAJ0BMYcl31O7csS2PFnhXKGimmBn3nfvUg9MWnsZKoexJFDjFe6RtLy?=
 =?us-ascii?Q?rL+KcjdsipaayrlCsvSVwktVjbVPtW8OjTk48Ye/sXAx/feEUu1l2etpkmSa?=
 =?us-ascii?Q?0DO6BM2RZA+SLDmFF8nkbUVWQZ3EcQWl/CC0o5g8TlJi+WUdTTQRp4lqjwpB?=
 =?us-ascii?Q?WGiexzHreItj1ncpYNMeMH8irtcXqxFC71kN3j+/cdfEXJXYb36EEtWL4NqW?=
 =?us-ascii?Q?EOhat6oCe2kRHqR3OHXjmtjoWtP3VVW8h5cchlgcN5RTEVjsllAvu6sqsqU7?=
 =?us-ascii?Q?hAqOyS3WrglIgnsoWPZqxtsmkJHG1CAF9wt81+WdkbAZpHtKFBnLpMSnDsiU?=
 =?us-ascii?Q?fyeRFiNDSET7A8SrgliREg4V8wY7Pji7bpqWuYyq8OFCtSG/rMFBJkWBCzc+?=
 =?us-ascii?Q?wNovcshk4VZQ2HjOyrWng4DtkFGnrd0jmAP8Zej1R9POxKy4IX+YUuTd7YrC?=
 =?us-ascii?Q?hUnwnKewINuoBCyMKRN2WujxkKqlbovl+RWIp0H80bFf6sUkUYP0JVzkt9jm?=
 =?us-ascii?Q?vLRdVZ3e3PKhmfNQBh4pg7xiIS3JjvmSb/xt2O/bf2Krizmnf4fpJkbS5NFn?=
 =?us-ascii?Q?Dz4rizsLIthXqGfSktJQ8AmHS/cU9vxzVZ9I8k83wh4aRMudOdfK3c5K79PD?=
 =?us-ascii?Q?t39c0rHuTH1UIK4ct/Z11MFv4IwYIHMtS8LsNZMD1ujbilbWqQkv++HnTFoQ?=
 =?us-ascii?Q?AzuszLpLWi7XfDCmohnb4MDA9P91XrnScrA+xiZNv+BJnfn1FLGHhQBfX0Lx?=
 =?us-ascii?Q?VJetAwPuZ2OdMo0Oact3Hp8WxH0c9NO69/7WjfETpW8fpMCXxrDX2swoaBKw?=
 =?us-ascii?Q?oogD4wwFWaGN1+ld0mw+GgBHBdXxXDqkLJAlDvIaI+xHKJw0nR4JFbejgZ7y?=
 =?us-ascii?Q?XP8MrUO51U7f7hFppSo+Xj5KeVrgoXp08TGehbHfgIYfvk749DWc0xYTKUPN?=
 =?us-ascii?Q?MRlRF2f1+6nSAkr/sqVCDIKDejiv1UvKLAysMuITYn5lAUZzxlbtFEIArObL?=
 =?us-ascii?Q?Qj2JHbQmCqX2wFtQ4GN5KRpjlFHDDfEwZa1E50rn5wWmx9w+HOPFIAMp24uo?=
 =?us-ascii?Q?CDn+F3rRUrg7Reow1fBHKhVOqJgX6YciMKUDoQxw19YLPNePDeL2vCpl9wpS?=
 =?us-ascii?Q?yrj1spVOorVLBsroQVGbKEaSZ3s2JUHUTNLVlh/GhYXgXOLwRwqzZlfpGcXp?=
 =?us-ascii?Q?hc2k4/B7LnrWtypvpty65g8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8dc20695-1022-4b64-b9e8-08db67b11aba
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 23:44:15.9209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hmxLt5mtVaw9D8QH9nyUVmi0bBzEE8jRDHcxIkgvJGGGJ0mAlFyqgR5k9q6F+rDPLA8k6d4FQzkzv3f604S6Nj5JSaGvXadRwPRG4G4gnf7YbEvQcLXHEDMVp5LRhjym
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9745
Message-ID-Hash: 47URZCTIO4XC5AL3RG26PXFTGZCHK7AE
X-Message-ID-Hash: 47URZCTIO4XC5AL3RG26PXFTGZCHK7AE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/47URZCTIO4XC5AL3RG26PXFTGZCHK7AE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

All drivers switch to use generic trigger ordering method.
Let's remove old method.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  2 --
 include/sound/soc.h           |  6 ------
 sound/soc/soc-pcm.c           | 10 ----------
 3 files changed, 18 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index c7733382757b..87f248a06271 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -199,8 +199,6 @@ struct snd_soc_component_driver {
 	bool use_dai_pcm_id;	/* use DAI link PCM ID as PCM device number */
 	int be_pcm_base;	/* base device ID for all BE PCMs */
 
-	unsigned int start_dma_last;
-
 #ifdef CONFIG_DEBUG_FS
 	const char *debugfs_prefix;
 #endif
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 49442583d46d..52bb64d427f5 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -762,12 +762,6 @@ struct snd_soc_dai_link {
 	/* Do not create a PCM for this DAI link (Backend link) */
 	unsigned int ignore:1;
 
-	/* This flag will reorder stop sequence. By enabling this flag
-	 * DMA controller stop sequence will be invoked first followed by
-	 * CPU DAI driver stop sequence
-	 */
-	unsigned int stop_dma_first:1;
-
 #ifdef CONFIG_SND_SOC_TOPOLOGY
 	struct snd_soc_dobj dobj; /* For topology */
 #endif
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 08b3cbd1754e..574aa094c990 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1112,16 +1112,6 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	    stop  < 0 || stop  >= SND_SOC_TRIGGER_ORDER_MAX)
 		return -EINVAL;
 
-	/* REMOVE ME */
-	for_each_rtd_components(rtd, i, component) {
-		if (component->driver->start_dma_last) {
-			start = SND_SOC_TRIGGER_ORDER_LDC;
-			break;
-		}
-	}
-	if (rtd->dai_link->stop_dma_first)
-		stop = SND_SOC_TRIGGER_ORDER_LDC;
-
 	/*
 	 * START
 	 */
-- 
2.25.1

