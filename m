Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2942079B1DA
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:57:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7859A4C;
	Tue, 12 Sep 2023 01:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7859A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476653;
	bh=K9HVINj9qtireJtZAYXhIliKuDLo/mia7qPDv0rCizA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vn9vz5n2gj06xxBbq5ovLXMBI4ovNkJ1QwX96SGm3/RCx+2xNloFAioDSIS7HT8aF
	 jh6zg3tzuPRYsv/DMshu/FcUTYhsw8C8KCBSK0gGsRtivgHw7/m6pUAwwn6fqsCaMq
	 28+DofeK6XvS/wYyPYdZwjT1cIjsILzVt9fKlszE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C24E5F80588; Tue, 12 Sep 2023 01:52:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25BC4F806B0;
	Tue, 12 Sep 2023 01:52:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C552EF805B5; Tue, 12 Sep 2023 01:51:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50B42F805E2
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50B42F805E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LtG/Mjtg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H57ekPA8pNr1uKqO7bzvFecUwHyuWlChm2RciKaklCeO8RkkmnY/k+MmgC55iDYHTyp2wc+/a+DNLyyEQ3ZSdZ197l7DWWr1lWrncm81nmkwM+C9EhmxztfsTIFjTl/2/QlQs1gAY96fep96ix56ox0tiBpFwsMfPoxfwko9vn1isNZuOqnUNGKtQ3CQPVinUwDEgB1OfzzzWUhgF4l0Jj0YlUhctk9Cn4UIGrMYXOp20nHctISwLNCbue/YRkDgOm9L58a8M/iPDATf37ZheahF2+K1zFXxu7yyGkimS9a14bc3FfWpU+9AgT14XNqs7lXDpkOh9voLoYx/q8ihqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usjQUAfXXm8oNSm9ZiuRMclPM4F7X2CfksDEKIG/w7w=;
 b=BFVhx+LhHpe04o5nYgQua2EkCyByJ9rRnrrh59++mtb2FSQimG1ovCVc9yIMpbAAl1HkOjq2RdVEbWrTPjQ9Xf2UYCkltBMi90u+I6p64nVbdQHQkwZEC8SP2dGXfnHRZ2YzuoBeBcqufWMnUMsYd4+TlN3oEtlCLR1AjPDAGlir96ZF3DUzNlOqA53Rw8kwqy325/VSqoLGjN5ihoOYyOnbQnRBOLGDPYZK71r2PQ30xScyHS0UlCw05IM1JaRoFrZEvQDMENjW59rid+NbUT6FX5wCaB77nTxuCBGzongf1a0q1JGUlYLXcUptGsjtCSgd+JbQhiw7FulVum7trg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usjQUAfXXm8oNSm9ZiuRMclPM4F7X2CfksDEKIG/w7w=;
 b=LtG/MjtgMORZhdLjQEx2HDUNX9BbNYfLYwsu1KYQsKwW9bplUbVubeRyquckYE6wAdku9i01TEC+EmuS3k0K5+Ir1TCdrnJwawEUzZIh5+DOqh+UHBcUSGeGzbOu1RpNlJnS9cSzy8cYhep2+ytQjqASPTTTsIEx1iP73UVhiPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:50:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:50:19 +0000
Message-ID: <877cowqngl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Walker Chen <walker.chen@starfivetech.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 32/54] ASoC: starfive: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:50:19 +0000
X-ClientProxiedBy: TYCP286CA0133.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 40284446-563a-4a12-1a86-08dbb321db16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ESn5DKbcaLWZqHOUyRkmlp200JJy8NsMqL+E5B6d3llXuGB0bIitZ0lOF2GbVxxD9c9NsHzjhTex3dfLaPqNHXDP+d94KrgwtXy5cr22NqQLgiCrmt2ss5V+gy3zEfCMEKbuoDb3qGqo8JtYw/44S919kbAiSIvZw0i6cDsXDXvf4oSL93r9rUYy0cw3hBIzSru4e3AUW4XjxQN3IOrni611j8vtes6c4CdbI6feSit4PlXmiMGYibmobVJmBMBtKPvfAJjS+VdkOhXQ3ym6LVh8U2CCQG3t7GHN0yu1GF3mC9NRlZhoPIR7c+wTEDDqKQfRYlTQEdxzrVt8lturHKTPs42ayEfWrn3b7iKpxPdeixgvl8HZXq4b0XQxgjZKt7Sio6kzNlWHEOERwATD4rE6b72Alr93/BKQStZe4YH+PpvGeD6gwOMN/p9yQgm9BNMq7pi3K1sZ1viRywc7xG/PeiWyqyAPXbkyhI6CfcDF5FEo4Q53X9B4xSHRZjS1NuBo/4zkB+anpMSy9+maM90VinaPuplL4M7kRvO2Z/2o9YLVq4srfc+eX+ivWmFHvWLPi+4FX/L/bC6J069RxOU12lP7PqiIYLutcaVSLHpg0K4v6lv8SM6FKTqRypzwpakJD9WUt7Z8QTFkeqNekw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(66476007)(66946007)(8936002)(4326008)(8676002)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(2906002)(4744005)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z6yDQfmrqaEPYBPXMOsLIGC+58GZq0Uxq5gzCkN81JA1xPYFcw8nsO1dvsiE?=
 =?us-ascii?Q?DTmgTdhTCqX+6Iefv2ErjYa4QvjOuYgWhIZal3OW7h+RGfzmBO2ouc8Vh5J1?=
 =?us-ascii?Q?28qrKo7SG4VLvbVxYUlxTIEpfdz+hhx/3Y6e7lu8qz+w8ZUwJGWWxEz7a22S?=
 =?us-ascii?Q?LSNrYI4wN3AxJZzvXJhjnhtUnN7/20Y47l/jma/1yV0IIi3IwqfNlhYbB9Tj?=
 =?us-ascii?Q?WrG4iKkU25svVMpr3k+IfAAperpiNaWh6is5bAHx1cGy1KGV3VTSjm2fsKSd?=
 =?us-ascii?Q?2/MDOhkodQwUhduN5dQakSEl5RYPYUgyhEP+vYf7vr+O9qWZmANklbpI1p8L?=
 =?us-ascii?Q?NEGXcwDMmkiMrlBd3hkQQi0UE32Jp0wtBLvIbfKbc2q0w3y8OtkKLBoHeBHq?=
 =?us-ascii?Q?u37KV2VMyqtFzxUVnMf1pfHmIBJGlXTF7SBZPDZ6IZaqOVphh+oRpdz8f+zn?=
 =?us-ascii?Q?1RuBTzkfRKA8Oa4nYWN5Q0PhsRexjfu8VrSkLLMaOPqggrKU581yEPJ85kb3?=
 =?us-ascii?Q?mCNyHjuLWizm4xg0voUebs/C+AyZcXoyOMsQTFUVbSdqNybZ/8gxdhtj4o+u?=
 =?us-ascii?Q?pTI3PIorcqLrtMQuy23XqYnIkwqbP91hZSNcCHZZ9cax4VerfzgGoH35CUl3?=
 =?us-ascii?Q?sBhXf0pz4xS7H+ICt5oTAhWB0TPB76PkQrchugBWssygHRLB131VWQOOw2aK?=
 =?us-ascii?Q?Ik62yHkrzu5dPykxbd8jCiEogHg4GzePwFYc06ZmaILpN6NXXmIpPInqMUNl?=
 =?us-ascii?Q?7x0YA5TDua9Mn2Cx4utPwmc9A9VeIZXJsTbN1E6cxdSmu/RBPgREAoWRdRy0?=
 =?us-ascii?Q?Gst11ss5bF7pth+fesdq5YR2k/dgiAVx3evBNtbledIAh7fwTy/4TbEWm7fi?=
 =?us-ascii?Q?2LRpU/ZRPB2XF7N9hStu0uzErGnaqranaFwNHi4us2u23Gv/j0ovQtvzu7G1?=
 =?us-ascii?Q?T0JNoOhLI0CEZunDbZ0dMguLYfL99cRcaG/9wDovpn/ji0SuVqpgXc2GhKY/?=
 =?us-ascii?Q?7x058XxoAfA6udxkNyAN/EYimZDSKZbY2fsf3quRVmMByxLHcCGAl06gqafX?=
 =?us-ascii?Q?VchDGbQemKRn9WhDWrlir5UsT4zIeyX+ZbmL5giAGshDSITJUkcQxyH6UtHz?=
 =?us-ascii?Q?sJC9huA8PD1LWyl3jW4aWfEzfCWx+PF1fzSRmAIOkVnNYSEYoXo85DqTrCNF?=
 =?us-ascii?Q?86QY5vfl5W5N8LFF0YarCK6wsspL4ih67mKb+GMt3kyfsSynPkzN29fsW5Yd?=
 =?us-ascii?Q?FYYgAIGIaTIgHjdlTHP6/9bqvcln21tfQGnFNTwEcWAks8UXj9vsYj0AA9O4?=
 =?us-ascii?Q?9aUQ4krrLRXFNDsoPIwgHF4wIZnqandkfWwELfXX8S8nAUT4Lq0JydxUL4L8?=
 =?us-ascii?Q?JgN7aYQrVBE+w1GyPGBLr+5u0r7muDDa1pSuJdvw8nc96lyoF8vI4m4f+66N?=
 =?us-ascii?Q?NyTJEugEOQOYwcAhq+z+iJkE8qwx1tgtlpLhNxNYwGtYRphi5kUnlxzB6Gbi?=
 =?us-ascii?Q?k5fwLonZfGMEMxCUdYVIoVjw9tnr7Y7VaWZKcP22H8ZRjPfKdFssUxqNB8Jb?=
 =?us-ascii?Q?hbLFQmz4/KGz3KrKkgLYXWmfN76kv4U53rWx0a3l/fNmZf2dNBX2IEE7GguQ?=
 =?us-ascii?Q?jdOeWI/Q0q4SLAba+KuROb8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 40284446-563a-4a12-1a86-08dbb321db16
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:50:19.5381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HqP2VTV9wcq11X+COi+gEH1Danpcq2+t+XQTeTF8Swy+yP+dpvJhvX9GzLTtQTrxQtF66xNR4G9GpmeW6xN50TIC5QuygHQ07/QuhfpiCIzf+9o1TTEbTwqGDZaPnGtc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: JJS4O335QA6MHUZJUUEEBDVL4JSIDO7H
X-Message-ID-Hash: JJS4O335QA6MHUZJUUEEBDVL4JSIDO7H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJS4O335QA6MHUZJUUEEBDVL4JSIDO7H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/starfive/jh7110_tdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
index 8c117794b0289..1e0ff67207471 100644
--- a/sound/soc/starfive/jh7110_tdm.c
+++ b/sound/soc/starfive/jh7110_tdm.c
@@ -325,7 +325,7 @@ static const struct snd_soc_component_driver jh7110_tdm_component = {
 static int jh7110_tdm_startup(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 
 	dai_link->trigger_stop = SND_SOC_TRIGGER_ORDER_LDC;
-- 
2.25.1

