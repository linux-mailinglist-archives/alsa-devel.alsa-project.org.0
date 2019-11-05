Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C250F0279
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 17:20:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F39916B4;
	Tue,  5 Nov 2019 17:19:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F39916B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572970830;
	bh=hDufJuIdyjaDVYC4aiQsNMHgSXtAFhToUD3UAInh8z8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kmV4sL9Uhr+zkgY0OTRN3euNDfojxQmHoMYaO4dWjZXWFgOmy8IrG4vEEKkkFVihd
	 z0UphgzjDZYW1D1uIy/yngMYlPZ0YdVuVa2wlTL1xuQnbt5peFg2J2QszPX9CF7fY3
	 +gZ4tu2IArPi6MfrYYKPk5GvZDjy7KDCSMpn6xsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74EC4F80535;
	Tue,  5 Nov 2019 17:18:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81424F8049B; Tue,  5 Nov 2019 17:18:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC853F80271
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 17:18:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC853F80271
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 08:18:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="212567882"
Received: from njdenler-mobl1.amr.corp.intel.com ([10.254.94.55])
 by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2019 08:18:36 -0800
Message-ID: <3499b3ac4b6b9f11c06cccd4dbdde78787a35660.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Tue, 05 Nov 2019 08:18:40 -0800
In-Reply-To: <87ftj23jph.wl-kuninori.morimoto.gx@renesas.com>
References: <87ftj23jph.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 00/19] ASoC: soc-core cleanup - step 4
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

On Tue, 2019-11-05 at 15:45 +0900, Kuninori Morimoto wrote:
> Hi Mark
> 
> These are v3 of soc-core cleanup step4.
> These are based on mark/for-5.5 branch.
> These had been tested on Intel CI, and had no issue.
> And are reviewed by Pierre-Louis, Ranjani.
Thanks for this clean-up, Morimoto-san.
v3 patchset looks good!

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> Kuninori Morimoto (19):
>   ASoC: soc-core: move soc_init_dai_link()
>   ASoC: soc-core: tidyup soc_init_dai_link()
>   ASoC: soc-core: typo fix at soc_dai_link_sanity_check()
>   ASoC: soc-core: remove duplicated soc_is_dai_link_bound()
>   ASoC: soc-core: call soc_bind_dai_link() under
> snd_soc_add_dai_link()
>   ASoC: soc-core: add soc_unbind_dai_link()
>   ASoC: soc-core: move snd_soc_lookup_component()
>   ASoC: soc-core: tidyup snd_soc_lookup_component()
>   ASoC: soc-core: add snd_soc_del_component_unlocked()
>   ASoC: soc-core: remove snd_soc_component_add/del()
>   ASoC: soc-core: use snd_soc_lookup_component() at
> snd_soc_unregister_component()
>   ASoC: soc-core: move snd_soc_register_dai()
>   ASoC: soc-core: move snd_soc_unregister_dais()
>   ASoC: soc-core: add snd_soc_unregister_dai()
>   ASoC: soc-core: have legacy_dai_naming at snd_soc_register_dai()
>   ASoC: soc-core: don't call snd_soc_dapm_new_dai_widgets() at
> snd_soc_register_dai()
>   ASoC: soc-core: call snd_soc_register_dai() from
> snd_soc_register_dais()
>   ASoC: soc-core: remove topology specific operation
>   ASoC: soc.h: dobj is used only when SND_SOC_TOPOLOGY
> 
>  include/sound/soc.h      |  15 +-
>  sound/soc/soc-core.c     | 526 ++++++++++++++++++++-----------------
> ----------
>  sound/soc/soc-topology.c |  17 +-
>  3 files changed, 255 insertions(+), 303 deletions(-)
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
