Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 608CC7AE5E1
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:29:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C0ABE0D;
	Tue, 26 Sep 2023 08:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C0ABE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709768;
	bh=4E0qIzXLeaURR14CTeTtIpAkcBuC9R42uwlRgrIIrrs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R5uBLu/jnAmKAZpyEj4Xh0Xlgj7h/Q+kPwNueDccRMIf9b9ejKyjVijsvnQP7VKrr
	 cKoINAGFeBLLvONTcvtkvwqlKcP5j8ZOUYk6rwV46NYeNjA7ysTxfjM6t6Ti8uMSI8
	 GfBjVsFReKirSA0R0gqNSNnh+roylyiF5Fp8Q6gY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17271F805E2; Tue, 26 Sep 2023 08:24:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F73FF80553;
	Tue, 26 Sep 2023 08:24:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78077F80578; Tue, 26 Sep 2023 08:24:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67C8CF805AE
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67C8CF805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PZ7CKsMi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHvAl6inpNbQwEmSCJYMfVc1UDcQ24UE8qQ4gN9BoUEyubY6w3sbcapiw3S7GjvEmXlyeyWftYnE1f4ar2Nr0vMtGFiQeLkBHSyTF4+p2S4x3kOQ8pAlAWSwi+OQfy+TDQfF7HBSsDk71FdWpqgNv+LRWwZ8Uoda7NiZ2fqgG4w8+xpiQ/s4dEZ5HOl6c9asGQdnJ24Bv2QESaDSfcXlm3BzX69OeJNXTJGCfJHy0xrhLgtyGEAJzPjkXFoYnIvFy/SqVYjsiDOQVmXBX94jpEf+vrNXA2EmJ0K+ZBOqssK+M/U3VNCfuaPieEUTSPEQbpVaQKfsyCmYk8/QFGIE0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJugF1yr62rFnjR8txIGiF2BJOKeRTKyica+lMvGcio=;
 b=DYrUnVKUuGCrfdc7M+TPMUtfA4cQwVW865U3kGfboEDO/OvAlLbs03xLRMduVWovPD7zTS5TIwYX0bV2NPIHRnWlfhdfMOlrempXPpKnqr7Nj8WeyPO0vjz4Cp/n3WngXIGPIZ7WpsQrYXlrDjrJRkrH2HmzneZJ/3HixeQ9iYWji+kF4PGuZ4tQCdvyyA+03QGwdjmz2N4F0bTOVqhP/6JTsx45E30y1jMGhRvJEi3pVjxqLRtEDPPAgcXqd9UbOpcYja7pGH6PaXWpLkVHlFxAvTiFsvZpOzuOkoSNRCZpGUB/Cvw2kgua6mFvMyA8D+/FTjBJkzdJkujBGGKBNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJugF1yr62rFnjR8txIGiF2BJOKeRTKyica+lMvGcio=;
 b=PZ7CKsMi3BvPNKUio99aDCJo54CNzIipaeh/aSlBJw/sxzNiz8bz+MJBA/KqlvzGR2tiUdxgWoVDAejFMMcbpWQ6cFvpH+ZXlzguyCK/wl4qk7OxTl9QutA3jBHdCW9UHbFKaEYhJ5sVejTJ1je6vy6T+wc0BmD9CivJfdsDRFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6175.jpnprd01.prod.outlook.com (2603:1096:400:4b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:23:36 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:23:36 +0000
Message-ID: <877codh2qg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22N=C3=ADcolas_F=2E_R=2E_A=2E_Prado=22?=
 <nfraprado@collabora.com>, Ajye Huang
 <ajye_huang@compal.corp-partner.google.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Ricardo
 Ribalda Delgado <ribalda@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 30/54] ASoC: mediatek: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:23:35 +0000
X-ClientProxiedBy: TYCP286CA0127.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: f37e50e8-bbf6-4e46-b467-08dbbe591d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y2MB7Yl2zKzPiC6G2QRNodTlA8cJeMl6mrlrtG8Eat/8wQBRj5hH0h8mz4ezsm3vLru+7rotDCTpOQme5oq3qmWp3g2Ax6ee4j7Ts0Yr50q1A4Eoa0+Yk4/ToU36mtDDjfbIMPNN8VzaZXh3dmJqnC18TUMKzDLfiVFZSuzlJtMiN/wM0C4oc2DAOvjHJsbISNDt8L2nqQRLNmmvVuBo75GIWGI+w/wBNQSfYhJmgObzX8WEz87pKioGya/kbvES6hWaV1Lu/fKSlaRd3y9NTb64TuDt73PhrfFQhBKxPc5UqsAEYN9Tm13/CGB9DFBge/aTZOAwYrv2FfdmrrsKNILLomg2JLpFrCzCmcVrAGY9auUnCQHdmL1qN9YmMypMmqQOZRkOIBb22n8dAvEG7waJZfcR4ahA877vqzvsS+tvgqjnzPBvZMo5jB9RljHFsX3M6Ml2TrHpOf+N7uYJqbVv6D1QBEq9foi9e7cFFwMUoyXDgkn+0kxiVmAdT4VXyfNY6nGuwz7tQEQKvmvM0riCHb/bjgB4XYY14AJn9vxwchQrtsLWbh460WuRQCY2rdsOsaJ7tPyo6Y04WMjWObbvoofKtFdyux4bOT8xImQK1RTY9X8rLiPcUtBLXuNYkDVmeE7yKJQ4rFx4hicdRavIP8CEl8BazUep0SRDpjE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(921005)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(30864003)(41300700001)(7416002)(21314003)(559001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fVaTDurvRJT5qjY5WZqxyn+uT4ihPWXL0KqIjPmb5hOOmUm8oG0X4m20T/ID?=
 =?us-ascii?Q?1PZQXEhMu2TKgPSuRVwP0lBrVv+dTByNvfh3wwejEXannLfSsnmM/0iToTy5?=
 =?us-ascii?Q?mmP1zUkKuu19Xcj0RAW8iIT7lLJuxypoz04x9N8UDpd2LXq1CmmuAYguOhbm?=
 =?us-ascii?Q?e+u6sWAABSMucUsJAYVvoQTsv46GXVRiNAuKGW/GETJFb/2IKIWJsrJ6z+CW?=
 =?us-ascii?Q?ImM1Kw0VYlIOheGOUpr13eMuUyu1JWYt8fsD04/ke814k+fVqeUdBg1hAdhk?=
 =?us-ascii?Q?Q74RCGJesbQqs8NADgb7at5yjcw0BhNzNYl3+83dcUviMsYr5+H4URVj3gt4?=
 =?us-ascii?Q?R54KrFEtLBb98vIOippdswf9mnJAmAQG9CLcn0JaZisV+nMTmtEH80oz+XDn?=
 =?us-ascii?Q?uQld/Sxjs7g7QcJeZ2ayjL4a8GVSVBDnB9oB/0BUYlhpwuJsVx+wmp4JycHo?=
 =?us-ascii?Q?tNjfatSHsLbG44D8e0Ewqoi32Ju/JSM2+j/Zh3jueZTCTSVi4ZivTXAI7kX/?=
 =?us-ascii?Q?ZK11CM7LqPi/uZ0UIzNQImcPN67JdtgOfKi3dVF1u6c8dTXfnD7yzsuVpTzX?=
 =?us-ascii?Q?iKFF6JfdCEuKo+i9d4fy6IWymEF7i+WcLOxz3CAB57rhaDAviluH9ZWGSuf5?=
 =?us-ascii?Q?LbJINXXnAOMl+TBQgsD5pig/Tu5SgeoTN2LHhV0S6RNYTnKMrjDIsKWqfT5h?=
 =?us-ascii?Q?G6ONNYbzkmHxujkI8MR3EaZKawq7dY4AbbWIlZJakrml7Nc5ZZK3lRp5Yxy6?=
 =?us-ascii?Q?4lslSYC8xChB0zw2j39jBlfZDYLGAIdnaJPVNJrdu9OvHA6W09ZK4+V3pqZ2?=
 =?us-ascii?Q?bXbdrwZ8qTbnw3c6VxqQkYeVCpq0iB7pup330V+pIxEH+/5V5BJ02Pyh3ACp?=
 =?us-ascii?Q?iwcPzhsE/bnmUAGBTCh/OhVJuVsSX42f/J1HCSmJUwM8KcfRcq+OIABIsVRz?=
 =?us-ascii?Q?aBeFwj925rkhZ6ciOfCIpQi7nnmkDvEcsa9wu+FYGvP/gWck+PdINM5CFTq1?=
 =?us-ascii?Q?mEvFDg89cFbq19/uSw0L3L9AXf6tgFWhFMwAEMIIy8nm6RyF64k4C4Gn/B1o?=
 =?us-ascii?Q?1qVzhWmJIqiG8kVPkpxIz8ew6h/plTjOF2sLyiumxIioSyptL4rqWof6yTXJ?=
 =?us-ascii?Q?goOhc+tagVQxhQ+mENDCcZuGHveRCPa7y4H/3kVrOfCotqblrDxkG3O3D2Ap?=
 =?us-ascii?Q?nXP9pzYZW9BhJLag6ZpMdkvHcUy56hOyUVraYxESA7qQ5dgoxO8a7IRUuWFC?=
 =?us-ascii?Q?zTF1r5+EbUqVl21pw5aTEcvGKrBiy8x/uqyu2tqNoQCJhtPvME12yEbzxGGZ?=
 =?us-ascii?Q?GNAkD0z1IuuyzVQoGTE1fIfkX8ME92fyBPNVuSLB/RsgsivyzolpTaYKBaG2?=
 =?us-ascii?Q?vdIthVKv1PHh/6Atu4tc97YfdDNkcSkdzwiULBWoehmCxEkyxO9OgCr6Debv?=
 =?us-ascii?Q?qcHZoMq6neF+MGGhzR3mXg6EV6B5YMRnUJdVFxaamwatafdN4tn+1uqHnPFI?=
 =?us-ascii?Q?E3EUk7/hgzSSWSkoUab3YFzNavIE3fA1zbnTfm/cvYhTpHxFpFDh4TzX/PqC?=
 =?us-ascii?Q?aYG97JLOMYMc4MozlvSlAR5GOSQCdZjiYpbbbMdg3EXx4ydL4QUb5QJL3hK5?=
 =?us-ascii?Q?seXD10FkOMEPpqbnAvNaD98=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f37e50e8-bbf6-4e46-b467-08dbbe591d71
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:23:36.1423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mYLcGBqwscKlIMzyTdppXYjV/ccKtpAyvwYFVOQj72KfqYUENT/aQHCC9mU6vpgdvyOQ7PPo1hbdewPLzCLWVBSBofml5VCZAMJm/m+gJk+Q/W1JWrr7dBa/I4eNA5e/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6175
Message-ID-Hash: PCY4UAMSJV3373VNRV3T6EDK2K2K6CBH
X-Message-ID-Hash: PCY4UAMSJV3373VNRV3T6EDK2K2K6CBH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PCY4UAMSJV3373VNRV3T6EDK2K2K6CBH/>
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
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    | 22 ++++++++--------
 .../mediatek/common/mtk-afe-platform-driver.c |  4 +--
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c    |  4 +--
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    |  6 ++---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |  6 ++---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c    |  6 ++---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c    |  4 +--
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |  6 ++---
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  4 +--
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    |  6 ++---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     |  8 +++---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    |  6 ++---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 14 +++++-----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 18 ++++++-------
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 12 ++++-----
 .../mediatek/mt8186/mt8186-mt6366-common.c    |  2 +-
 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 14 +++++-----
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 12 ++++-----
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |  8 +++---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 22 ++++++++--------
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |  6 ++---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 22 ++++++++--------
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 10 +++----
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 26 +++++++++----------
 24 files changed, 124 insertions(+), 124 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 395be97f13ae..3044d9ab3d4d 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -37,10 +37,10 @@ static int mtk_regmap_write(struct regmap *map, int reg, unsigned int val)
 int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 		       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int memif_num = asoc_rtd_to_cpu(rtd, 0)->id;
+	int memif_num = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[memif_num];
 	const struct snd_pcm_hardware *mtk_afe_hardware = afe->mtk_afe_hardware;
 	int ret;
@@ -98,9 +98,9 @@ EXPORT_SYMBOL_GPL(mtk_afe_fe_startup);
 void mtk_afe_fe_shutdown(struct snd_pcm_substream *substream,
 			 struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	struct mtk_base_afe_memif *memif = &afe->memif[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct mtk_base_afe_memif *memif = &afe->memif[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	int irq_id;
 
 	irq_id = memif->irq_usage;
@@ -120,9 +120,9 @@ int mtk_afe_fe_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *params,
 			 struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	int ret;
 	unsigned int channels = params_channels(params);
@@ -196,10 +196,10 @@ EXPORT_SYMBOL_GPL(mtk_afe_fe_hw_free);
 int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	struct mtk_base_afe_irq *irqs = &afe->irqs[memif->irq_usage];
 	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
@@ -263,9 +263,9 @@ EXPORT_SYMBOL_GPL(mtk_afe_fe_trigger);
 int mtk_afe_fe_prepare(struct snd_pcm_substream *substream,
 		       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd  = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd  = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int pbuf_size;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -523,7 +523,7 @@ EXPORT_SYMBOL_GPL(mtk_memif_set_rate);
 int mtk_memif_set_rate_substream(struct snd_pcm_substream *substream,
 				 int id, unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 01501d5747a7..32edcb6d5219 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -80,9 +80,9 @@ EXPORT_SYMBOL_GPL(mtk_afe_add_sub_dai_control);
 snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	struct mtk_base_afe_memif *memif = &afe->memif[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct mtk_base_afe_memif *memif = &afe->memif[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	const struct mtk_base_memif_data *memif_data = memif->data;
 	struct regmap *regmap = afe->regmap;
 	struct device *dev = afe->dev;
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index c9d4420e9b4c..86885117f7f7 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -494,10 +494,10 @@ static int mt2701_dlm_fe_trigger(struct snd_pcm_substream *substream,
 static int mt2701_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int fs;
 
-	if (asoc_rtd_to_cpu(rtd, 0)->id != MT2701_MEMIF_ULBT)
+	if (snd_soc_rtd_to_cpu(rtd, 0)->id != MT2701_MEMIF_ULBT)
 		fs = mt2701_afe_i2s_fs(rate);
 	else
 		fs = (rate == 16000 ? 1 : 0);
diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 08ef109744c7..fc80e2cfb5b9 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -127,9 +127,9 @@ static const struct snd_soc_ops mt2701_cs42448_48k_fe_ops = {
 static int mt2701_cs42448_be_ops_hw_params(struct snd_pcm_substream *substream,
 					   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int mclk_rate;
 	unsigned int rate = params_rate(params);
 	unsigned int div_mclk_over_bck = rate > 192000 ? 2 : 4;
diff --git a/sound/soc/mediatek/mt2701/mt2701-wm8960.c b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
index a184032c15b6..8a6643bfe830 100644
--- a/sound/soc/mediatek/mt2701/mt2701-wm8960.c
+++ b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
@@ -24,9 +24,9 @@ static const struct snd_kcontrol_new mt2701_wm8960_controls[] = {
 static int mt2701_wm8960_be_ops_hw_params(struct snd_pcm_substream *substream,
 					  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	unsigned int mclk_rate;
 	unsigned int rate = params_rate(params);
 	unsigned int div_mclk_over_bck = rate > 192000 ? 2 : 4;
diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index 43038444c43d..da7267c684b1 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -139,18 +139,18 @@ static const struct snd_pcm_hardware mt6797_afe_hardware = {
 static int mt6797_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 
 	return mt6797_rate_transform(afe->dev, rate, id);
 }
 
 static int mt6797_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 06269f7e3756..b6291b7c811e 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -480,10 +480,10 @@ static int mt8173_afe_hdmi_trigger(struct snd_pcm_substream *substream, int cmd,
 static int mt8173_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	struct mtk_base_afe_memif *memif = &afe->memif[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct mtk_base_afe_memif *memif = &afe->memif[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	int fs;
 
 	if (memif->data->id == MT8173_AFE_MEMIF_DAI ||
diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index bfb2094758ff..3c5c22132c92 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -52,8 +52,8 @@ static const struct snd_kcontrol_new mt8173_max98090_controls[] = {
 static int mt8173_max98090_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	return snd_soc_dai_set_sysclk(codec_dai, 0, params_rate(params) * 256,
 				      SND_SOC_CLOCK_IN);
@@ -67,7 +67,7 @@ static int mt8173_max98090_init(struct snd_soc_pcm_runtime *runtime)
 {
 	int ret;
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
 
 	/* enable jack detection */
 	ret = snd_soc_card_jack_new_pins(card, "Headphone", SND_JACK_HEADSET,
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index e502cd1670ba..fe1235d3de64 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -54,7 +54,7 @@ static struct snd_soc_jack_pin mt8173_rt5650_rt5514_jack_pins[] = {
 static int mt8173_rt5650_rt5514_hw_params(struct snd_pcm_substream *substream,
 					  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
@@ -84,7 +84,7 @@ static struct snd_soc_jack mt8173_rt5650_rt5514_jack;
 static int mt8173_rt5650_rt5514_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
 	int ret;
 
 	rt5645_sel_asrc_clk_src(component,
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index ffb094284bfb..892387c4dd18 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -58,7 +58,7 @@ static struct snd_soc_jack_pin mt8173_rt5650_rt5676_jack_pins[] = {
 static int mt8173_rt5650_rt5676_hw_params(struct snd_pcm_substream *substream,
 					  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
@@ -88,8 +88,8 @@ static struct snd_soc_jack mt8173_rt5650_rt5676_jack;
 static int mt8173_rt5650_rt5676_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
-	struct snd_soc_component *component_sub = asoc_rtd_to_codec(runtime, 1)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *component_sub = snd_soc_rtd_to_codec(runtime, 1)->component;
 	int ret;
 
 	rt5645_sel_asrc_clk_src(component,
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 18cf84bb25c7..0be737a11701 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -68,7 +68,7 @@ static struct snd_soc_jack_pin mt8173_rt5650_jack_pins[] = {
 static int mt8173_rt5650_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int mclk_clock;
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
@@ -114,8 +114,8 @@ static struct snd_soc_jack mt8173_rt5650_jack, mt8173_rt5650_hdmi_jack;
 static int mt8173_rt5650_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
-	const char *codec_capture_dai = asoc_rtd_to_codec(runtime, 1)->name;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
+	const char *codec_capture_dai = snd_soc_rtd_to_codec(runtime, 1)->name;
 	int ret;
 
 	rt5645_sel_asrc_clk_src(component,
@@ -166,7 +166,7 @@ static int mt8173_rt5650_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	return snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component,
+	return snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component,
 					  &mt8173_rt5650_hdmi_jack, NULL);
 }
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 90422ed2bbcc..9e432ed9124b 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -142,18 +142,18 @@ static const struct snd_pcm_hardware mt8183_afe_hardware = {
 static int mt8183_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 
 	return mt8183_rate_transform(afe->dev, rate, id);
 }
 
 static int mt8183_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 701fbcc0f2c9..a0b4eeece9b7 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -47,12 +47,12 @@ static struct snd_soc_jack_pin mt8183_da7219_max98357_jack_pins[] = {
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 128;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
 
-	return snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0),
+	return snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0),
 				      0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
@@ -63,7 +63,7 @@ static const struct snd_soc_ops mt8183_mt6358_i2s_ops = {
 static int mt8183_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 256;
@@ -71,7 +71,7 @@ static int mt8183_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 	unsigned int freq;
 	int ret = 0, j;
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0,
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0), 0,
 				     mclk_fs, SND_SOC_CLOCK_OUT);
 	if (ret < 0)
 		dev_err(rtd->dev, "failed to set cpu dai sysclk\n");
@@ -104,7 +104,7 @@ static int mt8183_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 
 static int mt8183_da7219_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0, j;
 
@@ -132,7 +132,7 @@ static int
 mt8183_da7219_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int rate = params_rate(params);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0, i;
@@ -383,7 +383,7 @@ static int mt8183_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	return snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component,
+	return snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component,
 					  &priv->hdmi_jack, NULL);
 }
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 850f4d949d97..1771c26b0445 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -43,12 +43,12 @@ struct mt8183_mt6358_ts3a227_max98357_priv {
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 128;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
 
-	return snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0),
+	return snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0),
 				      0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
@@ -60,7 +60,7 @@ static int
 mt8183_mt6358_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 128;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
@@ -84,7 +84,7 @@ mt8183_mt6358_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	return snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0),
+	return snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0),
 				      0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
@@ -302,7 +302,7 @@ SND_SOC_DAILINK_DEFS(tdm,
 
 static int mt8183_mt6358_tdm_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mt8183_mt6358_ts3a227_max98357_priv *priv =
 		snd_soc_card_get_drvdata(rtd->card);
 	int ret;
@@ -321,7 +321,7 @@ static int mt8183_mt6358_tdm_startup(struct snd_pcm_substream *substream)
 
 static void mt8183_mt6358_tdm_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mt8183_mt6358_ts3a227_max98357_priv *priv =
 		snd_soc_card_get_drvdata(rtd->card);
 	int ret;
@@ -345,7 +345,7 @@ static int
 mt8183_mt6358_ts3a227_max98357_wov_startup(
 	struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct mt8183_mt6358_ts3a227_max98357_priv *priv =
 			snd_soc_card_get_drvdata(card);
@@ -358,7 +358,7 @@ static void
 mt8183_mt6358_ts3a227_max98357_wov_shutdown(
 	struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct mt8183_mt6358_ts3a227_max98357_priv *priv =
 			snd_soc_card_get_drvdata(card);
@@ -388,7 +388,7 @@ mt8183_mt6358_ts3a227_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	return snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component,
+	return snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component,
 					  &priv->hdmi_jack, NULL);
 }
 
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index b86159f70a33..bfcfc68ac64d 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -43,7 +43,7 @@ static int mt8186_fe_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	const struct snd_pcm_hardware *mtk_afe_hardware = afe->mtk_afe_hardware;
 	int ret;
@@ -85,7 +85,7 @@ static void mt8186_fe_shutdown(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	int irq_id = memif->irq_usage;
 
@@ -106,7 +106,7 @@ static int mt8186_fe_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
 	int ret;
@@ -157,7 +157,7 @@ static int mt8186_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	int irq_id = memif->irq_usage;
 	struct mtk_base_afe_irq *irqs = &afe->irqs[irq_id];
@@ -256,7 +256,7 @@ static int mt8186_memif_fs(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 
 	return mt8186_rate_transform(afe->dev, rate, id);
 }
@@ -293,7 +293,7 @@ static int mt8186_fe_prepare(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	int irq_id = memif->irq_usage;
 	struct mtk_base_afe_irq *irqs = &afe->irqs[irq_id];
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
index 4e66603d4cdb..fa08eb0654d8 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
@@ -18,7 +18,7 @@ int mt8186_mt6366_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *cmpnt_afe =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index aa8e00bba19b..f795190f92a2 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -77,7 +77,7 @@ static int mt8186_da7219_init(struct snd_soc_pcm_runtime *rtd)
 	struct mt8186_mt6366_da7219_max98357_priv *priv = soc_card_data->mach_priv;
 	struct snd_soc_jack *jack = &priv->headset_jack;
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	ret = mt8186_dai_i2s_set_share(afe, "I2S1", "I2S0");
@@ -111,7 +111,7 @@ static int mt8186_da7219_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8186_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 256;
@@ -119,7 +119,7 @@ static int mt8186_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 	unsigned int freq;
 	int ret, j;
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0,
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0), 0,
 				     mclk_fs, SND_SOC_CLOCK_OUT);
 	if (ret < 0) {
 		dev_err(rtd->dev, "failed to set cpu dai sysclk: %d\n", ret);
@@ -159,7 +159,7 @@ static int mt8186_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 
 static int mt8186_da7219_i2s_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0, j;
 
@@ -189,7 +189,7 @@ static int mt8186_mt6366_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *r
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_soc_card_data *soc_card_data =
 		snd_soc_card_get_drvdata(rtd->card);
 	struct mt8186_mt6366_da7219_max98357_priv *priv = soc_card_data->mach_priv;
@@ -281,7 +281,7 @@ static int mt8186_mt6366_da7219_max98357_playback_startup(struct snd_pcm_substre
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
@@ -327,7 +327,7 @@ static int mt8186_mt6366_da7219_max98357_capture_startup(struct snd_pcm_substrea
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 9c11016f032c..6be33892be0a 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -169,7 +169,7 @@ static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
 	struct snd_soc_jack *jack = &priv->headset_jack;
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	ret = mt8186_dai_i2s_set_share(afe, "I2S1", "I2S0");
@@ -202,8 +202,8 @@ static int mt8186_rt5682s_i2s_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 128;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
@@ -253,7 +253,7 @@ static int mt8186_mt6366_rt1019_rt5682s_hdmi_init(struct snd_soc_pcm_runtime *rt
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_soc_card_data *soc_card_data =
 		snd_soc_card_get_drvdata(rtd->card);
 	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
@@ -345,7 +345,7 @@ static int mt8186_mt6366_rt1019_rt5682s_playback_startup(struct snd_pcm_substrea
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
@@ -391,7 +391,7 @@ static int mt8186_mt6366_rt1019_rt5682s_capture_startup(struct snd_pcm_substream
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 5e14655c5617..46d6a5540403 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -98,7 +98,7 @@ static int mt8188_memif_fs(struct snd_pcm_substream *substream,
 	struct mtk_base_afe_memif *memif = NULL;
 	struct mtk_dai_memif_priv *memif_priv = NULL;
 	int fs = mt8188_afe_fs_timing(rate);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 
 	if (id < 0)
 		return -EINVAL;
@@ -303,7 +303,7 @@ static int mt8188_afe_fe_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int ret;
 
 	ret = mtk_afe_fe_startup(substream, dai);
@@ -336,7 +336,7 @@ static int mt8188_afe_fe_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	const struct mtk_base_memif_data *data = memif->data;
 	const struct mt8188_afe_channel_merge *cm = mt8188_afe_found_cm(dai);
@@ -360,7 +360,7 @@ static int mt8188_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	const struct mt8188_afe_channel_merge *cm = mt8188_afe_found_cm(dai);
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime * const runtime = substream->runtime;
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	struct mtk_base_afe_irq *irqs = &afe->irqs[memif->irq_usage];
 	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index e2416b981e1f..1564eaa1b290 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -338,7 +338,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *cmpnt_afe =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_dapm_widget *pin_w = NULL, *w;
 	struct mtk_base_afe *afe;
 	struct mt8188_afe_private *afe_priv;
@@ -500,7 +500,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 static int mt8188_mt6359_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	/* set mtkaif protocol */
 	mt6359_set_mtkaif_protocol(cmpnt_codec,
@@ -556,7 +556,7 @@ static int mt8188_dptx_hw_params(struct snd_pcm_substream *substream,
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 256;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
-	struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	return snd_soc_dai_set_sysclk(dai, 0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
@@ -581,7 +581,7 @@ static int mt8188_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
 	struct mt8188_mt6359_priv *priv = soc_card_data->mach_priv;
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 
 	ret = snd_soc_card_jack_new_pins(rtd->card, "HDMI Jack",
@@ -607,7 +607,7 @@ static int mt8188_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
 	struct mt8188_mt6359_priv *priv = soc_card_data->mach_priv;
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 
 	ret = snd_soc_card_jack_new_pins(rtd->card, "DP Jack", SND_JACK_LINEOUT,
@@ -655,7 +655,7 @@ static int mt8188_max98390_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	unsigned int bit_width = params_width(params);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	int i;
 
@@ -728,7 +728,7 @@ static int mt8188_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card = rtd->card;
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mt8188_mt6359_priv *priv = soc_card_data->mach_priv;
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_jack *jack = &priv->headset_jack;
 	int ret;
 
@@ -774,7 +774,7 @@ static int mt8188_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 
 static void mt8188_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_component_set_jack(component, NULL, NULL);
 }
@@ -782,8 +782,8 @@ static void mt8188_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
 static int mt8188_nau8825_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int rate = params_rate(params);
 	unsigned int bit_width = params_width(params);
 	int clk_freq, ret;
@@ -816,7 +816,7 @@ static const struct snd_soc_ops mt8188_nau8825_ops = {
 static int mt8188_sof_be_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *cmpnt_afe = NULL;
 	struct snd_soc_pcm_runtime *runtime;
 
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index d0520e7e1d79..bdd1e91824d9 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -42,11 +42,11 @@ static const struct snd_pcm_hardware mt8192_afe_hardware = {
 static int mt8192_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 
 	return mt8192_rate_transform(afe->dev, rate, id);
 }
@@ -59,7 +59,7 @@ static int mt8192_get_dai_fs(struct mtk_base_afe *afe,
 
 static int mt8192_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 5e163e23a207..fe3562ea83ce 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -58,9 +58,9 @@ static struct snd_soc_jack_pin mt8192_jack_pins[] = {
 static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 128;
@@ -93,10 +93,10 @@ static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 static int mt8192_rt5682x_i2s_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 128;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
@@ -149,7 +149,7 @@ static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *cmpnt_afe =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int phase;
@@ -306,7 +306,7 @@ static int mt8192_mt6359_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *cmpnt_afe =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 
@@ -327,7 +327,7 @@ static int mt8192_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mt8192_mt6359_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_jack *jack = &priv->headset_jack;
 	int ret;
@@ -360,7 +360,7 @@ static int mt8192_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8192_mt6359_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mt8192_mt6359_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	int ret;
 
@@ -406,7 +406,7 @@ mt8192_mt6359_cap1_startup(struct snd_pcm_substream *substream)
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
@@ -453,7 +453,7 @@ mt8192_mt6359_rt5682_startup(struct snd_pcm_substream *substream)
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index a0f2012211fb..1e33863c85ca 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -88,7 +88,7 @@ static int mt8195_memif_fs(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component =
 			snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	int fs = mt8195_afe_fs_timing(rate);
 
@@ -284,7 +284,7 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
@@ -313,7 +313,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
@@ -345,7 +345,7 @@ static int mt8195_afe_fe_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int ret = 0;
 
 	mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
@@ -382,7 +382,7 @@ static int mt8195_afe_fe_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	const struct mtk_base_memif_data *data = memif->data;
 	const struct mt8195_afe_channel_merge *cm = mt8195_afe_found_cm(dai);
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index ceca882ecff7..9138f38861ff 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -146,7 +146,7 @@ static int mt8195_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *cmpnt_afe =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtkaif_param *param = &afe_priv->mtkaif_params;
@@ -307,7 +307,7 @@ static int mt8195_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 static int mt8195_mt6359_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	/* set mtkaif protocol */
 	mt6359_set_mtkaif_protocol(cmpnt_codec,
@@ -338,7 +338,7 @@ static int mt8195_hdmitx_dptx_startup(struct snd_pcm_substream *substream)
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
@@ -369,7 +369,7 @@ static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	return snd_soc_dai_set_sysclk(cpu_dai, 0, params_rate(params) * 256,
 				      SND_SOC_CLOCK_OUT);
@@ -384,7 +384,7 @@ static int mt8195_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
 	struct mt8195_mt6359_priv *priv = soc_card_data->mach_priv;
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	ret = snd_soc_card_jack_new(rtd->card, "DP Jack", SND_JACK_LINEOUT,
@@ -400,7 +400,7 @@ static int mt8195_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
 	struct mt8195_mt6359_priv *priv = soc_card_data->mach_priv;
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
@@ -442,7 +442,7 @@ static int mt8195_playback_startup(struct snd_pcm_substream *substream)
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
@@ -488,7 +488,7 @@ static int mt8195_capture_startup(struct snd_pcm_substream *substream)
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
@@ -520,8 +520,8 @@ static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int rate = params_rate(params);
 	int bitwidth;
 	int ret;
@@ -563,7 +563,7 @@ static const struct snd_soc_ops mt8195_rt5682_etdm_ops = {
 static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
 	struct mt8195_mt6359_priv *priv = soc_card_data->mach_priv;
 	struct snd_soc_jack *jack = &priv->headset_jack;
@@ -603,7 +603,7 @@ static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8195_rt1011_etdm_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_card *card = rtd->card;
 	int srate, i, ret;
@@ -636,7 +636,7 @@ static const struct snd_soc_ops mt8195_rt1011_etdm_ops = {
 static int mt8195_sof_be_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *cmpnt_afe = NULL;
 	struct snd_soc_pcm_runtime *runtime;
 
-- 
2.25.1

