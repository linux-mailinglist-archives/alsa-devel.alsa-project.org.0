Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 347078A91F6
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 06:18:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 521A0EDB;
	Thu, 18 Apr 2024 06:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 521A0EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713413920;
	bh=CHwN0w+kKECkNO7weFPOWmJwd7w94paxc51yfl3ZMp4=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=T1Ezxud1QpV08WFT5GKh41wnUIAjBbSOwSGozjgePOxKbD7A0HsjkwdLwqFt//ww0
	 hCgp1E9cU0WaVu1odzNmfOHt/1ee0SwXOiTaonDCmVJWIh8qjPcNrIyyjWxtNSz89G
	 fa2NRRHD13TXhWN01f/XYoV3fJoGGzB6ghJkb+G0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E71BDF80496; Thu, 18 Apr 2024 06:15:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75C3BF807A2;
	Thu, 18 Apr 2024 06:15:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E03BF8070B; Thu, 18 Apr 2024 06:15:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CBDCF8061C
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CBDCF8061C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PWpXf/88
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOJQCSUIWuTjYLw7Bql95nkLeCLfJxgYneWB8cCfhIGNwW65Ssd1uKT2QQQZXwZtZp7y7L+os1zWp+TKS8YDcknoJaaylzm2BSlcALW9LwrodfhXDv0oSt69l3L1A55lHHtKo1Xvu6NsEHaAAJkp84uL4tXcbn0jY2SjDPtqfJVn+/uZ7rEMPCA6SJS2uc9WSsKGwbA+5kS6FWQn6GNHcr3xb5X3v1nNbwy8Nopu3Mt4lcXlnkRkx+YAM5iByTW7c4DnDHa0ndfRlyJS+bju6pr3YpdbG4XdgIFEC8mRA1obFblFgUjQsEHwqDUleicU4tWWtEnrdCYtdnRdDaZhZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7JpM9eowkOs6q/Wzy+Lj4zAdrPFKWW+4gwnLCEOr5k=;
 b=jmiaP+HJ85uHI0HBWiDUqHqXFMbFbFRNl0knJsV9+/n62dEi62IahVpirkvgj+OqPwwUMrVfX8NTInY6MoT22ujSom4R1il3OEN98gKtO+Zp4WzrgsyAaUwuHj3y/diQvePBQYHMedXYnqEQIszYmwwbij3OR/lv1/OKcsUuVf9RawOiCA3whsTa/+fnVPCOtcyAbmjWM17pIqfDegwk5DZ14AWsGXj7qb53eLLF1vWXKiLsZfpK62SieFTwCdnXVP15r8ysVHjCPxMQ9DwQy61xbDxVGNhiV/DOBow56QdhBN5eKX7GEgT/4rlX2lEuleHMgB3WGDnNqPBcTgmebQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7JpM9eowkOs6q/Wzy+Lj4zAdrPFKWW+4gwnLCEOr5k=;
 b=PWpXf/88XuBl2FD4z0isB9Gp2uqaxwkYEpumpb7AmpshaXpad9ltFOd04zSd13o5lTTeZUa8XXSi9wB0I43O1ewiLrq3bs/Q927FnUMyK4sV1R9YpcnwNxDz1Bd8xZdj45vApIgpgteXC7gbFc7yakdEgphkpeDzBzrFSe/gnbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:14:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:14:38 +0000
Message-ID: <87v84f71ea.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
In-Reply-To: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 15/23] ASoC: amd: Replace playback/capture_only to
 playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:14:38 +0000
X-ClientProxiedBy: TY2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:404:a6::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f22f383-77a6-45f4-cc49-08dc5f5e106c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HLP4hFwRAOXrnXDg+/rswmeAnqJ+Exrg5hfMG9TxBpxfdcTSeoVxhHwPAuIZI4ZQsZoa36WuaJXINWvbRq1yWvPGXA4fBkZAn4sWk48FmPOt33HgyjgZhoKjOOoM1F7sSBfus62L10AILO2IIFjkZLCd48KE3BOIYSrij0U7ftuBejRk91xnWMXe4RwMmbAFfTWrnyppZE/qBHNFK/H5M4Lhr+nAJbzlXQS8+cKLM03mqrsk+lmps+DTlykXgd2xRp1lyp7kGgqYpYdzjk3IEZzc20NKhguM99B+9K2bnDYrdFpd6xhPu9PpklouQjmf8ugmgG+dzVcIs2vuegsdxVzsGOykVfAKBhynA9WqNlkpewQ4Rmj2C9ZgVkidva0z/SJJ7L0KApoxhzT1Hm1+bRabVUaFMBkuoaYo20SKQXjHU9mapum/JIjXeElEih+FH6e9Dv5D4wI4/5Rqghv/QIN5wWHpvY7exgDo4w9Ykv5JJIMfkyKqSBhqiIze3M4vAVCnUR4f+O+4MM0xm6XrjAmOgDQqP/SOOG4AdaSy/UD5omt9MORMl+z5M96ZaKVsR19LkTM7jxHGuomPczT8GRzVihMf6N0+zhn/5pDbix8NNwmQO+bbXa4k75Ik+AtYgm5gYfiCy4g5wkwfoTVlvKuljiJwV2mEOuf6lIuSAGNcSDCs4hkf1gX+KGHHu6q/IkctN78dWxKMgKElqjIEj781JCK0Il4x8R9a6l4v+w8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VKVs+3XrRrEyHyqOpmpS4m6K0JZwiWoH8M4uiNwEL6OdtPEUDXYQQQq60P79?=
 =?us-ascii?Q?yG2AijE5sy1/8Sjgq27JfrO8C0q/YB+ldnb2romnJgzYO1TMmOIByYNu8fH8?=
 =?us-ascii?Q?9g7HRU58jLfmSySMQJ1b9TUfBYiSQVDTjg0f0snm2LGFTl6WZPq0l3U7wNkK?=
 =?us-ascii?Q?N2VE4NtHb4zp0wM09kwbf8QNw9DsfKtB/xN7xCDftujv789kkuOo1Ec+rO/j?=
 =?us-ascii?Q?wON5bykkLsmd+c4mzHIf1bSA2sk1mMQZJf/FM0xXFkhaN2rPaJUpny61KEwt?=
 =?us-ascii?Q?FAOXsG6j/5z2N5MBtzJDkfd4LUmyP1SV79Sxc+8UKQaChY4etMvmN4DzjijP?=
 =?us-ascii?Q?CKXwGZB1M/knLrWTXLZ8rX2nTmvWubuFbtwHa7xgwZEly01aHQxovsor5ZhK?=
 =?us-ascii?Q?y8j9VEwoJkvXdamxHtatPpHFUf4idf4uAZYsDvojkoBlBZtopf2UpjWWWD7p?=
 =?us-ascii?Q?t69BpcPAgA64DCqGkrR88BcJG1nJ5IMJ2wlIZle2QWD9orx5R8jk2Ci30t3i?=
 =?us-ascii?Q?aFo093e7lpMk6Pd0qW3ylbW8nsC8p+2nS4jaHl388K1whR6jqiKM6WjvxHAw?=
 =?us-ascii?Q?+onosad1Wm3BCq3QSx9j4XIhM2yX8IrPz5Z8KQtRrcDCmWh3LQnnXBDPxGvR?=
 =?us-ascii?Q?XLQ0CZfRlBPQ+/4zGchGQNYh5ZShsR3y9Y590aKAOHi+bbtHIdvFDVuYcPi+?=
 =?us-ascii?Q?g63Lv8SBjsZIQysn/ggWtCxDdENM1CNK5L3mwCZ1M8ARfbkkz1jrMutY+tR2?=
 =?us-ascii?Q?6rYkAZIQQv2WKWrDTtgDR7IJK91hQM6SjVDtcCoHW9X0CSKKPscEljni5+yQ?=
 =?us-ascii?Q?Wf76bXloFwrlO6WfzNyxAVA1BAl+XZvfzgBR36wzIQNDqcGlF9RF67ybhBYh?=
 =?us-ascii?Q?ystSglVrGMiMVCiUmBvYJiRc9GYZHcA2pJbpatW4FUPjPv5OhIXHYkAmii2j?=
 =?us-ascii?Q?iBfOCE/SSIBPLN/gD09RNSldueS2RqKBs+ZU8/eLJdXaZTnetZLQdLCCpjLS?=
 =?us-ascii?Q?WRlmwfcKsdA63So7EcLGv7570vRB26Z3XBbBJczIbz0eIHQh635Y2ERtGmJ0?=
 =?us-ascii?Q?poRnH2K8zLgYwqgMxwB8lQQKjbS1a7kftEkHMcV/W1VLfmKPjIeoW4W+CJSE?=
 =?us-ascii?Q?YTUlLreE1OelODsG4T6PN3R3XHsN2znPXQtxrl9XsxN8DZnuQuMR9th/E7S8?=
 =?us-ascii?Q?7oYTcs6rLnxSrlmQnYzue/gIRLaEDiFGm9/ypqirw0q37zh5M5+37JEF4oKn?=
 =?us-ascii?Q?v5eTqmfUAnCwlYqQv02UOB8maQHnpVGX2Tm+6qHnlVaIQ3GsS7BF8YlNLchf?=
 =?us-ascii?Q?ShL+h3Cqdyiv9qZV5eOBOL/K6DY/Uwi77eiss8SGLq4ueB6jT0RJu/KXtC2d?=
 =?us-ascii?Q?fbSB8qbI9BfTGNrFJLFmnGccLbGm2YhbmzoUyUyS5rbe4/aok+Ej7CHscyKX?=
 =?us-ascii?Q?V008sQQ0ny9zrnI4mly9oTOqitX0FQB+3amGMr2FQ83G/Qw2ovzLPMtDdUcg?=
 =?us-ascii?Q?1nJPYVWNgAa6yLN1GCBrywv/7DaUOecLb5UbXbgFCiFurJtAdiC657Sva6Nb?=
 =?us-ascii?Q?4KZs2QQ+mGLTPyrF2p2cG81DyhoXsvMUs6kHx75M5SZtYWoc1j3G4kzTouym?=
 =?us-ascii?Q?RmXia7kKWModH7e9gBs+mOg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4f22f383-77a6-45f4-cc49-08dc5f5e106c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:14:38.7679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TkBUn2c72JSy/KTyW0x/oJviZTN1CtQvF65zNaU0a1QeFT0NboJJMBoNxp3WtYmIQrm/HtKGJiLULspmczf2b/ZHAZPNnhpQCbckpa1qg8JeBrUe/FHb59DSwQ7eoXTZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397
Message-ID-Hash: VOOTZENBOUW34YM5HAISINO2ZGVWP4LU
X-Message-ID-Hash: VOOTZENBOUW34YM5HAISINO2ZGVWP4LU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOOTZENBOUW34YM5HAISINO2ZGVWP4LU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal
comprehensively for playback/capture stream in same code.
This patch converts xxx_only flag to xxx_assertion.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/ps/ps-mach.c         | 2 +-
 sound/soc/amd/renoir/acp3x-rn.c    | 2 +-
 sound/soc/amd/vangogh/acp5x-mach.c | 2 --
 sound/soc/amd/yc/acp6x-mach.c      | 2 +-
 4 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/ps/ps-mach.c b/sound/soc/amd/ps/ps-mach.c
index e675b8f569eb..3d8bac56e8b7 100644
--- a/sound/soc/amd/ps/ps-mach.c
+++ b/sound/soc/amd/ps/ps-mach.c
@@ -31,7 +31,7 @@ static struct snd_soc_dai_link acp63_dai_pdm[] = {
 	{
 		.name = "acp63-dmic-capture",
 		.stream_name = "DMIC capture",
-		.capture_only = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(acp63_pdm, dmic_codec, pdm_platform),
 	},
 };
diff --git a/sound/soc/amd/renoir/acp3x-rn.c b/sound/soc/amd/renoir/acp3x-rn.c
index 5d979a7b77fb..42b8d89fa8a1 100644
--- a/sound/soc/amd/renoir/acp3x-rn.c
+++ b/sound/soc/amd/renoir/acp3x-rn.c
@@ -29,7 +29,7 @@ static struct snd_soc_dai_link acp_dai_pdm[] = {
 	{
 		.name = "acp3x-dmic-capture",
 		.stream_name = "DMIC capture",
-		.capture_only = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(acp_pdm, dmic_codec, platform),
 	},
 };
diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index cd5b075d4b7e..cc902f857af3 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -289,7 +289,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
 		.playback_assertion = 1,
-		.playback_only = 1,
 		.ops = &acp5x_cs35l41_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, cs35l41, platform),
 	},
@@ -388,7 +387,6 @@ static struct snd_soc_dai_link acp5x_8821_98388_dai[] = {
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
 		.playback_assertion = 1,
-		.playback_only = 1,
 		.ops = &acp5x_max98388_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, max98388, platform),
 	},
diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 1760b5d42460..a19f359bedae 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -32,7 +32,7 @@ static struct snd_soc_dai_link acp6x_dai_pdm[] = {
 	{
 		.name = "acp6x-dmic-capture",
 		.stream_name = "DMIC capture",
-		.capture_only = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(acp6x_pdm, dmic_codec, pdm_platform),
 	},
 };
-- 
2.25.1

