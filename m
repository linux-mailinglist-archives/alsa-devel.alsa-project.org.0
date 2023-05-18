Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 138AB7079D6
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:50:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FDF67F1;
	Thu, 18 May 2023 07:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FDF67F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684389033;
	bh=8jMztwyRwd+lRhOw/Ajg1Tivj5TkIUZMFJ41RlmjPLE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eKgIB9hEZH6yztNZSpg1eqqm81yH1EfVDHwvzvehYIJArxCtoyFPVS6zQ8JnRvbVr
	 XK99PElppTCWvSIDk5xIJrvUN3n7Du4YMEJmZL8apyYOm/bR/EuilhyjC2JiwfRY08
	 SVroYtY6fQY5QmoULD6ApIK4zB+irqfAsyzBGoDw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06020F80557; Thu, 18 May 2023 07:48:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51F28F80549;
	Thu, 18 May 2023 07:48:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCF63F805D8; Thu, 18 May 2023 07:47:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56DEAF805C6
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56DEAF805C6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gptSLUes
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLAspwHG9a9U+dx22LqxzIGYvza09TXWRoM/yc3kh744kxf4DZBrehb/X5HziA9Ep236eA4/ozXqKXV4FfNAsIBp7DQmx/B4/PwTpD7+EcUZ1LvwmQHO3PXAlEBo7oRvJo+hqc4WOmyjayZhKxDgvI/kzDdOSOyGeDcxFA29+8wvvmweCg0Od52I3VztivMizrP+3wHrxrPYKwa09DcRwgfHbmzmu7y+1YInKT2CwlB5E5MJdxNAAcit/AgfMkkP1/mOGGG9mkqPHl+sUKi0/Tne3Wj05xwMpJROAZTzAEG4cEfAf4C3WVqjGaSTn0vDfSHGqoHMDJhKhMTjsyOAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=md0Fm1eajLDgX1+Cl2L1J8rabgMiGhtyYADTrQZisW8=;
 b=cFHU27/2AgaAvahLz6p9QIZkXrrCLQYg+zTyiV+4nyotNkVgtncW1m4ETtzyL95h/t0ygPc2p0umqN3PtwERkZrmahsus2qM0ThRezwcNayVxbf0W/6LkWJod6bjUfEWPmWN+M3ttaXNcrl5HdoSROGxlWuj0KIPCh4x+pEAkdcJohcGkumUBYyKzmYo1PW9RhtskNb/L6yG2IfFOy2ZdmSwToISTcfk8poqcROW3VO4G6yrP8lb62JsATfGtKfH6JE9gTVNEZCV2mSijQvUayA+YjKnp+1iRJwgMpWOKu5PiEmql6MqFuAOPGfJ9qy4d0XlArGWdCSaIx3GSMWR0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md0Fm1eajLDgX1+Cl2L1J8rabgMiGhtyYADTrQZisW8=;
 b=gptSLUesQWoAeoOBxsWxtr8Z4KIu36q/1WqFAkQPiy6EThxFGXARCreYIKkkcxuwsm+atRR0Iq38PzFTs3sZ2mPRP8T1k7e9MsiusFUEZyDCppflFRXrQjEP8GaF48X5YPKFbrZhVF9GR2shOqhBr6dN3DEtFvT+dGd9xI/xeFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5591.jpnprd01.prod.outlook.com (2603:1096:604:b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:47:44 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:47:44 +0000
Message-ID: <87pm6yp4w0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Lucas Tanure <lucas.tanure@collabora.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/20] ASoC: amd: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:47:44 +0000
X-ClientProxiedBy: TYCP286CA0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: c4fbd35d-753b-4454-1c27-08db576366f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VjcgUxWxoj5UOGX0+fukEDHHvXStENiIeYHPIyYvzMTdWVWVfKF94tzBtJUweWh7Fm9PIrs3DrN6XHcdAEr72BOTbX6OaVhA1x6hZ8uumeYBMiEyEjQysurvk4sPrTIg4tccrEBFBUrEgzEbzrIJvse0sFHzCfPMufneqb5S+10vtuvvkWEH6QHsCqje4leIFMiPS5parXZcNI93zz6pcL6m0xFDoLBCZTf9xGZenIwFmne+xy911DXOuYp3O5v3Zt1FGWiEffD9R4BzwwtNo72k453u0nuFd37rsXocIJNdWQi04DrOehuvQ7pMetkiQ9In9CjNDVLYRoSLmzlGrXrXGPTSQ6qhdl5TPVtjZHehb6GiQQ+zFDOzIwL5EPGFZo1/Ek8Rfxg9ZDo7rPCIaJl51ggzuvqSuspCpjPmORsZQlRrTW5eFZlmNl2SN3/eFCXyqU+0KVydg9jpkTclTuq9FZLmO55WAcNpdsFzZrFCnt6ftmvGEmd642k0JSbUSYpLY0dQk2hVfKUV7tqrEZyhVnikgwcPyFH7Q0O0Jh2/MoQtsQD4tigTefybqlwhsfnaQje8+wZQOKFNP8IGfHuCg3/0BqrW8QfqxVLSU53KCuX7J/JW0YhraAbClSI/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(316002)(4326008)(66946007)(66556008)(478600001)(66476007)(52116002)(110136005)(86362001)(36756003)(83380400001)(6506007)(26005)(6512007)(186003)(2616005)(41300700001)(6486002)(30864003)(5660300002)(8676002)(8936002)(2906002)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0SExEbb1dpr0SlL4AxgPuAzhR9zH2rZIYLg70i5alkQHsYiMkLki9TzKXM8o?=
 =?us-ascii?Q?2nSK2885L8D2/Ih2I8KNg+fmCiO/wPTDDv8Ob6DfLuK8NpmOvuXcUGLhLD7z?=
 =?us-ascii?Q?k7dvMNp3Iy2wl6VpTe6mS5LWgpGyXAhlFCA6UOvH72Xfr7Q2+eLsFEmPlpiU?=
 =?us-ascii?Q?rtpE3+i7wYoYavBjlg/mfaFvlnXbnK6+wc8csO0OUH/evoS+WFa0dIZv4I88?=
 =?us-ascii?Q?XGO+DXERtZu84EymhXrCTRBJnaZI+NwcQGqburoKNnygQk2ZHpKUGcMi5W/2?=
 =?us-ascii?Q?EXWF3tfPnRW+RN8ntO71qVF/ncX0+NtdsqICT2Y9s6TIGF5xgMY7Kl8ZmFmq?=
 =?us-ascii?Q?sjQSzqzECA9ADUPUuJ6RWByc++iSuoVedEFhU9QgXyTxmDob0Vh9VLA/3wkJ?=
 =?us-ascii?Q?jb0qO34OKHPetyVT00s1NXQ8f7TnENup2EVel0cj4eKLE0omAyNohaZYh/6c?=
 =?us-ascii?Q?CNG2hoeqY0J4bBt1Eijytt/8ZXPlkyM84/9qdyLDXDmVIrwt8/fklr0Br5nH?=
 =?us-ascii?Q?kjFW4E4BgH0Pcu9U0dTBvx5wGkfRD5OCkCOQYIfrM8WyrHB/vpFMnBo5gYek?=
 =?us-ascii?Q?b+DY6szzty1kz7F0PPD8AGjyLe/w+iBreOegYpSQEnwBfzCL5DEmf1RVv3nZ?=
 =?us-ascii?Q?kphCMV3eW+FN0zoqIe/IXPtCnPc6RHDYb+UX027csJLrPclCTtyOs/CwHM2J?=
 =?us-ascii?Q?TLui88D4jh7VHqtn9vZP64uDD24VpjBGa/6rttkTZU5AIQ1BXKcPL9njGC2t?=
 =?us-ascii?Q?oVCmc2ZClsvhJKHM7P7ln3F91sHZMTTgV1GHnx8hB6pCMWnZLc9da5AG9hbr?=
 =?us-ascii?Q?CkiM8gTFcb39VX8TaUQFFVpi69TJ5aaY0GwM981nM3Lkc0hl9hMvphm68Iqi?=
 =?us-ascii?Q?hp3yyjlYP12FcDBKyMw9R3QNiExTkCUs7schiQhCw35wyB57aR9fJSqEqC2N?=
 =?us-ascii?Q?RLIHFFbC7nhPLmVq/owd5YInbO6o6SI3x5t/rOK7bJWH5r0eMcHS7P3iYgxQ?=
 =?us-ascii?Q?TfALM2R9+MT4rXUg1vZ/xvGfACzJQKYbnpaMgRrOso41cLgyGpXgE7vb5mgj?=
 =?us-ascii?Q?C2Dt2zmGYHtfXmednrttaiIFmRNlPViO3c+Orxa7f2+AAVBw3QOJBWdRFtrW?=
 =?us-ascii?Q?X+mLLGy8XxkcEvpoR4fN1YsmGdAmHVeTfk5DSCpj/PLnVauaTVGcH7XvEipw?=
 =?us-ascii?Q?BENAzSIqCWx04SNLgZMvRd1sO+Tz3hLHneOIMlSKpPJJWW/5SjadZyceHaL0?=
 =?us-ascii?Q?faSxGTv6FyRsjB0/1S9tljVFO0kAb3OE7RU5xf5rcho/lRNc+Nmo1tF/la4o?=
 =?us-ascii?Q?TJXuhGlp+HNlOTey9pS785l7UQJpiHlqnjZ85NmjKrxwR1HDcm1+I21v9AxK?=
 =?us-ascii?Q?B401HPasj9Qztr4DRy/L9Ic8woEFOZJICBH6rDPXilvud8g7BeTeSubiNacu?=
 =?us-ascii?Q?a5hWycmCcOU5hoP58k0J09WJeSPiwNSLeGFURQOWQzk2ZJbpkdYfoY1IFFQy?=
 =?us-ascii?Q?AxwyOdUAkzJGIqaJ5vA979jLuoybwqSebU8WzXUZ1jrmwQjOAVeyiYlsI7YJ?=
 =?us-ascii?Q?PAntrmV3Tmm4Jsa3X07alT5ignjRxDt6PRvz+3yhmj5sMV0pePWX272SnuZI?=
 =?us-ascii?Q?O9+25Q7pIcQTdzDcv459NOQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c4fbd35d-753b-4454-1c27-08db576366f8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:47:44.5077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mWokAfuLDDXYs2clXIQxk1Ot6V9iqCXHKrMytn5JZGUhDq9LAdFJQ/W9aSQg9ParLyKYwNjiugbalBxfdmkbk5w6lNFoBHAuJpDLe/3X01T/MiNlkd7C/xhhEXj0EEeE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5591
Message-ID-Hash: 44RMWSHCTDXYYZ6KUMI2ILAF7M5KXU4H
X-Message-ID-Hash: 44RMWSHCTDXYYZ6KUMI2ILAF7M5KXU4H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/44RMWSHCTDXYYZ6KUMI2ILAF7M5KXU4H/>
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
 sound/soc/amd/acp-da7219-max98357a.c | 20 ++++++++++----------
 sound/soc/amd/acp-es8336.c           |  2 --
 sound/soc/amd/acp/acp-mach-common.c  | 20 ++++++--------------
 sound/soc/amd/acp3x-rt5682-max9836.c |  6 ++----
 sound/soc/amd/vangogh/acp5x-mach.c   |  3 ---
 5 files changed, 18 insertions(+), 33 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 375417bd7d6e..7b20c25388ac 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -523,7 +523,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_da7219_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_da7219_play_ops,
 		SND_SOC_DAILINK_REG(designware1, dlgs, platform),
@@ -533,7 +533,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_da7219_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, dlgs, platform),
@@ -543,7 +543,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -554,7 +554,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -565,7 +565,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
@@ -579,7 +579,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_rt5682_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_rt5682_play_ops,
 		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
@@ -589,7 +589,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_rt5682_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
@@ -599,7 +599,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_rt5682_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -610,7 +610,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_rt5682_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -621,7 +621,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_rt5682_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index 89499542c803..982db7d9cd17 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -150,8 +150,6 @@ static struct snd_soc_dai_link st_dai_es8336[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.stop_dma_first = 1,
-		.dpcm_capture = 1,
-		.dpcm_playback = 1,
 		.init = st_es8336_init,
 		.ops = &st_es8336_ops,
 		SND_SOC_DAILINK_REG(designware1, codec, platform),
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 6da17140beea..3df2f7733b32 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -899,8 +899,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_sp);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -930,8 +928,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -961,7 +957,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_sp_virtual);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -993,7 +989,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs_virtual);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1027,7 +1023,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_dmic);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 	}
@@ -1065,8 +1061,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &asoc_dummy_dlc;
@@ -1099,8 +1093,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &asoc_dummy_dlc;
@@ -1128,7 +1120,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &asoc_dummy_dlc;
@@ -1163,7 +1155,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &asoc_dummy_dlc;
@@ -1207,7 +1199,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
 		links[i].ops = &acp_card_dmic_ops;
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 	}
 
 	card->dai_link = links;
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 0543dda75b99..154170f353ec 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -304,8 +304,6 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = acp3x_5682_init,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp3x_5682_ops,
 		SND_SOC_DAILINK_REG(acp3x_i2s, rt5682, platform),
 	},
@@ -314,7 +312,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &acp3x_max_play_ops,
 		.cpus = acp3x_bt,
 		.num_cpus = ARRAY_SIZE(acp3x_bt),
@@ -326,7 +324,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "Capture DMIC0",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &acp3x_ec_cap0_ops,
 		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
 	},
diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index e5bcd1e6eb73..9d8bb9c0efe5 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -273,8 +273,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -285,7 +283,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_cs35l41_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, cs35l41, platform),
-- 
2.25.1

