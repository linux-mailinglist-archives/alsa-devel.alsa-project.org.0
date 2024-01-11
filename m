Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A7482A566
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 01:52:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21D30E9A;
	Thu, 11 Jan 2024 01:52:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21D30E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704934356;
	bh=fIJdcLw/apOruFeuPqePSQdf8nf3aBbOTGYJQ3wUY0A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PZk7GcHfi0rLFwAZ9hFBrUTyutpDITU/QumiKdsdST7fdsIRmOwRY30RoTP/YC5Zy
	 nD5zG/P2eMPLsRFQs2EYpEfJC7FKOsU5WDRvrHwGu33K16/eeB3i1jSewY93Q1gEdK
	 78LJ0KvMVGlVnp3GEMJ4KOvYeHS1/tNdlwUbPbys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 080DFF805D2; Thu, 11 Jan 2024 01:51:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6B91F805A9;
	Thu, 11 Jan 2024 01:51:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9920EF80254; Thu, 11 Jan 2024 01:50:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5699EF8003A
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 01:50:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5699EF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UlGYeZUc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2GAzbqwd/B5/R1//QQqrelicli1jCBS8XirEdidvZqJy/WZOQDpgvp64RGsH3P5ua285Y/uxvCSHxFVkHdGPui0od0XguhRl+Z9wO2csfWQSimsf5nCyIJxi/POKbM2UB/ZaP3SLFJVtkPbdtG/Ysm6h7F+a5nCNFNmb4BFvfumKGsaxjyYUDziXKenvPJLoGUfrLEo9JL81mbvE6pPT6w2JIaE7Sw8IC9yVP0otdCgG50Fbfu4F245shf1fvWDqFWr0IGqh+8D2hGbdfaN6TQWGa4YRpEIoYvrnf3MjJeyeaA13iDeImgyRz9bAWe6gAVux26BwQnAcMxp2RWc6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9KnUAIMUTNexXDaQxvboXle7/xuaja+Q2Xobv/unSY=;
 b=B+YKkOORX45pqhdohrlmHcq6vmaiPJFmRCCKZMVeUKQ66KyaaCCbo4gHLWooogZvZIbwdVLpxER3CG6sF3Oheee1Uw9Kb+IV7w8V7R0EoKX6skhYyCA6y2kD4ipcTBqy2+JwnohlM1Q/Tqz6sIVin8fU0xr++KoTkvdd9+tUpOafk43yosb3XKbc5G0ik6+huITclvoHf+Q9fQb+Jc3BUiI9NEvYSnbpC4iJ4hjwFjqQiWbzTeDv5NOtR0YeHDtb37GfCKsSwVT2AqPpeVT4hh7B1Ddqnpm4GXSz9QAeru0zZSMqAh9ZOKMCokShplIxF9u9VmNA1gdnEVX2DlemSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9KnUAIMUTNexXDaQxvboXle7/xuaja+Q2Xobv/unSY=;
 b=UlGYeZUcs0wjWbDk/teEEBvTlCiXSUBAysC6kpBCkcS3Me+6nlnEizxfkV7ja827kfGwm5Doi7dzbuKxsB1MtdirxpU1D4VHmYr9SIfiIV//rDzr+9zCY5teALyESNqINIx6hAV99mkW7zAZ5jWvyTxTZR0t9pH2MLSsi4cDceM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10908.jpnprd01.prod.outlook.com
 (2603:1096:400:393::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Thu, 11 Jan
 2024 00:50:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 00:50:27 +0000
Message-ID: <87zfxcwv58.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH v2 1/3] ASoC: ti: use devm_snd_soc_register_card()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <871qaoy9q7.wl-kuninori.morimoto.gx@renesas.com>
References: <871qaoy9q7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 11 Jan 2024 00:50:27 +0000
X-ClientProxiedBy: TYAPR01CA0225.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10908:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebce593-74ee-47ff-917a-08dc123f4dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/Brf4ma2BWLvfugs0LbP+4bDpyScMqbOoZzKsnceyNBMj2yDN4PaRZH2r89mTxHOhtT3aAbJ+lXEA4GHz4kyiiHXiqMkmTZ+qQafHVGVVgshhIITN84mh8NYPb/qI7SOrpRt5WYLUUvW38T58riyahQuvZWWV5Y0LFwQy/kxwDU7ceeX1PMi/klPszchnZoefeXQuFSiwWiQ7P341z/vyMi95majmOZ4A46JxTSlTUQ0pgqxEBqxwHYMYh4UiYaRcNZLCeQkAVqGm7bGGfOj6+RbaWAz98j5+7jdfIJmexOZ4+Fg8UAyg+phMHrlzMNvUwytvmMwIAi0va9quMeulEZd83BuiXjrc+65Af7F2AWJkPVUNMOfSgc3yyd6n82rJRhH6Hz7k7QHT4tD7Newfx9zvmfhJ09QO+uEfsCkby1ixg6mBYl7zBuh6XL2VIpmGP1F9EkGa98I1uTPyIM9bMrhzTc43DY39ahiiNR9i9MG/ycLrcCaaObMm8AEqauMwplWEwo214UbTgsk4sChzSI3n956fLKMI5bO+Cqsy143TU7B/y+9wfG4vOUyFTmNS0kfnIFlJT9mRLz/NEkhO3EFhmBVGDzk+H/k+2ta9/NrIB6uuXyTLrzNqVhs20Bo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(2616005)(83380400001)(26005)(6512007)(6506007)(52116002)(478600001)(38100700002)(4326008)(2906002)(86362001)(316002)(5660300002)(110136005)(41300700001)(8936002)(6486002)(8676002)(66946007)(66556008)(66476007)(36756003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/PlhkKiLXQh+x1yYgS8P2Ym0ZZqfzYP/wKWo44GF6fq9yXoTxaGh2AKwDj1R?=
 =?us-ascii?Q?vuRMNUga+UrTVM0NwjgxGgoCsoyBa6l+yIE1hc2ExF8T5xk3l2le4BvOFu5Y?=
 =?us-ascii?Q?Wci+pE+QcoG4tEmRfk5w+x4i71Q1aZDCHAMMTavQDYd7zQFMUDDEFmf8bqYO?=
 =?us-ascii?Q?+9SC2cUWpvWpP5YySl72U1U/QqNQCZBlGTZomzcZk0qrDafgo18Ky4KE7x6j?=
 =?us-ascii?Q?ZfpZz1joUBekHFFpAG/uRCNquABTN7jA55MCrO/ANIrVBqrYUb8B+mmeR+Wa?=
 =?us-ascii?Q?uTERZGP4qzYtFQSZt4GcAviQ+CfNQvXrIgcLvHNP15X1XHt7OU+PkzZ5rWbt?=
 =?us-ascii?Q?EDGE/Qo+dakBOTWhCVmX65MZNJBcsr9JYinIP8F55ynYHH3vn1FEAv4h1e+X?=
 =?us-ascii?Q?kQkSaUTxJEPxPnw2yfcZqOmyarGkBhinTJFAvi7bsa2mqBOMTFEgd2U5IoGB?=
 =?us-ascii?Q?z7GfDUQk9wnK2gXsEi0l7wGXw77B9K2oXN6v+suzPz/TOKIt1UyhrCPMSJcw?=
 =?us-ascii?Q?CnzfFdLhakYRLhGiO22MhePddx6pPvi0A2xBwBWEY5FtQCVThyKf0HF/KxyU?=
 =?us-ascii?Q?MNhteXCm/92BKI3p3l9Bj/rRPDf9+1uAHLdTjIRBtmgy7r8WuQDUjAv9seVv?=
 =?us-ascii?Q?he0Miv3z7AkUgAVz4/2QjcyWdvUMLWzmL4Go27iwQKNV8nvmDE6ZfnNVDpDi?=
 =?us-ascii?Q?QFw6jEL5kjuRU8rvJW1VXD00tFtss5eS6FhuQ2yIL3kZY8WF6INdQ31HmfH6?=
 =?us-ascii?Q?JuNsNzQp1rVsVBna4IYd6CCvFhAUaJcMq4VhWLyqmtbDqK36/t5sAYKbZr5r?=
 =?us-ascii?Q?szjUEmeE/QspdpGqehseUASZqVJwlQgXK0jlRKNk9kXMXQTHZKIusFqxsFjA?=
 =?us-ascii?Q?MYiFT2GO/hCufxFwrdGtENy5rsFPqmcPrcDuggEEgtuccHVQkKFzh/6SIw8B?=
 =?us-ascii?Q?mPg6pNqSpF2qleIdQHs7WBi6ge0rUfNag3tE2zzpc1vXI1vtGQWcGmj0UP7E?=
 =?us-ascii?Q?lmcJ4gn4Au9e4S5jilggZJ2U6JU5Hj1tSUrGBFIko2vtE+3S0r68/AiAmHGf?=
 =?us-ascii?Q?tK3Z2HWcKTP8ULwR+HVhqPuiU4D4zh30mzw4aQoest/Ada9KPdtG48liqoMQ?=
 =?us-ascii?Q?22JxTokOeXc1MUEp9/4IYLKTGvMtnAOCoKoSHtUuTxfzgqcBRAJdtDcKMA3I?=
 =?us-ascii?Q?RZaJ7s+8hnL81a4PXz1bqIIAxubeZVOREsxdUF6k/y4aFOWhgEo6i6dCq9BJ?=
 =?us-ascii?Q?2+jDyRBky70HyUjjBw5CabDJe8GCfSqXSxo38UaD+9yw+SaqRAMUaPnT5doJ?=
 =?us-ascii?Q?2ucCcIit6Ieet+qTcBSXIg6NteydM26bDsTUguUQPYbfbRQIynXB4Goxp+N9?=
 =?us-ascii?Q?rFL4hDFtIftaIJhEg6l02caQRQWfHssUAZosp+1XRa5gTdNfVO4vwm/AdkvT?=
 =?us-ascii?Q?xzuJiPSmrslQFxgLSdG1wnsUeglzZB/iZAI7Q3Jvys1Sf96wLvSakTsVvRXi?=
 =?us-ascii?Q?BVr5iQ7G+hFgqm3RPECPpj1E3MHqNfYD/OtAWcktu104tf+ENdNykiEWXVET?=
 =?us-ascii?Q?P4AOiB05xpVfXENRdfOBN1vJeZb8X5/M6sdI7TvOPiJH5Jcli2ZPRTUQcK16?=
 =?us-ascii?Q?SE3Ihz4Bqqfg4kuaWK2fOtM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7ebce593-74ee-47ff-917a-08dc123f4dcc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 00:50:27.8371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vOquOUvEgVR4MEVMuUu0QkboryUPkvcjGwKw2Zlb2uz+7WCR8pwWZgXk+2031jyJIniDHDkK3HKes9pFbgDHXbuejMp6he3Bqq3IxwE8HAf0AtxByu6Bfap3WNsSX7wH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10908
Message-ID-Hash: XT4RKJLUFOBBET3CA33R3B573FLUER7M
X-Message-ID-Hash: XT4RKJLUFOBBET3CA33R3B573FLUER7M
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Let's use devm_snd_soc_register_card() instead of snd_soc_register_card()
and ignore snd_soc_unregister_card()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/omap-hdmi.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 29bff9e6337b..4513b527ab97 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -379,7 +379,7 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	card->num_links = 1;
 	card->dev = dev;
 
-	ret = snd_soc_register_card(card);
+	ret = devm_snd_soc_register_card(dev, card);
 	if (ret) {
 		dev_err(dev, "snd_soc_register_card failed (%d)\n", ret);
 		return ret;
@@ -393,19 +393,11 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void omap_hdmi_audio_remove(struct platform_device *pdev)
-{
-	struct hdmi_audio_data *ad = platform_get_drvdata(pdev);
-
-	snd_soc_unregister_card(ad->card);
-}
-
 static struct platform_driver hdmi_audio_driver = {
 	.driver = {
 		.name = DRV_NAME,
 	},
 	.probe = omap_hdmi_audio_probe,
-	.remove_new = omap_hdmi_audio_remove,
 };
 
 module_platform_driver(hdmi_audio_driver);
-- 
2.25.1

