Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D8183511
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 17:21:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ED851669;
	Tue,  6 Aug 2019 17:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ED851669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565104869;
	bh=WgNTdw+kcxpp3QAcyBTEtDbg3HfFOZOrTIw5FeEXwek=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pDha2Uk8XFvjEosP9nh+TGeFsP6tO4IX4GTGW2eaqBhT2k9b5SUNj3zT0VQEQ615g
	 aF3M08O8h51OtHQSsUoISYeE8tgBIzEDNxKub1G84V4D6jgVpAX8rfrpo6SnJTSCsQ
	 wD0TS2azkPDzjvhonPe4LFhrQ/X3GN/1nc87FEP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3814FF805FB;
	Tue,  6 Aug 2019 17:16:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25AB8F805A1; Tue,  6 Aug 2019 17:16:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E6EBF805A8
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 17:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E6EBF805A8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 08:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="165012465"
Received: from tremilla-mobl1.amr.corp.intel.com (HELO [10.251.15.130])
 ([10.251.15.130])
 by orsmga007.jf.intel.com with ESMTP; 06 Aug 2019 08:16:03 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <871rxz3x7e.wl-kuninori.morimoto.gx@renesas.com>
 <874l2v2ie8.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <baa98584-e6a2-6816-d024-2ae25a617359@linux.intel.com>
Date: Tue, 6 Aug 2019 10:05:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <874l2v2ie8.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 23/28] ASoC: soc-core: don't alloc memory
 carelessly when creating debugfs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 8/5/19 8:30 PM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current ALSA SoC might allocate debugfs name memory via kasprintf(),
> but, it is grandiose and the code becoming very complex.

grandiose sounds lyric. did you mean unnecessary?

> Using enough size local variable is very enough for this purpose.

Using local variable with appropriate size is enough.

> 
> This patch uses 64byte local variable for it.
> It is very enough size for this purposeq.

last sentence is redundant

> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-core.c | 22 +++++++++-------------
>   1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index c737349..bf3bda2 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -147,23 +147,19 @@ static const struct attribute_group *soc_dev_attr_groups[] = {
>   #ifdef CONFIG_DEBUG_FS
>   static void soc_init_component_debugfs(struct snd_soc_component *component)
>   {
> +	char name[64];
> +
>   	if (!component->card->debugfs_card_root)
>   		return;
>   
> -	if (component->debugfs_prefix) {
> -		char *name;
> -
> -		name = kasprintf(GFP_KERNEL, "%s:%s",
> +	if (component->debugfs_prefix)
> +		snprintf(name, ARRAY_SIZE(name), "%s:%s",
>   			component->debugfs_prefix, component->name);
> -		if (name) {
> -			component->debugfs_root = debugfs_create_dir(name,
> -				component->card->debugfs_card_root);
> -			kfree(name);
> -		}
> -	} else {
> -		component->debugfs_root = debugfs_create_dir(component->name,
> -				component->card->debugfs_card_root);
> -	}
> +	else
> +		snprintf(name, ARRAY_SIZE(name), "%s", component->name);
> +
> +	component->debugfs_root = debugfs_create_dir(name,
> +					component->card->debugfs_card_root);
>   
>   	snd_soc_dapm_debugfs_init(snd_soc_component_get_dapm(component),
>   		component->debugfs_root);
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
