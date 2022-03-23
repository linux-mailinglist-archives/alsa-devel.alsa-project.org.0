Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7674E4DCF
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 09:10:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CA4816F7;
	Wed, 23 Mar 2022 09:09:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CA4816F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648022999;
	bh=bKWUYaPmRwZBXbIQvYluCzRLQ9byY907LwzxS8aSO4k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J3WO8nY+XobyVQH3QVQYNAQ726li8MdNFamC11Y8LNqtGxGsRbPQcbV165hDMBVzn
	 xEAljjBf06MmYZuZ2mnTMmxUNRtqpkSyIqcekKvdcgfbNMUB28xNrdutTnD9sCpG4M
	 NdlY4ayecSAKcS6M/7TJNAUYVlUAchqGTZweCH+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA9B5F800AA;
	Wed, 23 Mar 2022 09:08:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49550F802DB; Wed, 23 Mar 2022 09:08:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76B04F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 09:08:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76B04F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="l5WHtC9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648022926; x=1679558926;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bKWUYaPmRwZBXbIQvYluCzRLQ9byY907LwzxS8aSO4k=;
 b=l5WHtC9/fasO4ogdsgoXEdGD8OOvTp16gXXqKVojqZGw20sevBEXkqjw
 OznPWQ3vcOVVb2Aic0ASfw3jmvDJDOJsSmlkstcEByLgLynUv4vWjC6kX
 2sVHipWTGa9QPM2ctZ7So0co1O0jXynP4gwFKOzfKWxw20JHZxYEJ8Jhh
 Bf362EeWBN7QZLgfoG7ABUjnQOELHFg6pXhe8ZL86dz0snz1SNZ2gkR5X
 YbA4p3S8h8+ueZ9Q8nqyFC7E1BZLk3uqUPUraBZg79HRUbBaXt0AF7R2D
 cr8cgw21hHTE+VTVHjL5um1SD73Org3lAA2jImNBpulslsZ6/z+qqEjhs g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="282894290"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="282894290"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 01:08:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="560790474"
Received: from arturlex-mobl1.ger.corp.intel.com (HELO [10.99.249.37])
 ([10.99.249.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 01:08:27 -0700
Message-ID: <db933c9e-bf7b-dec6-8022-75074f9cebf7@linux.intel.com>
Date: Wed, 23 Mar 2022 09:08:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/4] ALSA: pcm: Fix races among concurrent prepare and
 hw_params/hw_free calls
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20220322170720.3529-1-tiwai@suse.de>
 <20220322170720.3529-4-tiwai@suse.de>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220322170720.3529-4-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Hu Jiahui <kirin.say@gmail.com>, linux-kernel@vger.kernel.org
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

On 3/22/2022 6:07 PM, Takashi Iwai wrote:
> Like the previous fixes to hw_params and hw_free ioctl races, we need
> to paper over the concurrent prepare ioctl calls against hw_params and
> hw_free, too.
> 
> This patch implements the locking with the existing
> runtime->buffer_mutex for prepare ioctls.  Unlike the previous case
> for snd_pcm_hw_hw_params() and snd_pcm_hw_free(), snd_pcm_prepare() is
> performed to the linked streams, hence the lock can't be applied
> simply on the top.  For tracking the lock in each linked substream, we
> modify snd_pcm_action_group() slightly and apply the buffer_mutex for
> the case stream_lock=false (formerly there was no lock applied)
> there.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/core/pcm_native.c | 32 ++++++++++++++++++--------------
>   1 file changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 266895374b83..0e4fbf5fd87b 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -1190,15 +1190,17 @@ struct action_ops {
>   static int snd_pcm_action_group(const struct action_ops *ops,
>   				struct snd_pcm_substream *substream,
>   				snd_pcm_state_t state,
> -				bool do_lock)
> +				bool stream_lock)
>   {
>   	struct snd_pcm_substream *s = NULL;
>   	struct snd_pcm_substream *s1;
>   	int res = 0, depth = 1;
>   
>   	snd_pcm_group_for_each_entry(s, substream) {
> -		if (do_lock && s != substream) {
> -			if (s->pcm->nonatomic)
> +		if (s != substream) {
> +			if (!stream_lock)
> +				mutex_lock_nested(&s->runtime->buffer_mutex, depth);
> +			else if (s->pcm->nonatomic)
>   				mutex_lock_nested(&s->self_group.mutex, depth);
>   			else
>   				spin_lock_nested(&s->self_group.lock, depth);

Maybe
	if (!stream_lock)
		mutex_lock_nested(&s->runtime->buffer_mutex, depth);
	else
		snd_pcm_group_lock(&s->self_group, s->pcm->nonatomic);
?

> @@ -1226,18 +1228,18 @@ static int snd_pcm_action_group(const struct action_ops *ops,
>   		ops->post_action(s, state);
>   	}
>    _unlock:
> -	if (do_lock) {
> -		/* unlock streams */
> -		snd_pcm_group_for_each_entry(s1, substream) {
> -			if (s1 != substream) {
> -				if (s1->pcm->nonatomic)
> -					mutex_unlock(&s1->self_group.mutex);
> -				else
> -					spin_unlock(&s1->self_group.lock);
> -			}
> -			if (s1 == s)	/* end */
> -				break;
> +	/* unlock streams */
> +	snd_pcm_group_for_each_entry(s1, substream) {
> +		if (s1 != substream) {
> +			if (!stream_lock)
> +				mutex_unlock(&s1->runtime->buffer_mutex);
> +			else if (s1->pcm->nonatomic)
> +				mutex_unlock(&s1->self_group.mutex);
> +			else
> +				spin_unlock(&s1->self_group.lock);

And similarly to above, use snd_pcm_group_unlock() here?

>   		}
> +		if (s1 == s)	/* end */
> +			break;
>   	}
>   	return res;
>   }
> @@ -1367,10 +1369,12 @@ static int snd_pcm_action_nonatomic(const struct action_ops *ops,
>   
>   	/* Guarantee the group members won't change during non-atomic action */
>   	down_read(&snd_pcm_link_rwsem);
> +	mutex_lock(&substream->runtime->buffer_mutex);
>   	if (snd_pcm_stream_linked(substream))
>   		res = snd_pcm_action_group(ops, substream, state, false);
>   	else
>   		res = snd_pcm_action_single(ops, substream, state);
> +	mutex_unlock(&substream->runtime->buffer_mutex);
>   	up_read(&snd_pcm_link_rwsem);
>   	return res;
>   }

