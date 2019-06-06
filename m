Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 038FC37C3A
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 20:27:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1A5D82E;
	Thu,  6 Jun 2019 20:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1A5D82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559845638;
	bh=ADTqllfdRiIunSDCLkG7ruIysBQSkEGx76leGjk7+rg=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BwtZi3xSTfWOJfNVSTDj+Pi9dqqSpSyc6+TRSOEPY2mPsLJagJogp6Yb29VYQ3ML5
	 yUOmED+ojibmaPJi0bezNED2qXXImMn50xvV495BTE7D9XmsOAti/Mkp3D3YA8qygL
	 Ki7iCLMHLEk5lzTqt760SN5R1q7Jf90WOdqGdBmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B144EF896F7;
	Thu,  6 Jun 2019 20:25:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAE74F896F7; Thu,  6 Jun 2019 20:25:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80074F8072A
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 20:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80074F8072A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 11:25:19 -0700
X-ExtLoop1: 1
Received: from irsmsx105.ger.corp.intel.com ([163.33.3.28])
 by orsmga004.jf.intel.com with ESMTP; 06 Jun 2019 11:25:16 -0700
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.227]) by
 irsmsx105.ger.corp.intel.com ([169.254.7.99]) with mapi id 14.03.0415.000;
 Thu, 6 Jun 2019 19:25:17 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Thread-Topic: [alsa-devel] [PATCH v2 146/146] ASoC: soc-core: remove legacy
 style	dai_link
Thread-Index: AQHVHCtbXKdmamMTsUGYb6Zb2KkFzaaO75TA
Date: Thu, 6 Jun 2019 18:25:16 +0000
Message-ID: <3BD9CEE4EBD5E74B98FE2D277EB60E0B3900FE91@IRSMSX104.ger.corp.intel.com>
References: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
 <87lfyfe4r3.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfyfe4r3.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMmRhZmIyOWUtNWI2YS00YmViLTk2YWEtNzU2OGYzM2M1NWRlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaUU5Y1wvS3Bwb1crVXZ1Uk9BQlNmTk1ZU3ZnN3Y1ME1hT2tUM2VsS0dLT1wvVFYzbHVhOGZKTHh1QTI4ckxIK2I5In0=
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 146/146] ASoC: soc-core: remove legacy
 style	dai_link
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hmm, guess reviewing 001 proved redundant after all. Unless I got it wrong, you are removing code implemented in that very patch (the 001).
Any chance for eliminating ping-pong effect and doing the "right" changes from the get-go? Especially the renames are confusing here (s/cleanup_platform/cleanup_legacy/) if you intend to remove them soon after.

If there is no other way around it and solution is accepted, a note, perhaps in 001 would be helpful for future readers.

Czarek

>From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
>All drivers switched to modern style dai_link
>(= struct snd_soc_dai_link_component).
>Let's remove legacy style dai_link.
>
>Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>---
> include/sound/soc.h  |  65 ++------------------
> sound/soc/soc-core.c | 165 +++------------------------------------------------
> 2 files changed, 12 insertions(+), 218 deletions(-)
>
>diff --git a/include/sound/soc.h b/include/sound/soc.h
>index 0fa79b8..055e6d0 100644
>--- a/include/sound/soc.h
>+++ b/include/sound/soc.h
>@@ -901,77 +901,33 @@ struct snd_soc_dai_link {
> 	const char *stream_name;		/* Stream name */
>
> 	/*
>-	 *	cpu_name
>-	 *	cpu_of_node
>-	 *	cpu_dai_name
>-	 *
>-	 * These are legacy style, and will be replaced to
>-	 * modern style (= snd_soc_dai_link_component) in the future,
>-	 * but, not yet supported so far.
>-	 * If modern style was supported for CPU, all driver will switch
>-	 * to use it, and, legacy style code will be removed from ALSA SoC.
>-	 */
>-	/*
> 	 * You MAY specify the link's CPU-side device, either by device name,
> 	 * or by DT/OF node, but not both. If this information is omitted,
> 	 * the CPU-side DAI is matched using .cpu_dai_name only, which
>hence
> 	 * must be globally unique. These fields are currently typically used
> 	 * only for codec to codec links, or systems using device tree.
> 	 */
>-	const char *cpu_name;
>-	struct device_node *cpu_of_node;
> 	/*
> 	 * You MAY specify the DAI name of the CPU DAI. If this information is
> 	 * omitted, the CPU-side DAI is matched using
>.cpu_name/.cpu_of_node
> 	 * only, which only works well when that device exposes a single DAI.
> 	 */
>-	const char *cpu_dai_name;
>-
> 	struct snd_soc_dai_link_component *cpus;
> 	unsigned int num_cpus;
>
> 	/*
>-	 *	codec_name
>-	 *	codec_of_node
>-	 *	codec_dai_name
>-	 *
>-	 * These are legacy style, it will be converted to modern style
>-	 * (= snd_soc_dai_link_component) automatically in soc-core
>-	 * if driver is using legacy style.
>-	 * Driver shouldn't use both legacy and modern style in the same time.
>-	 * If modern style was supported for CPU, all driver will switch
>-	 * to use it, and, legacy style code will be removed from ALSA SoC.
>-	 */
>-	/*
> 	 * You MUST specify the link's codec, either by device name, or by
> 	 * DT/OF node, but not both.
> 	 */
>-	const char *codec_name;
>-	struct device_node *codec_of_node;
> 	/* You MUST specify the DAI name within the codec */
>-	const char *codec_dai_name;
>-
> 	struct snd_soc_dai_link_component *codecs;
> 	unsigned int num_codecs;
>
> 	/*
>-	 *	platform_name
>-	 *	platform_of_node
>-	 *
>-	 * These are legacy style, it will be converted to modern style
>-	 * (= snd_soc_dai_link_component) automatically in soc-core
>-	 * if driver is using legacy style.
>-	 * Driver shouldn't use both legacy and modern style in the same time.
>-	 * If modern style was supported for CPU, all driver will switch
>-	 * to use it, and, legacy style code will be removed from ALSA SoC.
>-	 */
>-	/*
> 	 * You MAY specify the link's platform/PCM/DMA driver, either by
> 	 * device name, or by DT/OF node, but not both. Some forms of link
> 	 * do not need a platform.
> 	 */
>-	const char *platform_name;
>-	struct device_node *platform_of_node;
> 	struct snd_soc_dai_link_component *platforms;
> 	unsigned int num_platforms;
>
>@@ -1033,13 +989,6 @@ struct snd_soc_dai_link {
> 	/* Do not create a PCM for this DAI link (Backend link) */
> 	unsigned int ignore:1;
>
>-	/*
>-	 * This driver uses legacy platform naming. Set by the core, machine
>-	 * drivers should not modify this value.
>-	 */
>-	unsigned int legacy_platform:1;
>-	unsigned int legacy_cpu:1;
>-
> 	struct list_head list; /* DAI link list of the soc card */
> 	struct snd_soc_dobj dobj; /* For topology */
> };
>@@ -1699,15 +1648,11 @@ int
>snd_soc_fixup_dai_links_platform_name(struct snd_soc_card *card,
> 		if (!name)
> 			return -ENOMEM;
>
>-		if (dai_link->platforms)
>-			/* only single platform is supported for now */
>-			dai_link->platforms->name = name;
>-		else
>-			/*
>-			 * legacy mode, this case will be removed when all
>-			 * derivers are switched to modern style dai_link.
>-			 */
>-			dai_link->platform_name = name;
>+		if (!dai_link->platforms)
>+			return -EINVAL;
>+
>+		/* only single platform is supported for now */
>+		dai_link->platforms->name = name;
> 	}
>
> 	return 0;
>diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>index e069dfb..b28dda9 100644
>--- a/sound/soc/soc-core.c
>+++ b/sound/soc/soc-core.c
>@@ -1052,167 +1052,18 @@ static void soc_remove_dai_links(struct
>snd_soc_card *card)
> 	}
> }
>
>-static int snd_soc_init_cpu(struct snd_soc_card *card,
>-			    struct snd_soc_dai_link *dai_link)
>-{
>-	struct snd_soc_dai_link_component *cpu = dai_link->cpus;
>-
>-	/*
>-	 * REMOVE ME
>-	 *
>-	 * This is glue code for Legacy vs Modern dai_link.
>-	 * This function will be removed if all derivers are switched to
>-	 * modern style dai_link.
>-	 * Driver shouldn't use both legacy and modern style in the same time.
>-	 * see
>-	 *	soc.h :: struct snd_soc_dai_link
>-	 */
>-	/* convert Legacy platform link */
>-	if (!cpu) {
>-		cpu = devm_kzalloc(card->dev,
>-				   sizeof(struct snd_soc_dai_link_component),
>-				   GFP_KERNEL);
>-		if (!cpu)
>-			return -ENOMEM;
>-
>-		dai_link->cpus		= cpu;
>-		dai_link->num_cpus	= 1;
>-		dai_link->legacy_cpu	= 1;
>-
>-		cpu->name	= dai_link->cpu_name;
>-		cpu->of_node	= dai_link->cpu_of_node;
>-		cpu->dai_name	= dai_link->cpu_dai_name;
>-	}
>-
>-	if (!dai_link->cpus) {
>-		dev_err(card->dev, "ASoC: DAI link has no CPUs\n");
>-		return -EINVAL;
>-	}
>-
>-	return 0;
>-}
>-
>-static int snd_soc_init_platform(struct snd_soc_card *card,
>-				 struct snd_soc_dai_link *dai_link)
>-{
>-	struct snd_soc_dai_link_component *platform = dai_link->platforms;
>-
>-	/*
>-	 * REMOVE ME
>-	 *
>-	 * This is glue code for Legacy vs Modern dai_link.
>-	 * This function will be removed if all derivers are switched to
>-	 * modern style dai_link.
>-	 * Driver shouldn't use both legacy and modern style in the same time.
>-	 * see
>-	 *	soc.h :: struct snd_soc_dai_link
>-	 */
>-	/* convert Legacy platform link */
>-	if (!platform) {
>-		platform = devm_kzalloc(card->dev,
>-				sizeof(struct snd_soc_dai_link_component),
>-				GFP_KERNEL);
>-		if (!platform)
>-			return -ENOMEM;
>-
>-		dai_link->platforms	  = platform;
>-		dai_link->num_platforms	  = 1;
>-		dai_link->legacy_platform = 1;
>-		platform->name		  = dai_link->platform_name;
>-		platform->of_node	  = dai_link->platform_of_node;
>-		platform->dai_name	  = NULL;
>-	}
>-
>-	/* if there's no platform we match on the empty platform */
>-	if (!platform->name &&
>-	    !platform->of_node)
>-		platform->name = "snd-soc-dummy";
>-
>-	return 0;
>-}
>-
>-static void soc_cleanup_legacy(struct snd_soc_card *card)
>-{
>-	struct snd_soc_dai_link *link;
>-	int i;
>-	/*
>-	 * FIXME
>-	 *
>-	 * this function should be removed with snd_soc_init_platform
>-	 */
>-
>-	for_each_card_prelinks(card, i, link) {
>-		if (link->legacy_platform) {
>-			link->legacy_platform = 0;
>-			link->platforms       = NULL;
>-		}
>-		if (link->legacy_cpu) {
>-			link->legacy_cpu = 0;
>-			link->cpus = NULL;
>-		}
>-	}
>-}
>-
>-static int snd_soc_init_multicodec(struct snd_soc_card *card,
>-				   struct snd_soc_dai_link *dai_link)
>-{
>-	/*
>-	 * REMOVE ME
>-	 *
>-	 * This is glue code for Legacy vs Modern dai_link.
>-	 * This function will be removed if all derivers are switched to
>-	 * modern style dai_link.
>-	 * Driver shouldn't use both legacy and modern style in the same time.
>-	 * see
>-	 *	soc.h :: struct snd_soc_dai_link
>-	 */
>-
>-	/* Legacy codec/codec_dai link is a single entry in multicodec */
>-	if (dai_link->codec_name || dai_link->codec_of_node ||
>-	    dai_link->codec_dai_name) {
>-		dai_link->num_codecs = 1;
>-
>-		dai_link->codecs = devm_kzalloc(card->dev,
>-				sizeof(struct snd_soc_dai_link_component),
>-				GFP_KERNEL);
>-		if (!dai_link->codecs)
>-			return -ENOMEM;
>-
>-		dai_link->codecs[0].name = dai_link->codec_name;
>-		dai_link->codecs[0].of_node = dai_link->codec_of_node;
>-		dai_link->codecs[0].dai_name = dai_link->codec_dai_name;
>-	}
>-
>-	if (!dai_link->codecs) {
>-		dev_err(card->dev, "ASoC: DAI link has no CODECs\n");
>-		return -EINVAL;
>-	}
>-
>-	return 0;
>-}
>+static struct snd_soc_dai_link_component dummy_link = COMP_DUMMY();
>
> static int soc_init_dai_link(struct snd_soc_card *card,
> 			     struct snd_soc_dai_link *link)
> {
>-	int i, ret;
>+	int i;
> 	struct snd_soc_dai_link_component *codec;
>
>-	ret = snd_soc_init_cpu(card, link);
>-	if (ret) {
>-		dev_err(card->dev, "ASoC: failed to init cpu\n");
>-		return ret;
>-	}
>-
>-	ret = snd_soc_init_platform(card, link);
>-	if (ret) {
>-		dev_err(card->dev, "ASoC: failed to init multiplatform\n");
>-		return ret;
>-	}
>-
>-	ret = snd_soc_init_multicodec(card, link);
>-	if (ret) {
>-		dev_err(card->dev, "ASoC: failed to init multicodec\n");
>-		return ret;
>+	/* default Platform */
>+	if (!link->platforms || !link->num_platforms) {
>+		link->platforms = &dummy_link;
>+		link->num_platforms = 1;
> 	}
>
> 	for_each_link_codecs(link, i, codec) {
>@@ -2059,7 +1910,7 @@ static void soc_check_tplg_fes(struct snd_soc_card
>*card)
> 				 card->dai_link[i].name);
>
> 			/* override platform component */
>-			if (snd_soc_init_platform(card, dai_link) < 0) {
>+			if (!dai_link->platforms) {
> 				dev_err(card->dev, "init platform error");
> 				continue;
> 			}
>@@ -2110,7 +1961,6 @@ static int soc_cleanup_card_resources(struct
>snd_soc_card *card)
> 	/* remove and free each DAI */
> 	soc_remove_dai_links(card);
> 	soc_remove_pcm_runtimes(card);
>-	soc_cleanup_legacy(card);
>
> 	/* remove auxiliary devices */
> 	soc_remove_aux_devices(card);
>@@ -2867,7 +2717,6 @@ int snd_soc_register_card(struct snd_soc_card
>*card)
>
> 		ret = soc_init_dai_link(card, link);
> 		if (ret) {
>-			soc_cleanup_legacy(card);
> 			dev_err(card->dev, "ASoC: failed to init link %s\n",
> 				link->name);
> 			mutex_unlock(&client_mutex);
>--
>2.7.4
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
