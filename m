Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED62678E13
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:13:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C82E4E7E;
	Tue, 24 Jan 2023 03:12:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C82E4E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526426;
	bh=/hHPLJY8uaAcv7lb8pbWFo+3jbtzhB0GV+gBiTn0OiQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XrlWzowvTetn1Qbm49ExPogQs8qV5l+jT9SeFH+kqalAt2hIvsG+wBjQMA47i2aao
	 kgwYj1c/koLbScpvPvWfGKH1a5ZBD7FevUGaKeGHxcPSrfWaKoIzjmQzYU0o6MHO8w
	 6sn4Ou90YvFKy0o2QYePII+tUTPyDwywTo1Qwt4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 760B2F80163;
	Tue, 24 Jan 2023 03:12:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4638BF801D5; Tue, 24 Jan 2023 03:12:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2131.outbound.protection.outlook.com [40.107.113.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 190F5F801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:12:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 190F5F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=kP2zeiIJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1QDK62/q70voPZ35hFdIA19H3jy5IKIvXsPETL0qEQ5YOpfqfEBdRfJXKVKn/rD9mA448blx/LMIRjcu/qV4XMqCwVtJZmOIP3p7QUTBA6HYvski1x8J8QFxaB5XB0Zi0USeyWHKbphav/wTacklGmRHx9wsGAXP+pyKl95FES1V5fWrJlJAW3jBCDPFhZU5hg63g6mAHt96Xu9ytl/mBIphKK0KdS4MRLtKRJmvL9SgpqFHQsADQXkM/5MlZExwGjazcACl7vw+k8YO7n6I88y8INxHFkkiwYaoPQmfPirLhSjbvylP9KthRVnUAyflG+FivXC2d7bA7kEA5ryHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcHtF/n2MSlkWXR586MqlkB7DN4Aawdn+kM8+CENqbw=;
 b=HB+f3OSiCR7oFI11dC0ynoVQlfa6up+opoNxqtM0jpsuaTULrqrIT//YwbzrKyZHt3gyXV6vcIl++J/XMBgkMcdOlvjQGc5Qnkp+P89v7Wnj2AZdqpICgBApvtY0llGQCBU0/zfDMfsVHWWh/6rT7X9unKceq1zpCO+dV0kEEjzZ85PS7BfPSTmrnSjuzm8JrChsTOygDXceF5omKHQNzWN55hUUAw2BwqUHK8glWMXuVmjhIjpR2J/oOpS3w6p0SHMQ5rKJjJDZ2KKbsgsghS6MsrHfobiG8J9OCudW93CaFLmR1iPxSt3znTkEPEosrR0JJOZr6Unz18FVVykqIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcHtF/n2MSlkWXR586MqlkB7DN4Aawdn+kM8+CENqbw=;
 b=kP2zeiIJ5p0Ne1mT3sQKafti/Pc6ui+drdFeoiyJUT1rDDVT7iDd4Ibwi2z2v4HI2eULqa3Y/oCZq8xADFmElSh52lgxLXsKQCk/YvSedFx/j+94xplY8KyX4zDd9qwos5KcG4ifRbrq/Hy7+eqmwGCKU7Al9K2chIcWDCXFVGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS7PR01MB11964.jpnprd01.prod.outlook.com (2603:1096:604:23e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:12:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:12:46 +0000
Message-ID: <87edrku1cy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 14/25] ASoC: mediatek: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:12:45 +0000
X-ClientProxiedBy: TYCPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS7PR01MB11964:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4d2812-9d8a-4cd1-e5e3-08dafdb07bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N/hpDMLYeneW4dKcEMJ9O8dw/QdvL6Igp9qX7eM7uHlXopfzECOkLRv+WfPgfF49Q/hrxZIVhnXZc706c+WnT3C1Fft7jiwbvQVn+9tOCzw2+rbxzIiCknJ/DFgVPIJCtRii4NAAPjJ+o+tSD/xiKVijEmRcyIXVwielEsRj2WwCHKQy+nQzz7bWtAt65x3zGbgAvjbCwogpdkmtlyq2rNjYHtvX5AooaOcLT9alVXWmlqtaEcFTbyX5Vhq9Vqn7LqLhkqxb438dARz176nA4ybfZ7cVLXcTYekMinAxjcFENp+wKjRTYMGpIgtpOenEHq9BmfT7Mq+nK8i8aFfTYlqwWQqECvQLe4EG/8TR3BAbqgSZrZbFd3bxSCJ8pm9sJyKrPoOA1y+O375n+38NCREP0oBymmkFaiaBTD0BY3v8w0n8SjFea8X5f6JuaZjJkKZwPCnCkKFAH98jhko0p2QgQ3Rzry5M4VETAQxlCJIypQOiNSctUYJ1hnpx/BgLk1w+Jh6MpPAxdI0TUENsH5uXB4bPv3Av/QGrwPqyp9M5XImsOV6VtOCAZtaBsbECQOASs76evqf6X0F4FXw94aLjWXKVX3fJGlTnsmhGJS9dbH16SeMpiiZIdoQVoLRQRcbV7WgbgLeQDtXDqodFMX8Z5pVQfQKcn0ov1rPlr4hyQiaZ0rYmqeUhoKNwkirb6yV5ylNepZ/EagmC5TCKeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199015)(36756003)(2906002)(6512007)(7416002)(5660300002)(478600001)(186003)(6486002)(26005)(2616005)(8936002)(54906003)(66946007)(316002)(4326008)(66556008)(66476007)(8676002)(6916009)(83380400001)(6506007)(52116002)(86362001)(38100700002)(38350700002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gDlUUOSW9gJaWLa5kTiI5CxhPoxFx00HgHhpk7/73XgPsep57DKQlZp/+Hc7?=
 =?us-ascii?Q?/hnaxgA9eqhRTRUzVv6Q7dWYLYM/0OdTq9YQrnakuwyd7X1/ztuNBKazX/L0?=
 =?us-ascii?Q?3w6mnCow7NszhpIGQqqVCTWIeliGaR/8gWMc086pDGe3Fgx+NkbjpNLy2Mol?=
 =?us-ascii?Q?sabm6Zw5bcZaEOBsQTJkLuNsqNRwzdLX1wPWQLLhnw5NztdjAqS8QOH7lH5W?=
 =?us-ascii?Q?Dzl0KCkQj4goAZT8COwujJOXCbcUNfE5YxSc4ilfM8MSe2YBBEPo7JZueXhh?=
 =?us-ascii?Q?+x/wVEqbaoUm1FAOrOJoImtJNIuha9v40CkPOSP0CvzR1oYhikHCWfZfQnnc?=
 =?us-ascii?Q?pHubcf/DelHt9cy58wLkwtBQUmozh98ZUoubcJRZIlxe3pQMMrsqZQ11mMXv?=
 =?us-ascii?Q?DoIxGa2Alt3CXrmauBxft+OZTMQooh07FXlPEbkBIJO+wHo0lF0qD2e9kWg8?=
 =?us-ascii?Q?dX5Ewfj6YXO7d6jygsYMeaZDPHh/k6wLQbusP1AOu/igckWiGsRUgSH/Pc/R?=
 =?us-ascii?Q?Av7ut9nDeDwW8l1vYAmGf71afAMSZCMCKAro93fhhVemxQXWJ43P6VyZK2b4?=
 =?us-ascii?Q?xrAcMy6qMRdBjDAa2HXtUEV+ywwKbNZQew4QifS6fnL2ysaRu5iQaZa4sN79?=
 =?us-ascii?Q?38mecNtLYo32eySgVI1vuUcoK9Knn7dPUWqVIuHrPk9OA3Mw7V+xthFo4SCs?=
 =?us-ascii?Q?Ed0KwY7FeckzK8BGZGaE5QAa4QSVY3bX5AAEcWVdeQZtDG8eGaNFqONGGXQx?=
 =?us-ascii?Q?wRrOUAl5l/9UwRGy70EiOvzaihSEWs/rIiRfe1GaJpszIb+QsiFUsoDEKAof?=
 =?us-ascii?Q?O4DYURZyXh5j29RH6c1tjzjMkBEa9n3VvCsz72PIn5tePC7X/OTRqj7pJEiB?=
 =?us-ascii?Q?O8ogSQ+bDV+bchll556KX1LzCid9fb7BE+hAM+/je6FP+PF0kf7VV/Gd88TV?=
 =?us-ascii?Q?s/QfMIDkWBWYSmVgnl3K8uLh7b7dtr06JS2TELANeAXseIXRvSlXhRKLYsqP?=
 =?us-ascii?Q?aMR2W3hn3GrGU7iU7gPuYuLLtwlMlF6LumBqZb9zgdds4e25nAHlyKEyPP25?=
 =?us-ascii?Q?VL2VLc3Uzw+nDYOP9nhideWMV6fM8hNtaHVEYJo6VrJ9rnTuhtwl4bzJQsdq?=
 =?us-ascii?Q?hnemAYuUa/18H+39VCKIQBkKUqFSApwooSF/zPGOVUkCXNldVjxp3Amau8rW?=
 =?us-ascii?Q?JIrELYhSlKmUyBoxHZwKObp0IZaPipzMrAXwYa1jGow9r/y6wIrKL6fXGZao?=
 =?us-ascii?Q?tSF/jLq/A8A3Ve6CdLO8GPrP/qkrTCzyho5ky9p1aSZzok3uc1licRJQW1kR?=
 =?us-ascii?Q?SktGd9Jk17Eg/kAnkfiOgtM3x5tKHmzkume590PqVkR0atiutfhOAAj/Vt46?=
 =?us-ascii?Q?5yC7Vid90l6dAUOORUJhWClbXAojdJQvoDfxePIagSZyj8VK6PDOgAbGYusS?=
 =?us-ascii?Q?UjM8MSPU8dm3U5h6s66T4YBwkx8wtwR/hbPrr9r2JS2SuABuERPneGZNIKfg?=
 =?us-ascii?Q?mRgUypBymOywIEDpd0F6QKk1RYVjru0Vsp3xIyu2YtW+bYfxQKVMzbsuJK7s?=
 =?us-ascii?Q?KFZck9+1LJ2kexyBQbf15J5QrTb05Io/foO+hicDxkenKjvWi7pAqpEjKriT?=
 =?us-ascii?Q?4h7Yk1vSjfQ/kAlgZ2VBMPo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4d2812-9d8a-4cd1-e5e3-08dafdb07bb8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:12:45.9070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEVSX2x0eomLp9b3fgGolG8c6RblouJVqRqFHe1SfvUOgrV2BOH1GSrLjDUfTBQKKk4qS1HBKoqA+rcfXxCxk7H4KkM8IHkQohMoAkvIpXq66w2RVwT0+riRXDQnCifK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11964
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Chunxu Li <chunxu.li@mediatek.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, linux-mediatek@lists.infradead.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

