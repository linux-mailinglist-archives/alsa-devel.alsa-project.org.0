Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BC1674DA2
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:04:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 772CF2DFD;
	Fri, 20 Jan 2023 08:03:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 772CF2DFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198240;
	bh=lY7OR7DJBGzDONMkdNws7Xk9TOi4klEDI2g3EZSdRTw=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cjGrLuSmq3I/wJogOQu9SYcefgoHp/eXJBNtiiaO6jk0r6DXSfXrKbNsxaFkTY/0v
	 V2At/fhfAfSORecsr3X6MEyepO2zZi5ZTHAkaKY0OHad86E2Wxp+VVkY54bLzKqzJG
	 mYBnlmD/x2yH6b/ai5/5NCTuvvhRfPVaBL2tPo3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5059F80558;
	Fri, 20 Jan 2023 08:02:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EA7CF8055B; Fri, 20 Jan 2023 08:02:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2128.outbound.protection.outlook.com [40.107.114.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38F50F80553
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:02:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38F50F80553
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=i01d/IsE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=an8prkqKl7SxjwVvZAwMabH20nha2JeSFB7IwSpxg29rksr11d+AcafpJza+t/32X1Ya4PeHSgDw8q8cPAptEelhliwBENLlLMkB92hSVSWBJNMAejz5Z1tJjPD5BsXDgFRX1d/jH+U5fNeO3UQe3u9FQux+QGM/DfoBpHB1DR5nur7Ovylrd6+3pweEk7G4TWymBbpu7FX+iRiBkY3Dgn1NZfXi0aLPDr/wqxd6zjlIsFL6n2PSRXT+g/sbP0FDGb1FFMh2BRa3y0p2B4HRIoHOpjc57CQx3loRnuNVVQuyPeHYGFf938pInoTxZvkcWxAv15hXZDzpcNcX0EyeAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwiGLzErNGWV9kNkc61bpspsalB+HdjkqiP50uTnDWA=;
 b=cO1aSwB2qdjNqV3wv/lJRCdG6+9+2ksEtwBkJO7Yo4EwGdIzBjk3CtbAQaCr62qwJN9YTgLfCWMs+xHT7FV2/hjtTIUjqHm+8DiDFTNY697G3nhp+NJrSIjxsooIoYO6BA31LlD09OonkxQIgtuk3y1OSboxFhRbbtLn1rkxa0BM9L6d0v40WaOFH3Pd74RxSCRp/4wrykvZbbQ1UbpypGkato6nkWjuHCtOEYjK672pB8UtvIoZypqfhAxAepwS3xL/7JIzmWAaARI6I151R1bHi/wh/WAyzoNklqJO8BT6guMk4y0d0r5KV5gg8W+azgUhno1iPZktlcTollxzAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwiGLzErNGWV9kNkc61bpspsalB+HdjkqiP50uTnDWA=;
 b=i01d/IsEOesTlDT5tXh/r10JayE6KiK0KfUGp4+bLPJVX41l+quuI7ipDAN/HLnbrHw6BuCcjTH7X5Bt4lNNWiLl3Rzgv5em6ZaQrS5uRLVdZNjBi4gLz/7lSejYHi6nA0LhppwR0mzv9JQvd4GmAnhzkQRcRvtkGNhpFo7uAX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9337.jpnprd01.prod.outlook.com (2603:1096:400:195::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 07:02:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:02:13 +0000
Message-ID: <873585lmdn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/25] ASoC: soc.h: add snd_soc_card_is_instantiated() helper
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:02:13 +0000
X-ClientProxiedBy: TYAPR01CA0086.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::26) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d05a20-091d-40cd-999e-08dafab4420a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nfKe+LaDCRp5cs0L//DsiI3IHrNp6SJeNli5G0d9ytOfoAI5f0ULvwx6pKz419KT7tcDIk0/xPAncMtVqdlLMI4GO+6LfTKZzP/Iw+fNC+DsLOqRsgSwBLPYwTtzxXjbRhMUeZYkT4Ny1+1of0kRTlwHxXtKmBsVCofM1OyMznqVOSyg65iLccjQByYX5SmlpWETbsKpNrbP372001WJLgb6WYqxI6mNmNjss319lDu2IjNRiTHaaM1JgsbrdAfpZB9pGGH3r4ToQ3ZPNHJbRWcw+o+yCF+GKltdXPFczwjGJAiYx1y3HtDlWD5bi+eYWhxjw6y7nTArEMw5M1wWcF3DzqMkv1aqbtNIaLCizZeVqmj1/5r9kQR7eNvwstUDoj9t0KIpd3/neu6zewdk+wtufJoQyJA0/KEfncp/Tn4X7CRKE99SY7CoxPZczjXMSLNxx+EfPUPP7bxyvqYLGwxpz69j68BnicBkTOeNUl1iB7LPXAhqR6S5WSIPeaklGKcmACU6Gy/3aJb7H6yphHJ69PVDW9FrkXz6meEaFXXdge3HGCU7qXu0y4E781KAP9n+iZe0+hYZVjRU6kT9DR+4a0hf3Em+yuA+4bhbpQ8zptDys6WpMKzza9TVBiND8w1ANBkB7bLM/MDrRHxh9fYxEGVdbZZT0YUxavnwagyBJbbL211cO3MtlrSr3Th66P6jyaeS0EEYoNMCeDuVXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(2906002)(41300700001)(6916009)(66476007)(8676002)(66556008)(66946007)(36756003)(4326008)(4744005)(7416002)(2616005)(8936002)(54906003)(5660300002)(316002)(6512007)(186003)(26005)(478600001)(38100700002)(38350700002)(52116002)(6506007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EBGZsDDFuk4jgLh3jOqeP75pBTiamSZi0TNpcc/o6Hjn5YswXQyPwb3mb3IM?=
 =?us-ascii?Q?VGvAk4cianVHFqbOXaYxww0otks//Ja5QHI12lMpxAy+bGSNXG1IjfVTgGGP?=
 =?us-ascii?Q?oTfLJIh7xbhs3BY2akiy4zsiUZ8gMtm3TnLmdCMelNdQ1f2V6wOe+96EWJbZ?=
 =?us-ascii?Q?p2tjcFF1FG1quiyhEopnsLbxH/6uf40M99wDbtSx4+MhNCSE0zwttP6Pq0yP?=
 =?us-ascii?Q?B7dB3f4kfnYHgiCO6Jn8VEaCAyzayC3Md0wwuEv6ZfPxRlNXSu5W63uuOttT?=
 =?us-ascii?Q?IvrZULcmzH9ocg23rCOxzTWSgSfh5gbSb2nm60YnvsQZ06cmi8Bu8m1t2ZdC?=
 =?us-ascii?Q?nndvHnNDCx1Gp8w3modGg9v+gLYzK9uh7E6Voch4OfYICLo2mMgOFi6LhSa6?=
 =?us-ascii?Q?azuVBvXZLaLfXcrbeCHKAnf+P9ZEfUoialzrOU7An/SGSpk3ONnB2WHN7j7g?=
 =?us-ascii?Q?73uihCc4nb7a1iQjefhAY6NKjjsa4QYBBb1XzRJY1KqLXb0YQ6vGnfmO51x9?=
 =?us-ascii?Q?VPuCcQYMHCVPs/9tEgFnsIzUin1i25q38U0G0iQ6P7lAw4X5stIVOwjcuX+y?=
 =?us-ascii?Q?43k6sl8Y5Uq7mOor8t2+mJwF9hjrekJKDCxOUTk8nss7K9wLSDHVvsSZDsYB?=
 =?us-ascii?Q?DaW6pCOTCppOnDdkFfw/+KW4meAWVqkh9T60HZ/mzeA5UHSGdFeCpuo5ZM7V?=
 =?us-ascii?Q?HOAgPI+3S3ZdyrBKsBO64BGprY7E2R2TPaCKwpx7+DLBkplTz+TOgLZ39SxT?=
 =?us-ascii?Q?WSb+u5ELyGpY9tfrNQpcR+8NPWgLON7arFuclr6y4YcmMFrs9Hp/ZZ7OpHGY?=
 =?us-ascii?Q?1rVZQ8Z3Xn0iqJg3ROYL/rGZkoJWadCJAIQMesynoLgBcbjgpvJhjXoWZsUV?=
 =?us-ascii?Q?FXxJ2R6TSiecwGiJzxSXEFVsMFO5NLKnpSyRtp5skB6QWnqnmfHtjEZ/S1G5?=
 =?us-ascii?Q?4EfwFY3bOlVjtmKbGV5cN6E67oCx2m6svoqCxqvh1tlX1GbodZ1ZcraEye+A?=
 =?us-ascii?Q?qEolZnI4/Z96o8/bxxujx6ry4OX7yR0bvbfijRt82t8jq5I0Ljeu0l+MOjHn?=
 =?us-ascii?Q?GPDONMniMF+VhU300dUcwdlNloZgXZ4F46t40IPs4e78B3Y9AIXyMstr04Yg?=
 =?us-ascii?Q?GadGUlL1uuuqBidan+eYR0Ii7TJ4zBoOk3UN4hJYePSRrDZ6HUaPglRCu24S?=
 =?us-ascii?Q?x7JjOkRD1xq9dSpRYQX5Rt+m7snohpgARpGPg87f3I9YP8JZCJgbGnVHycni?=
 =?us-ascii?Q?rQKIxc8E0JZKaixVx3z1q80uB6phew8w9v9VJytyCdAwrBqXd4v2VYg+8AkI?=
 =?us-ascii?Q?KRc3QsGAByHGow3AyFJyA+SjXsXioaubFkcysDfsTiZDoi4JX3ddhgwuFiY0?=
 =?us-ascii?Q?fOz6CSLe5c17rxYInGzB0fXqKfPMZpckTA3SSqV5yBfx/IY+ZhcPmz/PPEn1?=
 =?us-ascii?Q?BTLN53iRaRPkrWtYMsrnkC99HhYwV+Li204wYAko7go9v6CHOIM+xIxEaf0o?=
 =?us-ascii?Q?zw1nLFLLKDqFgx7rD1gXtdOajmXnmjUjdVRcFNDCUuNLXQzSWKl7ml5m3Qho?=
 =?us-ascii?Q?LW5wMEso5vlyBblsJBDmFe5VIO5S5Z5P1MrBEDoA6kQn0jFq/z6M4uSnQHcf?=
 =?us-ascii?Q?oOBauhXq7NlFMU/Wa2Zx+oY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d05a20-091d-40cd-999e-08dafab4420a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:02:13.8519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Se9TsXbHQ/0mX4qRHWvmS6T6wYYqft8Lpf1gQIcPWk4UhQ7PMxkK9Lg2THca9u7gATsGmZ30qruIdn1dQ8MWHAccfsZOS4+bwaukfxfq4C++NPdB6nYQ8VzTMgLkFsJF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9337
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ASoC framework/driver checks whether card was instantiated every
where. Then, it should check card pointer too in such case.
This patch adds snd_soc_card_is_instantiated() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 37bbfc8b45cb..e58b43b5da7c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1052,6 +1052,12 @@ struct snd_soc_card {
 #define for_each_card_widgets_safe(card, w, _w)	\
 	list_for_each_entry_safe(w, _w, &card->widgets, list)
 
+
+static inline int snd_soc_card_is_instantiated(struct snd_soc_card *card)
+{
+	return card && card->instantiated;
+}
+
 /* SoC machine DAI configuration, glues a codec and cpu DAI together */
 struct snd_soc_pcm_runtime {
 	struct device *dev;
-- 
2.25.1

