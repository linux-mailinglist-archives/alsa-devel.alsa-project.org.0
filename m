Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB5754FDD4
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 21:48:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 438011EDC;
	Fri, 17 Jun 2022 21:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 438011EDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655495334;
	bh=UArsJI0e93/zPeU0GTpsxAfxvbVJorGPGyLoU1Vq9ig=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jpWlBjdDRWFep8Q/0BbSW2a7wsYjPKfAcxlVNqjvejlfgsu5PmWtwzQ4Txh93ozKL
	 ydqQNuQG8AG4QkH2iV+g3rGYh4//u2pj642jQFFeHBKJZEaEdpG/q1QMkRbBwXm0SE
	 048D0DBw9pa4ZON6feI7USmsVcAAfOm/RDNXgqqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9224F80528;
	Fri, 17 Jun 2022 21:47:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CACAF80527; Fri, 17 Jun 2022 21:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6442F804BC
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 21:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6442F804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kPg65wmd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655495269; x=1687031269;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UArsJI0e93/zPeU0GTpsxAfxvbVJorGPGyLoU1Vq9ig=;
 b=kPg65wmd/A20mHnuB0CLolaVKP9qIiuDLkEAjewqH3N6yAmndlhpQTe1
 8s2p6dnkvGsO+zvS/Tb/sYX/bWfzy6nanv7lz/wb16KcDI/ywse0fQdpj
 44uUmEJ619SpluDYvd+6RQzILvcyOQe3nVeoAHicgKq4QpKQGnVmkNGdl
 GeI6bvX2q0CS3dOfNXAHxCDG/msBzEe9VLLexSYMlg99gsCjpbyiIQvO/
 M8sjb5NZ45YsFrJoFFQg3T61dnd6x1jII3AgtZd1nOAKLPdl9s83CVQHy
 BcFzpaewrbrZIW7HhBGm/UU96Pq7CmBGPLRMc2B4p+FilOogHvBjaCA0T w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="305003416"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="305003416"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 12:47:40 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="642163174"
Received: from patelman-mobl1.amr.corp.intel.com (HELO [10.212.115.29])
 ([10.212.115.29])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 12:47:39 -0700
Message-ID: <e993c4c7-a956-b669-f5b5-5d42c8b35f1e@linux.intel.com>
Date: Fri, 17 Jun 2022 14:47:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 03/11] ASoC: soc-component: use pm_runtime_resume_and_get()
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
 <20220616220427.136036-4-pierre-louis.bossart@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220616220427.136036-4-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 6/16/22 17:04, Pierre-Louis Bossart wrote:
> simplify the flow. No functionality change, except that on -EACCESS
> the reference count will be decreased.

This patch turns out to be incorrect and should not be merged.

I missed the fact that the component pm_runtime_put() will decrease the
reference count that is already decreased with
pm_runtime_resume_and_get() when pm_runtime is not enabled. This leads
to warnings:

snd-soc-dummy snd-soc-dummy: Runtime PM usage count underflow!

Unfortunately we missed those warnings during validation, that's not so
good.

pm_runtime_resume_and_get() really needs to be used ONLY when the
get/put are part of the same function and the reference count can be
checked. When the get/put are in different functions, it's asking for
trouble.

Also the check on -EACCES is problematic when the component is handled
by a framework, it's not clear if that can happen or not.

The rest of the patches follow the pattern get_sync/put and don't have a
problem.

Sorry for the noise.

> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
>  sound/soc/soc-component.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index e12f8244242b9..cb92e002c38bc 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -1213,11 +1213,11 @@ int snd_soc_pcm_component_pm_runtime_get(struct snd_soc_pcm_runtime *rtd,
>  	int i;
>  
>  	for_each_rtd_components(rtd, i, component) {
> -		int ret = pm_runtime_get_sync(component->dev);
> -		if (ret < 0 && ret != -EACCES) {
> -			pm_runtime_put_noidle(component->dev);
> +		int ret = pm_runtime_resume_and_get(component->dev);
> +
> +		if (ret < 0 && ret != -EACCES)
>  			return soc_component_ret(component, ret);
> -		}
> +
>  		/* mark stream if succeeded */
>  		soc_component_mark_push(component, stream, pm);
>  	}
