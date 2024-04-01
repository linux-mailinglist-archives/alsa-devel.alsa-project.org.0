Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A389369F
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 02:34:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64D11218D;
	Mon,  1 Apr 2024 02:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64D11218D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711931666;
	bh=7kpEScKP+tvOA2ZtWqhv9z+xhFh25AeBKzh1GfP5Ec0=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JlEAxLTvuMOn2fqOTkKjmqmSF9yuvgr1i7e6sD9PC3VGCJAf9Ro5u1fLjDRBVDtN4
	 4NVPORwzbp0ypeC3S/f1IyVzmw60x4JYcy4kJ+vCQvOkCbwRA1u2mfYT5UN+bOkE5T
	 mEsc/9OQg3NEfPsSRQNib+qAVMI5+56N1t75aR5I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9399EF806CF; Mon,  1 Apr 2024 02:32:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B9DBF806B6;
	Mon,  1 Apr 2024 02:32:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B529F805E1; Mon,  1 Apr 2024 02:32:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA1F7F80568
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 02:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA1F7F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gkJi3atZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKI5LMFof+57uSz2w/FKLdr5O6vAgh/ZXFQ0AZWANvqrUdiFXWERwD/+5iJgIk5J+Id/UjhwKNwUeaCjLuCc0R7It3QevHq0PYgOnMn32kL+IwqzjxDgNH+tHRlepk9XjBDCq44M1BIZ3etcpZr14X9xIGCg0VPkZhkZ6iXUfrc+X9GYazUyoruahiXoWEwzLSWphq9Pm3bczq7+fGJb7bl2Znqm6Z/czF0d+6NDGwBS8kwh/M+HxFXBZ76VWnmoxDyQldIff86wRCxOXOlIOj6f7wYGV82PRi74CtbbGx1iExBWxhW7tnaRKKya2/sCVcbm0vv51NksuUeZf7j/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUnTRQkb8NLAEEkpE6Z2pzw8k5XNxN6IrNytfkvDcO0=;
 b=QK94++uWVVppbCrqVEBkvTTSy2/+ehTrFuRbem5jq8OMA/fauFVlEDvJR3hKFZQxEm1frtAf8awo01jKCMxB49rtrKqdtHFlGCDTDqxfRzZClXSj6dBPkbazeCpM6KItaHQolUwiBFrzy1t/K8ZujQcFehAVc1fo+FLlwp2BC8fr9brZct/4nS6I49tJsf4i+q7TWe9WuiPVoz1dWHWC+p9zWuC5U7yIsKUSDamJhvdM1WS6R5MIFG+DRIOXeP8WYotOCN41E4srQoX8uePJCor52rf/S3eBC2vydi3IXaaf1TFDihhG+TLScYZa9Df45O/x3wjLprt6JGCX4u/KiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUnTRQkb8NLAEEkpE6Z2pzw8k5XNxN6IrNytfkvDcO0=;
 b=gkJi3atZcHnHhDKTRLU94f3q4X9B9Hpn3HW1aL0LYReb2112/AqDGjTOL5G2v33a7gr933MrlV05d811xWjkqYmVbpQERQA28y5i/ooLmYHBXFbON6kX6gShRgyI7VFzZey0wwD2miGEjudAfBvxKJZ9v8TKjHLnLuG4Yh1+Vdg=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8258.jpnprd01.prod.outlook.com
 (2603:1096:604:175::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:31:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:31:35 +0000
Message-ID: <87o7atudnd.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,	Daniel Baluta
 <daniel.baluta@nxp.com>,	Hans de Goede <hdegoede@redhat.com>,	Jaroslav
 Kysela <perex@perex.cz>,	Jerome Brunet <jbrunet@baylibre.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Kevin Hilman <khilman@baylibre.com>,	Liam
 Girdwood <lgirdwood@gmail.com>,	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Trevor Wu
 <trevor.wu@mediatek.com>,	Vinod Koul <vkoul@kernel.org>,	Xiubo Li
 <Xiubo.Lee@gmail.com>,	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,	linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 08/16] ASoC: mediatek: Replace dpcm_playback/capture to
 playback/capture_only
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:31:34 +0000
X-ClientProxiedBy: TYCPR01CA0178.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8258:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uu+kmNzCHAYekwEHbFEV9Tg/pwKiTligEl0waMNyx3w6+9GQfFRFMbuITMxOSuZTBVMtfLGEaUVsE7fsEkEy8mrbQgby+dCC5julUMFeq4dwWuCSLiS5cjFb/lge+QTePu2XxWoSCSS0H7mnE04q+eodKFH7oJKZCcUbAw8ThZENfpJYbGciVbGhzoe9hu4pAkyWaOmSiPRI1XLgnoNUTOMEQ1abJmIMjoD1i+8aivONFa2INPKQ0mJ2BMOIBbAobBx9rj4po+UPQver38W0NzUQ2DD9K/56Mw88zOVUz6oVoVOYWBW6bk/uRCxz4VpL5u1S+VGf54yKT1XEicAQFTP6U4QHc4QU/pN8VrQftwOTo17cE+XNqqvcJGzSok2MI7pKqCHyXVYV0YcQT8KJhSotrruyOi1MgNrvaWIBm6x2eWtysfW88C3RbTOEYsY0uQmJMxL+hCw4us/rinH2aO0Ui/k2T4C23Fl9V2TdTm9YviTFiVCGiQpXioTjvVaYn3P5NRRuQs07chpFJaS1RA/3ZMnlDWnOpXE/Z09ZNWWjDliIg17C8q6dX761FD4QtSjvmKjkhzkVVmjGMh1VplhKhqWTzn6iWgx/4/QJG9xAVaFRdDk+BQwN630Nz0yu2ouna85ZskdEPyMCsGaJ8BUKc9z8Ob7OQLQmRZ4ntONo3Ri4ZpNJlievNaFUtYP7JV5jtxnS4G2Z2vRM8E7y1C/AdXUuPXmaSBaMoDyahMM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0g8iuXH55ZsvmvuL/yUgRWQYJbkPc+DiFF4qr/y7qoddUYqFLHEvCceIIJzm?=
 =?us-ascii?Q?rnOnemDf7tV9QXMcXxSYJU4hgzsQ/p7eFR6Q29h+Dgal0lgbi40nSYWtuJqL?=
 =?us-ascii?Q?A2iWoO1YIBqun0eO1oW+aczq88WwFkD9RG1RaqR3EmZWaHaxNj2EagPsm0f5?=
 =?us-ascii?Q?ah8aU0hEuON7aRw80UCYERs1XUEzbQeq0ROkSECKcCGPwkKHEV0dawC4pGOe?=
 =?us-ascii?Q?h6mEs5O88Q+IfBXd9B9tjPmMhVpGHJlaKL1xFF4RYXlfNQg7Q+oRXR6tcB0d?=
 =?us-ascii?Q?YDH1cXLM4qe1R5iGhureIMvIGv21P7+pRpk9rSKD7eXtTmODxnk6vCeqCxe8?=
 =?us-ascii?Q?Z/CDO4Q9RFs5l22d4bw1XiP5Sxue1RwQfVXqD2rc86AjkBFO9pmA3MbbHsWO?=
 =?us-ascii?Q?qANyZeydq9I4zXjEEhZY2K9oAQBum2hGRb3qRqP5u22aED/6LKuQAh31gjVl?=
 =?us-ascii?Q?cyxF+tg2LpFKl9uasz0Z8IyX3F+AaX9hLedN6c3LD6EfFImrrZWZj1zvJXoc?=
 =?us-ascii?Q?deiakmypm2Ay9Z0SDOhftfile5CNmxTXZdQGo4bWTgcAajZ1ANfrRMEz69UZ?=
 =?us-ascii?Q?FgmWPG3AtxeQE9p3tNzcL0tqMhfArRalILHGH7s8F0O/3xPMIr/+pZz9fv2/?=
 =?us-ascii?Q?Cvisu1Etelrn0XtCJFajT9adO2/hWM9DdY739vXZV0OnulMXfPqnAaDHIWf5?=
 =?us-ascii?Q?WDQDWo9OfhaQvKsA75n/LCsyNR4ICyA+0+nzeITHOoG81kCsL+Ug+OBzuQ3e?=
 =?us-ascii?Q?XfY9ZwJ6n/vB/lO9As7diBfYyvaJ+ISmo6kq5653iW0r5Y1pHWStV5oDUQpj?=
 =?us-ascii?Q?HiRFl3vmkJO61Fcn4v884KRRHENwUUCSvY2Zkvmqg3Yrhh3ql/OjqxFU6fKM?=
 =?us-ascii?Q?Spk+kfDc/pMWX6P4J3s1bN4HJ4S7X5EolKRGEWtERZricHue/W0setQJTQMe?=
 =?us-ascii?Q?mO0IKeKod2wV/kzoC2T8M2sr8efYA9rmOI+9+KcxxUoZT4tS3DBK7lwbvra1?=
 =?us-ascii?Q?3F2qiPFZ6lBeIYWUAn6tgVc9OU8StVncOgVBPnyPl6j4Ff9s1l+8JC5tVBO4?=
 =?us-ascii?Q?+HKCjW0e0/hk7hJ4rIJ6+32IfYZhk2xICK97+bBYA3S7kbEP16EbzLmEE8un?=
 =?us-ascii?Q?OjOr4/pzlV6H6HrrxkxPIvVrGKy7GeVJCqM+n7TlgDxIUhC/KkEKkMKb0F7i?=
 =?us-ascii?Q?egFmKoAI6LlL1YXiQ+JtFhDwsDzMjCHhuPfHjpGbex7XgK7oGLBIs9Ff7GcN?=
 =?us-ascii?Q?uVcaYD0u6HfSDt1qmwvlqBapP+9WFhAxqGHXAwDYZ/c/zk9T0Q9+gkO/uSnP?=
 =?us-ascii?Q?5F6KD0hCGlgd4FKFlF8MCynFWO5e+nQX8uiQQy68oOZ41RgJgi3QimF3tW0F?=
 =?us-ascii?Q?U29p5TYKiSyC6EpjHNYMhiBBpU3SAIdelCYOYgY96qGE3IpO+BEaeJrfomms?=
 =?us-ascii?Q?UtpDc65Aez5kIo1sPY1QSiv7V3WNs3wS0tDGfwovrCWIeS4XsIKSzQfDjeTj?=
 =?us-ascii?Q?RDHo/zMSK6VSp00Re9MePXty9Ra6ZabtN0dZBVOpDmQjb1X7kT9gkd1GDSud?=
 =?us-ascii?Q?BJKAp93d4+uroLQsVQEegd5hIX8t2f3m35pzPDJbmLOaOgk/bwapZE6mKGI7?=
 =?us-ascii?Q?Zm1t/Xo0VRufE4YQzvms5Y0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2b713849-dca6-4707-af6a-08dc51e31616
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:31:35.1447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uLfWfhEXf+2j2G2NXfF7AKk/SerTYBZ9T622p6M+nc/Rbxv/b9JUQRpL2nhJjtfPp8XGYAbHTEVa4qInyoUudoGjKZBmmuJZcVg2GGkulp20NPAgwpi9BxUDhQtE1Sx3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8258
Message-ID-Hash: JUR6DDV2KXXEWLURMCEL6VVMGUHSTX7O
X-Message-ID-Hash: JUR6DDV2KXXEWLURMCEL6VVMGUHSTX7O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JUR6DDV2KXXEWLURMCEL6VVMGUHSTX7O/>
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
 sound/soc/mediatek/mt7986/mt7986-wm8960.c     |  6 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    | 10 +--
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     | 10 +--
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 34 +++-----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 34 +++-----
 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 86 +++++++------------
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 86 +++++++------------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 58 ++++++-------
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 78 ++++++++---------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 60 +++++++------
 15 files changed, 212 insertions(+), 312 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 1262e8a1bc9a..f1a852cff1c9 100644
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
index 8a6643bfe830..2814f0570928 100644
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
diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
index 6982e833421d..c3d1e2eeb0e5 100644
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
index 0557a287c641..0724564cee6a 100644
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
index 4ed06c269065..d8e4e70d834c 100644
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
index 763067c21153..488f2314dbf7 100644
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
index 466f176f8e94..59c19fdd8675 100644
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
index acaf81fd6c9b..8ad1bd07d866 100644
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
index bb6df056a878..6267c8554c15 100644
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
index d86dc45be30c..8927dfe8e395 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -570,7 +570,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -583,7 +583,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback12),
 	},
 	{
@@ -592,7 +592,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -604,7 +604,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -617,7 +617,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback4),
 	},
 	{
@@ -626,7 +626,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback5),
 	},
 	{
@@ -635,7 +635,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback6),
 	},
 	{
@@ -644,7 +644,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback7),
 	},
 	{
@@ -653,7 +653,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback8),
 	},
 	{
@@ -662,7 +662,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture1),
 	},
 	{
@@ -671,7 +671,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -684,7 +684,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture3),
 	},
 	{
@@ -693,7 +693,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -706,7 +706,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture5),
 	},
 	{
@@ -715,7 +715,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
@@ -727,7 +727,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture7),
 	},
 	{
@@ -736,8 +736,6 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_lpbk),
 	},
@@ -747,8 +745,6 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_fm),
 	},
@@ -758,8 +754,6 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_src1),
 	},
@@ -769,8 +763,6 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_src_bargein),
 	},
@@ -780,7 +772,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_hw_gain_aaudio),
 	},
@@ -790,8 +782,6 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(hostless_src_aaudio),
 	},
@@ -799,8 +789,6 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 	{
 		.name = "Primary Codec",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_suspend = 1,
 		.init = mt8186_mt6366_init,
 		SND_SOC_DAILINK_REG(adda),
@@ -811,7 +799,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_IB_IF |
 			   SND_SOC_DAIFMT_CBM_CFM,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.init = mt8186_mt6366_da7219_max98357_hdmi_init,
 		.be_hw_params_fixup = mt8186_anx7625_i2s_hw_params_fixup,
@@ -820,7 +808,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 	{
 		.name = "I2S0",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8186_i2s_hw_params_fixup,
 		.ops = &mt8186_da7219_i2s_ops,
@@ -829,7 +817,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 	{
 		.name = "I2S1",
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8186_i2s_hw_params_fixup,
 		.init = mt8186_da7219_init,
@@ -839,7 +827,7 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
 	{
 		.name = "I2S2",
 		.no_pcm = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8186_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s2),
@@ -847,39 +835,31 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
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
@@ -888,15 +868,13 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
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
@@ -904,35 +882,35 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
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
@@ -940,25 +918,25 @@ static struct snd_soc_dai_link mt8186_mt6366_da7219_max98357_dai_links[] = {
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
index f78197c8e582..177a876f51ec 100644
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
index a391066ab204..89840c24e433 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -929,7 +929,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
 		.dpcm_merged_format = 1,
@@ -943,7 +943,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
 		.dpcm_merged_format = 1,
@@ -957,7 +957,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
 		.dpcm_merged_format = 1,
@@ -971,7 +971,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback7),
 	},
 	[DAI_LINK_DL8_FE] = {
@@ -982,7 +982,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback8),
 	},
 	[DAI_LINK_DL10_FE] = {
@@ -993,7 +993,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback10),
 	},
 	[DAI_LINK_DL11_FE] = {
@@ -1004,7 +1004,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(playback11),
 	},
 	[DAI_LINK_UL1_FE] = {
@@ -1015,7 +1015,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture1),
 	},
 	[DAI_LINK_UL2_FE] = {
@@ -1026,7 +1026,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture2),
 	},
 	[DAI_LINK_UL3_FE] = {
@@ -1037,7 +1037,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture3),
 	},
 	[DAI_LINK_UL4_FE] = {
@@ -1048,7 +1048,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
 		.dpcm_merged_format = 1,
@@ -1062,7 +1062,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
 		.dpcm_merged_format = 1,
@@ -1076,7 +1076,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture6),
 	},
 	[DAI_LINK_UL8_FE] = {
@@ -1087,7 +1087,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture8),
 	},
 	[DAI_LINK_UL9_FE] = {
@@ -1098,7 +1098,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(capture9),
 	},
 	[DAI_LINK_UL10_FE] = {
@@ -1109,14 +1109,14 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
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
@@ -1124,7 +1124,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.ops = &mt8188_dptx_ops,
 		.be_hw_params_fixup = mt8188_dptx_hw_params_fixup,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(dptx),
 	},
 	[DAI_LINK_ETDM1_IN_BE] = {
@@ -1133,7 +1133,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(etdm1_in),
 	},
@@ -1143,7 +1143,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(etdm2_in),
 	},
 	[DAI_LINK_ETDM1_OUT_BE] = {
@@ -1152,7 +1152,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(etdm1_out),
 	},
 	[DAI_LINK_ETDM2_OUT_BE] = {
@@ -1161,7 +1161,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(etdm2_out),
 	},
 	[DAI_LINK_ETDM3_OUT_BE] = {
@@ -1170,7 +1170,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(etdm3_out),
 	},
 	[DAI_LINK_PCM1_BE] = {
@@ -1179,14 +1179,12 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
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
 
@@ -1194,28 +1192,28 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
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
index bfcb2c486c39..04c958851a74 100644
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
index 53fd8a897b9d..4bacf75b64e0 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1024,7 +1024,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_playback_ops,
 		SND_SOC_DAILINK_REG(DL2_FE),
 	},
@@ -1036,7 +1036,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_playback_ops,
 		SND_SOC_DAILINK_REG(DL3_FE),
 	},
@@ -1048,7 +1048,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_playback_ops,
 		SND_SOC_DAILINK_REG(DL6_FE),
 	},
@@ -1060,7 +1060,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(DL7_FE),
 	},
 	[DAI_LINK_DL8_FE] = {
@@ -1071,7 +1071,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_playback_ops,
 		SND_SOC_DAILINK_REG(DL8_FE),
 	},
@@ -1083,7 +1083,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_hdmitx_dptx_playback_ops,
 		SND_SOC_DAILINK_REG(DL10_FE),
 	},
@@ -1095,7 +1095,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &mt8195_playback_ops,
 		SND_SOC_DAILINK_REG(DL11_FE),
 	},
@@ -1107,7 +1107,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(UL1_FE),
 	},
 	[DAI_LINK_UL2_FE] = {
@@ -1118,7 +1118,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_capture_ops,
 		SND_SOC_DAILINK_REG(UL2_FE),
 	},
@@ -1130,7 +1130,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_capture_ops,
 		SND_SOC_DAILINK_REG(UL3_FE),
 	},
@@ -1142,7 +1142,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_capture_ops,
 		SND_SOC_DAILINK_REG(UL4_FE),
 	},
@@ -1154,7 +1154,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_capture_ops,
 		SND_SOC_DAILINK_REG(UL5_FE),
 	},
@@ -1166,7 +1166,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_PRE,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(UL6_FE),
 	},
 	[DAI_LINK_UL8_FE] = {
@@ -1177,7 +1177,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_capture_ops,
 		SND_SOC_DAILINK_REG(UL8_FE),
 	},
@@ -1189,7 +1189,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_capture_ops,
 		SND_SOC_DAILINK_REG(UL9_FE),
 	},
@@ -1201,7 +1201,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 		},
 		.dynamic = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &mt8195_capture_ops,
 		SND_SOC_DAILINK_REG(UL10_FE),
 	},
@@ -1209,13 +1209,13 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
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
@@ -1226,7 +1226,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(ETDM1_IN_BE),
 	},
 	[DAI_LINK_ETDM2_IN_BE] = {
@@ -1235,7 +1235,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM2_IN_BE),
 	},
@@ -1245,7 +1245,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.be_hw_params_fixup = mt8195_etdm_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM1_OUT_BE),
 	},
@@ -1255,7 +1255,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ETDM2_OUT_BE),
 	},
 	[DAI_LINK_ETDM3_OUT_BE] = {
@@ -1264,7 +1264,7 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ETDM3_OUT_BE),
 	},
 	[DAI_LINK_PCM1_BE] = {
@@ -1273,48 +1273,46 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
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

