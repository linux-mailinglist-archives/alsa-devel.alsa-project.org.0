Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F762B8A2B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 03:53:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D69916FF;
	Thu, 19 Nov 2020 03:52:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D69916FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605754400;
	bh=s7Hy5/KC3esIs3T1dHROccYSkyIjK749lk1y5pu4M8g=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R6hxtAHaTPousrD3wyaqgjyoKd8u8HgCzOKBJLb9tHbza4NCxhbMGOrFqvcQY2XDi
	 VcGh6gZgsPHJkT6U85zYB2DytfrFaEpOPbERbRcBiGaQIq3JVzoqiZoSzdAUbVkMQm
	 NK31N8KEoFEhMywjC9VkFGe5eS2x1YEBCsj2IKS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE6C8F800C5;
	Thu, 19 Nov 2020 03:51:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EEE7F801ED; Thu, 19 Nov 2020 03:51:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0A45F800C5
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 03:51:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0A45F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="lnGFfhlp"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20201119025126epoutp032a04c87b7bbd6dc5cec38202cbc3f224~IyQQlQPWF1628516285epoutp03s
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 02:51:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20201119025126epoutp032a04c87b7bbd6dc5cec38202cbc3f224~IyQQlQPWF1628516285epoutp03s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1605754286;
 bh=eo76Gg0+DvWVQN2+ocI0+ZDwxieF4yzROgMDowGFY3Y=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=lnGFfhlpBa6d2pHGRLFYaYIfRC5d4eSmESNx27VWSyMdT57l/EY3KoexVPhUpS23J
 cq+hbxVzWwwQ+s7HcvOcE5/4WzkFvITA2NdcorU/3exD1GMgdZDd4OeHgFKmkrygO5
 N6Fborm6pXjCoMEK4PMBp8PuLO9QK/EjUl4em0Zg=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20201119025125epcas2p43d669ba8041ab86e09fd32a7fb6fabbb~IyQP0hjvn2025520255epcas2p4Z;
 Thu, 19 Nov 2020 02:51:25 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.189]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Cc4233ydrzMqYkj; Thu, 19 Nov
 2020 02:51:23 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 C8.05.10621.8ADD5BF5; Thu, 19 Nov 2020 11:51:21 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20201119025120epcas2p4a92b495b324ba501105ab0d33dd67874~IyQK3C4qf2025520255epcas2p4N;
 Thu, 19 Nov 2020 02:51:20 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201119025120epsmtrp11e3df384cfbc8775745c41fa28b1e413~IyQK2KrEG2343123431epsmtrp1e;
 Thu, 19 Nov 2020 02:51:20 +0000 (GMT)
X-AuditID: b6c32a45-337ff7000001297d-f7-5fb5dda80abe
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 0A.C9.08745.8ADD5BF5; Thu, 19 Nov 2020 11:51:20 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20201119025120epsmtip20c999169f5b2579bef202324d009b048~IyQKlwFwk3264832648epsmtip2w;
 Thu, 19 Nov 2020 02:51:20 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Takashi Iwai'" <tiwai@suse.de>
In-Reply-To: <s5h4km2rhe7.wl-tiwai@suse.de>
Subject: RE: [PATCH v2] ALSA: compress: allow pause and resume during draining
Date: Thu, 19 Nov 2020 11:51:19 +0900
Message-ID: <000001d6be1e$dc0e2860$942a7920$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK2ZRv+0t8jLTsbDnmaaVXcHFS3+AEJibrxAe155HKn97heMA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJJsWRmVeSWpSXmKPExsWy7bCmme7Ku1vjDfb2MVtcuXiIyWLGtm4W
 i8Z7E9gsVl/dwmTx7UoHk8Wv/8+YLI5eXMxk0XC3md1iw/e1jBYvN79hsjjSOIXJYuedE8wO
 PB4bPjexeeycdZfdY9OqTjaPeScDPfq2rGL0WL/lKovH5tPVAexROTYZqYkpqUUKqXnJ+SmZ
 eem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QIcqKZQl5pQChQISi4uV9O1sivJL
 S1IVMvKLS2yVUgtScgoMDQv0ihNzi0vz0vWS83OtDA0MjEyBKhNyMtYtv8hYsNi4YtmNbvYG
 xlOaXYycHBICJhLfp55kBrGFBHYwSrROKO5i5AKyPzFKbFzZwgzhfGaUeNCzhhGmY8WvLlaI
 xC5GiSuvZkA5LxklZp6/wwZSxSagK/Hl3h2wuSICKhJPe9cxgRQxCxxhkvj24DV7FyMHB6eA
 tsSjXQIgNcICARL7n3wC28AioCrxbe8JVhCbV8BSovFLJxOELShxcuYTFhCbWUBeYvvbOcwQ
 FylI/Hy6jBVil5PEkacL2SFqRCRmd7aBvSAhcIFDYsHvu1ANLhJ390AcKiEgLPHq+BZ2CFtK
 4mV/GztEQzOjxLuzf6ASUxglOruFIGxjiS1zTzGBPMAsoCmxfpc+iCkhoCxx5BbUbXwSHYf/
 skOEeSU62qAalSQ2nvrHBBGWkJi3gX0Co9IsJI/NQvLYLCQPzEJYtYCRZRWjWGpBcW56arFR
 gSFyXG9iBKdhLdcdjJPfftA7xMjEwXiIUYKDWUmEd63m1ngh3pTEyqrUovz4otKc1OJDjKbA
 oJ7ILCWanA/MBHkl8YamRmZmBpamFqZmRhZK4ryhK/vihQTSE0tSs1NTC1KLYPqYODilGpiy
 Zv3xVFdv5OxOuOppKJLx+B7bw+W/S47OOnik8KJ9/S+vLoZVlRcdCp4rx7ndSbBoF0h6krqG
 85+w4NVrH9oW/XPXd1/CtWLCJiHB2R6yUWlWBeGS5UecvPb+3nuWu2Kl+NLwSduOc5wtdmd3
 nyQ0USGSacfMqzxa37LOKrzvY4hW7di6/8Pa//KTz21TrlvTU/p3Gmv0FNvCaSe0+7SmHbjg
 oqbquvfIyX4rb9Z4pp0n9W60pMWtLrwncJ/pqHDplysW+3cvOJc3uclMyVLeNTh1Q4XebikZ
 x6tGJt0/Paedeuosv7yut1u7ou9Fy5rnTId1mPYkX/4nZBgTk7r2lXfpgSO2sw4tWLE/00CJ
 pTgj0VCLuag4EQAJvWQjTAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsWy7bCSvO6Ku1vjDdZskbO4cvEQk8WMbd0s
 Fo33JrBZrL66hcni25UOJotf/58xWRy9uJjJouFuM7vFhu9rGS1ebn7DZHGkcQqTxc47J5gd
 eDw2fG5i89g56y67x6ZVnWwe804GevRtWcXosX7LVRaPzaerA9ijuGxSUnMyy1KL9O0SuDLW
 Lb/IWLDYuGLZjW72BsZTml2MnBwSAiYSK351sXYxcnEICexglPjedpMNIiEh8WH+GXYIW1ji
 fssRqKLnjBIvjt9gBUmwCehKfLl3hxnEFhFQkXjau44JpIhZ4AKTxP6j7xlBEkICqxglPnXr
 djFycHAKaEs82iUAYgoL+Els+CELUsEioCrxbe8JsJG8ApYSjV86mSBsQYmTM5+wgJQzC+hJ
 tG0EG8gsIC+x/e0cZojTFCR+Pl3GCnGBk8SRpwvZIWpEJGZ3tjFPYBSehWTSLIRJs5BMmoWk
 YwEjyypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k/NxNjOBo1NLawbhn1Qe9Q4xMHIyHGCU4
 mJVEeNdqbo0X4k1JrKxKLcqPLyrNSS0+xCjNwaIkzvt11sI4IYH0xJLU7NTUgtQimCwTB6dU
 A9Mcz7+hLSftPMv627yP7m+f8/OBSJZtyv1rv0M1rs+/UZfxIXzXhXsmNQeffzreFs0bFWZv
 bvZY5tDVc0tUHtoY3vx2eefGo1ONGsMnaIoaagvJT07mWC4quPfr686dc3IvVDjEzI7q7mBm
 EUhNW3N/6rXGjfu+JmkluZtHv5/j/fuuXd3kk2/Wl3Ufv2PKoZ8s/XvyJL53p47cENi9/73q
 58AAj+nSuziKa4xitwsLOUQ58Aae/OwlnC8hJ77SlU1LTFK6idVvakKxn7X2kpsf91hOCm+Q
 viZWbrdrc3LkBoUNXNa7WaqOLvLz+r/k9ZS//u33xGbHuFl/qklzd3u0l4dzxi62pztLL28q
 aVBiKc5INNRiLipOBAAPWWpxNQMAAA==
X-CMS-MailID: 20201119025120epcas2p4a92b495b324ba501105ab0d33dd67874
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201027015726epcas2p1af97e3b6d4a54948a0e29fced35a1cd6
References: <CGME20201027015726epcas2p1af97e3b6d4a54948a0e29fced35a1cd6@epcas2p1.samsung.com>
 <000501d6ac04$85019b50$8f04d1f0$@samsung.com> <s5h4km2rhe7.wl-tiwai@suse.de>
Cc: 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, 'Vinod Koul' <vkoul@kernel.org>,
 hmseo@samsung.com, s47.kang@samsung.com, pilsun.jang@samsung.com,
 tkjung@samsung.com
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

On Fri, 06 Nov 2020 09:58:24 +0100, Takashi Iwai wrote:
>On Tue, 27 Oct 2020 02:57:25 +0100,
>Gyeongtaek Lee wrote:
>> 
>> With a stream with low bitrate, user can't pause or resume the stream
>> near the end of the stream because current ALSA doesn't allow it.
>> If the stream has very low bitrate enough to store whole stream into
>> the buffer, user can't do anything except stop the stream and then
>> restart it from the first because most of applications call draining
>> after sending last frame to the kernel.
>> If pause, resume are allowed during draining, user experience can be
>> enhanced.
>> To prevent malfunction in HW drivers which don't support pause
>> during draining, pause during draining will only work if HW driver
>> enable this feature explicitly by calling
>> snd_compr_use_pause_in_draining().
>> 
>> Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
>> Cc: stable@vger.kernel.org
>
>I personally find the approach is fine, but let's see what others
>think.
>
>One remaining concern to me is about the setup of
>use_pause_in_draining flag.  This is done by an explicit function call
>after the snd_compr object initialization.  It's a bit uncommon style,
>but OTOH I understand it from the current initialization code of
>compress-offload API.
Thanks for your kind review.

It's been almost 2 weeks.
So, I think that there is no further comment for this patch.
Could this patch be applied?
If so, should I resend this patch with new header like patch v3 or wait?

thanks again,

Gyeongtaek
>
>
>thanks,
>
>Takashi
>
>> ---
>>  include/sound/compress_driver.h | 17 +++++++++++++
>>  sound/core/compress_offload.c   | 44 +++++++++++++++++++++++++++------
>>  2 files changed, 53 insertions(+), 8 deletions(-)
>> 
>> diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
>> index 70cbc5095e72..5a0d6737de5e 100644
>> --- a/include/sound/compress_driver.h
>> +++ b/include/sound/compress_driver.h
>> @@ -67,6 +67,7 @@ struct snd_compr_runtime {
>>   * @metadata_set: metadata set flag, true when set
>>   * @next_track: has userspace signal next track transition, true when set
>>   * @partial_drain: undergoing partial_drain for stream, true when set
>> + * @pause_in_draining: paused during draining state, true when set
>>   * @private_data: pointer to DSP private data
>>   * @dma_buffer: allocated buffer if any
>>   */
>> @@ -80,6 +81,7 @@ struct snd_compr_stream {
>>  	bool metadata_set;
>>  	bool next_track;
>>  	bool partial_drain;
>> +	bool pause_in_draining;
>>  	void *private_data;
>>  	struct snd_dma_buffer dma_buffer;
>>  };
>> @@ -142,6 +144,7 @@ struct snd_compr_ops {
>>   * @direction: Playback or capture direction
>>   * @lock: device lock
>>   * @device: device id
>> + * @use_pause_in_draining: allow pause in draining, true when set
>>   */
>>  struct snd_compr {
>>  	const char *name;
>> @@ -152,6 +155,7 @@ struct snd_compr {
>>  	unsigned int direction;
>>  	struct mutex lock;
>>  	int device;
>> +	bool use_pause_in_draining;
>>  #ifdef CONFIG_SND_VERBOSE_PROCFS
>>  	/* private: */
>>  	char id[64];
>> @@ -166,6 +170,19 @@ int snd_compress_deregister(struct snd_compr *device);
>>  int snd_compress_new(struct snd_card *card, int device,
>>  			int type, const char *id, struct snd_compr *compr);
>>  
>> +/**
>> + * snd_compr_use_pause_in_draining - Allow pause and resume in draining state
>> + * @substream: compress substream to set
>> + *
>> + * Allow pause and resume in draining state.
>> + * Only HW driver supports this transition can call this API.
>> + */
>> +static inline void snd_compr_use_pause_in_draining(
>> +					struct snd_compr_stream *substream)
>> +{
>> +	substream->device->use_pause_in_draining = true;
>> +}
>> +
>>  /* dsp driver callback apis
>>   * For playback: driver should call snd_compress_fragment_elapsed() to let the
>>   * framework know that a fragment has been consumed from the ring buffer
>> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
>> index 0e53f6f31916..a071485383ed 100644
>> --- a/sound/core/compress_offload.c
>> +++ b/sound/core/compress_offload.c
>> @@ -708,11 +708,24 @@ static int snd_compr_pause(struct snd_compr_stream *stream)
>>  {
>>  	int retval;
>>  
>> -	if (stream->runtime->state != SNDRV_PCM_STATE_RUNNING)
>> +	switch (stream->runtime->state) {
>> +	case SNDRV_PCM_STATE_RUNNING:
>> +		retval = stream->ops->trigger(stream,
>> +			SNDRV_PCM_TRIGGER_PAUSE_PUSH);
>> +		if (!retval)
>> +			stream->runtime->state = SNDRV_PCM_STATE_PAUSED;
>> +		break;
>> +	case SNDRV_PCM_STATE_DRAINING:
>> +		if (!stream->device->use_pause_in_draining)
>> +			return -EPERM;
>> +		retval = stream->ops->trigger(stream,
>> +			SNDRV_PCM_TRIGGER_PAUSE_PUSH);
>> +		if (!retval)
>> +			stream->pause_in_draining = true;
>> +		break;
>> +	default:
>>  		return -EPERM;
>> -	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
>> -	if (!retval)
>> -		stream->runtime->state = SNDRV_PCM_STATE_PAUSED;
>> +	}
>>  	return retval;
>>  }
>>  
>> @@ -720,11 +733,25 @@ static int snd_compr_resume(struct snd_compr_stream *stream)
>>  {
>>  	int retval;
>>  
>> -	if (stream->runtime->state != SNDRV_PCM_STATE_PAUSED)
>> +	switch (stream->runtime->state) {
>> +	case SNDRV_PCM_STATE_PAUSED:
>> +		retval = stream->ops->trigger(stream,
>> +			SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
>> +		if (!retval)
>> +			stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
>> +		break;
>> +	case SNDRV_PCM_STATE_DRAINING:
>> +		if (!stream->device->use_pause_in_draining ||
>> +		    !stream->pause_in_draining)
>> +			return -EPERM;
>> +		retval = stream->ops->trigger(stream,
>> +			SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
>> +		if (!retval)
>> +			stream->pause_in_draining = false;
>> +		break;
>> +	default:
>>  		return -EPERM;
>> -	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
>> -	if (!retval)
>> -		stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
>> +	}
>>  	return retval;
>>  }
>>  
>> @@ -767,6 +794,7 @@ static int snd_compr_stop(struct snd_compr_stream *stream)
>>  		/* clear flags and stop any drain wait */
>>  		stream->partial_drain = false;
>>  		stream->metadata_set = false;
>> +		stream->pause_in_draining = false;
>>  		snd_compr_drain_notify(stream);
>>  		stream->runtime->total_bytes_available = 0;
>>  		stream->runtime->total_bytes_transferred = 0;
>> -- 
>> 2.21.0
>> 
>> 
>

