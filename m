Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E030D505F64
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Apr 2022 23:34:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ADF116E7;
	Mon, 18 Apr 2022 23:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ADF116E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650317688;
	bh=Zn+NXcLyI1ueXup+QlRSkgZFGbo5MELKDMfnPmqO124=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RzVpsHjjkOy6gp8O7/RX5R9ZnDqG9YrtGfhLOfuJj6eENFizlFyNSyeXRrYbQtS5M
	 5bhnXzKGZWFMGwBB2XkhichoArH/ou1hUg4+i9Qqs5CX2PHtHb0nvNUL6q2+BDtpag
	 2+4dvqn4vhFpaVWZvF/bkFrQnSpnU4+nuW4PBPJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1B48F80311;
	Mon, 18 Apr 2022 23:33:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0627CF8014E; Mon, 18 Apr 2022 23:33:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A6C2F800F5
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 23:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A6C2F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="morQv7JC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650317625; x=1681853625;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Zn+NXcLyI1ueXup+QlRSkgZFGbo5MELKDMfnPmqO124=;
 b=morQv7JCvsFi+jQwZs76ZFFi4/WMzVbiOykYKVKL7bzMusB3RIhSdLOQ
 dNeN4pn35oAySZzrP7mitF145agMsN7ioBkonFuFbUf8bhIZ1FNe1ny9X
 Wl93uNMeT5VZ92hVwfEk7cvIRJe4WSwdhVyRfTTiknLdv3VO2JhYG/jBv
 pHO7e+vF8/7SL7QvtHTw1fRpway5Q2pm5mcyu8emdk+3V4ihisGL6aMCg
 PqguWYpGrVTKOsqilzkDgsbw4MwGbNjGohoTLvovCa9yZN1BXxiQe6v4D
 6TX4roJbnYntTW9WHMKPZf7Z5usMxAMpxn83arWEAeLIXp/TKW6e/mEzb w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="263077428"
X-IronPort-AV: E=Sophos;i="5.90,270,1643702400"; d="scan'208";a="263077428"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 14:33:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,270,1643702400"; d="scan'208";a="665535405"
Received: from tsahu-mobl.amr.corp.intel.com (HELO [10.251.20.74])
 ([10.251.20.74])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 14:33:22 -0700
Message-ID: <c77d892f-4ff3-f7ad-482f-c9673a3cd86f@linux.intel.com>
Date: Mon, 18 Apr 2022 16:33:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v1 2/4] ASoC: ops: Fix stereo change notifications in
 snd_soc_put_volsw_sx()
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <20220201155629.120510-1-broonie@kernel.org>
 <20220201155629.120510-3-broonie@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220201155629.120510-3-broonie@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
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



On 2/1/22 09:56, Mark Brown wrote:
> When writing out a stereo control we discard the change notification from
> the first channel, meaning that events are only generated based on changes
> to the second channel. Ensure that we report a change if either channel
> has changed.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  sound/soc/soc-ops.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
> index 73c9d53de25b..f0d1aeb38346 100644
> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c
> @@ -413,6 +413,7 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
>  	int min = mc->min;
>  	unsigned int mask = (1U << (fls(min + max) - 1)) - 1;
>  	int err = 0;
> +	int ret;
>  	unsigned int val, val_mask;
>  
>  	val_mask = mask << shift;
> @@ -422,6 +423,7 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
>  	err = snd_soc_component_update_bits(component, reg, val_mask, val);
>  	if (err < 0)
>  		return err;
> +	ret = err;
>  
>  	if (snd_soc_volsw_is_stereo(mc)) {
>  		unsigned int val2;
> @@ -432,6 +434,11 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
>  
>  		err = snd_soc_component_update_bits(component, reg2, val_mask,
>  			val2);
> +
> +		/* Don't discard any error code or drop change flag */
> +		if (ret == 0 || err < 0) {
> +			ret = err;
> +		}
>  	}
>  	return err;

cppcheck flags a warning on this patch, I believe we should use "return ret;" here, as done in the other patches of this series?

https://github.com/thesofproject/linux/pull/3597/commits/85b667d190953231ef314ac429019a011596f6d7

