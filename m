Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D06823139A9
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 17:40:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DDBD1689;
	Mon,  8 Feb 2021 17:39:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DDBD1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612802403;
	bh=H/o5ERFJuNw+7tbuz6wwvGb+AH45MZOb871ZZJtlLcg=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mb3e2p9masDg1uS/brNptKHlViOuMssxfBjVNFheQfrzCnFjUYmWiTsjxpL3kCtO0
	 ptXvG0TfS6sBy6zBO8RFOomua5Y5GS2COj13qCR/fERNxh1V/YmbEgWWwZmxjxwdQn
	 FQtBHzjxyeaR49tJXSV1MOdiid3SS6AYxez9VVtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ED44F80264;
	Mon,  8 Feb 2021 17:38:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EBCCF80114; Mon,  8 Feb 2021 17:38:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FD62F80114
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 17:38:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FD62F80114
IronPort-SDR: hTFyEHTgX1J/TZZ8EjMnbf+ulWA169HY7T9ZUcMJDI690zVXGOY/wdmMm9b1/0yQ8Ge/BXt0Kt
 bg94cMWij8vA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="245810575"
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="245810575"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 08:38:19 -0800
IronPort-SDR: D9EfWtRan1jmZTToggEjetd8rEb9BJbuSSQbU/lDQJ+yj0JutuBTxdWy9cAsIPXsTQYxtwHYEs
 l+fwKAUPhuYw==
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="377835358"
Received: from rahaness-mobl.amr.corp.intel.com (HELO [10.212.141.76])
 ([10.212.141.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 08:38:17 -0800
Subject: Re: [PATCH] ASoC: soc-pcm: change error message to debug message
To: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <1612771965-5776-1-git-send-email-shengjiu.wang@nxp.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b7f5442d-ad21-eb8a-7d90-7a8207320541@linux.intel.com>
Date: Mon, 8 Feb 2021 09:06:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612771965-5776-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 2/8/21 2:12 AM, Shengjiu Wang wrote:
> This log message should be a debug message, because it
> doesn't return directly but continue next loop.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>   sound/soc/soc-pcm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 605acec48971..cd9e919d7b99 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1344,8 +1344,8 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
>   		/* is there a valid BE rtd for this widget */
>   		be = dpcm_get_be(card, widget, stream);
>   		if (!be) {
> -			dev_err(fe->dev, "ASoC: no BE found for %s\n",
> -					widget->name);
> +			dev_dbg(fe->dev, "ASoC: no BE found for %s\n",
> +				widget->name);

Do we really want to do this?

This error message has historically been the means by which we detect 
that userspace didn't set the right mixers (e.g. on Intel Baytrail) or 
the topology was incorrect. And it's really an error in the sense that 
you will not get audio in or out.

If you demote this to dev_dbg, we'll have to ask every single user who 
reports 'sound is broken' to enable dynamic debug traces. I really don't 
see the benefit, this is a clear case of 'fail big and fail early', 
partly concealing the problem doesn't make it go away but harder to 
diagnose.
