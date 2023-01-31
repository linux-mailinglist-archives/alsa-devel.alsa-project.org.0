Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C05A6821BC
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:00:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0494EEAF;
	Tue, 31 Jan 2023 02:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0494EEAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130447;
	bh=xoEM967RBCE84rKL8tV+Es7AoOK9qkJIpDJOa31ep7g=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=igrLE01bF6NJpkvcG4uIs9mOtXEm4x6/6zDn/X5oXLmOeDJPhWw0/iVIWxi8SjXn0
	 aj/a98kUVA0MMm2DAvnulu5D2pLqjaKrPDhfhBieTAvX8i5l6FbMwUPlC11vdNcqER
	 Htqyi9A3kYhlibPgwY2Vy2BFgjws86WMJiUaMvGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41930F80557;
	Tue, 31 Jan 2023 02:59:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23467F80553; Tue, 31 Jan 2023 02:59:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::70d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 224CCF80155
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 02:59:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 224CCF80155
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Dhs+DX40
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FM0PH9h+ERK2oCPd+n3xnnt90lD/j9zrq4qJyINCxjL+i+fOYsLVtPKYvUcrWN1mXqExvJsxphCtZTKOG0mo00B5UQRP+PFjvLkRnkRo6zglNNU7Frlyqfw4EcQj/dHEPKOMNrNh3kYhdx30imPr/eq1G8OqW+idhT2yZKu6/g9vqLJcYnDK2iog1QZFMJbeiw82g0bObpJOCDj1mC95gZ/mEHPd4JcmSA1jkuvJTZPCLVesB3g1Y5z1Tyi4RtKsxoQGM9z3fJI6KQKewnkJb0dhXKB++2qBpD0st+dLWZ4n3L9YOCW1xPg4BOpSF4xCfnvYqYjN87TfAQg0K8Q3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08SmPlzFDGfNDbwuhDOrffmpY/DKoELMkOYgxQ6SQcw=;
 b=MFAi/b8mFZ75m7Q9MzCZxk7F3SE1lQhHA0UG8C4U+TsdSgdUKbcJ+pZqGEEdRgMnF/gBSPlGAPv5GNOLndgFVu+kFGj61lOqq1rd2Q3aAAn6HMpHf6msOdAwj4H8XGhpHd3Y795aYAGOyHAIMy/4PiX4tntkOwN7qfq0wImEzaAqXYBMZBYzBZzNpHk2Q58xBngOvJ8c/8UAfgYRGxzbNM4eIUyLjt3j1POZA5FHsA3d/cjL8JpEIZirJ3QjKK22AuABuCuFe/2k7m6PByr7jimgtdXuu/EvonhYYGTr70cHG71k8k7YEh+ax92E0b1lOrNr6gH+Spg0nvcYPs5n1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08SmPlzFDGfNDbwuhDOrffmpY/DKoELMkOYgxQ6SQcw=;
 b=Dhs+DX40DsmWgdmUSW7CC5CBr91Aek7jx300TkVHZ4EYNNwQVwIk1pk2/PR7ewcKGUb5LB3h1Srw0P7Vb3pxWLWNPFS23U3PXKZp1fAKyU43+R5D9EVdJjJ6nASNX4Vx1O4jxSsVh4SSpm4CuZhes+XhK/8jAHTe8AxOVTxXzdY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB9980.jpnprd01.prod.outlook.com (2603:1096:400:1aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 01:59:07 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 01:59:07 +0000
Message-ID: <878rhjfor8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 03/25] ASoC: soc-dai.h: add snd_soc_dai_tdm_mask_set/get()
 helper
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 01:59:07 +0000
X-ClientProxiedBy: TYCPR01CA0095.jpnprd01.prod.outlook.com
 (2603:1096:405:3::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB9980:EE_
X-MS-Office365-Filtering-Correlation-Id: e239f901-bd9a-4b17-3de5-08db032ebcda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fNvO8bnvT4mLOT6RlS+VWQXvMhcBbjxRYXUH2Qu2lKeNyl7kS+NTwMbHHX5fGiKV0kt61TEiXsoQaWxAMrMVWiKaEG85XpeCUztYguWkTIY/vBfgTkfBxRmEM1zVfDmdsfjLGmUIn7K2nK1MixCcIh+/RqY1+ZuDNbP2VJPZr2zpyTQVw+wTP15Zq20dP+BO4ERCzsGgWyViZZSb5C/tjJmlGcSolknIeBZd9NOlSzgAc1K6gXI07ok3o9lhFEg0cXVLSvEAlo3KRSxsa1cafydpRoeW0WaJupXXPtFJ6AQXrunBKUwVuCeOvnCgykuVsBOrcNaNpSVH/xXMKB0CGpn4Z0j4AJPK+yCl/WokTyx1lQh7JdFphOLeTyoW9IwfNpiXJKSPfsL/WdMEtfO2PaI0y8P0/fPnPXeYjPq2nM9Yx4bRxAj8ATIWBR8jSDnQdh3XZscm3R+EAMiCIJ/cHk/z2OHW0DSybgchO0GVE886kbqNK1+QNa1spdEi7c3s41QeMB3f42ROhEZNQzFTZFOk8eCLdu6DYMSJitB43oVzjhZOcmAv2imrKUvxovEIBN6MMhGsX8lx7E5MIKYoXRcEd8DT62Lb6l9QLRI+JDTTMv5eEfvlmZGtC8CptuKiZNcMfuVdhZALKnvk4AJhzOoS4uP9FqyCHOreYXl8F55HvHfvWeTOCs8cAtKWbAXI4IwXZsnI7rHYrD1XM1CucA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199018)(66476007)(8676002)(66946007)(66556008)(4326008)(41300700001)(6916009)(8936002)(316002)(2906002)(5660300002)(6486002)(478600001)(52116002)(186003)(6506007)(26005)(6512007)(2616005)(83380400001)(36756003)(38100700002)(38350700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6upoZ7Anu2MCiqr2hUrQZCLCqpBRt0pt0AaCl81c93N9tU/UrZgTzyGWok4P?=
 =?us-ascii?Q?V5R8pEneUvaCWpOksNkJMhcBSIZBE7qDDeCJIsJqU7I1fsY1GTVe1pI8FEpA?=
 =?us-ascii?Q?1qp45qnpYCTFdyQPwNezpZFAKQf90fgIaZaZX2giMM6WigCGoLxKgK0nysn/?=
 =?us-ascii?Q?R557KgciBjJvxkYzZlhpfLakwk/hjtiqlgEa+4C5Bs0jvM6V66hHLVLHo7l/?=
 =?us-ascii?Q?2vz+8aEikMvDtYRkZOO8Chl/eHjDRZl5X0oPHwRPq9Bjf20ujEfWc3B6NYZf?=
 =?us-ascii?Q?PudVLtZouCYeL9XZHuX9lxiKx6j/8OKZ0ELXTPjLjHZQFcaqZnBYpYgiDXKD?=
 =?us-ascii?Q?F9qFBa0BWBJ9pNDUYaFoP3+t9YKmG579aOC1Xs0I+bpa6YPaQJIU895o8lpr?=
 =?us-ascii?Q?7DPyNsPZo0vYtyYoYxMyL2pEyfUHVt4gMW+3WNuuwDFpfnSKpIS4RGHqedIW?=
 =?us-ascii?Q?xfp8muhUVDI0oL8/N5nt2ZUZxsluIqwU1S+8NjEIJ/Q+Xladue4ICH8EZsbw?=
 =?us-ascii?Q?UebBAXHYML0SVCDNzE+8SOSBWTheT+zeTWzMCq5tKvhljAHlX0uQpXa7QfkD?=
 =?us-ascii?Q?1/c9e98Io/kTpyABQs3mjZVR2PcByLG8ILBMZNOjwPU2mc9YEuegTH8Uui+b?=
 =?us-ascii?Q?oKoYa84jQMhNlZdm7kKKjGAxNyrs0ZSJSYxWBhOMeDzTc8IqL0fTwx41/9TO?=
 =?us-ascii?Q?09k2V95UWY1YnkKiyBT5b5C1k+jECGteuOVT5O9wnhRQ2ZUAV9eXKVgSW+sC?=
 =?us-ascii?Q?IqOlVbjostJki8AlP7BfhbemMJm6l14ekXov4KGj/fWEWOuNbi6ABFSgIcwH?=
 =?us-ascii?Q?6XXR+k4qQNzwaG8Qv+UnhkOiqJOXMi6+zMela8E8yPBNnBs57Cf+sT9GeWfW?=
 =?us-ascii?Q?nEU36J7/1MbtNmSWaM1/Ru2dpR+x+furlzzdo4b22Ugc2/ZVRs8lniMXkyx1?=
 =?us-ascii?Q?GiQMaeZbaBvEAYrf0iATSvsBpP13YI4DikXS35c5ytZTMFUdvMYtJe86GRns?=
 =?us-ascii?Q?XHuAUSQgIUOXuv/hSIGEAkpg3Xt8ah87KeY73janNO8RQ0yYjB6mmVYqg/R1?=
 =?us-ascii?Q?AOXG3GjvH6aj9IdgxO6oJxeqpb/gNpPe1S5q69gjJd9BD48wpK7792H39ofN?=
 =?us-ascii?Q?MKSf1KvVRiEc8N+8nDi2PQTvy/qkXImXXVVuh6Z5B0nEtGVsId8Sh+3Ti2U5?=
 =?us-ascii?Q?oLKz/B+OJJWVHx0p6L/KgoRcxYWKdq9PtqtKdmK4D5I13XtCnouL8Y8kqj6K?=
 =?us-ascii?Q?OeGlj6LR6UxbmrXckb9tcH+KbM8f5F+Fk9BAw4ujwTCL6mc8G1iC/bYdv1eA?=
 =?us-ascii?Q?YQvLWxlzsgQmXMTQg072TBtV1KENB1nTI8byWh6uyPyLa998lLMcv8Emajg1?=
 =?us-ascii?Q?6Y40dWcPuz8z0FNU8hPkZ4YKerWpLG4iUW9qf2LhnBvt9mlS3o9QWIxnT6S7?=
 =?us-ascii?Q?La85k6VzObYRf5/EjvqPEVmEA0gVUNk1+G6hQhihPFmZnafrrHDI+EMxgJeY?=
 =?us-ascii?Q?q2H007AGZdbWh4049vYfD+10jutukq2ST+StN7HzrJA/HJiC8ryrE44RoG+D?=
 =?us-ascii?Q?cxAmO1o0gOlbOjWgvpEb/ihFc2mjDc8JwMLcAMcr5Gl0XCXUQz/nbKsfPCS0?=
 =?us-ascii?Q?WEnsQp9iBZD9rdjlbxPuT8g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e239f901-bd9a-4b17-3de5-08db032ebcda
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 01:59:07.5948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pq4qWNyZoNow0xgOgeWdOd9yWPlh4LeZNOedyoNdQDQol4nBH/EauxfnPVfnFXPk1htI/gOrr7F/Qio/LkLSn9ycUiNOjee9+DTnoKEbss885e4+ysSR7DWEjv0jVmjY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9980
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

Current ASoC has tx/rx_mask, and is directly accessing to them,
but accessing to it via function is nice idea.
This patch adds snd_soc_dai_tdm_mask_set/get() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dai.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index f27b33dd97bd..9b18e230e5b3 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -520,6 +520,23 @@ static inline void snd_soc_dai_init_dma_data(struct snd_soc_dai *dai,
 	dai->capture_dma_data = capture;
 }
 
+static inline unsigned int snd_soc_dai_tdm_mask_get(struct snd_soc_dai *dai, int stream)
+{
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		return dai->tx_mask;
+	else
+		return dai->rx_mask;
+}
+
+static inline void snd_soc_dai_tdm_mask_set(struct snd_soc_dai *dai, int stream,
+					    unsigned int tdm_mask)
+{
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		dai->tx_mask = tdm_mask;
+	else
+		dai->rx_mask = tdm_mask;
+}
+
 static inline void snd_soc_dai_set_drvdata(struct snd_soc_dai *dai,
 		void *data)
 {
-- 
2.25.1

