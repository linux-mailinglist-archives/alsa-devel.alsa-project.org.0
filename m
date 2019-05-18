Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A43E2245E
	for <lists+alsa-devel@lfdr.de>; Sat, 18 May 2019 19:54:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA9F0167B;
	Sat, 18 May 2019 19:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA9F0167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558202096;
	bh=6FbPXZoXXC5ryxcHE+AXdBpKn/nsH6gJgtBZ7lwWXSc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGseReFrT4iTeTflbD2H35BJBLz96GnifP7fXUBGduZ1JqeYsOT90UrW9fXzu1X/+
	 wYvxb2bL4307OIidFsSebO7WA0z9bEXbIj0NyVHUmfU4X7OWcj7GRxn7pLkhXh2ghA
	 bjGdn8ZCrwWiQ9YI6mGr5yRUjIc+ZDyS2wCbs6gg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3686EF896CB;
	Sat, 18 May 2019 19:53:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 269DBF896B7; Sat, 18 May 2019 19:53:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B388AF806E7
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 19:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B388AF806E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 May 2019 10:53:03 -0700
X-ExtLoop1: 1
Received: from jkwan-mobl.amr.corp.intel.com ([10.255.90.170])
 by orsmga002.jf.intel.com with ESMTP; 18 May 2019 10:53:02 -0700
Message-ID: <507314777fe91504238a26135614844209dd53b8.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
 <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>, Vinod Koul
 <vkoul@kernel.org>
Date: Sat, 18 May 2019 10:53:02 -0700
In-Reply-To: <87ef4x33wh.wl-kuninori.morimoto.gx@renesas.com>
References: <87ef4x33wh.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH][RFC] ASoC: soc-pcm: fixup module_put()
 calling timing
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

On Fri, 2019-05-17 at 17:16 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> soc_pcm_components_close() try to call module_put()
> based on component->driver->module_get_upon_open.
> But, it should be called even though it doesn't have .close callback.
I think this makes sense. Thanks!

Ranjani
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> Mark, Pierre-Louis, Vinod, Liam
> 
> I think this patch is correct, but I'm not sure.
> I'm happy if someone can confirm it.
> 
>  sound/soc/soc-pcm.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 7b4cda6..e24eab3 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -477,11 +477,9 @@ static int soc_pcm_components_close(struct
> snd_pcm_substream *substream,
>  		if (component == last)
>  			break;
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
>  		if (component->driver->module_get_upon_open)
>  			module_put(component->dev->driver->owner);

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
