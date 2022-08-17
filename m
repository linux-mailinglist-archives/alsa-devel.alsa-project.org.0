Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2FC596ED7
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 14:57:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB28C1638;
	Wed, 17 Aug 2022 14:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB28C1638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660741039;
	bh=eRG0+qm4oBLh6lGn6yysc7LMWTIO44vPZQRuwGAcMZY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NPaIFRrItMzXX0KoisEj8OMemvHkcnmHZqGoWyC2GhOypg0pgz3hQQfaoe+sk0QIm
	 KtJ7ZFPxc9t2+ksXzZ4kvMnIxN6JdcCiLIgGkv6cE9IIAwKLb4LsBxLMZXVHGr9hC4
	 5/rbj2Ed2fl7S9En1eqr6TnBU/qCvpTCDD/GBNR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58C7EF802D2;
	Wed, 17 Aug 2022 14:56:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7391CF80088; Wed, 17 Aug 2022 14:56:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADC86F80088
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 14:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADC86F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="W3oXy2me"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660740972; x=1692276972;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eRG0+qm4oBLh6lGn6yysc7LMWTIO44vPZQRuwGAcMZY=;
 b=W3oXy2medxRcGP/vMAg1DH/3NxPUNCpwxxbVVXF2u3qI2uWLRcNDrdPz
 0mS/PrCNnpQ32I792ZruBXDZwl3N+wFTi2N8vfnGwlKiZ2jQ47khIgtza
 FXouvHGrDZXOq+iI+BSuEJfVFLgiliWt0bur3sX2x5tmQMM7JX3v8iXvy
 IsAg3fwnNdzH1sJ/PshvouZEV7cKQZQd+dI8Pi4+0iEE1dLl39dS3nUY7
 wRd37GRF78J2+1q5DvQKUO4vXqD6GIbuJ5ufY1LhIK2Ha9Bw74c2DTUlI
 JgG+Bgl0n7MDLGNBoG7tskW6fGpZbMt2ydvs9JJgP5umWfK5uU4AitT0d w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="293276184"
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="293276184"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 05:56:08 -0700
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="749696078"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.169])
 ([10.99.249.169])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 05:56:07 -0700
Message-ID: <7324df1d-0424-a589-f7c9-df089a6cbefe@linux.intel.com>
Date: Wed, 17 Aug 2022 14:56:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RESEND][PATCH] ALSA: info: Fix llseek return value when using
 callback
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
References: <20220817124924.3974577-1-amadeuszx.slawinski@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220817124924.3974577-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org
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

On 8/17/2022 2:49 PM, Amadeusz Sławiński wrote:
> When using callback there was a flow of
> 
> 	ret = -EINVAL
> 	if (callback) {
> 		offset = callback();
> 		goto out;
> 	}
> 	...
> 	offset = some other value in case of no callback;
> 	ret = offset;
> out:
> 	return ret;
> 
> which causes the snd_info_entry_llseek() to return -EINVAL when there is
> callback handler. Fix this by setting "ret" directly to callback return
> value before jumping to "out".
> 
> 73029e0ff18d ("ALSA: info - Implement common llseek for binary mode")
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>   sound/core/info.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/core/info.c b/sound/core/info.c
> index b8058b341178..0b2f04dcb589 100644
> --- a/sound/core/info.c
> +++ b/sound/core/info.c
> @@ -111,9 +111,9 @@ static loff_t snd_info_entry_llseek(struct file *file, loff_t offset, int orig)
>   	entry = data->entry;
>   	mutex_lock(&entry->access);
>   	if (entry->c.ops->llseek) {
> -		offset = entry->c.ops->llseek(entry,
> -					      data->file_private_data,
> -					      file, offset, orig);
> +		ret = entry->c.ops->llseek(entry,
> +					   data->file_private_data,
> +					   file, offset, orig);
>   		goto out;
>   	}
>   

Doing resend, because I did copy paste mistake when pasting Takashi 
email to git command, additionally alsa-devel blocked my previous mail.
I've seen that Cezary already discussed this issue, and it doesn't seem 
to be fixed, can this be somehow investigated? I guess we can provide 
response we get from server when email fails?

For example lkml accepted both messages just fine...
previous mail:
https://lore.kernel.org/lkml/20220817124642.3974015-1-amadeuszx.slawinski@linux.intel.com/T/#u
and resend:
https://lore.kernel.org/lkml/20220817124924.3974577-1-amadeuszx.slawinski@linux.intel.com/T/#u
