Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF3B27BFD0
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 10:42:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D6D01867;
	Tue, 29 Sep 2020 10:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D6D01867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601368972;
	bh=7hUtYRPZWprW1lAvDU2sfcveywcf7M1pkoW2tb97r78=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=b4ej222qRbeSdwgoEmmsGCC4JypdZksWhrb7xm1kHoNGRbSrDaaKhJ7SQ7zbBDJ+d
	 cr1UQLnZxAaE9IkPGGkesjzdHw3bn57XMZg8HBIWY+UYsx8p3sPi/HCAv/STtMiwyo
	 SdfThfmIwwhO4ZJ6HbaFOLZ+4OwSr7rZKbeM1AXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E5F1F800DD;
	Tue, 29 Sep 2020 10:41:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 431D0F801F5; Tue, 29 Sep 2020 10:41:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EA59F800DD
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 10:40:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EA59F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="F13obM4w"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200929084055epoutp024df9d0dc90fdd5bb1b1acba9223941d1~5NH1Uqtmm3228932289epoutp02j
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 08:40:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200929084055epoutp024df9d0dc90fdd5bb1b1acba9223941d1~5NH1Uqtmm3228932289epoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1601368855;
 bh=TxUtovtdocK+5JTyC/jeBDeWnT8tDVk6twUlOUs2z6M=;
 h=From:To:Cc:Subject:Date:References:From;
 b=F13obM4wBm2Kvwlvuz+yfLJ3rw0Y2DbgzGEHmiXQBMsZQBf8XahLI/NO8OdRwTq1/
 RFqUJ9e/QYAiykdWHL7Wmy8OZ+gA+hycMpSxhbOTu0WTUVQSV0DTYWURkI7QCYn5iN
 5pIXW0zi4m8KIL5nwXLpyxLoulmovJ0z/k5lFRT0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20200929084054epcas2p1faea49ffcfde6f1e7852b0b1726c1c72~5NH0Tqsko2693326933epcas2p1m;
 Tue, 29 Sep 2020 08:40:54 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.183]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4C0tBr2kGRzMqYkf; Tue, 29 Sep
 2020 08:40:52 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 4F.F8.09588.413F27F5; Tue, 29 Sep 2020 17:40:52 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
 20200929084051epcas2p35fb2228ed1bdfce6a7ddf5b37c944823~5NHx-0ty62869628696epcas2p3q;
 Tue, 29 Sep 2020 08:40:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200929084051epsmtrp1f6d2a211f57c66e1e8c2e1ceaced6640~5NHx-GpUX0851608516epsmtrp1b;
 Tue, 29 Sep 2020 08:40:51 +0000 (GMT)
X-AuditID: b6c32a45-8e1d3a8000002574-10-5f72f3148946
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 EC.B2.08604.313F27F5; Tue, 29 Sep 2020 17:40:51 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200929084051epsmtip1085c2a379054973a45567ac7024c3994~5NHxslZ280563705637epsmtip1e;
 Tue, 29 Sep 2020 08:40:51 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Takashi Iwai'" <tiwai@suse.de>
Subject: RE: [PATCH] ALSA: compress: allow pause and resume during draining
Date: Tue, 29 Sep 2020 17:40:51 +0900
Message-ID: <000001d6963c$3cc53690$b64fa3b0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdaWPAo5EOJvOzNhSgunwpgLzLY2Mg==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFJsWRmVeSWpSXmKPExsWy7bCmha7I56J4g3VHBSyuXDzEZDFjWzeL
 ReO9CWwWq69uYbL4dqWDyeLX/2dMFkcvLmayaLjbzG6x4ftaRouXm98wWRxpnMJksfPOCWYH
 Ho8Nn5vYPHbOusvusWlVJ5vHvJOBHn1bVjF6rN9ylcVj8+nqAPaoHJuM1MSU1CKF1Lzk/JTM
 vHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoEOVFMoSc0qBQgGJxcVK+nY2Rfml
 JakKGfnFJbZKqQUpOQWGhgV6xYm5xaV56XrJ+blWhgYGRqZAlQk5GQ+3zGIs6Les+Hqct4Hx
 oV4XIyeHhICJxNOLt9m7GLk4hAR2MErsXryXGcL5xCjx4kM3I4TzjVGi6fEWFpiWTW2fWSAS
 exkl3k3/zwbhvGSUOL3zITtIFZuArsSXe3eYQWwRARWJp73rmECKmAW2Mkm075rGCpIQFvCW
 +Hn0EyOIzSKgKjHjw0YmEJtXwFJi54SlrBC2oMTJmU/AVjMLyEtsfzuHGeIMBYmfT5exQizQ
 k+havI4NokZEYnZnG9gTEgJrOSSmbHrPDtHgItEyZSOULSzx6vgWKFtK4mV/GztEQzPQP2f/
 QCWmMEp0dgtB2MYSW+aeArqOA2iDpsT6XfogpoSAssSRW1C38Ul0HP7LDhHmlehog2pUkth4
 6h8TRFhCYt4GqNkeEr//rmScwKg4C8mTs5A8OQvJM7MQ1i5gZFnFKJZaUJybnlpsVGCIHNmb
 GMGJWMt1B+Pktx/0DjEycTAeYpTgYFYS4fXNKYgX4k1JrKxKLcqPLyrNSS0+xGgKDPaJzFKi
 yfnAXJBXEm9oamRmZmBpamFqZmShJM6bq3ghTkggPbEkNTs1tSC1CKaPiYNTqoHpgstci5aZ
 5ftdXrAx7w/n7NX1Xhl/bN7psjuT7Vykefjv94izHortiZriabp8O9/zGs3i/A+tumu6z5ZG
 xTyuYy48+uvb4TnHWQ5NOVXz3vlapFdASY3KpoMHD662ipF9N10wMKch3Pj1qocbX+aU75rU
 8qZGlN2IuenZt0NulyPfcc/s4dkZ88trUh937Cv5s+cqq0VbXFUatN5fUji1fq/D4879oT7O
 Z250P+1PnDdh2ecO3SDji9ef/b1mIhzCM0HLN/I/q07i2VX3jyoxWPJNPGS6S/DNn4oGnYDZ
 py/vmjNNJeNl5oxTjW/jNJedMZnm2lX3k2tJP//aTRsWF11TM661fhFq/UjsqtNWJZbijERD
 Leai4kQA0Ft/6U0EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42LZdlhJTlf4c1G8wcQd6hZXLh5ispixrZvF
 ovHeBDaL1Ve3MFl8u9LBZPHr/zMmi6MXFzNZNNxtZrfY8H0to8XLzW+YLI40TmGy2HnnBLMD
 j8eGz01sHjtn3WX32LSqk81j3slAj74tqxg91m+5yuKx+XR1AHsUl01Kak5mWWqRvl0CV8bD
 LbMYC/otK74e521gfKjXxcjJISFgIrGp7TNLFyMXh5DAbkaJF7ufMUMkJCQ+zD/DDmELS9xv
 OcIKYgsJPGeU6FzLBmKzCehKfLl3B6xeREBF4mnvOiaQQcwCB5kkZi5dAlYkLOAt8fPoJ0YQ
 m0VAVWLGh41MIDavgKXEzglLWSFsQYmTM58AXcEB1Kwn0bYRrJxZQF5i+9s5UPcoSPx8uowV
 YpeeRNfidWwQNSISszvbmCcwCs5CMmkWwqRZSCbNQtKxgJFlFaNkakFxbnpusWGBYV5quV5x
 Ym5xaV66XnJ+7iZGcHRpae5g3L7qg94hRiYOxkOMEhzMSiK8vjkF8UK8KYmVValF+fFFpTmp
 xYcYpTlYlMR5bxQujBMSSE8sSc1OTS1ILYLJMnFwSjUwCXFLG7GofLuc6rltjQ+LbpP6YwlZ
 my8SB269jdDmFq61U/9wuFXQJv3Wjx8Odz+xLlO9aTpNctaWo7U3ph6/c0DbfNW7+ecYXu13
 EzspsOBM3o+NgQ8rjrT+XtcQEKP/4ODd6UsqN9w9tqQjziGqpWZ+S4c0x9+JXNJylh5ygsss
 Ktdu2VX/td9Qrf+w4tuwlRc/GSgK9+rx1h8rF+vQk5huPK/FJE64xM3nJldlVdKVfa2qq4zV
 5KbVtbgK9LoUzm8KWSLCwHV4u+3XTBHGlKz8qisSYp974rbNXX5Gfb7hy9z0eZcnb53Bn2A7
 t/NtvXTZhx18dU7O7DGbes3F79e1f7FpYkjYrDidYb4SS3FGoqEWc1FxIgB3xXw8HQMAAA==
X-CMS-MailID: 20200929084051epcas2p35fb2228ed1bdfce6a7ddf5b37c944823
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200929084051epcas2p35fb2228ed1bdfce6a7ddf5b37c944823
References: <CGME20200929084051epcas2p35fb2228ed1bdfce6a7ddf5b37c944823@epcas2p3.samsung.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, lgirdwood@gmail.com,
 kimty@samsung.com, 'Pierre-Louis
 Bossart' <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 vkoul@kernel.org, hmseo@samsung.com, tkjung@samsung.com,
 pilsun.jang@samsung.com, s47.kang@samsung.com
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

On 9/29/20 04:13 PM, Takashi Iwai wrote:
>On Tue, 29 Sep 2020 03:51:35 +0200,
>Gyeongtaek Lee wrote:
>> 
>> On 9/28/20 11:35 PM, Pierre-Louis Bossart wrote:
>> >On 9/28/20 6:13 AM, Jaroslav Kysela wrote:
>> >> Dne 28. 09. 20 v 12:50 Gyeongtaek Lee napsal(a):
>> >>> With a stream with low bitrate, user can't pause or resume the stream
>> >>> near the end of the stream because current ALSA doesn't allow it.
>> >>> If the stream has very low bitrate enough to store whole stream into
>> >>> the buffer, user can't do anything except stop the stream and then
>> >>> restart it from the first.
>> >>> If pause and resume is allowed during draining, user experience can be
>> >>> enhanced.
>> >> 
>> >> It seems that we need a new state to handle the pause + drain condition for
>> >> this case.
>> >> 
>> >> With this proposed change, the pause state in drain is invisible.
>> >
>> >Indeed it's be much nicer to have a new state, e..g 
>> >SNDRV_PCM_STATE_DRAINING_PAUSED.
>> Ok. I will add the new state.
>> >
>> >One concern is that states are defined in uapi/sound/asoc.h, so wouldn't 
>> >this have impacts on userspace as well? We'd change the value of 
>> >SNDRV_PCM_STATE_LAST.
>> >
>> I also agree that adding new state and increase LAST value in the header of uapi
>> could be dangerous. So, I added it to comress_offload.h for now.
>> It could be merged into snd_pcm_state_t in someday with big changes.
>> Could you review the fixed patch below?
>
>Hrm, this resulted in rather more complex changes than the original
>patch.  It shows that introducing yet another state is no good idea
>for this particular case.
>
>Since the possible application's behavior after this pause is as same
>as the normal pause (i.e. either resuming pause or dropping), I find
>it OK to take the original approach.
Thank you for the review.
I think that I should resend the original patch.
Am I right?
>
>
>thanks,
>
>Takashi
>
>> With a stream with low bitrate, user can't pause or resume the stream
>> near the end of the stream because current ALSA doesn't allow it.
>> If the stream has very low bitrate enough to store whole stream into
>> the buffer, user can't do anything except stop the stream and then
>> restart it from first.
>> If pause, resume are allowed during draining, user experience can be
>> enhanced.
>> 
>> New state for pause during draining is defined in compress_offload.h for
>> now. If PCM_STATEs in uapi/sound/asound.h is changed, pcm libraries and
>> userspace application will be affected.
>> 
>> Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
>> Cc: stable@vger.kernel.org
>> ---
>>  include/uapi/sound/compress_offload.h |  3 ++
>>  sound/core/compress_offload.c         | 47 ++++++++++++++++++++++-----
>>  2 files changed, 41 insertions(+), 9 deletions(-)
>> 
>> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
>> index 7184265c0b0d..f30b9851d1d7 100644
>> --- a/include/uapi/sound/compress_offload.h
>> +++ b/include/uapi/sound/compress_offload.h
>> @@ -189,4 +189,7 @@ struct snd_compr_metadata {
>>  #define SND_COMPR_TRIGGER_DRAIN 7 /*FIXME move this to pcm.h */
>>  #define SND_COMPR_TRIGGER_NEXT_TRACK 8
>>  #define SND_COMPR_TRIGGER_PARTIAL_DRAIN 9
>> +
>> +/* FIXME move this to asound.h */
>> +#define	SNDRV_PCM_STATE_DRAINING_PAUSED	(SNDRV_PCM_STATE_LAST + 1)
>>  #endif
>> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
>> index 0e53f6f31916..58fbe0d99431 100644
>> --- a/sound/core/compress_offload.c
>> +++ b/sound/core/compress_offload.c
>> @@ -151,6 +151,7 @@ static int snd_compr_free(struct inode *inode, struct file *f)
>>  	case SNDRV_PCM_STATE_RUNNING:
>>  	case SNDRV_PCM_STATE_DRAINING:
>>  	case SNDRV_PCM_STATE_PAUSED:
>> +	case SNDRV_PCM_STATE_DRAINING_PAUSED:
>>  		data->stream.ops->trigger(&data->stream, SNDRV_PCM_TRIGGER_STOP);
>>  		break;
>>  	default:
>> @@ -431,6 +432,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
>>  	case SNDRV_PCM_STATE_RUNNING:
>>  	case SNDRV_PCM_STATE_PREPARED:
>>  	case SNDRV_PCM_STATE_PAUSED:
>> +	case SNDRV_PCM_STATE_DRAINING_PAUSED:
>>  		if (avail >= stream->runtime->fragment_size)
>>  			retval = snd_compr_get_poll(stream);
>>  		break;
>> @@ -708,11 +710,23 @@ static int snd_compr_pause(struct snd_compr_stream *stream)
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
>> +		retval = stream->ops->trigger(stream,
>> +			SNDRV_PCM_TRIGGER_PAUSE_PUSH);
>> +		if (!retval)
>> +			stream->runtime->state =
>> +				SNDRV_PCM_STATE_DRAINING_PAUSED;
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
>> @@ -720,11 +734,22 @@ static int snd_compr_resume(struct snd_compr_stream *stream)
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
>> +	case SNDRV_PCM_STATE_DRAINING_PAUSED:
>> +		retval = stream->ops->trigger(stream,
>> +			SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
>> +		if (!retval)
>> +			stream->runtime->state = SNDRV_PCM_STATE_DRAINING;
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
>> @@ -835,7 +860,9 @@ static int snd_compress_wait_for_drain(struct snd_compr_stream *stream)
>>  	 */
>>  
>>  	ret = wait_event_interruptible(stream->runtime->sleep,
>> -			(stream->runtime->state != SNDRV_PCM_STATE_DRAINING));
>> +			(stream->runtime->state != SNDRV_PCM_STATE_DRAINING) &&
>> +			(stream->runtime->state !=
>> +				SNDRV_PCM_STATE_DRAINING_PAUSED));
>>  	if (ret == -ERESTARTSYS)
>>  		pr_debug("wait aborted by a signal\n");
>>  	else if (ret)
>> @@ -857,6 +884,7 @@ static int snd_compr_drain(struct snd_compr_stream *stream)
>>  	case SNDRV_PCM_STATE_SETUP:
>>  	case SNDRV_PCM_STATE_PREPARED:
>>  	case SNDRV_PCM_STATE_PAUSED:
>> +	case SNDRV_PCM_STATE_DRAINING_PAUSED:
>>  		return -EPERM;
>>  	case SNDRV_PCM_STATE_XRUN:
>>  		return -EPIPE;
>> @@ -909,6 +937,7 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
>>  	case SNDRV_PCM_STATE_SETUP:
>>  	case SNDRV_PCM_STATE_PREPARED:
>>  	case SNDRV_PCM_STATE_PAUSED:
>> +	case SNDRV_PCM_STATE_DRAINING_PAUSED:
>>  		return -EPERM;
>>  	case SNDRV_PCM_STATE_XRUN:
>>  		return -EPIPE;
>> 
>> base-commit: a1b8638ba1320e6684aa98233c15255eb803fac7
>> -- 
>> 2.21.0
>> 
>> 
>

