Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A42AB30374F
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 08:28:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BCED17BA;
	Tue, 26 Jan 2021 08:27:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BCED17BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611646076;
	bh=c+G0MbiiboDJzRxknuorhAJoB5TV/VUnQ86jvhiIpww=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FwgDMGg03FkByD7uqSH/LI1lfz+D0WOQJ4cw2GP1CDPeww4IEQnmtpkvWZdKAN76+
	 K5xQo9pXEgixRWc9HJFeQ+u4iavRO5oslfBigHP2alFzmeek+M0wsZSQHIaZ1yE1iQ
	 UMwEw49jA+maMVaF3wlpY7ETmnLgb+Ld5czl8ins=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A46EF801D8;
	Tue, 26 Jan 2021 08:26:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB58FF8015B; Tue, 26 Jan 2021 08:26:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3BC9F8011C
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 08:26:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3BC9F8011C
IronPort-SDR: gvgwmEy/IEbpJ6oIYCAi3KnTShkpJWlurZsnIt6vA3QbWzLITpQXyLxmxZbK5CosH74kjNGDpJ
 HEsNQp38U1ZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="243941575"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="243941575"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 23:26:02 -0800
IronPort-SDR: Sd5dS09jU/hBm6xU+DWJk8sUX/O9t+7dGZwRVHfAOilhhBCQCOJTOb8K/pIcZfNyzFi2khNo+8
 eiASdJp37QAg==
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="387723377"
Received: from kleve-mobl1.ger.corp.intel.com (HELO ubuntu) ([10.252.52.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 23:26:00 -0800
Date: Tue, 26 Jan 2021 08:25:58 +0100 (CET)
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH v2 6/9] ALSA: virtio: PCM substream operators
In-Reply-To: <7b4fa4c1-4af1-47b5-d2e6-bb2f81e75488@intel.com>
Message-ID: <d92151ca-cde3-d1e6-23fe-f0c671379e9@intel.com>
References: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
 <20210124165408.1122868-7-anton.yakovlev@opensynergy.com>
 <7b4fa4c1-4af1-47b5-d2e6-bb2f81e75488@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 virtualization@lists.linux-foundation.org
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

One more thing I missed yesterday:

On Mon, 25 Jan 2021, Guennadi Liakhovetski wrote:

>
> On Sun, 24 Jan 2021, Anton Yakovlev wrote:
>
>> Introduce the operators required for the operation of substreams.
>> 
>> Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
>> ---
>> sound/virtio/Makefile         |   3 +-
>> sound/virtio/virtio_pcm.c     |   5 +-
>> sound/virtio/virtio_pcm.h     |   2 +
>> sound/virtio/virtio_pcm_ops.c | 513 ++++++++++++++++++++++++++++++++++
>> 4 files changed, 521 insertions(+), 2 deletions(-)
>> create mode 100644 sound/virtio/virtio_pcm_ops.c
>
> [snip]
>
>> diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
>> new file mode 100644
>> index 000000000000..19882777fcd6
>> --- /dev/null
>> +++ b/sound/virtio/virtio_pcm_ops.c
>> @@ -0,0 +1,513 @@
>
> [snip]
>
>> +/**
>> + * virtsnd_pcm_release() - Release the PCM substream on the device side.
>> + * @substream: VirtIO substream.
>> + *
>> + * Context: Any context that permits to sleep.
>> + * Return: 0 on success, -errno on failure.
>> + */
>> +static inline bool virtsnd_pcm_released(struct virtio_pcm_substream 
>> *substream)
>> +{
>> +	/*
>> +	 * The spec states that upon receipt of the RELEASE command "the 
>> device
>> +	 * MUST complete all pending I/O messages for the specified stream 
>> ID".
>> +	 * Thus, we consider the absence of I/O messages in the queue as an
>> +	 * indication that the substream has been released.
>> +	 */
>> +	return atomic_read(&substream->msg_count) == 0;
>
> Also here having it atomic doesn't really seem to help. This just means, that 
> at some point of time it was == 0.
>
>> +}
>> +
>> +static int virtsnd_pcm_release(struct virtio_pcm_substream *substream)
>
> kernel-doc missing
>
>> +{
>> +	struct virtio_snd *snd = substream->snd;
>> +	struct virtio_snd_msg *msg;
>> +	unsigned int js = msecs_to_jiffies(msg_timeout_ms);
>> +	int rc;
>> +
>> +	msg = virtsnd_pcm_ctl_msg_alloc(substream, VIRTIO_SND_R_PCM_RELEASE,
>> +					GFP_KERNEL);
>> +	if (IS_ERR(msg))
>> +		return PTR_ERR(msg);
>> +
>> +	rc = virtsnd_ctl_msg_send_sync(snd, msg);
>> +	if (rc)
>> +		return rc;
>> +
>> +	return wait_event_interruptible_timeout(substream->msg_empty,
>> +						virtsnd_pcm_released(substream),
>> +						js);

wait_event_interruptible_timeout() will return a positive number in 
success cases, 0 means a timeout and condition still false. Whereas when 
you call this function you interpret 0 as success and you expect any != 0 
to be a negative error. Wondering how this worked during your tests?

Thanks
Guennadi
