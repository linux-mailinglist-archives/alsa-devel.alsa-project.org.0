Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B8E2E4232
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 16:19:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14B11172B;
	Mon, 28 Dec 2020 16:18:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14B11172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609168749;
	bh=UcccoWhh17/i/jeVpOM88CeNx22V+hGHPGvaeioTeFI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZYkvlwEs9HEBp9DE4Z0xkZS3xzx/PVhdBKmVZtj0LNOqwPA6iqrv5qikCMGCpCPP7
	 4ijxmW4OWSRyWVh6EhfiKhNBuQjGYlh7U2YVbCFmd1zCIYUHEs/08dbY44q2yJJbZi
	 +WpGXPv44pEecSpif8QVATDTD09sTIMBG1PvBdhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8454DF801ED;
	Mon, 28 Dec 2020 16:17:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CF64F801F5; Mon, 28 Dec 2020 16:17:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D07C2F8014E
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 16:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D07C2F8014E
IronPort-SDR: NcsVt/7CbJn9l5FGhLgR53ItyI0KMUjMjz6bTRrPsk2bsMe8pbzbGpFwY+t7Gediy5kZCwsLxW
 oG/Kzto2pLug==
X-IronPort-AV: E=McAfee;i="6000,8403,9847"; a="163452255"
X-IronPort-AV: E=Sophos;i="5.78,455,1599548400"; d="scan'208";a="163452255"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2020 07:17:10 -0800
IronPort-SDR: /hhusGWpybZVE7ReRK0EK5dSdn6GWCAswidrYSs6Nf+O/rvdI/YlqYJU9d4/NZpepe8HOG6Sqe
 YExJq2ifiXmQ==
X-IronPort-AV: E=Sophos;i="5.78,455,1599548400"; d="scan'208";a="418841546"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2020 07:17:08 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ktuHi-000EnE-Fl; Mon, 28 Dec 2020 17:18:10 +0200
Date: Mon, 28 Dec 2020 17:18:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] catpt: Switch to use list_entry_is_head() helper
Message-ID: <20201228151810.GA4077@smile.fi.intel.com>
References: <20201214172138.44267-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201214172138.44267-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Cezary Rojewski <cezary.rojewski@intel.com>
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

On Mon, Dec 14, 2020 at 07:21:38PM +0200, Andy Shevchenko wrote:
> Since we got list_entry_is_head() helper in the generic header,
> we may switch catpt to use it. It removes the need in additional variable.

Mark, should I resend?

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
> v2: left the structure definition at its initial location (Cezary)
>  sound/soc/intel/catpt/pcm.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
> index e5d54bb1c42a..9d304b3a817f 100644
> --- a/sound/soc/intel/catpt/pcm.c
> +++ b/sound/soc/intel/catpt/pcm.c
> @@ -331,7 +331,7 @@ static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
>  {
>  	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
>  	struct snd_soc_component *component = dai->component;
> -	struct snd_kcontrol *pos, *kctl = NULL;
> +	struct snd_kcontrol *pos;
>  	const char *name;
>  	int ret;
>  	u32 id = stream->info.stream_hw_id;
> @@ -356,17 +356,15 @@ static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
>  
>  	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
>  		if (pos->private_data == component &&
> -		    !strncmp(name, pos->id.name, sizeof(pos->id.name))) {
> -			kctl = pos;
> +		    !strncmp(name, pos->id.name, sizeof(pos->id.name)))
>  			break;
> -		}
>  	}
> -	if (!kctl)
> +	if (list_entry_is_head(pos, &component->card->snd_card->controls, list))
>  		return -ENOENT;
>  
>  	if (stream->template->type != CATPT_STRM_TYPE_LOOPBACK)
> -		return catpt_set_dspvol(cdev, id, (long *)kctl->private_value);
> -	ret = catpt_ipc_mute_loopback(cdev, id, *(bool *)kctl->private_value);
> +		return catpt_set_dspvol(cdev, id, (long *)pos->private_value);
> +	ret = catpt_ipc_mute_loopback(cdev, id, *(bool *)pos->private_value);
>  	if (ret)
>  		return CATPT_IPC_ERROR(ret);
>  	return 0;
> -- 
> 2.29.2
> 

-- 
With Best Regards,
Andy Shevchenko


