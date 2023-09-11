Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFCB79B163
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:54:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6415E94;
	Tue, 12 Sep 2023 01:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6415E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476493;
	bh=TIUJ3MOkCtrYoW05uwe+K4NutZXZKdRYD9yO6SJAB+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bA5gHPS340TTuRl1Mc/RhR/MzlPxVc5oTZGUdNYsDFYNQf5l7IE4zl5xfCLb6kCvq
	 2roQaVw7J+FNDB0+XcRRjL/cZwnvpIao50hpNJoOBKCenUQSem8aGGHZYnoBUfZ+y0
	 zyvl8JXxQ+K+EorPhvKYkrXDuqAw1Q9aVmTSdF+A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67CC7F8065B; Tue, 12 Sep 2023 01:51:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1335F805E6;
	Tue, 12 Sep 2023 01:51:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 149EDF8057D; Tue, 12 Sep 2023 01:50:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E1B1F8057D
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E1B1F8057D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QlbygcXT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mu/8jWE1G/B/kjFynvQHVQ+mmrdLbZHkqGNP7r8GKvs9doQiuWg+W+y/P2IFj3abTcLBSVp2q+cwwHoEa2GPMf4NXeUpF7ARgtq2Xa/gmmUrL/4DL2Xi3JWlNVYha5nQFrFtiY3NoU6ssg496jgb8Zid/HP7rpr5m7gPlMgHHJNYbw4PuJXLNwFTnovMSZ1rTOWSFy2RgFh8MWpELEB1vT+mm/eHGK7ULviBKcOkuvZ5sT4BXBtMKwwA+X8UvI1gO9f5X184deL9+ygfYrJ/emuTqaJjMdFSsiF7BINsJITYBrDxng4U8LLwkQTNsyQK0Q0UuykNhImlX2wsasKSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCbNLHldithQ0xyMTqWrabcJ9X+QbH1CLgPDh9lAoZk=;
 b=FOcWrKTRlVhrFgNLujsEXnMN3qhCDKRSqy3eEJ4CWyoHVRtvhtqNVgPlQ7dHplIZDkl08eKFfqXL+PT8qh34pHyAujUniwaZTAbo5LqftXtKAZriNo2kyj0zpTyJ6dPj7pVjTuvDMmpi0ZK5mJn3DJtiOnDfG7ZZ7Q1VVvKwC+ZUFoe3DHkj0Tg5+78YDGpXTI+ikVu4y9D0Nq6slgLrMGGp8QZhWZqtqczYmLNGIsEeRWz24/OzWvVjaanSv5SLv7erzJZL/2wAeOH0uKgmp18JLfDBmWIKWQScor8Plv2Dw9CxJtlXsNB9yDsGF7phvnuRbifNIoEinSd5vuF51w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCbNLHldithQ0xyMTqWrabcJ9X+QbH1CLgPDh9lAoZk=;
 b=QlbygcXTAsN28RB/CrWW1ujIw97nzPQJ4oWjhZIobKMAkWcGwCT9HRYBfsCyXxb/OnHtC1N5cd2BulS6LYgtZiQri13gOMXnFF0rHmWnlWn0v6sLQsfEtsQjCH78Eg6bccIaT9/NvNzLbiLw3KJG41WZ3kWD5pblLdx6CwySUtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11567.jpnprd01.prod.outlook.com (2603:1096:604:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 23:49:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:49:24 +0000
Message-ID: <87ledcqni4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 22/54] ASoC: ux500: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:49:24 +0000
X-ClientProxiedBy: TY2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:404:42::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11567:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e97bd9-f1e2-4318-20bd-08dbb321ba48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	82kE/Do0Mf7b86F64EJ8oQ79iZqxKrpNzmd2A9bqKxeqcQmoHRfYtGwUrhDGMxImCfCudC8epRxisbh7y2VQkc1pvIbjp6N9K9IR6bbswDBtJ1nXC6o3aJMm0yVL+dkN3n4vsyYN23+KLrj26oDfOHi2k43VrtdXiDhq/U5I4bqJvjPHAmZ/Ue++qGKPZorijpCUnLPhosmVboJCSUjg+dw58CLxqejG/5nTdhPHOOv9U8W8CfeGmuETrxIw2Jzn+y3jz2GqmYi1ATqHTgx5B/XXNV9TZe0+YoTNzYqwiF/VSWksSuaxMLL4h2GGdawfHiJ6mzuZMgI9f/UUDG3cFltZwJUdsH2DoG9VODTXmvXg6KOaRyoQFRb25c0zlo2I8JzXB17AtrapzNBHo2fqej3vSmaHeck9073GakpoSkz9r/5rdhPhPjSoQyhwcgTX0ulpVtmfmClava7xh/YavSYdJHjefyjmBe1dV9G1y/MdU22NvA1hSCZL8o4Z+hy2X2QqaTxPMr8evHvaFA4k0vXlvtODUQythKFOUPL+wjQDiGy2dDsowRHPre2wSuUFFyOHo/+OFQ0hjnoN7IXKDO/pBvDpdpJslrtyCwY76zWWrOrjCWHGnZniWbdqfwyqoEXRO+SLX08tvULndWkshg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(186009)(1800799009)(451199024)(6506007)(52116002)(6486002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66556008)(66946007)(66476007)(41300700001)(110136005)(5660300002)(8676002)(4326008)(8936002)(86362001)(36756003)(38100700002)(38350700002)(316002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g7sGYSRSM9zhcUKkn1/xg7sNBzUihPkcAqEh0sPxh9yJ0Qv5jPmx4vH0Re3R?=
 =?us-ascii?Q?qrC5EVZFs9cKncbrztEsnVr2SjD/fXRoIx8D1xcUit1U2W3qG7FjdsauvC7m?=
 =?us-ascii?Q?3L9wUPZLGH2eByM+3hdRqpY/m8tbegmHVNk+AiCiIEk8lL3F/b1jBLG9U1oV?=
 =?us-ascii?Q?LT3DlOb12a84/loZKGboElIAeXUmWYM+jJj4qzJyNPlo/g0FqgAoKhycPl1p?=
 =?us-ascii?Q?3KrT90i9guvf5XzuRIskbSOy4Orp0OXxF60mlShd/di/vExzIWKtCYNeOy41?=
 =?us-ascii?Q?KmXW6FGFUgeh+rKdw3n3ffq4lnoj35YkF3J4DlgBnjg66rXQP1j+M9V5qDVC?=
 =?us-ascii?Q?Fm1p5EulVQKWoJWuiBDCIcuaMtLFwkBuQVvxCGwor09Ovw41ZPKEQJRl3kEX?=
 =?us-ascii?Q?UtFg7K4HtFDyu9QPDqStkh3A9tMpY/dQ3vOKtpbzELzGs/ZbRqg71yVs3M0H?=
 =?us-ascii?Q?ba0rW9rxILxf5odyPOD1A/vh49zF+oKbeQMi3qpumXLAJcZkFRK0tNKo5mpj?=
 =?us-ascii?Q?zwgudAbH8l2jxkYV0nfpGhTb9U/1rp/K5aEKu6pGeeYIAvhIK954rawuwPL9?=
 =?us-ascii?Q?hmivf4S3j3+AhfAC3Rq7vlg4ITYMJc9ZhHtvHwwIuR+alk5HQH8x//j7/XQZ?=
 =?us-ascii?Q?+1NgrlsjwAvni3uL/LBcQR6TlEJpaU+FOAousXWwVXy89/adANsIp+U/BPty?=
 =?us-ascii?Q?GN0KTfTnYqt/jf+gFKCQEbC9UaDak3zqZmDr70X8c7ZUVRblmS0I5lki+7nH?=
 =?us-ascii?Q?KUjdKpVY7cvQjFjwfJ6duOkov12NJuLYtShn4sSeYmSKqTMGSmRMddL49yQN?=
 =?us-ascii?Q?j6Dtz+8Lx/5Aw6u8+VCF2XMBaWDSyzc52btbnSdlMrr0NDzo9cR00+hQCvV/?=
 =?us-ascii?Q?MZ12lyXjqz41VVDchhGQzQmiPooa5TwTT/ISgJLqAn0fctPQnm/Cj0HQjJer?=
 =?us-ascii?Q?1kjkG6KXfwOCmE6X9mHzNBv9JnqEejRGJ5mHnikrqifGXw5IQ1VIGnde06tC?=
 =?us-ascii?Q?e2uSMrdExJqIyY24YH/Hrs+jpuKdPTI/iV2tgc/uoNkN8SeJzeZSENrTNkkR?=
 =?us-ascii?Q?NHC/yjv1tlxsSP/O9RyogQCr1oBgErIW9/g1O6hD5PaKBJTSOmmcFVTi08V0?=
 =?us-ascii?Q?7NCJnbSaK00NWPoG08rebhZ4acgOfLStxL5mqRqRMLQOvU4cCc3hUrx9LPTc?=
 =?us-ascii?Q?Uy0VA3bZMgNbI2sfhgvnnZ8eb1Ivo+z+5u52OHHXNpL5vie71I3oCaEvx278?=
 =?us-ascii?Q?nIXdGkXOCvijsdFKAd0KXZNeewa/98YtzlJpGim9sKZG5FZ7Lwmpi8SpI1YO?=
 =?us-ascii?Q?E+qNv8fqh/kgWF3nZQrx9maroHUIFh0KAWJpkPHewVFFBbzfVi2SbkiGQANE?=
 =?us-ascii?Q?d7/DNXYzubqJCM5jml7DUayKpJ903bxN0brCe8k8lzmBjMlI3vyvXwlzRGBW?=
 =?us-ascii?Q?IrDwEhJUc+aLUAA4GNMgJsn3+Gazl6Ek6+SoYeWsMq6WXpCxR8ook8xEazEW?=
 =?us-ascii?Q?IkaCbsIA1vqd9j42QpGgANsoKR1zz078Aci5Ue3S7CNTySD5okkXOo2pT2XQ?=
 =?us-ascii?Q?s4RJ1uaZIERIN2Os3viz4B5uvd3WJ+ISjDiYMIdou2QXI/DauW4kL2AIR4A3?=
 =?us-ascii?Q?UK1bHaMZJ6D2g20YFLELoIU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d6e97bd9-f1e2-4318-20bd-08dbb321ba48
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:49:24.4646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ig9MTdw2ybyqHwWxU99/sOr1SvPnIF9mFnvbtgUbmQu84JsSjKrd6DMUIB1xymNgqI9dR+l4iG4h2xSSz0jcNLl8BvV4Wpyw42LE01+d8TlLXw0K1tnlE4rUTvIq4sLI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11567
Message-ID-Hash: 4EODU7WKTIKA33ULDKI4A7HCSX5Q2XPM
X-Message-ID-Hash: 4EODU7WKTIKA33ULDKI4A7HCSX5Q2XPM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4EODU7WKTIKA33ULDKI4A7HCSX5Q2XPM/>
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
 sound/soc/ux500/mop500_ab8500.c | 14 +++++++-------
 sound/soc/ux500/ux500_pcm.c     |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/ux500/mop500_ab8500.c b/sound/soc/ux500/mop500_ab8500.c
index e5e73a2bd9fe4..710b6744e0136 100644
--- a/sound/soc/ux500/mop500_ab8500.c
+++ b/sound/soc/ux500/mop500_ab8500.c
@@ -188,7 +188,7 @@ static struct snd_kcontrol_new mop500_ab8500_ctrls[] = {
 
 static int mop500_ab8500_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	/* Set audio-clock source */
 	return mop500_ab8500_set_mclk(rtd->card->dev,
@@ -197,7 +197,7 @@ static int mop500_ab8500_startup(struct snd_pcm_substream *substream)
 
 static void mop500_ab8500_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct device *dev = rtd->card->dev;
 
 	dev_dbg(dev, "%s: Enter\n", __func__);
@@ -212,9 +212,9 @@ static void mop500_ab8500_shutdown(struct snd_pcm_substream *substream)
 static int mop500_ab8500_hw_params(struct snd_pcm_substream *substream,
 			struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct device *dev = rtd->card->dev;
 	unsigned int fmt;
 	int channels, ret = 0, driver_mode, slots;
@@ -336,8 +336,8 @@ static int mop500_ab8500_hw_params(struct snd_pcm_substream *substream,
 
 static int mop500_ab8500_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	mutex_lock(&mop500_ab8500_params_lock);
 	__clear_bit(cpu_dai->id, &mop500_ab8500_usage);
diff --git a/sound/soc/ux500/ux500_pcm.c b/sound/soc/ux500/ux500_pcm.c
index 53b5649cfddae..b7f38873d2d8a 100644
--- a/sound/soc/ux500/ux500_pcm.c
+++ b/sound/soc/ux500/ux500_pcm.c
@@ -32,12 +32,12 @@ static int ux500_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 		struct snd_pcm_hw_params *params,
 		struct dma_slave_config *slave_config)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_dmaengine_dai_dma_data *snd_dma_params;
 	dma_addr_t dma_addr;
 	int ret;
 
-	snd_dma_params = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	snd_dma_params = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	dma_addr = snd_dma_params->addr;
 
 	ret = snd_hwparams_to_dma_slave_config(substream, params, slave_config);
-- 
2.25.1

