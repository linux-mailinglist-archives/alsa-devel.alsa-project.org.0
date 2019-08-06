Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 741B382A9F
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 06:51:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B42F1667;
	Tue,  6 Aug 2019 06:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B42F1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565067111;
	bh=f98yEqiSTFC6JlVDdj/XKKtJFYCCLYhRvGzahR8P5dg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a+ZGPv+E0OLcWF7gfVxlgGwjBAyijw3eaGczlH515rhgxXvc+VX3TcDdKmUgRxGss
	 WgEAW/MI8fEBwxDgfcROLgzSr7G02szreeLpYme1WfXpaNhEeKtHsI3LkWB6jRCFUS
	 hpGvEneoIB3tbtvJSm2UgWD8mPyIk/gxr63fP2bk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 781CFF804CB;
	Tue,  6 Aug 2019 06:50:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B191F80290; Tue,  6 Aug 2019 06:50:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61DC3F800F4
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 06:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61DC3F800F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 21:49:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,352,1559545200"; d="scan'208";a="202685260"
Received: from sbaqai-mobl.amr.corp.intel.com ([10.251.144.137])
 by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2019 21:49:57 -0700
Message-ID: <1a3810dbfe579b6d896bc9edc420c2320d631c30.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 05 Aug 2019 21:49:55 -0700
In-Reply-To: <87h86v2ifr.wl-kuninori.morimoto.gx@renesas.com>
References: <871rxz3x7e.wl-kuninori.morimoto.gx@renesas.com>
 <87h86v2ifr.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 14/28] ASoC: soc-core: remove duplicated
 soc_is_dai_link_bound()
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

On Tue, 2019-08-06 at 10:29 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> soc_is_dai_link_bound() check will be called both
> *before* soc_bind_dai_link(), and
> *under*  soc_bind_dai_link().
> These are very verboqse.
> Let's remove one of them.
> 
> *	static int soc_bind_dai_link(...)
> 	{
> 		...
> =>		if (soc_is_dai_link_bound(...)) {
> 			...
> 			return 0;
> 		}
> 		...
> 	}
> 
> 	static int snd_soc_instantiate_card(...)
> 	{
> 		...
> 		for_each_card_links(...) {
> =>			if (soc_is_dai_link_bound(...))
> =>				continue;
> 			...
> *			ret = soc_bind_dai_link(...);
> 			if (ret)
> 				goto probe_end;
> 		}
> 		...
> 	}
Morimoto-san,

I think we should keep both the calls. The call to check if
(soc_is_dai_link_bound(...)) will prevent soc_init_dai_link() if the
dai link is already bound. 

Thanks,
Ranjani
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 838a843..e8ed57a 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2016,9 +2016,6 @@ static int snd_soc_instantiate_card(struct
> snd_soc_card *card)
>  	 * Components with topology may bring new DAIs and DAI links.
>  	 */
>  	for_each_card_links(card, dai_link) {
> -		if (soc_is_dai_link_bound(card, dai_link))
> -			continue;
> -
>  		ret = soc_init_dai_link(card, dai_link);
>  		if (ret)
>  			goto probe_end;

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
