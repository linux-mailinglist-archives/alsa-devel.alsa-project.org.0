Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 488FF16BC8
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 21:56:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1C2E17B8;
	Tue,  7 May 2019 21:55:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1C2E17B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557258965;
	bh=q4Q6ODFGE5i/V0FLcjasaSNPsQV0tCxowC+8z0K9Z5U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pUUw3IYI13D+sJuVBE0lxShP68zGHOzoSSNRFufafVcERfM0Bl9+Kjtws+HqxHaTq
	 CUXQg5ghew6B6wijZSBL8b9Gn/GQAJQXzibEu9l1gw+jJEQVA9ugzqDTrxG0ivB4KI
	 Z2PruBVSr7LWRl2sATIr35I6sSx4VVZvmZiSJBIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D828F89673;
	Tue,  7 May 2019 21:54:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A299EF89674; Tue,  7 May 2019 21:54:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2ACB4F89671
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 21:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ACB4F89671
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 12:54:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,443,1549958400"; d="scan'208";a="169338055"
Received: from kpalli-mobl2.amr.corp.intel.com (HELO [10.251.24.216])
 ([10.251.24.216])
 by fmsmga002.fm.intel.com with ESMTP; 07 May 2019 12:54:11 -0700
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20190507193910.23943-1-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1f114472-a9c0-503a-57a2-c3a0a9bbcf30@linux.intel.com>
Date: Tue, 7 May 2019 14:54:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507193910.23943-1-tiwai@suse.de>
Content-Language: en-US
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 alsa-devel@alsa-project.org, Jaska Uimonen <jaska.uimonen@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Propagate
 sof_get_ctrl_copy_params() error properly
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



On 5/7/19 2:39 PM, Takashi Iwai wrote:
> This fixes a compile warning below by properly handling the error code
> from sof_get_ctrl_copy_params():
>    include/linux/kernel.h:843:43: warning: 'sparams.pl_size' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    sound/soc/sof/ipc.c:639:34: note: 'sparams.pl_size' was declared here
> 
> The function returns an error before setting sparams.pl_size, so it'd
> assign an uninitialized value at a later point.

Thanks Takashi.

I don't recall having seen this warning and this code has been around 
for a while. Does this show with a special config/compiler?

Adding Jaska since he wrote the support for large control data.

> 
> Fixes: 53e0c72d98ba ("ASoC: SOF: Add support for IPC IO between DSP and Host")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/soc/sof/ipc.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
> index ba1bb17a8d1e..f0b9d3c53f6f 100644
> --- a/sound/soc/sof/ipc.c
> +++ b/sound/soc/sof/ipc.c
> @@ -567,7 +567,7 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
>   	size_t offset = 0;
>   	size_t msg_bytes;
>   	size_t pl_size;
> -	int err = 0;
> +	int err;
>   	int i;
>   
>   	/* allocate max ipc size because we have at least one */
> @@ -576,9 +576,13 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
>   		return -ENOMEM;
>   
>   	if (send)
> -		sof_get_ctrl_copy_params(cdata->type, cdata, partdata, sparams);
> +		err = sof_get_ctrl_copy_params(cdata->type, cdata, partdata,
> +					       sparams);
>   	else
> -		sof_get_ctrl_copy_params(cdata->type, partdata, cdata, sparams);
> +		err = sof_get_ctrl_copy_params(cdata->type, partdata, cdata,
> +					       sparams);
> +	if (err < 0)
> +		return err;
>   
>   	msg_bytes = sparams->msg_bytes;
>   	pl_size = sparams->pl_size;
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
