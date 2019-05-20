Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6A323879
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2019 15:43:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A31E8826;
	Mon, 20 May 2019 15:42:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A31E8826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558359813;
	bh=IHxDFUKVnx3loSIKVlUbAHYfFtk7XTERUrZFiXV+e0Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EnNqQi2ulPyeZN7daHtZiHmi/Nn7ySdgJLEQvynnc5aeVfyj3TbXgB3Jvol0rxUav
	 8MXzNK797CAKoqErjhJtCJXNj4vhA5VCEpCWFD+TPEouhJTMaazt/xrdxvJxK/ftq2
	 F6DGV8wON6NEOVExbYln7iGztdHNSHvXYpXCrZoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFD72F8065E;
	Mon, 20 May 2019 15:41:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB5F1F89630; Mon, 20 May 2019 15:38:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=TIME_LIMIT_EXCEEDED,
 URIBL_BLOCKED autolearn=unavailable version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C38BF80726
 for <alsa-devel@alsa-project.org>; Mon, 20 May 2019 15:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C38BF80726
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 May 2019 06:29:51 -0700
X-ExtLoop1: 1
Received: from ejleta-mobl.amr.corp.intel.com (HELO [10.254.104.211])
 ([10.254.104.211])
 by orsmga006.jf.intel.com with ESMTP; 20 May 2019 06:29:50 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87imu5zzh7.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <deb932a6-32cf-d455-e609-ea4657ecb229@linux.intel.com>
Date: Mon, 20 May 2019 08:29:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87imu5zzh7.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: soc-pcm: fixup
 try_module_get()/module_put() timing
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



On 5/19/19 8:42 PM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> soc_pcm_components_open/close() try to call
> try_module_get()/module_put() based on
> component->driver->module_get_upon_open.
> 
> Here, the purpose why we need to call these functions are to
> checking module reference.
> Thus, we need to call try_module_open() even though it doesn't
> have .open callback.
> 
> The same reason, we need to call module_put() even though it
> doesn't have .close
> 
> This patch calls try_module_get()/module_put() regardless of
> .open/.close
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


LGTM, this removes the assumptions on the implementation of .open and 
.close.

FWIW
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks!

> ---
> v1 -> v2
> 
>   - merge both try_module_get()/module_put() patch into 1
> 
>   sound/soc/soc-pcm.c | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 7737e00..e24eab3 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -440,10 +440,6 @@ static int soc_pcm_components_open(struct snd_pcm_substream *substream,
>   		component = rtdcom->component;
>   		*last = component;
>   
> -		if (!component->driver->ops ||
> -		    !component->driver->ops->open)
> -			continue;
> -
>   		if (component->driver->module_get_upon_open &&
>   		    !try_module_get(component->dev->driver->owner)) {
>   			dev_err(component->dev,
> @@ -452,6 +448,10 @@ static int soc_pcm_components_open(struct snd_pcm_substream *substream,
>   			return -ENODEV;
>   		}
>   
> +		if (!component->driver->ops ||
> +		    !component->driver->ops->open)
> +			continue;
> +
>   		ret = component->driver->ops->open(substream);
>   		if (ret < 0) {
>   			dev_err(component->dev,
> @@ -477,11 +477,9 @@ static int soc_pcm_components_close(struct snd_pcm_substream *substream,
>   		if (component == last)
>   			break;
>   
> -		if (!component->driver->ops ||
> -		    !component->driver->ops->close)
> -			continue;
> -
> -		component->driver->ops->close(substream);
> +		if (component->driver->ops &&
> +		    component->driver->ops->close)
> +			component->driver->ops->close(substream);
>   
>   		if (component->driver->module_get_upon_open)
>   			module_put(component->dev->driver->owner);
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
