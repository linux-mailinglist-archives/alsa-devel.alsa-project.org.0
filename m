Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D116F4C5029
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:55:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 678CE1F5F;
	Fri, 25 Feb 2022 21:54:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 678CE1F5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645822500;
	bh=KWIENg3ykIdN67pyZMf+bp9c3E7uXKdlpT9um8vKjHk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y0CXmq4Hve3dyttoZnL1DbU5tTfrlylU9CtsiNPNWPyxFuG8YKv4R49NBRWGpNA37
	 HDAI44h6CDg/MPlzNyNQDTFLqZvY4cZr1wBuB3FihIj0hDMi8dWw37ZzvhRym2NOaj
	 rXEuqoeiIJprEuZ4Y0VRXuBhKJCqj0nftC60EP1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5189CF8051F;
	Fri, 25 Feb 2022 21:52:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B58E2F8020D; Fri, 25 Feb 2022 21:52:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76717F804FC
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:52:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76717F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="c5ZM0iD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645822356; x=1677358356;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KWIENg3ykIdN67pyZMf+bp9c3E7uXKdlpT9um8vKjHk=;
 b=c5ZM0iD1WSy7iTqqXk2oIS688LYWpdWOkE95e2NaBkXi+sUvfQfVQbxa
 xB4HkfmA5tIQGBFrF+epHoHLN8M+CLzeYxCsO4IcgpHctsfc8yRJw/31q
 0tlwO/3Qh658WzmLPfl3nIgLLUrHJbxBjioemECpK/6aA4y1H9/A4PJjb
 1dRNWcKvz1plvW/vRTY+/wZqiZSvdFeH/7FzUItClyeCPiVExl8ElwIYh
 rt3p4Z4sq7e/7UeXh8qb8XB0maHiBoxxnZM/Fwjm1/EF91+iikqYPhhc6
 jm0VlhctvC8bi0LuELmiZV4dsqt4EE6DShIHpn8lw4JRc5Kg0vwmyOD0W Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313296130"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="313296130"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:34 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="777520557"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:33 -0800
Message-ID: <361a3139-400a-b86f-9690-a8e06d0890b8@linux.intel.com>
Date: Fri, 25 Feb 2022 13:17:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [RFC 07/13] ASoC: Intel: avs: Add topology loading operations
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-8-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207132532.3782412-8-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 2/7/22 07:25, Cezary Rojewski wrote:
> AVS topology is split into two major parts: dictionaries - found within
> ASoC topology manifest - and path templates - found within DAPM widget
> private data. 

Well, one would hope that the path templates are initially represented
in the topology and set when parsing the topology.

If not, who defines that those 'path templates' are?

It's also unclear which 'DAPM widget' you are referring to?


> +static int avs_route_load(struct snd_soc_component *comp, int index,
> +			  struct snd_soc_dapm_route *route)

I have to ask: what is the difference between stream, path, path
template, route?

> +{
> +	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
> +	size_t len = SNDRV_CTL_ELEM_ID_NAME_MAXLEN;
> +	char buf[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
> +	u32 port;
> +
> +	/* See parse_link_formatted_string() for dynamic naming when(s). */
> +	if (hweight_long(mach->link_mask) == 1) {
> +		port = __ffs(mach->link_mask);
> +
> +		snprintf(buf, len, route->source, port);
> +		strncpy((char *)route->source, buf, len);
> +		snprintf(buf, len, route->sink, port);
> +		strncpy((char *)route->sink, buf, len);
> +		if (route->control) {
> +			snprintf(buf, len, route->control, port);
> +			strncpy((char *)route->control, buf, len);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int avs_widget_load(struct snd_soc_component *comp, int index,
> +			   struct snd_soc_dapm_widget *w,
> +			   struct snd_soc_tplg_dapm_widget *dw)
> +{
> +	struct snd_soc_acpi_mach *mach;
> +	struct avs_tplg_path_template *template;
> +	struct avs_soc_component *acomp = to_avs_soc_component(comp);
> +	struct avs_tplg *tplg;
> +
> +	if (!le32_to_cpu(dw->priv.size))
> +		return 0;
> +
> +	tplg = acomp->tplg;
> +	mach = dev_get_platdata(comp->card->dev);
> +
> +	/* See parse_link_formatted_string() for dynamic naming when(s). */
> +	if (hweight_long(mach->link_mask) == 1) {
> +		kfree(w->name);
> +		/* ->name is freed later by soc_tplg_dapm_widget_create() */

->name? missing something here
w->name?

> +		w->name = kasprintf(GFP_KERNEL, dw->name, __ffs(mach->link_mask));
> +		if (!w->name)
> +			return -ENOMEM;
> +	}
> +
> +	template = avs_tplg_path_template_create(comp, tplg, dw->priv.array,
> +						 le32_to_cpu(dw->priv.size));
> +	if (IS_ERR(template)) {
> +		dev_err(comp->dev, "widget %s load failed: %ld\n", dw->name,
> +			PTR_ERR(template));
> +		return PTR_ERR(template);
> +	}
> +
> +	w->priv = template; /* link path information to widget */
> +	list_add_tail(&template->node, &tplg->path_tmpl_list);
> +	return 0;
> +}
> +
> +static int avs_dai_load(struct snd_soc_component *comp, int index,
> +			struct snd_soc_dai_driver *dai_drv, struct snd_soc_tplg_pcm *pcm,
> +			struct snd_soc_dai *dai)
> +{
> +	if (pcm)
> +		dai_drv->ops = &avs_dai_fe_ops;
> +	return 0;
> +}
> +
> +static int avs_link_load(struct snd_soc_component *comp, int index, struct snd_soc_dai_link *link,
> +			 struct snd_soc_tplg_link_config *cfg)
> +{
> +	/* Stream control handled by IPCs. */
> +	link->nonatomic = true;

if this routine also takes care of BE dailinks, then it's not quite
correct to set nonatomic here.

Should this be set only within the test below?

> +
> +	if (!link->no_pcm) {
> +		/* Open LINK (BE) pipes last and close them first to prevent xruns. */
> +		link->trigger[0] = SND_SOC_DPCM_TRIGGER_PRE;
> +		link->trigger[1] = SND_SOC_DPCM_TRIGGER_PRE;
> +	}
> +
> +	return 0;
> +}

