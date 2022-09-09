Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 793425B2B7A
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 03:23:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 074221674;
	Fri,  9 Sep 2022 03:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 074221674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662686587;
	bh=2DEndcFhTAZJ1yiWpqi5sOiyyl7RqrmHsBrCZKJv68A=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CC0T89ejWxgNtzkONMC6WmeMcq4c5kWkxPpSuRqKrEK6zG9nS8bh2xqkNraRDVo/5
	 KtiSZyS2ZpL2uDZZveVeWzQeduD6pxEAQEzrCxW6NCht6Yw3GPoy42LC3bDaeclZHa
	 JBNRpNfa4eWkEmwzrJJDGHUe8PfHQ+SQlMJD5W3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CF33F8011C;
	Fri,  9 Sep 2022 03:22:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 808C1F80105; Fri,  9 Sep 2022 03:22:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2129.outbound.protection.outlook.com [40.107.113.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94D77F80105
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 03:21:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94D77F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="BRMxhE5b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJEBJ2BrSlY1fJ1OO8iPrzFMQ3RJZH5QRoqSPnuDrH93MXentV1Xvui4pLjYjZct1FoWrCrOHWZuvJskRRYclStcAKQySpdwTObyDdtz3+pUAb2jXqHePoO/o60PWH3NawWp9/McBKL4zvqtUkg36x4vrhJ66xolM+DN+AevUZpxvH0WMVDqcEfVIU6UDiXF8csSrq+piyxbT7RdNstN4Wbd6JCm38M6fkfafb+EODCFldMrhlKrI5m1lVmuUFluwRbdgATVBGh/CylamvKKOtPTyum4ppzOYZosRqK582XP/MeH15qASCZI/CQ/X+hAmMFXdWJKGzkWCQJ/NBD0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dv92gSk6FNn4pVih3qcOOF60ZvyUVlaUp5LJGbqCp40=;
 b=jwu6aPXOd9g6phHYaqzX2bh2szruceU2GwDGQhf5ykZaTyCifTJBWpnGeEcx/FbE3JFALHdIVBxkamtm2DHI2zBR5TT+JKsZBz9yAiatL1S8dwGYil42B9sLk61/QIXDSjScU6IAu/OU2OGvh3uHhv1+1Titb/wmhewsHvbxrQRIV8WY6omVHpWgV4GSoCMrLwaQW7rxZ6Jjw7w4OZxN1dghkmhYAZF4xMhKsrv0lOztm5aYuvv3Q8IJGFPVjl8XqVVsJJx5hkcFbmko5v5Jhbvi2bEID4ZTG/AbbGHFZnSLNjOANefJ1T0UdOxGUYsvgTG5EbLSbu68gJdv5zkVVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dv92gSk6FNn4pVih3qcOOF60ZvyUVlaUp5LJGbqCp40=;
 b=BRMxhE5bS4+sZBbVbqLR74KH/O5x7Suazb/KBPc4PL0cCHSN6XD1DUOgrcTT8+1248Dk3s2xevtw1EaA5E0ZMEtsRqbBMho57mPBwMjyXTBW15QF/swhfeYl8Xa29il/qFMEBWJn7r+qqfSM1LjWiveR5SbHWSPQwjXexMf7Zds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5987.jpnprd01.prod.outlook.com (2603:1096:604:ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Fri, 9 Sep
 2022 01:21:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3%6]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 01:21:53 +0000
Message-ID: <8735d1mjf3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: meson: aiu-fifo.c: use devm_kzalloc(),
 and remove .remove function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 Sep 2022 01:21:53 +0000
X-ClientProxiedBy: TYCP286CA0064.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: f6075cad-fdc7-43d8-c9cc-08da9201adb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wpiS12Y1rjfX689eaiD2BCGAjOMnU/+PcnGj0cmCfOB8D0RLlz01G476SNBD/0c4cZPudbu0sUMGuz3A5mwnozFCCJnVUHIFcRPNqWTin50sdOXXX+HlNY3rodQOpej+6ofuTDWBsAHdwaXe+K/A8CMzpoLKEzrIMySNdS9on8LCjIdtki80pkOHQFuK15sHbxEru74i/rLDiv/MB9XDheyg+Jc8SzPUBqlxuIYeBO8IQFHOCg/hAzwG2XMwhS1BuLu25v+Ptj1dqUnq+0GtLgqHfDLlP0TbT1jfYb4cJjakga+pJytIk4twwpHHMUnYIIQWKz7IX/FcbIR0cgWvvIA4A6MQFP+S8Knes2mPVRcQ6UEdIwQfKwxQHtDtzozTybX1wh1Vu6usa4Ow7K4kLv1FI1BwIq8PpflmNzuWTkKmJWcGoffpApSZA9CoOprsei4gWqDdqIMkLKz2FJLUl/n++y6v6cJAigHt9rVb5p04viwxx6cwOX/jzRTr+eqa9Tn108ctIOUXpNJ9BUu1yDgGbGt1jJ1Da8sb6fO0K7QbYxXh/W5WDCso8TnWnRkqGCJzRM1W1WDyhykuq78skko815BrD2TUq8sOBitTYIcnWs5ABV2pKSQMfBz036ZEt3O+jdxdtiFWma0PSbJnMRerby2Wngi6+fOnSNiFHc6wiSLH6nL6fUANJEiUizeiecerucCQNYK+7vAfZRq2F5TDnCJizdMvmX8Smr6qOki5kPh+fOq0Q4xupeOGBaWtXo36QgLxlGqFtji2nUjfWTL9eK/Bq+YprrBzQwzj9Xc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(52116002)(6506007)(26005)(6512007)(86362001)(6486002)(478600001)(41300700001)(2616005)(186003)(38100700002)(83380400001)(38350700002)(66476007)(66556008)(66946007)(36756003)(8676002)(4326008)(54906003)(6916009)(5660300002)(8936002)(2906002)(316002)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oGIGiBHTzH0gHvytdD9LciXBnUEuRmLoDhLAjJGCI3IodeuGqnAmG3wjdAFM?=
 =?us-ascii?Q?hgHAmu13xSGxEWqQlOaAs4XfjFflIKCbZ36JQskNiDTteFTsJ2jFcz8uJIQY?=
 =?us-ascii?Q?A3eCbFmIAGzJ4kMw7TyysPaqdNB7DUm8xiQPDiDO1KNP6snbOLpxSVgMG2Mo?=
 =?us-ascii?Q?rtsuWtLZO0IPz5OW4HndZJnErydyaxGVr3CSQiE0QSGConPmqp2QyvKVtM4z?=
 =?us-ascii?Q?3pTgo2JVPtLWvB1U04V4j5t6vcI5BQyhv86scSkI30lotDMXmqEBM7eY559l?=
 =?us-ascii?Q?QWBRwlTGC31K8d8BbUHd2QGXlGIHc9RtNz7wECvwCYSiJAD6o/WLfMoA0sFL?=
 =?us-ascii?Q?BHuAbjYo5jVRA6pvZj7UcPaZ1Mhqqm6r/sfpdcEsQKzGo6qjay2HQjuhM8Pd?=
 =?us-ascii?Q?cv2biGC9vGP89YYTNCRnCjZtc2yoA7uCtAB4XVQ5u7S9HXWnqa5j9yleuBYy?=
 =?us-ascii?Q?Fur8hYKF1sL4TFyjuVK4Xhibh1LGQj7gnjDri60485hyJEa6CqhN6c4AMaRx?=
 =?us-ascii?Q?kgcL31X/5UPIMey8qNEXgxPWe8UomMAqUw9mfZXbk0VS8fvbiJaVwMUDBUFs?=
 =?us-ascii?Q?fl320u2yVg4QMsMIm3hcyT7MeEb234LUg341oPqpdW/oGFEndxRYr09udSUT?=
 =?us-ascii?Q?ZZciFszLhqAtnkg/dSrRX11Z+bHr3nJkseX7O+lE8hfkG6uGLRIZbsGOKxjx?=
 =?us-ascii?Q?rFVfvNwZr8O43mbV1eAn1r4UST139DnbdwRwwfXIMk4Q1O17uJs5tG0hHazb?=
 =?us-ascii?Q?Pi+DI4w2U7/KaZQ5rRcXLK3xJ5AwiXO/NXX5A/2hMF5Sb3NYGAgIg+51Tux3?=
 =?us-ascii?Q?ZSnDJija3nwNeiqEqxJCtSxSnD1H0T75s687m95eArhSuwl08ew4Vbz7YwiF?=
 =?us-ascii?Q?762Mm1WEFeCpCT7HH1/iM8yUFggq3MRO3aT39ncL90/gFbJbYfzn2DodVd9l?=
 =?us-ascii?Q?dcE8u0n20EQohjQMMCEf6NRCbcRdt9fBHbl9bzKMaGitZKF0/ZjAs9sPykpF?=
 =?us-ascii?Q?fAfH2xg2u2NcJBohJiOtB37nRmXO+c7qc1uSgMibqxy0+9OsIj0EMjCkDnGA?=
 =?us-ascii?Q?vhIMGXrYKVZlUENZrQOxfILj2f6L12PsBoN0ULCzukirFb3KKZ89xrZHlMnI?=
 =?us-ascii?Q?xzeL7aMflN+ydoTwByC/s5nTnPgDGcCiV+Egp9jIZM/+0wZ3ZekKLjbhHfGk?=
 =?us-ascii?Q?hRJVrjxr3kOPRLiSIBxvasLU7zhNeZXg/YOuFkJl1qIw5Jpw71aHQHinIN0o?=
 =?us-ascii?Q?CQd8zMWF6xGHdhUpgRtpK9coCm9+vJ0i56q9npPTDIh7k82doeo7++1/wHyc?=
 =?us-ascii?Q?3eItBa+ySeDbDYcRkZfEzuOF6mKYqTG1QOrsMXdPBOk9ifDjGqgrSFLPFm53?=
 =?us-ascii?Q?VM7hJ4ALrEl/2+zhawrf5TTDjRQEXYU2NcFyMMvbDYL6r6fQWfquMpBquNov?=
 =?us-ascii?Q?abneCHKhIgaRXRfITj0ucYi/pKLUPtwgS/niHyefYVGBjXJHe4yb8FVfHzK/?=
 =?us-ascii?Q?MicGP2qzlIUe8R5AYyWlvjyGbTwsTNkRojAS4qJ9bgxtp0CbFtdfLchsCy8g?=
 =?us-ascii?Q?YEO+4dZb77FSFJpML0n8fPCTZqDedeobOErpmHmBzsdNO9zSCGEIzEAahiqS?=
 =?us-ascii?Q?gcjuxWDxr4fhUimzGLAMgAE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6075cad-fdc7-43d8-c9cc-08da9201adb4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 01:21:53.3900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mESjBDKOZnJluR8e2g9ZBEFEezcrZqebu3nB1UAiOvFDbA4Ahg1l8qmUxrQ3Pe0Ahios9yC9PDkGroxaIs2BlhADFvTbRHx8qTwBerqkAwELmyFM1V31ApOHcsE0nGN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5987
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current aiu-fifo.c is using kzalloc()/kfree(), but we can replace
it by devm_kzalloc(), and remove kfree().
This patch do it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/aiu-fifo.c | 10 +---------
 sound/soc/meson/aiu-fifo.h |  1 -
 sound/soc/meson/aiu.c      |  2 --
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index d67ff4cdabd5..843e5067e07d 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -196,7 +196,7 @@ int aiu_fifo_dai_probe(struct snd_soc_dai *dai)
 {
 	struct aiu_fifo *fifo;
 
-	fifo = kzalloc(sizeof(*fifo), GFP_KERNEL);
+	fifo = devm_kzalloc(dai->dev, sizeof(*fifo), GFP_KERNEL);
 	if (!fifo)
 		return -ENOMEM;
 
@@ -204,11 +204,3 @@ int aiu_fifo_dai_probe(struct snd_soc_dai *dai)
 
 	return 0;
 }
-
-int aiu_fifo_dai_remove(struct snd_soc_dai *dai)
-{
-	kfree(dai->playback_dma_data);
-
-	return 0;
-}
-
diff --git a/sound/soc/meson/aiu-fifo.h b/sound/soc/meson/aiu-fifo.h
index 42ce266677cc..fb323a4385f7 100644
--- a/sound/soc/meson/aiu-fifo.h
+++ b/sound/soc/meson/aiu-fifo.h
@@ -26,7 +26,6 @@ struct aiu_fifo {
 };
 
 int aiu_fifo_dai_probe(struct snd_soc_dai *dai);
-int aiu_fifo_dai_remove(struct snd_soc_dai *dai);
 
 snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream);
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 88e611e64d14..7e632aa31368 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -123,7 +123,6 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
 		.ops		= &aiu_fifo_i2s_dai_ops,
 		.pcm_new	= aiu_fifo_pcm_new,
 		.probe		= aiu_fifo_i2s_dai_probe,
-		.remove		= aiu_fifo_dai_remove,
 	},
 	[CPU_SPDIF_FIFO] = {
 		.name = "SPDIF FIFO",
@@ -139,7 +138,6 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
 		.ops		= &aiu_fifo_spdif_dai_ops,
 		.pcm_new	= aiu_fifo_pcm_new,
 		.probe		= aiu_fifo_spdif_dai_probe,
-		.remove		= aiu_fifo_dai_remove,
 	},
 	[CPU_I2S_ENCODER] = {
 		.name = "I2S Encoder",
-- 
2.25.1

