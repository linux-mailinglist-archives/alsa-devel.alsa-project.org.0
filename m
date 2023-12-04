Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D72F8029EB
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 02:35:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28E1ADF8;
	Mon,  4 Dec 2023 02:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28E1ADF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701653709;
	bh=dVe00EEUw20qddc8MUIEjRbJk4I2Gixg9B/9tNYvbJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KV0/31UT3gnl72yMpoj8/mFAFA8xKb3dfDd2BXffDykbG5yXF5RlmnG4DiMmuh/Pp
	 ziZzzn+FTnQXI4A2oMLlDQb1RE95lXWD2OMpZUx1HNOy7j7mAwUU6dAraUNK2mMURz
	 f8TWpaJmFC9uW3sUN+K/r02ni+OGH2ZlQVqcZBhI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C36ECF805D4; Mon,  4 Dec 2023 02:34:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DD29F805E7;
	Mon,  4 Dec 2023 02:34:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71FABF8025A; Mon,  4 Dec 2023 02:31:51 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B5DD2F800E4
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 02:31:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5DD2F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Y6oLU/Bg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3TwGLwIWT94ZdNvwGNgTDwU6yMyExzt0m7SGG66a1Ek7DyR8VMznxOen9es9TSexDYvSZCc4i3NYqidv9bfRqGlhze4iOZN5JWFMtB3TS6cZ8k2741fCH9Pml3eKdkTeSuwx6QZzTagE3w9QsBmjwJEXTQT9rB2z11aMneSuKlt3f+4iEvswAgaBHbLV5WmWPB6jZCLB5vJ1qvx7pmOIct8qN4o0xfQvoZr7AYRMB1259ATEpD2rhwmrdI9L8+9Bp6b95453Nx0EjC5GJYYnDAIzPUTWq9Z+1NhTIv9VsWVZ/MdUTZJkqqzwABcYrgJnbNKqD9TDFmaxJZEDx52bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPZaBuDcIYtLD6+R+IwieYzeg8s4mAbBjD7GeyrKfRs=;
 b=d+v72T4h7SRxL4XVWOM9hu8WBsZSWcZzTRRdpvCDIgs5jnK20O1nWfUAZsZrQ1QcIZDi4X0Tx0GtpsEIGZ5Woy5mIb6jZl9Fi+rYWvocxfbWz7VNBZYPrCkOSgAPhRK2LTg75Pji2g19vJUjV3QMVjhHR81KdvRcGW9AIetSPpF6/HEeatpqD4xHmMKLm3+NhT4G4xPFlSKEhNXOxIDTVnnlNagBWo1/qfdNzASQpLznVveP7xudF7JfmqHzFUVtBlbEkXVvMFTXh3p8iWxduNaBsCTg2hhXrJdEaHOlAbGk8pAX6+j3guKndHvqMwYpyH7JTKKw2OpIEhUeww1bUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPZaBuDcIYtLD6+R+IwieYzeg8s4mAbBjD7GeyrKfRs=;
 b=Y6oLU/BgYaR1SqXuocnC02wsvynsZ5JqJ57Vd1xu1jUgnoM9ozB20kkth7+Z/rk+U0lEeM7pSS8RLXReJaXPxHTDCnEdeEPzN9XloESGvX/rKYXDV+C4mVJOjI9xnIPOU9xnxNZRCYnwVphs2c26w/HCH54qmCIg43tkb26grIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11282.jpnprd01.prod.outlook.com
 (2603:1096:400:3d0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 01:31:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 01:31:41 +0000
Message-ID: <87edg2bvnn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87il5ebvom.wl-kuninori.morimoto.gx@renesas.com>
References: <87il5ebvom.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/5] ASoC: intel: hdaudio.c: use snd_soc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 4 Dec 2023 01:31:40 +0000
X-ClientProxiedBy: TYCPR01CA0019.jpnprd01.prod.outlook.com (2603:1096:405::31)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11282:EE_
X-MS-Office365-Filtering-Correlation-Id: 868da28b-feb8-4ef1-3981-08dbf468c44a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CDN9mxHoqeuYmyJHWBq/ZWlJrW2DcGzOFp4LS1r5IrOHXf+OCAJc/Y3yGIC1ZhdQJoOB1kwzXsR/JeOZSdMbgRiLqDCFxWzbe2j1sKtHkyql94362ZJY01x+ebv/VqvdzXcHcM6LweO7/KxkEf2VsKbyltAUojFVDVTI9i44UQyhJElQtN8riLGP4olrTytFBUsR2GJdIp7T1J4CzuCKPU45Gec+tGM09OpMyIGz2KeHrKzEmwYGq32gzunxH+EZ9L/hjH5h76kfAgTYM79RM4b+ucw4zUntq8qavUlPmXCYEC43/4zDFwljMP1SekSl1z5H7GzEjqe/RQCZmJQVWHs9DLUEGzEHTnwkj2DpgidM2NTf7kgacBnrJiIwhnN9E3rQbwwnFW5ab0sQV13ea8bLkP18aTgmik5bPInoVwsUhg0nPETrWpjzsMeJC4Q8m6TrseHTToBodJtVJ6NyK6xKvCaEFcaSYMk0Mbx0SgVsuHtSw0t1ma+8hEvSwtUQMndrWe787oTTlqWgDhP2BWJElDgGa8qBcdZbYw8huL4bGUH3asgZ31tKQNDRab89FyAkNEE0mex4CeE67skPbztTJwCA4cVD5IMqmM4WH6+YvLTQj33ayQnULsaaDFHA5SblJtKLYRfAmb23Vl9iDNdxkp9UNO3qxmfPOyMdV5w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2013699003)(7416002)(2906002)(6506007)(478600001)(4744005)(6486002)(4326008)(8676002)(8936002)(86362001)(5660300002)(66476007)(66556008)(316002)(66946007)(110136005)(83380400001)(26005)(36756003)(41300700001)(38100700002)(2616005)(6512007)(52116002)(921008)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L9gzy01QqRPyXoBu1O5IKyycflyDIGgDth6g0btd73BFFt4nYjZAN9D7lbA+?=
 =?us-ascii?Q?QI9uJI951BnFmtOq6fbbz3WYVyxkLaor92pyt8Om42LodlnGgLePpjaxDQjP?=
 =?us-ascii?Q?B/o/05+70xpDFBKNtv23GoFvmCCBrghSwPUcMkxk+MVQrzY+OiuUfzSYuhTf?=
 =?us-ascii?Q?MDYbeA24rNqX15bPJoZmP4znwGGPR2/m3WNraUjVZaXK36UAfOrCicM4xsBx?=
 =?us-ascii?Q?GScq/4/OkWCGzsbFlvH5CT8eOGXawqRzsDQw5X4savI8JEyj7S8PvCOV9xYz?=
 =?us-ascii?Q?BJbJUUEdrY4N79LyIjrVmAMiEp4t9tT7cUyyn31bnlLXpO0Bg4zMauGwQ80C?=
 =?us-ascii?Q?zdLQljeuuQhBxzMGNhYSYs7yVYirOXC0Mk2XbAk5CfqXNkvoKtpaGr0zo/UP?=
 =?us-ascii?Q?5H8hcrB5aS/KtGxeHkzrhcaLvm3z0cTgMOer4oF9Z3X7g0iyUJxN9oSjOBzj?=
 =?us-ascii?Q?+VoH15gFc+sZshAmeJQ9scQA7T/d/4/1F3kWhU18N3zEvwTlDDKVKpjEkDQ2?=
 =?us-ascii?Q?kFBVeM7iaky6oEzOevj7HyFRpRZbZ+M0nQKdWQGrYrnOh7Y6NUvq6SIaEriO?=
 =?us-ascii?Q?0P/GXWMNZHAQIaMPSl5QOk+iqZhLEHucMDRLkvyuVtxfOlRvVbKeWY4MPLic?=
 =?us-ascii?Q?Twhk6QsXjVzzYf7Son1NU1eAxVdtJQxpWZjCOQ1Yv4+CbWczVgNl1JRop5WF?=
 =?us-ascii?Q?6ERiOTvyDt+5Oisvwn+WkWLRbH9pNY4TPL2v/4If3Lj5htH833z8KRN+cDzA?=
 =?us-ascii?Q?BHluEk/hPU0nOZI4JWC9wbrBGKaT3LM+HrvqUSKv/yxcyEBhQNmFKCscOWE3?=
 =?us-ascii?Q?/3IyC00BAN0FnAVNEX2kXrGFpuU/LzMqlN6W5a6gWz1PsVPe7PnDJlVI3uWm?=
 =?us-ascii?Q?waKztZmvLXSUTIaPAJnkGun/cD7bMvfF+I4wd67bkcl1+tL3TBJuPMr8fYPe?=
 =?us-ascii?Q?+mekOTzL//vhxgrs5VS6X/4rkh0k6PDSTOdMotWIe1O5/2Dd0E34Al5wwR/j?=
 =?us-ascii?Q?3L3N5pS+c4LmAdapkJGqV9a4Nx3A4v4ZPFBUzRJw/0DI1Apy5FBZk4xIaf3d?=
 =?us-ascii?Q?YPs/noCJiVKl7w4L67NWexx2uxg/cwV0DEv9QsryyduJ+lKEs33/UfCs6nLv?=
 =?us-ascii?Q?k5OU8/BHNPoHouYTiDlgv/rwtkT2PwC38bLGGKWIl5QdXK8zUIlW5EpI+9bB?=
 =?us-ascii?Q?JGgY9Tk25UG1TUgQ5kKlOrRODksBvGkcQL4hkmtAgeLFl9nrTyOpUBRcuHTS?=
 =?us-ascii?Q?Pa39WF+buTHhTKW92y+UVFXnNFheAh4DLj13qkoEsixQurVn0ewOWWSQ5f92?=
 =?us-ascii?Q?msBloG+S/mgzjgS1RLV52IOuhnqrNhaVkdJqu2q7xN+OduRbpbR876TMB5wZ?=
 =?us-ascii?Q?/pYZiokT7lQHUV6Z+evJE1+FgqZYet4S245bjcY+VjHv3o2x2zadIDtJBYoo?=
 =?us-ascii?Q?70ng0BJ9SOedWrYUy3wbmJ5Ty3iocvf5giW2/ruuh6NHb0l9DTbjEiFlkaRE?=
 =?us-ascii?Q?lWDoGrwrOUtdIWmjCY+5dc/INJGq86fWUUAlCvB+QULIyXJJ+6Rm1kjiMxDJ?=
 =?us-ascii?Q?YYzoqbQ1ERXa3g/kWLdvWcQNfUgr8R+9mgTcwjWcoH6B1TBguCyic1Xv0LbM?=
 =?us-ascii?Q?ANPhmL/BsI9UaNkSEP0YIP8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 868da28b-feb8-4ef1-3981-08dbf468c44a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 01:31:41.1253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 28yIGW4Lq55Tj6fNes3347mUmO4yJcelaWvVBC6ZWJlkqg/EUrNOjyRtQneVWXaDjtuTVIYJqh6yr/acXOezSw9chqfC8K1v+BjwIW8VqS74Vujj4eZZ6kkTO+UPxB1H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11282
Message-ID-Hash: RL2WYWUSYRHNQ3JFITBNILII2S6DJDAD
X-Message-ID-Hash: RL2WYWUSYRHNQ3JFITBNILII2S6DJDAD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RL2WYWUSYRHNQ3JFITBNILII2S6DJDAD/>
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

