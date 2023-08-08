Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 972AD774EC4
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 00:58:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F6E0DF1;
	Wed,  9 Aug 2023 00:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F6E0DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535497;
	bh=N7u2qCc9gNKn0meNRg7oME3CPzLfJzKBW0FvQyIfGAQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nkIbsWtFqsS2KQqLm0Gp2QXpRQy/GCyys0b+7ltesdyXvLwLBdO+0mWswleS/dqf1
	 5NesmCQjhYugxdPvX9VaPgK0LQHd+wkKD2D0JBTAN3XChyzpWrHLjrYqqEubgA4nTd
	 3PoUIw5tEFWM8+EVpTc5nWwQ9cT2PXAWpBP2HyWw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 239C9F80508; Wed,  9 Aug 2023 00:55:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89242F800F4;
	Wed,  9 Aug 2023 00:55:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F2B0F8055A; Wed,  9 Aug 2023 00:55:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B4D3F80551
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:55:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B4D3F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=X9uzMMZi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGXZ7847OFEoo/P94KL9ehZX7aDzKvIkelcC0HC3iyTc/rW2yBVcfuL8MvDgeRrotSRk2tMXx7rD3nfoDEC0Zq2f5ioa+o6VSSQ6dnCTW0wY9TchpeeLavo5mIXNawDkJWbTf0EuEsLtqmlUtUw22aoyVV+3rM7ek7TSbqg9ZQuk4gH254c2XpFNBZzT6DNHoUa6Q0G/eXZ3HZAHMG2OKPFmfktQacrrxsILGh5iDa+vf2af78H6dzGz23liNquL3ycJXAZbNByDAHWjuVGgLC+/Mk+ZrD2PlnFDZSxZLiLkACq3nockM1F9MrYux9DvVGjD8LSoIUrD80oVGerLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSUZg12zCX0hPVSogI5xDKfQey+ufFK2V+lE0bGoecY=;
 b=RHBHYxuj/OUHUHF7E6Cxf+d9qm5y3ZXNvbAmDIvR73ZecHIRilE1AMXfEUIZIzQrsFOOeJs4bOrnGHWqjqP5pxDckZYAukImQnx7XySnCjHSvFzoPu4xG2CL2WYG3XW9WPsoxDXd7oPRUhvY1wSKDZL+TiPfaiXXQJDfGoyw9ORAOkolDJoEujZGgq8uNnwHO9kbfGaIt1oslI02Lyd+G1xMATuJ6qZhGhN6mibIcMS/vRG0iHSYRSucsuZ5scFD5qMe0+Fg6mLEQkOP/KwmD//VVNWyIWaDWfhJ4sgtro0/VOONpjMlBysQNCSJuqKp2hsIh6smNAY+Ky0J9awVBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSUZg12zCX0hPVSogI5xDKfQey+ufFK2V+lE0bGoecY=;
 b=X9uzMMZiuvApujvoZN45Q99USLjhjUi3G7plHP/nqcBGBdm/rv0kIDFv1BC2SvZnUPUT74BerJ0OlwL68um9StKrr0aScbWn0ZBAeID2cSopmsh6rwCoWiSLQaxbstjeFv9tJkoqNJCO/05255bEcoeO/uxcRLwEsgeYEcm6bh0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:55:48 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:55:48 +0000
Message-ID: <87leelb0uk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 08/39] ASoC: bcm: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:55:47 +0000
X-ClientProxiedBy: TYAPR01CA0054.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac63555-2527-42a2-78cf-08db98629b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pqsfa0hDaL98ziEZu518q+YFYju678N4yCSyDqcesycc9fDC3Xxb848T/Y2UHmWsSTrHvDLOe4TXZvPuGjtKtIKlBg92C2ij9mUQxEnduwwOEA8M5ReqBGdJYhjHyA5DVTcT/yhApwQkwxrXd+Gz0bGdoCa9tDRsG24oQgslK6m3L8BAnvBerLCobUCafZQ4QjX1aIraBvvsoMjp1Uvcym4KaRRW0zeozAve4EW5wxEyAHLHwqjbRn4/m8YJ1xnYa4cQrAerQOI8Mt2ALlWHJL7AByQ/LY03D9B2K/TfExvY6VMEYZZnDlmhtXa5SydVBwV1aQworWryebPaC6et2Zr4gfT4McsHm2Cy9QLnXvPbS2oeZVbBT8II8bxAsN6FcdmXEqSrlEvPExMAPa33+rMsTgPr67OmAnIK8f1pIJxQI+Jl+41p1S5xuAVVkvui2qurQhxV8HXdJd6crvfm+EHTfTDZnR3bZaEFeAzM3y1FONc9s9VxO4vLJpxprqUxqdEoy/BMRClOp7kHMPMT/8hWUBtuk7IKdRMLUcVwAGlZxyKgCHDolY63jCVZA5PcSOiPi9NT01cMw4uu6kRPPwZZ70rka2TQ9Kd60lJO/sEsPBENoXVTuHOxCytiKU6T
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(316002)(2616005)(41300700001)(86362001)(5660300002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3dkmd037IY4zhMzQR9MOTkY1JHXgKr+t1ycWdBoH49wQ+aGgZ7raYeMdWnl9?=
 =?us-ascii?Q?Dqj2MwGRYh6zEzqfhcqodh7QSTIrtaZH9p5+TBChk2+bfkNzi3GIvwj+cHqA?=
 =?us-ascii?Q?3KrH3Dz8Kf2YaKVBPB22nBPyZweNfVCDv+l9Bd0IyZABa+rMNxj5rszVxtnG?=
 =?us-ascii?Q?sOHO5MFDsZgunvJTKDTbEzKpYbArMaCdELbLi5YXmVmgLu6fxRb6rq6bWYx7?=
 =?us-ascii?Q?5K7WYa9CgwjzmfxBkO26/JD8kVxU2hdHeub95G7/9Ey1cryUOxJq8RunLVxs?=
 =?us-ascii?Q?1pm0yhf5hdaJyTiY/5G+wNjCP6nRdJBORSSuJSi0nVPHOOJAsGlXT4Lqkf06?=
 =?us-ascii?Q?6J1v56xVGEE4M65rMZgL2UELzvUG1jQDW+NTL3NWqCrNesU/q2TwpX78+8/E?=
 =?us-ascii?Q?SgPBXT1i2bQFLbh3Jaxvy1QAiE/OTzX38TeFovZQ+ZkZa2a8VkfrtkXhy5WQ?=
 =?us-ascii?Q?/LZOINk+v+SUkix6Wi3rxAFtKDBly+avN1FGYMNZKxwZE9cQVNOCnjdVa17A?=
 =?us-ascii?Q?K3jMJLk63f4I72vFHEJ4tv+8s0IxMRWVQ7wU8Ap0vqSr8Ve2bqI32VaRsBMT?=
 =?us-ascii?Q?LOWh64ynOfPWH4mNBwBUQU6I0jXKINoknIAhcKrgq/UCNMLT8QolIkwtE7tx?=
 =?us-ascii?Q?gzs71XvxzVAYYuwVSfxsI/E1rNfRtMJ2JUE/4Lo29QmzS6scNEgXZ76pdGil?=
 =?us-ascii?Q?EBLtyGItacWzTUeID7H82ZBWsrSpwCEl8DHEsRnTeUYJzQxKSdCUemYKAi9v?=
 =?us-ascii?Q?ccDvCUmY090iZ+Glms5BAT5wB0OthruetRn0PgflS3G+P3CvEupGFHWeUtCY?=
 =?us-ascii?Q?8BCXZ8Ey2TOmDVjT8DZxD4pJ0DgMG2dH/nGifSxR0ydA5BT6+J81AOmpcfKu?=
 =?us-ascii?Q?oR+GL9uJkmIa5c/gnvHoCkYthNiSNtsIsjgE2NtOEJRQkX+5yBvnPc3AP9i1?=
 =?us-ascii?Q?4KmzGQ3fSVFrFMLOgjlDAZ4kIaxLCcyyB1tfRbVwuIvpboz8JBxRKkRi08xG?=
 =?us-ascii?Q?Zm5LMsxagndS61fVKua4ZPPoK/ZIecBIdtfq3eyQcvElDEeMHsjf4JQOXEZB?=
 =?us-ascii?Q?93KAEDm/W+1RJclbndu8SthLqfXZFl3wa5Bpg+NMl9YUG8UblGwJ3mTN/y0u?=
 =?us-ascii?Q?AwSlA77HGLZtvUUx0kEasQSciGjg3YrHluVevefCuwP0ty1IAhov5N2CelrP?=
 =?us-ascii?Q?cj4ykZZ/esnGrBZk/x9Ra0HbykGUMQ4h4hSNQQMwh6ATNzhUDX4bMu8blbtC?=
 =?us-ascii?Q?AIiBMkmzQ5uOu8n35GGBXsTwZHXwzXfY7s+Ot2rJ64BmyEhT473D1XqtTdgO?=
 =?us-ascii?Q?Qzf2uAugQ6GTjyzYCkSYVWnE3vWlqKMnAuzvhvUHjpmiQjkqp0fyZ0c73Ofh?=
 =?us-ascii?Q?ouMHBIjDWu62PaOCdOpqQJcBb6moscIfNuEtQuUBl/iXBoMzbPtCzJ8ChmVk?=
 =?us-ascii?Q?LdSxeJux2iAAjVInZ+nuqG4jShakcgyCwVDekqPvluJ6jE5IwX1wZbwuqvBt?=
 =?us-ascii?Q?lUcROF+cpdToxXuiW3okuXa8H3/Cu+1FpuwbYt1pXFpte8JfVi/nyYzEMK22?=
 =?us-ascii?Q?mKi97JU34D/moBp7tW+6Y9cvwNY6bDx0NHamlhsi2e+Mm1U2xnSR6AL2Xhu7?=
 =?us-ascii?Q?QgCHb7a2SR0Bg4wKFhmRdNE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4ac63555-2527-42a2-78cf-08db98629b1b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:55:48.1084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CEWzdVU1KKZttICcQYXpJ0lxSo5I5JpXu7FDr6HXKyYe4PlZZdLagQhqVmWxUxVj7PhaxxFPoEk58cd9PVp9kXfEcyDjT1hV+TFoK+CGtFzMQaidLAC5LKtq8rTM5XWj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: AVYWHHFWQ7QRROVOLJKG6ZVUU4Y4WG3Q
X-Message-ID-Hash: AVYWHHFWQ7QRROVOLJKG6ZVUU4Y4WG3Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVYWHHFWQ7QRROVOLJKG6ZVUU4Y4WG3Q/>
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
---
 sound/soc/bcm/bcm2835-i2s.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index 85f705afcdbb..9bda6499e66e 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -737,7 +737,19 @@ static void bcm2835_i2s_shutdown(struct snd_pcm_substream *substream,
 	bcm2835_i2s_stop_clock(dev);
 }
 
+static int bcm2835_i2s_dai_probe(struct snd_soc_dai *dai)
+{
+	struct bcm2835_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai,
+				  &dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK],
+				  &dev->dma_data[SNDRV_PCM_STREAM_CAPTURE]);
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops bcm2835_i2s_dai_ops = {
+	.probe		= bcm2835_i2s_dai_probe,
 	.startup	= bcm2835_i2s_startup,
 	.shutdown	= bcm2835_i2s_shutdown,
 	.prepare	= bcm2835_i2s_prepare,
@@ -748,20 +760,8 @@ static const struct snd_soc_dai_ops bcm2835_i2s_dai_ops = {
 	.set_tdm_slot	= bcm2835_i2s_set_dai_tdm_slot,
 };
 
-static int bcm2835_i2s_dai_probe(struct snd_soc_dai *dai)
-{
-	struct bcm2835_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
-
-	snd_soc_dai_init_dma_data(dai,
-			&dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK],
-			&dev->dma_data[SNDRV_PCM_STREAM_CAPTURE]);
-
-	return 0;
-}
-
 static struct snd_soc_dai_driver bcm2835_i2s_dai = {
 	.name	= "bcm2835-i2s",
-	.probe	= bcm2835_i2s_dai_probe,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
-- 
2.25.1

