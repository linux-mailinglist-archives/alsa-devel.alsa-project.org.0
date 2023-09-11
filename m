Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9934479B2CE
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:59:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30664EB3;
	Tue, 12 Sep 2023 01:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30664EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476755;
	bh=ZEGv5FvoYCHSFk2oDcg+Vk8xYvhNOYL94CtERYwTwbw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XdZ1VQ+Rl6aloSwcLeHNCL4b5Pih6gMzmeDlncUVFGAmyQmP0b1hMS/fmTH/OYKfB
	 ZQBWkfwrKdd/3bFl69t8VH508ZUYdEQ+ETBKpqgij5yFVZSrJA3KBypaWNoqg6E6hu
	 03J5RCyG+qIiZLvOUkJfCBtWbYCgQqGBFlkJNXKk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80B97F806E2; Tue, 12 Sep 2023 01:52:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA2D0F8061A;
	Tue, 12 Sep 2023 01:52:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F98AF805E9; Tue, 12 Sep 2023 01:52:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3ACA7F80677
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ACA7F80677
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RbsKytaW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsSO5gZp2hoOmJrIRffsdyWnOzzSbsCf0B2nhnUCWxFi8bfLlmDt67TGWxRSn0N7ggFhXI2jroQC61Nmy8BwzXw9v5wIlLD3kUap/qhjPD02SEQ+Xxb2CAdI2G8MwfHEWYxiqClVlFuy2RtALJmZAOiKNgCEkGOdVuG1RVVUeIk2HurO7snFrEnBMM8CBAMqYcS2xcgbbVQiMT6D6q95bdfBRrD6MJgWjUI/RXH118EBJ89F+JW702LvUJtYjr5/QdwiVI/MckLpsOKVKbNbk3f9AOvIDroQuE+PugljLMwYonT0LMbjoUKocZM8sUNnPtHuN0WTZd7O3dWU8IKWNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhzOUelusQoBR5Scv5ve4RaOIOmoETDDfVcm0hyHtRk=;
 b=IeoR8AmIcE/jzeabdnpBMMuy5MxJ8f/HdAgg0lc+5+fapRUb9qwAUaXt7H+Ev00u3LoKDPhbXqpvot9HkMdeXOQHG1HbYP6MgVYPMNYbHs2DzWchzR4rAiYABCz99NSa6DQkMamO/volzciGf3mW8tyZXITjh+n97VUzr3LpduPik84dOHYeitDthZfHjRgPhFZNQGwNjRNmsrIZ1vwiI72251zek8hs0fsfxISGklqZUa/eb/l5ScFgghW4A0zwL+yuG1jyFCo6+4P592jg4Ui87mLaaL9YMX5VBNAv/QCFoFHbuOBYX0nBiO54Zb9ljzsxgggMsWXYfLTtjarnag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhzOUelusQoBR5Scv5ve4RaOIOmoETDDfVcm0hyHtRk=;
 b=RbsKytaWHQgbsR+zwH/Ph6hGM7wnRChWkrc9W18Od/eNn0EOQj7pBOIUUaXHsp3/sgw1+o5+PNtGNTcTiv4MUWKK98q/R/X9FOaMlPWbg1imip213sfPIQaUXt2GhU72FuJuw61FyOFHHDSfdINA41Az8i8j7s8yBXVS40gTWx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:51:03 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:51:03 +0000
Message-ID: <87v8cgp8ux.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 40/54] ASoC: sof: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:51:02 +0000
X-ClientProxiedBy: TYCPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: f39bf8a3-505b-4fef-1691-08dbb321f53e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hcE62zSd8asanzDJoUhD3Skd73l+EuvO71PPOcQ9RzrkcmLtTCwfdJ7KKpPECfZm5TXjZ6g3H+RLKThU83FLaP8lbMIQESMtVlBTF1/GZpWATjai1DHxwH7qquhjO1f/hLeWjFKv64K55BKtVrsfdKcWtI113Yep9vz2incFx7NXFRZyy/7GPERsFrrJHoSvhixuUh87vWfhNMUU9XgSJ655c3KOUwt8w1ak7z4l+OtrekPw7O6Z9FSFsOudkNCVVPPdxv4d7Jeph20s8uNyRrYX58bRpdFeZSMAbeA9RZPt4x0CksfCoFlBfuf8H836ChGdX0+1FnuzOpeH9EP7lcASoJ8x0orzbk+m1ydG4dysrzwvELDcenzsggDC+qoXcJHV3XBMfpRlY4KrKOxjS+YG5ZIsazSqL4MFuzCano/jrHgF2/VUAKYnVRN9Es2yIdx1zaf0+A6IlcxLrtJJajLr+jt16d0Be4o3X/jPL32+FcPSSuSZ7esObbY4DNTXoJknnxlyoF/A686LN6CyQwUZBo3FbKhh3T8ynomYstcLUQ8Cdak6SyblWEOhXJsb1VFHUVUg6Fz6vsmO79v58YQvKCitn7ip+RpjyhqnO7qPXlIi/tXv+rgI9QOoYtUVZ9azQyyXjYSfcXuMbgZWaA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(54906003)(66476007)(66946007)(8936002)(4326008)(8676002)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(7416002)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iAYbQUZ3ZSxJXGxwu72CkVLDB5AgMAAEA6VslcfzTSy3N+A6OpG8yJkWikSc?=
 =?us-ascii?Q?8HwMFHE3NIk1Erft1QdkxwSf7XhnD761cGtLd9WewZA3J8YEP4N5Lrny6JPm?=
 =?us-ascii?Q?oUk6zsk46XpX2AKv8gxb1hJInqG9qQS6uDtSKXcfKyzL/hLGEiNATqOpG3Ul?=
 =?us-ascii?Q?h7STz4wBY8mSvYkhx3D5W3y9a5zv5y+jQbCkWcIpfSadrU/KDrPFEEJbezW6?=
 =?us-ascii?Q?xj0y8vK1x6xc1n8CqxG7MfPlS9A3Z7KnwajCPC8DYbivEtqwk4p+ikfjgc2i?=
 =?us-ascii?Q?RT9FC6WlW8Kt0meEp8uMuBCE08mZlJbmsNjUCzhCs6SfBqbMj+GDAl0eS048?=
 =?us-ascii?Q?vJPqqESfSY4u27byJGubylvLp0xGWvsKNStKDIdtLpIJmhuZpKesoMTC34Dy?=
 =?us-ascii?Q?SX8xzLnMynxL7f1sh/ghukURkcgWvbF2hiUsybs8zJ54364y4bQHmjACa1TL?=
 =?us-ascii?Q?SDryLpwyBGCRhJ72ZtU4d9DooiqukuFcnk60QfrbPPB2/7pWbncrgSzyTvTk?=
 =?us-ascii?Q?WcucTcOJ3CJIMi6wwn5NjLXWtM9sJJrUW3zUrF5Ut98IasRkUjzBG42vZgl8?=
 =?us-ascii?Q?Pzl1vwCjCs6O4mQN8IMVDygN0/QRVhZTirvidgA5uOY2ckj9bWxp9nkUnXlT?=
 =?us-ascii?Q?0qNZKqhgFyT1RAmezcnvly6GcXRQ27bEqn05bQFv3VAaL+bJjhBAFNYzrsef?=
 =?us-ascii?Q?O92yVes8xLshRo+/ZIeYGxTH7d72QdmrddToZnfcR5RvZ7EWwZSCSGpB9khM?=
 =?us-ascii?Q?g4kLKtARzAB84kzLxBKIzGMxHcPbSIfmyLuH2wO4aVuaqkWz1A7fJFykONgE?=
 =?us-ascii?Q?S8V9Dyjed9DHDjiOtWdfC7yidBVf2PgRCxVG2RrbbKfllw79TD2Lr5tEKU+/?=
 =?us-ascii?Q?2vHfBRt5ejLebc9cu795POqltAP8e50o+C4EMt9fOb/TCDRuy3kWakqKJj0B?=
 =?us-ascii?Q?Vxd0pvxbAY6EJG2paFjb+k/4rYHhxi0VgZjK4r9YGroW7eYerDnGh3fuw4Fg?=
 =?us-ascii?Q?mlyPE5+uvtbfukCL5unb50c6dM7+VRz3r7w99WaUTZTcU09mcebzNtcPizFR?=
 =?us-ascii?Q?ctqqO0J1TnYP0dINwIDL9WL1m29KKUCPolLyweSaXG946tzI2LVSpqlkg+X9?=
 =?us-ascii?Q?KQ0PnLOoze26zmOaO4xEXFNcvXAHIMXdX/hRvGdOTGY9d9vZTiB3ZoImct5X?=
 =?us-ascii?Q?wwylKEvLq6z3e3pUtawlq5gfOjjjiWA2vcFQR0A4dxrndu78fMnUrVQf5Sn/?=
 =?us-ascii?Q?cjiprHcRrVVZ6kGsAMBNnVu1T8am6FZaOEEiqpdqTt7OGItULN+D9UwP3ota?=
 =?us-ascii?Q?+t7eGFWsoXOJFc9E+JYJBOXQRAhap3uPxsEhG7oW3sPshgPePJNbgu8qrrDz?=
 =?us-ascii?Q?jvaep3n4mSFBEePx73ms0flBc35huRkMpzQw+92zNp1gcVFBvkIUU0ggtXWw?=
 =?us-ascii?Q?QxLCcxxwDIX+l6njqK4C7r0Vp/MnknlWEz2Ho8dJcrzadjfx4bTyD7kfq3J3?=
 =?us-ascii?Q?WMfGPI8qLpGfBPgnHY28683VEEk0UhB93OI4e8CSymWJ6vxZrtDYFT4GJ6Ud?=
 =?us-ascii?Q?rQLLAd2BSJG10858TLYkc2E0JfST99dO3hZy1lBkHZu3DbHjSblDASg3VICt?=
 =?us-ascii?Q?FLnAcIBsrdihlhPKtDF5Z1I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f39bf8a3-505b-4fef-1691-08dbb321f53e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:51:03.4160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 09TT4TcFHW1fNASBNhz+37yM2k62oe8itd/IZCuJVgNrVkF+7Ag5yrV4ibzjMAlO/rBVVeMrXOnurX5PkLegg3XQmYy3V/aF+j423n0gT1nxtHTMjLObdBde+LVueSfa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: 622J3EYI2KBSLKDV3VXTDOMI4I6ETIKM
X-Message-ID-Hash: 622J3EYI2KBSLKDV3VXTDOMI4I6ETIKM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/622J3EYI2KBSLKDV3VXTDOMI4I6ETIKM/>
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
index cb58ee8c158a5..2d0addcbc8192 100644
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
index db19cd03ecad8..9a458b84d6ebf 100644
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
@@ -518,7 +518,7 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 	struct snd_sof_dai *dai = snd_sof_find_dai(component, rtd->dai_link->name);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sof_ipc4_copier *ipc4_copier;
 	bool use_chain_dma = false;
 	int dir;
@@ -704,7 +704,7 @@ static int sof_ipc4_pcm_hw_params(struct snd_soc_component *component,
 				  struct snd_sof_platform_stream_params *platform_params)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sof_ipc4_timestamp_info *time_info;
 	struct snd_sof_pcm *spcm;
 
@@ -765,7 +765,7 @@ static snd_pcm_sframes_t sof_ipc4_pcm_delay(struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sof_ipc4_timestamp_info *time_info;
 	struct sof_ipc4_llp_reading_slot llp;
 	snd_pcm_uframes_t head_ptr, tail_ptr;
diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 7c5bb9badb6c2..34aa8a7cfc7db 100644
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
index d778717cab10b..33d576b176478 100644
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

