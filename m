Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE2D56822B
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 10:56:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB9971658;
	Wed,  6 Jul 2022 10:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB9971658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657097766;
	bh=U0htDIIwhpcah+EPk3c0bva5ZhF6BmA8fSZxA04XU+o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NQiaM81bi1bXo4mnthddAj5ZSLESlGSfzFC9dPyUWXMBy1631mKyQpWpGR2bOhrGn
	 /9iurX+M3LBwMHooHYmbFky3NHJA2oCbT24wL59Xt7Aj6Za/oO3fwPrWbeD450FSat
	 L85+wS21NkFWQYlESW0d5zBftA/1J9vVnM0R9OOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E743EF804E0;
	Wed,  6 Jul 2022 10:55:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0D1BF8023A; Wed,  6 Jul 2022 10:55:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16396F8012A;
 Wed,  6 Jul 2022 10:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16396F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZVM5jCRC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657097698; x=1688633698;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=U0htDIIwhpcah+EPk3c0bva5ZhF6BmA8fSZxA04XU+o=;
 b=ZVM5jCRC7C2ylpw52MAVhen8f9UHHe+XXlNxqHRUVYNwLN7Wsxavaeqa
 6NABhUPjLn3IjPuDo7Ou5ytRKySg35dhPgcw62w3w2zEOIQm/ZSjlQ6On
 1mxildUHNuYtAqg7lQRWlgsYNWuHZFg47mxuZBXG/xi2pQO4gHSYj+9Ju
 6kKk5/Sr63BprSprlc5jvSVLr9Tj49EC/zkXYzTHa2Xvv5g69k1W50jeG
 DT3ky/8nR/bg6dTALRKvO49sw5atriqGnB9Uuyyh9sy0S8GhaBVR2Wu0X
 vpfjg18EEiDk8FgSYEoRuoXw36Uh428Vf+31DB+NcNCvs1iEvoSSKHN3Z g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="370005141"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="370005141"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 01:54:49 -0700
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="920075962"
Received: from gguerra-mobl1.ger.corp.intel.com (HELO [10.249.254.46])
 ([10.249.254.46])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 01:54:46 -0700
Message-ID: <4cf393e1-00f6-2b5b-a5f5-9f555fdeafdc@linux.intel.com>
Date: Wed, 6 Jul 2022 11:55:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: SOF: ipc-msg-injector: fix copy in
 sof_msg_inject_ipc4_dfs_write()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <YsUzQPyZYMkhN/Q9@kili>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YsUzQPyZYMkhN/Q9@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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



On 06/07/2022 10:01, Dan Carpenter wrote:
> The bug here is that when we copy the payload the value of *ppos should
> be zero but it is sizeof(ipc4_msg->header_u64) instead.  That means that
> the buffer will be copied to the wrong location within the
> ipc4_msg->data_ptr buffer.
> 
> Really, in this context, it is simpler and more appropriate to use
> copy_from_user() instead of simple_write_to_buffer() so I have
> re-written the function.
> 
> Fixes: 066c67624d8c ("ASoC: SOF: ipc-msg-injector: Add support for IPC4 messages")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  Not tested.  I believe this function is mostly
> used to write random junk to the device and see what breaks.  So
> probably it works fine as-is.
> 
>  sound/soc/sof/sof-client-ipc-msg-injector.c | 27 ++++++++-------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
> index 6bdfa527b7f7..e8ab173e95b5 100644
> --- a/sound/soc/sof/sof-client-ipc-msg-injector.c
> +++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
> @@ -181,7 +181,7 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
>  	struct sof_client_dev *cdev = file->private_data;
>  	struct sof_msg_inject_priv *priv = cdev->data;
>  	struct sof_ipc4_msg *ipc4_msg = priv->tx_buffer;
> -	ssize_t size;
> +	size_t data_size;
>  	int ret;
>  
>  	if (*ppos)
> @@ -191,25 +191,18 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
>  		return -EINVAL;
>  
>  	/* copy the header first */
> -	size = simple_write_to_buffer(&ipc4_msg->header_u64,
> -				      sizeof(ipc4_msg->header_u64),
> -				      ppos, buffer, count);
> -	if (size < 0)
> -		return size;
> -	if (size != sizeof(ipc4_msg->header_u64))
> +	if (copy_from_user(&ipc4_msg->header_u64, buffer,
> +			   sizeof(ipc4_msg->header_u64)))
>  		return -EFAULT;
>  
> -	count -= size;
> +	data_size = count - sizeof(ipc4_msg->header_u64);
> +	if (data_size > priv->max_msg_size)
> +		return -EINVAL;
>  	/* Copy the payload */
> -	size = simple_write_to_buffer(ipc4_msg->data_ptr,
> -				      priv->max_msg_size, ppos, buffer,
> -				      count);
> -	if (size < 0)
> -		return size;
> -	if (size != count)
> +	if (copy_from_user(ipc4_msg->data_ptr, buffer, data_size))

I think this is still needs an update:
if (copy_from_user(ipc4_msg->data_ptr,
		   buffer + sizeof(ipc4_msg->header_u64), data_size))

To skip the already copied header.

Or without a rewrite the fix would be simple as:
/* Copy the payload */
size = simple_write_to_buffer(ipc4_msg->data_ptr,  0,
		buffer + sizeof(ipc4_msg->header_u64), data_size),
		count);


>  		return -EFAULT;
>  
> -	ipc4_msg->data_size = count;
> +	ipc4_msg->data_size = data_size;
>  
>  	/* Initialize the reply storage */
>  	ipc4_msg = priv->rx_buffer;
> @@ -221,9 +214,9 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
>  
>  	/* return the error code if test failed */
>  	if (ret < 0)
> -		size = ret;
> +		count = ret;
>  
> -	return size;
> +	return count;
>  };
>  
>  static int sof_msg_inject_dfs_release(struct inode *inode, struct file *file)

-- 
Péter
