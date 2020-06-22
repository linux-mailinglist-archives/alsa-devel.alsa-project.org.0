Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B07203658
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 14:03:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0F6616B3;
	Mon, 22 Jun 2020 14:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0F6616B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592827434;
	bh=4UQVXcXNrU4xdYj2+WJUrWiIQDy7USnX9HkWeXOICOc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MJD6uoQ7ISAbr7IqfAHF8tnJE7/0/Fh7yacA1HM3HvbpWh1G03AFTedJLTZW8pLF2
	 MNmlXrkkKkICFfPrPhw6/xZsMQV63irWOK2jO6oW4Q/AH9u2+TghN1+mhZ/ETBraE1
	 LHqnX0LghKBmrr2tv51Z1qKvKwkC1EY/8hMpFGNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 313D0F80246;
	Mon, 22 Jun 2020 14:02:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B39DF801F2; Mon, 22 Jun 2020 14:02:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5100FF80162
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 14:01:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5100FF80162
IronPort-SDR: v4ZkiihxF01w0p2sLhZyMVb1+9Cnv1I/eqrPTIBKTxITlXpIxBt6zEe0C6EwkTEgmyR4D2Gybw
 8H1tj1VLdgoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="205215181"
X-IronPort-AV: E=Sophos;i="5.75,266,1589266800"; d="scan'208";a="205215181"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 05:01:53 -0700
IronPort-SDR: VxNc8gByYckHZDa28hkIysNb0y+oFKf7ZDX56ADAS8ZbGXncunL4QnyACOtgtfoTRaWj7VxyR6
 g9LKXbKAjiPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,266,1589266800"; d="scan'208";a="300815872"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jun 2020 05:01:52 -0700
Date: Mon, 22 Jun 2020 15:01:37 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 01/16] ASoC: soc-component: merge snd_soc_component_read()
 and snd_soc_component_read32()
In-Reply-To: <87sgev4mfl.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <alpine.DEB.2.22.394.2006221450410.3186@eliteleevi.tm.intel.com>
References: <87tuzb4mjg.wl-kuninori.morimoto.gx@renesas.com>
 <87sgev4mfl.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello, 

On Tue, 16 Jun 2020, Kuninori Morimoto wrote:

> This patch do
> 	1) merge snd_soc_component_read() and snd_soc_component_read32()
> 	2) it uses soc_component_err() when error case (easy to notice)
> 	3) keeps read32 for now by #define
> 	4) update snd_soc_component_read() for all drivers

removing the possibility to return errors is a bit iffy, but reviewing
the existing usage, indeed in practise it is not much used.

And on the other side, having two component_read() variants with different 
style and overlapping usage, in soc-component.h, is very confusing, so 
this patch does clean up the component interface. So all in all, my 
++votes for the change.

I spotted one minor whitespace issue, but that's trivial, so for
the patch:
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -616,12 +616,11 @@ static const char *soc_dapm_prefix(struct snd_soc_dapm_context *dapm)
>  	return dapm->component->name_prefix;
>  }
>  
> -static int soc_dapm_read(struct snd_soc_dapm_context *dapm, int reg,
> -	unsigned int *value)
> +static unsigned int soc_dapm_read(struct snd_soc_dapm_context *dapm, int reg)
>  {
>  	if (!dapm->component)
>  		return -EIO;
> -	return snd_soc_component_read(dapm->component, reg, value);
> +	return  snd_soc_component_read(dapm->component, reg);

Trivial but you have extra whitespace there after return.

Br, Kai
