Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 513944F81B
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jun 2019 21:59:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76F4D9F6;
	Sat, 22 Jun 2019 21:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76F4D9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561233579;
	bh=hoO3uEZhaY5u8hGf1DCrfKYERaz4LmNxIb2IZgZK7No=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MC1fCa+E7pokPbp0MUTLRcLp+zwR7sqE7W3bpbIMz0fBZq2vnpoy3Jfh2yTtuskTc
	 nmTBtwlqXq9CuyGVzMjb4F78x9IYlNmHEO9dJQaJv4eda18blHSOtl1ENt2JJyK7qZ
	 6KaMQqDqpldymRJJZSmcuU1FDmfvqs3KrLA0ysng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C80F8971B;
	Sat, 22 Jun 2019 21:57:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B8FEF89717; Sat, 22 Jun 2019 21:57:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA631F806ED
 for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2019 21:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA631F806ED
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jun 2019 12:57:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,405,1557212400"; d="scan'208";a="187522015"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.2.87])
 ([10.252.2.87])
 by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2019 12:57:08 -0700
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20190614094756.2965-1-gregkh@linuxfoundation.org>
 <20190614094756.2965-2-gregkh@linuxfoundation.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <f85fe797-f843-bf71-549a-00a169d527dd@intel.com>
Date: Sat, 22 Jun 2019 21:57:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614094756.2965-2-gregkh@linuxfoundation.org>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 2/5] sound: soc: skylake: no need to check
 return value of debugfs_create functions
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


On 2019-06-14 11:47, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> 

This change heavily impacts user space and development kits used by us 
internally, and our clients. That is, if anything goes wrong during 
debugfs initialization process.

Currently, apps may safely assume entire debugfs tree is up and running 
once audio stack gets enumerated successfully. With your patch this is 
no longer the case and user space is forced to verify status of all 
debugfs files and/ or directories manually.

Most of this you knew already - I see Mark was very vocal about 
consequences and possible regression. Nonetheless we have had a short 
meeting with our coe-audio members regarding this change, specifically. 
Conclusion was simple: losing ability to test debugfs objects status 
during their creation e.g.: via IS_ERR family is considered harmful.

Czarek

> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
> Cc: Jie Yang <yang.jie@linux.intel.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>   sound/soc/intel/skylake/skl-debug.c | 28 +++++-----------------------
>   1 file changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-debug.c b/sound/soc/intel/skylake/skl-debug.c
> index 5d7ac2ee7a3c..5481e3362414 100644
> --- a/sound/soc/intel/skylake/skl-debug.c
> +++ b/sound/soc/intel/skylake/skl-debug.c
> @@ -170,10 +170,8 @@ void skl_debug_init_module(struct skl_debug *d,
>   			struct snd_soc_dapm_widget *w,
>   			struct skl_module_cfg *mconfig)
>   {
> -	if (!debugfs_create_file(w->name, 0444,
> -				d->modules, mconfig,
> -				&mcfg_fops))
> -		dev_err(d->dev, "%s: module debugfs init failed\n", w->name);
> +	debugfs_create_file(w->name, 0444, d->modules, mconfig,
> +			    &mcfg_fops);
>   }
>   
>   static ssize_t fw_softreg_read(struct file *file, char __user *user_buf,
> @@ -230,32 +228,16 @@ struct skl_debug *skl_debugfs_init(struct skl *skl)
>   		return NULL;
>   
>   	/* create the debugfs dir with platform component's debugfs as parent */
> -	d->fs = debugfs_create_dir("dsp",
> -				   skl->component->debugfs_root);
> -	if (IS_ERR(d->fs) || !d->fs) {
> -		dev_err(&skl->pci->dev, "debugfs root creation failed\n");
> -		return NULL;
> -	}
> +	d->fs = debugfs_create_dir("dsp", skl->component->debugfs_root);
>   
>   	d->skl = skl;
>   	d->dev = &skl->pci->dev;
>   
>   	/* now create the module dir */
>   	d->modules = debugfs_create_dir("modules", d->fs);
> -	if (IS_ERR(d->modules) || !d->modules) {
> -		dev_err(&skl->pci->dev, "modules debugfs create failed\n");
> -		goto err;
> -	}
>   
> -	if (!debugfs_create_file("fw_soft_regs_rd", 0444, d->fs, d,
> -				 &soft_regs_ctrl_fops)) {
> -		dev_err(d->dev, "fw soft regs control debugfs init failed\n");
> -		goto err;
> -	}
> +	debugfs_create_file("fw_soft_regs_rd", 0444, d->fs, d,
> +			    &soft_regs_ctrl_fops);
>   
>   	return d;
> -
> -err:
> -	debugfs_remove_recursive(d->fs);
> -	return NULL;
>   }
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
