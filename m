Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B217CA07
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 19:12:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99EDF16BB;
	Wed, 31 Jul 2019 19:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99EDF16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564593176;
	bh=lhbJuv7jkXkU+0wEEPuE9WuwpxY8mqNB0HQH5YHPyhs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W82pOwwHDOwJ7tKt/UolD/C5hxmH8lkrtAMByOwuRlJTVAEvm3JjydNYVFa3fkR30
	 XODLGJ9v7RRF3Z03fezNOUtEm86O1pOTMvv/NQXn+r1avVCswSaV0OCw/Fg9gkAYp3
	 rn4vKTIyRnxkQdlegxBL7K8t5JGot2S28wTVJSX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07313F8048E;
	Wed, 31 Jul 2019 19:11:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4426CF80483; Wed, 31 Jul 2019 19:11:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 540E4F80133
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 19:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 540E4F80133
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 10:11:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; d="scan'208";a="323810584"
Received: from deharris-mobl.amr.corp.intel.com ([10.251.148.13])
 by orsmga004.jf.intel.com with ESMTP; 31 Jul 2019 10:11:03 -0700
Message-ID: <918f9c287b7ef9efb707d88560a9ccde577c5dbf.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Date: Wed, 31 Jul 2019 10:11:03 -0700
In-Reply-To: <20190731131716.9764-3-gregkh@linuxfoundation.org>
References: <20190731131716.9764-1-gregkh@linuxfoundation.org>
 <20190731131716.9764-3-gregkh@linuxfoundation.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [PATCH v2 3/3] ASoC: SOF: no need to check return
 value of debugfs_create functions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 2019-07-31 at 15:17 +0200, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic
> should
> never do something different based on this.
> 
> Also, if a debugfs call fails, userspace is notified with an error in
> the log, so no need to log the error again.
> 
> Because we no longer need to check the return value, there's no need
> to
> save the dentry returned by debugfs.  Just use the dentry in the file
> pointer if we really need to figure out the "name" of the file being
> opened.
> 
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2: rebase on 5.3-rc1
>     change Subject line to match the subsystem better
>     rework based on debugfs core now reporting errors.
> 
>  sound/soc/sof/debug.c    | 49 +++++++++++++++-----------------------
> --
>  sound/soc/sof/sof-priv.h |  1 -
>  sound/soc/sof/trace.c    |  9 ++------
>  3 files changed, 20 insertions(+), 39 deletions(-)
> 
> diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
> index 2388477a965e..40940b2fe9d5 100644
> --- a/sound/soc/sof/debug.c
> +++ b/sound/soc/sof/debug.c
> @@ -128,6 +128,7 @@ static ssize_t sof_dfsentry_write(struct file
> *file, const char __user *buffer,
>  	unsigned long ipc_duration_ms = 0;
>  	bool flood_duration_test = false;
>  	unsigned long ipc_count = 0;
> +	struct dentry *dentry;
>  	int err;
>  #endif
>  	size_t size;
> @@ -149,11 +150,12 @@ static ssize_t sof_dfsentry_write(struct file
> *file, const char __user *buffer,
>  	 * ipc_duration_ms test floods the DSP for the time specified
>  	 * in the debugfs entry.
>  	 */
> -	if (strcmp(dfse->dfsentry->d_name.name, "ipc_flood_count") &&
> -	    strcmp(dfse->dfsentry->d_name.name,
> "ipc_flood_duration_ms"))
> +	dentry = file->f_path.dentry;
> +	if (strcmp(dentry->d_name.name, "ipc_flood_count") &&
> +	    strcmp(dentry->d_name.name, "ipc_flood_duration_ms"))
>  		return -EINVAL;
>  
> -	if (!strcmp(dfse->dfsentry->d_name.name,
> "ipc_flood_duration_ms"))
> +	if (!strcmp(dentry->d_name.name, "ipc_flood_duration_ms"))
>  		flood_duration_test = true;
>  
>  	/* test completion criterion */
> @@ -219,6 +221,7 @@ static ssize_t sof_dfsentry_read(struct file
> *file, char __user *buffer,
>  {
>  	struct snd_sof_dfsentry *dfse = file->private_data;
>  	struct snd_sof_dev *sdev = dfse->sdev;
> +	struct dentry *dentry;
>  	loff_t pos = *ppos;
>  	size_t size_ret;
>  	int skip = 0;
> @@ -226,8 +229,9 @@ static ssize_t sof_dfsentry_read(struct file
> *file, char __user *buffer,
>  	u8 *buf;
>  
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
> -	if ((!strcmp(dfse->dfsentry->d_name.name, "ipc_flood_count") ||
> -	     !strcmp(dfse->dfsentry->d_name.name,
> "ipc_flood_duration_ms")) &&
> +	dentry = file->f_path.dentry;
> +	if ((!strcmp(dentry->d_name.name, "ipc_flood_count") ||
> +	     !strcmp(dentry->d_name.name, "ipc_flood_duration_ms")) &&
>  	    dfse->cache_buf) {
>  		if (*ppos)
>  			return 0;
> @@ -290,8 +294,7 @@ static ssize_t sof_dfsentry_read(struct file
> *file, char __user *buffer,
>  		if (!pm_runtime_active(sdev->dev) &&
>  		    dfse->access_type == SOF_DEBUGFS_ACCESS_D0_ONLY) {
>  			dev_err(sdev->dev,
> -				"error: debugfs entry %s cannot be read
> in DSP D3\n",
> -				dfse->dfsentry->d_name.name);
> +				"error: debugfs entry cannot be read in
> DSP D3\n");
>  			kfree(buf);
>  			return -EINVAL;
>  		}
> @@ -356,17 +359,11 @@ int snd_sof_debugfs_io_item(struct snd_sof_dev
> *sdev,
>  	}
>  #endif
>  
> -	dfse->dfsentry = debugfs_create_file(name, 0444, sdev-
> >debugfs_root,
> -					     dfse, &sof_dfs_fops);
> -	if (!dfse->dfsentry) {
> -		/* can't rely on debugfs, only log error and keep going
> */
> -		dev_err(sdev->dev, "error: cannot create debugfs entry
> %s\n",
> -			name);
> -	} else {
> -		/* add to dfsentry list */
> -		list_add(&dfse->list, &sdev->dfsentry_list);
> +	debugfs_create_file(name, 0444, sdev->debugfs_root, dfse,
> +			    &sof_dfs_fops);
Minor nit-pick but looks good otherwise. This will fit all in one line
(same with the lines below).
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
 
>  
> -	}
> +	/* add to dfsentry list */
> +	list_add(&dfse->list, &sdev->dfsentry_list);
>  
>  	return 0;
>  }
> @@ -402,16 +399,10 @@ int snd_sof_debugfs_buf_item(struct snd_sof_dev
> *sdev,
>  		return -ENOMEM;
>  #endif
>  
> -	dfse->dfsentry = debugfs_create_file(name, mode, sdev-
> >debugfs_root,
> -					     dfse, &sof_dfs_fops);
> -	if (!dfse->dfsentry) {
> -		/* can't rely on debugfs, only log error and keep going
> */
> -		dev_err(sdev->dev, "error: cannot create debugfs entry
> %s\n",
> -			name);
> -	} else {
> -		/* add to dfsentry list */
> -		list_add(&dfse->list, &sdev->dfsentry_list);
> -	}
> +	debugfs_create_file(name, mode, sdev->debugfs_root, dfse,
> +			    &sof_dfs_fops);
> +	/* add to dfsentry list */
> +	list_add(&dfse->list, &sdev->dfsentry_list);
>  
>  	return 0;
>  }
> @@ -426,10 +417,6 @@ int snd_sof_dbg_init(struct snd_sof_dev *sdev)
>  
>  	/* use "sof" as top level debugFS dir */
>  	sdev->debugfs_root = debugfs_create_dir("sof", NULL);
> -	if (IS_ERR_OR_NULL(sdev->debugfs_root)) {
> -		dev_err(sdev->dev, "error: failed to create debugfs
> directory\n");
> -		return 0;
> -	}
>  
>  	/* init dfsentry list */
>  	INIT_LIST_HEAD(&sdev->dfsentry_list);
> diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
> index b8c0b2a22684..79b6709d1874 100644
> --- a/sound/soc/sof/sof-priv.h
> +++ b/sound/soc/sof/sof-priv.h
> @@ -228,7 +228,6 @@ enum sof_debugfs_access_type {
>  
>  /* FS entry for debug files that can expose DSP memories, registers
> */
>  struct snd_sof_dfsentry {
> -	struct dentry *dfsentry;
>  	size_t size;
>  	enum sof_dfsentry_type type;
>  	/*
> diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
> index befed975161c..4c3cff031fd6 100644
> --- a/sound/soc/sof/trace.c
> +++ b/sound/soc/sof/trace.c
> @@ -148,13 +148,8 @@ static int trace_debugfs_create(struct
> snd_sof_dev *sdev)
>  	dfse->size = sdev->dmatb.bytes;
>  	dfse->sdev = sdev;
>  
> -	dfse->dfsentry = debugfs_create_file("trace", 0444, sdev-
> >debugfs_root,
> -					     dfse,
> &sof_dfs_trace_fops);
> -	if (!dfse->dfsentry) {
> -		/* can't rely on debugfs, only log error and keep going
> */
> -		dev_err(sdev->dev,
> -			"error: cannot create debugfs entry for
> trace\n");
> -	}
> +	debugfs_create_file("trace", 0444, sdev->debugfs_root, dfse,
> +			    &sof_dfs_trace_fops);
>  
>  	return 0;
>  }

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
