Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D66674DBE
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:06:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91B102E0D;
	Fri, 20 Jan 2023 08:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91B102E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198394;
	bh=/hHPLJY8uaAcv7lb8pbWFo+3jbtzhB0GV+gBiTn0OiQ=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AW+DeB4f5seSEFo1YxCJn0JTX4j+faqcjVL+m01qbXDiBlaQ5r7dU7GR0NSVKsfog
	 ++ofkfyCfXO1eEC70bSyIbGmQOpMiuzsTz0bdEgkZPsoNXTuArmdSDeIC/R8xEKbcZ
	 uVl2zYrhh/zwYsITqj+OfUEFGBKwXtCVMc5FYUSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B5B4F805BA;
	Fri, 20 Jan 2023 08:03:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E82EDF805BA; Fri, 20 Jan 2023 08:03:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D610F80552
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:03:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D610F80552
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dhSXFOYF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qu4G6FrEKu6X5DnVcCE1aIPxaw35ZkDuc6d+9IQ6H9xvD6CJmYlR2SUc4RLlx2cRAXgQVzzdt9z8M78E3YLouv828lWzT9gAHGfZlCa3bu/UM9wAnK3+lN/R8ZvpymamjNf+TmLLMdAq9vnOKo3HdOqyg3DWNDI2lZ0Yfxbi0m7Hw1nhiloLyJSryXwdaHsyW5JAMMtDqspkXuEpgXOanMInyVcRmysR14hjpq87UpOi6+tqcu6CWW2Cn+XGUVPUXwrs7KpMbRgiXp5pBc9017a/JIe5Pe3bYmr8tAtRWexCbDYnvhfhk/DmjF0ZUp0tZPpGfGfTF1eTEc+EZkxX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcHtF/n2MSlkWXR586MqlkB7DN4Aawdn+kM8+CENqbw=;
 b=YtQVjnoj6uk66CIZhpOEzZW/cNq6BfGpODp7wRLWYf6Ekfpm0ntSaKGYAblCqWQYsnQGINMFGgiYA0g9oEphUs99XQQu3xTFx4c2O7Bs3ZBmRqBiiHtMGHe6RPpI5FLlDdr+NTIHgWGtbGniW8Oebjt/yopqmnqhm9yk4MQnteqkBP04vHHO15erj0nDVWzTwktJhhfOE/W2CSLt8qT8kN/kfKY/B1AONhX41Csxnc0rlBJ6vyAH3HwF9dTN6VB8yeX4ZWCuAdVTxS3DGVPRDSUthU35Be4NmV06lyJdQ8eqQu3K1ix2yrExydgZH/ScOUco94k9CMcF5VN1pl2XEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcHtF/n2MSlkWXR586MqlkB7DN4Aawdn+kM8+CENqbw=;
 b=dhSXFOYFX3V6RHZKt6XMtnoJvdy6I7y/mN8CVTiX+Kem4WtE7Je/dTjBZaPtGAFSia0SJzkI3wLZO6fh3z4KuzCIg4+GdbjLsKsBB/8kjk5msxZU3TvEbDLQafdcG3IUCbyySONNoETw8heFNuHAqhehG+LmB2nmC7OgIkrE1J8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9337.jpnprd01.prod.outlook.com (2603:1096:400:195::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 07:03:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:03:04 +0000
Message-ID: <87pmb9k7rr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 14/25] ASoC: mediatek: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:03:04 +0000
X-ClientProxiedBy: TYWP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d5bbf7-5fe9-49bf-025f-08dafab4608b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HG3pgsj6x0hH2I04/AbVM6CPQnP0600/YK0Vsdfexv0RSTdk4HouQtqJKbOsvO2NsK+Kk+XClXOm+lqtDsuy5KySAE2zpdHurLkQbnvS0EHoTTeCsUUsDZ/TsMcmkDCMynTay3m/zzzz+bwvMFlYOeMcKxjOjA+IpmZlKFt7EFsr2KaIYfHbwbCO5cT/jGmwnltijLIK7mUZAnY1S/vr0QFwZLiSaHwdFaIgnXc/p/ZInw1v5PvJeS6nrrJnKvh5wSA4vGO1O4z9I1ES9v7fIHmJKgbjfsV7RbTg4E9T0yQ4nuyY6FYFKAwrN4j+Qsbo5PXlWMeYMGT6farSdqUXJK0g8/FNV/YB70Hk8RLQTqON2WQxhflA6F0LSPXankHTCBEt+EVoImjwbpPuFwjebDbnqWU9joMiJESGZPWYPiwKdrXago5fN5fD80bgePmQFvLBnArMeXBj9Zz2RT031jdNaKAmVqD9rpu3ntGFK5zzzT66BrGZhcI40ij1yogh39svCaYsaea0drN/lgovDTUMP0V/KeQNxtsh2/5RDmX5lUDbBYbPcpBp76DHRoNHdAtutljfg1zPNt+SOT2kKFoZqQqeumKZJFnfRTcE9s+QpoMWArDy30k5Ix1bC9WPZsasrGKKAidt+FGHMhi2cJa22vIavD8IvFbv3jRdLlDo0i4HF56RibHUo6a6mNnk04Q9O5JqB/JmEEvVymcMMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(2906002)(83380400001)(41300700001)(6916009)(66476007)(8676002)(66556008)(66946007)(36756003)(4326008)(7416002)(2616005)(8936002)(54906003)(5660300002)(316002)(6512007)(186003)(26005)(478600001)(38100700002)(38350700002)(52116002)(6506007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cIBDkX1j0sirvHaVdfU01xk0cnyHG3LtpJLuD9UAyGXQvEUOM3ssbxy1QG+N?=
 =?us-ascii?Q?54Ongwc9KJ5SshCfo2f+fl+1RikbAEDg81xXeBeLSJnjF8+7xizuExQVvknp?=
 =?us-ascii?Q?suouhduUD25fSKki0Hz9EuxpUGmBsNhzm47c1fww84PTFvAaE6sUjm6mKT6W?=
 =?us-ascii?Q?fBL0LtcWTyrVL32nBtSVYROk/73YvajzYP/z+NDNmuNFEUIpm2eTtrRgE596?=
 =?us-ascii?Q?XQsv0dGO/vsF1RQc6JVui9krRG0lCzLRjzdKRWG5rJo1hMHb24vumq707i5E?=
 =?us-ascii?Q?rGoWH6QHGyZ8WRjnNt675lsOiWoBq0kU+DFSrLsTW0hnPXhsWo/KPKZBPwTC?=
 =?us-ascii?Q?bCyD0vktcFVgbGt9CigN5MWmeD2ng5YXcIsOS8hMwjLYzcS4WR/YnFqqjp4t?=
 =?us-ascii?Q?tlzlYivcBMRso5WSvIlRLvBJGAMk46UKP1oUxpPrguA1w95sscgx/pTxz2B3?=
 =?us-ascii?Q?+7h8EUlZCunCOsP08vCxa/ML60rnirnKQsxPUPb7Q/RdkpLrJWmznr90JX4N?=
 =?us-ascii?Q?/mNRcWZnLO+Nh6nNklGcfi1adcYa6xT3YdG6ifL2G5gyCxPSF0i3HeS6WKjK?=
 =?us-ascii?Q?TLWaSMzxs5SHL4d876FdX1T4xz0rF6oCvMPpGQT5l7n6AsXJhZPKDDHs2mQa?=
 =?us-ascii?Q?tbgQX6x2uAqBBYGPrkUMtXlyNcf0KteC4lvLsEY3A93zPRoFmSVWsXCXV6K2?=
 =?us-ascii?Q?y0YgEXwwKOhMrO6fAu8mYgCaMri69dobDDY5lOna0OWyq3d0IMom3yoNdm4e?=
 =?us-ascii?Q?3RPAezNnKTGaMCCjOFgSOSdtySTbNgQQLK23GQ7OBMZujSXA6bFQ+ic2AbZy?=
 =?us-ascii?Q?yT+gim0f4GW80zR10LnmDIusD3sbNjnAFE5ZN6LgovJP0SoYn+zs8MQVAxcu?=
 =?us-ascii?Q?trxrjnfYnUWiZFp0wDhWpawOxS80jZGF1MxspJ+Rb4/98X5tBqEeWkQEsCBD?=
 =?us-ascii?Q?Hx8nwfOoSSmQuyFLO5b96nEDh08JNQ7Hp4+1nu68Sbr/wukDUMlyu5P8JCEQ?=
 =?us-ascii?Q?0orn8jeSxSt4Pff16QoQmmvFLCCSoeRj7loE50X+3v6211LhYPxJaHt9OgvL?=
 =?us-ascii?Q?/+V2cYZ8wdN0GO7APHjgdwhXfMc6E9woWdFQx6H0pmflqmIOVn+dhXfStHLH?=
 =?us-ascii?Q?EdBryqfS9M+U654X75kDzXl/BaVxsl/9mfEXLFcmn7qVKCLm9gIDVUZCty6Z?=
 =?us-ascii?Q?5wwdC910wQjsIg8KToFSCgWI1VffszbOopJtymekjEAs9na2MkzkPvW4QuDF?=
 =?us-ascii?Q?4OxT+yC6mak1jIC7+hCk+0mcG5Fj7Yr/Yj0eFlJZUJtQxckw7dWDnonZXZNb?=
 =?us-ascii?Q?kzzYq7sOvi8AF68sRpLUtdVslOHtizXspdW67bUIs2rO0YeTGDyZfmjvdYM4?=
 =?us-ascii?Q?kOP0IvV+cqAgYNTsCgcHzj0yLQLZD7hY0/9ci25qWEoE57xj3KKsPjCVGxVy?=
 =?us-ascii?Q?CKcjE2ePaUcbBvh36+AwrGGcx82UvMoaWyuZrHkbNMq5MJ6kbrPHwUfjPQvu?=
 =?us-ascii?Q?p8ezbY16zwC7hJIm7cpf+GofPnpwWIxUJAUyjqqVR5myuxjarI3tVdxO1/2a?=
 =?us-ascii?Q?5mBv250xyluYXFhZAJKyMKm2L2fwCnyG1dQcWMSGoXLUQG8d1iW5ZTsPADG6?=
 =?us-ascii?Q?2QMNQ25OZjChVwudiSBR6yc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d5bbf7-5fe9-49bf-025f-08dafab4608b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:03:04.9001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdStIPfAmYAFrlMmc0xyS04dkEN0HulHQYxtmHkVtyagew2n5OjfDRWVN+uOPcSCJSb3y3rfa5Lv5colbNKGI29WbOH7+acYfBCE47B7UjGCwQ4tOxBl+KwRiIkM+/UM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9337
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/common/mtk-dsp-sof-common.c | 18 +++++++-----------
 sound/soc/mediatek/mt6797/mt6797-dai-pcm.c     |  8 +++++---
 sound/soc/mediatek/mt8183/mt8183-dai-pcm.c     |  7 ++++---
 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c     |  7 ++++---
 sound/soc/mediatek/mt8192/mt8192-dai-pcm.c     |  8 +++++---
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c     |  7 +++++--
 6 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.c b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
index 8b1b623207be..6fef16306f74 100644
--- a/sound/soc/mediatek/common/mtk-dsp-sof-common.c
+++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
@@ -32,7 +32,7 @@ int mtk_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 				continue;
 
 			for_each_rtd_cpu_dais(runtime, j, cpu_dai) {
-				if (cpu_dai->stream_active[conn->stream_dir] > 0) {
+				if (snd_soc_dai_stream_active(cpu_dai, conn->stream_dir) > 0) {
 					sof_dai_link = runtime->dai_link;
 					break;
 				}
@@ -111,21 +111,17 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
 			for_each_rtd_cpu_dais(sof_rtd, j, cpu_dai) {
 				struct snd_soc_dapm_route route;
 				struct snd_soc_dapm_path *p = NULL;
-				struct snd_soc_dapm_widget *play_widget =
-					cpu_dai->playback_widget;
-				struct snd_soc_dapm_widget *cap_widget =
-					cpu_dai->capture_widget;
+				struct snd_soc_dapm_widget *widget = snd_soc_dai_get_widget(cpu_dai, conn->stream_dir);
+
 				memset(&route, 0, sizeof(route));
-				if (conn->stream_dir == SNDRV_PCM_STREAM_CAPTURE &&
-				    cap_widget) {
-					snd_soc_dapm_widget_for_each_sink_path(cap_widget, p) {
+				if (conn->stream_dir == SNDRV_PCM_STREAM_CAPTURE && widget) {
+					snd_soc_dapm_widget_for_each_sink_path(widget, p) {
 						route.source = conn->sof_dma;
 						route.sink = p->sink->name;
 						snd_soc_dapm_add_routes(&card->dapm, &route, 1);
 					}
-				} else if (conn->stream_dir == SNDRV_PCM_STREAM_PLAYBACK &&
-						play_widget) {
-					snd_soc_dapm_widget_for_each_source_path(play_widget, p) {
+				} else if (conn->stream_dir == SNDRV_PCM_STREAM_PLAYBACK && widget) {
+					snd_soc_dapm_widget_for_each_source_path(widget, p) {
 						route.source = p->source->name;
 						route.sink = conn->sof_dma;
 						snd_soc_dapm_add_routes(&card->dapm, &route, 1);
diff --git a/sound/soc/mediatek/mt6797/mt6797-dai-pcm.c b/sound/soc/mediatek/mt6797/mt6797-dai-pcm.c
index 51f736f319e4..8a309b0734f7 100644
--- a/sound/soc/mediatek/mt6797/mt6797-dai-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-dai-pcm.c
@@ -183,6 +183,8 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
+	struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
 	unsigned int rate = params_rate(params);
 	unsigned int rate_reg = mt6797_rate_transform(afe->dev, rate, dai->id);
 	unsigned int pcm_con = 0;
@@ -193,10 +195,10 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 		substream->stream,
 		rate,
 		rate_reg,
-		dai->playback_widget->active,
-		dai->capture_widget->active);
+		p->active,
+		c->active);
 
-	if (dai->playback_widget->active || dai->capture_widget->active)
+	if (p->active || c->active)
 		return 0;
 
 	switch (dai->id) {
diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-pcm.c b/sound/soc/mediatek/mt8183/mt8183-dai-pcm.c
index 38ce0e36cdb4..4e25287fc0e4 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-pcm.c
@@ -183,6 +183,8 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
+	struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
 	unsigned int rate = params_rate(params);
 	unsigned int rate_reg = mt8183_rate_transform(afe->dev, rate, dai->id);
 	unsigned int pcm_con = 0;
@@ -193,10 +195,9 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 		substream->stream,
 		rate,
 		rate_reg,
-		dai->playback_widget->active,
-		dai->capture_widget->active);
+		p->active, c->active);
 
-	if (dai->playback_widget->active || dai->capture_widget->active)
+	if (p->active || c->active)
 		return 0;
 
 	switch (dai->id) {
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c b/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
index 41221a66111c..a50aa294960b 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
@@ -218,6 +218,8 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
+	struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
 	int pcm_id = dai->id;
 	struct mtk_afe_pcm_priv *pcm_priv = afe_priv->dai_priv[pcm_id];
 	unsigned int rate = params_rate(params);
@@ -230,12 +232,11 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 	unsigned int pcm_con = 0;
 
 	dev_dbg(afe->dev, "%s(), id %d, stream %d, widget active p %d, c %d\n",
-		__func__, dai->id, substream->stream, dai->playback_widget->active,
-		dai->capture_widget->active);
+		__func__, dai->id, substream->stream, p->active, c->active);
 	dev_dbg(afe->dev, "%s(), rate %d, rate_reg %d, data_width %d, wlen_width %d\n",
 		__func__, rate, rate_reg, data_width, wlen_width);
 
-	if (dai->playback_widget->active || dai->capture_widget->active)
+	if (p->active || c->active)
 		return 0;
 
 	switch (dai->id) {
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-pcm.c b/sound/soc/mediatek/mt8192/mt8192-dai-pcm.c
index 239e3f5b53d3..2847a2e747be 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-pcm.c
@@ -273,6 +273,8 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
+	struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
 	unsigned int rate = params_rate(params);
 	unsigned int rate_reg = mt8192_rate_transform(afe->dev, rate, dai->id);
 	unsigned int pcm_con = 0;
@@ -283,10 +285,10 @@ static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
 		 substream->stream,
 		 rate,
 		 rate_reg,
-		 dai->playback_widget->active,
-		 dai->capture_widget->active);
+		 p->active,
+		 c->active);
 
-	if (dai->playback_widget->active || dai->capture_widget->active)
+	if (p->active || c->active)
 		return 0;
 
 	switch (dai->id) {
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
index caceb0deb467..051433689ff5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
@@ -213,11 +213,14 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
 static int mtk_dai_pcm_prepare(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
+	struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
+	struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
+
 	dev_dbg(dai->dev, "%s(), id %d, stream %d, widget active p %d, c %d\n",
 		__func__, dai->id, substream->stream,
-		dai->playback_widget->active, dai->capture_widget->active);
+		p->active, c->active);
 
-	if (dai->playback_widget->active || dai->capture_widget->active)
+	if (p->active || c->active)
 		return 0;
 
 	return mtk_dai_pcm_configure(substream, dai);
-- 
2.25.1

