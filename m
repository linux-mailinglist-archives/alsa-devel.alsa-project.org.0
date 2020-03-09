Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A7217E5A7
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 18:24:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2E741687;
	Mon,  9 Mar 2020 18:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2E741687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583774674;
	bh=JfRoXLPPF7bYms1KVhvACH++ioLRDllo8n3E03XmSxg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z1ezhl3GklQ9UBpjEyzOXbJfoxlmz2yOJdH9cUFLwccqevGCiURRAD8qlta6kwuZt
	 nPmBtOrjvkCQYnn3aT2VwsamswqBw33QhdkbwIZYjzFMe/b9M2ceelcCOK7UHUWnlZ
	 2AvvDgn7JeiTZQf/uNcEFVHF2Nob9TLe4bXpREv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2A48F80260;
	Mon,  9 Mar 2020 18:21:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7B16F80260; Mon,  9 Mar 2020 18:21:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB9F2F800B5
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 18:21:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB9F2F800B5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 10:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="231003464"
Received: from jdbostic-mobl1.amr.corp.intel.com (HELO [10.251.152.35])
 ([10.251.152.35])
 by orsmga007.jf.intel.com with ESMTP; 09 Mar 2020 10:21:41 -0700
Subject: Re: [PATCH] ASoC: SOF: Fix probe point getter
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200309142124.29262-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d83bf2b3-b97f-d1de-4356-752d0eb2b5a3@linux.intel.com>
Date: Mon, 9 Mar 2020 11:58:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309142124.29262-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: broonie@kernel.org, lgirdwood@gmail.com
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



On 3/9/20 9:21 AM, Cezary Rojewski wrote:
> Firmware API changes which introduced 'num_elems' param in several probe
> structs such as sof_ipc_probe_dma_add_params also impacted getter for
> both, DMA and probe points. All struct handlers except for
> sof_ipc_probe_info_params have been updated. Align said handler too to
> calculate payload size correctly.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Cezary!

> Fixes: f3b433e4699f ("ASoC: SOF: Implement Probe IPC API") > ---
>   sound/soc/sof/probe.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/probe.c b/sound/soc/sof/probe.c
> index 2b2f3dcfc7e9..c38169fe00c5 100644
> --- a/sound/soc/sof/probe.c
> +++ b/sound/soc/sof/probe.c
> @@ -95,13 +95,17 @@ static int sof_ipc_probe_info(struct snd_sof_dev *sdev, unsigned int cmd,
>   	if (!reply->num_elems)
>   		goto exit;
>   
> -	bytes = reply->num_elems * sizeof(reply->dma[0]);
> +	if (cmd == SOF_IPC_PROBE_DMA_INFO)
> +		bytes = sizeof(reply->dma[0]);
> +	else
> +		bytes = sizeof(reply->desc[0]);
> +	bytes *= reply->num_elems;
>   	*params = kmemdup(&reply->dma[0], bytes, GFP_KERNEL);
>   	if (!*params) {
>   		ret = -ENOMEM;
>   		goto exit;
>   	}
> -	*num_params = msg.num_elems;
> +	*num_params = reply->num_elems;
>   
>   exit:
>   	kfree(reply);
> 
