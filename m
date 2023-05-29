Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF4C714187
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:08:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E60384B;
	Mon, 29 May 2023 03:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E60384B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322480;
	bh=YOfXMtp4Xd7w7VTZDZzK8IKEFvxuS4daQh2h/u3zUAQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h8RrYwFr9Pm6aGK2VvXzSGnI92kEvoenP+OMGp9MzqpOCzVL30t8/DcSLkP/NVYyK
	 hVLg2swRFsXojFtMVSeXsDRllkV0drhYMC0CNfbdndlpyABNkudNSESeDKS0TWmaVl
	 M3adNXLtmCXS6HdRWG/lRGKaunDlwuTxf+10h4fs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ECC5F805DA; Mon, 29 May 2023 03:05:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA126F805C5;
	Mon, 29 May 2023 03:05:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2B50F805C4; Mon, 29 May 2023 03:05:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A4A7F80579
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A4A7F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QQnSsitD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQhn9leLCOK5w5/nQL8+iWqzCoMxz5XW7/+e/ghJ7HFU8jY8Xn/7gbrT1IWvLbINQuVxec5HxEAjAQefHdyGoJnlA6jseZODRo97pq9xSXobE1Ou+UIjeOZYt5Plv6CA9SzhbXeX0KF2hybsEB0SXlKSeUmABkfuePQ8ly2DXQQowYSuq1pUglFZzOPEJfvLvpd/aWsDjgeOBGf9vOKpRCxXyVmBbMjrF7kCuAjZ+I46fT3wDujZWhNSmN12J5nYgk18rBLaL6hDm76PNp/ePVHiR76teXfOTNGw1uR1+SLtuniS3z/I03oFf1N1x9yXBZO0cR7TXHUIB8dwhhZrJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0MBxES8G7KqJnqvndkCwJeuWMPog7wEcaBC84kjtAg=;
 b=c4Q4xswICTYkwf8GDuKQ7yDRQVJ6Xi6ABWOcL2JtGBhjX2/3iWUKFwBxD+TIxOP7CilyxGSeidx4TNzLXSnSRL7gbHIzZXRjYUVzTQAsaL+AGjuYUqFovpJSIEZfs1qDFuSXjxO45CIPoPYe/TuLEz85ppw42hgydqCqCebWE3F+5pmlkmkbHwOrlZvGKdThpcIUtY4ZIrv0IRAgbp61Cjm3faLvfkaJmKHqpvOMmPo1PKk2OpVwFplyytpCdX3YQe52g1sFehMTY5pUJWajUU0zpC3scDH+A9+KOCld2OatEbrPNHEctHm5Q7tQpW8CrSr381p3J8LYlwv+1B+eDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0MBxES8G7KqJnqvndkCwJeuWMPog7wEcaBC84kjtAg=;
 b=QQnSsitDnUzqAXhF5+5I7QRKgMfm4TZwG8Fyt3NmTR7imeMgIavku9/nMl4fl41cuxlW8EKsclbJGwGKeeNouLLzlDm4PCWDP5XaBZoRD7Zeg2YgusMuwUxFwUQynmLaflt5PNRDEF97vzUm38fwMgv4A+uEJTRtY6GgiN6TYT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7952.jpnprd01.prod.outlook.com (2603:1096:400:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:05:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:05:24 +0000
Message-ID: <871qj0lzfw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 16/21] ASoC: soc-dai.c: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 May 2023 01:05:23 +0000
X-ClientProxiedBy: TY2PR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:404:a::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ac040f-c5c9-40d7-b4bc-08db5fe0c83d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S5me5yYqDOBBzWlYRdkEmF6lIHDbZ2dAUROlXFTZRB3qk4gc7itG4M3z/byPCB52MZgVh3dGAf0kim3UNg2uFF4P5HXdRIrw10fx1ps4Df/toDlnEsCl51gLpOA4E18Z0v2kYWpVKcwGhXzuQBx5VKdh67eHq4JWNKgJGVYlTqwpeW+Poy0SY7TepM6ftZXTYekftZkzFdyIn3WUBx4m0ohbvTIpGB1+BLiacsx4FxjJk9q9tQacqLV3pZSjItRbpp6H7PbwJIhhT+anr1bycs6qdj222r6shD93izKtLg3YVZdLfXAeEt9wYRU+1IV20NtdKeFtGbCPyRi0C5L0G821GJM8aWjDs+Lv43yy/9jo2L4RxoxLqehOoQLpuFUgDpof+NUe9A0f9MqIkxeNwDmyaYAcQt5f0jwZTuTk2L7exFy1A68cEaiElPDmLoXB+0REvq3p6jxAbVRa7EDBzD0zMYWc4ydbyxWJxwVqfwzlpYbgPa0Z+Te48EtY1grAWAEye+2755QE4d/lVEVthheRZyOPeXKqliuZkwURxshSOmV+c+bBtqtWt2nranro5CSCtBDbkU4KE+ZXsbiocm1Jxu13/Wxcdw8JxQE7tZPJ7CGfJdcuPT9ATyp5YPQE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(2906002)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(52116002)(6486002)(41300700001)(86362001)(316002)(66946007)(36756003)(66476007)(66556008)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SEWgH0BX7/hS494icvpFagmu5GHO6HDelSz8z6PN83tQtXaz0ytBppLu+eng?=
 =?us-ascii?Q?T8evR8cirUd/8X0Vzwh2nEzC4y0BEHFWPU1JtauC6w103NFlZ200H9RsQqP3?=
 =?us-ascii?Q?c9GIutOJIK8i3/dqv/zmwcC2DoQMC8b95Bbe+FZHVcyzJbqCOWB15sMqiNEm?=
 =?us-ascii?Q?fVcJh/7dGmIItpFH0LjZr/rhm6k33vpaPEXKB0ke+vUXBBPDu9K51gI8uTyC?=
 =?us-ascii?Q?RPQuUQ5X5UHlJjj0u1p/LaYcVNmJq3gxdH8dOD/+0R3URCMja0i+3yYTF0gs?=
 =?us-ascii?Q?GAuIFeuicom2v8tKpntxmSEosm3pDAiVISBpbysAr8TQ6OyX4Q2+MEvI6Y8w?=
 =?us-ascii?Q?liTgEDTOAHUd1+TNqMG8c/ewVV+hWBKz7HMfyYfxHm+A7SbOcpsl+Vq1lpGS?=
 =?us-ascii?Q?N4Z1ybIhw/jwWXNiZNrMeIEpZk6brEtsWuUfcISJ97jjjatjYkV/7Cq9v7qQ?=
 =?us-ascii?Q?N8zHO0PnyHqzeBYN+5lMXoiS9N7bl/MSFQ0GUoWIdla4lt3h4gC7PRtfzPyr?=
 =?us-ascii?Q?XIjpWl5RrVsUcL5B8F4vWyhggCFyDNRMeAOMZeClIbgiSlK8abubyeEjx4LZ?=
 =?us-ascii?Q?JAI/4UJAGhNT40+60u7e3Sy1HF67kL4yjcWkUDGBpJGFXompJhmM2m8JoXv6?=
 =?us-ascii?Q?xmRt5e6p3aQfxRlrzIWTIBWF4qBjxwxR1Z4peaSwSA8JtnYTTCdHOA1CGf+L?=
 =?us-ascii?Q?Lk9afLOw6B6mJpEUtstVCPJPV+7aq0KfRctn/G7unn6kx0wZLZKmhhWDpYM8?=
 =?us-ascii?Q?HxbmggnSoVaQmLjt5seOOb3GoQbVjcMLfZT0qrTPPu+d/QicVef7ZN/AnaEr?=
 =?us-ascii?Q?ZpPJ2V/PI0QNcpEFCo8fAzcYWubLl2oBfI7EghEkJuEYD/6Fb9keJQp4Ai4d?=
 =?us-ascii?Q?6m9P/1eL85clfmI5BhXy7f8iL70zvNQCNruhzylZTaeninuz7SwmTxZKJX53?=
 =?us-ascii?Q?mXrjfG7/nA9yBjvPZSTZWxR/BBnjvluY+i0N7wzKxEiGlDZaxe4xtACF5o/Y?=
 =?us-ascii?Q?iTttztojhj71iYf2hlR9gjXZnN/wySJ8nOFFsYFjpJh6gZb8Yqok2Phz5kly?=
 =?us-ascii?Q?qaVhb0xN4EPHFj8Lk+mx6T5gu0VWiqumGoBg6zr0YDncUPCZMXIfBO2E9T3e?=
 =?us-ascii?Q?4VcM0BXCIevvymvM4fh5G8kSwPpLgqaBdChyhAm9Eq/IVVO7ZdwtGVbZ8ofb?=
 =?us-ascii?Q?cVdGzefqppy/wv/vHvfKNTx/sKkVxYxJyPxGSNG+AKUGAXdkoHQ7rXVEi6n1?=
 =?us-ascii?Q?5QSc9+w5DbFH0TKAokrPi+H6p+Wq+xTqnCfgR9gAxbBGzxugxuRd2yr9hn2x?=
 =?us-ascii?Q?L1lEXbavnLKscydi9Ue8/Eh8IqYKRRKvT6typgG22vnqy/0MLUJaWflaAGTf?=
 =?us-ascii?Q?x5tW5VsaqmbtJIi2H4mWySfRsaIC6g42IjQbDXiApB7t8DcIuibj4y8T4n88?=
 =?us-ascii?Q?EWh8xqO7KWrOlUVuec6yQf7+olTsk2gRb611uG4wj8pTKiTYAqLvb/6o/GmE?=
 =?us-ascii?Q?J8dadjWTIYOKgcmN2fy+ug5eSW9Oy/FsZUbPNGzTogSlilTFKbd96Xgj7n4u?=
 =?us-ascii?Q?uHtcqDgoqWCLAq4V5N1FVM386x2rrIYalZQKGbKPIWzscM1KDldShTZcRUOm?=
 =?us-ascii?Q?R3kKz3h/teEMp9SgSac4lGs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 43ac040f-c5c9-40d7-b4bc-08db5fe0c83d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:05:24.0817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mOv2wtImR30YC000UuYaAVPyoNxqvchnEDSzuJYdlXp/C8u0CLlJ4d5ucEsXEJUsVGKAd/9O0YiMJpL/WO/7YKjxHZeOngNCeh93NeXuEuzFdXjtTG8WK6Odp59oCW8B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7952
Message-ID-Hash: DTVVH7THWPAR7T6GOQDICRUGLPQTI7RO
X-Message-ID-Hash: DTVVH7THWPAR7T6GOQDICRUGLPQTI7RO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DTVVH7THWPAR7T6GOQDICRUGLPQTI7RO/>
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
 sound/soc/soc-dai.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 02dd64dea179..138f71ceab3c 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -505,8 +505,10 @@ void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link)
 		supported[direction] = supported_cpu && supported_codec;
 	}
 
-	dai_link->dpcm_playback = supported[SNDRV_PCM_STREAM_PLAYBACK];
-	dai_link->dpcm_capture  = supported[SNDRV_PCM_STREAM_CAPTURE];
+	dai_link->playback_only = supported[SNDRV_PCM_STREAM_PLAYBACK] &&
+				 !supported[SNDRV_PCM_STREAM_CAPTURE];
+	dai_link->capture_only  = supported[SNDRV_PCM_STREAM_CAPTURE] &&
+				 !supported[SNDRV_PCM_STREAM_PLAYBACK];
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_link_set_capabilities);
 
-- 
2.25.1

