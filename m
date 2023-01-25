Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1787267B5B1
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 16:17:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A0CAE7D;
	Wed, 25 Jan 2023 16:16:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A0CAE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674659869;
	bh=HqjyjaRRGEEJLN3luWkXHFgLtob+gQ7g8wCc8IAretI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HCNWB+vuclElkQj+viBUDvNdntG6YJ5oJ9Ocz3kaJqJaAlIH8N8KVfnLKFfmRTlNT
	 z35va42Rcn96wIkuYzgpyFaiQHcJy/BLJJNTfvvx+ZrGzRNN4xzZzyNodOK+idANMq
	 qUHE6zKc7kn+7Re6yyES+lGFVFotS9jQ+WHR81rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D740FF804C2;
	Wed, 25 Jan 2023 16:16:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 930A4F800FB; Wed, 25 Jan 2023 16:16:26 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id BBAA2F80163
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 16:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBAA2F80163
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jaiLdic7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674659783; x=1706195783;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HqjyjaRRGEEJLN3luWkXHFgLtob+gQ7g8wCc8IAretI=;
 b=jaiLdic7XdjOipfjgK7W4Ms9QEsE1Il3ER3juK3troGZmLKgBOsUiyEc
 RYhc8tXNlFethiZNFb8xx3aVmsY/tE+ZIWapCEMtIp0TlIwued3Q/ewWj
 hqvcwq4NfXnBwTqp6MZfiOLnM7ak5Zf9KAewe9ep4TdCyOB81Jj3qy6Ku
 sbW2zfoa27KLRoFjnBRX/af/4Dcgq4R4a1mqOndiZQjyhmPg6GAV9m5q4
 Me0zI1kG/tMI8B/n7tg9Mg4JkLGz7nwtLIV8+xZR/fMRbd/aYPdbaOM+n
 2zlRCnBtMoq4JHxuV/0fYRXAbjIV1hwPBKRmDu3Mk20OlMphhfZl03Zzy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="327832054"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="327832054"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 07:16:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="786449110"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="786449110"
Received: from bshunt-mobl.amr.corp.intel.com (HELO [10.212.37.80])
 ([10.212.37.80])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 07:16:10 -0800
Message-ID: <609b744a-1d5f-f390-45ad-9448cd5823ad@linux.intel.com>
Date: Wed, 25 Jan 2023 09:13:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 10/11] ASoC: topology: Use unload() op directly
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
 <20230125194649.3485731-11-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230125194649.3485731-11-amadeuszx.slawinski@linux.intel.com>
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
> Generic dynamic object (struct snd_soc_dobj) needs pointer to unload
> function, however, instead of using function pointer to point at it
> directly it points to all topology operations. Change code to use the
> function pointer instead.

This is a convoluted explanation, and the code does not support this
last sentence.

There is no existing dobj 'function pointer', it's added by this patch ....

> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  include/sound/soc-topology.h |  2 +-
>  sound/soc/soc-topology.c     | 56 ++++++++++++++++++++----------------
>  2 files changed, 33 insertions(+), 25 deletions(-)
> 
> diff --git a/include/sound/soc-topology.h b/include/sound/soc-topology.h
> index b4b896f83b94..f055c6917f6c 100644
> --- a/include/sound/soc-topology.h
> +++ b/include/sound/soc-topology.h
> @@ -62,7 +62,7 @@ struct snd_soc_dobj {
>  	enum snd_soc_dobj_type type;
>  	unsigned int index;	/* objects can belong in different groups */
>  	struct list_head list;
> -	struct snd_soc_tplg_ops *ops;
> +	int (*unload)(struct snd_soc_component *comp, struct snd_soc_dobj *dobj);

.... here

So what this changes is that instead of following the indirections ...

>  	union {
>  		struct snd_soc_dobj_control control;
>  		struct snd_soc_dobj_widget widget;
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 6689cf44464c..eb49037d86ae 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -359,8 +359,8 @@ static void soc_tplg_remove_mixer(struct snd_soc_component *comp,
>  	if (pass != SOC_TPLG_PASS_CONTROL)
>  		return;
>  
> -	if (dobj->ops && dobj->ops->control_unload)
> -		dobj->ops->control_unload(comp, dobj);
> +	if (dobj->unload)
> +		dobj->unload(comp, dobj);

... here, you first need to set that pointer ....

>  
>  	sbe->max = le32_to_cpu(be->max);
>  	sbe->dobj.type = SND_SOC_DOBJ_BYTES;
> -	sbe->dobj.ops = tplg->ops;
> +	if (tplg->ops)
> +		sbe->dobj.unload = tplg->ops->control_unload;

... here.

I don't see the gain, sorry.

Edit: This removal only makes sense with the patch 11 added, where the
same function can be used to remove multiple types of control.

Please revisit the commit message here and explain the intent, otherwise
this change in isolation isn't really useful.
