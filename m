Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99653888D3B
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 05:43:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A4241665;
	Mon, 25 Mar 2024 05:43:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A4241665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711341808;
	bh=ASZnSOt29Y1boiQPxQpHAIi1vK7Wyzv8SuixBTYKQds=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=DO4/SKGouAisCeXLkJKkcBPKn25sxoIO6MHvTueuYKuLxtncCjuvcpimKkdbtGc5T
	 yaqqadJ5RtVNpd9cCvI99U4n8/RglGQVwmBqr1Obn2gpa13e2Tuq/5GLwxCB8km0UR
	 7+dnnlz4ShjOCmsKtxT4qv6GjR/UX5Cu3/83Qe8g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B2F8F805C7; Mon, 25 Mar 2024 05:42:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40511F805BF;
	Mon, 25 Mar 2024 05:42:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BB60F802DB; Mon, 25 Mar 2024 05:36:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18DA6F801EB
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 05:36:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18DA6F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=kgY1J1XC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfeyRZ3A2MdYx+5T4X1kqxYlHLiaHCyHoSBXgfbyKAP/lAXJYlMljQrqZm2kw2pW3QrpDy2S/ZT+94UJ5Xc5aUys40C3rWoDb0Q6r6VSjDZ3psuMU3Ue4IgJnt3A4FzQWYtVppNrUK3xms2XrP0ttafGBRnc7tHFAtSEgdn+LFUoSET9Db9NOVWD+skt+rMc0FAdjNerPC33Dp6EKYVnM9hIdl5i7x9tuZkFD7Y6VRZ49gUPd2ns+D1kmccvDSP9WhjLdzcP1T1GLMxamTIqYCjSQNh2zPdD4KY8+Wi7zO/fnpZVapumqc9BZ3rxtXWAkGXHgeuW2ZK0HT5Efh4QcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5cHDXW03ymXrOJ/Kwy5X34iabH9NN7FjU2xvOXQyO4=;
 b=AUBcKf9DvZxtkXXKGEbgl+aNcIR88RJ2oHgQcbt2pBqRci/nfnkYZoaUe24xuEMBJndB42amYRo0aShbEDG3w9LaskgPIlh9FpZIcb12Jut3ZBhU7VoShnMOoAop8DDqojwe2o+Ld3wSefskbF0e3cPuEcdAT3a3vBdTOAzixbPyQuS4tRdaMny+hV7KVLwfODMe4tk1bLGE5eBxevzYEUDc6Yxy5zlY3w/7AZRyp4SgnAtb+JkOWkjjXnT2vdzRKjFoPFkVRHGpai86GCqncrTMtSIbgncQqkCJSRLzpSBHvnj/5qkNuILqnzMs2iz67wZHhb6ZMWQeaqT2MMBJww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5cHDXW03ymXrOJ/Kwy5X34iabH9NN7FjU2xvOXQyO4=;
 b=kgY1J1XCFerfLQM7b8AD5PPoLHjtUetJEdrw8M/85RmGZn0PUGPbG+LlqRMhaCMoINxA4NrfZQUxnkvRYJb0ep9GwQjer4Pm2FStxryjRW5HQUwNB8lDhsRKyupSi3+1I4rdqcwlJrj4qTJ5yoy33Ou1aTPnm68uYzwEdajRMPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10698.jpnprd01.prod.outlook.com
 (2603:1096:400:296::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 04:36:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 04:36:20 +0000
Message-ID: <87le6753nf.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/15] ASoC: amd: replace dpcm_playback/capture to
 playback/capture_only
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 04:36:20 +0000
X-ClientProxiedBy: TYCPR01CA0121.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10698:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2bd8d2-1cad-40e8-baf2-08dc4c851e7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qxsbagFb2jrubv8L7pl83nplTCe+ARP9/55z6EEX9zIkPgr5JgGBCn6uKAIIl20560Icsrz8W3VzmzEoQBKpcAzJbcJ5cg2lGidBG+29dGk16cZT6PT5LaTyZZF8Zm8DfWO0vQAxE93BBDqVhAglqmwhjVrlTOeQB66dOe93tmZS50sE1+wxfZWqhP3gG/nWDcP68/NfwYPH8YyCLT3gIsPE/DmMZiFNsGCrkbHQCpqHGPLCwSu1kEg7fRf3JH2N7wH1KFRiTTBa3p5gHBqR8VMcZEQJNQRIa5AZaVkM9/7LRihaNBBRC33Xnkz26RYZul0j/zeyAy1CeCEK3+aiC9iUZXINM7ayW5i8eLJxyKrcr02r6z3JOpRpjTZQUD/RyUtb6QF7PBP5CRXMJJl+0sI/6VEh8ACaCT9u3UzRDvllIuFfn2UEY/UWA6eZj7uiQ6HwcaITSK0EuavILYJzYv8vTlt7J0q5OBX6qkG7PIhzkFhw3CdnOVXZhzr/Xf3KocUkMWTlcJWGkEzvLvilRxFJUKcim6le9nEKQBENDU5nZg5CEtueKAwezFoq0VdpbpbmouNABNsxGxvynX1u13hBYH3couAe0PcSUzqIAq6eIUcDbYKD9DgfmQsQUMDRjFO34qg69ug1R9IbQzWwgq2stgsIrK7iG3d2hP8XgLQJbjMg+/X/yyxyLBas0bPbLxUZUcTepnlwA45lP4KDD1gQrQGsl/r/9b1twDAsPtQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cTqpAlFZrNLxj1bnnAQZtJiCV2KDDdvF1u79A5ySJsxaAJGBpDmZgWsoo7I+?=
 =?us-ascii?Q?9G6u3g/YhFIWXL972gVDnq9Se2JvnWbKJTdztIveesnGJYk0aGd2EhcBkyBY?=
 =?us-ascii?Q?vZwUGGhoO+9B9/1ea3kozPnJoCXWeLB+GST8G7Qgj399TtdWA2dP6F/R4DOA?=
 =?us-ascii?Q?E+zmvc+BQbvuE03IEJEit1igiLFeel+wPOyNUOf+OLGbLyR0KlMNZJ3xQWVM?=
 =?us-ascii?Q?iO/Q+S1AEXsWGS2DpZfR+oEKD35HjU8mCrjz17AaH6BinmTG5bZcKAlikphf?=
 =?us-ascii?Q?asgYRF58nABjHMw+pRci1gTdUc9HslfxUl2wboRPbD+hD18n4/zJURlfD2uJ?=
 =?us-ascii?Q?eOt4RcCgNw2ittkkVPgl1SJS1StoW6LJIeE9BTy2dVHKOBN6LwQQDybYD7tH?=
 =?us-ascii?Q?4kh8Em5Ce+dU9SLOQlyJEAFv9bYKzgoBbql1Q3vQ36Vd84WwoOOIedOYPJFC?=
 =?us-ascii?Q?H99lb0rNFa1wEojITs8k9RK4rX5AfpWLkA/cjrXMzNQpoLviUZ4ctI60A3lc?=
 =?us-ascii?Q?9lbVmk9atPPozE9a73aCMSyNXB6jk3YlRntkuZ61Zq7sEtJeV/dwjruCcFS2?=
 =?us-ascii?Q?XCho6IGalYvz+okVyxaD9nO0fUT4XxN8SXpeIOiffd+czQs6vUot859aho/K?=
 =?us-ascii?Q?NPLwvoPLX9FXD2aHZXY0OPb2trhGFsP3Y7SdO5RviQRG0XoZ9Yte4mHm1EmX?=
 =?us-ascii?Q?cGRSvsoIrzkz27bNehqfjl8rQsl5spPpqdWkGfxPw5+BnrBB3tznyE+kTUGr?=
 =?us-ascii?Q?Os2pGeKPuFpnPX93wIb0LxQXl8HrqhLg78YgrRe+DLhymGKM7SeCnfxc0Wv3?=
 =?us-ascii?Q?oSPjQtXpBkw7rVY/RNOT4oAYO1c27fgruzJGaUXUYv0c/M6/tu13ynGY+uay?=
 =?us-ascii?Q?BvXJHk09vWyeP2H26bgwm+0QzjuLKZCQoLzYwpAdc56Boi8/h9Qv7e3owd0f?=
 =?us-ascii?Q?j3AL1pRLXfT6ebvVKZINvq2iS8EgGpHdwD87Lc3RnHi5qQAp+Gg8wAaKxEkp?=
 =?us-ascii?Q?9dWUJVNj8cHZZTTpCTuabids9BjOOVKE8jW4kQd/9Jkz7XWQCoRRIx2D/tOI?=
 =?us-ascii?Q?CblxpMHAPA+orOuqq583vQEa+xwtNK2JHsUxvfC+PKIC8sWyrZjWWilDIBOj?=
 =?us-ascii?Q?N3ZUGpAecbVpUm/FSD8nIXgZxC156f5wgrlGcbKr5YHO98clc/gMnN8wKWRX?=
 =?us-ascii?Q?rSmLQmBht7/P55HYKmOo9YFD7q/lWpLMcc3JvJiHRyCl5opOx0L8x1rEV7cr?=
 =?us-ascii?Q?C3304wEgOOdJ5doz8Ba1P78di/qt9v+aalGtw7qvZgmIw868wKNE5SPDgcHr?=
 =?us-ascii?Q?kG82EnKk+ZS17oI9jGA7SPNqHksZM6Z/ja2rKa7uSTlAVra13GYV2dROOf8v?=
 =?us-ascii?Q?JySxJ/leVMj6pX+9q2DmMh4NdMlpv31ncUdzeoQEyWOdeEfIhvyBrfxQVYF2?=
 =?us-ascii?Q?6tXJsEH5juM9DST5T6e0RJosriRCkPbgPhYTWdBlgn17ebYSmPmW4HJuKooJ?=
 =?us-ascii?Q?zPzISZ7Rcp5YDAscN0mrshSw3mTbzm7CWOn9DEkcfoKEXJf0hb1fMQMez6qO?=
 =?us-ascii?Q?XPpcP+4oYVuru0rJtD5DGutkPR4g+PjlvvdG6ogsN4mk646OlpuDn0hDKPHi?=
 =?us-ascii?Q?mE2/t2+7vpZ+/OeIp2ZmU5c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1a2bd8d2-1cad-40e8-baf2-08dc4c851e7a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:36:20.6540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +AvPopDifo7aCwQtehYh+Pd2G9MDSBuSCkC0YVMqK2Dy1+M9JdOsyW4xMd0Bq2n1SLNSDvx95VUm/T9uM/kwOoTRDygdU4MF5vnhQJbolcNRtMdMzbUwexSQwdYD+Ynl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10698
Message-ID-Hash: OXBGV5REAP7IIGIAQ7HTXGZW5FN7EBTW
X-Message-ID-Hash: OXBGV5REAP7IIGIAQ7HTXGZW5FN7EBTW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OXBGV5REAP7IIGIAQ7HTXGZW5FN7EBTW/>
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
 sound/soc/amd/acp/acp-mach-common.c  | 24 +++++++-----------------
 sound/soc/amd/acp3x-rt5682-max9836.c |  6 ++----
 sound/soc/amd/vangogh/acp5x-mach.c   |  6 ------
 5 files changed, 19 insertions(+), 39 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 84f3d65ba52e..d68d84d4964f 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -542,7 +542,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_da7219_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_play_ops,
 		SND_SOC_DAILINK_REG(designware1, dlgs, platform),
@@ -552,7 +552,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, dlgs, platform),
@@ -562,7 +562,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -573,7 +573,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -584,7 +584,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
@@ -598,7 +598,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_rt5682_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_play_ops,
 		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
@@ -608,7 +608,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
@@ -618,7 +618,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -629,7 +629,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -640,7 +640,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index e079b3218c6f..785d34127a03 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -150,8 +150,6 @@ static struct snd_soc_dai_link st_dai_es8336[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
-		.dpcm_capture = 1,
-		.dpcm_playback = 1,
 		.init = st_es8336_init,
 		.ops = &st_es8336_ops,
 		SND_SOC_DAILINK_REG(designware1, codec, platform),
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 665a6ea0a2a8..0a672188521c 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1407,8 +1407,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_sp);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -1444,8 +1442,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -1480,7 +1476,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		}
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1512,7 +1508,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs_virtual);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1527,7 +1523,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 			links[i].init = acp_card_maxim_init;
 		}
 		if (drv_data->amp_codec_id == MAX98388) {
-			links[i].dpcm_capture = 1;
+			links[i].capture_only = 1;
 			links[i].codecs = max98388;
 			links[i].num_codecs = ARRAY_SIZE(max98388);
 			links[i].ops = &acp_max98388_ops;
@@ -1553,8 +1549,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_bt);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->bt_codec_id) {
@@ -1574,7 +1568,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_dmic);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 	}
@@ -1613,8 +1607,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1657,8 +1649,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1686,7 +1676,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1724,7 +1714,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1774,7 +1764,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
 		links[i].ops = &acp_card_dmic_ops;
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 	}
 
 	card->dai_link = links;
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index d6cdb6d9fdd6..f2652831c8c4 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -317,8 +317,6 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = acp3x_5682_init,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp3x_5682_ops,
 		SND_SOC_DAILINK_REG(acp3x_i2s, rt5682, platform),
 	},
@@ -327,7 +325,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &acp3x_max_play_ops,
 		.cpus = acp3x_bt,
 		.num_cpus = ARRAY_SIZE(acp3x_bt),
@@ -339,7 +337,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "Capture DMIC0",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &acp3x_ec_cap0_ops,
 		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
 	},
diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 7878e061ecb9..2ca904db82ab 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -276,8 +276,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -288,7 +286,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_cs35l41_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, cs35l41, platform),
@@ -375,8 +372,6 @@ static struct snd_soc_dai_link acp5x_8821_98388_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -387,7 +382,6 @@ static struct snd_soc_dai_link acp5x_8821_98388_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_max98388_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, max98388, platform),
-- 
2.25.1

