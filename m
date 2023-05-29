Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 968F9714192
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:10:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B9C4868;
	Mon, 29 May 2023 03:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B9C4868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322603;
	bh=I9UlAPpUzx5tvznEyGtgsLw02/eOmHiffZ3Gx0bZewI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YTo5Kk48n21FuX/JxhuExjqYfn6f/NOFvlArKRnH9mATdis+Yqrvye+AmbNURrWH0
	 880FKG/9di9glVNLLmrMuhG6w9Ejs7j7aaWIeU3LqJOenCOIIE8P/e9SrGEC5Rt08C
	 oHSPUcyP58+QtKv0W30zO4CEkjN5wR7Mnm61RYVM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEA6DF8061D; Mon, 29 May 2023 03:06:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F899F805A0;
	Mon, 29 May 2023 03:06:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE6E2F805F9; Mon, 29 May 2023 03:06:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF3C3F805F9
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF3C3F805F9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=H9hXsLvX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjyvBOYHdzlGUS0YxmvQldwh4RteoSrTxNoYjjdg+oDiO44BtqDiVrXgzaZUhAgBBXYq4Juio6O4eBlrGIX+YiwhaqNPy5WA/O2uVu2HgErXI50cCPEBsMChZ8bu3tbdSdu+pLOdG3Nz6zZdZ746Cgp4lqbOPW5Xd8k43ubPXYx9hxqXE0PkzOazEWwWJixJwL+yNmfO7DpUvD5Goi6mKcD89RNtHi9Nq5nmvlux2qwIgomyuO8YUfXgNjkh39bHh36/prtxLORSz0fqur4e0B9Bgyi2dobKlNYV5m0QXEp8eAEPghF3XzCKBhMqjYcaD1mfqC9bcNQ0qCFQ/Y5PZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/vEDmgTKC8oVRAo4LbaCKUyloXjh7x1gUrHUGN8dWU=;
 b=M55d5m2wDw3XYASPjVRWQl9PSJ2C/cJmMXtnbV98LhvOck7wXbUvD+kffYqy4hV54TcgLkHlUlnDpZ4kWamYDjqApQWOtCmqMmMpDJ4ZtTe4Q49Uh9lgqxNTILdfpMZ0Q5t4+7XrZ5Lgw5SKRCEP4u46ZrXemAmam5Km1z/ztgWtxwWE3TLzopoTxRpVF47hHvOp+7CstHVl/I+ZzAMBHJHMs00uqhPeKfqT9+LAwTBcxQcbnamOfpbbX4CqsX9p6AZ6Yh5/vT84OC09teEDEv2Q2HS9oWmIOzCA8Yb0y2AvQLoB6JDK5d0aYSXow7HZzzyg7Si2gxpDx1iremzKcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/vEDmgTKC8oVRAo4LbaCKUyloXjh7x1gUrHUGN8dWU=;
 b=H9hXsLvXOV+XXPGXHmlxRckBKaZCvi5VR11TH38+dKX02jXB6+ENMUDs+XGANs0SvU4T/7ZDF0d7aOCW59HW4Cir89gD839Qy/C/rtIXBie3Lo6NqgTbfDCf4P17LQHREJ2MvLrPiNjZEWDq7YC2QsTGxL48uWYYQtU5TZdRFAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7952.jpnprd01.prod.outlook.com (2603:1096:400:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:05:56 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:05:56 +0000
Message-ID: <87ttvwkkuk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 21/21] ASoC: soc-pcm.c: remove dpcm_playback/capture
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 May 2023 01:05:56 +0000
X-ClientProxiedBy: TYCP286CA0148.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 958c3642-c56c-40a6-4dad-08db5fe0db8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DJfobRvcXl9CBDuSCnayTxBJASoJEAKdrUSu1S0ufblpoLlihHNL2Kiruzo2AfNda0KH1zYN2DiDJ/LH7oPVUHk+D1FHUJgFj8ekSixHS2V/sXz6I97zb6R52xvSiDIWcTBWSG0DrKxf62pOCJZvRp8+TKF9X+8p1r2Ryt65ukF/nfOimnk/ubNQGENnDjrRx2agFolHG386iiJQ+lzgDS7OM/nKvkbpFCNqqcLBq0SbW/ZfUEaZYsuDNKT6qNelMsxJXlih30mPvPxt6tnLUxmDs0I3CveDj8BhTHFECqTJi2u9saGhv/M94wrt1k0SnwdPNcg8mzUmcgWJ4MnrZqjl9dPJOP2HmvfE44BYitD4Rivng3k5UZTu8rQW4CnGGGx/mdZJXnBRBPDjhHMZvtqe0EllAwFsFW/Q9MJzqTgIGAf6HR2grpbPWePxEP6O9sR80rDeE2bWm3iqsscFYikUrgxC4CJY2Emjsz2ODs16pja20w/5oU5EgecOSkt4wlwMUIs8cFeE6c2dFy3VU8HQg3zOCOCkiemLYH0r4IU5nebohtFX5lp7NpD90JhbW2qtSrk3IwTqt1MlJMB2/tLO1Xial6ZOBvls6LXFcM62bgfFV0RkCYuyF2wMMIm3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(2906002)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(52116002)(6486002)(41300700001)(86362001)(316002)(66946007)(36756003)(66476007)(66556008)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?OSC//QQ7n1Eu/hOXYyTaBupXuC2DsOzQWr3WG2FZ65h+IZ2VFSJc64oAfX?=
 =?iso-8859-2?Q?KwNdqA+0fP4mzEGi9cxewa5y2KDDdtraIyyfJ/IVjNchQv/7U7vaWbVgiJ?=
 =?iso-8859-2?Q?9nzjMecUMsG3EcZtvcaMkStjyFEKzxXvca7MegzKFqOnudwMWui/hvyZ6P?=
 =?iso-8859-2?Q?BeBFqfRwIAXHtNEqNvFZ8oTGtKCMr/7eQZ+VGZCVXQwERGcLdvvDq3nrCW?=
 =?iso-8859-2?Q?XR9Q7/5FOlq7dYnOMcJDlNMJ7Q8EqqSfh0sUuoL4QZ3IJpUA7KaHI4k3Tc?=
 =?iso-8859-2?Q?zPNXAk5UisWtAug/ru32g6NgmD6RM3J1G7+4VEySNfaF0fO9/MYC7UmEqV?=
 =?iso-8859-2?Q?yKUTBDP3ld9aGJo5+O0VsIVQkLdiqTY82CEwOI0Q9S3qYROwfpE8rB46Yh?=
 =?iso-8859-2?Q?3xwOfRWywyn6XCw+6iXyRulgoBrKUBdn1fzrhTLOhQtH19ywiikbUq+tC1?=
 =?iso-8859-2?Q?iQ42wsP1d3rKz+WxFSgp4H7xIYbwOODhbZWYi3/eNtStcqQG/aIYmcoelw?=
 =?iso-8859-2?Q?6hGNW0f06bYqUsdK0pM9RIeXf2dNeQasHq8La8z+vABFRUbkjgikwDyTOu?=
 =?iso-8859-2?Q?n5ouncomasRlThrXxDOFTyK+s9/RQhefidnamnS4M8wzczwnhN8KwEPWMD?=
 =?iso-8859-2?Q?PIQH8ER6DlFVNVAQ4tbJtk4EM4NN90px+Vun3W4tLglY5SIHtJ/n4/3kkl?=
 =?iso-8859-2?Q?zaZ7ZRF7bLnj/OC+FASPc6wXFCu+OBfIzPZv5xyHW/ZiP07hBRZdkCNStS?=
 =?iso-8859-2?Q?D3ILcpirdsIpWHZkUBiby7o0SHQRHVc2SPYfNNspmWDhhw5Jw7ubATU9HV?=
 =?iso-8859-2?Q?AQ1lHF+IwHOSa9d6L/tqP/dnl/qMlgoDoRwXZnd+i5gW1SvKRdRx9wLQHD?=
 =?iso-8859-2?Q?T0Lh4ivWB4vVz5bq1zouQl8BhOe4nklHNjhs+ZIVIhb0Thupaww3gLQWfB?=
 =?iso-8859-2?Q?Gngy+NQyNnz3F1689qbfoOUufhLiHjOspK/VhpcN/rsImFY5h1pt7B33nR?=
 =?iso-8859-2?Q?FQgRe16sgRJssLj2WD1g7SVr4Ny5IBYDcH6YC2Op+Kxmvsa6kANs/8ElhF?=
 =?iso-8859-2?Q?h/V+61wEORTCQQPlKVtIpNSYWVl3cV7Tt65Rcbx0G016CudHT61mwJoYjH?=
 =?iso-8859-2?Q?K+Z5nRpbkdsaBk/iajhMEmVNA6rESHblVTCX2lC3k6PlGshI/ctz+g9l99?=
 =?iso-8859-2?Q?Uk/ZEj9e2Mo28Y7R7tvS4p4aXZQlSeoVWD9qo5cT1hG6W7kTTqVEyJC6ro?=
 =?iso-8859-2?Q?3N5froFWkCbZyrlZ5EZwnT/ZTkM1ManaiHWcsy9sEV147Of6bhCek3OYyc?=
 =?iso-8859-2?Q?zfovtiSQTVvLbMosZ0YCtKHB/6Xbqrr4oSIxMwLxcmYr1V09sxFkjomNKq?=
 =?iso-8859-2?Q?xYEvt35vwafnbMfT2umVgRdmUpFYucEM40Xd2yqHRIwXTgWOGdv8E3AEcW?=
 =?iso-8859-2?Q?MEo1dnLlR7oq+q6k9e9f6AH6yx9BQi7s7i8Jzpj/evQGjp48rrx/BtXVv3?=
 =?iso-8859-2?Q?tEI9rgeuf/pANZWhnbWT8S2RYIIFn1KsrhMEk8URxfUqg8yaeynBdQj6md?=
 =?iso-8859-2?Q?vOblaIxVEAO1AMdTy7gOJZXGy2SDJ9QGlRFuSSgqx09fgBILJ+iQ/k/RxS?=
 =?iso-8859-2?Q?hFD0jfzxOq/d5SS92zECK/MExi1Rojmw4CPi4o5nzPDCEnQWklxFQukfw9?=
 =?iso-8859-2?Q?rRWJAoEFitCMojyDrRg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 958c3642-c56c-40a6-4dad-08db5fe0db8b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:05:56.4363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0xIMXeRFHzOUOl0R3//+iUeHvUKNpkuRUMtT6bp0DyD7et8vp3UjS5wz6jNDa08uxAFZY1Ywri3Lmzu81bdrHPPe+nOc7owKC1hzhf+kB2faIEREu/zSgpjyLEu5lo4U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7952
Message-ID-Hash: ZB4QYFCPTNN7W52H2DRFADMWB7YO2RJ5
X-Message-ID-Hash: ZB4QYFCPTNN7W52H2DRFADMWB7YO2RJ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZB4QYFCPTNN7W52H2DRFADMWB7YO2RJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

No driver is using dpcm_playback/capture, let's remove these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/soc.h | 4 ----
 sound/soc/soc-pcm.c | 6 ------
 2 files changed, 10 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 533e553a343f..b98f49037d71 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -729,10 +729,6 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
=20
-	/* DPCM capture and Playback support */
-	unsigned int dpcm_capture:1;
-	unsigned int dpcm_playback:1;
-
 	/* DPCM used FE & BE merged format */
 	unsigned int dpcm_merged_format:1;
 	/* DPCM used FE & BE merged channel */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 923a66a51b18..b8b7cc48cc70 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2758,12 +2758,6 @@ static int soc_get_playback_capture(struct snd_soc_p=
cm_runtime *rtd,
 		cpu_playback =3D SNDRV_PCM_STREAM_CAPTURE;
 	}
=20
-	/* REMOVE ME */
-	if (dai_link->dpcm_playback && !dai_link->dpcm_capture)
-		dai_link->playback_only =3D 1;
-	if (!dai_link->dpcm_playback && dai_link->dpcm_capture)
-		dai_link->capture_only =3D 1;
-
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		codec_dai =3D asoc_rtd_to_codec(rtd, i); /* get paired codec */
=20
--=20
2.25.1

