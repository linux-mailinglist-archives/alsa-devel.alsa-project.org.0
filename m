Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BBFD4213
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 16:04:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86BF31680;
	Fri, 11 Oct 2019 16:04:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86BF31680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570802692;
	bh=p5FabazheHphR4aUW1k4xTo8atmUu3S/tpDJGmhMyG4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dVIUAddRQvyUDZCMCxVIdiXvem5fm5rgfYQXR2JNWXZL8NF9ae7jkl055tXJjl/GT
	 p3SMr0oLQz+4Pndi/muYH1J7FCw86kxWDQ6VYUbwJKM9v+piCJ0kD6gI+Xgz5ME9X2
	 oK0NEa9HoJAYr4bLLX1L9IqLOgkhHna3Qh19Ezgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16615F805A8;
	Fri, 11 Oct 2019 16:02:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89EE2F80308; Fri, 11 Oct 2019 16:02:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E174F802BD
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 16:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E174F802BD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 07:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; d="scan'208";a="188326723"
Received: from hmmanuel-mobl.amr.corp.intel.com (HELO [10.254.42.220])
 ([10.254.42.220])
 by orsmga008.jf.intel.com with ESMTP; 11 Oct 2019 07:02:13 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87sgo2ilso.wl-kuninori.morimoto.gx@renesas.com>
 <87ftk2ilqz.wl-kuninori.morimoto.gx@renesas.com>
 <bc534b3d-9575-06df-9bcc-4d11f19006cb@linux.intel.com>
 <87pnj4vzjx.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <de450516-aeb5-6f90-4905-0ca36ecd87df@linux.intel.com>
Date: Fri, 11 Oct 2019 08:40:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87pnj4vzjx.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 09/21] ASoC: soc-core: remove unneeded
 snd_soc_tplg_component_remove()
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


>>> snd_soc_tplg_component_remove() is topology related cleanup function.
>>> The driver which added topology needed cleanup it, not by soc-core.
>>> Only topology user skl-pcm is calling it, there is no effect by
>>> this patch.
> (snip)
>>> --- a/sound/soc/soc-core.c
>>> +++ b/sound/soc/soc-core.c
>>> @@ -2870,8 +2870,6 @@ static int __snd_soc_unregister_component(struct device *dev)
>>>    		if (dev != component->dev)
>>>    			continue;
>>>    -		snd_soc_tplg_component_remove(component,
>>> -					      SND_SOC_TPLG_INDEX_ALL);
>>>    		snd_soc_component_del_unlocked(component);
> (snip)
>> the SOF driver also calls snd_soc_tplg_component_remove(), so not sure
>> what you meant by the comment?
> 
> Ahh, yes indeed.
> 
> My opinion is that driver who called _load() need to call _remove()
> under his responsibility.
> 
> Today, skl-pcm and topology are the user.
> They are calling both _load() and_remove().
> Thus, I think soc-core don't need to call it ?
> 
> If we want to keep it as robustness,
> I want to have this comment, otherwise very confusable,
> because soc-core never call _load() but calling _remove()
> 
> 	/* For framework level robustness */
> 	snd_soc_tplg_component_remove(...);

I would need Ranjani's help here. I vaguely remember that at some point 
we relied on the topology being removed by the framework, then we did it 
on our own but can't recall the reason.

Ranjani, if you've got power now, can you chime in?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
