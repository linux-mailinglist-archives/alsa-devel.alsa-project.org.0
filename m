Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C1B678DFA
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:09:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68BF7E74;
	Tue, 24 Jan 2023 03:08:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68BF7E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526155;
	bh=5nfnmU6K/b5YpFEaPjMx9URUZy3EreAXlmaLqAWaUkk=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BV0CsveL7fUNvCCLCJwmHeMFQQKgoPqHb7XWsmV+/QY84oWFNgob+i6EXna9xosKC
	 aT+2l2fdYvJgi3N0GJPYLGf0DEjWZEUAcbm0N3ein8ZASAukqalUFBMm87iVigA8wl
	 5Tkakl38u1uABdgg4Ht2EcFTM5fMNmC83iIpa8OQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F02E0F8027D;
	Tue, 24 Jan 2023 03:08:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E247EF80515; Tue, 24 Jan 2023 03:08:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2096.outbound.protection.outlook.com [40.107.113.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E13CF80163
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:07:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E13CF80163
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=L5xlrMEH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVhl3sqEdTJGgyzoqrAJhFV3uWFja7Ztd4lw/tb/hJsCexFCOVHtYuoxaip/hTXqa1TuB7quYLCKaUgqq6cH8IvrWj+XMAT5lYNS3zLeFuFPqXnTkcdgv9gVfpxHWuRg96c/vge3aQY9RVFzzHf1o33YfMHrDpkloejNyUcln7/9Onks+xPt4U7cT9ttPOurtxhdB5YwC0U8GQ/QkE4Y6IxtFxg/fLnGiUZEmX5wejNXi8TQolzReR28a4k95/CK6IRlBO/S4/G9ihafHTp4i80FAJEW1xDtM4FNvv6ut+IcENywqyrjSx2+D1upKXU52lHyG5TOa05gV7ZklkKt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIWlI27zncJI6mrCeGB4mikKky6wwvFOOPrwT+cojGI=;
 b=XKRCC2c8/V+Ag0Lhe0g4IGIjKZHdytuUS9ZZ7dPG/hc5r+F5sGYJGqcocNuD6Du3wowWRf5POCD73XEn/A6cqGSbhdUY0Yi5lydrW8LQ5O63HoZK3gljFkoQffFJZL1p5Q9KL53ncb33jwsJcEsRJxDkUtZSC82qITCDZUhc3xc3CnXJveowFi4+Sgisnuua/NQY/XQ9zHAfPWckZAjD1PwZE5fQUtFBW4qPeZMlhzZFI+hgbAap7k8BB343V10HHz5RvV/t5H8UxwWWVpheA79++ULXUeh3axgtLWXXklJDe0xk31rdiEyH4zQzk5B0yjrZbiYw1acqTU/wNk/+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIWlI27zncJI6mrCeGB4mikKky6wwvFOOPrwT+cojGI=;
 b=L5xlrMEH2hO4ipkSv7jbAWKZhZylWnPi9QBGueHcMAHeddRMtWzG3YSt8fgguN4XXZIZ6je8qbAJiZt50DMHMJJckBVE7Z0BAQe8mXSA0EAjYxyKpYC2w2wEXGiHn8vuVCywsnBhylVCNhWhfi9R9qKu8vIKvg6DblA0oECroVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7701.jpnprd01.prod.outlook.com (2603:1096:400:17a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:07:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:07:46 +0000
Message-ID: <87wn5cu1la.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 01/25] ASoC: soc-dai.h: add missing snd_soc_dai_set_widget()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:07:45 +0000
X-ClientProxiedBy: TYCPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:405:1::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 17af2f33-ccd5-4346-6a54-08dafdafc8ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T51hqsJLMIly618JKhsIYg3MeKmZlSxV9w5j24zWKznynqkwSlRFWRB/Soi9nvVdOmtLLpcsc03kv+i80AEIH3vuV0/WVrCj20PEidYmuflnzwf/7nsl9e6SPH2IFmrRS57xDXGQgLsNIx/2ukkI9FoELAzNw8fa/tmmmtjnEraSUZ7u9d+s1BXNvWZE6yS6PdMzzwN0avEu2mtB40Y6rDIn9v0phn+h3IGlkxbpzl2hos7xKvILkLhWvdrpkbMW0F7GUejsUrXTKm5nTHgkcQaTfqtFIkYhE3c12GKN5XpNF5HLYCGiXp1zWXBpMR/jB7TtGPtH/WXaWNAFbeFFZDKKKA6b64kFItBGWOEK1UciLeAnNd+4AvQ0jkBPoHjngB8AmXdIw8Xmlfs8EGkL3PznwRiNufRG7tB+xGJUEsI+EBrNFOpN5RH8MRF5+7/N03ivbCktrvhMxyFfG2sJkw1ftaOixmUldjs30U3sewftZKGaryDDCqeISSr8dVLXDxLFck7gm3XYkj6VdHgNocHI5PBinlcf42jEXeuM4d1IGNG1YND86fD0FIMfp6cJUXXGScjXLFf534gOVVtL+7wjsmtZMShHO7nt7h8hlzNtc2Cd/De/PllYK7Ecdnxn78VoASQfsDcvZbTKnK8fr0RReprvRuw6Wvs1N2WOiyLb+tGMkenni13WdSzpIhlr1d96FlCEP5Ddrtp4970GuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199015)(8936002)(6916009)(8676002)(4326008)(66556008)(66476007)(66946007)(36756003)(83380400001)(6486002)(478600001)(6506007)(6512007)(26005)(186003)(52116002)(2616005)(86362001)(316002)(5660300002)(2906002)(38100700002)(38350700002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Df9IyGmixPz15+AHy/I2fKHsd9vA+LH7784cisffvQ8KAT9fqe4/AryC3b5w?=
 =?us-ascii?Q?R/lFADE1D+aBL6eJpfOaZgiBYW4h4wYQmAJ8X0bl7fhh0VBYA9Gljq2SUa0M?=
 =?us-ascii?Q?O6v7fnwOYHBLGsbzs1nEIDPfq0YfbDnlrA5aJHUcMqv3LMDW8IDgeC8onZoC?=
 =?us-ascii?Q?EHGk7BeDzcRWbooIZ5lQGSev7Os/lTjJgGDqg3O1FZrcXCB+mVGn6+2p9SDc?=
 =?us-ascii?Q?SemD6pLTiwtXu5NyVMoUZIxuNpV9nO/rJD9XYvmVCYQK8Qh3REi9wnQKSiyw?=
 =?us-ascii?Q?DlPChT4mmUnZTqPeKaGOf8Uc4QtWepVlCyRacix8wRgGRrE/1xUP6wxLWFTg?=
 =?us-ascii?Q?/KTfXYiMDSuXyQgmICObROsnHBcQ1z7y3PbTBi6TaAP1hyvOGNmmjL7Mg5JL?=
 =?us-ascii?Q?mhuMsD9eGh1zkDiXmMqmNUlEjf0hGUxmduVfqJ9fpLZTd/bBCqNFs/KcdztS?=
 =?us-ascii?Q?LVReQSHJB1jq0yNp1TxRjLnO9gvXwhn1Dk7RF+jh00zoIW4JBacV5CBLqHXM?=
 =?us-ascii?Q?XQZVkI8J/+sYiGUZXp6R+Y/kNqXWpa2Ywo7zQm+/qsFVtUSx3kVLefP2FEX+?=
 =?us-ascii?Q?/RdF/vIihEcllwVXrrC8qBOCinegLDvIdSWNqj62Y0vD8S7iqMBh66c1D+Cg?=
 =?us-ascii?Q?olyP7gTZT5Nq08DyCL7tz23dTpv2VIbftMxq5aAl9F+aaN/u3zKwat0F0F3S?=
 =?us-ascii?Q?742hXHGYBtt5ClfRXJ0uW/00+VdSpTCM3dbN85mqeQNGWVis4hBu6Vd2c+J9?=
 =?us-ascii?Q?i60wJWXPWJjPQnuK25HlCHueEGBwiuiOXtvQUYSzt743b9s72s33N67ZC4JR?=
 =?us-ascii?Q?Na60htLXkavYFBN6Lw6sZ+Hn8UDC/n93fjW1LjQzgWoeM+HJD/bYUllzEP1r?=
 =?us-ascii?Q?qVIAgaAgYqZk6PcPp8q8Pe49S3m0NJtjOAjjdr7TnFM7busG04KsJcZe8VWX?=
 =?us-ascii?Q?pe62JMH/7rlUBfiQEMfEkEAuwa42MHHGfPJax+nbY25myOvYWkFJD+aQxvjs?=
 =?us-ascii?Q?C7UbPYbdUY01aZg9MIhduI0ZLihyGsO95tl1PiXZUmoCN6SeK0FCM4mfT99p?=
 =?us-ascii?Q?oBd5CJjPr6MFJm40xCpjQwD/E3x0lqy5NlMN8RYV9OgXdzKcNlSAYb1qhr1X?=
 =?us-ascii?Q?iTPLOwvZrZzGt2A+P6v2eEDLorW7qc9Fk2pga1JuNNFjfSJtCx/6H9ri1DoD?=
 =?us-ascii?Q?jhqaSNhjFo7cq1tIA6Q1dUIbS4oOPE3wzzOtpeBtXV68J8lmjESt4MmNzJ4w?=
 =?us-ascii?Q?+welZQaKzZf83e2mq90VpKlBXEDhMLeSthWzmlW3juLwlkFqcE14AInyEOt1?=
 =?us-ascii?Q?WAEiKTWHiwRj/0tWm3OmReIPBTRD8qipQZRXRgxXBm48VFNVh5UDZGQ7LV4Z?=
 =?us-ascii?Q?wN9ePZHZpvMJb4IVon144ituKNV38PjPHKs58K0cerZMR9KJdDLB3sNbpjW1?=
 =?us-ascii?Q?u5EDb5Yl5BjK003FqUmSDOEniJ55BP3UDzZObCceOipaGokIh72HkJBnX+WD?=
 =?us-ascii?Q?LmAwHjXwWOtCoZTqkGaJviPUTAxrk8f6JlYKmCwFs8u4GCLoWis0MAuOcbhC?=
 =?us-ascii?Q?7pNdjJr4dePSuFFP+ORKFvJ+X6q9x8F8teG416IiQhSfpVmXPGNsitJyTt5L?=
 =?us-ascii?Q?Nn/BsOQK6rFhJroo5jl5aIQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17af2f33-ccd5-4346-6a54-08dafdafc8ff
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:07:46.1364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNitGNh433Hdkcyp2hSG6Ykj3SIIjpdxBotkXnDkBdyawzxiOUCjHFO58Nf25xnFTWPX134rwjo/Uf8Mwnu/kHXXzV37knzoxhNK7z7n6KqI40LyfJ++GuKnlvqZ7g1F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7701
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

Current ASoC has snd_soc_dai_get_widget() (= _get_) but doesn't
have _set_ function. This patch adds it.

This patch also cleanup unnecessary line break for  _get_ function.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dai.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index ea7509672086..ea704d92deaa 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -478,13 +478,21 @@ snd_soc_dai_get_pcm_stream(const struct snd_soc_dai *dai, int stream)
 }
 
 static inline
-struct snd_soc_dapm_widget *snd_soc_dai_get_widget(
-	struct snd_soc_dai *dai, int stream)
+struct snd_soc_dapm_widget *snd_soc_dai_get_widget(struct snd_soc_dai *dai, int stream)
 {
 	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
 		dai->playback_widget : dai->capture_widget;
 }
 
+static inline
+void snd_soc_dai_set_widget(struct snd_soc_dai *dai, int stream, struct snd_soc_dapm_widget *widget)
+{
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		dai->playback_widget = widget;
+	else
+		dai->capture_widget  = widget;
+}
+
 static inline void *snd_soc_dai_get_dma_data(const struct snd_soc_dai *dai,
 					     const struct snd_pcm_substream *ss)
 {
-- 
2.25.1

