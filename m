Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD038A22DC
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 19:56:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F25D71676;
	Thu, 29 Aug 2019 19:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F25D71676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567101377;
	bh=Ohqs6E9PdL61wblEGf5HGml5hv355fnpKjF7JGTTjS8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fWfKjC6ZHf0wtoOxKanElv2IX8ZKA7GFQkIbM8CAaUP4DJSLN7V8rx9gtnW5g1GSt
	 R61asy/lREo27eeM32Vi54X/0lQcgw7wL8xvyPSbBjyF97FgLrFCagdq8SeJirg/gJ
	 81uP7MImBJiS645yKn1RU3g7qOD0NEbSETqyo+L0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 578F0F80148;
	Thu, 29 Aug 2019 19:54:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20B89F80148; Thu, 29 Aug 2019 19:54:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAB17F800F1
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 19:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAB17F800F1
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 10:54:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,444,1559545200"; d="scan'208";a="265064623"
Received: from sauravna-mobl.amr.corp.intel.com (HELO [10.251.11.53])
 ([10.251.11.53])
 by orsmga001.jf.intel.com with ESMTP; 29 Aug 2019 10:54:22 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org, 
 robh+dt@kernel.org, vkoul@kernel.org
References: <20190829144442.6210-1-srinivas.kandagatla@linaro.org>
 <20190829144442.6210-5-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <33e04646-ac7e-3ba1-3e09-a4f27a1b250b@linux.intel.com>
Date: Thu, 29 Aug 2019 11:36:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829144442.6210-5-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v5 4/4] ASoC: codecs: add wsa881x amplifier
 support
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


> +static int wsa881x_ramp_pa_gain(struct snd_soc_component *comp,
> +				int min_gain, int max_gain, int udelay)
> +{
> +	int val;
> +
> +	for (val = min_gain; max_gain <= val; val--) {
> +		snd_soc_component_update_bits(comp, WSA881X_SPKR_DRV_GAIN,
> +					      0xF0, val << 4);
> +		/*
> +		 * 1ms delay is needed for every step change in gain as per
> +		 * HW requirement.
> +		 */
> +		usleep_range(udelay, udelay + 10);

nit-pick: it'd be nicer to have udelay explicitly set here instead of in 
the caller below for consistency with the comments.

> +			wsa881x_ramp_pa_gain(comp, min_gain, max_gain, 1000);

But apart from that I didn't see anything blatantly wrong, so

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
