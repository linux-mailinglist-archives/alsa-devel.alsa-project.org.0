Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 630CA37C0B
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 20:17:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7930015E5;
	Thu,  6 Jun 2019 20:16:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7930015E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559845061;
	bh=mXeaovBILAVSRYFh00BKa66GjHK/YiilfmNvEbYLBqY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hQNKna8wBpXIQauj73RIzuekSIXNR/rqWT5YHx6Ocse5GImGkZotsu1cnVW9WPZ7l
	 Yw3mau66RiYwlzbeLePznsS6x46XmTBC5cAjcWn4fYr0I3l+i53FLev+y4Ieosp9jn
	 eTy27UDRTny9Kt3pi2YQ1Lvc8SFD3J/7AYscCxIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4A29F896FE;
	Thu,  6 Jun 2019 20:15:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10FD9F896F7; Thu,  6 Jun 2019 20:15:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62B61F896CE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 20:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62B61F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 11:15:47 -0700
X-ExtLoop1: 1
Received: from irsmsx108.ger.corp.intel.com ([163.33.3.3])
 by orsmga005.jf.intel.com with ESMTP; 06 Jun 2019 11:15:46 -0700
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.227]) by
 IRSMSX108.ger.corp.intel.com ([169.254.11.19]) with mapi id 14.03.0415.000;
 Thu, 6 Jun 2019 19:15:45 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Thread-Topic: [alsa-devel] [PATCH v2 001/146] ASoC: soc-core: use
 snd_soc_dai_link_component for CPU
Thread-Index: AQHVHB2p1YH0taosoE+G0CG9ZU+kR6aO7chw
Date: Thu, 6 Jun 2019 18:15:45 +0000
Message-ID: <3BD9CEE4EBD5E74B98FE2D277EB60E0B3900FE44@IRSMSX104.ger.corp.intel.com>
References: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
 <87ftonmkuo.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ftonmkuo.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDQyM2M2NDQtMzkzYi00NWQ4LTkwYjAtNDE4MmQ2YjI4ZDg1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWGsxSmVBc3QyWUlZMkVOVDBaNEhXdUxUN1gyNUUwU0tLQ21hamV6UVZHSW90SHVPVnpTSmpweFY1V0J4N21xQiJ9
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 001/146] ASoC: soc-core:
	use	snd_soc_dai_link_component for CPU
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

>From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
>current ALSA SoC is starting to support modern style dai_linke
>(= struct snd_soc_dai_link_component) which is mainly used for
>multipul DAI/component connection.
>Now Codec has full multi-codec support, Platform is using modern
>style but still for single Platform.
>Only CPU is not yet supporting modern style yet.
>If we could support it for CPU, we can switch to modern style
>dai_link on all CPU/Codec/Platform, and remove legacy style
>from ALSA SoC.
>
>Multi-CPU will be supported in the future.
>This patch is initial support for modern style for CPU
>
>Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>---
> include/sound/soc.h  |  4 +++
> sound/soc/soc-core.c | 83
>+++++++++++++++++++++++++++++++++++++++++++---------
> 2 files changed, 73 insertions(+), 14 deletions(-)
>
>diff --git a/include/sound/soc.h b/include/sound/soc.h
>index f20785a..ae7ca82 100644
>--- a/include/sound/soc.h
>+++ b/include/sound/soc.h
>@@ -927,6 +927,9 @@ struct snd_soc_dai_link {
> 	 */
> 	const char *cpu_dai_name;
>
>+	struct snd_soc_dai_link_component *cpus;
>+	unsigned int num_cpus;
>+
> 	/*
> 	 *	codec_name
> 	 *	codec_of_node
>@@ -1035,6 +1038,7 @@ struct snd_soc_dai_link {
> 	 * drivers should not modify this value.
> 	 */
> 	unsigned int legacy_platform:1;
>+	unsigned int legacy_cpu:1;
>
> 	struct list_head list; /* DAI link list of the soc card */
> 	struct snd_soc_dobj dobj; /* For topology */
>diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>index 7abb017a8..af080a9 100644
>--- a/sound/soc/soc-core.c
>+++ b/sound/soc/soc-core.c
>@@ -887,7 +887,6 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
> {
> 	struct snd_soc_pcm_runtime *rtd;
> 	struct snd_soc_dai_link_component *codecs;
>-	struct snd_soc_dai_link_component cpu_dai_component;
> 	struct snd_soc_component *component;
> 	int i;
>
>@@ -906,13 +905,11 @@ static int soc_bind_dai_link(struct snd_soc_card
>*card,
> 	if (!rtd)
> 		return -ENOMEM;
>
>-	cpu_dai_component.name = dai_link->cpu_name;
>-	cpu_dai_component.of_node = dai_link->cpu_of_node;
>-	cpu_dai_component.dai_name = dai_link->cpu_dai_name;
>-	rtd->cpu_dai = snd_soc_find_dai(&cpu_dai_component);
>+	/* FIXME: we need multi CPU support in the future */
>+	rtd->cpu_dai = snd_soc_find_dai(dai_link->cpus);
> 	if (!rtd->cpu_dai) {
> 		dev_info(card->dev, "ASoC: CPU DAI %s not registered\n",
>-			 dai_link->cpu_dai_name);
>+			 dai_link->cpus->dai_name);
> 		goto _err_defer;
> 	}
> 	snd_soc_rtdcom_add(rtd, rtd->cpu_dai->component);
>@@ -1048,6 +1045,46 @@ static void soc_remove_dai_links(struct
>snd_soc_card *card)
> 	}
> }
>
>+static int snd_soc_init_cpu(struct snd_soc_card *card,
>+			    struct snd_soc_dai_link *dai_link)
>+{
>+	struct snd_soc_dai_link_component *cpu = dai_link->cpus;
>+
>+	/*
>+	 * REMOVE ME
>+	 *
>+	 * This is glue code for Legacy vs Modern dai_link.
>+	 * This function will be removed if all derivers are switched to
>+	 * modern style dai_link.
>+	 * Driver shouldn't use both legacy and modern style in the same time.
>+	 * see
>+	 *	soc.h :: struct snd_soc_dai_link
>+	 */
>+	/* convert Legacy platform link */
>+	if (!cpu) {
>+		cpu = devm_kzalloc(card->dev,
>+				   sizeof(struct snd_soc_dai_link_component),

sizeof(*cpu)

>+				   GFP_KERNEL);
>+		if (!cpu)
>+			return -ENOMEM;
>+
>+		dai_link->cpus		= cpu;
>+		dai_link->num_cpus	= 1;
>+		dai_link->legacy_cpu	= 1;
>+
>+		cpu->name	= dai_link->cpu_name;
>+		cpu->of_node	= dai_link->cpu_of_node;

Indentation seems off.

>+		cpu->dai_name	= dai_link->cpu_dai_name;
>+	}
>+
>+	if (!dai_link->cpus) {
>+		dev_err(card->dev, "ASoC: DAI link has no CPUs\n");
>+		return -EINVAL;
>+	}
>+
>+	return 0;
>+}
>+
> static int snd_soc_init_platform(struct snd_soc_card *card,
> 				 struct snd_soc_dai_link *dai_link)
> {
>@@ -1087,7 +1124,7 @@ static int snd_soc_init_platform(struct snd_soc_card
>*card,
> 	return 0;
> }
>
>-static void soc_cleanup_platform(struct snd_soc_card *card)
>+static void soc_cleanup_legacy(struct snd_soc_card *card)
> {
> 	struct snd_soc_dai_link *link;
> 	int i;
>@@ -1102,6 +1139,10 @@ static void soc_cleanup_platform(struct
>snd_soc_card *card)
> 			link->legacy_platform = 0;
> 			link->platforms       = NULL;
> 		}
>+		if (link->legacy_cpu) {
>+			link->legacy_cpu = 0;
>+			link->cpus = NULL;
>+		}
> 	}
> }
>
>@@ -1149,6 +1190,12 @@ static int soc_init_dai_link(struct snd_soc_card
>*card,
> 	int i, ret;
> 	struct snd_soc_dai_link_component *codec;
>
>+	ret = snd_soc_init_cpu(card, link);
>+	if (ret) {
>+		dev_err(card->dev, "ASoC: failed to init cpu\n");
>+		return ret;
>+	}
>+
> 	ret = snd_soc_init_platform(card, link);
> 	if (ret) {
> 		dev_err(card->dev, "ASoC: failed to init multiplatform\n");
>@@ -1207,12 +1254,20 @@ static int soc_init_dai_link(struct snd_soc_card
>*card,
> 	    !soc_find_component(link->platforms->of_node, link->platforms-
>>name))
> 		return -EPROBE_DEFER;
>
>+	/* FIXME */
>+	if (link->num_cpus > 1) {
>+		dev_err(card->dev,
>+			"ASoC: multi cpu is not yet supported %s\n",
>+			link->name);
>+		return -EINVAL;
>+	}
>+
> 	/*
> 	 * CPU device may be specified by either name or OF node, but
> 	 * can be left unspecified, and will be matched based on DAI
> 	 * name alone..
> 	 */
>-	if (link->cpu_name && link->cpu_of_node) {
>+	if (link->cpus->name && link->cpus->of_node) {
> 		dev_err(card->dev,
> 			"ASoC: Neither/both cpu name/of_node are set for
>%s\n",
> 			link->name);
>@@ -1223,16 +1278,16 @@ static int soc_init_dai_link(struct snd_soc_card
>*card,
> 	 * Defer card registartion if cpu dai component is not added to
> 	 * component list.
> 	 */
>-	if ((link->cpu_of_node || link->cpu_name) &&
>-	    !soc_find_component(link->cpu_of_node, link->cpu_name))
>+	if ((link->cpus->of_node || link->cpus->name) &&
>+	    !soc_find_component(link->cpus->of_node, link->cpus->name))
> 		return -EPROBE_DEFER;
>
> 	/*
> 	 * At least one of CPU DAI name or CPU device name/node must be
> 	 * specified
> 	 */
>-	if (!link->cpu_dai_name &&
>-	    !(link->cpu_name || link->cpu_of_node)) {
>+	if (!link->cpus->dai_name &&
>+	    !(link->cpus->name || link->cpus->of_node)) {
> 		dev_err(card->dev,
> 			"ASoC: Neither cpu_dai_name nor
>cpu_name/of_node are set for %s\n",
> 			link->name);
>@@ -2048,7 +2103,7 @@ static int soc_cleanup_card_resources(struct
>snd_soc_card *card)
> 	/* remove and free each DAI */
> 	soc_remove_dai_links(card);
> 	soc_remove_pcm_runtimes(card);
>-	soc_cleanup_platform(card);
>+	soc_cleanup_legacy(card);
>
> 	/* remove auxiliary devices */
> 	soc_remove_aux_devices(card);
>@@ -2805,7 +2860,7 @@ int snd_soc_register_card(struct snd_soc_card
>*card)
>
> 		ret = soc_init_dai_link(card, link);
> 		if (ret) {
>-			soc_cleanup_platform(card);
>+			soc_cleanup_legacy(card);
> 			dev_err(card->dev, "ASoC: failed to init link %s\n",
> 				link->name);
> 			mutex_unlock(&client_mutex);

While I understand the reasoning and need for this, this single patch contains rename, struct definition update and new func implementations all at once.
Your patchset is high in numbers already, though only a few are introducing actual changes. I'd consider splitting this into separate logical blocks.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
