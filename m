Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 245EE98992C
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 04:17:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A22D20C1;
	Mon, 30 Sep 2024 04:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A22D20C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727662622;
	bh=vjNpnhzqDXKnDqxEBw5ae7eG6dClwdQsA+gJ59PpyqM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ichUG8RpCAmYO7/pxM4kO7DoCF1PGsByiOcox85aYIZUekXvP2UXgUSjmwoz4ieBf
	 oDQQSGvYzGNhELkMCNX16ZLG1XDhetnmguuDkJgUAs3rrBRlG9MFdlo4nSKtqQKFou
	 cy4An2l1sxBdUl0/dbVxVLLRV0oIt54FgJNJzKuA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F9DCF806E5; Mon, 30 Sep 2024 04:14:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6774F80717;
	Mon, 30 Sep 2024 04:14:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC184F806C3; Mon, 30 Sep 2024 04:14:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0D63F806AF
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 04:14:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0D63F806AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=R2JLYucD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNw2oSAbeCQVoMI68DbOXtQYxWzzOS9oVONztNZPm788sxlzk10mbxAlZVG9d16+A9tee1eDmW7piD5/KSErS0Nph/LozyIMoSIcyqKQxqtivpNpX4hetSr4R4KpCcctZphGl6y1S2X3To2B5rihDZaQqWSkQLO3a3EriPdSTRA8exeb1bMDDfqRbweM8o9FaDd7jqgR7yzDalLtYStOzoePV4AIV18S5kXUAfsKQrfPbRIXuRi4huuwBaf9+wPfH9gnTq8RmAjzh8E0lHFlDXPo176Cqjvw4+Q8RcKwUNMQA+p3A7k66qnVxcJD98WzonDX69e1sJLi1mUz9FDP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qZznr1N8LMHa3LmfkvpMN3i4ohaD3VbMCuyex1GicM=;
 b=sR4Uz0XU5ZELuCLK0D/BxWtjIBXsjP5/pUZO3qvbK9Vwygw9HGVD8qZ0muPiWJgifxe7aMV700bNkIpE+F7Suo3PtlIy2ldPIdXiH+zoqW5QaRt2r+foq9EkGdT9d5tb4UpBSsfSvfdJtcCb9dzr91JDJKfO4Erd8BqO8QQBd0N0HZ2z07nQf4flvjtkks3yfgMcbvFGRueDB+/vZJbeBZ+Nk8To4gi1928SvTY5Vbx2psnkyu+PhKfHPhrXrlp33q5xeoWM9mmtN1083oos5EgiSPv46eLWLErdG1m9kas0aL39rX48etlCJQGMoPEQWiBddBL1CIpi/DCSMOsL5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qZznr1N8LMHa3LmfkvpMN3i4ohaD3VbMCuyex1GicM=;
 b=R2JLYucDp14JiCe1I/frOEEWYN6Ry6ncdWTN7ESIL/+e5pRUTEfjZ5VTWfbS6nLP37xunlwSrkxibNt6kOrGhyeDId+pz+annbZ7EOl4E0PJzstPJIFrgg0ekEceQc4QNBDlakW4jbKsKerMAycUGIPDLrXC8fjaAGMj66nIZIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5798.jpnprd01.prod.outlook.com
 (2603:1096:604:c3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 02:14:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 02:14:28 +0000
Message-ID: <87ed51lwfw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 09/13] ASoC: soc-topology: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 30 Sep 2024 02:14:28 +0000
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 2061d84d-1993-4838-4ca3-08dce0f59cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YGVcsA08ypfwzCSa+YIIBkff1k+HrFpJIDIOAmmetBdVx/w3upwRnHzCfFdL?=
 =?us-ascii?Q?Cg9LHR0iwBxZALOu0MrLtV5qamhbgc+7PdzMp7wBBL5MkoVVVAvkErYN8T30?=
 =?us-ascii?Q?5Zkt23oYpUacqC0dUg9CuHwfFb61QaLI3kHQzhWTTCE1PUkuvJNBCm9r1ZMP?=
 =?us-ascii?Q?vipuQivC7Ms1cNTz7hSYiniMpKdZnkVC4DwcFbTesSZEtxZ13cX1NhzpeyLf?=
 =?us-ascii?Q?BayB/80Xai1RNbVh1VilGSPAHiQmvdl0bjHhfWg8LQWZFgBfuz9umJgbJVPg?=
 =?us-ascii?Q?6o3cWILKVn0cYTDYm4oAXqS/sfViprAMDGxFaMNnVS6PB5Py23m39u9RogA4?=
 =?us-ascii?Q?bmybPO3/iJaayURBNDVF6xkMKMSoVeTvi8YYXhmtcPdHl9gEGCpd+ihr2oLT?=
 =?us-ascii?Q?fBqUMX6XLvSRqxTZI2GvoIVqgF5vbuoNfgw0C/5GUeEtt9W79pVqYqYvVaiv?=
 =?us-ascii?Q?Hhn0XpG1b7yre3M84P3OOdya51yPJTvMi+gVHTdcgE1iKeruEm0uteL8vnQL?=
 =?us-ascii?Q?WcdtBzAKxR+dQ3XJPDJXK+XMtuHaIUbv8TkZn3o8qzmH9bvY7EOD62yFOcyv?=
 =?us-ascii?Q?7W+eL0J+I3uwiwpS16WnntB2xTyWTHKumJSOsh/ev841KH055GLgDzMbOX51?=
 =?us-ascii?Q?cpq7H1uxDmWMGzqbE9JKhBZEqhet2QIbrriTFfnM3YUozzii2beREGgKd+uq?=
 =?us-ascii?Q?4bqc2BGBYlr5E/f3Kw6cA45pY4cmm16W7sdzWwyxBU1xfl5bpj/hN7U9Bs5c?=
 =?us-ascii?Q?6y6vjo1vZv5wdlAhZGNpVaPQQtEZCyLmKoN/hYAN2a2PunI/M5Idw9Qqs1Mr?=
 =?us-ascii?Q?qR9G/G2pmHnW/FKKWd/W8UT8fcJBGo3wTmQRnd6EZSYsTv7u8kbnvJwckxAr?=
 =?us-ascii?Q?K7nQ0q7HSSwpHel3dSxT8Hpz1sdO2hbyLuDGQAlY+iaF5mbfOpVg5pVzurJh?=
 =?us-ascii?Q?WPMUjpICf/AntI4Rm+BOk5SKXpqWZ6gGIYsj1IJ3FlKz1lRZv5m/JOPocOZc?=
 =?us-ascii?Q?f5bPOLwS1izp7mgrjd1unZlRd0eiI80DifHBuZl6iORwfCDafzPohwQr9iJD?=
 =?us-ascii?Q?aKB4GxcziRO4NDbL3z1UuH2uSJeMdrjBrJk5Y6XofJzRh9Ve238D/ah44dWC?=
 =?us-ascii?Q?EwFL+1m0ubCMESE6OZeAL0U/QcRSfockklxvlM0VpH5qZSAjYJtGth3fwTaz?=
 =?us-ascii?Q?s/UfbTaMgHI2S+WdTuR9ZHfVM4badv0dpSd+ll99o7AynmXsBTLQEUOc+0ln?=
 =?us-ascii?Q?obXo1wdSZpTXDORe2YC2hvf4oKHKGrhWiiQPx8V01uAoAnT6jFK9ODPLjKJE?=
 =?us-ascii?Q?NGdO7M7BAr5hyUq1L+jvfhbVJXADdejodZGh+DxQqfi1kwLJj+06rmwUSOhj?=
 =?us-ascii?Q?twneqbKUrutHe3XsSjCVWmVr1I0z2QzePly5dwp4dEIbGdAGtQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9frARU1mp3Q55OG3R+bBAHxw41GYB8ECEe23y3I1lApxSpyg87VApHbN1efE?=
 =?us-ascii?Q?eR9mi2mu1GPC6UYipFta0E7O+Bf9muPXFpVepzlG4l5+wQbc+I7qVm/fPUeH?=
 =?us-ascii?Q?2a7V1sKb9/ebPQbjr6ifcnVPElDlQk28IQQd8ZYqAOfb0dBLFLxBNz27yBcs?=
 =?us-ascii?Q?LDx1u+viuM0Qt04DVnF4oRIcYCWxaAVVedKm5TGcBEactQmWeXVc9zodJJov?=
 =?us-ascii?Q?mwNSZrh10zbs8m7UeTy4mIfLJemc4wgfPNL1O4qhpknk5cjW/boC+e71qevu?=
 =?us-ascii?Q?sHeEbu+DL+jox2Y7DJbw6sR+AZzLED2L3ITGh+4NxH3Lu9zFp3Gz+JiUEYMJ?=
 =?us-ascii?Q?ijtHkJ1cym8CRlJz4lAAjuxOstFXdrlO+ud/AL8oK6I+ZHShBPIlgwYlEx2M?=
 =?us-ascii?Q?ScA3uMj3kmB9kaRta2bFS8MNb0ytfnj0z4qdf78KADoHTsFFzQCIJQwj6i3f?=
 =?us-ascii?Q?sh7yILSqWMGVnmsZ1GV3+K3m3L8ScNhGGlK0r7AlpGoFyjmwOEuUE0jOPYRR?=
 =?us-ascii?Q?qUI0T4LlXp2YSQJ6/f2M6to1hmaazNE1WN+Tsjg2Zz5v48Ykha/59vHEZAy0?=
 =?us-ascii?Q?h4n2h6Wn2XcmQoQfiOjH6c7bqa4H6Att5Y40HIg3L/Kxl4pwXBFevHWATLe4?=
 =?us-ascii?Q?xRKKgSYDAKF4zbIvTrJVocdbEH3i2EZ02oFCJi9t7ccyLFdmrLQ32QohFMfr?=
 =?us-ascii?Q?FTbtfFKfuD8FVqbDxs44bJhE7vuDTTAZfCeEJ37nH0IQKsMInu846t6aZisP?=
 =?us-ascii?Q?4flifHCIlJLktj5k4xx6QXYrxRFgFiLqUtHSD+rM+KWhLeboEtPU54z1B3oz?=
 =?us-ascii?Q?WYI5CoI1tFS6WiQedMNZ+HAVOiBdM3g8z0xQfY2+8dZjgdZwDU0jPYqerG1y?=
 =?us-ascii?Q?rjCdgmbctIaFI1xvrdmZOz0psUIMexdrqGkcMXRAvyv93BiYEgtZ88Pir0i3?=
 =?us-ascii?Q?2lANkHLG0VQjUdRzivBlEpiciQqDYMRc6P1M5TnNTkDTFMgWlhHAZxWo0qBW?=
 =?us-ascii?Q?DTZkTv2I08Aej6//AsgdLJ0HLEiG1O6IZu+RwjRI+4mDwPdA812Hrk8/aHDE?=
 =?us-ascii?Q?jeo5X/YHE6d713jtoDqxZevhHxVbqfAnjpQMBvVhirJthgzI9jneSyYJMKtz?=
 =?us-ascii?Q?eflr3hKOpvfLmMrxMi4VYG+z9oa90DUSEuWvPFWDbxhhgbLnnPYNHdu1TefJ?=
 =?us-ascii?Q?DSvdq4TSmHtsFiY9CzjLeYbqMnn7OMOG6MKGd9W5dQfZs4N66SnePymz3uAL?=
 =?us-ascii?Q?++znxK5wyjOPdNTpHhz4uEIiIlUXnaPO0wDPGKWCpTruoSppEXyEvaoCjr3k?=
 =?us-ascii?Q?sHg7EB0eDnrZwGV4C+U3NfguQITtfEwm+CL2zIxl/EpkQ/P2r127lVu9cIDu?=
 =?us-ascii?Q?09wBOjMCMGIpNqvrLnBH3JHCgiKgm/yT9l75tywjOQ85r0z3wcT/fKODM6/G?=
 =?us-ascii?Q?At4LqsSy4LU879Squ40OsNovu3x31w8ED+JTsrBzkofEoAycWtZfRD+e0oQ7?=
 =?us-ascii?Q?CvVQoly8zxTH0zMe23SHjoP9e1AkYImkDTHQc9Yxlt4AOCk11A91fSXppvnX?=
 =?us-ascii?Q?cD+XCq1UaZhly9HbmZvJjj/AEYrTou4tJFYhTB9rK+SKa2novs3Sx7vhmIcw?=
 =?us-ascii?Q?RaH2D4Y9Y/aMLH2fWoEy5Q0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2061d84d-1993-4838-4ca3-08dce0f59cc9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 02:14:28.2660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GzPfXraTC+CDFpFoBzYSdCh0pZtr5OCO8gMHTG1PYwkgpjoea1tciQRJU/ogz1ZdIO9eO/EimGRJYdmOVOYixvmD3VfIHMUUCPoDg43+KXGQDwvRmKb/EGmS4JQaqKMY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5798
Message-ID-Hash: FBW7IYY4563COU6QELQLFA2G3R4V2VWC
X-Message-ID-Hash: FBW7IYY4563COU6QELQLFA2G3R4V2VWC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FBW7IYY4563COU6QELQLFA2G3R4V2VWC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology-test.c | 2 --
 sound/soc/soc-topology.c      | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index a2b08568f4e89..c8f2ec29e9703 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -88,8 +88,6 @@ static struct snd_soc_dai_link kunit_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(dummy, dummy, platform),
 	},
 };
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index af3158cdc8d54..93d0ee68059a6 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1544,8 +1544,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->ignore_pmdown_time = 1;
-	link->dpcm_playback = le32_to_cpu(pcm->playback);
-	link->dpcm_capture = le32_to_cpu(pcm->capture);
+	link->playback_only =  le32_to_cpu(pcm->playback) && !le32_to_cpu(pcm->capture);
+	link->capture_only  = !le32_to_cpu(pcm->playback) &&  le32_to_cpu(pcm->capture);
 	if (pcm->flag_mask)
 		set_link_flags(link,
 			       le32_to_cpu(pcm->flag_mask),
-- 
2.43.0

