Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 052C25685E4
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 12:43:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2D561689;
	Wed,  6 Jul 2022 12:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2D561689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657104189;
	bh=zrd7SJrYJgiBHyxXw1JHDeHv6/0QQpqh6HUxViDgkbY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tAf7WKGNcL0mAEJv0k3Edk3jur05YqrGlmRrtElimKtQ9C7tDeDNQiGVwVwo5o6MJ
	 wezrJ1jt/z6NYbcjUS0nCLIJjWQLREbl6cST9DSSJHPd+ao6puj/BtXQXJ1Za5YIrr
	 sUfZ4SlSy1P3O3wsTbEH4VePCBY/UX5PoGeXPqfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1789F800C5;
	Wed,  6 Jul 2022 12:42:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E20EEF8023A; Wed,  6 Jul 2022 12:42:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A134F800C5;
 Wed,  6 Jul 2022 12:41:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A134F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="h4lY4tEQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657104125; x=1688640125;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zrd7SJrYJgiBHyxXw1JHDeHv6/0QQpqh6HUxViDgkbY=;
 b=h4lY4tEQ2VGuMzdm7veZEvXRvKoM7nPvxwWf10ky/0p1ayYW40mcyldE
 ee9ThPTImACU7JAiGjQ/LIjAJTFDHMkWpumt0ExK5qb2/XSubS3OK1hBc
 ViROlennFLqHK6ICf+1ycAv0ey75jaX6TQC2BHU+KAv4LA7YB4oGI3109
 mQoyLKd0jjW7l2HBFztTwZ0tDQtpGubmwZMi/O3p3PbT6F4Aj8dmbBg3h
 64OWn+ccoMPlfWeJhVtuMqhTBIpcm0LAQuCxkrWbMn3sVJerGKtiTPnty
 xi3QNGT/3yHcfEoMFIEbWrgzDhIYadwkdoz1jvb2ZVEuBWQ8VZDrbwMSg Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="347693971"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="347693971"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 03:41:02 -0700
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="920113573"
Received: from gguerra-mobl1.ger.corp.intel.com (HELO [10.249.254.46])
 ([10.249.254.46])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 03:40:59 -0700
Message-ID: <b67ec7f9-7f1a-1014-b6e8-c953cd795202@linux.intel.com>
Date: Wed, 6 Jul 2022 13:41:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] ASoC: SOF: sof-client-probes: fix error codes in
 sof_probes_compr_copy()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <YsU4dYXYYVsfs92J@kili>
 <26db7e60-51d1-444a-7620-8225239ad7bf@linux.intel.com>
 <20220706102159.GC2338@kadam> <20220706103139.GB2316@kadam>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220706103139.GB2316@kadam>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
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



On 06/07/2022 13:31, Dan Carpenter wrote:
> On Wed, Jul 06, 2022 at 01:21:59PM +0300, Dan Carpenter wrote:
>> On Wed, Jul 06, 2022 at 12:05:37PM +0300, Péter Ujfalusi wrote:
>>>
>>>
>>> On 06/07/2022 10:23, Dan Carpenter wrote:
>>>> This function tries to return the number of bytes that it was able to
>>>> copy to the user.  However, because there are multiple calls to
>>>> copy_to_user() in a row that means the bytes are not necessarily
>>>> consecutive so it's not useful.  Just return -EFAULT instead.
>>>
>>> The function is copying data from a circular buffer to a use buffer.
>>> The single copy_to_user() is used when we don't have wrapping, the
>>> 'double' copy_to_user() is when we wrap, so first copy is from the end
>>> of the buffer then we copy the data from the start of the buffer to get
>>> all data.
>>
>> Ok.  But the bugs in the original code are real.  I will resend.
> 
> Actually that's not true.  The bugs in the original code are something
> that only affect users who deserve it?  I might not resend.  A fix would
> look something like below?
> 
> regards,
> dan carpenter
> 
> diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
> index 1f1ea93a7fbf..32fa3186c295 100644
> --- a/sound/soc/sof/sof-client-probes.c
> +++ b/sound/soc/sof/sof-client-probes.c
> @@ -398,9 +398,14 @@ static int sof_probes_compr_copy(struct snd_soc_component *component,
>  		ret = copy_to_user(buf, ptr, count);
>  	} else {
>  		ret = copy_to_user(buf, ptr, n);
> -		ret += copy_to_user(buf + n, rtd->dma_area, count - n);
> +		if (ret) {
> +			ret += count - n;
> +			goto done;
> +		}
> +		ret = copy_to_user(buf + n, rtd->dma_area, count - n);

I think this should work, can you please resend it?

>  	}
>  
> +done:
>  	if (ret)
>  		return count - ret;
>  	return count;

-- 
Péter
