Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2693C79B08A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:49:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15066846;
	Tue, 12 Sep 2023 01:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15066846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476186;
	bh=dSlExT7vDQO7N+9TSn3PVdya6h7vYi1k1bWocLmsrEQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AgtWx/5be4amEKRngH7yzCTGXQzIOTCJR77WHYQoGdiJntSCrmdSnKNrGAciH0t0M
	 a3cVT9F2ZsnHwvMWZZkJ2EvHOgHk3TzP0grKXzCveea6B4ECmV/XJcnxq/ECdpt5Ft
	 W0EXmLXOwa1wKB3U+m1lTt5f1eKl26RT4A1suFkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D043F805B3; Tue, 12 Sep 2023 01:47:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D483F805B4;
	Tue, 12 Sep 2023 01:47:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7684CF805B4; Tue, 12 Sep 2023 01:47:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20704.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C208FF80588
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C208FF80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Ffx/AxfH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCu5LdM9K6EW47Zubbz3zxyxzijDVWYs2KPiqluLcDArij9wu1ZTPHmMHoYN2i55Vu4XsjN/bvVOHKtgKUI6iUBtjXg3OUVMob712vbc62K8exhd8uH0nOF+m+iHi2d+QLD2x1hU5gAz92To2mhzz9O+8bksZILkNIb+gvF+H/rDe9k7ljxFM1A1aq9xl9Nsn884UEcIpYTxCYhTzWUx9F9/d1ZEel9gd/hE9pPWm/lz7L67R0mdEcX00JzwuhuLV+aW/GVzycgNDsBpcGU69EGdxbnaxX6EosQy9S64S3scKwdbxyoOkOvF8iW7Wg3XolbZJGGpHG+zMH3ziyYXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuZ5Y+cnldAfXoQf0cMimYmDISE97/uxmFwhQrlRcHQ=;
 b=VFVALVnZh0UtQUbMVH51EtLr5fB0jpGZ1R2fyDp1u/KTqq/jdfk/jYOIIWIF6B+yBQre0Ho9QnPKcFJPamlwnURgFyYVMijejVSwIKWUzysXWOhRXd3zeA7Gw2KUg7GPBR0ydW7rvO827zoSOj9hz01yWW/GgnE29T5w8E/lM4SKdnpIsYbW9rYc6vca9XInBoUviyBePthTsfR0+J9rBs/LzCXsWm+lgZOhYBPJ4HI626Q2iK5o+d1mRgMX/ZdhCHh4L5XM2lESFNw6gkashqTjlZSRNRh5sdfBWaUNtsSNbkNsMZa8pVxVxrzcT0RdiaZG8nyF7jx633sd2wC6yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuZ5Y+cnldAfXoQf0cMimYmDISE97/uxmFwhQrlRcHQ=;
 b=Ffx/AxfH5JtLrtvFS94eZAfVWfS/J/6cjKXLAJLOeXIkDncRNXQaRGeh0iJrNfbNjZSrgN9Wq5Jklm92R4HIxhHyZJ8eINtOHrO90x9MWOcjiydxwIHLQO5359cSUPm62XjQLhZyg+Ot0bVykw21zlkia4+oYgLDdom49LfDV38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6192.jpnprd01.prod.outlook.com (2603:1096:400:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:47:39 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:47:39 +0000
Message-ID: <87a5tss25h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/54] ASoC: arm: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:47:39 +0000
X-ClientProxiedBy: TYCPR01CA0134.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e66fe7d-c7dc-43fc-d52c-08dbb3217b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eAtFbbhKbjn8i8QecexHOQ0qesKzk/bMl5C4H/p6vetJoxttk+M2qVbeC2ysBEBs29SQybsEApfar4ZDs/RtOXJmohszAfWki3Sjb7YeasN6mLUtOEtv+JUajVnUEoE7hxwY7HkSrecK8RZxYZtra+z5WE4AxAtfibDfjk9Y127ZLTuw/KF++Nak9FM4rT7BVBf2erV8mDld+lemVdSTxiQwySTXGIDk/goHKQXzd7MRd13AcoEDizoe/EBst3rAFopPDNZsbRFIL0+XhvPlxP7ZQgGLde0IIMKdAEAg9+MdYe2rkKhuzQMsA1UhiTRjMFlEOecljmpjJx49mWe2xDjDXmeKz6bvct0xkZpz3D17tXdln8wuo8kp0EqRfGPqL3QnFtSJgZxVZY9r7kSRgs+1oE95id6pbWBMs//F8eSRXzyYfNMpq4cTo3Q/LL8P3dwoJKnmg+jI40e9ZumJEG+yLIcCxk84J+zV0jyKWY4DPl80DsUWIjulIWEms+HA1ZokfOOtYhHdnNpSxa7UeHG2ij2N7RGQwpNgLGX4wh8DciG3QThDBVMt+2F9DvkrHqivxGrrtHks8qWtouFjytQ6r1tlKFy0/fAN+7zSNcivM7aS4JKO1E0Bg3Tt+QgJ2eJCQEPW8tBfQ1Y/nJMvs/+JQExrYW6/uB1DsL6YapQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(52116002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66946007)(66476007)(66556008)(4326008)(5660300002)(316002)(110136005)(41300700001)(8936002)(8676002)(86362001)(36756003)(38100700002)(38350700002)(21314003)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zx4bxAgtU1TRzfD69VeTLIHF6o7h6iKD4h6l+Sh2Px4ZALQHiCr67mvNRGuD?=
 =?us-ascii?Q?f89j/vIEloly0y3ySy/uhNrycxlHmngXpBH49PpqQTNeUA7x0kiiM8B8MPHo?=
 =?us-ascii?Q?GdCbsQpn7ArttoFdP9xDyIxAWyy86UDbftd2OX1n/FPt8HDINalzXa7p5wgm?=
 =?us-ascii?Q?2iWg3HtW4YtvqxUmRFf735pHv/z/p1CbG1LUwiLl1zzmgUmvrFUa6NEukONn?=
 =?us-ascii?Q?y38wM+Vvryd185TC0SLAm0Dz5IhhbqIQQaTC9gkteX5QRXO84sSTkgq70L14?=
 =?us-ascii?Q?OBKLw/0kBCz72tCwQBh8ze1uWCTTBnIKEOT1g9tkSxa4Nqom8ChFP6WoKcTg?=
 =?us-ascii?Q?AAAveFPibNkmIfkEum4RhdIvLxWc0mr3W7uRP8baF+oDnAdsjlxSRFWKxLEH?=
 =?us-ascii?Q?OuRXzQ0CYdFCSZpz/XsGzzfk2dJgfaIF6wOT600RnnPw8CuF2kYfCluWhoK3?=
 =?us-ascii?Q?19gp0EC16KjB0YHidMRbP64WvcVeQyR66DyQjAATh47Wgo0jw89ePrSExQTe?=
 =?us-ascii?Q?G3euY51ZBpbD56VXE1L4OBUQpzrkTU9LkErt8t+FJFBByho6CZWSekdgZ3Wp?=
 =?us-ascii?Q?yHM1B6x/jBzesMBgdWPOFaQCjLsm8bs5x5BHNspGusROdK0CprnPgL3ZfjHm?=
 =?us-ascii?Q?6oOBNqXXP86BLafWX0QIk9MawtyFMpL390WYkjehOE6IfaQSdnt7NJgaVTzB?=
 =?us-ascii?Q?8z3lP+HoiID7J8UILbrP8icdDIneiUjZmrABapMDhQ7jbscDegdyiN28pb37?=
 =?us-ascii?Q?PfbB5vMpKS3HJhJDhHpCfRc1vXgaVsrfZvLkPObIvEwaglelb2IxPA94pIlC?=
 =?us-ascii?Q?Bd1nfyPtcAflN9jSel4/OcGOy8+Lcrd09AwcNY0TdBJNwq+wrwyYPfCprQPZ?=
 =?us-ascii?Q?JRiDqM6kWZZtPeNioXLxIZk32RWtiHBro9/sbM5GSy2+qOZJRv3pmnFiLPOT?=
 =?us-ascii?Q?vmByLLvcQOnF8TW55P9rXW1xTbScs3CZfdfuUiPQ1HhjaHKSTrcpF++iU1tW?=
 =?us-ascii?Q?qcx/vo33XG95Ok2XRkiRS83lDGGCu2S/lk8viJj4n8oD73Itg2KAhksGXvP+?=
 =?us-ascii?Q?q23rK/oJxMUyTOc/VymcWYXfLELLl5+pomuLbXplrxMMw+xvjTTqfBx1gz1i?=
 =?us-ascii?Q?rEL5epMEvCgDB6SSR34WYxNODioZU6ywAa+K2yA0YsIlgE0sZPH116QDI0Y8?=
 =?us-ascii?Q?2Acw6ybm6SIcZnGygYx9QC4w8zh2FROf+Ev2s0RqzeHHEEsyXw8xnTPXrXjv?=
 =?us-ascii?Q?du9CKV4Dzvo3FXqmxAwC333nfaZnztehCFR4Yh5M5izqTRIknw6zqpA6XGM0?=
 =?us-ascii?Q?leZ+EzDloGXbdyvI7wJtM/T2PaK6cQRohJuZlx7YVzpjTrFbF2MulWWhUGI8?=
 =?us-ascii?Q?MFa/j1S473VzjJ58qHtj81f4SVfr30QHd6D/1YpSODnO9Plpu4cTcIy/FKjm?=
 =?us-ascii?Q?T6Og2/vppBZpI6f2E4mYPkgWsCQ69afNdKRmZbdL/R8XR3vKpenbRmW9OkqG?=
 =?us-ascii?Q?nMiLP22D+V9gS3x456DnE4R15w2VPk5fFCyyry0ygTHeXcHLDJ1ArP00mtZZ?=
 =?us-ascii?Q?U+LHCHN3SEK7xF4HjG06/r6DmPmG7WEyIpOV1l+8+k/T+i+n4XkPBOBP3UU0?=
 =?us-ascii?Q?HDREuhoFQznuY7Xjg7dMEkc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9e66fe7d-c7dc-43fc-d52c-08dbb3217b9f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:47:39.3862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EsJ+e2t4CLylbGIXjYdHUstrStOlwERfvYDf9RPVG03F68HbszJBHYaeUZuJBqpX5j9+ACSkbso1JKKh/59dyC/5DRCtQl71jLGt1XDW1Hu9Olo5tm7NHmEhnAMr68z1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6192
Message-ID-Hash: IOIWEJHHS2FQVZDZMOPO7IX4QJOZ7K7W
X-Message-ID-Hash: IOIWEJHHS2FQVZDZMOPO7IX4QJOZ7K7W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IOIWEJHHS2FQVZDZMOPO7IX4QJOZ7K7W/>
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
 sound/arm/pxa2xx-pcm-lib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/arm/pxa2xx-pcm-lib.c b/sound/arm/pxa2xx-pcm-lib.c
index 0a48805e513a5..51d2ff80df165 100644
--- a/sound/arm/pxa2xx-pcm-lib.c
+++ b/sound/arm/pxa2xx-pcm-lib.c
@@ -38,7 +38,7 @@ int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct dma_slave_config config;
 	int ret;
 
-	dma_params = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_params = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	if (!dma_params)
 		return 0;
 
@@ -47,7 +47,7 @@ int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	snd_dmaengine_pcm_set_config_from_dai_data(substream,
-			snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream),
+			snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream),
 			&config);
 
 	ret = dmaengine_slave_config(chan, &config);
@@ -86,7 +86,7 @@ int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 
 	runtime->hw = pxa2xx_pcm_hardware;
 
-	dma_params = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_params = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	if (!dma_params)
 		return 0;
 
@@ -111,7 +111,7 @@ int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 		return ret;
 
 	return snd_dmaengine_pcm_open(
-		substream, dma_request_slave_channel(asoc_rtd_to_cpu(rtd, 0)->dev,
+		substream, dma_request_slave_channel(snd_soc_rtd_to_cpu(rtd, 0)->dev,
 						     dma_params->chan_name));
 }
 EXPORT_SYMBOL(pxa2xx_pcm_open);
-- 
2.25.1

