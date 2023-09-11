Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A711E79B324
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:59:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B163DFA;
	Tue, 12 Sep 2023 01:59:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B163DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476790;
	bh=iRo9eI6SXe/f//P6EjGhXZbAQ19zk0cQd17/ynTONOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zp0gPNDgSfA+yb146o9qhR1HyrqoTM1jMa056Qeb1pFmjzR/BkUCj+lYfZxHlcfe7
	 g3mvKObUzPESA94Bgc2fDGmWsm1JSPf7W0Ge/rr4GjpI1SuKMeFNUTeWch1831c9dn
	 avhMLjpK1tEgLGu+ldXDfgzJxMLN2QXBRbGIGUtU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84874F806F8; Tue, 12 Sep 2023 01:52:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8A95F805D4;
	Tue, 12 Sep 2023 01:52:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19507F80687; Tue, 12 Sep 2023 01:52:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C2E89F800AA
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:51:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2E89F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Rcf3tiF9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJprZWmH+9TC1qr/lsqKUQkjviypt3oaVyKVd9OUeujsHIGEHIG132ZjxB+Qc5Xla6KR/EAmehoUgxxAnbxn4Obn0xaUT8DDAIdLexmM7sOfIvipDI6iNDpOVPEHzz0IZQIgwaVwUCu0riwjqB61FVQHdeUTM6mTucyTUpN1HgyV1M7k8eNOWRzarMykX+DH9xOJZLBDrQWRu3DiIb5U1EVWIVQWhf9YDaEf56w8RrgZ+DMewWS+PVUr9jvBJg+GueUX+nlPAb+15w99gvKoVZZ+SXgW/6VMELJMeGjLHIBOgjM+XLNPCEKEgP4CjDLKn7sYqFIKeKhesCxaErasXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnvWcNgK2vVAZybDwkVhMMtiJQ93tLL/zSZy5ztSfoE=;
 b=nMdA626xQvzPcMLLTp1aA12gcwEwViZRfIWJ9ZiXqb6boWHG7YrQXTUrz9msiAD6OQXHDSSaQKDYPAEHPmqCyoUokwkH+JwandPcQjbJ4iSPIC+9I7SeXnq3CqSXHSwL8P180Dl8AkuEpea5ZlhqKT7WTXt0z02+5RDhGtJD+dH2zo0OtMAF25S2XV48kM6gBbz1pE4LopmStSH+dauF77C23sKvD/j5KsWnic6aOarJJn0S46ce5heAj2pGeDYidpX3OWsQ2+ebwxexPWk8xS6f9a+fDc8hkIhXSBsHIpJhPrVkHP8WfxdGb52lAM/MVz2j+DKfEEItS8IpqRrUhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnvWcNgK2vVAZybDwkVhMMtiJQ93tLL/zSZy5ztSfoE=;
 b=Rcf3tiF9mFoIsQ1xcKlQuqpJzVtZVZpyspbOpJu9s+Ne1i/QfdfRpogITLGw/psGJYxDO5EFaDrvOB8+1pIfd5tJK9WWChzSWf/r4clR8JrDtxPlFXSXnyQot/dUXlCO/mDXWXxjPzeKS1IBKUpwpLuqpCstFkMBjD2fqUDCjCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:51:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:51:19 +0000
Message-ID: <87r0n4p8uh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Chunxu Li <chunxu.li@mediatek.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 43/54] ASoC: sof: mediatek: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:51:19 +0000
X-ClientProxiedBy: TYAPR01CA0132.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::24) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: a99d0812-3825-44e7-b7ed-08dbb321fef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dYX4YOGcWQrYDxFG/0g/xBuizO/5ofal4ZeErw0rsReoVJUjsxAp3Yo1ImdkDAOu2J0q+ckbZMdOvhftaPm/gQlvfPy3WH/GNyMdeFvbLUSHHeZMhBbUcUdSSJpcj7EEX5IWxyd4W2kQRBwmzbp1MD65lPi4Hf/XLnyCw7EeNE2bKx7xk8tiBiy2eHjFZIdRaaMMTfeK394Y84/4m+NoWZ6uK7EDqygQ2DZnwY7hu3eCelP4BvzGYBo1X7zANHYjhctrbRdQiYyeuXYDSbDdU5Ys/DbQhIpp7+SmG8ZsuBEGjV5V0NgPU23tSHoP5g3XAnUaAjEwHviGWjaQo33XTqKplVQWvs+yhIJt593PcSvIeMylRnDpBCAxQK4wPUw+wACJHQWxJdGoo/qvHWqgA99gBI7uT95/6M+qn7uy3iNvpRvbhyxVtP1kK5x0R6uvf0LQVdozM4tcQ7WQOPV1LLNjdf/vH4miswYst7kS9uCTO5CuSC9TLB5frtjacyYjXjPAkLIs6pOx/XN8XjECoJ5iTNya8RFm2WbBT3lWu+BS/TWpTpaFGpshpjnVdeAcXUQ+yn7LSYL4hH4ZTgVd35whFEy2AEqg6QUeCVWTwJTiXXD7eZws3ZjtNb4r6vN/EGcbWIV/mgglx2q8FXR7BDr3NxgImqUcbVuujMlFgnM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(66476007)(66946007)(8936002)(4326008)(8676002)(921005)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(7416002)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?shehFmzNsTHzyrJ88HIOXPnDlIx1ftwqpkZax7MVcX9V48qpGAmvSOxeVAYD?=
 =?us-ascii?Q?cmvhEOS/ZRVFauTX9thzvCK1/dg2y+KBgx5nlsSulVBqc0axHKYZRGRIqk80?=
 =?us-ascii?Q?p8g+jhoagaX/yC0uk1LU1RFPapaGuh9hn2Wkp03JHKz7PzpJ+qocvPSqIH3e?=
 =?us-ascii?Q?sB+KIS8B6ZMbjJYproGG6xvl8LakqqrlldV6UfmtnalvJ4Q3DUzA5RfWyGcR?=
 =?us-ascii?Q?1H3sxF40daTAOfwblBZ2d+8GDGe+G9WpnuLH0itlO7BUERyhpbuN/tHt7AYi?=
 =?us-ascii?Q?whsQ2OzsqDDwhB8JjG6hQZyWb7SgwWNx9hwY3gS/qb8ik+1Pn42X+8Nf+bAo?=
 =?us-ascii?Q?NuifUibztzqI5q6NZ6fJXWpYyi7G4C90hyUX9PgvEdLwZ5pqLJ+/3EFGG+LV?=
 =?us-ascii?Q?vlYme2VG8RDmBZb/7dmM4L+lopwT4xTQ0F9sSsuLGUTxMqtbEpDXEW4nGm0q?=
 =?us-ascii?Q?j30DwZb9GrXCVotFPAljK/Sgt5QPUVr5MNUBXvFaO0on+tHs+u8GU9Vk/ETd?=
 =?us-ascii?Q?bpHdIJwSN+3d4I6Z6C5MpxNWWCjqKlFB4W2RM/lcfG5TW3HY4Q/1IF9sPW9b?=
 =?us-ascii?Q?dZp9tnQoR3h1jxdJjQtUPxlG6cdcAc0kaCgaF1in1WHPlSwrrmoI2HTIQaoL?=
 =?us-ascii?Q?WapjnQKRe8eRPGSKC3bZp5nf1dlKvlCpI2gCZO0tKkx9+7M8H5hsGQhOB2sE?=
 =?us-ascii?Q?yOssDPMEv3rw73WPNYdI+uqYmKA8QB2lkoFgE9ovyHPH2coH/Vsatw9YFPh0?=
 =?us-ascii?Q?RvtIzJWX4XF+FI7ruIs94tgBm7i2ue+n+wY1JeOLLCQqPKWWOK2EVAa+oeHy?=
 =?us-ascii?Q?xzVdmxplddFmwAnukmFx9xM4xqfVVjXokTi4y6+rA6y7J9IAboVgM7V76GVK?=
 =?us-ascii?Q?Xlyf1iAVGHbIFTigEEnpCoypl9rX72qiwQEBLaoGDipzz7E6Cxq29OZ1tDbc?=
 =?us-ascii?Q?7EoJYKdTOkWDh3PUwZ+41Qkj+6+gjWSawT1yboI66gtgGp2UDdGtTavDRlom?=
 =?us-ascii?Q?07U0ua69AZqwBycIpfFebguGbj6MsUyPJyf4VYZ2TIn704L7JUM0hi3mfmQO?=
 =?us-ascii?Q?8J9r0GfvpRNR2U4IZ2wChpT6mFwJ4HWsnvBksxLTzvSi6ef1dzxZTi1rm+s5?=
 =?us-ascii?Q?xLsg5HD9xWkZCSmAv/XCvHIgIQ+NH1gM4I68t0wdoaoCKtyx+1fHSoHWyur0?=
 =?us-ascii?Q?IA4kMP9K6QqoRula2GpFFfTZK6fyhHTsl8aPe0HIH7KcprQVeq0HXd9V8TEr?=
 =?us-ascii?Q?CXJ39GOv25b1mgv4iFdzTsnyUdA+3FXE4gLaCmLHbFZkAS9SHIGgEJgZ2BA5?=
 =?us-ascii?Q?pgXA3iVnM8kE9I67vv5hbkev3sq98C24vQSYDO7ncNwOBWrSCjQxTCdRk/h0?=
 =?us-ascii?Q?YbcXnODHDrofzJSW1buuLieVB22NGKjqBDHuXNNSzyXU0WOuJeXVhzeMEwcX?=
 =?us-ascii?Q?23gxjm6069K0fWz1rq+Cog0GaJD6LNRz4fWGi67hzj0+4/xYYoUb239NAMR9?=
 =?us-ascii?Q?SHjuORyhvxcc2WK+PR7laXz9ZcwslumxqRwi7oR/3WHOm0F8DFL6mX3AOMqP?=
 =?us-ascii?Q?qS/a2jl8SrD/V4lKkKJ1OJFIPiEi8UABSFJ/8afjry+HrwwC8ZPtZbywFxXt?=
 =?us-ascii?Q?9Jx3R8uzy/9GLc1NhCgoowI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a99d0812-3825-44e7-b7ed-08dbb321fef6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:51:19.6902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 noroj7qBVpDIZz0aR0W50V2ZpQwRYDYxNQQX0i48H7pnuTrhLZ8VE3Fh87w3eyYdt7W4VVhCFjPTbAfdXlkmbc7tYzpwW8w0FC09R6rApulIJzWZqEOj1L5QyCBGXb5C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: QC3SVVTZVZFZEVVOI3DO535QZTE5N2NA
X-Message-ID-Hash: QC3SVVTZVZFZEVVOI3DO535QZTE5N2NA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QC3SVVTZVZFZEVVOI3DO535QZTE5N2NA/>
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
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index f587edf9e0a70..3f96ab670e8ac 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -457,7 +457,7 @@ static snd_pcm_uframes_t mt8186_pcm_pointer(struct snd_sof_dev *sdev,
 	struct sof_ipc_stream_posn posn;
 	struct snd_sof_pcm_stream *stream;
 	struct snd_soc_component *scomp = sdev->component;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	spcm = snd_sof_find_spcm_dai(scomp, rtd);
 	if (!spcm) {
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 7d6a568556ea4..661a7a2cdf37e 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -476,7 +476,7 @@ static snd_pcm_uframes_t mt8195_pcm_pointer(struct snd_sof_dev *sdev,
 	struct sof_ipc_stream_posn posn;
 	struct snd_sof_pcm_stream *stream;
 	struct snd_soc_component *scomp = sdev->component;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	spcm = snd_sof_find_spcm_dai(scomp, rtd);
 	if (!spcm) {
-- 
2.25.1

