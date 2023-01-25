Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A8967B5B2
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 16:18:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 593F6E8D;
	Wed, 25 Jan 2023 16:17:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 593F6E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674659888;
	bh=llXwsvUbCmKXT5PEYj3xP41RbbqNF31bAYCDMZOhfFA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=taEhR7QIwitoNLJSSBX/pgfrpXq2zg4GckMnysWvtWlXWC37YtcXAg4DVTVUZiIbG
	 zU1KEeO1PkBEJZRl7dyCvCjz8t7UGX3/N3l3aACkLn5A6niouQfgr8dPDQ+hmXjh3Q
	 2ugiFpL+N30aM5/6Rjb0DhZv196NosThuhhI0qUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7812CF80163;
	Wed, 25 Jan 2023 16:16:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF1DCF8053D; Wed, 25 Jan 2023 16:16:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADDC4F80163
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 16:16:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADDC4F80163
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fEw+j0CH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674659787; x=1706195787;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=llXwsvUbCmKXT5PEYj3xP41RbbqNF31bAYCDMZOhfFA=;
 b=fEw+j0CHT1lmGb9F2BEJACXgcnz06jQiRzxv7j312K2MyYQjWGwuMuEi
 VM/OPv28UMaOW4A04P3zQ8lw/DwPYcwdg4iH3txpCte2uoE+CXZNVlYvq
 8YwYzQZb/RnAgi3qeFqYFSiIZ1NTMH19JpEOIoDTDR0BK76D60V/tRBZg
 ykSVUJnYwf7J4mMhrI5mX78g/nDZeu/36M6ZIZhj1HGPljREEzGQt1rXV
 J1xy6DgOnqbUSjwEn9bhe/tcWA3PggWQdBTCmaLaXTmvZfmP2Bf/0tpVb
 RC/4SGE0CdT3xfie5v7jo9A92bIs1uWiZs6TORb62tDgzQGPiAUPD/iN8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="327832062"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="327832062"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 07:16:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="786449144"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="786449144"
Received: from bshunt-mobl.amr.corp.intel.com (HELO [10.212.37.80])
 ([10.212.37.80])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 07:16:12 -0800
Message-ID: <40207a2a-3f2a-bbef-74f6-9e85ced3150a@linux.intel.com>
Date: Wed, 25 Jan 2023 09:15:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 11/11] ASoC: topology: Unify kcontrol removal code
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
 <20230125194649.3485731-12-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230125194649.3485731-12-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/25/23 13:46, Amadeusz Sławiński wrote:
> Functions removing bytes, enum and mixer kcontrols are identical. Unify

they are identical because of the change in patch10.

Please clarify that this is not a cleanup removing duplicated code
that's been there forever, it's become useless as a result of the
previous patch.

> them under one function and use it to free associated kcontrols.
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/soc/soc-topology.c | 48 +++++-----------------------------------
>  1 file changed, 6 insertions(+), 42 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index eb49037d86ae..e66b0d9e387a 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -350,41 +350,9 @@ static int soc_tplg_add_kcontrol(struct soc_tplg *tplg,
>  				tplg->dev, k, comp->name_prefix, comp, kcontrol);
>  }
>  
> -/* remove a mixer kcontrol */
> -static void soc_tplg_remove_mixer(struct snd_soc_component *comp,
> -	struct snd_soc_dobj *dobj, int pass)
> -{
> -	struct snd_card *card = comp->card->snd_card;
> -
> -	if (pass != SOC_TPLG_PASS_CONTROL)
> -		return;
> -
> -	if (dobj->unload)
> -		dobj->unload(comp, dobj);
> -
> -	snd_ctl_remove(card, dobj->control.kcontrol);
> -	list_del(&dobj->list);
> -}
> -
> -/* remove an enum kcontrol */
> -static void soc_tplg_remove_enum(struct snd_soc_component *comp,
> -	struct snd_soc_dobj *dobj, int pass)
> -{
> -	struct snd_card *card = comp->card->snd_card;
> -
> -	if (pass != SOC_TPLG_PASS_CONTROL)
> -		return;
> -
> -	if (dobj->unload)
> -		dobj->unload(comp, dobj);
> -
> -	snd_ctl_remove(card, dobj->control.kcontrol);
> -	list_del(&dobj->list);
> -}
> -
> -/* remove a byte kcontrol */
> -static void soc_tplg_remove_bytes(struct snd_soc_component *comp,
> -	struct snd_soc_dobj *dobj, int pass)
> +/* remove kcontrol */
> +static void soc_tplg_remove_kcontrol(struct snd_soc_component *comp, struct snd_soc_dobj *dobj,
> +				     int pass)
>  {
>  	struct snd_card *card = comp->card->snd_card;
>  
> @@ -2626,14 +2594,10 @@ int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
>  			list) {
>  
>  			switch (dobj->type) {
> -			case SND_SOC_DOBJ_MIXER:
> -				soc_tplg_remove_mixer(comp, dobj, pass);
> -				break;
> -			case SND_SOC_DOBJ_ENUM:
> -				soc_tplg_remove_enum(comp, dobj, pass);
> -				break;
>  			case SND_SOC_DOBJ_BYTES:
> -				soc_tplg_remove_bytes(comp, dobj, pass);
> +			case SND_SOC_DOBJ_ENUM:
> +			case SND_SOC_DOBJ_MIXER:
> +				soc_tplg_remove_kcontrol(comp, dobj, pass);
>  				break;
>  			case SND_SOC_DOBJ_GRAPH:
>  				soc_tplg_remove_route(comp, dobj, pass);
