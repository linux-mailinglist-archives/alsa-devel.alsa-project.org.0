Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9EC374EF
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 15:15:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76F0E86E;
	Thu,  6 Jun 2019 15:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76F0E86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559826952;
	bh=95FvaII96DCpGGC11K9Mc0OoS1VVlBRvFauX8XiJVNQ=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ASxGM0zZSVX+a9UAgTjBm4j1HHdSyuTbicJ06r389QQ93m7b21C3Qt+LsCpXDSmuW
	 Q3aICuNoB6O3D+ih02tTFYmbbxn6qdHir1p/XznukCH9hOJQITATuXjR8q3XtbkiV2
	 wmCJzmZ/zKrpCFoQoufXhtPzbFZCddaa4s/+CqPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2134F896F8;
	Thu,  6 Jun 2019 15:14:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26A50F896F7; Thu,  6 Jun 2019 15:14:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 238C1F896CE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 15:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 238C1F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 06:14:00 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
 by orsmga003.jf.intel.com with ESMTP; 06 Jun 2019 06:13:59 -0700
Date: Thu, 6 Jun 2019 15:17:47 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190606151747.343ddd4c@xxx>
In-Reply-To: <87v9xjfjgo.wl-kuninori.morimoto.gx@renesas.com>
References: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
 <87v9xjfjgo.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 114/146] ASoC: soc-topology: use modern
 dai_link style
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

On 06 Jun 2019 13:19:14 +0900
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> ASoC is now supporting modern style dai_link
> (= snd_soc_dai_link_component) for CPU/Codec/Platform.
> This patch switches to use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-topology.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 3299ebb..f485f7f 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -560,7 +560,7 @@ static void remove_link(struct snd_soc_component
> *comp, 
>  	kfree(link->name);
>  	kfree(link->stream_name);
> -	kfree(link->cpu_dai_name);
> +	kfree(link->cpus->dai_name);
>  
>  	list_del(&dobj->list);
>  	snd_soc_remove_dai_link(comp->card, link);
> @@ -1879,12 +1879,22 @@ static int soc_tplg_fe_link_create(struct
> soc_tplg *tplg, struct snd_soc_tplg_pcm *pcm)
>  {
>  	struct snd_soc_dai_link *link;
> +	struct snd_soc_dai_link_component *dlc;
>  	int ret;
>  
> -	link = kzalloc(sizeof(struct snd_soc_dai_link), GFP_KERNEL);
> +	/* link + cpu + codec */
> +	link = kzalloc(sizeof(*link) + (2 * sizeof(*dlc)),
> GFP_KERNEL); if (link == NULL)
>  		return -ENOMEM;
>  
> +	dlc = (struct snd_soc_dai_link_component *)(link + 1);
> +
> +	link->cpus	= &dlc[0];
> +	link->codecs	= &dlc[1];

While I understand what is going on here, I find this bit ugly.
Can it perhaps be changed to something like:

	link = kzalloc(sizeof(*link), GFP_KERNEL);
	if (link == NULL)
		return -ENOMEM;
	link->cpus = kzalloc(sizeof(*dlc), GFP_KERNEL);
	if (link->cpus == NULL) {
		ret = -ENOMEM;
		goto err;
	}
	link->codecs = kzalloc(sizeof(*dlc), GFP_KERNEL);
	if (link->cpus == NULL) {
		ret = -ENOMEM;
		goto err;
	}

(...)
err:
	kfree(link->cpus);
	kfree(link);
	return ret;

While it has a bit more of boiler plate it's easier to follow.

And while I look at soc_tplg_fe_link_create() it could use some
more memory checks, but it's a topic for separate patch.

> +
> +	link->num_cpus	 = 1;
> +	link->num_codecs = 1;
> +
>  	if (strlen(pcm->pcm_name)) {
>  		link->name = kstrdup(pcm->pcm_name, GFP_KERNEL);
>  		link->stream_name = kstrdup(pcm->pcm_name,
> GFP_KERNEL); @@ -1892,10 +1902,10 @@ static int
> soc_tplg_fe_link_create(struct soc_tplg *tplg, link->id =
> le32_to_cpu(pcm->pcm_id); 
>  	if (strlen(pcm->dai_name))
> -		link->cpu_dai_name = kstrdup(pcm->dai_name,
> GFP_KERNEL);
> +		link->cpus->dai_name = kstrdup(pcm->dai_name,
> GFP_KERNEL); 
> -	link->codec_name = "snd-soc-dummy";
> -	link->codec_dai_name = "snd-soc-dummy-dai";
> +	link->codecs->name = "snd-soc-dummy";
> +	link->codecs->dai_name = "snd-soc-dummy-dai";
>  
>  	/* enable DPCM */
>  	link->dynamic = 1;
> @@ -1912,7 +1922,7 @@ static int soc_tplg_fe_link_create(struct
> soc_tplg *tplg, dev_err(tplg->comp->dev, "ASoC: FE link loading
> failed\n"); kfree(link->name);
>  		kfree(link->stream_name);
> -		kfree(link->cpu_dai_name);
> +		kfree(link->cpus->dai_name);
>  		kfree(link);
>  		return ret;
>  	}

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
