Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E302D131C
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 17:40:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BD2D166B;
	Wed,  9 Oct 2019 17:39:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BD2D166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570635602;
	bh=obXQGBz3M2+vG8W4W/R7kCMdyTpB8D1ox8jJGRY7QMQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jnhCEQixsZ+vZPo09mzQbFisYB3ueCsGdaY0cs6D6GBUum6FUvdzw3kJkTs7nUJm8
	 UkTk9SZX0wb1EzV+Rgg7qe+dCNslCA2wpfHb/sVycNCSWjuaH9GDlUrCQxV91gvUZj
	 HXFoBO8QBl4KHp1h62WQ5nwf7RF1YGXMcuGfiv+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2215F805FD;
	Wed,  9 Oct 2019 17:37:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04E6DF805FD; Wed,  9 Oct 2019 17:37:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08A5AF80113
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 17:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08A5AF80113
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 08:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,276,1566889200"; d="scan'208";a="223620845"
Received: from mmahler-mobl1.amr.corp.intel.com (HELO [10.251.30.188])
 ([10.251.30.188])
 by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2019 08:37:29 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87sgo2ilso.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a14ceebd-d910-eb9f-8462-0036ee40b6d8@linux.intel.com>
Date: Wed, 9 Oct 2019 09:16:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87sgo2ilso.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 00/21] ASoC: soc-core cleanup - step 4
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



On 10/8/19 11:29 PM, Kuninori Morimoto wrote:
> 
> Hi Mark
> Cc Pierre-Louis
> 
> These are step4 of soc-core cleanup.
> These related to soc-topology.
> If my understanding and my code are correct,
> there is no effect to topology side, but I can't test.
> 
> I'm not sure who can test these, but I guess
> Pierre-Louis knows ?
> Pierre-Louis, can you help it ?

we can use GitHub and create a pull request with these patches, that 
will be tested on a variety of platforms. We unfortunately have a random 
IPC error at the moment which sometimes makes it difficult to judge if 
errors reported are due to the patch being tested or just bad timing.

I tried to apply the series but I get errors on the 2nd patch. I first 
need to rebase on Mark's tree.

> 
> Kuninori Morimoto (21):
>    ASoC: soc-core: remove for_each_rtdcom_safe()
>    ASoC: soc-core: add for_each_rtd_components() and replace
>    ASoC: soc-core: move soc_init_dai_link()
>    ASoC: soc-core: rename soc_init_dai_link() to soc_dai_link_sanity_check()
>    ASoC: soc-core: remove duplicated soc_is_dai_link_bound()
>    ASoC: soc-core: call soc_bind_dai_link() under snd_soc_add_dai_link()
>    ASoC: soc-core: add soc_unbind_dai_link()
>    ASoC: soc-core: snd_soc_unbind_card() cleanup
>    ASoC: soc-core: remove unneeded snd_soc_tplg_component_remove()
>    ASoC: soc-core: move snd_soc_lookup_component()
>    ASoC: soc-core: add snd_soc_del_component()
>    ASoC: soc-core: use snd_soc_lookup_component() at snd_soc_unregister_component()
>    ASoC: soc-core: move snd_soc_register_dai()
>    ASoC: soc-core: have legacy_dai_naming at snd_soc_register_dai()
>    ASoC: soc-core: move snd_soc_unregister_dais()
>    ASoC: soc-core: add snd_soc_unregister_dai()
>    ASoC: soc-core: don't call snd_soc_dapm_new_dai_widgets() at snd_soc_register_dai()
>    ASoC: soc-core: use mutex_lock() at snd_soc_add_component()
>    ASoC: soc-core: call snd_soc_register_dai() from snd_soc_register_dais()
>    ASoC: soc-core: remove topology specific operation
>    ASoC: soc.h: dobj is used only when SND_SOC_TOPOLOGY
> 
>   include/sound/soc.h       |  25 ++-
>   sound/soc/soc-component.c |  43 +---
>   sound/soc/soc-compress.c  |  52 ++---
>   sound/soc/soc-core.c      | 542 ++++++++++++++++++++--------------------------
>   sound/soc/soc-pcm.c       |  49 ++---
>   sound/soc/soc-topology.c  |  32 ++-
>   6 files changed, 320 insertions(+), 423 deletions(-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
