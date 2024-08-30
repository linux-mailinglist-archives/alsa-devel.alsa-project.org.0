Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5FA96593E
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 09:57:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50E2EDFA;
	Fri, 30 Aug 2024 09:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50E2EDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725004666;
	bh=A15YJzY1qhx8KX1nJzNIBo/WJOJtf4o1q43EerfhYkI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NEZo3X5qeuh6HjhhugQyqbxGfrtpnOvl2R6oHJotKIzfnY/bh+lxM0LJyusUA913V
	 xes4V9lVLpANMRuyimXB/gPgNIGF8+fUiIhPy7o68mgwAbGQDqoc4H/kXjJUxfOy7j
	 P2Ea9RjU2rVlsA5yRyelbBGt+ObJ51bajI+HFYG8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F340F8065B; Fri, 30 Aug 2024 09:56:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58522F8065A;
	Fri, 30 Aug 2024 09:56:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31DADF80518; Fri, 30 Aug 2024 03:48:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2011::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC165F80107
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 03:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC165F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256
 header.s=selector2 header.b=l92OZ3OD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0gwWT97K48pGZT5JV26W0GRtGSYfemoC0nQk2Kc15GzKjll2fNJHInSLcGCSMN7AolYgBlntx++TfyQM6AeYraKthFjY+PVVlqDgEXRUFM3/knEIkAu2PYOlKMWTxe1iVMQh+SVQV3V/EaFBQL4iKzpwIj3BGe3wl8YlKYIEFKbwNLhZr+2aWorY2qQenDyNlli8Y9vwXyjkS+70bV9OhaXHO2Cvd8vVwofa/9wQJZh0cioxYxl7ZIO7SIlFBD72bze7UFfNAEC/R1XeHuF+jOEISkUWchIX61y7TRbevw1a02NDoI7o7PmwpRH5THAQTl0BPkE/IxilYcKOmnz4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbjuffi6XHC3kp3srWJC1x1H8hOZ3aOyE5nPqHHx6Y0=;
 b=a4HR4Kc3evt69hnwQX3O6HIY+w0DZilwDaFbpNtt72fU/zxEtpVNGXc9Ar2ufHS9FDEmJA29jN56qhMGxgogwHsa4qXP4X8bPpBeO/meHvhrBXYvzlmBD0/XZI0qc2ht8ft9Q8cVk0OSNIbJdX1zmtIOlh68D/0noj3WO+B/PygbLpJTMMpz+uLtrrCcpy+PsKUnV20Dm88mdjYm0Kssh40lJ+cXN5sUjJBB7diF9OqMLeJCEe6N7BTnp/J2NIQpnAk78OWXM82z8tvpUOcnIznIEUUfGT1cK6gTxyAxu6DfkyrejmHMLVfJt6N/Ccd2quBnbZTCZHULooL0xOtYlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbjuffi6XHC3kp3srWJC1x1H8hOZ3aOyE5nPqHHx6Y0=;
 b=l92OZ3OD/eY0KVp9NsDap6oXOchMEmRI/JFl+drpUhiCO1iVFKWuKFiLRn1hXTN/QE0JwRAxmrTBpwTJfB8B0TGgMoESvcGetPqSkGdEpgWm0veu/tES+kRqvcwAp3NuXHlE7xK5zUjmRJBXQG4Y1f+YUJq933mbYgzgUBbb/kctbVwXYMs80yqdDRUUG3koHLH6pL47aJMdvkRdNURH+x9Ji8nGW723Qa9RqY9wX8i0kqiF8yFleIPrYDkm0eWfsHCNsfFj86Vxn4kE9wWmbHngw+EBfGXtTbTFD1o8i296EMgshJpC4R70mgpSWc8Y4xyNRoaeGj2s02JBbcdLXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com (2603:1096:400:33d::14)
 by KL1PR06MB6071.apcprd06.prod.outlook.com (2603:1096:820:ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 01:47:47 +0000
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268]) by TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268%6]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 01:47:47 +0000
From: Yang Ruibin <11162571@vivo.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Yang Ruibin <11162571@vivo.com>
Subject: [PATCH v1] ASoC: codecs: Switch to use dev_err_probe()
Date: Fri, 30 Aug 2024 09:47:32 +0800
Message-Id: <20240830014733.3467006-1-11162571@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::14) To TYZPR06MB6263.apcprd06.prod.outlook.com
 (2603:1096:400:33d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6263:EE_|KL1PR06MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e3fc521-e351-40e5-f297-08dcc895bf72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|81742002;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8NFc3vAKPpFXwFA22EPp78m3CXr0FXZVr/0B4xAaDXXvFAn++/2ZlExyGhZM?=
 =?us-ascii?Q?pho5j5jm/JCrjL82Vsq4rxPfYDAIm/5IEgVBfqDescj5Cmfd+jCSRJMMhniq?=
 =?us-ascii?Q?Uycc1P23sVAfYdZRB3yD3JhKQZE/F4UvSn83JEWbnjLDvaHawkyMM6rPdAJt?=
 =?us-ascii?Q?w0biO8Titg+UaZoMuuvHos0ydyroQkRuvkUL5LiSQeFlqdLkzDjxwOQsePtc?=
 =?us-ascii?Q?avLS3OjpbYFis0TqRx2HTgGbxyTtI352xf6TwScb5UhCQ3ZyZRi1dehMey6z?=
 =?us-ascii?Q?CfFtB5GT0YwxOTjtukGWya/gYIceNgNEwkmgp41FIIM1d2ZA+54W+oEkii5F?=
 =?us-ascii?Q?KVihfdZem4sqRpI1a9FUch6Ui6j07wOdCfmuCVsj1FnpDUGqA9kSgMR9GukN?=
 =?us-ascii?Q?oUBAG1Kws/xXdbavQfWOoK65nmUJy776JZmcjTo0VzP+4J01p7X1Hb6oT2w5?=
 =?us-ascii?Q?rwbVUAfOANT8kI2Xcusfm+2xGgid4HCoLgbzvwXQdWRGIUc7xltb1MYrkwcU?=
 =?us-ascii?Q?1JlIVzTp6gBsCGBZAHGePcsx0bIBFR0NwyqcjDxJiaAOk26IkLY6h+gH5zS7?=
 =?us-ascii?Q?B9M/yI0XR16B3lASLJjGYoswEbdLmKfm1YrBebbv7UzS5K6WQF72IYxcppB5?=
 =?us-ascii?Q?AZ8S+KqxgCPnDdxsrNiZi4JcOVAf0XRuBSkkEJRnuntzBmikgfdrN7B+lr2t?=
 =?us-ascii?Q?FsD+PREbvpkxLwmVCutVu2GPe3FEPDlESdJ7bXEhJP7yW0LbSuuvVFAkE94G?=
 =?us-ascii?Q?c4HMp+UfvHJooNbTE9xOaQoCS19bT+D0KrIyX9uIrE+pcfZ1KNBu+M76sO9Y?=
 =?us-ascii?Q?4HHfX/d8X9SZmIAgGFDQJYF4nkCujP+2CeSwTrLCudKKOtkITSdHjPDrpL3f?=
 =?us-ascii?Q?td4xeZwov4/AcMxs4+J1NnbmBLwME6EKZ7qJhIIoR6sOl2q9PGfxpAzY+/KS?=
 =?us-ascii?Q?OByrIZ7BKBpqZfPJcb18CSayKlIHZQCGSzQWI3jDLuVc1nKFv1u1KSMGDTLg?=
 =?us-ascii?Q?Iy73oH0dNsmm36BNHdSL5JOFu2e8RPq//aXbBMs+XRhkNTBbLtqDATmiGS7w?=
 =?us-ascii?Q?G3ORxS0sctBajxf0nXlkrMcksf0P/KbwzDMsFBuu2ul+BEzaBtUlgyz22VDn?=
 =?us-ascii?Q?WmOckYkjV+hfczq9yt/cbpJJHvseetGN/WdKX0WEnuwubjxEIiwb+JNmIaQU?=
 =?us-ascii?Q?zLCiQvaNYSSzw/WBPQUd+d+beeB7kpU6C1A/KHS7jbpqDy36Rco8gBGy/+sp?=
 =?us-ascii?Q?UiBAPUFsCHlqpImhW2JBoMx9obL5qyTi38Twu32/1y1/TzAvZrBLjMJRSu0u?=
 =?us-ascii?Q?FxVFemAOmaRaOoYW9bZDtq+UeToU5YGQRgWQN9OCgl63NN3W9UY5oo/DquAd?=
 =?us-ascii?Q?TdY0iBqTKLJMERs1hBNh3wLky6UiNZ7faqch/FHbUf+AYzMnjGks4U5pgdiW?=
 =?us-ascii?Q?VplIKVXrW1E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6263.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F9pLGWXWrZZOdp/JSlRXWf2qTf9cRzk3GcwcyIZ3bemu2886iHjFm5WsWxDi?=
 =?us-ascii?Q?c11YPc6k8WbYJYIOyyL6llOWcJ7SJS1DGTpTsuxPz1THJIfZZhAZN5sbBYtm?=
 =?us-ascii?Q?nheUXpXciRngKFaX5AsGYearHKT7jEOK082Qisk28utcQrXltIjIrrQ8Q8fn?=
 =?us-ascii?Q?uUBXlzo93VnFR+U2ANt8rV6nWPIHPoZ+hhs81iLMqnWahsXc5SZyZBAo619i?=
 =?us-ascii?Q?sfiG7+7tAdzUoUszELxR2/OjaiA/ttdD7TIomO5A3s7h0nTy8ZuEgk878xCy?=
 =?us-ascii?Q?cri5SDpazcp1YywfHW/m7O7CTIQnISq6pa7UhmpgQ2AUidSzw8dFoxGWplkW?=
 =?us-ascii?Q?tcW/yhTL2aP+vSGuFAhd7YPhfJZMxfNr/6G8DSL7PN4cisWrts4bY6xcEthF?=
 =?us-ascii?Q?iKG9zu8hm8c6i1Ed2+neRqhTYnB1iu2nLO2u+e3bXGDqPAGatnW/3YoqrMrB?=
 =?us-ascii?Q?46LzlUx/oAK/tSKS3Qel7TvTzeU3PZ4GdFjTkU8wuNYycESDsMuTPNRELism?=
 =?us-ascii?Q?UwlAKl2L73bYF5YxiG4Hy2D2+SxPJO5A+GSRUhFpHZgkYVfUB+SK98O8T7Ve?=
 =?us-ascii?Q?ftuv3JWPWq41zpxmtZL9ISKnaAdyO61MQTzdiIYmOqDLiRiwTNxnqHM+rj3I?=
 =?us-ascii?Q?IYrRTorZtM3Q3QRPplITRZ9tU/5TRKdQMp97OMm/HtahVnCd54/RYOBi1cRW?=
 =?us-ascii?Q?B7ALBPQsmZBikTvKIKA5yCITXjtvmKavPQnsgLGfgKjmhN1R0SbkUlv/W4g8?=
 =?us-ascii?Q?nm/T7ua4G7RRkCABNQU0d3mXnsgwxOoKuJ6N6RnxAxZo00d3PMAszZkIJpet?=
 =?us-ascii?Q?gx1gusB2uEiHH2Xc4qqT/pe74VVRp9IOQytlvVo3OUmj8jpyLUl5tzoL6Af+?=
 =?us-ascii?Q?OOn6PtZ5fUyQscggNkdjvdRkZsVIZpdsVpOZm5iKkT0ZMm65b945ThpYwQcV?=
 =?us-ascii?Q?9iClgPq5z5WJbnrULM6NUvzo2Fz9UUruOqyKx6nPuaXG+iLYYZM15OMDC1jo?=
 =?us-ascii?Q?6fOnvP/oXTweDWfqDm1nVuSZ0BOm3hwWdXDIcJNJyabi+B8hjf8OUFlXSeAQ?=
 =?us-ascii?Q?IFwtX59XAqXIe/mXlrecxU8IyU78ZNRCV6RwfubvGyLFb89et/kqVYxDx83o?=
 =?us-ascii?Q?jkxYediLMAMmzy909/70l2a8KM6VpEt7uzTfFqOeBVlzGBMMspoxXszX3D3r?=
 =?us-ascii?Q?cMj9X6IBKoD/tHjC5Orwj/RJL5+/o7n0OJTTUEOSWmZYSWRL90eWs8gmK6Rd?=
 =?us-ascii?Q?8ebqgD+j1uW74h7fHt1QyOlygCekOY9M/G3aHQlqRcPJyTi0MXaCNvPX5PYg?=
 =?us-ascii?Q?L/BgLR8kcTkEKdRc+vSNqSYumzWeoIns93fqHjra+e7mysF3TYP9NdkJPkzZ?=
 =?us-ascii?Q?kXS6pvwPAN+4q2kV1C62Zsrduca7TRrrx7lt0HJ0h/JuGDlyjY7+OV4QGL6R?=
 =?us-ascii?Q?G/xsAhnpkbqvkczeDtlwR9TAvU5AMHlOQmktwhS2IoBubOuLh5yFzdskDOeO?=
 =?us-ascii?Q?SWn8uGpE6wCjfVMHCX4tQI1cZXaENjoGVDGV0p9OHQaPSz8ECjZeDm8S+653?=
 =?us-ascii?Q?7/KDEuGHi9QILG35pdUbPV2EqsBYbQYh6MulWIse?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9e3fc521-e351-40e5-f297-08dcc895bf72
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6263.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 01:47:46.9663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yIFay1YPihHQU/+PduZI6ucjRUV+kFxpaJBSJwKs/ZGrghOhYgdgwxx7vcQc76l8Kg9xeaORHJSBUwvAyVBAnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6071
X-MailFrom: yang.ruibin@vivo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DKAZLMM3ISX5LBDMP4EG2JTBXH4Q2QUG
X-Message-ID-Hash: DKAZLMM3ISX5LBDMP4EG2JTBXH4Q2QUG
X-Mailman-Approved-At: Fri, 30 Aug 2024 07:55:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DKAZLMM3ISX5LBDMP4EG2JTBXH4Q2QUG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Using dev_err_probe() instead of dev_err() in probe() simplifies
the error path and standardizes the format of the error code.

Signed-off-by: Yang Ruibin <11162571@vivo.com>
---
 sound/soc/codecs/ad1980.c   |  8 +++-----
 sound/soc/codecs/adau1701.c | 19 +++++++------------
 sound/soc/codecs/ssm2602.c  |  6 ++----
 3 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/ad1980.c b/sound/soc/codecs/ad1980.c
index 3c1ae13c1..d2f679d9d 100644
--- a/sound/soc/codecs/ad1980.c
+++ b/sound/soc/codecs/ad1980.c
@@ -237,11 +237,9 @@ static int ad1980_soc_probe(struct snd_soc_component *component)
 	u16 ext_status;
 
 	ac97 = snd_soc_new_ac97_component(component, 0, 0);
-	if (IS_ERR(ac97)) {
-		ret = PTR_ERR(ac97);
-		dev_err(component->dev, "Failed to register AC97 component: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(ac97))
+		return dev_err_probe(component->dev, PTR_ERR(ac97),
+			"Failed to register AC97 component\n");
 
 	regmap = regmap_init_ac97(ac97, &ad1980_regmap_config);
 	if (IS_ERR(regmap)) {
diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 8bd6067df..f4c574447 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -677,10 +677,9 @@ static int adau1701_probe(struct snd_soc_component *component)
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(adau1701->supplies),
 				    adau1701->supplies);
-	if (ret < 0) {
-		dev_err(component->dev, "Failed to enable regulators: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(component->dev, ret,
+					"Failed to enable regulators\n");
 
 	/*
 	 * Let the pll_clkdiv variable default to something that won't happen
@@ -798,17 +797,13 @@ static int adau1701_i2c_probe(struct i2c_client *client)
 
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(adau1701->supplies),
 			adau1701->supplies);
-	if (ret < 0) {
-		dev_err(dev, "Failed to get regulators: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(adau1701->supplies),
 			adau1701->supplies);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulators: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to enable regulators\n");
 
 	adau1701->client = client;
 	adau1701->regmap = devm_regmap_init(dev, NULL, client,
diff --git a/sound/soc/codecs/ssm2602.c b/sound/soc/codecs/ssm2602.c
index c29324403..153eb55a3 100644
--- a/sound/soc/codecs/ssm2602.c
+++ b/sound/soc/codecs/ssm2602.c
@@ -605,10 +605,8 @@ static int ssm260x_component_probe(struct snd_soc_component *component)
 	int ret;
 
 	ret = regmap_write(ssm2602->regmap, SSM2602_RESET, 0);
-	if (ret < 0) {
-		dev_err(component->dev, "Failed to issue reset: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(component->dev, ret, "Failed to issue reset\n");
 
 	regmap_register_patch(ssm2602->regmap, ssm2602_patch,
 			      ARRAY_SIZE(ssm2602_patch));
-- 
2.34.1

