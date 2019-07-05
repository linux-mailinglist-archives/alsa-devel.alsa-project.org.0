Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB7160A5C
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 18:39:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96FE31694;
	Fri,  5 Jul 2019 18:38:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96FE31694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562344760;
	bh=8eGZQ/TYW4kOOu2Mdaowa/m2MkVNpONyjvubous2dqs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HY7E9iYVb4NibKNeOsqMpzuju6d66b8eC77OoMkaB/4f7TZtHMoM14dT5YN3l+mpe
	 pDNhHpb/Vh+3u1Eg03cqPbbzXUSIC/CeCLYk9FkOla9GQVMbqLNPuxnKXqUlToEeI3
	 3KvSlpMYIOwiCHqb/hY3VWPuGSqtMJmieMnk/C34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C3E0F8011E;
	Fri,  5 Jul 2019 18:37:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E63EF8011F; Fri,  5 Jul 2019 18:37:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAFE4F800E1
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 18:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAFE4F800E1
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jul 2019 09:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,455,1557212400"; d="scan'208";a="166571355"
Received: from unknown (HELO ranjani-desktop) ([10.252.203.115])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jul 2019 09:37:25 -0700
Message-ID: <a3a96e0f84ee04bff6855701cd7b00a25a5a5de1.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Wei Yongjun <weiyongjun1@huawei.com>, Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,  Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Pan Xiuli
 <xiuli.pan@linux.intel.com>
Date: Fri, 05 Jul 2019 09:37:14 -0700
In-Reply-To: <20190705081637.157169-1-weiyongjun1@huawei.com>
References: <20190705081637.157169-1-weiyongjun1@huawei.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH -next] ASoC: SOF: debug: fix possible
 memory leak in sof_dfsentry_write()
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

On Fri, 2019-07-05 at 08:16 +0000, Wei Yongjun wrote:
> 'string' is malloced in sof_dfsentry_write() and should be freed
> before leaving from the error handling cases, otherwise it will cause
> memory leak.
> 
> Fixes: 091c12e1f50c ("ASoC: SOF: debug: add new debugfs entries for
> IPC flood test")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Thanks for fixing this, Wei!
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

> ---
>  sound/soc/sof/debug.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
> index 54bb53bfc81b..2388477a965e 100644
> --- a/sound/soc/sof/debug.c
> +++ b/sound/soc/sof/debug.c
> @@ -162,7 +162,7 @@ static ssize_t sof_dfsentry_write(struct file
> *file, const char __user *buffer,
>  	else
>  		ret = kstrtoul(string, 0, &ipc_count);
>  	if (ret < 0)
> -		return ret;
> +		goto out;
>  
>  	/* limit max duration/ipc count for flood test */
>  	if (flood_duration_test) {
> @@ -191,7 +191,7 @@ static ssize_t sof_dfsentry_write(struct file
> *file, const char __user *buffer,
>  				    "error: debugfs write failed to
> resume %d\n",
>  				    ret);
>  		pm_runtime_put_noidle(sdev->dev);
> -		return ret;
> +		goto out;
>  	}
>  
>  	/* flood test */
> 
> 
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
