Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A08283516
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 17:21:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE4971660;
	Tue,  6 Aug 2019 17:21:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE4971660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565104913;
	bh=xGhbJ+/cxsPoqLq+yUOziRX7HN9xWLuPuZhhDLSlRdk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XKdV0FwecrsNgqgZ9/03Ds3ShImYRx29lWW7zivzYeJyB+AGfMT5/WzZDJjHcN6HK
	 xqP42bzdpHd4yFJTAwjHf4fIKTB8nKmx4RBF0LBHWyZd6vXORmeJu5XXT7Qyqp1Uto
	 UsL+GL1dN313+2et8Y602cpi9JC5Gdkan4UX3tiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B7AAF80641;
	Tue,  6 Aug 2019 17:16:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65A6BF805A1; Tue,  6 Aug 2019 17:16:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5101F805E2
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 17:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5101F805E2
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 08:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="165012480"
Received: from tremilla-mobl1.amr.corp.intel.com (HELO [10.251.15.130])
 ([10.251.15.130])
 by orsmga007.jf.intel.com with ESMTP; 06 Aug 2019 08:16:04 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <871rxz3x7e.wl-kuninori.morimoto.gx@renesas.com>
 <871rxz2idw.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7dc56456-3f31-966a-ca09-a24363c8c217@linux.intel.com>
Date: Tue, 6 Aug 2019 10:07:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <871rxz2idw.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 25/28] ASoC: soc-core: initialize component
 list
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



On 8/5/19 8:30 PM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> snd_soc_component_initialize() isn't initialize component->list,

doesn't

> but we should do it.
> This patch initialize it.

initializes

> It might return without initializing in error case.
> In such case, uninitialized list might be used at error handler.
> This patch initializes all necessary variable before return.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-core.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 75b1770..666851b 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2641,6 +2641,10 @@ static int snd_soc_component_initialize(struct snd_soc_component *component,
>   {
>   	struct snd_soc_dapm_context *dapm;
>   
> +	INIT_LIST_HEAD(&component->dai_list);
> +	INIT_LIST_HEAD(&component->list);

is this actually required or is this 'list' used for list management?

> +	mutex_init(&component->io_mutex);
> +
>   	component->name = fmt_single_name(dev, &component->id);
>   	if (!component->name) {
>   		dev_err(dev, "ASoC: Failed to allocate name\n");
> @@ -2657,9 +2661,6 @@ static int snd_soc_component_initialize(struct snd_soc_component *component,
>   	dapm->idle_bias_off = !driver->idle_bias_on;
>   	dapm->suspend_bias_off = driver->suspend_bias_off;
>   
> -	INIT_LIST_HEAD(&component->dai_list);
> -	mutex_init(&component->io_mutex);
> -
>   	return 0;
>   }
>   
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
