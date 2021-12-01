Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC46464718
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 07:17:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 641B12232;
	Wed,  1 Dec 2021 07:16:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 641B12232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638339469;
	bh=GEv0bc4q9vmFhTfuUAQuQd+YXzdtbaahTS1VLi6Kd60=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pPTUdmbBv5dsZfG53kkC9PFq4QUmLHqvLuBfHee7KqaXhbXTVxZbzV/79m1Kra1yv
	 CdgWHJ9h316iudZWJWIsWiSDbyapJkkcOOCKRQZ7/i5R59J0z7+oFmcb2SqlxPfVH+
	 RXoYxY7CH0pP3GCqj9SkDzBbgQGzIxTMEgbk125c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8373F800EE;
	Wed,  1 Dec 2021 07:16:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A605F80246; Wed,  1 Dec 2021 07:16:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B41AF800EE
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 07:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B41AF800EE
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R301e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=cuibixuan@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0Uz-5p3q_1638339372; 
Received: from 30.43.84.33(mailfrom:cuibixuan@linux.alibaba.com
 fp:SMTPD_---0Uz-5p3q_1638339372) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 01 Dec 2021 14:16:13 +0800
Message-ID: <30df3dc3-9160-e14f-16f5-139c63effd30@linux.alibaba.com>
Date: Wed, 1 Dec 2021 14:16:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [PATCH -next] ALSA: Fix oversized kvmalloc() calls
To: Takashi Iwai <tiwai@suse.de>
References: <1638270978-42412-1-git-send-email-cuibixuan@linux.alibaba.com>
 <s5h1r2x50uo.wl-tiwai@suse.de> <s5htuft20y6.wl-tiwai@suse.de>
From: Bixuan Cui <cuibixuan@linux.alibaba.com>
In-Reply-To: <s5htuft20y6.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, inux-kernel@vger.kernel.org
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


在 2021/11/30 下午10:05, Takashi Iwai 写道:
> On Tue, 30 Nov 2021 12:39:27 +0100,
> Takashi Iwai wrote:
>> On Tue, 30 Nov 2021 12:16:18 +0100,
>> Bixuan Cui wrote:
>>> The commit 7661809d493b ("mm: don't allow oversized kvmalloc()
>>> calls") limits the max allocatable memory via kvzalloc() to MAX_INT.
>>>
>>> Reported-by:syzbot+bb348e9f9a954d42746f@syzkaller.appspotmail.com
>>> Signed-off-by: Bixuan Cui<cuibixuan@linux.alibaba.com>
>> We should check the allocation size a lot earlier than here.
>> IOW, such a big size shouldn't have been passed to this function but
>> it should have been handled as an error in the caller side
>> (snd_pcm_oss_change_params*()).
>>
>> Could you give the reproducer?
> I'm asking it because the patch like below might cover the case.
>
>
> Takashi
>
> -- 8< --
> From: Takashi Iwai<tiwai@suse.de>
> Subject: [PATCH] ALSA: pcm: oss: Fix negative period/buffer sizes
>
> The period size calculation in OSS layer may receive a negative value
> as an error, but the code there assumes only the positive values and
> handle them with size_t.  Due to that, a too big value may be passed
> to the lower layers.
>
> This patch changes the code to handle with ssize_t and adds the proper
> error checks appropriately.
>
> Signed-off-by: Takashi Iwai<tiwai@suse.de>
> ---
>   sound/core/oss/pcm_oss.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
> index 82a818734a5f..bec7590bc84b 100644
> --- a/sound/core/oss/pcm_oss.c
> +++ b/sound/core/oss/pcm_oss.c
> @@ -147,7 +147,7 @@ snd_pcm_hw_param_value_min(const struct snd_pcm_hw_params *params,
>    *
>    * Return the maximum value for field PAR.
>    */
> -static unsigned int
> +static int
>   snd_pcm_hw_param_value_max(const struct snd_pcm_hw_params *params,
>   			   snd_pcm_hw_param_t var, int *dir)
>   {
> @@ -682,18 +682,24 @@ static int snd_pcm_oss_period_size(struct snd_pcm_substream *substream,
>   				   struct snd_pcm_hw_params *oss_params,
>   				   struct snd_pcm_hw_params *slave_params)
>   {
> -	size_t s;
> -	size_t oss_buffer_size, oss_period_size, oss_periods;
> -	size_t min_period_size, max_period_size;
> +	ssize_t s;
> +	ssize_t oss_buffer_size;
> +	ssize_t oss_period_size, oss_periods;
> +	ssize_t min_period_size, max_period_size;
>   	struct snd_pcm_runtime *runtime = substream->runtime;
>   	size_t oss_frame_size;
>   
>   	oss_frame_size = snd_pcm_format_physical_width(params_format(oss_params)) *
>   			 params_channels(oss_params) / 8;
>   
> +	oss_buffer_size = snd_pcm_hw_param_value_max(slave_params,
> +						     SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
> +						     NULL);
> +	if (oss_buffer_size <= 0)
> +		return -EINVAL;
>   	oss_buffer_size = snd_pcm_plug_client_size(substream,
> -						   snd_pcm_hw_param_value_max(slave_params, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, NULL)) * oss_frame_size;
> -	if (!oss_buffer_size)
> +						   oss_buffer_size * oss_frame_size);
> +	if (oss_buffer_size <= 0)
>   		return -EINVAL;
>   	oss_buffer_size = rounddown_pow_of_two(oss_buffer_size);
>   	if (atomic_read(&substream->mmap_count)) {
> @@ -730,7 +736,7 @@ static int snd_pcm_oss_period_size(struct snd_pcm_substream *substream,
>   
>   	min_period_size = snd_pcm_plug_client_size(substream,
>   						   snd_pcm_hw_param_value_min(slave_params, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, NULL));
> -	if (min_period_size) {
> +	if (min_period_size > 0) {
>   		min_period_size *= oss_frame_size;
>   		min_period_size = roundup_pow_of_two(min_period_size);
>   		if (oss_period_size < min_period_size)
> @@ -739,7 +745,7 @@ static int snd_pcm_oss_period_size(struct snd_pcm_substream *substream,
>   
>   	max_period_size = snd_pcm_plug_client_size(substream,
>   						   snd_pcm_hw_param_value_max(slave_params, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, NULL));
> -	if (max_period_size) {
> +	if (max_period_size > 0) {
>   		max_period_size *= oss_frame_size;
>   		max_period_size = rounddown_pow_of_two(max_period_size);
>   		if (oss_period_size > max_period_size)
> @@ -752,7 +758,7 @@ static int snd_pcm_oss_period_size(struct snd_pcm_substream *substream,
>   		oss_periods = substream->oss.setup.periods;
>   
>   	s = snd_pcm_hw_param_value_max(slave_params, SNDRV_PCM_HW_PARAM_PERIODS, NULL);
> -	if (runtime->oss.maxfrags && s > runtime->oss.maxfrags)
> +	if (s > 0 && runtime->oss.maxfrags && s > runtime->oss.maxfrags)
>   		s = runtime->oss.maxfrags;
>   	if (oss_periods > s)
>   		oss_periods = s;
Hi,

I got the bug report from syzbot: 
https://syzkaller.appspot.com/bug?id=c224c2af9ed367315fc048b50f008385bd5c4c3f 
.


I checked the call stack that reported the error, and then tried to 
construct a case, but it relied on some hardware

devices. My machine did not have it, so I couldn't construct it. :-(

I reviewed the code again and found that 'format->channels' in 'size = 
frames * format->channels * width'

should come from file->private_data in snd_pcm_oss_ioctl(). And 
file->private_data is initialized in snd_pcm_oss_open_file().

Maybe this patch cannot cover this problem.

But I think we can wait for this patch to be applied whether the problem 
occurs.


Thanks

Bixuan Cui





