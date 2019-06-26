Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C270B581D3
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 13:46:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 155E21705;
	Thu, 27 Jun 2019 13:45:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 155E21705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561635982;
	bh=k+GXdU8zMCyidiSyuiUylN5CMI8SrQB3tWvO+K02dvY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vT7BvYXv3IzArokH3lT4MXzGgMjj1ufgLOzka/PRYwgRQ0rVMgfxe3kuOsWRZPnk4
	 W8v3LF3gNjGo/Je/9GLuUnW1TY1cbSwfoU4f2guz5KkJzJTotq0SRiVr2o+rZX6nty
	 NcksmUCt9fKzUkTnz9LwnNjPTRaJB/SIZNGABelw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94F13F896FC;
	Thu, 27 Jun 2019 13:44:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A972CF896F6; Thu, 27 Jun 2019 13:44:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DATE_IN_PAST_12_24,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36533F80C0B
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 13:44:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36533F80C0B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 04:44:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="361120685"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2019 04:44:28 -0700
Received: from pbossart-mac01.igk.intel.com (pbossart-mac01.igk.intel.com
 [10.237.140.148])
 by linux.intel.com (Postfix) with ESMTP id 22A1A5806E7;
 Thu, 27 Jun 2019 04:44:25 -0700 (PDT)
To: Daniel Baluta <daniel.baluta@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
 <87sgsnfjge.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZBnvfuZDbnvbmqAavh9DAbA_EeRc6OuH6OOiR1WB4zUrg@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8761d853-2b3f-7b26-0073-05d0c3ce1362@linux.intel.com>
Date: Wed, 26 Jun 2019 22:58:19 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAEnQRZBnvfuZDbnvbmqAavh9DAbA_EeRc6OuH6OOiR1WB4zUrg@mail.gmail.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 paul.olaru@nxp.com, Mark Brown <broonie@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH v2 116/146] ASoC: sof: use modern dai_link
 style
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


> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index f485f7f751a1..ee73318135fc 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1883,7 +1883,7 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
>          int ret;
> 
>          /* link + cpu + codec */
> -       link = kzalloc(sizeof(*link) + (2 * sizeof(*dlc)), GFP_KERNEL);
> +       link = kzalloc(sizeof(*link) + (3 * sizeof(*dlc)), GFP_KERNEL);
>          if (link == NULL)
>                  return -ENOMEM;
> 
> @@ -1891,9 +1891,11 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
> 
>          link->cpus      = &dlc[0];
>          link->codecs    = &dlc[1];
> +       link->platforms = &dlc[2];
> 
>          link->num_cpus   = 1;
>          link->num_codecs = 1;
> +       link->num_platforms = 1;
> 
> Can you please help me figure this out?

Isn't this fixed by my patch "ASoC: soc-topology: fix modern dai link 
style" applied on 6/13? Looks like the same issue to me.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
