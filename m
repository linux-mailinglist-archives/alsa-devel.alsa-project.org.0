Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1448180D7
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 06:11:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D43BE8A;
	Tue, 19 Dec 2023 06:11:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D43BE8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702962691;
	bh=dVe00EEUw20qddc8MUIEjRbJk4I2Gixg9B/9tNYvbJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ewie3SE8L+aNyHNzRE8OeaFE+H7jg5fb2axang/mXyQNmQcLv3f59gU+bsgZFEXuM
	 IbPkxUj/cVp8AXKxt7kUgqcdQJlUAkcdAUy8dZwjU6tcWWseH0VSJHWKQAs2B+OaCu
	 wySHoeCuIWWjGVywTEzYej3ooYQ0cobZROASVStE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A63AF80212; Tue, 19 Dec 2023 06:10:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9EF9F805C6;
	Tue, 19 Dec 2023 06:10:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E214AF80537; Tue, 19 Dec 2023 06:10:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A97BF80589
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 06:10:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A97BF80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jXqaukkJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcuLLT+H2cCbDxRmh0tQqPypRnZ9ejX7rbUIzgrJdiWg7z48yVLl0jSgNHS1/h8AQBLo5RGQ1rVcYJ+ri5XRxxcHkD2ZWIEUUbxnQabMV21h4EjcAxNLpSYa0L+XREvbvveIDtEp8oo4dro0pFjaKJ0C/gv3HsvQH9823N0FhYOp6q975/FDypvU1uPXzJ3THXk01vyYRzRsBHfD3Z13fNIMs23buXMnM4+PwBAswb/UZeeioDpO+dr+3LpUDg7hRLDcbmX4RkSur6NmPYt/RMFJErLBMAbpJEumbnVrWFlYh6cz4SCmD8NTyh5TlXnpHzqzzGBZ9LvL8LVPNGzDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPZaBuDcIYtLD6+R+IwieYzeg8s4mAbBjD7GeyrKfRs=;
 b=nhx0nJpv1CU6IByW9T2XZRlP2k5du9xeZBMqBAdGVPlqlIqheE+R/0yW+nqu7chf/iJPWAXvHr0K5REhimX0gep6qN3W+n84X1X0XRy01WoZg7PXrxN5zI8PT/LkwsVE0efACEDsqUvkbBaOZswq7s/R/oFJ/1EkFE/UHkFErTENH53WFXq9xKdKWItgeqz1AdSaK2bZrtigHPaWSy39LHbuBSNdnhVhqKmZSDqYMMl7pZDCyBY1EfgeIIv+ovHfvBqXVoC6zUWXzmE8iuj7Hx9fFGVP4GfYR8AnwzL44JCquhV4oBSor8fWnkF9EpsXtcyqfp8OFDtAI95YuW+Z7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPZaBuDcIYtLD6+R+IwieYzeg8s4mAbBjD7GeyrKfRs=;
 b=jXqaukkJur8Cntu8s9bhGSk0764TpkmlSWRBV4aIOz6mQbc3Xlb+Qqu8paD82CMVJYbRKQ/ALJCKLRs6GEml6NhUaG+xXaR5jteSFCdpp3hsw4xpnq74lTyWmsn0CeZVtvv3Ny0umagKZeuKo8aODU/rNtmIoWXmlPinvUok0AM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10094.jpnprd01.prod.outlook.com
 (2603:1096:400:1dc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.10; Tue, 19 Dec
 2023 05:10:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::6d8e:5f2:f206:6fd4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::6d8e:5f2:f206:6fd4%7]) with mapi id 15.20.7113.016; Tue, 19 Dec 2023
 05:10:10 +0000
Message-ID: <874jge93ri.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/5] ASoC: intel: hdaudio.c: use snd_soc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
In-Reply-To: <878r5q93sq.wl-kuninori.morimoto.gx@renesas.com>
References: <878r5q93sq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 19 Dec 2023 05:10:09 +0000
X-ClientProxiedBy: TYCP301CA0048.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10094:EE_
X-MS-Office365-Filtering-Correlation-Id: 113f3fa6-5af8-45f9-4825-08dc0050c60d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Sj4YsUJQu/QRY3sESnr1dfrRv8bA7AKRkWyCbn/hvJJVLbzHtRmJW9/4+aHDeCO6lIVW0/RtwkgYXHBe9yp4CcHUdzUGNdEsmg2JcaiCQTH50/KVWNZTSP71sGIWuHbVW6jtrnPzItRbH/gOotfH+vYiLut1qzEoM+GYiDXHZZk32WrlmTCNOy5Ns7yUFBIr0ZqDCN5wmFZzQXd67b9eP1cFJ9y96ZHidMKGjw84Jxh+uveeYx/ERW2/zWuA5d6tOUSfUgnbc+AJ+glt/zx5z7kTbs1y3n0T0tiVkyG+p7/96QtvZzFzCN5atpo0SP4CPj8BOvUNV2ad3xBg3kO89zGz7J39iW4/htF9OXFk24LC17lxHqVy4m7aKp2nEF7mbBge1aRilhVXwjNsM89nZ/BiQytliwELHJB2gKce3kASy0s07PbLlpUzP0ekzoAEIODX6w1nkmTCvjaNPyL1eXGjJhIMmS2yT1Ic60qeRlO3Y2kOsTJ5MNsq3RmT9jgZPlXIszrucXhk4tzoLtY3Z4i7avDwwFBsqzaSaWWIDly321ADUxv+Z+nJETzXX7/YA7X9a1GeYwO+7VGzZi8064F5VP/oPv5DiYfdOk0z6L+T8XT3ZLklq3oWxA3KrzAT7K2tIvdq/b0JjcKrYmcxoYvMdgu9w0o3i8TrjCO1hSI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(66556008)(36756003)(66946007)(110136005)(66476007)(54906003)(316002)(2616005)(26005)(6512007)(6506007)(478600001)(38350700005)(41300700001)(6486002)(921008)(2013699003)(8676002)(7416002)(8936002)(5660300002)(2906002)(4744005)(52116002)(86362001)(38100700002)(4326008)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K4yWsDeE7rrN60lXmiGejR72qDJgvaDdY80h9WdQOLY5XHZDJLq5YY2LwAHc?=
 =?us-ascii?Q?SvbuU2YDDUyco/M2GSHpepL5FTLChjQ4c/LqBfCCnsasoNT239UZgan3j6Bi?=
 =?us-ascii?Q?Opf9w5WIV+fATmUec30TN4m+jbA9+gHkU5c4hquKGaM5PsQziMbk2+qQ45Ps?=
 =?us-ascii?Q?FGtgyEqh7blXor6HQqeIO3GdR9HEIa3l9KbhGVDqk7FA9nlzcyOylWZUmmVk?=
 =?us-ascii?Q?BpsvYmz9PwEMZTkAknGG5QRFvo8M+NaDAyUklLSZxTBEVHKJC6XJmKVOFA57?=
 =?us-ascii?Q?LynW61xhlrra43ZTcOGmlnSH/BTZnaPJ9IU0Gd6xkRr/VPkOhmDvnIURaYM0?=
 =?us-ascii?Q?TZ0naqG+NUHyl8UGaaslX+mjx9cQZgKFApy9pewsgFIf3QPz3gFFHas2IoeK?=
 =?us-ascii?Q?DpeE+uQzxRtLYTJShcxdfXjvv29NBusXyEsh3A0DGX24H2YM1kin7mdtY3Ou?=
 =?us-ascii?Q?/JRYXui0w8cYptt0ZN+ISdwU9fZZqtKVokCn0fwChY6rSf8yluZbkhf3zh6j?=
 =?us-ascii?Q?LR8b9sp+ZjqWncggTBwstRmAAQbpexW3kZwObnK2zKP7aAS0E03wab6A50PS?=
 =?us-ascii?Q?OzGPmfmWgIqL/RlYZXfseT4xqxGWt9CwyzRGOWtPt/ksGrB8P8MApB/5j8qa?=
 =?us-ascii?Q?1asSddBhTEW7jKQrxrVRq+sFt9mPYhmVZNlydLXLa6Sb3YjRKUtsdHvQlRVd?=
 =?us-ascii?Q?41233OW13fQwgDnzEreU0sChAzkmBPKfpxWIX7gFjv99iQ4wUzC4iHH7Pdf9?=
 =?us-ascii?Q?eqdI4BtlcvREykcgW9MF1+z1xNFlp69U5zqAmSKd+4iNHFPCavhskntDHBGJ?=
 =?us-ascii?Q?T1pvfkYnmsjOCeiRw7/9Dccd0Th2jO+S62r2pLTdj1Ql9GnGXUkcNGIcW7S4?=
 =?us-ascii?Q?3jFlt5DabkeusstQmP1FYnAbrweoz4SX6ev8C1PG372X+xA5eD/A2x0WVbcH?=
 =?us-ascii?Q?uqdb6xNs/I9dt1nt3kquOMB5zDOk/d1BoTewdVHoQZs1/X8wRsTuxUjr2ox/?=
 =?us-ascii?Q?bSAsPHjRUc7d2/zNsEBI3b3z3CEMZysyjWJr6v/SNqFFO9Qt5se1kJGHBuba?=
 =?us-ascii?Q?XHK7pEATy56nYOKoAIItZSk6jK+6Tb5DKjz21LkVHKipmti5oN7jyvXiFJgH?=
 =?us-ascii?Q?EZMIcQuTOT+beOnrQBHkpojNXv/Vc4adOvpVAsmaMUMQOSh49/XHUJAhLknu?=
 =?us-ascii?Q?mGYztTSQnf53mZCnszzOweO/yZWvUce9rWBHskGDcAc4taQHlm5zTr6RTCXE?=
 =?us-ascii?Q?kCWOThE1Osech48ksi1YEqat+AdPdBWF+gePnbeY9LtNiW8ehXadVNq5KBAb?=
 =?us-ascii?Q?cdorYIPF5FCE8Rv8OGWi5F6bmRrVE5UeVNkDULG1O10f2OovoAd/JIhnTDBH?=
 =?us-ascii?Q?iugnVYIbxLYy4z8OdPkjwaqJF18bciCy+WqOCVPdd6/Na+YM+cLt5OSdHSDk?=
 =?us-ascii?Q?y6dJnwEU7Br7qWN4jrKJWZFLektshxYdkw6khbZ8YBgcfFLoHNp8Z0Y6Dnvp?=
 =?us-ascii?Q?h1ZCTyIRP7l3cNTsz9dn7vIsXszzkYi0oQTsuTAUe1Xth2SSn3blco8+pK/5?=
 =?us-ascii?Q?2mNadheWJONTQaBWko69ZoPnj6brMimYFbe6oJjVkLoEYuXnpIqu7PgtsFqb?=
 =?us-ascii?Q?8OoZQ8oeM7BYNtzQZmkKk+E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 113f3fa6-5af8-45f9-4825-08dc0050c60d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 05:10:10.1080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kGXNqO3KBIs7ay36E99QJEcNainB3j2bTE7ozgSmzXQJoq9DqG/TBEyoMJoAkvwMNEx0SjwnGZQ+FwG/I5FRpRDZywHuc8/HihJuBr7cK+3PzshvkiTz2uRvQR1A+sRL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10094
Message-ID-Hash: H67PDWPJTO4UAQH4XRECCO5EB6G6JD4B
X-Message-ID-Hash: H67PDWPJTO4UAQH4XRECCO5EB6G6JD4B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H67PDWPJTO4UAQH4XRECCO5EB6G6JD4B/>
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
 sound/soc/intel/avs/boards/hdaudio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 844a918f9a81..79b4aca41333 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -155,8 +155,6 @@ static int avs_probing_link_init(struct snd_soc_pcm_runtime *rtm)
 	return 0;
 }
 
-SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
-
 static struct snd_soc_dai_link probing_link = {
 	.name = "probing-LINK",
 	.id = -1,
@@ -164,8 +162,8 @@ static struct snd_soc_dai_link probing_link = {
 	.no_pcm = 1,
 	.dpcm_playback = 1,
 	.dpcm_capture = 1,
-	.cpus = dummy,
-	.num_cpus = ARRAY_SIZE(dummy),
+	.cpus = &snd_soc_dummy_dlc,
+	.num_cpus = 1,
 	.init = avs_probing_link_init,
 };
 
-- 
2.25.1

