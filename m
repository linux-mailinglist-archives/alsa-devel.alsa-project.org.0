Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CC4E6A92
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 02:49:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33348191D;
	Mon, 28 Oct 2019 02:48:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33348191D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572227377;
	bh=Eek7zkfHkcV6v/rVUY+YN5o8w9kHchRLcMRK/dLJCJg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aZz2ZpalstK5Ys4yeOFMXoCCg02FVmQtBS+DSuw9y33+TSXNMf2WxKYmXVeDiIPXO
	 pkFnCrfIo9zUaSQOP/OABwY8RPcZPItHhWuQ1GdNhPSWYYTNDqeDOaTsOU0M+BF66j
	 IdKjg8LX1qclZy7CB0n4piUwRv4ewOlMWbMTfhq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9653BF80392;
	Mon, 28 Oct 2019 02:47:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D3BDF80392; Mon, 28 Oct 2019 02:47:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C0B4F80145
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 02:47:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C0B4F80145
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 18:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,238,1569308400"; d="scan'208";a="224494254"
Received: from rmullina-mobl.amr.corp.intel.com (HELO [10.255.229.12])
 ([10.255.229.12])
 by fmsmga004.fm.intel.com with ESMTP; 27 Oct 2019 18:47:42 -0700
To: Navid Emamdoost <navid.emamdoost@gmail.com>
References: <20191027194856.4056-1-navid.emamdoost@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4d08ed12-48fa-ed7f-3988-8d040c64acb1@linux.intel.com>
Date: Sun, 27 Oct 2019 20:47:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191027194856.4056-1-navid.emamdoost@gmail.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 kjlu@umn.edu, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, smccaman@umn.edu,
 linux-kernel@vger.kernel.org, emamd001@umn.edu
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Fix memory leak in
	sof_dfsentry_write
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



On 10/27/19 2:48 PM, Navid Emamdoost wrote:
> In the implementation of sof_dfsentry_write() memory allocated for
> string is leaked in case of an error. Go to error handling path if the
> d_name.name is not valid.
> 
> Fixes: 091c12e1f50c ("ASoC: SOF: debug: add new debugfs entries for IPC flood test")
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/sof/debug.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
> index 54cd431faab7..5529e8eeca46 100644
> --- a/sound/soc/sof/debug.c
> +++ b/sound/soc/sof/debug.c
> @@ -152,8 +152,10 @@ static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
>   	 */
>   	dentry = file->f_path.dentry;
>   	if (strcmp(dentry->d_name.name, "ipc_flood_count") &&
> -	    strcmp(dentry->d_name.name, "ipc_flood_duration_ms"))
> -		return -EINVAL;
> +	    strcmp(dentry->d_name.name, "ipc_flood_duration_ms")) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
>   
>   	if (!strcmp(dentry->d_name.name, "ipc_flood_duration_ms"))
>   		flood_duration_test = true;
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
