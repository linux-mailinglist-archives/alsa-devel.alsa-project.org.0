Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ECF5681E6
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 10:41:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40424163F;
	Wed,  6 Jul 2022 10:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40424163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657096918;
	bh=JE5KcMJhdcDNhNLv9RZ8QYVQhPQ8wU/E+RAoQr5DEsA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ikDsybFjnKUXRFLIyE5tDmAC88Hg5MoSKxU3r/5jJJcKDo31hY82hf83wYEXn+hv5
	 wMBfMUw+QBoEkeJeFEcla2M1WmlzWClxN89lmwtXlfNofDdRUnH5TgKxlPfPjbbNmG
	 YG74kdEnFgaRamLNuZWbAwODW6rkLAj0yjO8XZnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95B6EF8032B;
	Wed,  6 Jul 2022 10:40:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05D53F8023A; Wed,  6 Jul 2022 10:40:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF68BF8012A;
 Wed,  6 Jul 2022 10:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF68BF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hIUwdSPF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657096853; x=1688632853;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JE5KcMJhdcDNhNLv9RZ8QYVQhPQ8wU/E+RAoQr5DEsA=;
 b=hIUwdSPF+OWHPlzdzCWLHTg3CB5MvV9Umof5cNutO+owqcNBGPkKup2I
 gx6hQ2OlrENbhzOKd9gywzIIIQ7QqQQEUCrOBIbkrTdSyyDiYYZNErysr
 pbAf3CM3629XeNcp3gB3VfXaB7ZEiRnnNs3uecCHS8j6Wxe2N9MZt8q6F
 zwMMmH8whK6h8i2Rbdq8Ith3EQMkcj0TPeS4mUATcdQLiB3f+trfvw7lc
 w6APWHVvza1PAXQOcgjUIIYRXUJYPVKarSGVpdCzKODz/vjnBdU0baXFD
 rk9D0pWMFA6dzO9JNK2jltt0bmw3vL6UBFHM84trhJwlu/GTJLciHI3UE g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="263470121"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="263470121"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 01:40:36 -0700
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="920070710"
Received: from gguerra-mobl1.ger.corp.intel.com (HELO [10.249.254.46])
 ([10.249.254.46])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 01:40:33 -0700
Message-ID: <ccc2904f-4db9-2bae-2bd4-6142a2eb2001@linux.intel.com>
Date: Wed, 6 Jul 2022 11:41:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: SOF: debug: delete sof_dfsentry_write()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <YsU5lTzZND9cDRl0@kili>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YsU5lTzZND9cDRl0@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Fred Oh <fred.oh@linux.intel.com>, Mark Brown <broonie@kernel.org>,
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

Hi Dan,

On 06/07/2022 10:28, Dan Carpenter wrote:
> The sof_dfsentry_write() function used to have a purpose but now it is a
> no-op.  It allocates a zeroed buffer, copies at least one byte of data
> to it, and then frees it without doing anything.  Just delete the
> function.
> 
> Fixes: 6e9548cdb30e ("ASoC: SOF: Convert the generic IPC flood test into SOF client")

it is not really a fix but rather complements that commit...

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From review.  Not tested.
> 
>  sound/soc/sof/debug.c | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
> index c5d797e97c02..00abc2000bfb 100644
> --- a/sound/soc/sof/debug.c
> +++ b/sound/soc/sof/debug.c
> @@ -19,24 +19,6 @@
>  #include "sof-priv.h"
>  #include "ops.h"
>  
> -static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
> -				  size_t count, loff_t *ppos)
> -{
> -	size_t size;
> -	char *string;
> -	int ret;
> -
> -	string = kzalloc(count+1, GFP_KERNEL);
> -	if (!string)
> -		return -ENOMEM;
> -
> -	size = simple_write_to_buffer(string, count, ppos, buffer, count);
> -	ret = size;
> -
> -	kfree(string);
> -	return ret;
> -}
> -
>  static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
>  				 size_t count, loff_t *ppos)
>  {
> @@ -126,7 +108,6 @@ static const struct file_operations sof_dfs_fops = {
>  	.open = simple_open,
>  	.read = sof_dfsentry_read,
>  	.llseek = default_llseek,
> -	.write = sof_dfsentry_write,

I might add a check in snd_sof_debugfs_buf_item() to disallow write
permission for the file. I know, we only use 0444 for the remaining
files. It might be too paranoid, I guess.

>  };
>  
>  /* create FS entry for debug files that can expose DSP memories, registers */

-- 
Péter
