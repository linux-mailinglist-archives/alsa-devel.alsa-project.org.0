Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF7E6821C6
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:02:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CEB8EAA;
	Tue, 31 Jan 2023 03:01:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CEB8EAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130531;
	bh=9l34JNrCKH/X4nvx21PI1aNB3NuvcrDUD35HM5FU7ts=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fA6XUwXU2iSSLDszAT+on6erjfxNecHD9k9LBTuwxy2dHIEPwsxRtERO6fcdCXY3H
	 goF1wPMVOt8Q3JdR3atAeUuFCS8UAt2GYk81P48j4v5/Xj2rAMvWqkW0vgi7i7a6Vb
	 bU5gAF0GBbwKzAGd5dj2RKZCjHvUUoDboL0PIm5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 144EDF8057A;
	Tue, 31 Jan 2023 03:00:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0457AF80558; Tue, 31 Jan 2023 03:00:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2129.outbound.protection.outlook.com [40.107.255.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66804F80551
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66804F80551
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=c3qyZxL0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXeNubCMbtQvQxlpgelEG6PfS7+CRYTsFLTqI7Ck0y/8ia24g8GFI/y8zY0VMcDwURjYssXWH9tj+US4gf3rApPV+LCE1K0NmN6NKBvM6TO3y+G8VVRrZY92WNlmOVIEbjxHYzSFv/aj7QNEBZvU1yd59gatJnKXo1e26LzGMgsepYURs00trsOqYZxSHgeDXx81jEYj+N2j5JQoFcLImc1R8AAMjN0wMhwDGG/x0duWmgFlCYRtYDConbONtdebUcl9iSW4VOfcmIoJWiPFkZRIqhureyiLF72pIjodkXhvIWp8fCIvuVUJC0Z/Nuj9AI82pwEhao76Ner2bNOWCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8Vh7pPnO+anfYS1SQvMlS48/4F1mNT8fZccdrleJoo=;
 b=SekVpQEUp1Xa15P5ehpaifsrW+7HdzE2ssAYwrHA3trzeyjrJlQNrBI6PX9NyhIhsOnyKFRsxZaI0iU6ORSreiHseQGZOE7Jlz7wW8v7woC1fhVkrhsOCK4j5yIYCT3a/OcoEQgYz6vAqhd7gHD8v0gU7iXzPUoO31VtJZfNH5XMRJRvF9CN7jW4Xg6ns9+d0bFC//PP6Y05Cgvq6v8B5Hsw51rUAy9tw+9ZUJkdjEBwcjyZOscywzTYp1iY85nmWZlsQLeEnpawnEBHeWHOeWusOVxPG4Eb6IKvygLsA3LGlt8rR+y3tjDjh1evZA3dvX0IZK8Jge6IcccWFvGbug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8Vh7pPnO+anfYS1SQvMlS48/4F1mNT8fZccdrleJoo=;
 b=c3qyZxL0QlsW0tGKDdszCW6KSzOmROWJqk8SOBZR71AJQjJBisq15k2tCBXYEdDdyJE0R09yeFAasBejQfPdfzQi0kaYNDrfauug+Qa+hFNUYZ5YeZYwcXjYMDrSGIlkizVlQlzmKi6i+o3dT0prXuiq39MiX/olpHC89vSfwN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8196.jpnprd01.prod.outlook.com (2603:1096:604:176::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 01:59:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 01:59:59 +0000
Message-ID: <871qnbfopt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 08/25] ASoC: max: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 01:59:58 +0000
X-ClientProxiedBy: TYWP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: dde8c19e-00ba-45f0-c3cb-08db032edb84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9qqOnx7ktBzA8yjitU/vcDevOK1mvpNujjJNjOEjSufp54sRe7k7tHJNpQqfobzyfvG91H1w4tqlIfWG5LcAYtcx062P0rLECDTkauCyPLsAWsvBAePA45H5szaiWkMt8VNz/Rsm49SofTHDx1LJryMzjCenCecLpms6ine4K1O+m1t4GEYbIXdN5MhkAUZFhbBSMnTuE4IJt6Vbut2U9Kh5aV3zaM4xUWN+EfvFS+kNwVtFriF84QheIRGRGOidaRq3lFkZhiD+6lW0BVpll7KlnvfuYPH/WviYov2EKskxaeEdPeQzK02VL6+XDQHcP/6nCTq0k18BkpLck845H/C/a1s+0dop3y01JNRUQlALru8e9/LlKsljrxEfUvICjovU4oTcPE0+pAzFDuL8PZEF+2B44Ppamf373rt+l2SWijGAe4pveG+j89k3ctnUhQN9SaCbHvf4KGWKKaj3ECRD9N6Mb/GpC8OH6slpbat4T0Rza6LeyoOsV45HdBXcL+jtprM7f51XhxaooQlfjVUvwSkpHdWdl8JcOtBLxKfBS6apiuRldDs8Deh1LaEvnwrckR79dR+4hXTQ2jW7AiEM3heDeyjMvYXy1s7mrr9QTknHJFvHPHmNxxU8bULbJOykydV9trSaFAycgzejQZaDkEissvPxlYMEt3ENppJS8PEp0HSQv/jaIe8VkWMG3vhyTIvmdYn8qT24/QHtiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199018)(8936002)(2906002)(6916009)(38100700002)(4326008)(38350700002)(36756003)(478600001)(5660300002)(4744005)(186003)(6486002)(6506007)(52116002)(26005)(6512007)(2616005)(86362001)(41300700001)(83380400001)(66556008)(8676002)(66946007)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jk90cElgFbkQAHq2XaC/7rhh3N1nCsxaetc22Ug73203tyP9JQpAf/2ytQe+?=
 =?us-ascii?Q?IzWcUrsmQaRNSRSjRXViwANCOtINwWL/JqZzRwa+bsIwIB8EEPzXwDZRmoyT?=
 =?us-ascii?Q?NhHwNFapRANHVDdZ2WEo0G7V3A9EKXdPfqZe4UYlnn1M2M9LFIANfGKNymSE?=
 =?us-ascii?Q?P8vK6U0VAReekch1XcQ4SzeJvTpUFkye3lYl2rzwh7Bi3UCuqLCY/oXZnMUv?=
 =?us-ascii?Q?wpjQGrDXu7wz21KBWjsEB5nX8U2a7GJjeTnCyyIXtHwqT9VQiC7iEIqf1C5D?=
 =?us-ascii?Q?Ck1S7Im7LWcOVbIATZ8w2p7VEcYBf5YtKxFpiltwBu4CmeKEadbv3SurcST8?=
 =?us-ascii?Q?LLdbLQtzy25qK77HgHT4TfDZlib9hrgeA8zTsUAgdtYFMCOf8ZligLGBklmJ?=
 =?us-ascii?Q?1FWBLXvbQR+Mq3MwJLiLhigRHWAJRyN1IwR4hVOKyLRKgXABn+ao2538Wl/H?=
 =?us-ascii?Q?jKZ5c6QR2wEIP0jxrny+8WRUbixw32LDTz8WGUgeW3rm6A4tV6VxnVxFNrG+?=
 =?us-ascii?Q?fEbn338unod1o6nw3U2N5+VWigYU2uh28XTPqXkhNYB6O2ehTSgMhFoDZg/v?=
 =?us-ascii?Q?FzD6nJYdF8nupTn2xhICeQScpoaEan8U+4D/FVpWIoO3INN3ZXhZdGxDj331?=
 =?us-ascii?Q?Iupl6l/rdWPJQbLuccbhvNNIJ6Fip9qh6sM3/fMg+uDhqHy+QdH4YkWeFAhj?=
 =?us-ascii?Q?YmGMnJMfb18wY4/xwiKwv5uVTS7qSozZR6yRTxvqOON2XATemCvd142x+zoX?=
 =?us-ascii?Q?mVEgtdweD3n8SU5tPqfF7pLnj2xH6U7Dpf4lwgAZTWP3GVSty5wFkbZjBdLc?=
 =?us-ascii?Q?V2HATf3Z5hm8ChsD4Joe1ncXI/lkwk4xO3HKjSRExxYoQXIiUww1/A0N4ZKd?=
 =?us-ascii?Q?iG8lxVyHcLpBIgmE+R2BDP/8LKoRqxf2cMJUXpnCa0KA3yBZxdGvMFhW7IjE?=
 =?us-ascii?Q?L4GiTtaMgC/O2SpadfMC34Eq9zlw2b5frugiaTn0vx92SixnF+6DRNCaZtsG?=
 =?us-ascii?Q?FeScDSZaToCKQ5wAbOPHm07L1/v+cXCJtJyigoW0EYKtyNyMTZuR21X6x37H?=
 =?us-ascii?Q?9Cxw9jkFYWEmitnJIKLHeXJNFx3IfTaYgvHuZJqtaOJmiziTa+Ft1IVe9pba?=
 =?us-ascii?Q?G/Eztgldp3338vsoHmVSlrv8Ue3/rd/Nr9sw/9yOM7itzXnWhArBHwunuX6Y?=
 =?us-ascii?Q?qsk2eN9hCkwZLGwOLoiixLmF/LnaxldVMkot535NF3digwhkPrmi50C2O1q4?=
 =?us-ascii?Q?Gn7vI8I1uDFjJjcFU9fAJ4hk3dPtas4jp3Vu3WoHgM9/3c3L2sOdL9k7yBuT?=
 =?us-ascii?Q?uQl5IQtqc3xUmKzjGSb+fI3cwgvdl2ku56BkZEWNF1rbqLL7q1GuCxabkDdc?=
 =?us-ascii?Q?wT64UH+Z5MJErQu2ApTzczVzQ7Vo8sCi3c2/aiBi7pR1wVOR7ZizfcX0iP/v?=
 =?us-ascii?Q?AGeJkn+LE8btMvgJKi6ssxltQgRsfdjJtHEai3jnmi4reHn5V6JvhYWgIBY+?=
 =?us-ascii?Q?CWyRIz5vxcznffc58MDwvUdkDd+Tk6+B+yurPuxGzM+W+R604FGARDrWXXJ5?=
 =?us-ascii?Q?JziHEk6DBgJgjccj0mwu2yP5FYVMEBC0x6tVs3sZXh7Ne/XfPb5gfZjkPOH0?=
 =?us-ascii?Q?kSZcu28+b1A9wx7UcK//SA0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde8c19e-00ba-45f0-c3cb-08db032edb84
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 01:59:59.0909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /B0FEd5h3z2NOCOXLgIQ6dE43a3yJfhjBzn72lafHS8zDB15J9021JWW5qfibwCfNEayhQs8F10q9tuN715Y8ZKKrgNZMBdXUBC6VqMSNoAN6UTKpiGQJhyARGa74TYk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8196
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/max98373-sdw.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index 3cd1be743d9e..c9a2d4dabd3c 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -689,10 +689,7 @@ static int max98373_set_sdw_stream(struct snd_soc_dai *dai,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
-- 
2.25.1

