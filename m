Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6647653C7E3
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 11:48:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F2B41828;
	Fri,  3 Jun 2022 11:48:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F2B41828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654249731;
	bh=WQz1P93jqawAYhPsWpCHv9lCqsm69nzliCcknvez5jY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DxPGCLBhYCYy46rOCVqtclUAuE2WEuHLHGWWWQvl8Y9Y1XNVdrt8AjwbJmBaVFYja
	 9NxDZXHjRTn25QkzNeex0UyWt0xLQK7gvs+w6jj7FRKmG49PKeGwgqcRfg71ZZsgJs
	 m4UMwvqFqpjEF88MGAqlyJugJoLjELTxdpyNS40c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C966F804D1;
	Fri,  3 Jun 2022 11:47:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B58DF804CC; Fri,  3 Jun 2022 11:47:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B85C6F80124;
 Fri,  3 Jun 2022 11:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B85C6F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MA42XlIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654249667; x=1685785667;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WQz1P93jqawAYhPsWpCHv9lCqsm69nzliCcknvez5jY=;
 b=MA42XlIjXIvHSfgEHe4Igviil2cPo0UWkifxV7B0nu7jtHPih/LRLcY/
 HZpqeF0cx1sXDPbi7y2SMeSH93uNQQKFfMLb7zKxZBo6x3ymU0vnV+VPi
 tUCG7BHKaqQIpH02S9C2fah8LOuwHvIsH/by3Mh6BwVmZSLAIHQbyBN9H
 FmbUwGgZF9EwdUKbZvVwcd1FnKOEIwiiKx2doMkSjXHaxbwiqTDyrxL8t
 pW3Ds51dL9BkfsneTiw+chxXCONh/ZBjBAk27SUsBooIfnASV0FkJ7hDi
 7VlBfwJB2D+eFRdPu66JDfoAPKoFCRqhSc2se9NpwT2GRsidskIkdR/P/ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="301586542"
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; d="scan'208";a="301586542"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 02:47:41 -0700
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; d="scan'208";a="721689695"
Received: from nmoazzen-mobl2.amr.corp.intel.com (HELO [10.251.214.119])
 ([10.251.214.119])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 02:47:37 -0700
Message-ID: <c756fc79-281e-9c41-6070-c79ca6eb7c32@linux.intel.com>
Date: Fri, 3 Jun 2022 12:48:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] ASoC: SOF: ipc-msg-injector: Propagate write errors
 correctly
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <Yph+Cd+JrfOH0i7z@kili>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <Yph+Cd+JrfOH0i7z@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
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



On 02/06/2022 12:08, Dan Carpenter wrote:
> This code is supposed to propagate errors from simple_write_to_buffer()
> or return -EFAULT if "size != count".  However "size" needs to be signed
> for the code to work correctly and the case where "size == 0" is not
> handled correctly.

Thanks Dan!

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Fixes: 066c67624d8c ("ASoC: SOF: ipc-msg-injector: Add support for IPC4 messages")
> Fixes: 2f0b1b013bbc ("ASoC: SOF: debug: Add support for IPC message injection")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/soc/sof/sof-client-ipc-msg-injector.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
> index 03490a4d4ae7..030cb97d7713 100644
> --- a/sound/soc/sof/sof-client-ipc-msg-injector.c
> +++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
> @@ -150,7 +150,7 @@ static ssize_t sof_msg_inject_dfs_write(struct file *file, const char __user *bu
>  {
>  	struct sof_client_dev *cdev = file->private_data;
>  	struct sof_msg_inject_priv *priv = cdev->data;
> -	size_t size;
> +	ssize_t size;
>  	int ret;
>  
>  	if (*ppos)
> @@ -158,8 +158,10 @@ static ssize_t sof_msg_inject_dfs_write(struct file *file, const char __user *bu
>  
>  	size = simple_write_to_buffer(priv->tx_buffer, priv->max_msg_size,
>  				      ppos, buffer, count);
> +	if (size < 0)
> +		return size;
>  	if (size != count)
> -		return size > 0 ? -EFAULT : size;
> +		return -EFAULT;
>  
>  	memset(priv->rx_buffer, 0, priv->max_msg_size);
>  
> @@ -179,7 +181,7 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
>  	struct sof_client_dev *cdev = file->private_data;
>  	struct sof_msg_inject_priv *priv = cdev->data;
>  	struct sof_ipc4_msg *ipc4_msg = priv->tx_buffer;
> -	size_t size;
> +	ssize_t size;
>  	int ret;
>  
>  	if (*ppos)
> @@ -192,8 +194,10 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
>  	size = simple_write_to_buffer(&ipc4_msg->header_u64,
>  				      sizeof(ipc4_msg->header_u64),
>  				      ppos, buffer, count);
> +	if (size < 0)
> +		return size;
>  	if (size != sizeof(ipc4_msg->header_u64))
> -		return size > 0 ? -EFAULT : size;
> +		return -EFAULT;
>  
>  	count -= size;
>  	if (!count) {
> @@ -201,8 +205,10 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
>  		size = simple_write_to_buffer(ipc4_msg->data_ptr,
>  					      priv->max_msg_size, ppos, buffer,
>  					      count);
> +		if (size < 0)
> +			return size;
>  		if (size != count)
> -			return size > 0 ? -EFAULT : size;
> +			return -EFAULT;
>  	}
>  
>  	ipc4_msg->data_size = count;

-- 
Péter
