Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E5C888D15
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 05:38:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FEFA1060;
	Mon, 25 Mar 2024 05:38:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FEFA1060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711341530;
	bh=Zr2nPZ/+8LCSEECFB/J4a3fcdC+gVbn/54FeE584ahQ=;
	h=To:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hmrJ0EOgT75+l/rTcEkDortkLavcMJ7AZy4IGBB/CibiYgy03RgrGZd15lh4kGlH0
	 1ID4jKscmgUqLmGeTiGNY2z+egGeCp/oE22/PcO3JKjTZkqlFuKhUltgCCLei63cYR
	 mNcdkDt5LlYbLjpSW57eUSGuwepil4s7HECbmOOk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D0B3F80580; Mon, 25 Mar 2024 05:38:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81641F8058C;
	Mon, 25 Mar 2024 05:38:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79E71F80236; Mon, 25 Mar 2024 05:36:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8487DF80074
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 05:35:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8487DF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=TCccBGko
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fksZZ2ZpjO8kF5+Dn3fCh/2hvd35BedCIMyVHzMkNdQAV7UCCJIIPzlgriOx0u0a0tiNdcOIv/ngIATjm1tKHvmJWHzixZnoUXSDZrkj8JRoF0DbH290gLs2vOyt1oADmCKjKn5+YFG/EkhkqEwvOvrPgGQg6xobf5qdZTVn9GIC4VLAVUGz0FTt1T5spEhVxID1ode/EofyVaCQYN6/AVoPpm4QmezxHphNpeZ4ghA8EG1KCLw5qyyAxavvMvTmHaR7/xg9/vTggvtaNuX3D2DIbTWmugsdvaUeW7CxdYQLQQx4Yd6/uHzEXDB9eVPoFHWHF3QFTiMSjiGUE4U0LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ivvTZ3DSaAbYHKeV10W6H4zjQ0i4JMJzscVG4DQ+3I=;
 b=AtDyNWli4FkyhSKXIFPK07xKOCjPicI4L5TCJqEb7cuMPDQZcNw6i1hs07LPiQlmzdeQSSPMAOgITB2FGwGvD8qvZddxgpAKXsrLMgj767MjxEwDix5al6tZ2zlq4OXI69J8vHo1+n2hQgMazP4R1ucMp1vaRX1guZnliscgCVUOO/+j6oPO6suQV/lCKhl7FE+hTXeaogZInUzYvuLzBrRh94bFJNEV0pyhLPrnEszo3fDMqneY8hNYHni9ABbgV1T0CnhWoNKfRwVfCkXC7l4wu+Vcp2TvUQOWibLNicSrE8tcW5AVBL6EBD2yK5t2qpTJcku954hlvxYLjdBrwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ivvTZ3DSaAbYHKeV10W6H4zjQ0i4JMJzscVG4DQ+3I=;
 b=TCccBGko6qLciHXZtdjEifOFcvrr/GxuV/4jBwkDOSsT1xNRp254QO5RgNQ961fmmNpgWrAY6e+Sd0nzbIdrNx8X3xashSlKNNhzr1tz6hckfe6xOkIj8+QBtpizdFZGgRfqj6Pxz3BaFlulVIw0+O4tb6iGEfnX+UqQ0Wcx6v0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10698.jpnprd01.prod.outlook.com
 (2603:1096:400:296::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 04:35:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 04:35:45 +0000
Message-ID: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
 Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Jaroslav
 Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Kevin Hilman <khilman@baylibre.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Trevor Wu
 <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Xiubo Li
 <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/15] ASoC: replace dpcm_playback/capture to
 playback/capture_only
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 04:35:45 +0000
X-ClientProxiedBy: TYAPR01CA0202.jpnprd01.prod.outlook.com
 (2603:1096:404:29::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10698:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f86deb-99ba-4a72-fda4-08dc4c850971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	32TQN0hedUjRDYVlXAT3jmzqc7R1UdBCf1EjBgkm13RhkYzzaCKGaP+rJULoA19EDbEbWwdBo9OWMVDPjdSj/0xQgvPsCQBXHpC+dI7js/ydshStq9z8W36LNo7WXHEtUDTOkjQvqknrNhgLDh63ZRlpN6uVsJ6uKcgweREZOOIhEkTvZGJssOPp3kr0GD0+1dDKtrgcVwhzIw7t1UqNOky7IbLUdM1Sh6TuaxowTWqIKXSwt4RFTaike2RMrt3sIwz/2WCzDEiRib0f2fNF+40zTRybOpLTFp30XBDDiEUeOu63ABv3VTxYS03CMfGmqnwq/2S7Cf6ZZNFXnpozq8+nmOLrO6iUboSbGNrL76d5EWpPnsdz1c0IJQVwq9Fu0zCIljp8ADlkCsSywLbqZJUdpv6gmwMiXacVcViKDGAqBsDHSKLgYRMhgW0vnp4c0N8UYjaoX1ipyaXTR643YAAsSRAEUMfuuumyfBimffvmFiFM4KVwaPtTxo48RAZOIx1xEVSW/v/3j8FrN8YJHRzRcroqyWAOPVEYkRBqsZ31egr8BeED2ORiQ20ZTSTZ6rT5xd7aN3WTrfNKHoAE0+U6LWza3cq2H9XytWqZK0utCFI0AN5CJqVA+/+afXWAIHRQF+0Su69/TSog0brRw3obvQaxDtY2tlvXO/30sJWHnlAxEbZ9ni0UaFTbsg/5ElghHVAvU5OV/AlzfTHnb/B9PiCObFVWUaKi5/PqxXA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IrblTj5P7wx6mm/EEIOa5H5K02E0+so2OFLlaSWnkkcC94B9CDuzg8RHwR4R?=
 =?us-ascii?Q?fSNMf+Uwn581wzkBDmji23fB+WjwxSs3ZzL4cRrTwd8xqqsSUH64VjGRfSEH?=
 =?us-ascii?Q?CnZMK6SYoygwj7+GHTaeBnZe+ua/nbpJRefc65ZdzCsAeVBGVWhM494yB3ED?=
 =?us-ascii?Q?WDWb+XOY8tKzHvl8OKCUT/j2Ww8mcTkQybnrzk/pNYbtm3znZpjvJ0jZeG70?=
 =?us-ascii?Q?LpEQ3qBt8+7jsWocywKMUTeGb0+wqR6VpwKnsI+t0F4FSttfFvqyBlchbJF4?=
 =?us-ascii?Q?5mV00vDcEDLMDwYPVTyWMDyNtjqqEG0bs2YPppxY5W+mOr1p3sm2D9YgauwU?=
 =?us-ascii?Q?lbUMsLfzSN4lmarS52T4zI/JojlEhLX7CpElkuuOgO2Fqf9VaE8Xe3xY5+s5?=
 =?us-ascii?Q?VgWr6WQG44pte0EFNm2px9cM7Al8da9i1X2rJsk1pDPOfaKHsf7yXwiYo9iB?=
 =?us-ascii?Q?l8gCr9uVIBKfaFY/mLgXj3k35qYtHehIuhvMTKDXIGHImDBUfCcKbZYxQT4J?=
 =?us-ascii?Q?hkoolNR5EglgtaOr0WDQAZC9U+tFDOS4FBoUr+Ow3jhpCrYOvziou37Ghc7Y?=
 =?us-ascii?Q?b046lEl5qEpFMgG3ASpcGZ6ftR3Z6pl7W96L/tAxQSnDDkBiiAO2mDFUkU1J?=
 =?us-ascii?Q?GMLKRsn2IDvcQYG0BLuFObsy/NCEh54KXGRjgpBp5AmDA8TNwkW6+OLTPW5i?=
 =?us-ascii?Q?WqDshx2bgijK2IBw+ucGHlWgpddvnM6zQND7u0B1ki1DqjvrwnFpPlUcoWVB?=
 =?us-ascii?Q?4D54xVfYFTaI0iJS01sbUm4BxfMeMaDZhHuGzLLEuIsHKh6QBKe9pk4lWm3E?=
 =?us-ascii?Q?UrvMGM/fQNgMg73oFZWNf02poGPon8W2kNKYoqwRUi/AqhTg3O+pUgmJqlfd?=
 =?us-ascii?Q?kcgTrYEXkPvqqqShVqDFYNBazPctr7ukZjCPxhB/Gh5FCQpCJKW5P+SnmTaX?=
 =?us-ascii?Q?EvW6Lq0kCkhIwquzkgJRSdaLGnBd3XWlUyzU2Dr7dkTGOGuWUJKxUKtjFmT7?=
 =?us-ascii?Q?tcu6TiBDXN7fTWo/T/EEgXFucheJVfu3Ihu2nABEOXKtoWSaywRGkfmfnt44?=
 =?us-ascii?Q?Tz4v8qc10F/qeREwrNWGAgb/LBtUrKyYB0vHupMiz4O1LkJ1VnkTB4O3Q5kV?=
 =?us-ascii?Q?5X401/mHtn+/CPW1H5IhEhUHlBoFSBGzRjxQ2Zy3WPMVS4gq67nLtdQ3vhbr?=
 =?us-ascii?Q?ZcqYajjprHnrxH2cQo1TSFOhReT8XUc6tkkiN+gtzMIFUmy+k8Q4amNedQ91?=
 =?us-ascii?Q?+LettbptB2auhzsyag60+BT0J0R5NfPb/rdIzzvpr7Iyz4qarHNa4JzfRojb?=
 =?us-ascii?Q?bkNoOE0muwT0TwRMjBoLWuGQS0fLJx3DBP7wu3Tb6UllFiTP5DDNGs0eaFq6?=
 =?us-ascii?Q?8Fl7HY63aX2sxkIKutbtMTksfxYijNYwcMTEAH7FcwsANiuabEdYfNME9eIW?=
 =?us-ascii?Q?Ac9YZxwCCBnOueVt4qoVOcCtAgu1wQmtm/NOclc5uyoLot7nEEmMk5q1EkGB?=
 =?us-ascii?Q?/Jbx0NEqfPqM9MthimDhAE7hPFsfETjIxV4RvgaM3kFI2jvrOntO4lTgNsQQ?=
 =?us-ascii?Q?hrmb7Bnkc4yX92wAkrIaWtz3hBbF7SXRftC1OBb0WXTJTYG3F1trduD70SQ5?=
 =?us-ascii?Q?BDoniq0J9m8n1ZYay4JcmnE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b0f86deb-99ba-4a72-fda4-08dc4c850971
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:35:45.3851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yb2ZsEu21k1TiexFqDuYz6U+2rah67Zxl4v/zsqbJ65RGTfcpfRlRt4tQDzfUJYVbijpjIV1VzXRZkU6SxN6ub0oMLCfM3HH61S7xxB7mi/uCiDGkY0gbYQE0vOSSBpG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10698
Message-ID-Hash: YSX5AQKQQPFWN3XZUVICDDPC5XOBK44V
X-Message-ID-Hash: YSX5AQKQQPFWN3XZUVICDDPC5XOBK44V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSX5AQKQQPFWN3XZUVICDDPC5XOBK44V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

When we use DPCM, we need to set dpcm_playback/capture flag.
If these flag are set, soc_get_playback_capture() will check its
availability, but non DPCM case is checked without special flags.

OTOH, it cares playback/capture_only flag. It is needed.

This patch remove DPCM special flag, and replace it playback/capture_only
flag if needed.

Kuninori Morimoto (15):
  ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
  ASoC: amd: replace dpcm_playback/capture to playback/capture_only
  ASoC: fsl: replace dpcm_playback/capture to playback/capture_only
  ASoC: sof: replace dpcm_playback/capture to playback/capture_only
  ASoC: meson: replace dpcm_playback/capture to playback/capture_only
  ASoC: Intel: replace dpcm_playback/capture to playback/capture_only
  ASoC: samsung: replace dpcm_playback/capture to playback/capture_only
  ASoC: mediatek: replace dpcm_playback/capture to playback/capture_only
  ASoC: Intel/avs: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-core.c: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-topology.c: replace dpcm_playback/capture to playback/capture_only
  ASoC: soc-compress.c: replace dpcm_playback/capture to playback/capture_only
  ASoC: remove snd_soc_dai_link_set_capabilities()
  ASoC: soc-pcm.c: remove dpcm_playback/capture
  ASoC: soc-pcm: indicate warning if DPCM BE Codec has no settings

 include/sound/soc-dai.h                       |  1 -
 include/sound/soc.h                           |  4 -
 sound/soc/amd/acp-da7219-max98357a.c          | 20 ++---
 sound/soc/amd/acp-es8336.c                    |  2 -
 sound/soc/amd/acp/acp-mach-common.c           | 24 ++---
 sound/soc/amd/acp3x-rt5682-max9836.c          |  6 +-
 sound/soc/amd/vangogh/acp5x-mach.c            |  6 --
 sound/soc/fsl/fsl-asoc-card.c                 | 16 ++--
 sound/soc/fsl/imx-audmix.c                    |  6 +-
 sound/soc/fsl/imx-card.c                      |  7 +-
 sound/soc/generic/audio-graph-card.c          |  2 -
 sound/soc/generic/audio-graph-card2.c         |  2 -
 sound/soc/generic/simple-card.c               |  2 -
 sound/soc/intel/avs/boards/da7219.c           |  2 -
 sound/soc/intel/avs/boards/dmic.c             |  4 +-
 sound/soc/intel/avs/boards/es8336.c           |  2 -
 sound/soc/intel/avs/boards/hdaudio.c          |  4 -
 sound/soc/intel/avs/boards/i2s_test.c         |  2 -
 sound/soc/intel/avs/boards/max98357a.c        |  2 +-
 sound/soc/intel/avs/boards/max98373.c         |  2 -
 sound/soc/intel/avs/boards/max98927.c         |  2 -
 sound/soc/intel/avs/boards/nau8825.c          |  2 -
 sound/soc/intel/avs/boards/rt274.c            |  2 -
 sound/soc/intel/avs/boards/rt286.c            |  2 -
 sound/soc/intel/avs/boards/rt298.c            |  2 -
 sound/soc/intel/avs/boards/rt5514.c           |  2 +-
 sound/soc/intel/avs/boards/rt5663.c           |  2 -
 sound/soc/intel/avs/boards/rt5682.c           |  2 -
 sound/soc/intel/avs/boards/ssm4567.c          |  2 -
 sound/soc/intel/boards/bdw-rt5650.c           |  4 -
 sound/soc/intel/boards/bdw-rt5677.c           |  4 -
 sound/soc/intel/boards/bdw_rt286.c            | 10 +--
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 32 ++++---
 sound/soc/intel/boards/bxt_rt298.c            | 26 +++---
 sound/soc/intel/boards/bytcht_cx2072x.c       |  6 +-
 sound/soc/intel/boards/bytcht_da7213.c        |  6 +-
 sound/soc/intel/boards/bytcht_es8316.c        |  6 +-
 sound/soc/intel/boards/bytcht_nocodec.c       |  6 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |  6 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |  6 +-
 sound/soc/intel/boards/bytcr_wm5102.c         |  6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |  6 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c      |  6 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |  6 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c       |  6 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c    | 14 ++-
 sound/soc/intel/boards/ehl_rt5660.c           | 14 ++-
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 30 +++----
 sound/soc/intel/boards/hsw_rt5640.c           | 10 +--
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 26 +++---
 sound/soc/intel/boards/kbl_da7219_max98927.c  | 54 +++++-------
 sound/soc/intel/boards/kbl_rt5660.c           | 18 ++--
 sound/soc/intel/boards/kbl_rt5663_max98927.c  | 44 +++++-----
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 22 ++---
 sound/soc/intel/boards/skl_hda_dsp_common.c   | 14 ++-
 .../soc/intel/boards/skl_nau88l25_max98357a.c | 26 +++---
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 26 +++---
 sound/soc/intel/boards/skl_rt286.c            | 26 +++---
 sound/soc/intel/boards/sof_board_helpers.c    | 12 +--
 sound/soc/intel/boards/sof_da7219.c           | 33 +++----
 sound/soc/intel/boards/sof_es8336.c           |  8 +-
 sound/soc/intel/boards/sof_pcm512x.c          |  8 +-
 sound/soc/intel/boards/sof_sdw.c              |  4 +-
 sound/soc/intel/boards/sof_wm8804.c           |  2 -
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    | 20 ++---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |  6 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c     | 24 ++---
 sound/soc/mediatek/mt7986/mt7986-wm8960.c     |  6 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    | 10 +--
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     | 10 +--
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 34 +++----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 34 +++----
 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 86 +++++++-----------
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 86 +++++++-----------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 58 ++++++------
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 78 ++++++++--------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 60 ++++++-------
 sound/soc/meson/axg-card.c                    |  9 +-
 sound/soc/meson/gx-card.c                     |  1 -
 sound/soc/meson/meson-card-utils.c            |  4 +-
 sound/soc/qcom/common.c                       |  1 -
 sound/soc/samsung/odroid.c                    | 11 ++-
 sound/soc/soc-compress.c                      | 10 ++-
 sound/soc/soc-core.c                          | 20 +----
 sound/soc/soc-dai.c                           | 38 --------
 sound/soc/soc-pcm.c                           | 88 ++++++++-----------
 sound/soc/soc-topology-test.c                 |  2 -
 sound/soc/soc-topology.c                      |  4 +-
 sound/soc/sof/nocodec.c                       |  4 -
 91 files changed, 507 insertions(+), 876 deletions(-)

-- 
2.25.1

