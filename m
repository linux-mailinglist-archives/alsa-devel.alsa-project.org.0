Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ABA8029EC
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 02:35:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED848839;
	Mon,  4 Dec 2023 02:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED848839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701653732;
	bh=jUhJytz/lXZSkGfyO4JpW6JwgiFLTCxcy5A4SDv6oSY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E3BnYrYkWuvtg87MEBzgmDlP34+zNfV3IjZfqZukXfSrdFpbavW/M1a2+z21gw3Z/
	 uoNVHkJa3lVPGF/SatwtiMw8rm10WveBiiAwzNOpHDFNMQ4lK0yIVGG9ROIhSVMPDR
	 /jZhA57tHMEsrIT3vPUmj/nnQsK+l8Qp4Ahw5txk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCC54F805FD; Mon,  4 Dec 2023 02:34:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB2D6F80606;
	Mon,  4 Dec 2023 02:34:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC07FF8024E; Mon,  4 Dec 2023 02:31:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20BF6F800AC
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 02:31:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20BF6F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QJeRlASR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+PXCSCRPSpuZMhWLc5km6mF0bmWLMGY8Tei/EkycODURO8U67yGlhXnvOKAEsqT8bpfHLsaYB2qYR/pZvfb8t5z9elaSC+1PeftSn+XI1Fy/sWM8EUBW7GE58+zoTECeY726HHrmCjcgIoZSFg/KPPj2tCmCOTymR2gPyMoK3YV4hlcYhrq3aDLwcyOCoqwCLSdPl+XERXuEuxMiaXdIl28LBgniX8egB8OmaBSZVw+wsrqjQFzcniuAM/3E/X4A89wdsgdVEsngGLOwmdI6CLlt8C9fZQKzi9XjNoj0/ROfCLoAXitPt6goDSN8qHimQ2C5z0fL9uD7JTRigG3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vj+DW0XzXp4Dy/xTOo3ZJhV5T2Fdf9Fv/aL+EkXVixc=;
 b=ES2CLWLGxW/vC7D6JMUi+AGCdaoGXUdGSoKdKGZuvEkNw8Ztni6lFJ3PlECM+ZE8tLcxXw5igE5FWbJssnevdYwFlNskfiGGEL+/vG5wAr1LD/qpwyYB0ndBB44HwHRRd90+n8P22u+1TZBW/9Eg5WE30gKMtRdS8JyK/z4gBEk6S8WKHA1piGzRjKqKDhEreoEUtuV7LVxGjlJgYFMJLOEtt5ywmain9U770T8Vm7eJH2S5qzGNE2wYnkfABi74JAqz60NV7lck+aQhWPSaBU1nrYWU0NnMkUFqkYZ888OwwaAhU1pH4zwLLCc8HwfEuSVBYBgbHH3aaCtMJxAd6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj+DW0XzXp4Dy/xTOo3ZJhV5T2Fdf9Fv/aL+EkXVixc=;
 b=QJeRlASRemFLoD3+/eQAJNCIni8J6ysZQAEpS6jT20XGQ3eqkB9d2JKSYCBINEznstt6H9BpOizHH2+SdWHIiIQIJvKODIXSTdamCABxKFiJSAwY2PbBQzethVOyupj8r2i4atkej9NfyOom1Idvx3KrmHl8WHUaETDHvRQ87yk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11282.jpnprd01.prod.outlook.com
 (2603:1096:400:3d0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 01:31:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 01:31:47 +0000
Message-ID: <87cyvmbvnh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org
In-Reply-To: <87il5ebvom.wl-kuninori.morimoto.gx@renesas.com>
References: <87il5ebvom.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/5] ASoC: sof: use snd_soc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 4 Dec 2023 01:31:46 +0000
X-ClientProxiedBy: TY2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:404:a6::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11282:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee2d4ed-675d-471a-68f2-08dbf468c7db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UvtRtGbpgPrKE/p3wNwRYawXnXqqxzKTdjttTv8jCtXQdg/0EbwGKPxUbhZDeaV6zbmIaysL9cpSq09OWjQD22dr96tPtRNeAPxE6/LT05axm/Mj3T5g45o4kWg6VfEG8FT44rGf0l9cIoJcleNM1q1+lbfUiRX99QghNvUz6o3+XMdFZQ+dDqixMrGioQZ4+aLA2hVZqP6WLP2nB0PlI7Cjs0L1ru9ThvlBJuF7LLwRDl8u9cq8JtwXQbVcQkUHJLmZ6aIqQs2wQ9mI2ogKJPqvQY9xkqd33hwqU74XfPpgG/cZq/LQLZqhsxa1jpsxjXkZMvumyfJvoV1mB83QFJVf8ZV0Py63iRerpvivgfaWkxtZlIRENmokGizl7QNox6ewJepIm3883gGVScWj0Bz189gyZFWLgDd0BmAaaf6rVsOQOfO6yt7Nyum3YNIhVdmLi1hFn3SiA+0obzC5tkkt2GAiI/mj9LmGBdUTHjFIFeek2JhI1ExK/+rScBZG4hmiFpvkE/C7PmP0PhGIhk+qqK3+GNceyZGGzICsxIHls3zqAiPLJtX6PzgI+xa9b+HH6Oacr6numMmJLg5cFyAIRdyRE+C32FVzt92jIKw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(7416002)(2906002)(6506007)(478600001)(6486002)(4326008)(8676002)(8936002)(86362001)(5660300002)(66476007)(66556008)(316002)(66946007)(110136005)(83380400001)(26005)(36756003)(41300700001)(38100700002)(2616005)(6512007)(52116002)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D3EaWia0pUw2mr6KbXn/mU0KHLXombscIDbJw17tpqon82moJB836bnS0Ebw?=
 =?us-ascii?Q?US8OiwOSWyOESpHMGIDjpXlgysw7DhDHTSwCq/8aSWKxYcOscCg2Psln0V33?=
 =?us-ascii?Q?3dTtumQcUJo1p3DtbPq6I1nSghFK8D+hl6MYAQ2d9ekchInwIyivqwOzHd0v?=
 =?us-ascii?Q?pmSQa6WI2yhzz4KL3gWNUe3BkQdkBcG49GtATYLke3sQkwQbHM2osIeIB9kY?=
 =?us-ascii?Q?OtPryYwSvfzISzuwkswOitol5H6KzyppRTzBsuV49MtI058B42NagF+zfmDd?=
 =?us-ascii?Q?lWrz3nc5BVqlUvpaazbgfjRXvnqU79ycKhVC1CQZWyR01AEQmud3CViHKFm5?=
 =?us-ascii?Q?9aUgvsT5H2OfTZZrz4PzuWLY8hj+h1Tcqw0E67nr6LqmQqaw8mZuD1xoRg4b?=
 =?us-ascii?Q?Squz7UXrls0erIyXZ9ThEWrh7hmQKZJIYHBd+wt/aQMR/iFogNyrjVBMTnrg?=
 =?us-ascii?Q?jJICRJjiDi8latNi2y0XaRfOU0KIZZM3NmGMFecE1+rsfe/PVDIhhOOhDS7K?=
 =?us-ascii?Q?Od74SEpW01++MdStVX6nVG/oPCZteIcNYRYcJjHNw7ED0Sqib3dVtbPE7Kmr?=
 =?us-ascii?Q?Sj8dD1SaLdSXSf52zcEKVvieFfZuWLaL3Df4neAGjfpz/VnbBLcfKi15Hm83?=
 =?us-ascii?Q?DiVWTClYCklB9qsRHarV9ABHgAWaPn2PIB80o0s4pmkEpA8+LZ2Wy7aSSs1i?=
 =?us-ascii?Q?0N+39jPdyfxhv72n91hl1R94mKM4FYfpRG2DaOielt0iE7LoEKvNzuYBCyJg?=
 =?us-ascii?Q?DntmZPlxFlJdytxBFR442C6mS2KFwrO7SNc6nzLuCdHQfwTBZExWGoGXKmva?=
 =?us-ascii?Q?iloELHU1TNNeyYw89yxbsEy0rLCkfJgZmTlVbOfD6RjnHZOij2PpXVLkGnoe?=
 =?us-ascii?Q?JfgrVmmAgbGWM45xdnZgEseDKSXmsZej042bR5XKPI9K6yoaXBsUm8yq/8Zp?=
 =?us-ascii?Q?sBh9Iwv3eVh7NH4WBPaRJLurfqNQy6yRhmgHjOtoui2D1dtQd4xGpjGv6tyD?=
 =?us-ascii?Q?LC0rem+dvRULtAHGtF0rgJOpeIC2PS7qRDxjkOynnWK2asgYAxy289LPahGf?=
 =?us-ascii?Q?opdnvC5gDPElXlQgvYLkjhox/bhQLeCbhE46/2ZHIYHRQClBxC9lQVB6dDuy?=
 =?us-ascii?Q?CWu1joTkgYyRIu+zD1uKaCsBx2R42+MqiT7T1mMiN1VtWBGv/w9W2ENTyLMe?=
 =?us-ascii?Q?6poq7/Zwo096YTMKTX0zSmfZr3eP5ikmCHuoVwnw/o70Tufs8EchDfNUFdFG?=
 =?us-ascii?Q?2NSEmXPGSr8QMIHoZmgMyAeVW3EZEEa8MbgXAGgJNmmiLtIqYIOdRK37XVoC?=
 =?us-ascii?Q?1lg1LXrVhxzPQJ1oNiiceureAGZtzjcKqWQx3W/N8AG0KYag6m2rqqGSJLaI?=
 =?us-ascii?Q?MMYZuI2je594DqLacEalkOtNNpYzlVOvwv8w13nqIQNTZ2knDjNq1ERBPQXs?=
 =?us-ascii?Q?Q58ri+xCf3pyh1LAmrz2X6JBN2Se7J4pLYW96mvtx6OitMj0TPj83sJD0Znz?=
 =?us-ascii?Q?6orI/aUqlTxV+JrD8AHLQm0AzoV3pxcoRtCBd9Ljw331SPBJk1o+D3oYT7z5?=
 =?us-ascii?Q?vLCI797aalRDUfnlI/kkg+xW5X2lmO88SMHc+gadoNbQR8JWN/kTa5Pfim3T?=
 =?us-ascii?Q?9M09fBirIz6CCQQL544UuHQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7ee2d4ed-675d-471a-68f2-08dbf468c7db
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 01:31:47.1209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IFSfKfesoJuLZAvpADSCB2X/arM5if4sXIP2YAS492ii9BaDRnSI6xcGmQ76BqsHW/GmaFiKBg2vFnhl7+4Tt2asRc/0FsKicQDT2d+30aQQbNnr0qrKBYZZ31yp/Jy1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11282
Message-ID-Hash: JNJD7CJ7LVMNLSFOPJ6NO4DNBMJHG5QQ
X-Message-ID-Hash: JNJD7CJ7LVMNLSFOPJ6NO4DNBMJHG5QQ
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNJD7CJ7LVMNLSFOPJ6NO4DNBMJHG5QQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We already have snd_soc_dummy_dlc.
Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/sof-client-probes.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 7cc9e8f18de7..30f771ac7bbf 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -381,8 +381,6 @@ static const struct snd_soc_component_driver sof_probes_component = {
 	.legacy_dai_naming = 1,
 };
 
-SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
-
 static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 				   const struct auxiliary_device_id *id)
 {
@@ -475,7 +473,7 @@ static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 	links[0].cpus = &cpus[0];
 	links[0].num_cpus = 1;
 	links[0].cpus->dai_name = "Probe Extraction CPU DAI";
-	links[0].codecs = dummy;
+	links[0].codecs = &snd_soc_dummy_dlc;
 	links[0].num_codecs = 1;
 	links[0].platforms = platform_component;
 	links[0].num_platforms = ARRAY_SIZE(platform_component);
-- 
2.25.1

