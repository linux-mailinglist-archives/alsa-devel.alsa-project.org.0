Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC016678E21
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:17:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C948EB8;
	Tue, 24 Jan 2023 03:16:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C948EB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526662;
	bh=V9MyIvBqwhh3wC6FnuWmuMBkgR/X+50sHhrQwyt0920=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=say1vkgNpvduVxEnq+UBc7hxdvjYavQ1Km+hbvlQ21mTVL/VUfWJfiD2aChCxHOBE
	 2E9BtHJf0ebpIVRaQ4E/3cRuUzSatGVEY3y0pKkR1DG/DHICryVfWXpBDgeDnGQnAe
	 4qom88AJBErQoNkJwOoc2aIR5eLVYw3rJ2rqFG8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20A0EF80163;
	Tue, 24 Jan 2023 03:16:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 747F6F802DF; Tue, 24 Jan 2023 03:16:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B41A4F8025D
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:16:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B41A4F8025D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=IluOpBH6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbTJrD/wCc7S3/BlUTMTC+WTfJvFavFhA6fh8ZlVF+8LY/TykZv7CybwkJTZ6YFCj6vyFxosXfX4fC7NFFs6CqYdIb9ujDzGY1Qhw1zCv9X6jpDA2C/7gG8PMpQXcjQ3DmjEdquvjEyrHGgmWFCQc9XVHn1pIPAUkCMbILdGr8rMSHuhWo16+8NIQyPdu5VI065JmynIaYZ9cmCYuqX62e/aUXASfP2C6AAJ4si4Lza5ssrDESdfmilpk+cPpgemKI5NLpuA7hDEzcOo+8XGa4sAUSi7vcwx6XQM+KWTnNDZYE2U+G5TIvDpyWXz5giwiMsLtoxecaZuhV8rsh5e+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NpJXLWtAquJhLJ1CHPFLqOu6Y6ajmRFdc+Sl3HYRQg=;
 b=V5twQRNHZuv9TqoPsz8StMWjsWEgoZHM/CDUO6IYosJJ9yr0voNo/PXtE7Mto2/9QbQ8lQndB/vdUoQtGb4zYCjrYLmHdA48a4+50OBtAuQYlN3RZeOyf6RN2jRAWQGDAonmbVEHWF4v3znjQpu2YInrimBMItG03UZjfg4mIwJoTfSH1wYeNQOBSymLuKs+4Bk/j2lQ+5ZXEs78WY7fSZIbKaGTcRSkWIeURSuw06iP+9qJ/ccE24215COBs7tBLDRCimJwXkND2h+NRngyk+rV1jx4fV1q9U806bB3T98KKw+ROj7zdi8gdkzWhKUTiBlZRpknaTSgVNE/IKV5BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NpJXLWtAquJhLJ1CHPFLqOu6Y6ajmRFdc+Sl3HYRQg=;
 b=IluOpBH6x1mAzPj4G/r3ocsvdUFUTtwBwpuKHjXQzzUxrFMJElDq8FZ51d1U08P82ZsbSTvN6RupnDJU4bdZvU1dA5g9tSgTpd1PjH9qPWQKJ1An3/UVs6k23M2Ao+Sx5yvtTC1NrWlYaE0U61AR+OxlhfgQo/B6mY7o2t+Pi28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8812.jpnprd01.prod.outlook.com (2603:1096:604:17d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:16:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:16:42 +0000
Message-ID: <873580u16e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 22/25] ASoC: soc-dai.c: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:16:41 +0000
X-ClientProxiedBy: TYAPR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: e599de87-1304-4299-29e3-08dafdb10857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sBm0AgVUz4NruQ9FqoQVULiXWflhT939ACMmBi7rTbOJVhQuALMG5z5Z/pXmG8ezJ11FudLWfXb8VfmUjS92AidguLFLxElztWN54+M+cl58rs3fZJCQ2P3/CFj5I2OPGV+bciAbtKKzJqykn57qozBLG65W1OabhyD3PRIILstwpSnZcoEYY5ed7+s7J5H5O0JTxRb3M4jM/1jNTIbOowjxrguC71Uwub3KruAH5Tz4PqNMXXbAdzABkn6WgK5Ld/9XgOMXk8IErjBafV/UrZEtKfoUW48jb2KwuiV1AcEFZTHNPV7VWa8RgJ/PbqzJKK06ITZSQswVB2T2mweVag67Ag+7ecWjM1qdokhLSIparwePgWT5kLcbHbdBqX3HzAFq9qjKAQKu40A/vHe3l5hWHdsCESJstSNzb+ljE4IeQZZjKuzqIHyL08kIW3SgmukCr8FhJyTRL1Yx89+6z5S1OhNZLhq0gXaCXgGGKHJAP9GSy4yWiVudbQgAPNtsR3askM8s0sP8lSTae4AWUDW45cmfvYMIPKgfUm+Kv7kzPB4vtiKdABD1AAWPqzk4FJvow3kDjUep8trYtNiH4VCOfX7sVl9eSB1OsgIw5Po2m2i6aab7TIpR63BlFSU6UODewv2c8Xr+bd/hYskpfZneFRx+83bjDlMNd+eZUeFqVReCkb47989+WO36v/Vfs29O7Xi+RTHx3vD7l0mZszFoT6Vf6RY69tX3FKgR0SU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(38350700002)(38100700002)(83380400001)(41300700001)(86362001)(2906002)(8936002)(5660300002)(4326008)(26005)(6512007)(6916009)(6506007)(8676002)(186003)(66556008)(66476007)(316002)(2616005)(66946007)(478600001)(52116002)(966005)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lTZJjgszyWC/DwwUTraOYfYxqQM7MsWp0ijAv/KIH1AyqR2ij4xk5LWBUXCU?=
 =?us-ascii?Q?VYctOrw5ZsI3Wb/upykiER+Oi1CDQFPACkZatRhKb6WBOU3C8xwZ7bzM6cEp?=
 =?us-ascii?Q?i3tfAN6xm2ECR5ycoor/7Vv2p2z8SrD+LRnIRS3X7UPhW4fa+1BHwsjxoiro?=
 =?us-ascii?Q?ga0g0KCHB//ovofLFZSSjyHyFQtVYAGwXmV29Rd5/WBHrew47prir0kBktZI?=
 =?us-ascii?Q?wb/wL0Gt6gSo4lNHCpoyGN3Uk+6o2yBOrQFmzMk76t76Un6nWsmv+WDF6DTw?=
 =?us-ascii?Q?CWwvMTK5ToOnDLSqEaQD/QxUmgSKW+bJm2WZr0WCSvCMiG126WXk1HfFenA3?=
 =?us-ascii?Q?cA1S5hs2GxM7YhV4gMk2fZj2ALUc4g84TK7z2qBZS4PdrJS8Ee5kFYeaeBe3?=
 =?us-ascii?Q?7s9mteQ+Q7x5znyMtgbUHL1fXB7/SbhyoIijyewrDiAjQCJ8S446ciMEqUVm?=
 =?us-ascii?Q?50hCTSIKJLHPEbs5JXKdC/lxgNDvxmeAJ7nfR5PduEaPPLBaTPAzORqtn646?=
 =?us-ascii?Q?U7Ya/b+DsHWGDGjuTpo4/4cycNuZrt+bz3n69WDjduVyxyeurO7nBfmuwrPu?=
 =?us-ascii?Q?+kw+KkEGCP5QgfLtjNikepSmw96A/q3Scx2n7zDqM7BKQ4yuUWBtDWws0KJh?=
 =?us-ascii?Q?bwwlVbuQSWymCjkTKg/5s9XMOz5m1hQLDS0qqnIeJ9kdg8wQLrH3aTw81L5b?=
 =?us-ascii?Q?dwHrv1Zt5xNQ40fCmpxLZOfeZhn2fDzRb+JgbfWUfSCPkkDwsej/mlXYAss2?=
 =?us-ascii?Q?mGfXYNbBEcgsS5Ei9AHBvfFu36NVRF09PLPzOxVwJ93th2gsFgGrOziU1kyj?=
 =?us-ascii?Q?0nu9enW6eSyacipXAXp9h7FG0MOW9b9hv0Xr8BfL6tdvXtTSjX3ZTLisTwMA?=
 =?us-ascii?Q?XufTgTBa0cpFG6jC6COGd5gTrsWeTZujFp4Vav2B2/AaCfZfpzTSYp2F9hOm?=
 =?us-ascii?Q?HxnCXQZlekjQypxaJIBDpzk0prcI201l+OCYzn82GX4mZM1cMLMQAKAwcaCM?=
 =?us-ascii?Q?HYjF1jlze/OjAhr0C5Oz/djwuRw+ucdHcGNZV8GANEV1zhFKp34mT9Gb2LR5?=
 =?us-ascii?Q?UlAKmn6SpS7n256NbQvZ3XVSceM5enc+AqiMHCtD7JmgcCQ6e4yxTpxsgXGw?=
 =?us-ascii?Q?VNwbHqFvwrm1QdCOygZO7yz1nQdvBduxbcyGsOKDW953AvvealrxsNsKI8Cq?=
 =?us-ascii?Q?SSmjcsh4MB9kDXBzEIvzVwxj8vjobKwzjZtkLbGPYScSSKt9mql1zpcqEi0w?=
 =?us-ascii?Q?ja0An+rxw6yG+DUvYTxeZxmwndm6QQ4y/7FxtNSd6DKim4nJFJLAEd5C6lbb?=
 =?us-ascii?Q?uafP8OUt+UcUrc46crpNbE8yzpbsM78gfNn0XY9s+hiCFG7DnyU/ghQr3xxO?=
 =?us-ascii?Q?2HGDiK4tUEv86jqRXTlBTCIr07kUIpvutQJV/R3WJ4/Yi//0A2x7qdi9FCsn?=
 =?us-ascii?Q?2gv7BbeJmHSN4upBJGBWDOLiUMANlRl8wa5XMiueBCndRlLKsJkgXE96v8ll?=
 =?us-ascii?Q?GYVeQ7jsOZxakyT5jEB0W5ZGe4EqGUG7sOzgLIEFNjxJip8suHnb8dn6LCaU?=
 =?us-ascii?Q?thEUCWj8Crjvu/BHU8V7O2grZ22MTR8Pl5Q5gEdzo+jeOB3lq+Uvg0Nye9u5?=
 =?us-ascii?Q?dfVmdR0ZXNwE8vV0WPOOVSw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e599de87-1304-4299-29e3-08dafdb10857
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:16:41.9971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vu35KpfAi7LIDDVmmtHvQHaojgpTmBPtcuqd9ehydwRGfz76htvzWVb62JZi7hPcedGwH7wGE72UF8TSBXp2AX36tBoiprf8kA/qw6k4etczZU1ZqOUN63qGkvtDMIRr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8812
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

Link: https://lore.kernel.org/all/6f047ec5-4055-761d-c1ea-c2d0b606e53a@linux.intel.com/
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- use pointer for tx_mask/rx_mast to avoid overwrite

 sound/soc/soc-dai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 29a75fdf90e0..69f534f0d4bf 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -267,6 +267,11 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 			     int slots, int slot_width)
 {
 	int ret = -ENOTSUPP;
+	int stream;
+	unsigned int *tdm_mask[] = {
+		&tx_mask,
+		&rx_mask,
+	};
 
 	if (dai->driver->ops &&
 	    dai->driver->ops->xlate_tdm_slot_mask)
@@ -275,8 +280,8 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	else
 		snd_soc_xlate_tdm_slot_mask(slots, &tx_mask, &rx_mask);
 
-	dai->tx_mask = tx_mask;
-	dai->rx_mask = rx_mask;
+	for_each_pcm_streams(stream)
+		snd_soc_dai_tdm_mask_set(dai, stream, *tdm_mask[stream]);
 
 	if (dai->driver->ops &&
 	    dai->driver->ops->set_tdm_slot)
-- 
2.25.1

