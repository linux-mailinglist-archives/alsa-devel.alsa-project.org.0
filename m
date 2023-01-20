Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD0674FF1
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 09:56:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D90E12F13;
	Fri, 20 Jan 2023 09:55:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D90E12F13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674204964;
	bh=7oANbYIjgIDFI3cmChN7wYp6Yx10CkYP0TIkgphGYbE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bXprzmyqm49p11jkjfPXKij9VPzQhUToG9ybBgZITT0TDDSo+U7fR2dScALTsRakw
	 KZQbmdU/vavhizgi28TY+h6dTuDvhP744eOUFiDv15czft2+q/h3YxHq7513wBRhpr
	 QgXKi2fQQS048zqP/2R1gXbvGg2L3UkexIUu/aEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DB1DF800F0;
	Fri, 20 Jan 2023 09:55:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A6B2F8024D; Fri, 20 Jan 2023 09:55:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F153CF800F0;
 Fri, 20 Jan 2023 09:55:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F153CF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VzZjzTnQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674204903; x=1705740903;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7oANbYIjgIDFI3cmChN7wYp6Yx10CkYP0TIkgphGYbE=;
 b=VzZjzTnQY31KtMrTszgFGiRE/c8OtuZG0KVL/RqospyM8+JYB+P/fCfb
 A/zNG3vc7hlZOqN2n5yTkKxX31DiYlhRVm9JFfhcP5N7kSSaEdjq7Sr74
 f9Ek8OHltt+quEoRA2uEQY2maXImjcANf1J5FQiVfiNOVuAY4+h0RMoHt
 CTppIQolX4WtZsv/g7iZRCehzNPMN58zyWl9waFC80x+Y9VWJmQRmyBPn
 4ymZ7W/Irfzt6nHZ27PJfw9NhKcCGPObQjrPfPqJbG9k3eLlhdfzcCW+A
 4bnF3JgW60whfJv2MUMjlYjqAdfwSF/1UpQYOozR0EUpPGDtir4udJZIl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="387901724"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="387901724"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 00:54:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="803007044"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="803007044"
Received: from karenodx-mobl1.ger.corp.intel.com (HELO [10.252.29.156])
 ([10.252.29.156])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 00:54:54 -0800
Message-ID: <1d14581b-60b7-6745-380f-5540bdbd7564@linux.intel.com>
Date: Fri, 20 Jan 2023 10:55:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH] ASoC: SOF: ipc4-mtrace: prevent underflow in
 sof_ipc4_priority_mask_dfs_write()
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>
References: <Y8laruWOEwOC/dx9@kili>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <Y8laruWOEwOC/dx9@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, cip-dev <cip-dev@lists.cip-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rander Wang <rander.wang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 19/01/2023 16:58, Dan Carpenter wrote:
> The "id" comes from the user.  Change the type to unsigned to prevent
> an array underflow.
> 
> Fixes: f4ea22f7aa75 ("ASoC: SOF: ipc4: Add support for mtrace log extraction")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> ---
>  sound/soc/sof/ipc4-mtrace.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/sof/ipc4-mtrace.c b/sound/soc/sof/ipc4-mtrace.c
> index 70dea8ae706e..0ec6ef681012 100644
> --- a/sound/soc/sof/ipc4-mtrace.c
> +++ b/sound/soc/sof/ipc4-mtrace.c
> @@ -344,9 +344,10 @@ static ssize_t sof_ipc4_priority_mask_dfs_write(struct file *file,
>  						size_t count, loff_t *ppos)
>  {
>  	struct sof_mtrace_priv *priv = file->private_data;
> -	int id, ret;
> +	unsigned int id;
>  	char *buf;
>  	u32 mask;
> +	int ret;
>  
>  	/*
>  	 * To update Nth mask entry, write:
> @@ -357,9 +358,9 @@ static ssize_t sof_ipc4_priority_mask_dfs_write(struct file *file,
>  	if (IS_ERR(buf))
>  		return PTR_ERR(buf);
>  
> -	ret = sscanf(buf, "%d,0x%x", &id, &mask);
> +	ret = sscanf(buf, "%u,0x%x", &id, &mask);
>  	if (ret != 2) {
> -		ret = sscanf(buf, "%d,%x", &id, &mask);
> +		ret = sscanf(buf, "%u,%x", &id, &mask);
>  		if (ret != 2) {
>  			ret = -EINVAL;
>  			goto out;

-- 
Péter
