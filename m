Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1674B831D
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 09:40:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF5B5172C;
	Wed, 16 Feb 2022 09:39:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF5B5172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645000804;
	bh=KqWDucsnUhxwQ5qGTdYTWYlRrWbp/rqcIKImDN2LieU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UVJej19bv4JOwf8Byex8O3KuK14VdeOkfDPoq6yoz5WEaICLV+IhWFnEKRi+Ktp1z
	 DGeN4JqSGSLOTOZTsXSYMT64oZMSiBzDz2w4o0SVjZeEzc6mlAQWwPJCeFyRZQWcMC
	 v+5AHxCObu8vG0IbFKJG/wxkL0vLrePNV60GoV/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32FF8F80134;
	Wed, 16 Feb 2022 09:38:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6125BF80128; Wed, 16 Feb 2022 09:38:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 733CCF800D8
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 09:38:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 733CCF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nbwYnNmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645000729; x=1676536729;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KqWDucsnUhxwQ5qGTdYTWYlRrWbp/rqcIKImDN2LieU=;
 b=nbwYnNmHmMPZBS/3b81marNvee60b3x/Dtmi3rOGYR+EfmM+l5clu7Ho
 Y9SvhTTNnnmjFZ4r+kt8whLR2+rjbFxJmTrnvyAmH56zxgBIDvdjlck/M
 xxxVKN3/ZDaSxro+geOq2oKvtRf2vOCHwzI7tX0kH3qv2XYVWiVXfADvL
 z+O7cDJ7laKIhTyLFuSah+FljUxFd3dromXM8pUoXuszVkOGt2h92e2mA
 ypSE0M8cxJLJDRTUVErYAA42T5scDY5nYPA1J7Ix/aqEUIjUk2AKcUNBQ
 H2+vINn8Afxj94MQ7FwU4nRqH70oJHKbx75/sS8z1S0SJvw174RmErBAY g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="275133549"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="275133549"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:38:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="544804321"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.215])
 ([10.99.249.215])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:38:38 -0800
Message-ID: <82363efa-10c4-192e-d8dc-4abeb0f63543@linux.intel.com>
Date: Wed, 16 Feb 2022 09:38:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] ASoC: core: unregister clients and machine drivers in
 .shutdown
Content-Language: en-US
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220215180628.3893282-1-kai.vehmanen@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220215180628.3893282-1-kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, daniel.baluta@nxp.com
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

On 2/15/2022 7:06 PM, Kai Vehmanen wrote:

Nitpicking, but I guess "SOF:" got lost in title ;)

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
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>   sound/soc/sof/core.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index d99ecbb4282d..2a35d8ddf43e 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -463,10 +463,19 @@ EXPORT_SYMBOL(snd_sof_device_remove);
>   int snd_sof_device_shutdown(struct device *dev)
>   {
>   	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
> +	struct snd_sof_pdata *pdata = sdev->pdata;
>   
>   	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
>   		cancel_work_sync(&sdev->probe_work);
>   
> +	/*
> +	 * make sure clients and machine driver(s) are unregistered to force
> +	 * all userspace devices to be closed prior to the DSP shutdown sequence
> +	 */
> +	sof_unregister_clients(sdev);
> +
> +	snd_sof_machine_unregister(sdev, pdata);
> +
>   	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE)
>   		return snd_sof_shutdown(sdev);
>   
> 
> base-commit: f7d344a2bd5ec81fbd1ce76928fd059e57ec9bea

