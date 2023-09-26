Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C177AE5D1
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:27:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E53AEA9;
	Tue, 26 Sep 2023 08:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E53AEA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709616;
	bh=PXQs/DWbNUUrKddiSnnr2WONN90QtjHVKv0is9K9C5I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uRBgXYnIqePzy4FBujB9+SFrgYB7MyK2TACh1Eb/Pxy7TEDWpJu/cLdpbwrHA6Zlw
	 9kPA7JH/AWylnaqY8YSRWsEAYh91ghRIiifSlyGPDdsV/FXqjAg2EEBQwB7VOtrUH4
	 1VySW24StBi+ftU3WJjqMh8jdITFO30D/V6ZjZhI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37941F805BB; Tue, 26 Sep 2023 08:23:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B138F805BD;
	Tue, 26 Sep 2023 08:23:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B80AF80571; Tue, 26 Sep 2023 08:23:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11D99F80130
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11D99F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=pLyp+nTm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H14SCeAoS+86He8vpXa7umPcQ2OpZtlxjRU3Ou1JBOZYtJJL416Cl4CKMaEBl8tglvd0ApweiBHjZgJPn0SnAsILwFsivNvaN8NSAa5Mx57qSj/0J/n0qT3qRUgUG2KNf8oR5DOEYiT+Cs+z3QOKuzB80wklLml0Q92mQMRB0ubz7DmG3GNB9CyIt8NlYp0wy12WDyPzvG7byqE4a2/sHPqeUxtRPp5590NPkb8mnxJlry5ILyqfVBCB6ACA9rigy3qcVtouI1t6YLaONo6lMt1AJBeZ+aKZuankoqtTMz41GWzIAN7PEolQ3j6FJujzX3Ibz3IOEtngUEP5vyYrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMx1lf4xWSbMrH9iiXaAF34eD+/ZOUuQFEbQPQeewPE=;
 b=K5Pbm+65GZMtBqXG9C3KUR2TmQDT7ClNQ32fhoJTck6D+m3gN+cImiG0mwjBOnilh5IlCQUe9CK3/QgMz2VI33sXmUS3YUlBrO+BrJX7iMe0/AyFHw6MVm5QbrtS6kJdb374RgrszTihHM0MnN3wO69oyNa24sbhXM90aNK9ZNW5gx9lniYWTLLVfS8aHm/AT53BTEA0a4J3GMEd1K7I3FY4uIq9vyOMx3dDzoCRWH0L75m9WlJb+S18ux/7m2pWHCtC1TqjUvuXABkkDjqTkTNR0mRSslKzFfttvPZ/xAWPPlcHy9bpxGd3VnPgsvl8V++016fbEi2viGrA/i1mAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMx1lf4xWSbMrH9iiXaAF34eD+/ZOUuQFEbQPQeewPE=;
 b=pLyp+nTmkY+BpGvR0O5j4rpEc4Cwm6yqxtt3XKqoQrCIC2F3zBLZWs4Uh0IC6TPJwLYCsOoenrh0AJu+2RPYagthj0/j9WWPYnIed6P7MVcoLyIpDvWmjl6EZV5wdn1IfR3GwotI3q3G+uzOHB4aqMEN4A2wp8uGcapNbbTjAMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10364.jpnprd01.prod.outlook.com (2603:1096:400:240::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:22:43 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:22:43 +0000
Message-ID: <87il7xh2rx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 22/54] ASoC: ux500: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:22:42 +0000
X-ClientProxiedBy: TYAPR01CA0096.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10364:EE_
X-MS-Office365-Filtering-Correlation-Id: d9bd6093-b720-4ab2-8507-08dbbe58fe04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R3mO7S4sd+jk71YrC4bB7uOcrFk3oUwdqfzomSyj32/RrKe4iW64WR5HuKOfNmkvZDEh+lxTtXmDgRVHsYLoQhffLtC0o3MrukMdZzj0iHBHKhXXqxiu2K4a6n8fKC/R8XEvC7Ua3TN+a0kpZp2geoEx/mXIY+1JOcGTsDn/6EHNrvYnrEtevBSnZOuxNNjXL3TjNI1TVQc1Y9cKSyAOv6Blrfp1vHZ934osNpnQ87Dr4uldBrs7+l7DQ+Jul3+zieRfNyM//C3tc+0k+9xCGCACHI0mKhBc7h2iGKaobImabMZMbo3VwymG6rFnggY+k/iZ8u7Nma+ymOdKCOPftA12CFtCpEtaxGzg00W4ZRx2g7lGrX440xzUMzHt9vbsWkBU6aSduuY7BqKJ+qzXG2JaD3zwWXI85oLja6JDmKpS5xLFgpztF6YR7kOZxs4VHHQ6z6YapXdeMM3blkIi1lROo8BMWXe8OHwDXzm4fpYO7VLe8TSMTuX75Z7Q1ocdY3ljAwl3LdjvlWEoGVS08+gVVc874Tk5MNMv5SopWfzqNGURTQ0+VGVEWwvVTKJo2rK4o3bKVTrFvOKiQxcDaXXLt7kTwl7p4WjFqzgHHExk+4YTMzR7BKwTwKL4WttyvyD7yRZh0Jxus6c3YuU+2g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(52116002)(478600001)(6512007)(41300700001)(38100700002)(38350700002)(316002)(26005)(2616005)(5660300002)(83380400001)(66476007)(66556008)(6486002)(6506007)(110136005)(8676002)(4326008)(66946007)(8936002)(2906002)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z+XoOI9W+q9z0llZDTu9KqqITWcrNshECDecyirwUwbFRG6HbYVXe+xVVnfH?=
 =?us-ascii?Q?tPR91FfhWu73WmPZdxpO3fA1bfKkRkIbejtO42eJvvNXAc27CpKhKwHaeHzR?=
 =?us-ascii?Q?/ZXNHRE0ezE+dZCqa49XbzJG9J7XKcA4WZt83QjwMtf/OjVfJU7hkJYg1+3L?=
 =?us-ascii?Q?x+/ppfGZNFsmgYwQECvzKJ0aXleWtVrLFQZZpqMi02Ptu7YPiVDIvMSu0jl8?=
 =?us-ascii?Q?YAAXDKcudX7ea7NHW+nAB7yn9TiH38wsx3Co+iGmpJHEJrfciS3F6vSatj7Z?=
 =?us-ascii?Q?ScUni7w9GDYcaT0wxbREhXPNqf5qJaujQhmC2wp/e5dcw8/LC1CqqLmjJNwd?=
 =?us-ascii?Q?QOo4ZIJlknYloxj+w4zrgDFDPR5l6D8bddxNR1Lu6AcepCnsvtndIHSpU64S?=
 =?us-ascii?Q?1jbXFm32/gIF1KpW1tgTcUcgE8xfErobORcsvPLYfhVE5bUgsjCwE88DP0Ia?=
 =?us-ascii?Q?YDqe2niQ1mwM1lW8zc8hNUXFgWK1TepUoDwsOZ2r3ZUYJepzfl/gaTDt0xYP?=
 =?us-ascii?Q?vUFf7L1oa5USjw3mUgJKqlrS35NDNJhF++as2peqNvRWwhz13SGdnu+eQZny?=
 =?us-ascii?Q?/7oaeS7sEAe162TvVm6f7EtDpDeHVLdFPaLJnEPf3XlNE0H9Ns5hMgpQwnE7?=
 =?us-ascii?Q?x6sgE4Iko5M3OLOtW1V36+3Teob+YCioxk+p9D8j2HwH0u3iebps5jGI6fcR?=
 =?us-ascii?Q?0u2YTM5Ye6cfUB7FG56jGmSrEEftnH3wdTEuZfc3fTtI7YxuOfnrMBaYbHyc?=
 =?us-ascii?Q?bJNH7pndj4BbkJgR5C/0UwrlMDviawSADANKX80oPLhF3KD3MPeor61T7YMa?=
 =?us-ascii?Q?N5MOLjfKzXbZiTuP3aU6PO9KnYU55sP8U5i9mewp9CNjfBW1wYVqavyVgi3K?=
 =?us-ascii?Q?cim2pi49FicOt1pvhWU23nsfb5pEYE3j4EYP0tAaYNrezHhGEbs/+h7yzEir?=
 =?us-ascii?Q?UTKP9NRa3zUSqEdhCRyC6sZSYx2uBbvCMAK34hiHhdzLN/QJQZ9or8y7zEZs?=
 =?us-ascii?Q?kiQYJNZ/V3N3eTZEOs8wz0MHqU8AV4WkT5FVZyWdQAB8fmf5LzjzHgh9F2NH?=
 =?us-ascii?Q?Z6C73a8ZSvyvQIjAsjXWyIbKzTmmDHyPXs+SAhKnKRymYP7msTcXCY6spXAr?=
 =?us-ascii?Q?6P/DkShNugRpTovt9xiW9PR+MIQadR+jYaRDANoVs1cOehrLOQ7ADtD4B4oE?=
 =?us-ascii?Q?KhFMO3QJF56RM8gYW1TBjVHPVA00CvPB0J8hPmuMIEEUa14XZZqByhja//St?=
 =?us-ascii?Q?CgdmcYYrDEYs/t0YT1q8wjK7oSC6jajKVSKx8peac5gWkUgIYMt55irc7Dwl?=
 =?us-ascii?Q?TY5jJBVrHODrvEp5nUW1wrfu636r4jnl5vmomnKaEmmlddxIrU5CPZ7T/f1n?=
 =?us-ascii?Q?jPK6zBzp1kAs4MP/9uQuSgidoPEdXEbilxvFHUc9Xi6tnh8EcKhxvfhvGWZ7?=
 =?us-ascii?Q?vZ/qp35zgKyNBs9tOkA1jH2B5xPxFE4P/QUx0sNDrsPznpRSsiTeVhm6v1zc?=
 =?us-ascii?Q?wk00CWcHTi2RZwxyo3CGtVcMHy5QiE2Ed/Q4wZTWPuw7SUO1vOhPb7o4RMDg?=
 =?us-ascii?Q?DeH08oEvdliBM2K4YhmO304iCygcQedjRVAj9SbS+TAXUkMgkyV7VBkZ3arN?=
 =?us-ascii?Q?7QPmD3mEBQY0neTMJmQLRmA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d9bd6093-b720-4ab2-8507-08dbbe58fe04
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:22:43.3771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LeDG9iR164XhOpWJlsMPrGv7DjQRo8XUl3iScmDeJRNkkleOVCBGQBi3WXwcMmYIaRi9hidnNUpm4B68nRX0lhQR6+gcWb7tY2xk4E96aHmooUbdWZE+sPQ24UA+dYsp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10364
Message-ID-Hash: ILLTIH3BCCG6FEIJ3HR7OH7QETJ3YYOP
X-Message-ID-Hash: ILLTIH3BCCG6FEIJ3HR7OH7QETJ3YYOP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ILLTIH3BCCG6FEIJ3HR7OH7QETJ3YYOP/>
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
index e5e73a2bd9fe..710b6744e013 100644
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
index 53b5649cfdda..b7f38873d2d8 100644
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

