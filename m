Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A715714188
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:08:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB5003E7;
	Mon, 29 May 2023 03:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB5003E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322495;
	bh=e1oNBFvYNx13CpFzcWIhv5aiDDj5e1g46SwokPM6oKU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C76AGheIKZ9YH6lAJ8M3qBcPozsgvq3UvjI9nFnMHJlVOccgKmojDA20NTsQZLXN2
	 7IaIhoSkWVdnbzp7A447JnK3YsiJGbKF+NMcXz2kdZXo3vt58ZV+7AMQkNPx13a7md
	 Zfpa5vlmY1+S3QfhDVYhXJlFjFK+Vz8II/FTr/gM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C84DBF805E2; Mon, 29 May 2023 03:05:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35385F805C8;
	Mon, 29 May 2023 03:05:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24B04F805C5; Mon, 29 May 2023 03:05:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C945F805A1
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C945F805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=E7G+p7O4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbuJgVwy+PBRYroLvz6QkfXzPjhqZRlflRrCwmoy076FARmlp2cgUZco68bJ6bFCqQWvSWYIRKCtV4LYWkAgDL7sezIvtULV7vSotPP8EFgR/diQJjujI2lJbZZb6Tw3hJ1X+BKkoop+UBUHQxYT6vmviYMv67gQS+QAPHWrJHzZ4+3zaIfOEKR1mCddo7a++eQ6EWpWP+vuHdAzTNJg+j9QQjTsBXvVhKDND7V/eMinBMqnhE6tD14+vXOc35qDXzymXqZa1OakQhWuAv0+e77q+9xiI06TcZHNsuaJSdRDEslK6/H1aSje+GyvcA3oFTPlZSICcUC8DBv0CAwyKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lYcIvZjQwNMuF9FgkZ9no/ctFvPzcapRVEZRcODqrE=;
 b=arObKf1g8WLsHUaYwwZZn4RCEGrRMr6Nc/mUK8d7aT17F2ShxnzTz+JZMGFNoDe38hJjdrGYRleyqA+ek2x54cLqB/fuNXT/hpxeKHcx65jdISj7Xf+MYVMTEPT7H4qxWyuvnVZQIytVS4v2n5wWwfJOMKVzzbG9hgZtZreCo0ovTtOTsvB/2RpeJDAwgvdTziEcVdUOU3+1fFU0CUiNsuJ6psmx9qy4FrUh0M0bLpejNC4VJWMY8TXddljpQXW6W9vsKubCHOkkmsHdvPNlYH0hcsKHCv/5F2VRpGb21mO2mkoz/Jpejo7xDE1uYg4/aZocJhwiTHDZ3uq1Jurz+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lYcIvZjQwNMuF9FgkZ9no/ctFvPzcapRVEZRcODqrE=;
 b=E7G+p7O4DbgdsFJcosvZtAXLUCE+5Et3QGlwS/wMUjqPqvzJXLgLs/H9ntE5NYZ4HCcTiNUYHNNItK7BfpeqHbSgvgm00035OZ49O9TnQwdBiJ3wAmLNcPUEF9U6r4arSz/xnVKy4hgWbB7O08tDInjmK8XATmEgJu8Gfdhk+TI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7952.jpnprd01.prod.outlook.com (2603:1096:400:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:05:16 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:05:16 +0000
Message-ID: <87353glzg4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22N=C3=ADcolas_F=2E_R=2E_A=2E_Prado=22?=
 <nfraprado@collabora.com>, "chunxu.li" <chunxu.li@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, Trevor Wu
 <trevor.wu@mediatek.com>, Wang Yufen <wangyufen@huawei.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 15/21] ASoC: mediatek: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 May 2023 01:05:16 +0000
X-ClientProxiedBy: TYCP286CA0284.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: e17c9030-a9e9-4736-69fe-08db5fe0c3b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w8yuIaGyzvb+a4Mob266Fs4GOpYDy+O6BKJ26WYyVAg8MFFeJ+Xc8oqleSRR5KXl3iPeP33bvilQxzHdO953l5YaQfRZGwm436emUm2r1igfGpDHmmsb7ph7ndTnuZe2okMz1Ej13WPQ5sv2A1AiQtqWuBwIQeZFEcf7yznTzHRGXXPxjNE50yRDnPVckGdZTVHRMgF+LpH4K4T10aVCngmhL4ErJSaEjBsDq20O0R6+ICSHSqdZK4GsOFEp/eepJWP+C9JgJL/zBP/vfxehJPZt7r+pvnRmETk9QsHkR04CYu2Dax+BDLUGDwMwVa+9BCOK+//FJyimOmE/F7VsDtOI/Uc+tNuqWHeEbIN/QLbXwFQLX0YnBsJGOQceeG7gAlEGVGEpllWLVVm2/5XFGylwR8NGOwmhz4u8B8G5kFEtjDO/Wmrx5GMxYT2aeaAPUbDxjhUFhddROAtPHwbi6luyvxiAI8rP4tBeJ5nS/VLot7ptEbrFoPclfiAJqP85BelMF2LQTuKvKxvI5Dzi2Hj6xqr2fA+p5xy/mwdtJEQ8GnP27BeiwhS4izg6+Cn5m+YrjkYWq+sClnuYUxGAtoooWgTvYC8x+rmdJZg627yV+ZkJDIoncGH12kMQjNlywhH+Pe3PVq8yFmEfzlXeaA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(2906002)(30864003)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(921005)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(52116002)(6486002)(41300700001)(86362001)(316002)(66946007)(7416002)(36756003)(66476007)(66556008)(4326008)(579004)(559001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1g6kkZfpnoec0ey7uotFdldTlaApzokyh7PQmoc7oR0hAAmpy4eLUuT0OBV2?=
 =?us-ascii?Q?9VU4pkDMIFkaLT4aQdldwmx0tA8wS3gyOe5lGRXMbJsyq2omF0gDCaNWrjGI?=
 =?us-ascii?Q?hZRyitUk9pswemxWtbg9Q+tHdDoiZFRSWC7527dkSsEwgRYSFHEWhPJJWxjD?=
 =?us-ascii?Q?TXXWAOMj+1lvh/pRRL1aHE8xArJRhddFdG/bsWFXwgJhazpk6UfVVl7FgG26?=
 =?us-ascii?Q?p72oJYnF4n5anv7fTQUWSetXBpR13QzX81m34PnJ75Pad3Vy6QP+ElHmHfUo?=
 =?us-ascii?Q?aMusAeHrQnyJ71XdxjMrQrVPi6lXAEIowKRRHK71KVOxjFwxaeo32M0MCwLj?=
 =?us-ascii?Q?lF90BU/nwq2T9T0ir7icWpbQcUjs2zAW5gDca5lApfx8AMKOxuJ2sr4jRF4y?=
 =?us-ascii?Q?HLde/LH50JCwH469RzziJgQ89WON3Ra0yChYR2VHV9n8nGqsgjvoDcYrMSGE?=
 =?us-ascii?Q?m+I93yVfRllYkU+fABOAYOTSm4wAvXfZjKyt+7lS3/pDVfZ9yuAv/P1DeSEe?=
 =?us-ascii?Q?6a8BWmNI35qJFcuHmi/Cs9b5NJ10lFzrFZWrdJB9T0U6Fkt6I/xsLgwX6FXd?=
 =?us-ascii?Q?bGMxyVglhj4TlC9iv3p+XaxMZc3wUZz21bjRZo3l/YgpTHWcv0Pn8acWXNDm?=
 =?us-ascii?Q?lb7aN2DSPGNWBLTsT7zWVM/7Uky7jJJmDxKWujYlLBoBfrfhBeAfdfNV9C8E?=
 =?us-ascii?Q?DXImUTufInzx2v4v6UoZwpE2KjgKOOOPENq96cSXu5Rid8Eu1X2SPp5TrMYJ?=
 =?us-ascii?Q?HpjwOWpCSXLftGK3O/gPSufFuD6qZX8yaBTF8M7qD5N1HCj13U+p/V7x+Iub?=
 =?us-ascii?Q?uXvKLf9v/sFb4m7LOHlH0MzM68lhWh+K9mFuThn7FltdcQPyIQDshFM7OPo/?=
 =?us-ascii?Q?bue23naKg4hddnIS9GML5WOrhRmJbGwYnPa9CNdXILAaqX2S04qM/EGpHtiO?=
 =?us-ascii?Q?v4QzyG/Kgk/DtxT+NfNv5IEgYuF3yrQFE2rvAS4iQTlZJeNe5k77rJmK+HPR?=
 =?us-ascii?Q?uEMymTDi0zvnM2YsF36TgCbgZEHLdt2BYa+L6oAWQkkhH5lnVE6953UGui2m?=
 =?us-ascii?Q?X32vs/96kz6ad67IRLoMl38Eh03oS5GirLKyfvlHkaD5RxjC/VNc4o4vcI92?=
 =?us-ascii?Q?jMmPaTwKab2/3nZDgAd4qv2vl66oluMtv0Ay9hIN3/nfEnxUadvloCVG8XRe?=
 =?us-ascii?Q?Kgyhaa8QAubQejE6gWKQr5PtGDh7y5eVACc6zNPX2a+pm0s1GiY3P2x85jMs?=
 =?us-ascii?Q?CPyuGdm+QwjTdDiSZMRZ70SepDKk2vYbv9kLZn8EDZ3xD/a1cc603WCT1V3/?=
 =?us-ascii?Q?6laSEXcddQeIOOh1OaPRI/jAeZmMnYUkeRRR74PFSTEbvR9TL3yB76MMecmL?=
 =?us-ascii?Q?EJ3ODnQQDECx2gCjJ7aw3tz+LqaEgM/4XmNmA5CTWSbtAIPtxt3JKADK9pZK?=
 =?us-ascii?Q?3MhdNW/iQDyxa9UyaVo+lxLIXXfmtBeFuHNHEi+i7UsMTXw97JPGlV5zmzN0?=
 =?us-ascii?Q?oQZZcS1FnGVdyfs1J/c3/9QcSMY2HCcsEQkKzzv7jxalRCiJZJtK/4qJtHzp?=
 =?us-ascii?Q?2Z65q+9METOKPzLPtMjJ3bEdClnSbLD6QPILiJUzFDLawDoB1nRmjhQ4qBlc?=
 =?us-ascii?Q?ZTa96dfk6gAZJBvaE0hl8iA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e17c9030-a9e9-4736-69fe-08db5fe0c3b2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:05:16.4655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qLkPEFKAvHeR7Ooh1L+WoIhfQpgS93ATHQVhVTDsFd6RXNpP4hZsmBjC25bbmneMoQWTEOzcwHQzmjahUMoIgmRJdks3p3wmeR7H61S5Dpaa+Pwe+g2my2wbYo2SNeVh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7952
Message-ID-Hash: 4L6ZQRU7JD2T2ADJWYFQ2WKQYN3DO5IZ
X-Message-ID-Hash: 4L6ZQRU7JD2T2ADJWYFQ2WKQYN3DO5IZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4L6ZQRU7JD2T2ADJWYFQ2WKQYN3DO5IZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    | 20 ++---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |  6 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c     | 24 ++----
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    | 10 +--
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     | 10 +--
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 34 +++-----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 34 +++-----
 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 86 +++++++------------
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 86 +++++++------------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 48 +++++------
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 78 ++++++++---------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 60 +++++++------
 14 files changed, 204 insertions(+), 304 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 08ef109744c7..e71c23ebff62 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -222,7 +222,7 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.ops = &mt2701_cs42448_48k_fe_ops,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(fe_multi_ch_out),
 	},
 	[DAI_LINK_FE_PCM0_IN] = {
@@ -232,7 +232,7 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.ops = &mt2701_cs42448_48k_fe_ops,
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(fe_pcm0_in),
 	},
 	[DAI_LINK_FE_PCM1_IN] = {
@@ -242,7 +242,7 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.ops = &mt2701_cs42448_48k_fe_ops,
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(fe_pcm1_in),
 	},
 	[DAI_LINK_FE_BT_OUT] = {
@@ -251,7 +251,7 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(fe_bt_out),
 	},
 	[DAI_LINK_FE_BT_IN] = {
@@ -260,7 +260,7 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
 			    SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(fe_bt_in),
 	},
 	/* BE */
@@ -270,8 +270,6 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
 			 | SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_cs42448_be_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(be_i2s0),
 	},
 	[DAI_LINK_BE_I2S1] = {
@@ -280,8 +278,6 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
 			 | SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_cs42448_be_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(be_i2s1),
 	},
 	[DAI_LINK_BE_I2S2] = {
@@ -290,8 +286,6 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
 			 | SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_cs42448_be_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(be_i2s2),
 	},
 	[DAI_LINK_BE_I2S3] = {
@@ -300,15 +294,11 @@ static struct snd_soc_dai_link mt2701_cs42448_dai_links[] = {
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
index a184032c15b6..24fd522d2d37 100644
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
index 784c201b8fd4..daad9544a8d4 100644
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
diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index c2b0619b6158..02a7d1370731 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -105,7 +105,7 @@ static struct snd_soc_dai_link mt8173_max98090_dais[] = {
 		.stream_name = "MAX98090 Playback",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback),
 	},
 	{
@@ -113,7 +113,7 @@ static struct snd_soc_dai_link mt8173_max98090_dais[] = {
 		.stream_name = "MAX98090 Capture",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture),
 	},
 	/* Back End DAI links */
@@ -124,8 +124,6 @@ static struct snd_soc_dai_link mt8173_max98090_dais[] = {
 		.ops = &mt8173_max98090_ops,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(hifi),
 	},
 };
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index f803f121659d..2a22a14f686d 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -128,7 +128,7 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5514_dais[] = {
 		.stream_name = "rt5650_rt5514 Playback",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback),
 	},
 	[DAI_LINK_CAPTURE] = {
@@ -136,7 +136,7 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5514_dais[] = {
 		.stream_name = "rt5650_rt5514 Capture",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture),
 	},
 	/* Back End DAI links */
@@ -148,8 +148,6 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5514_dais[] = {
 			   SND_SOC_DAIFMT_CBS_CFS,
 		.ops = &mt8173_rt5650_rt5514_ops,
 		.ignore_pmdown_time = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(codec),
 	},
 };
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index 8794720cea3a..8866abee6e35 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -160,7 +160,7 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5676_dais[] = {
 		.stream_name = "rt5650_rt5676 Playback",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback),
 	},
 	[DAI_LINK_CAPTURE] = {
@@ -168,7 +168,7 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5676_dais[] = {
 		.stream_name = "rt5650_rt5676 Capture",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture),
 	},
 	[DAI_LINK_HDMI] = {
@@ -176,7 +176,7 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5676_dais[] = {
 		.stream_name = "HDMI PCM",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(hdmi_pcm),
 	},
 
@@ -189,14 +189,12 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5676_dais[] = {
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
index e05f2b0231fe..617f5dbfa6be 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -199,7 +199,7 @@ static struct snd_soc_dai_link mt8173_rt5650_dais[] = {
 		.stream_name = "rt5650 Playback",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback),
 	},
 	[DAI_LINK_CAPTURE] = {
@@ -207,7 +207,7 @@ static struct snd_soc_dai_link mt8173_rt5650_dais[] = {
 		.stream_name = "rt5650 Capture",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture),
 	},
 	[DAI_LINK_HDMI] = {
@@ -215,7 +215,7 @@ static struct snd_soc_dai_link mt8173_rt5650_dais[] = {
 		.stream_name = "HDMI PCM",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(hdmi_pcm),
 	},
 	/* Back End DAI links */
@@ -227,14 +227,12 @@ static struct snd_soc_dai_link mt8173_rt5650_dais[] = {
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
index 87bb04846991..848fcd5341bc 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -410,7 +410,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8183_da7219_max98357_ops,
 		SND_SOC_DAILINK_REG(playback1),
 	},
@@ -420,7 +420,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8183_da7219_max98357_bt_sco_ops,
 		SND_SOC_DAILINK_REG(playback2),
 	},
@@ -430,7 +430,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback3),
 	},
 	{
@@ -439,7 +439,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8183_da7219_max98357_bt_sco_ops,
 		SND_SOC_DAILINK_REG(capture1),
 	},
@@ -449,7 +449,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture2),
 	},
 	{
@@ -458,7 +458,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8183_da7219_max98357_ops,
 		SND_SOC_DAILINK_REG(capture3),
 	},
@@ -468,7 +468,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture_mono),
 	},
 	{
@@ -477,38 +477,32 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
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
@@ -517,7 +511,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 	{
 		.name = "I2S1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
@@ -526,7 +520,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 	{
 		.name = "I2S2",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_da7219_i2s_ops,
@@ -536,13 +530,13 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
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
@@ -555,7 +549,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_IB_IF |
 			   SND_SOC_DAIFMT_CBM_CFM,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ignore = 1,
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index ce9aedde7e1e..0a0aea9b5337 100644
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
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index cdf54d1eb50d..b71e4c4b896f 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -567,7 +567,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -580,7 +580,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback12),
 	},
 	{
@@ -589,7 +589,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -601,7 +601,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -614,7 +614,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback4),
 	},
 	{
@@ -623,7 +623,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback5),
 	},
 	{
@@ -632,7 +632,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback6),
 	},
 	{
@@ -641,7 +641,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback7),
 	},
 	{
@@ -650,7 +650,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback8),
 	},
 	{
@@ -659,7 +659,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture1),
 	},
 	{
@@ -668,7 +668,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -681,7 +681,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture3),
 	},
 	{
@@ -690,7 +690,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -703,7 +703,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture5),
 	},
 	{
@@ -712,7 +712,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -724,7 +724,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture7),
 	},
 	{
@@ -733,8 +733,6 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_lpbk),
 	},
@@ -744,8 +742,6 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_fm),
 	},
@@ -755,8 +751,6 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_src1),
 	},
@@ -766,8 +760,6 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_src_bargein),
 	},
@@ -777,7 +769,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_hw_gain_aaudio),
 	},
@@ -787,8 +779,6 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_src_aaudio),
 	},
@@ -796,8 +786,6 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 	{
 		.name = "Primary Codec",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		.init = mt8186_mt6366_init,
 		SND_SOC_DAILINK_REG(adda),
@@ -808,7 +796,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_IB_IF |
 			   SND_SOC_DAIFMT_CBM_CFM,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.init = mt8186_mt6366_da7219_max98357_hdmi_init,
 		.be_hw_params_fixup = mt8186_anx7625_i2s_hw_params_fixup,
@@ -817,7 +805,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 	{
 		.name = "I2S0",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8186_i2s_hw_params_fixup,
 		.ops = &mt8186_da7219_i2s_ops,
@@ -826,7 +814,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 	{
 		.name = "I2S1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8186_i2s_hw_params_fixup,
 		.init = mt8186_da7219_init,
@@ -836,7 +824,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 	{
 		.name = "I2S2",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8186_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s2),
@@ -844,39 +832,31 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
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
@@ -885,15 +865,13 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
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
@@ -901,35 +879,35 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
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
@@ -937,25 +915,25 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
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
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 7538274641fd..523fe18cf904 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -635,7 +635,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -648,7 +648,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback12),
 	},
 	{
@@ -657,7 +657,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -669,7 +669,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -682,7 +682,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback4),
 	},
 	{
@@ -691,7 +691,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback5),
 	},
 	{
@@ -700,7 +700,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback6),
 	},
 	{
@@ -709,7 +709,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback7),
 	},
 	{
@@ -718,7 +718,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback8),
 	},
 	{
@@ -727,7 +727,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture1),
 	},
 	{
@@ -736,7 +736,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -749,7 +749,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture3),
 	},
 	{
@@ -758,7 +758,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -771,7 +771,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture5),
 	},
 	{
@@ -780,7 +780,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -792,7 +792,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture7),
 	},
 	{
@@ -801,8 +801,6 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_lpbk),
 	},
@@ -812,8 +810,6 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_fm),
 	},
@@ -823,8 +819,6 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_src1),
 	},
@@ -834,8 +828,6 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_src_bargein),
 	},
@@ -845,7 +837,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_hw_gain_aaudio),
 	},
@@ -855,8 +847,6 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_src_aaudio),
 	},
@@ -864,8 +854,6 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 	{
 		.name = "Primary Codec",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		.init = primary_codec_init,
 		SND_SOC_DAILINK_REG(adda),
@@ -876,7 +864,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_IB_IF |
 			   SND_SOC_DAIFMT_CBM_CFM,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.init = mt8186_mt6366_rt1019_rt5682s_hdmi_init,
 		.be_hw_params_fixup = mt8186_it6505_i2s_hw_params_fixup,
@@ -885,7 +873,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 	{
 		.name = "I2S0",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8186_i2s_hw_params_fixup,
 		.ops = &mt8186_rt5682s_i2s_ops,
@@ -894,7 +882,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 	{
 		.name = "I2S1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8186_i2s_hw_params_fixup,
 		.init = mt8186_rt5682s_init,
@@ -904,7 +892,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 	{
 		.name = "I2S2",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8186_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s2),
@@ -912,39 +900,31 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
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
@@ -953,15 +933,13 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
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
@@ -969,35 +947,35 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
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
@@ -1005,25 +983,25 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
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
index 919d74ea1934..224a376680a2 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -435,7 +435,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback2),
 	},
 	[DAI_LINK_DL3_FE] = {
@@ -446,7 +446,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback3),
 	},
 	[DAI_LINK_DL6_FE] = {
@@ -457,7 +457,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback6),
 	},
 	[DAI_LINK_DL7_FE] = {
@@ -468,7 +468,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback7),
 	},
 	[DAI_LINK_DL8_FE] = {
@@ -479,7 +479,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback8),
 	},
 	[DAI_LINK_DL10_FE] = {
@@ -490,7 +490,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback10),
 	},
 	[DAI_LINK_DL11_FE] = {
@@ -501,7 +501,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback11),
 	},
 	[DAI_LINK_UL1_FE] = {
@@ -512,7 +512,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture1),
 	},
 	[DAI_LINK_UL2_FE] = {
@@ -523,7 +523,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture2),
 	},
 	[DAI_LINK_UL3_FE] = {
@@ -534,7 +534,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture3),
 	},
 	[DAI_LINK_UL4_FE] = {
@@ -545,7 +545,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture4),
 	},
 	[DAI_LINK_UL5_FE] = {
@@ -556,7 +556,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture5),
 	},
 	[DAI_LINK_UL6_FE] = {
@@ -567,7 +567,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture6),
 	},
 	[DAI_LINK_UL8_FE] = {
@@ -578,7 +578,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture8),
 	},
 	[DAI_LINK_UL9_FE] = {
@@ -589,7 +589,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture9),
 	},
 	[DAI_LINK_UL10_FE] = {
@@ -600,15 +600,13 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture10),
 	},
 	/* BE */
 	[DAI_LINK_ADDA_BE] = {
 		.name = "ADDA_BE",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = mt8188_mt6359_init,
 		SND_SOC_DAILINK_REG(adda),
 	},
@@ -617,7 +615,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.ops = &mt8188_dptx_ops,
 		.be_hw_params_fixup = mt8188_dptx_hw_params_fixup,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(dptx),
 	},
 	[DAI_LINK_ETDM1_IN_BE] = {
@@ -626,7 +624,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(etdm1_in),
 	},
@@ -636,7 +634,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(etdm2_in),
 	},
 	[DAI_LINK_ETDM1_OUT_BE] = {
@@ -645,7 +643,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(etdm1_out),
 	},
 	[DAI_LINK_ETDM2_OUT_BE] = {
@@ -654,7 +652,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(etdm2_out),
 	},
 	[DAI_LINK_ETDM3_OUT_BE] = {
@@ -663,7 +661,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(etdm3_out),
 	},
 	[DAI_LINK_PCM1_BE] = {
@@ -672,8 +670,6 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(pcm1),
 	},
 };
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 5e163e23a207..cedf838249aa 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -689,7 +689,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback1),
 	},
 	{
@@ -698,7 +698,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback12),
 	},
 	{
@@ -707,7 +707,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback2),
 	},
 	{
@@ -716,7 +716,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8192_mt6359_rt5682_ops,
 		SND_SOC_DAILINK_REG(playback3),
 	},
@@ -726,7 +726,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback4),
 	},
 	{
@@ -735,7 +735,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback5),
 	},
 	{
@@ -744,7 +744,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback6),
 	},
 	{
@@ -753,7 +753,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback7),
 	},
 	{
@@ -762,7 +762,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback8),
 	},
 	{
@@ -771,7 +771,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback9),
 	},
 	{
@@ -780,7 +780,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8192_mt6359_capture1_ops,
 		SND_SOC_DAILINK_REG(capture1),
 	},
@@ -790,7 +790,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8192_mt6359_rt5682_ops,
 		SND_SOC_DAILINK_REG(capture2),
 	},
@@ -800,7 +800,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture3),
 	},
 	{
@@ -809,7 +809,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture4),
 	},
 	{
@@ -818,7 +818,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture5),
 	},
 	{
@@ -827,7 +827,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture6),
 	},
 	{
@@ -836,7 +836,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture7),
 	},
 	{
@@ -845,7 +845,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture8),
 	},
 	{
@@ -854,7 +854,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture_mono1),
 	},
 	{
@@ -863,7 +863,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture_mono2),
 	},
 	{
@@ -872,7 +872,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture_mono3),
 	},
 	{
@@ -881,15 +881,13 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
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
@@ -897,29 +895,27 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
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
@@ -927,7 +923,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s1),
@@ -935,7 +931,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S2",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s2),
@@ -943,7 +939,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S3",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s3),
@@ -951,7 +947,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S5",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s5),
@@ -959,7 +955,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S6",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s6),
@@ -967,7 +963,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S7",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s7),
@@ -975,7 +971,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S8",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.init = mt8192_rt5682_init,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
@@ -985,7 +981,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "I2S9",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s9),
@@ -994,23 +990,19 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
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
@@ -1020,7 +1012,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_DSP_A |
 			   SND_SOC_DAIFMT_IB_NF |
 			   SND_SOC_DAIFMT_CBM_CFM,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		.ignore = 1,
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index ceca882ecff7..f349ba27b9d0 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1025,7 +1025,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_playback_ops,
 		SND_SOC_DAILINK_REG(DL2_FE),
 	},
@@ -1037,7 +1037,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_playback_ops,
 		SND_SOC_DAILINK_REG(DL3_FE),
 	},
@@ -1049,7 +1049,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_playback_ops,
 		SND_SOC_DAILINK_REG(DL6_FE),
 	},
@@ -1061,7 +1061,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(DL7_FE),
 	},
 	[DAI_LINK_DL8_FE] = {
@@ -1072,7 +1072,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_playback_ops,
 		SND_SOC_DAILINK_REG(DL8_FE),
 	},
@@ -1084,7 +1084,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_hdmitx_dptx_playback_ops,
 		SND_SOC_DAILINK_REG(DL10_FE),
 	},
@@ -1096,7 +1096,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_playback_ops,
 		SND_SOC_DAILINK_REG(DL11_FE),
 	},
@@ -1108,7 +1108,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(UL1_FE),
 	},
 	[DAI_LINK_UL2_FE] = {
@@ -1119,7 +1119,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_capture_ops,
 		SND_SOC_DAILINK_REG(UL2_FE),
 	},
@@ -1131,7 +1131,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_capture_ops,
 		SND_SOC_DAILINK_REG(UL3_FE),
 	},
@@ -1143,7 +1143,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_capture_ops,
 		SND_SOC_DAILINK_REG(UL4_FE),
 	},
@@ -1155,7 +1155,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_capture_ops,
 		SND_SOC_DAILINK_REG(UL5_FE),
 	},
@@ -1167,7 +1167,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(UL6_FE),
 	},
 	[DAI_LINK_UL8_FE] = {
@@ -1178,7 +1178,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_capture_ops,
 		SND_SOC_DAILINK_REG(UL8_FE),
 	},
@@ -1190,7 +1190,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_capture_ops,
 		SND_SOC_DAILINK_REG(UL9_FE),
 	},
@@ -1202,7 +1202,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_capture_ops,
 		SND_SOC_DAILINK_REG(UL10_FE),
 	},
@@ -1210,13 +1210,13 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
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
@@ -1227,7 +1227,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(ETDM1_IN_BE),
 	},
 	[DAI_LINK_ETDM2_IN_BE] = {
@@ -1236,7 +1236,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.init = mt8195_rt5682_init,
 		.ops = &mt8195_rt5682_etdm_ops,
 		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
@@ -1248,7 +1248,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_rt5682_etdm_ops,
 		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM1_OUT_BE),
@@ -1259,7 +1259,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ETDM2_OUT_BE),
 	},
 	[DAI_LINK_ETDM3_OUT_BE] = {
@@ -1268,7 +1268,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ETDM3_OUT_BE),
 	},
 	[DAI_LINK_PCM1_BE] = {
@@ -1277,48 +1277,46 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
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
-- 
2.25.1

