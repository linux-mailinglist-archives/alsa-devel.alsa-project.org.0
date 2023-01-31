Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FD16821C5
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:01:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1474FE82;
	Tue, 31 Jan 2023 03:01:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1474FE82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130511;
	bh=CTcchOkvpob68bMHwkywSzJcRpjmweYX7cPtxyy04Ak=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cQsJKCcq/XTlS9urYAi77ZBruD6CRCIUcdcQzEWNVZMjfBvILdN6XY7pnZMCCuoH5
	 tmNPsr5tk8967LdJljpfFZl/A/ZQ5R/fuPuj0fV1xU43aonGHGFt2zAMNvukxV3WFI
	 t3cpnHUGMJ++DJVBws9evlqdGtBojGuf7vLO7WgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42240F80544;
	Tue, 31 Jan 2023 03:00:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1885F80548; Tue, 31 Jan 2023 02:59:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::728])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1AC4F80543
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 02:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1AC4F80543
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=V5ajfj7C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCFD1D0q0pT2f1gmUlBUVAiyHhDFiq7HqcmQFGYe+TBrKvcaKM86EGY96xiqOcb0o25hvvX+FeDpYSngtF6LUeCHvjfN+hoi8wKUsXSPfq4yEZkXdeNAxf4Vpmwc60cm3jtUHT5O6OQ5W7X5OlBhswBM6Da8mYWBpfZ1SgcSPoWke4D2IQsUGM85Xr0FR/MH/nx4J+2QT6M3VdA1Sh7nDBOApV35AT9cZDGCGyvM7y9raOoZELxqKy9TcmmNW5LzokgDuYXcJcyZnsB2ocjgaDDVzcQeRAJ/uvD656GM1M/nvnp17ql55U+pa6pLcEhqzJPZ4ozZCdNcwJSQ6zEkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+u9hi1nudyRG7wjvm7iVKYDkzLz1mf/5KMJrRb66Lyw=;
 b=QT3yXXjg/rSnD+W35Gl3R+pBA4p93hTlQ7QYQlsD43bvx+/xZ5p+TVBShrZN3WJ/fV3cAWK8ymkrDavVjJ6IfbbKphwzxIKYLPKS5DPDNbag3BUo3XCeAVX0ntor3EqevATEKBAOfciu0Al22IEBLznHeTjsTrY/Zyr5Zbz/imp3fWTnZMd/N1+2fRvqzhIhVUBNq3nveomm/FGIipq1L4XL9Yq4WbP/XHMKvt7mZbPBMNx5zY+tTquL1E6JpRifPX8D0d2fbn6IxbhHLGZJPCzKmTZdPIPtIr6ik3OKbQibfXGd5Q3Zcr4opKbzX9c0NOYoF6nrEGw1Pv/WdsO4bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+u9hi1nudyRG7wjvm7iVKYDkzLz1mf/5KMJrRb66Lyw=;
 b=V5ajfj7Cc4QjZkv6oOv83fKkiObbavNIYDWO4SN9rgtjjYA9fmqprvPjYbPbKK7huddsJ9pPXdcw0YFGiMFRVSF3oGw5NFcfjI/2IPnAemNINxuUXDGPiR+LLJQpZXC9UEkTf75Do7GCvtkKDKNHR1v78HO4Nl9+2mYaCpip6iM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8196.jpnprd01.prod.outlook.com (2603:1096:604:176::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 01:59:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 01:59:50 +0000
Message-ID: <87357rfoq1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 07/25] ASoC: hda: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 01:59:50 +0000
X-ClientProxiedBy: TYBP286CA0038.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::26) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b5f02e-484f-4ab0-0af6-08db032ed6aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ebrWvtaV9YRx78brWC+FCL1VEhgGPSNaZ8cWfEl+2lgHN3Rj2/R6mmJ9pmY0hJDLEqXNOOmQHmxCISk8nmMhzeTlnXCgPlBMyow4Q/0qcmWlCvRx8Bh7J6eOL2liBS4SmTeE1A3G8lowwKhoe2zQBaa1cLk8pqI1RzYJwNYgGa9lJXBvEwlHHK1MkzaWaQy+vKMG/cY50v1JofSnssGuyp6fMuYs3XBVPKOUggk+wDYLFT1N7U06jeUhjppxWcCTJiWXipwLMIQSQOL/48qZdcRgJioFy99qRQjks0T7MrhVlPEV6i071RxRwm6v9dMV6tW001HdRID91b1uWuj5ga7APGkIrR0Ym7wjVxIEBQilWRpCDxe8WW5C0VEV+Ic7G7gOfHasEEia+EyCkkpXMaJlPCcl3VvsdaswljOf61t3cR7tk4QYSRDVz3Qkd6ELAde8prfZuAR37ESzFD8Ht4UgiAMWoLpPF8UQ1ux5Z6BMSe/ozi0o6PN9zhhJ47iS1u6c4p7/QX77GuB/1oZhbt2nmT5kFhfeltlNE/9VUb5gnl2uyy6sk63aGxmj2riXYwQxMnFYyg7hagSKVrg2evyYU1wvu0ZEyWigcCOF89dqPKQQUGxRY1YsDvy1PmoU4CGrPoJ5Nq6/yLeZOE+J+ve7f+07FGQa9ygNxaMTo1G1jIwZP32SiOupG89ldM+dENvk4wl3DFKX1IfNGnWHEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199018)(8936002)(2906002)(6916009)(38100700002)(4326008)(38350700002)(36756003)(478600001)(5660300002)(4744005)(186003)(6486002)(6506007)(52116002)(26005)(6512007)(2616005)(86362001)(41300700001)(83380400001)(66556008)(8676002)(66946007)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FnOIJUmU/dexSB+PrESbGBTTDKTpe2IlJKFQDs2LxfCl3raMNG8Eshh/2oKn?=
 =?us-ascii?Q?FemRMje5nbd3A9W7eHbrUhkzyBV7C8P0gQdfnnsM0xKnwhCJltwixp8GAtPa?=
 =?us-ascii?Q?Lls+w8utzMK7nGXx4czQindtifK+ZB8u4d8qYW3BZAEVCbaqAM7D+UG4XbfB?=
 =?us-ascii?Q?tnGWt/l8w5ZMYB/BTNwHakM3flQ9CMR14sl44J4hjBHz3B14jEbnP8A8GE/6?=
 =?us-ascii?Q?xMkLNEi/IRW8+lRpF4kz1D8C3Co/cpiHqAYlydsd5mXOhd1FmICm1xQphIO9?=
 =?us-ascii?Q?iJ56sFc0WGtf0J2deqHZXJTu2z8zqSj/ereyHXHrKSSxlnbLafVAdA3xgMWC?=
 =?us-ascii?Q?FCNHr7XBhAeu/OnOW54HUKQ2mtYc7+Qd+ZtgKjhqDCAFvzelidfPydrPus9g?=
 =?us-ascii?Q?7mQCdtMblAMwN39wBmewfmOL0Z7I1Fs1n4wuwXxjymtQJW+XNljQLhlDVPuG?=
 =?us-ascii?Q?CQ3so4JJCzYlsV2vuwdHNiTjxWP0QbwFTyZqyhOkzAJEb9S/Hpb2/fJdeT9m?=
 =?us-ascii?Q?cPCvAfxqYPd1jaDHLxISJe7tbJkkiIQOC0B1ZoNqNMocKGdwvOhyY5xdEJ4L?=
 =?us-ascii?Q?8HVk1kIfNPomytaWzy+bSqJxCvw+tZMkDU3OP2p/PTKD2fwTxq0lNXgU786E?=
 =?us-ascii?Q?N97MN5gTOt8OauQbtXu3rddtilDcvI5WhRDO476ILfBpOI1DzwIiTuZ/Nmzl?=
 =?us-ascii?Q?+wB0weti4MUv5E9pO5ylsZ86PEvsBzlUJGbEwvKq238g9yZSWF6SSPUFTqaD?=
 =?us-ascii?Q?OkfjYFVjjhjzVWAMNAEqkUBG2+x1rWO7+trMvTBJX0Gk2tPyv4YJ0PKyhepz?=
 =?us-ascii?Q?1ej5LS/6l23SrCT+Kjc/hR3c3ePn0GsFLsNQi4lUTnLebSnZNyrrhZDSP6ZG?=
 =?us-ascii?Q?L6QnO+xMhKf7PAKRv8+IBztONcrnHwzf6WohYwzR6AZiuWaikaWEtkYzgrmh?=
 =?us-ascii?Q?8xARsXXOmas0UYPctdYI2ukjM203TA2f+Soi9rXEu+XHIjtiY4RWacdir38v?=
 =?us-ascii?Q?pTKWkpaPvj29CzaWOOM9oi7B0WTInWaa6jw3J2phsqqZT3sPw2xrXUGnYPJu?=
 =?us-ascii?Q?Sf+RTHxqen33M4pu9f6qNnLxBOAUuYs897USpeueKsi7LYYzvYyeArVQsZdg?=
 =?us-ascii?Q?v1dvkE47uMMZZMQ+PGu1eQGw0gqsKSVKZbIm7LrwA5WHYgQN3aInJcf5svqA?=
 =?us-ascii?Q?60sePtH+Tfl/UHjnCtoscdLt4O9N8hg1OLyfFu+D1tMmpBFHiuHW3MW5ICHj?=
 =?us-ascii?Q?jA3rhRzdmd7zdixuVbNzfYZL0nqurfLioJxc5322uPxrkkPVtEZWt9L9M1tt?=
 =?us-ascii?Q?0mkaeDtIrLieIuazAolQ2xbfCO5S9eAGOocDZMXvexkt17FbswseuD8p7nPf?=
 =?us-ascii?Q?ViTAyaNO27SVsqfdgoSKEYiKBm3+s/CFt/jb3Ep+JLMZV/uHzVMfXFqGUoKl?=
 =?us-ascii?Q?xGw+KlzI8VQy/e7S/2g1rB32SjQI+LOaQOEVv/Med6rWkJSj2WIc14e33zQo?=
 =?us-ascii?Q?xivxcLN3038L1stsLCNfc99annXvDY08s1rHpbdHhf2SLIVJZdLdxWpK7bYG?=
 =?us-ascii?Q?LkFFdS5Mptuz7MA+607IkGSBujhz+VExvGidmKdNXrUfF5Wacsh1MRsRE3Yj?=
 =?us-ascii?Q?MqVYhyek8mHyAZbX/Muneq8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b5f02e-484f-4ab0-0af6-08db032ed6aa
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 01:59:50.8685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xTdKseWmKNqUReQkr82IdTq8GYLZ0B0xbIa3kbVscfNHh3FE5KfGCN6PGRuAlQt+A9dmvLpC+o5ByS4nNdwXoMPx66hb8asivgIHX0mJ0nFBMuFrIG7GlKE63KOeu9u
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
 sound/soc/codecs/hda.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index 4b8ec6f77337..d57b043d6bfe 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -126,12 +126,15 @@ static void hda_codec_unregister_dais(struct hda_codec *codec,
 	struct hda_pcm *pcm;
 
 	for_each_component_dais_safe(component, dai, save) {
+		int stream;
+
 		list_for_each_entry(pcm, &codec->pcm_list_head, list) {
 			if (strcmp(dai->driver->name, pcm->name))
 				continue;
 
-			snd_soc_dapm_free_widget(dai->playback_widget);
-			snd_soc_dapm_free_widget(dai->capture_widget);
+			for_each_pcm_streams(stream)
+				snd_soc_dapm_free_widget(snd_soc_dai_get_widget(dai, stream));
+
 			snd_soc_unregister_dai(dai);
 			break;
 		}
-- 
2.25.1

