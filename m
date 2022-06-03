Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7742153C7E9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 11:50:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F20DF182F;
	Fri,  3 Jun 2022 11:49:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F20DF182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654249830;
	bh=dlOLpy+A8O2m4zwqEZZLEk4QfSQQMpvf3qipx/BEfdw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bsNp+vpxf+dGNpWb84OKpvgRoJ2jwUrrnsvYDj1me+MTyM3vjFa/OkOAYxpEyFdzQ
	 6fi7lj/sq2MjSJ5PWR4hz7e9LxyPLFM77dT8CNmkdFZRmwX1DzOssdgCkX6J/W52Wv
	 yHQpgvpFKzuncmvOZvjqO8vIlSbJNyl8UwpJxnZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75149F804D1;
	Fri,  3 Jun 2022 11:49:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41197F804CC; Fri,  3 Jun 2022 11:49:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1CE3F80124;
 Fri,  3 Jun 2022 11:49:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1CE3F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EImwg0kl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654249769; x=1685785769;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dlOLpy+A8O2m4zwqEZZLEk4QfSQQMpvf3qipx/BEfdw=;
 b=EImwg0klK5cxE8q/JG4u6l6nq/34jwxbVzGflbn2eljSD15R0Qfmy9Wy
 bXEgnOJ5CQuZ8jyFvO+nNUIdOsfYJdLE+4tXiPon49t7KBwg2GF/emnyx
 h2EG4At8EXMCSvcMt8DUdcZH5r4ORIZJpqifuRUb0gel8r7YxjDouq+fs
 YXNGGp9tnO69xzFh4tXDe7E9uf2NJ8oVKKl0k6wEpUeFwiXBc4fcalVy4
 XJaNaRQ2/Mq7rn8fyO0fXhGHc3g+LInuofH8YgmX2fYOMDsYJxkL/+Yzs
 uonTsaUOb8GlKkuvWh0uG3DPsygN9hDiLEsXJVFU6HlCERNqwh1rM3N8V A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="301586707"
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; d="scan'208";a="301586707"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 02:49:23 -0700
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; d="scan'208";a="721689955"
Received: from nmoazzen-mobl2.amr.corp.intel.com (HELO [10.251.214.119])
 ([10.251.214.119])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 02:49:20 -0700
Message-ID: <0273c0c4-c5f2-7b0b-dc30-19f15ed9df1c@linux.intel.com>
Date: Fri, 3 Jun 2022 12:49:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] ASoC: SOF: ipc-msg-injector: Fix reversed if statement
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <Yph+T3PpGCdPsEDj@kili>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <Yph+T3PpGCdPsEDj@kili>
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



On 02/06/2022 12:09, Dan Carpenter wrote:
> This if statement is reversed.  In fact, the condition can just be
> deleted because writing zero bytes is a no-op.

Wow, you are right. I only tested with a message w/o additional payload.

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Fixes: 066c67624d8c ("ASoC: SOF: ipc-msg-injector: Add support for IPC4 messages")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/soc/sof/sof-client-ipc-msg-injector.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
> index 030cb97d7713..6bdfa527b7f7 100644
> --- a/sound/soc/sof/sof-client-ipc-msg-injector.c
> +++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
> @@ -200,16 +200,14 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
>  		return -EFAULT;
>  
>  	count -= size;
> -	if (!count) {
> -		/* Copy the payload */
> -		size = simple_write_to_buffer(ipc4_msg->data_ptr,
> -					      priv->max_msg_size, ppos, buffer,
> -					      count);
> -		if (size < 0)
> -			return size;
> -		if (size != count)
> -			return -EFAULT;
> -	}
> +	/* Copy the payload */
> +	size = simple_write_to_buffer(ipc4_msg->data_ptr,
> +				      priv->max_msg_size, ppos, buffer,
> +				      count);
> +	if (size < 0)
> +		return size;
> +	if (size != count)
> +		return -EFAULT;
>  
>  	ipc4_msg->data_size = count;
>  

-- 
Péter
