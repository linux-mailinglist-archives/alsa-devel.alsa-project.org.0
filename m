Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 477EF12229F
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 04:24:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A03F81669;
	Tue, 17 Dec 2019 04:23:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A03F81669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576553063;
	bh=5LeFYnZxze9/QM9f0zkj6LKcE2aqf/HINx3/U/lRwEw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WvcTk45xAZCFENvyby2OMk1FWfmEvLPqNX8seJMaCJdUY8YncDkmzApaskxirJ/ml
	 fa77BDONYXif11i+yAqQJsUgSJMJMWA9QoMnx8orHF9k/u019l0PHqwOhax0A7bpuD
	 kGO2Ak85Dj99TyTjtwRzVfSql0NUwo1ECYXfft0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4288EF80218;
	Tue, 17 Dec 2019 04:22:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2245AF80218; Tue, 17 Dec 2019 04:22:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36145F8020B
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 04:22:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36145F8020B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 19:22:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,324,1571727600"; d="scan'208";a="212244309"
Received: from blydon-mobl.amr.corp.intel.com (HELO [10.254.68.38])
 ([10.254.68.38])
 by fmsmga007.fm.intel.com with ESMTP; 16 Dec 2019 19:22:29 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87woavhhfi.wl-kuninori.morimoto.gx@renesas.com>
 <87o8w7hhds.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <01e4157a-d4b7-8bb2-d3bf-957d47e3e5f9@linux.intel.com>
Date: Mon, 16 Dec 2019 21:22:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87o8w7hhds.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 6/6] ASoC: soc-core: add
 snd_soc_stream_stop()
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

Hi Morimoto-san,


> +void snd_soc_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream);

> +void snd_soc_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream)
> +{
> +	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		if (snd_soc_runtime_ignore_pmdown_time(rtd)) {
> +			/* powered down playback stream now */
> +			snd_soc_dapm_stream_event(rtd,
> +						  SNDRV_PCM_STREAM_PLAYBACK,
> +						  SND_SOC_DAPM_STREAM_STOP);
> +		} else {
> +			/* start delayed pop wq here for playback streams */
> +			rtd->pop_wait = 1;
> +			queue_delayed_work(system_power_efficient_wq,
> +					   &rtd->delayed_work,
> +					   msecs_to_jiffies(rtd->pmdown_time));
> +		}
> +	} else {
> +		/* capture streams can be powered down now */
> +		snd_soc_dapm_stream_event(rtd, SNDRV_PCM_STREAM_CAPTURE,
> +					  SND_SOC_DAPM_STREAM_STOP);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_stream_stop);

I am not a big fan of naming conventions for the new helper. We don't 
have any other snd_soc_stream function, but we have a concept of stream 
for SoundWire. we also have snd_soc_dapm_stream_ functions..

snd_soc_dapm_stream_stop() maybe?

thanks
-Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
