Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF416EC3A3
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 04:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7406E90;
	Mon, 24 Apr 2023 04:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7406E90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682303806;
	bh=u4qP/QJgLKg814UKnZPJr8h+xvPNXxFTWcpBaxdhvKk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pnaSCnWBXm9KSs67JJeCuT20J0r7WcKxw66V5oKtNxR4HG0bcvx1SgjSGPr0WAle4
	 bFJ+2cVHiFesEuzKCYrk5WAyMecVWaecm3SOTYZatYC79llls1EUzEUNJKry/7/yne
	 J4A7IjOggFnJJ6uF85h9XY6vwK1U9raulH730QKI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB451F8052D;
	Mon, 24 Apr 2023 04:35:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F226F8052E; Mon, 24 Apr 2023 04:35:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A1DFF80529
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 04:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A1DFF80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=T1n9x0ru
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VML8UUgWhZgOFXbMvbgjU5D0R10iJ1ApyU2A1g7HCZcbW6kycEMOCEjHAC9yXXOa5UXjXm9b/ao3QuO1h4gPEwO2nvJ01Qid+KCbo74SBl0F0XP91dcmat4zv+AxF3giOj/tW122XjAiAUCM04gcZAYHgDz4dU51xMMmoaOX06DIXKcFetavoLhjowSx8+ngmNHq1Dk0BPRc9EldURO3aqZXmkumDtI+dlEpP5lRLsnO4blEBwLLuIkl3a/OKQJfV4LT863VwhHjWr3iM3Qx/BNT8LPX5ScVCAtvb1Yy+euMRD2GARjQTmaSi86Rzjxz3uZIl7YZswHe595XZAAuNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIRV10xTkiLSVJB9ODafbuBctZQfkvXjXYNjX3aLxf4=;
 b=aeRtQeaZ6FBl+yhLU/n55hmGVeL+scJvVPn6YGFe6d7TYRWOydv71SsDd5dkspiSbzsh3XLhfKzPZtJUs7gh+qPcmsYZ1LQ7HOjKpettcNOWS/RuFcSKNvC6W3iS18rbbJx1Ba24ApE0+HkBpWr72xZ/8oLSAuBOTQRsR1BxCoufrLgQgLyKHbW4mEO6MOn7YuJ0UJmYqxRzwoITXrZFtMGKpSWHrM3BFPyrP7uZ0YLkO8lRUyGdto9ChrYQaeoLF3dLKRe76qOuUgRTi7lmgxj6NHKZtQoYr3q8XAc50CE2zXPdKIEe9yiIpNMgi/S+j9c5qifW2t3uppgGRgxqwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIRV10xTkiLSVJB9ODafbuBctZQfkvXjXYNjX3aLxf4=;
 b=T1n9x0ruBLPfZxiLHkmfJj9LMqgimx9vWlI/YiBDu04QPwxAonfQGlzPPfIa/0xF15Az7TQ/1/HdSNmR8INJHeJBU/SW0ccUoD2bFzK7wPERgkrp1GjEhpf65emz6MUrnCEZGQ8reCWy17/KJgQTPPx65QRy923K+fgPCjw6kmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5681.jpnprd01.prod.outlook.com (2603:1096:604:b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:35:32 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 02:35:32 +0000
Message-ID: <87a5yy0zyk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 01/13] ASoC: soc-utils.c: add asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Apr 2023 02:35:32 +0000
X-ClientProxiedBy: TYCP286CA0219.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: 1399f162-5f3f-4000-c074-08db446c9381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hzml5WjSdvCZyyB/9cqQvv8NEXiLya8vZaUDvizK/psEuMjf+aChEhlrIdMSO1rsZAdAlRqI8/jcfgjxn+Vc9RDvqtF1P71nHont1ktaJoV/KCYpZCEXl42/tLAIIGGFrPvXZR5YDEzBlphY6hZ2USejX4UlZq6iInUYC4JZVvfns1dM6TIS5MaBHeigJ+YevbPULA8+fwiec+Qp5BsKLHrXSGk7jGJtMWqbdZDlExrSq8FfNjaqacNwn8wjuQq4iMJoHawfTAYerDh+kidVGNPJrMRapFwZS2RcsawATLQE6dqrXc83kDJTci0mzQ9hDZb+1n32bMbIE2BurGQwLBWTXcRRDqMCIQmYl4XmKT0hLPm8nl0ouqDZ78yH9KpBA5m4nsgzbjvtVTQG+eKuHzYtfK1bN9Tg7oiZVd/C4umdsWFTosSk5/ZQCfyhc6ONQGG4yFClsRC9fwo9dJ4x94HdHK6wHuURVinBz5xjw5eWY8+QU8Fd8MZy+wv+aBkXxGZEonSHa8LJP5mFe+vZXV2ZJpIq6ta58MpMLH4QY7Sh/1Nyfah7y1Zw5IVut2YC+QDNMKL85sBpx5TkCQwGE0qKSm1Mn5SJ40vbaCPg7ODr8Ztanpm7CPe22VxSARUW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(52116002)(6486002)(2616005)(6512007)(6506007)(26005)(186003)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(41300700001)(4326008)(478600001)(5660300002)(110136005)(38350700002)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VKfGv8Szegrf1e0yir6eEgpsGjAxUGCbDwHc2YLQl7GSVk5vmxJfJPp16jEi?=
 =?us-ascii?Q?m2BtkJfBLDh26OE8TlfCiu9W7N6fopyYd6vJMXEHqAdlqdbZw0eeciTKcsBN?=
 =?us-ascii?Q?MW7bAXp2hWncTLlMlxGMO+b6q5a+R3QwTRCF2Va8QciRIasyD5EbgGxSfayc?=
 =?us-ascii?Q?BlcOYl7+DrcCqbEXGVk6ADhzQSKFzDQm6gAT2SUvtwXBZCz8om9PnnetgnWb?=
 =?us-ascii?Q?Lq5vvXXF1CG6q/zJwAN3RxG23cbyMJKNlPtNJL9A3mO2VhSwHkQ2/29HCLIm?=
 =?us-ascii?Q?cZE+LACLlFYEzFnJFUAodLKVZc+DjZmNEHa0Nzu2AyJwdNEQaGOQK+E3Hie1?=
 =?us-ascii?Q?LkqtUXVJ6+jft0IVXSDOJ9zNkOZZlIgXV71cx+0lNddqg2Mv/Ss+BBPbza1S?=
 =?us-ascii?Q?RHchIVjian2O0XQJ+LZtw4SXXEf9QIsT8gRHd/2s4gKMjYHuj3bGkOv2jpYl?=
 =?us-ascii?Q?t8GU1VFa7IXaU18BI3befpqvLKCiQJbqpvMqglYjbn7aEnsA+lkpvVeimn12?=
 =?us-ascii?Q?wfCL49/Jsar4smziDGq4leUqHjb8MlMKYwcgK2nfgzLuwfy/H7+kaIL8/jhx?=
 =?us-ascii?Q?vg+bd/ITxAWcV69zD1LhQlgAp46wZTYpRqWkUmr+nX0lVnjXSGuzkyeB6NKG?=
 =?us-ascii?Q?+F4PX0FFTaDy5+whhVjXg6C8p+RXYHR496KjsvqMvX1rAaVRH8yLiMpuaqGK?=
 =?us-ascii?Q?VUHZQ3qFW8eS4HTmqVKk399nJv+hQsiFtF0Lh7jnQ1XosTCf/Kxwe0/CGs7o?=
 =?us-ascii?Q?DAwQJlNLde886n3tOGMQLr5N4BwpHu2Zt5ZaMNkL+DkPobB9kSqZ5tiPln4W?=
 =?us-ascii?Q?RN0KTk7Ch2ekr0Yw2YiVtYDhR62uggcelkpPca8Evxj/c5NrpOWB4jSBqBXm?=
 =?us-ascii?Q?ySBUL87ORd59yYqZTzU9l8nS/WkCMpi5EdGPSj0CJZGz5idEbvxzyZIRms+H?=
 =?us-ascii?Q?6Age3Rz9yN/LGhwcX0tQinBhBlI1Q0xw01ZK9jghYNyLjeT6Dw0T+4Ob1Fba?=
 =?us-ascii?Q?IxETP+fNM5YKtF5Tq+2/AmomdP3HCSM4OMxEHoRMGNfs3owKaKUBnURc6y0t?=
 =?us-ascii?Q?7Enk7p1QVyhy2dP8a7rQq6meA6lDnYNaBvqT7LF1hkkOQxdVtopS45gHRXWr?=
 =?us-ascii?Q?rlsagrxyG4sbtqGod/u9gQhoeQ4311Bl04wGQ4Gmohxdbt413TwrGkh1IVCq?=
 =?us-ascii?Q?c2dMY4nuxwuI1U0gkIDz348wft7HGMqUvZ2vC8er/7Z33llDgyhbw2yVZdH8?=
 =?us-ascii?Q?w051ai7tYvH8UMghHi59jGXaqV5dTPj/7jP7lJQXcfL3Vds+P6UwH+V71UyN?=
 =?us-ascii?Q?AiPx9a3XnAWK/T+wHW+2jlI5lKr731DwiBWqCCOFqe3PyJy9Pf7maypH45CF?=
 =?us-ascii?Q?aqHxntLfxsooa6XcwB4w3kcwCLGFEvxeKpSiGCJ3oLD2TBzoRrp3v+bdHAtY?=
 =?us-ascii?Q?VRsSMrMXvzO+C7yXNACxBzc2OUIoKP2BM9CLIHQSnhuCA/GeTqNPhCg7aSjQ?=
 =?us-ascii?Q?naUBvHR/9P67nOgfpArYgSlL3PlF/H1LEilUTku0ejtJF+bJB9O/mIETyT5Q?=
 =?us-ascii?Q?DUZdk1L1KqbmTJpCp0Ys5cxwQPYxEwgTSxRJ3kpFbVmlUoLHjyGYypZ6CHXE?=
 =?us-ascii?Q?7mGlxdzU58zBHXYtJNI1rOM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1399f162-5f3f-4000-c074-08db446c9381
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:35:32.6273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fQq+I2H+ogm1gw3OT49SX9eO2H92mbRAbxKO/0m1LsgKZrJqL5kZWmWRSbwI36v91gaF5jHj3sUcoPg8FbH8r5hKx9VJHVswgF6S+imsDk3DSUFzRQ7JnAUVpM8c3Y03
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5681
Message-ID-Hash: D3MQ2X2PSSDY6YV63EJ7FL5N6FKRZBT3
X-Message-ID-Hash: D3MQ2X2PSSDY6YV63EJ7FL5N6FKRZBT3
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D3MQ2X2PSSDY6YV63EJ7FL5N6FKRZBT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC uses dummy Component, sharing snd_soc_dai_link_component
for it is better idea. This patch adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h   | 1 +
 sound/soc/soc-utils.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 05004c048dd5..533e553a343f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -878,6 +878,7 @@ asoc_link_to_platform(struct snd_soc_dai_link *link, int n) {
 #define COMP_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
 
 extern struct snd_soc_dai_link_component null_dailink_component[0];
+extern struct snd_soc_dai_link_component asoc_dummy_dlc;
 
 
 struct snd_soc_codec_conf {
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index a4dba0b751e7..11607c5f5d5a 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -224,6 +224,13 @@ int snd_soc_component_is_dummy(struct snd_soc_component *component)
 		(component->driver == &dummy_codec));
 }
 
+struct snd_soc_dai_link_component asoc_dummy_dlc = {
+	.of_node	= NULL,
+	.dai_name	= "snd-soc-dummy-dai",
+	.name		= "snd-soc-dummy",
+};
+EXPORT_SYMBOL_GPL(asoc_dummy_dlc);
+
 static int snd_soc_dummy_probe(struct platform_device *pdev)
 {
 	int ret;
-- 
2.25.1

