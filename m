Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6409E774EC1
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 00:57:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51B17DF9;
	Wed,  9 Aug 2023 00:56:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51B17DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535461;
	bh=28z5Ea14XAU1j9uQVP8nNduRuG+vLEZ0jHA/c7UJUec=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GGs45Mn6KriD5FuNVL7xG7zogFrVsaqo8z3sc8zZND42jG2RWCvnzZWle3Kz8cwKi
	 D9ZZNvLIBJSeuEW3juuadfLUdjmDFHwajjs4cjaik7OtyB5Kq8DMhZ8uRZSQyFuR4l
	 2eFB5NPROpVxcnc4Ol07V+BTCDFXQzx9btov7I4U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1597F805BD; Wed,  9 Aug 2023 00:55:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 351A8F805AA;
	Wed,  9 Aug 2023 00:55:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E0AEF805BD; Wed,  9 Aug 2023 00:55:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07621F80116
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07621F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DmJJVYk1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwKEPdbAv7pipXhKxb0VAhMhY+3zgJOEruv2W8XxuPSRDsXC7Lc1lQgUVMm2IwAJLlVIy8/fj4k73JwlkLnniVxlp29oFMLFRfXXe5jUD/PjxBCZXZj3bs/sxdtTdCt5EzvuFHUS9GLKJa4wWrsKt04MlvrBwueaODqEJzr/zGRlItu6UdmmFfkno04YrpLwEOsHvoJMRt2ekeiQ827VGsrF02uqOtzuQgIZ1huguKBKWFvAWA6YxlI0q//1mNJh14ok57X1467lySstqdgF7fRzBZvFz0RhRg0FuSwzQx8VPpIFC1BNtZtCOFsO+84g54Mr60YgxqZuWAwM3l9b7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ou8v+txXmQpCStUw/i42a/JYSYDFtUpQLXlCn2QHgI=;
 b=ecW9R1e621BRu7gVjpGUjbrthq3t7F9JjRK2yzgoFlN/rBuzUpSrjQlAeUnqZih1t91UqgdZsiVw5k6DvjSib/sqcDO64wP4rCURXGDHamGLkWBdKbr1lDw6+Kr76yHoVL00dqgqfZULTnBV44vZZ888j19IKyYWK5jjxtYjMr2icF68JPxNRCbu58dKdDPc+EDcQZWvlXdFZRrd0oesZj9Kw6EPDkz0ycSFlIoDjGBniFqYsEFzNv+EWwl70y0nozev7sQPwdH0x0h1SclOuKB1eubr7TGNTw9A069M0sIwwtNGaP0xWLL3cTM0s/42hthkO+U6NLoZY90ToWVsnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ou8v+txXmQpCStUw/i42a/JYSYDFtUpQLXlCn2QHgI=;
 b=DmJJVYk14sGHe5emBvin8lmKOcHWiilKnHWTon2jbPYQLbsm8dC9CiMmACGhFrnMvpBEhivac8E22mGD4TliahRfktCWJtDyfECgrAyPWuS/laPL+mq5z1szTVKJBTXPLW+uzQkhBOGJTGlVtKeRgrrfM+0NtWWJ7Uh85Ebw6eA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:55:28 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:55:28 +0000
Message-ID: <87o7jhb0v4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxim Kochetkov <fido_max@inbox.ru>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 06/39] ASoC: dwc: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:55:27 +0000
X-ClientProxiedBy: TYAPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:404:28::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: a57db494-a05d-4880-084a-08db98628f35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r4FiiIYYuL+LpUoMTGB7GIfp2VA8KAKueXJwwe0hUaTbM33kP0LpTNdNrZZ9HlC/+aOykrM7YM8V1TWzAzX6vgaGzrolDSLvdJhYBNWm7tng65RsIrJcFFaWi2ML8xFLR0JmnKlm3BpxS1z2LVfVpxEAUzAV4AGegtWHOjwGoLVPIUjIe/4spM3iwSYLuHELZCjJiGSV1oguI7/4Q+T2uslGLRpu4zS5xSPrPr0bCO5EIch3nnBkPvKqDh2i+zTokRvY+bjgwTFbb6dySNzlHc2dxLk4EAOcUr45XDPJef5gSQb/0YJcOaTIrBKTeayanwJSfoFsXpfBQrZGPHnbzmXfiDam4V1y4xP9TYhswLWVt5IVrpK8yJzCa5RNKffoWUtKfeH7QeBumwlsmkh9KScQLDYBKCDhIDV/Aqh6cOLjwYsIYGQYYkLWq1XmDnw9ulS82ccTaCjuKboTKpsJTTNihEk5n0u1OkoY1CENSVSSqnULdLw59F0J85BKHwrA7cAvWu7UTbO3ocAW5QVAwDFmX1ZOvABDhsRiE5meRemgwG6kuM0pEogCDYszzrBJG33G7zHpIbx15/Lz8oBHBQXPnBkewmY8fXrjvFltvUWUbk7Z5OukKyItXdMYGE90
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(316002)(2616005)(41300700001)(86362001)(5660300002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UTr/mzm8soLNAn/nzVDHgF3BxQBzsO+z+6g0aTzX46KV2XCDeqxO6sE6TRni?=
 =?us-ascii?Q?ry0p4/25PljC8JzjCAsZh+Pg9AK11djPVmyDoHsUIvuLmnOGz6uFO6XRgDz9?=
 =?us-ascii?Q?MWxK1gHEg+FdcFpmgRuma3IgHGqvMNn+Dgdw8zEULlG9b8ln5U29ZhiNSaJw?=
 =?us-ascii?Q?5ksCyRd0IHOgtDtMT5M8F+44Nd4A2CwYd84qYQrn8PvVUDOyWuXuUnU9ojk7?=
 =?us-ascii?Q?4/Bp9guFNag0yqUfPtOqYGxiORwhWmnoyVx84vv5SAKhGwm2bKWhqgKVhxVJ?=
 =?us-ascii?Q?+4hhHGOH2wdWEPd3WVvBXFrPkeT6HOe+9v8NrKO4FFH3SUQFmt8NXsKViH6t?=
 =?us-ascii?Q?aNzC/Oq9SE9Lnnxzclgt1XBU6V3RliAPsxyBOZbq1nJbUsyXv+hs5KloDpmI?=
 =?us-ascii?Q?q1OJ/mLCXHpylJ7rWObZNc/NYI4/IB3duSKxnmIRnO2X1fSGZ80PejnN8U/r?=
 =?us-ascii?Q?TfMvsbn6KQxDYuWq24f8sUzqwL++0vKh2B99K/IiNOxOxhN1galpCyHE9U/d?=
 =?us-ascii?Q?3COHNAKHA3w3JhY7nFX86OISb4WDHrALnwzG1UyFEc29Ir3TffQGKSrKZoIA?=
 =?us-ascii?Q?lAa5XTIP3TWYErsfV+M9s4j8+CEMOxQbp/NWkLqTK+CQNMtDoH94rrfkkSeg?=
 =?us-ascii?Q?I4NvK3u+yanG0Wra1YyJBz5PoTx4ASZ9rwZ7UKviWSZt6GJWAgdoTjE7qpse?=
 =?us-ascii?Q?JySU1GpycDab25moY/qj1xuV7ZBO1hFUpkF1jPCG5kr2AGSGs2oDaNcUDe1V?=
 =?us-ascii?Q?BjDQ7TpiwdfFXFbPbw1VrCGRZ6dyOwtqTepNXQVjjik7h5Go84Y1l+BMMmpD?=
 =?us-ascii?Q?IyOIHFuH9Il8WxiWNDSLnsrRt7MyPWQcbQaC2m84iCI1RF5edmfw/mkPu3qu?=
 =?us-ascii?Q?z2EfWvBhAWlrgjspbLAMl/Mo2oC0xBCBUWW02z2CYD2rAGfwVHTadTfmfv8u?=
 =?us-ascii?Q?/AFRVEyzXbPfgN7+jPCc2Ibc2aOV4b10djnhx8ZtsxivxX2MaRQRde+NvGFI?=
 =?us-ascii?Q?Ngwr1LqYiZKmVwg9jwTvoWMKG4GkEdH0juJSiPS2FPRvmx8buAfC6jhwSlZH?=
 =?us-ascii?Q?FqQJtWH1hmYxCSZgpBKDN5AYxxLYmPasajO3raprTwM4dGurnLEBIRxVZlaO?=
 =?us-ascii?Q?C6OCDwvym2SrENVTWvD2nqFTZZ5KBcvdfmiMtLvdKEZSLsRMKGAAmedoCtFZ?=
 =?us-ascii?Q?cCEq32iizSD8FSYZ/ZV3y/rh0axCvbjz7ReykmnmO6NxT4V/2VTAJQw6/+cj?=
 =?us-ascii?Q?az6k1kCVEyiMefcTdhh60kK+JFQ2RJQZrks4CSPnXSAQD719jDTKGGjoxCWG?=
 =?us-ascii?Q?QiqKc1rdCKRh7c4oYask+SrxCLY55ivoK0xBp9JszRIMCWIXh2GFbJ4205cg?=
 =?us-ascii?Q?AJ2ciEC8A2+GxhcaEz/Upi64QHNgF7y7kprfGcFV4m/oVDXzSycOoKHQiJzY?=
 =?us-ascii?Q?TiLYGvXGcFPGLctP9v8bRyITY9hmrBh3xSlH3rKqlnhfxes/d9AVJHbnLhKC?=
 =?us-ascii?Q?1faCaX9MmNP7PWMHv+sLdm/NYZK8jpdyLP5Wz3bR+uHlsVc9tfDxjR4E5VW/?=
 =?us-ascii?Q?yQu6nZvB9RezeWN5rmffKAb8JcX3RwNu6cg2DZix1XUPO6oL0jaZ8msOuoQR?=
 =?us-ascii?Q?OBrH+wou0Q1koM45c1YSaME=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a57db494-a05d-4880-084a-08db98628f35
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:55:28.1497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xNDmawqZ6aRor2Pr/+43o44pQoNy97fuhwfzQs2gIV+nuLFa7S9NptE6UI+HvhrFBr1lQc4bFK181T6XItCbwFpPhO7nh+PueYt8HVHO45BZeK67VRlPHSK6sa0aeVF4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: SFUDYMXC7247HZKTQJGQLTPCX7VAWVIC
X-Message-ID-Hash: SFUDYMXC7247HZKTQJGQLTPCX7VAWVIC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SFUDYMXC7247HZKTQJGQLTPCX7VAWVIC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 sound/soc/dwc/dwc-i2s.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 1f1ee14b04e6..0a4698008d64 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -443,7 +443,16 @@ static int dw_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,	unsigned int tx_mask
 	return 0;
 }
 
+static int dw_i2s_dai_probe(struct snd_soc_dai *dai)
+{
+	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai, &dev->play_dma_data, &dev->capture_dma_data);
+	return 0;
+}
+
 static const struct snd_soc_dai_ops dw_i2s_dai_ops = {
+	.probe		= dw_i2s_dai_probe,
 	.hw_params	= dw_i2s_hw_params,
 	.prepare	= dw_i2s_prepare,
 	.trigger	= dw_i2s_trigger,
@@ -680,14 +689,6 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 
 }
 
-static int dw_i2s_dai_probe(struct snd_soc_dai *dai)
-{
-	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
-
-	snd_soc_dai_init_dma_data(dai, &dev->play_dma_data, &dev->capture_dma_data);
-	return 0;
-}
-
 static int dw_i2s_probe(struct platform_device *pdev)
 {
 	const struct i2s_platform_data *pdata = pdev->dev.platform_data;
@@ -706,7 +707,6 @@ static int dw_i2s_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dw_i2s_dai->ops = &dw_i2s_dai_ops;
-	dw_i2s_dai->probe = dw_i2s_dai_probe;
 
 	dev->i2s_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(dev->i2s_base))
-- 
2.25.1

