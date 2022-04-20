Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0109C508BEE
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 17:19:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96AF61ADE;
	Wed, 20 Apr 2022 17:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96AF61ADE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650467958;
	bh=+f8zw2+M+xo4E4iKHv4DnPjhY06IfOG5lA6m98XiFlk=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HIPWRquQA5eok1zMG/meWS6ULkGMqbHNVhdcHBhCb2sMOeyqgen3kirAHQE3YjGDl
	 J6KDezwsxPEEBf0g//PtUB7gsy8e5R8eCCEc0JkSoDikCj6yaTNTUTrPoO52AmJEw9
	 oydqrSDaxd6bLRR80EpkEsD7k+lyPs3MO1PSDX0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F39DF80128;
	Wed, 20 Apr 2022 17:18:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECF70F80125; Wed, 20 Apr 2022 17:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFB2BF8010B;
 Wed, 20 Apr 2022 17:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFB2BF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="I80e2H/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650467893; x=1682003893;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=+f8zw2+M+xo4E4iKHv4DnPjhY06IfOG5lA6m98XiFlk=;
 b=I80e2H/LxxqBpA6GZZHYEfad+aRsZhNhsUibmLc5HH8IC9P3u0TTGOv3
 WRkUji3aC59SKBpdXL71J6UtvCLfw4zbBT9QBdr7w4zDdO3YgRwgDSiG7
 lpaDt8Cuy8SUKSSu8gRBbL1cC9rq361gbq3pI9Ph32pChrWHP//nB8EWt
 azqmsvCwSEXh1ZCkrVLu8Kv3lvyVT3ABcGOOsAAXNbheCWTUgzDopekjT
 LUVPokPgqIUvn0SpOgxOWZ6wZX8lKjKEBBqtgRIjbnSNeClas6gOGpmjU
 vKXQOxymgBtHWNYFQv3kN0xrFLdeG7C+6iJ7gbLbNlRXyPZWyqTyWGr7I A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="245944027"
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="245944027"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 08:05:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="576625740"
Received: from sbidasar-mobl.amr.corp.intel.com (HELO [10.209.100.171])
 ([10.209.100.171])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 08:05:36 -0700
Message-ID: <78c7edc3-f431-9735-238d-9aa2b45ec45e@linux.intel.com>
Date: Wed, 20 Apr 2022 08:28:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: using pm_runtime_resume_and_get to simplify
 the code
To: cgel.zte@gmail.com
References: <20220420030315.2575691-1-chi.minghao@zte.com.cn>
Content-Language: en-US
In-Reply-To: <20220420030315.2575691-1-chi.minghao@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 lgirdwood@gmail.com, Minghao Chi <chi.minghao@zte.com.cn>,
 ranjani.sridharan@linux.intel.com, broonie@kernel.org, daniel.baluta@nxp.com,
 sound-open-firmware@alsa-project.org
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



On 4/19/22 22:03, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. This change is just to simplify the code, no
> actual functional changes.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>

Well, maybe that's a simplification, but we've been using the same pattern for years now.

Is there really a clear direction to use this new function?

the overwhelming majority of drivers in sound/soc still rely on the pm_runtime_get_sync (111 v. 7).


> ---
>  sound/soc/sof/sof-client-probes.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
> index 797dedb26163..c4c6e03c8133 100644
> --- a/sound/soc/sof/sof-client-probes.c
> +++ b/sound/soc/sof/sof-client-probes.c
> @@ -503,10 +503,9 @@ static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
>  	if (!buf)
>  		return -ENOMEM;
>  
> -	ret = pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
>  	if (ret < 0 && ret != -EACCES) {
>  		dev_err_ratelimited(dev, "debugfs read failed to resume %d\n", ret);
> -		pm_runtime_put_noidle(dev);
>  		goto exit;
>  	}
>  
> @@ -568,10 +567,9 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
>  
>  	desc = (struct sof_probe_point_desc *)tkns;
>  
> -	ret = pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
>  	if (ret < 0 && ret != -EACCES) {
>  		dev_err_ratelimited(dev, "debugfs write failed to resume %d\n", ret);
> -		pm_runtime_put_noidle(dev);
>  		goto exit;
>  	}
>  
> @@ -621,10 +619,9 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
>  		goto exit;
>  	}
>  
> -	ret = pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
>  	if (ret < 0) {
>  		dev_err_ratelimited(dev, "debugfs write failed to resume %d\n", ret);
> -		pm_runtime_put_noidle(dev);
>  		goto exit;
>  	}
>  
