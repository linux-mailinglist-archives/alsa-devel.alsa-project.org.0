Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE178D2DFB
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 17:44:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57448165D;
	Thu, 10 Oct 2019 17:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57448165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570722265;
	bh=9ZEvU9PDKEMHNWmvR/1QbyVjsWau3rqyxYX0HKYGw9A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A62JCpWmnnloyiWuwR88Ib8jyU5AuoU3Fwy7NS1/HHqMCIeUWOAwgq6qtb4/XFedW
	 lLrldmfEtT2jMy4pNC2KldVNYNorqDUD5R1v4F3WdfsYqQMLzvQXkKhfxNucH0Y6DS
	 nxoz0xW0nxw0opz8ijufA070dp5y3RgK2wlt97Uo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 541ECF80611;
	Thu, 10 Oct 2019 17:41:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6E5FF80600; Thu, 10 Oct 2019 17:41:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE2F3F8038F
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 17:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE2F3F8038F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 08:41:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,280,1566889200"; d="scan'208";a="369125064"
Received: from aandraox-mobl1.amr.corp.intel.com (HELO [10.254.98.68])
 ([10.254.98.68])
 by orsmga005.jf.intel.com with ESMTP; 10 Oct 2019 08:41:01 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87sgo2ilso.wl-kuninori.morimoto.gx@renesas.com>
 <871rvmilpo.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1ba82907-5f76-7992-366b-528a02a789e2@linux.intel.com>
Date: Thu, 10 Oct 2019 10:34:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <871rvmilpo.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 19/21] ASoC: soc-core: call
 snd_soc_register_dai() from snd_soc_register_dais()
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



On 10/8/19 11:31 PM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> ALSA SoC has 2 similar but diffarent implementation.
> snd_soc_register_dai()  is used from topology
> snd_soc_register_dais() is used from snd_soc_add_component()
> 
> Because of this kind of confusable naming, and duplicated
> implementation, code is very unreadale.
> We shouldn't have duplicated and confusable implementation.
> This patch calls snd_soc_register_dai() from snd_soc_register_dais()
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-core.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index d4f80c8..bbcaac5 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2610,14 +2610,17 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
>   					 struct snd_soc_dai_driver *dai_drv,
>   					 bool legacy_dai_naming)
>   {
> +	struct device *dev = component->dev;
>   	struct snd_soc_dai *dai;
>   
> -	if (dai_drv->dobj.type != SND_SOC_DOBJ_PCM) {
> -		dev_err(component->dev, "Invalid dai type %d\n",
> -			dai_drv->dobj.type);
> +	if (dai_drv->dobj.type &&
> +	    dai_drv->dobj.type != SND_SOC_DOBJ_PCM) {
> +		dev_err(dev, "Invalid dai type %d\n", dai_drv->dobj.type);
>   		return NULL;
>   	}

this block of code is removed in patch 20, so do we need the 
modification here?
>   
> +	dev_dbg(dev, "ASoC: dai register %s\n", dai_drv->name);
> +
>   	lockdep_assert_held(&client_mutex);
>   	dai = soc_add_dai(component, dai_drv, legacy_dai_naming);
>   	if (!dai)
> @@ -2651,16 +2654,12 @@ static int snd_soc_register_dais(struct snd_soc_component *component,
>   				 struct snd_soc_dai_driver *dai_drv,
>   				 size_t count)
>   {
> -	struct device *dev = component->dev;
>   	struct snd_soc_dai *dai;
>   	unsigned int i;
>   	int ret;
>   
> -	dev_dbg(dev, "ASoC: dai register %s #%zu\n", dev_name(dev), count);
> -
>   	for (i = 0; i < count; i++) {
> -
> -		dai = soc_add_dai(component, dai_drv + i, count == 1 &&
> +		dai = snd_soc_register_dai(component, dai_drv + i, count == 1 &&
>   				  !component->driver->non_legacy_dai_naming);
>   		if (dai == NULL) {
>   			ret = -ENOMEM;
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
