Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F1F7079E8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:52:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 492BBDE;
	Thu, 18 May 2023 07:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 492BBDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684389152;
	bh=GRwlCRp5ndl0F/IBfqq4KL7Aq6bVeeXh+aDypGbh4mo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=itQ3RqmQxOhvtKJtr7VXCML0fya7kJQUDTa7dCFdYWQLE7NIlPkWke02W4opeQAfp
	 3/CFDe0uZh95NeJxPdpPw+5Fa++w7pa+t3TNqs/9F+IOvOy/hBAYC2SmUeYuHSY1T1
	 O3Tqr3nXs4BiX4kiB4t/Kdg6ZXTaG18gWDRIMcl0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76D91F805F5; Thu, 18 May 2023 07:49:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B027F805C1;
	Thu, 18 May 2023 07:49:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32E1AF805EE; Thu, 18 May 2023 07:49:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05D1DF805E6
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05D1DF805E6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Hk+2OB92
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSLmNaX5dkvJvnTgkz6CARbZYYVd56ghqUBQw73+OSuL36u3UWvM2pb2Zit3y0gEwS3AQykHSNiIG148ceEMfiLthqvE3/iwf9JSLBedHZGa88k1HQ10n05O/M1MPcQkW471M0qfwrKcUoUexgUZKM6HpPW0tzIyWXgd5dal4o2l4EL6/7AVIdPjkwFGmlJTBqzqljUYgTNIcMNlmq6vaDgE2vtWiBsNYcplXU76cNUQ/ZxcbRk1c3cO5QbjukamO+YwMry7xThRpgsqFsiBOlU2fdKO/z8t7JXUWDuV57k21G+ks/+OoXxnIkJoPd+nhuBfRWjwvZezQvtBV8yqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+JaZB2+1Qbc1YqBv4oPcCEPSAFChQvFQwBtQ0Noebg=;
 b=NdGJG8HngNV6Pc/Q/j/4AWwoneUZocOw5C+SRtlbEhgPh48IoAqTGMxmZ9PNi/6H2ZxA78eXFz+LNKoVA7iaUFAoj16RlqbsP88sG1UojdF+7s9oqytSpwdGYHLtmaYaKC5pV8VmDFnUAiNl3Aor8HhRfxMFTYdDMgCVvtw0/t8yDSZIMp9uq+LFBNRRSBfJGPxgWk96H2BoZvnV1Z/tlZdCpWosndgrc5t62gEyWrEYhvx5QXcmDaGaiCjwGl46DgSEDA78/s73KkymuhlhSEKwPHmnQYv/C60XeNX4hTBVQtjowG+RpCmhv7Dn8JIBaSlqjeFWg6f5m7draTBnhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+JaZB2+1Qbc1YqBv4oPcCEPSAFChQvFQwBtQ0Noebg=;
 b=Hk+2OB92wOWFGCPi/IphhHu9yscwH4FUBUmTBSFHSvaY2mvuyT7oS0kj6rGNz8w3nIViRcUGODnPrODqO6RhwLvvIYLy9YZEHNLC7iSNKrD/+Yx00u0gLGz/Zx5ncvWdTyUmnOEQ7kmskqniQHAwQk3mATXQfQ5+2m8MpJFMgk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYBPR01MB5325.jpnprd01.prod.outlook.com (2603:1096:404:8023::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:49:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:49:27 +0000
Message-ID: <87fs7up4t5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 16/20] ASoC: soc-dai.c: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:49:26 +0000
X-ClientProxiedBy: TYCP286CA0228.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYBPR01MB5325:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c3e252-1398-46d9-4eb9-08db5763a3ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YjUjMy0Z6rEh3wTXQBOAVkaqqYjUY6ha+Epm5EQ7xC8cXmC/mminkuJ1bIT0llWmcT1bZlKn8VYVNa7hlBMFSaboQ5ggQC5NujZkaDjktywzVpfIXH0e/wokom9eLTlwO3p3tEFmL6Vn5l8VwN2wal6nsTcDKkl/khC0Sui09WJnDamcCqd8EIByFj4xOJKKKuB8g9yolI7kmoO79EvYF/OPPHKwY5VMGOQ8Y9s9A7oQ0vQHK6S7eO68NugUs95j8YnATtq41hzZvZjMgjdyqcTW6B1kyfjPmFT2gNMWxn7AijhCerkqgPkVGzMFs4Z1WuBcvEHnKfgCVajDIUTFizlxumbHJlGk4l7grvWzVykrV6yQ4+XVg45a7MO1hqQ2kOEkehBCBbFS9VVyyANoSnArtu3yDa3hNrD0USsZCVd5IwX+BOjzMlHPYeL9y4p848ZJKDIg4vtm6ROL+XIQGjUzVP2FLaBvQ+zroFvT68WAZMXHGTVpGlV2yZMAUyeSf62pbg4DziYXHURAwAOGQzSfvP/yIsHyZGcMKSJSGGTe1YqqrunmiG27SpV2HB2r3E/pHXJY3f7ppkLjnWwCceAYAgL1DbAGs2Fw7wz+LYX2c1NWjgluOAxmwmGacpxg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199021)(36756003)(52116002)(6486002)(2616005)(110136005)(86362001)(83380400001)(6506007)(6512007)(478600001)(38350700002)(38100700002)(26005)(186003)(4744005)(2906002)(8936002)(8676002)(41300700001)(316002)(4326008)(66556008)(66476007)(66946007)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1/VESsPEGuAPz8JRvQWix2BVS+4WaHrL0XnF5G0HmR6DMAXrYF8lFXTqUcRZ?=
 =?us-ascii?Q?qvGBcGIQKWnRnalCmit3M/DNKjKhvAujZdLZgacdYmkBXqjUUYm63qcJ2LK0?=
 =?us-ascii?Q?TaM1z4cED9Hlf9lT6fyfQGzM+iPIHwJhIrFAjwqy+3sJ9alLxgg7R7TF5x/D?=
 =?us-ascii?Q?oHMEGMz2vSeDmggnGn8wvgbF3VFTVCVK+esZe9+VRASkCi7s6WeqDjWy0Fbr?=
 =?us-ascii?Q?D6o2Ksr5hrDhBE5LgiT+IVNpgwtGYPZSb7YVEUiJg3bIUl3aZU2f4OBruJRm?=
 =?us-ascii?Q?Bm0tuTST8PBFV+K0hnMiSd/EOYd4fuDnTYt8XaXlLPW4daQ/zEKos/MTQLmY?=
 =?us-ascii?Q?0grZmIpIjOXx5qNRDLvqSdMgX9B8+ERy32GDNKVVn3C5BBb3CGLLhFpHASl4?=
 =?us-ascii?Q?QMeG9iD5mOhhca62XQQiv4TTJEZlW/YclWdAGb3SUS/7J4pRdVgqp7OEgKnI?=
 =?us-ascii?Q?KfMj0sgT68x+5ZMu+UEANPBzm9RdctAsGWB2TlL5T/i3yWdJHiAiXVPhLu9U?=
 =?us-ascii?Q?Fu9Ra4hjY++C6LV9H6gJXX4a5Zu3yoB0iRf5M8Xend5WfiinXGCC/MyJpuMk?=
 =?us-ascii?Q?QCVbBetlxU/UeGQr1fWZyMb9hoXkTFdH233f4TW4V2Xd0boPMZ5tHkttAM8w?=
 =?us-ascii?Q?Z7ae7+t9E+hEBs/AT2gOynu+H7QPkpgMyrhWDy6jPm/bOH4i+dM9Ti/BOrzV?=
 =?us-ascii?Q?FKtDP6LtUIHuKNduGCgXcmury8aCoylEoc8ut6PFVVX/ucf35pplz11+dGKl?=
 =?us-ascii?Q?L/CEbqfgJvxdZJ0kgEOPLN0y8su7FmkJ7MAVyJuEtRw2HRUOvtYailw7CJfq?=
 =?us-ascii?Q?uBto1ymEfCmDM9ozmou3Zl7hGSc1mZqotkEq/55uUJ5eiE/bpuU4+MoB8N/2?=
 =?us-ascii?Q?39js/r4WXh0W2rogcmdtgavg9HX1jGFxEHENqAX0M6oH+6XABGVM+VbS4vbJ?=
 =?us-ascii?Q?QhPVyqHb2vcLmWJSzHF2B/qMnDPoLNYUxxtpSXpiKfPBZQfrb7Nxg2O5uJEK?=
 =?us-ascii?Q?VV/0e41q127vivNzXPzozoqvMBvTVQY+gI7ekIKwpkuWXhiASEMc0w5Ixl8/?=
 =?us-ascii?Q?hK6iLT/fWly6z+iYfzWabBaES5ryY6SfShhUm2rLpnHvX63QSjhS1TCSQYFL?=
 =?us-ascii?Q?4NGlYHbjeISN0f1wVuWXHc1SZo1MQduCRtX8Wd11MZ+RZQuitm3YcLqGZE6v?=
 =?us-ascii?Q?5i6yBoh2lH5LVCRjNomi62qr2lZbIo+oXLfV6ftuQ/IgAFMlyWX2BLVJaH93?=
 =?us-ascii?Q?ZWURQVH/CIzQjWaoX+sLWz26AmuTJ5uJ/672CZ/C3sljifT1L9Y1cN1kvKjA?=
 =?us-ascii?Q?ZRaf9/GC1AFwYBZ6MuRJ37/yb+9POueFe/vIjMKjr46nLhfNk/tCUEIeXCll?=
 =?us-ascii?Q?Zp5KuolggsqN3kwe0XaVzZwrS6oM6ujPSmFgA06UyVfxGjaLmzWvwcvSzT4c?=
 =?us-ascii?Q?js2zx+J2LDFz+bWcmEaYrmc84X4omuE0qbLSJul6Qb+0cDgsjKRjAcrgjQ29?=
 =?us-ascii?Q?fajYUg0ccddDRDx3BVapMCoNuhmIpK0mdgzorD0Tr1hFm5nn44syYvXjB/AF?=
 =?us-ascii?Q?ZXiteTC+/vMXwmZf7hD2POY+Kp8oq6lshhFN3YNPNFF8sMNtmw7t4J+MrxUI?=
 =?us-ascii?Q?JHCwz3v+t1cDYDS6NdDed+c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b2c3e252-1398-46d9-4eb9-08db5763a3ec
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:49:27.2362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QJXcATbEFccvIpaJibbr/nj4UQ1i2pdeNjrasxtXU9xp7tD9cJA7/MezSNCdRkqHEKbvBAjCkCcChKji4X/V1uB/NCtdOnGUDyBa4Jh+vQ5qoOgUKhq/OSvZh18BYYnY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5325
Message-ID-Hash: E2RYOGDVNQJEGTMBM7D4KY2ZL5OV22GV
X-Message-ID-Hash: E2RYOGDVNQJEGTMBM7D4KY2ZL5OV22GV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E2RYOGDVNQJEGTMBM7D4KY2ZL5OV22GV/>
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
 sound/soc/soc-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 02dd64dea179..e61414bb0b72 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -505,8 +505,8 @@ void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link)
 		supported[direction] = supported_cpu && supported_codec;
 	}
 
-	dai_link->dpcm_playback = supported[SNDRV_PCM_STREAM_PLAYBACK];
-	dai_link->dpcm_capture  = supported[SNDRV_PCM_STREAM_CAPTURE];
+	dai_link->playback_only = !supported[SNDRV_PCM_STREAM_CAPTURE];
+	dai_link->capture_only  = !supported[SNDRV_PCM_STREAM_PLAYBACK];
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_link_set_capabilities);
 
-- 
2.25.1

