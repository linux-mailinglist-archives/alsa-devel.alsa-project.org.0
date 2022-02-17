Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6FE4B99B2
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 08:18:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1429A182B;
	Thu, 17 Feb 2022 08:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1429A182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645082318;
	bh=i3vLeRSvKXK9W1RF0/Yuinq0IT1mN8b0hgGHomjXJsY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ri7T/WkBGapzxF/IspNPK4SExMED/JKBLB/c2ow+od5ubRjWfjxR7Ee2EJYqYA6lb
	 sJpKP1QO75AlgD+TDNmcANPissAHgTaAiLqOQIu/LTuXssfRmRjbJtLtOxolwOQ86F
	 RLV9yRodvRQxcmA4ubBP8J8y1TYqeD2QNGi2bpIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F05EF80246;
	Thu, 17 Feb 2022 08:17:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7206F80240; Thu, 17 Feb 2022 08:17:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0F96F800C0
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 08:17:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0F96F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hmmNDNJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645082245; x=1676618245;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=i3vLeRSvKXK9W1RF0/Yuinq0IT1mN8b0hgGHomjXJsY=;
 b=hmmNDNJ07mtbQmwzK263p/Vor85X13h+Ja05qg5HgGRf7s3KZO2Xnzhj
 zt4P31Aq7kegTf4otO5Aj6F1b2NFmfpZVpHoNuk18ZJpbTOP/R3wXZ7qG
 Ne0uhJN7B4Z3hXTm1MJd142tDQWHHteY7/atJ14TCWfUX68mUF6Os4b6a
 +js8+PeWJ5rkR/l1tZCDD0UBZuU/uBFzj7KEBjuiZD2aOWu3SfVnNDd3i
 xcqDv9qec8Bp97kdb/fjrBA7UdKRrZ+I/kJoNNmcAKYXxgZ3bvSr4sCka
 9n8O+W1CYAq9ZN3awVkGJEbK7s7Y4XauLoJ58+G1QDHN7KXK5zRW0ZGQd w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="311555946"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="311555946"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 23:17:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="681839546"
Received: from vcraciun-mobl.ger.corp.intel.com (HELO [10.252.61.53])
 ([10.252.61.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 23:17:15 -0800
Message-ID: <fa8546ec-c475-7169-f3e5-7afb93fa60aa@linux.intel.com>
Date: Thu, 17 Feb 2022 09:17:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] ASoC: SOF: core: unregister clients and machine
 drivers in .shutdown
Content-Language: en-US
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220216133241.3990281-1-kai.vehmanen@linux.intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220216133241.3990281-1-kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, daniel.baluta@nxp.com
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



On 16/02/2022 15:32, Kai Vehmanen wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> On a platform shutdown, the expectation for most drivers is that
> userspace tasks will release all resources. When those sequences do
> not complete, it can be the case that PCM devices exposed by ALSA
> cards are used *after* the DSP shutdown completes, leading to a
> platform hang.
> 
> When the clients and machine drivers provide an _unregister callback,
> let's invoke it in the shutdown sequence.

Github lost my Reviewed-by...

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>  sound/soc/sof/core.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> V1->V2:
>   - correct patch title to have "ASoC: SOF: " prefix (reported
>     by Amadeusz)
> 
> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index d99ecbb4282d..2a35d8ddf43e 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -463,10 +463,19 @@ EXPORT_SYMBOL(snd_sof_device_remove);
>  int snd_sof_device_shutdown(struct device *dev)
>  {
>  	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
> +	struct snd_sof_pdata *pdata = sdev->pdata;
>  
>  	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
>  		cancel_work_sync(&sdev->probe_work);
>  
> +	/*
> +	 * make sure clients and machine driver(s) are unregistered to force
> +	 * all userspace devices to be closed prior to the DSP shutdown sequence
> +	 */
> +	sof_unregister_clients(sdev);
> +
> +	snd_sof_machine_unregister(sdev, pdata);
> +
>  	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE)
>  		return snd_sof_shutdown(sdev);
>  
> 
> base-commit: f7d344a2bd5ec81fbd1ce76928fd059e57ec9bea

-- 
Péter
