Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D54937AE5F6
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:32:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F0681510;
	Tue, 26 Sep 2023 08:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F0681510
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709938;
	bh=zp7TClQYIYwq/80BJEYTSQlZe0GYYMAMWsqfebrPb1M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cBP2Tx1R1BOHpEoOUTrUeFc3R8D/EicJqTDfgmYwEuMp7vI/qmMghY1kjB6Qe96Sc
	 LmQ8UT1ApnnyOSZpA5RSt5bST0vFXQlwQFy2//7tsUSomi6q2eMfh8K7MEPyDS9bxf
	 ETS0ElCm7OaMoAf5iLBfpTykA8Uvd1hn8AUQxFSA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45AE4F806D4; Tue, 26 Sep 2023 08:25:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 811D4F805C0;
	Tue, 26 Sep 2023 08:25:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E06E9F806D1; Tue, 26 Sep 2023 08:25:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C287FF80587
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C287FF80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RX5DCLbe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDQ8DUuLRgAdsY5heOaOjSkCYG+ywLtTbq78PbkGSA3RtX3mBbvWouYE/qL+9YRVXRNR3d39wVVSP3hXXpOU3SxNjTWCd1RgIHqYLd8LRb/jATUDx0utmcHrXQS64YXU7Sx+MTt7iJEywRmuqxQrasjP+AK3g1gkiFoejr30CA7+O/vCxtLSYS+6xCxvcVxGZPSvGYEioabFZBPcvIhcdcmXvU3c63ab4/suBmvUae8zm7RNcDbEyY4qrZTh0y0zMPhyjPLenXXUIal/UZYn03Wp5QC+sMcoKYquMHzMwTvMBuzWwt6X7jn7WevrIIWlaerbwVRckB46ZOOtpOyqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhxdTyxbzO4vx7o8LJXtoJQEid9Epajdj5+D8Ee0Oww=;
 b=YODymsNSVe6A0ksjtn9Ek7+BIxRXf0LWz1GukweOS5QoImK/I8cUlPepEE27uxz7jhcKJV3OCYidSjVRQFS1dUVvQcaZdVnGSpYAY1XysXbPzrDjIL6Vwxxe15BULlgdqkxSRBRN8Foevm+CoaD1rKGj3j7WH+rk7K9bvj6HhLYp4TuW0BdQb8EbbWyWkH22EFb1YfS0hJ/jKyZ0/Ci4YRlJTcDmmub7617fqkklxdsww7+8SreKaI8WOzzv5L58clUqY8MEebqLcqq26xRLXej7ElMiPadGguecjOUnecVJ6CNMhdUdXNYhFdJw7dzhwPhTAXD2MEtGiD+YgWoHJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhxdTyxbzO4vx7o8LJXtoJQEid9Epajdj5+D8Ee0Oww=;
 b=RX5DCLbeXisaC7XvggzHdOFkGXPhpxtFKToTh9jwy5nCi3hjh9bb2giprAllkamPMN+UPrk2UJLj6IRaU9XTyp3HB3ZUZ7lftz73oTU28LJkAczD2n3hTyEMUtjtmBfn0IP/eJHJL+ZAADKurioAUXYWLirM73cuAuJ+v9E+PBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10043.jpnprd01.prod.outlook.com (2603:1096:604:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:25:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:25:23 +0000
Message-ID: <87sf71fo32.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: =?ISO-8859-1?Q?=22P=C3=A9ter_Ujfalusi=22?=
 <peter.ujfalusi@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
Subject: [PATCH v2 40/54] ASoC: sof: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:25:22 +0000
X-ClientProxiedBy: TYCP286CA0150.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: b7817e5a-1ec1-4c02-509c-08dbbe595d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RK4t40auOx24boj/u40TeWDlS52aco210vVAcliAfuJCn/OsVgbkAYO6AJsGphKD2OZwUcAiJvWt7FXstM+bZnPZZIm8flBd889BbXxToh0TJAWx/tTAd678CXUKYh8DsxiAt3toQkkUTk43zKZd8DcNkb2Do4KSiZPKKeD6GkkU+p2BWEP6q7YG4t5p6TbgoFRFKdi6xaPNO2ThyY7T1sXBsC/oZJRYnBnWADukrS80gt2bo7qqUvQZnLFuqGwqpJJPLfh4CLIZTaFunWeJqXYy3A5wXtmie/bvGdBGHPX4uLJ9V/92z6/z//uoWT5hOGq/uVvjHsjhy974paBLyJoflUvujI4Dqts6tZxYCUU14J6ymGqt9tzBPgl2LvXi0peftlmiKRbz994eiTgqo+ltdY17Q0D1rJlxCViGd+BYuHOWl2ufp7zx8Vuqzd5xApALhKkRfIACK9kZQB7UHq+oUxlr1y6AL2LcfiRMlvKFv/YkY90Fo6SPzGYdxm81SJuH9GblDt6Xr9dMuR6oNCEd+rpMtxEoNsqZEETk2cDX3hunTvqUUfj1ddd/5F6uoyv7l+KR0ise4tG2Qh9lhbXMlBsX3xUqBFyviwi7Obzz3VaswBdfwc5+bCIU/BR8pbkuqA4LBqRaVUzFrHttVg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(2906002)(110136005)(66556008)(66946007)(66476007)(54906003)(316002)(7416002)(4326008)(8936002)(8676002)(41300700001)(5660300002)(2616005)(26005)(83380400001)(36756003)(86362001)(38100700002)(38350700002)(6506007)(6486002)(6512007)(52116002)(478600001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iZb/WMQW/qeYIRLqWNgUrMlqCWOSB7ISfjVEd6cevcqqayRCqiG1FvlMndah?=
 =?us-ascii?Q?qhYO/d15GqW4mzfvSMNWw7+GwCp2e14Iw+wXfwkfvVBT3budazd8Tyl+aBzq?=
 =?us-ascii?Q?tMyCScE4vlH6FL1aCw3IwhSA8LtxDhAN8aVItUWq6udSLnux8duiYnqzrOFT?=
 =?us-ascii?Q?RhVKAq0+NtAmamzJg2CJkAVOQ3S0gb4PHQBoLX32zy81r7I2YVeeFJ8xpYaN?=
 =?us-ascii?Q?ZDwOmZ0tJxYB73kixl40NnTJjxUacOBds4oetxwmOvt6LvDXlQl9I4o0mI9p?=
 =?us-ascii?Q?4hC23V4I3NhvwO+9/vEmG08Z6Og3BKCiLVN23Vd55QK7ZL9B0f0QyBhnBbyy?=
 =?us-ascii?Q?Q8Zfpmnx9xAD3XmbTCF037RF9zi3MC6HC/ywnyI6YrT+4pHz3/drVlmdLu28?=
 =?us-ascii?Q?EFiFQr3Y3TEeCaqoBifP46/g5wW/YaYKOUrucWUq7jDwNVBpnF0ijqlKbOaJ?=
 =?us-ascii?Q?xXjXDKmSe5rXOxbg1nWxHDKat4saPGkTyk2XsV9LkmMFVOzIDLAgBA4+IrGS?=
 =?us-ascii?Q?PacHEo8oIrc3S3AIF8POrNAhUPQ5ZJ0mzrdl5ri0i3i8T1GdgCsLozNeKTJ4?=
 =?us-ascii?Q?RR0xPcbmfmRxORc40I07idKtNZ+qDeuJKBBJiBx+Eq3KEMPvQ+Xi4tudiEG2?=
 =?us-ascii?Q?naa9J9IAWSOhhBMcKUscJ8vK1CHCsrEF6nL9cFwtoRxZQgzlbw3+EG6xmnE9?=
 =?us-ascii?Q?SNLWlTEyQs5SBjZxDV3XvqFM02uTZtWVuRvi7kGKaiK0O5lOAs36xy73G+hp?=
 =?us-ascii?Q?M4jTQLz9IDSuaECveIdRKwNCuzLnfNl/+hjE+5WKxrN9+azOD2gpF3kJjwQq?=
 =?us-ascii?Q?LC38YIT4NEZnKHeBSxXcpTV6gm5jh83ba15ymIo+7Ma69Z0ngs5/T4aX+Zix?=
 =?us-ascii?Q?bjIocoZoJBfmxFWdB6Gw8r6PXYK+KRn3q8SzHJALzz99hCY6uDXSxv9995zA?=
 =?us-ascii?Q?i2lMFCB30BHRczYsBmuIv7DhhkKwI8hgN3uQbAtewDCkWVXh0P8g8KyB0rxW?=
 =?us-ascii?Q?4y5cS/c1J/tb6rhdDry8Kl38O1ua2DQOMUMuGALJSVMLxtm7ERRMpgEc4gIc?=
 =?us-ascii?Q?CGNFQheOAEPCk+nPzYO9uae1J5gHaC3rgONpMoW//fm7DqXFIfSg3kGXPXMh?=
 =?us-ascii?Q?9yUR6Dl3FYTyx1A+vJQ9E7+XWVlmjTivB3gjBvbPRmJhBnTV4pnJaZ4KXH+a?=
 =?us-ascii?Q?XJsP7AkRLMACxV2DXfDsRovEE33I1KAC9bFMgvJyGBQQ+FEBeIF+KIbN2NAS?=
 =?us-ascii?Q?MsI0MQsDVWcOiz81oDZK/fqiO3jLnFiGCGJl9UkY1J1NnwBzngbekoxeclBW?=
 =?us-ascii?Q?TPd3qEhQsB9lvon4qmghOzbClgSF9QZ6b5MLQBot0Cy9InlxAgOFTOSLH/ey?=
 =?us-ascii?Q?rIa1lxgrZk/hF6/rzetNmXW3P4r5agAwfHbthEFnR60Nil2vxrRzIIDlNDqw?=
 =?us-ascii?Q?PzlhiW2JSJy7Ghb+71cycDdh2UDcZOMYkYCr65mPu2BDXAKmJ+QkVDbTfavZ?=
 =?us-ascii?Q?OB9dVMTAEfEfD1ZPxZP7gzSMEHBTFCr02pVVlmVbxvGgx340oxUdRHvlPM+t?=
 =?us-ascii?Q?aq4H+IF8/W1Jy3f6JIpdW59GF7G+/WDU81TGu7NJzyAPHIgJq0AYOrPzS2tP?=
 =?us-ascii?Q?QNVW+JgT81uJS96GuYwNZZw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b7817e5a-1ec1-4c02-509c-08dbbe595d71
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:25:23.3018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hrjn8aTKWQyc0ep4mXINpR4P7LVjNhi4bVV/3bf1xL39Bj2mZbd5WNO+kPljuukQuvgtAK8WEm/DgKKtxUaKVl1PpEDzXz5hwpCmm/LV+5bWdep0c43Lo6aMzFhfX65+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10043
Message-ID-Hash: MO6FF7SJS7NJNLRDHZKK2PT4NPX7E7BB
X-Message-ID-Hash: MO6FF7SJS7NJNLRDHZKK2PT4NPX7E7BB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MO6FF7SJS7NJNLRDHZKK2PT4NPX7E7BB/>
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
 sound/soc/sof/ipc3-pcm.c |  6 +++---
 sound/soc/sof/ipc4-pcm.c |  8 ++++----
 sound/soc/sof/nocodec.c  |  2 +-
 sound/soc/sof/pcm.c      | 18 +++++++++---------
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index cb58ee8c158a..2d0addcbc819 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -17,7 +17,7 @@ static int sof_ipc3_pcm_hw_free(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sof_ipc_stream stream;
 	struct snd_sof_pcm *spcm;
 
@@ -42,7 +42,7 @@ static int sof_ipc3_pcm_hw_params(struct snd_soc_component *component,
 				  struct snd_sof_platform_stream_params *platform_params)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct sof_ipc_pcm_params_reply ipc_params_reply;
@@ -142,7 +142,7 @@ static int sof_ipc3_pcm_hw_params(struct snd_soc_component *component,
 static int sof_ipc3_pcm_trigger(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct sof_ipc_stream stream;
 	struct snd_sof_pcm *spcm;
diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 775c864313fa..a3550c72360f 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -280,7 +280,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream, int state, int cmd)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_sof_pcm_stream_pipeline_list *pipeline_list;
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct ipc4_pipeline_set_state_data *trigger_list;
@@ -519,7 +519,7 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_sof_dai *dai = snd_sof_find_dai(component, rtd->dai_link->name);
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sof_ipc4_audio_format *ipc4_fmt;
 	struct sof_ipc4_copier *ipc4_copier;
 	bool single_fmt = false;
@@ -743,7 +743,7 @@ static int sof_ipc4_pcm_hw_params(struct snd_soc_component *component,
 				  struct snd_sof_platform_stream_params *platform_params)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sof_ipc4_timestamp_info *time_info;
 	struct snd_sof_pcm *spcm;
 
@@ -804,7 +804,7 @@ static snd_pcm_sframes_t sof_ipc4_pcm_delay(struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sof_ipc4_timestamp_info *time_info;
 	struct sof_ipc4_llp_reading_slot llp;
 	snd_pcm_uframes_t head_ptr, tail_ptr;
diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 7c5bb9badb6c..34aa8a7cfc7d 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -44,7 +44,7 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].stream_name = links[i].name;
 
 		links[i].cpus = &dlc[0];
-		links[i].codecs = &asoc_dummy_dlc;
+		links[i].codecs = &snd_soc_dummy_dlc;
 		links[i].platforms = &dlc[1];
 
 		links[i].num_cpus = 1;
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index d778717cab10..33d576b17647 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -25,7 +25,7 @@ static int create_page_table(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     unsigned char *dma_area, size_t size)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_sof_pcm *spcm;
 	struct snd_dma_buffer *dmab = snd_pcm_get_dma_buf(substream);
 	int stream = substream->stream;
@@ -60,7 +60,7 @@ void snd_sof_pcm_init_elapsed_work(struct work_struct *work)
  */
 void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 	struct snd_sof_pcm *spcm;
@@ -124,7 +124,7 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 			     struct snd_pcm_hw_params *params)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
 	struct snd_sof_platform_stream_params platform_params = { 0 };
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -194,7 +194,7 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 static int sof_pcm_hw_free(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
 	struct snd_sof_pcm *spcm;
@@ -246,7 +246,7 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 static int sof_pcm_prepare(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_sof_pcm *spcm;
 	int ret;
 
@@ -283,7 +283,7 @@ static int sof_pcm_prepare(struct snd_soc_component *component,
 static int sof_pcm_trigger(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
 	struct snd_sof_pcm *spcm;
@@ -386,7 +386,7 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 static snd_pcm_uframes_t sof_pcm_pointer(struct snd_soc_component *component,
 					 struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
 	snd_pcm_uframes_t host, dai;
@@ -417,7 +417,7 @@ static snd_pcm_uframes_t sof_pcm_pointer(struct snd_soc_component *component,
 static int sof_pcm_open(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_dsp_ops *ops = sof_ops(sdev);
@@ -482,7 +482,7 @@ static int sof_pcm_open(struct snd_soc_component *component,
 static int sof_pcm_close(struct snd_soc_component *component,
 			 struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
 	int err;
-- 
2.25.1

