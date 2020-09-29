Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECCE27C0E4
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 11:19:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3B6C1899;
	Tue, 29 Sep 2020 11:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3B6C1899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601371170;
	bh=LBRUFJBYh07sdj7GtfBBIJmCCCpOAQpkelfVoYeFMu4=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K7jCEHrMUgEkHoHKn03kLxij1UI1JbrDlQXUfld3t+BohUfMy3hN6PGnufnDLWXmr
	 /H5YJFZMBlsMIFhc5p3TyDU3kPfs/MKKM1ClnI/btfmP5RhE6eb/7ElZA2aFTF8qqR
	 CnhJDV2sW4ue/nHXNBJ7UBNPjNajhoBWVLlUsD9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3F67F800DD;
	Tue, 29 Sep 2020 11:17:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FBB1F800DD; Tue, 29 Sep 2020 11:17:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 870FAF800DD
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 11:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 870FAF800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="PVTY/wLr"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200929091728epoutp02788995b938fd73f9e50b79bcec6075cc~5NnvhC-0k2790127901epoutp02e
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 09:17:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200929091728epoutp02788995b938fd73f9e50b79bcec6075cc~5NnvhC-0k2790127901epoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1601371048;
 bh=r7nsufpQhX/j5vjr4/HkZdFhZyF+t8W+LkzurRDKdlE=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=PVTY/wLrYyfk4fjpl6KHYY7rQ/TvEk17q08sNXgkMTZ4/mAohg2JnIXvJaxJxYhJf
 yoJOMl05jGG7IpSIF4kHmVM2khVy8GFw3ihnAY98WCFCF9OzHKnj/aStIPiM4bSIAj
 foB/Q0AmtVoejbRu9TsBI9/yry4auwoxyYat62d8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20200929091727epcas2p414ff05bb675768e0db6612afbe4c49cd~5Nnuh2vld2101821018epcas2p4E;
 Tue, 29 Sep 2020 09:17:27 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.182]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4C0v111Tt1zMqYkf; Tue, 29 Sep
 2020 09:17:25 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 9B.0A.09908.5ABF27F5; Tue, 29 Sep 2020 18:17:25 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20200929091724epcas2p2b1bddaf3f94929619721d4696036e74b~5NnsBn-hN0329303293epcas2p2k;
 Tue, 29 Sep 2020 09:17:24 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200929091724epsmtrp298c233b5e9008be2682abd01c4385097~5NnsA14iG3014530145epsmtrp2i;
 Tue, 29 Sep 2020 09:17:24 +0000 (GMT)
X-AuditID: b6c32a48-139ff700000026b4-53-5f72fba5a991
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 82.57.08745.4ABF27F5; Tue, 29 Sep 2020 18:17:24 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200929091724epsmtip2ca474ce97fcf2385c28d7010a48496df~5Nnry_VvJ2515925159epsmtip2u;
 Tue, 29 Sep 2020 09:17:24 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Takashi Iwai'" <tiwai@suse.de>
In-Reply-To: <s5heemlklo0.wl-tiwai@suse.de>
Subject: RE: [PATCH] ALSA: compress: allow pause and resume during draining
Date: Tue, 29 Sep 2020 18:17:24 +0900
Message-ID: <000501d69641$57b66460$07232d20$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIUfoZK8dcLaUFmbqZ4zOMZA20dmgNDBv+0Ad0z+Bmo2oLHEA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmue7S30XxBr8vs1tcuXiIyWLGtm4W
 i8Z7E9gsVl/dwmTx7UoHk8Wv/8+YLI5eXMxk0XC3md1iw/e1jBYvN79hsjjSOIXJYuedE8wO
 PB4bPjexeeycdZfdY9OqTjaPeScDPfq2rGL0WL/lKovH5tPVAexROTYZqYkpqUUKqXnJ+SmZ
 eem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QIcqKZQl5pQChQISi4uV9O1sivJL
 S1IVMvKLS2yVUgtScgoMDQv0ihNzi0vz0vWS83OtDA0MjEyBKhNyMj6/1i344FSx9+0CtgbG
 V6ZdjJwcEgImErNerGHuYuTiEBLYwSjx5vtcNgjnE6PEvCm/2SGcz4wSM08/Z4JpmXrwJVTL
 LkaJ2bOOMEI4Lxklli/rZAGpYhPQlfhy7w4ziC0ioCLxtHcdWDezwFYmiTcbU0FsTgFtiQkX
 p7OC2MIC3hI/j34CGsTBwSKgKjH/RBFImFfAUqLv3GMWCFtQ4uTMJywQY+Qltr+dwwxxkILE
 z6fLWCFWOUlsPt0MtUpEYnZnG9ihEgJnOCSOH+thgWhwkWic2wP1jbDEq+Nb2CFsKYnP7/ay
 QTQ0M0q8O/sHKjGFUaKzWwjCNpbYMvcUE8ihzAKaEut36YOYEgLKEkduQd3GJ9Fx+C87RJhX
 oqMNqlFJYuOpf0wQYQmJeRvYJzAqzULy2Cwkj81C8sAshFULGFlWMYqlFhTnpqcWGxWYIEf1
 JkZwEtby2ME4++0HvUOMTByMhxglOJiVRHh9cwrihXhTEiurUovy44tKc1KLDzGaAkN6IrOU
 aHI+MA/klcQbmhqZmRlYmlqYmhlZKInzvrO6ECckkJ5YkpqdmlqQWgTTx8TBKdXAtOSN0/V4
 tifZN7qy5I8ZlxmUiDMca1H7mpxVvCj0d9vLB7PKzfyldrSf1TMzmhb4q0zQ5fnLaQ/rzrW4
 29xpX5IZe2riM4svlxeUZvyw333k8UUvWX+//j2bGVxvPd3/eXO345qKSbsiqywe92+ZkJTh
 /OLj/3fLtG+4mRWsDZqUMG2puNehez9N2iwZ5bNnrm6Z428+K/7Vugm32GON9607tdZpKv/6
 p+7SuSwNFxd1pCzYINZ7M+enqtX5hhebnURly6JXWXatblmxMJWteWWHsUyMbfIzRY87iwul
 +2cbn9FMKNvxnem0+w/lDdsCxUPfPJG5kWlW3bmp8ZCg/DmJ4yuW9W9zFJv7K+IGnxJLcUai
 oRZzUXEiACEQP0ZLBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsWy7bCSvO6S30XxBmuniFhcuXiIyWLGtm4W
 i8Z7E9gsVl/dwmTx7UoHk8Wv/8+YLI5eXMxk0XC3md1iw/e1jBYvN79hsjjSOIXJYuedE8wO
 PB4bPjexeeycdZfdY9OqTjaPeScDPfq2rGL0WL/lKovH5tPVAexRXDYpqTmZZalF+nYJXBmf
 X+sWfHCq2Pt2AVsD4yvTLkZODgkBE4mpB18ydzFycQgJ7GCUuHNlMjNEQkLiw/wz7BC2sMT9
 liOsEEXPGSV2z/nJApJgE9CV+HLvDliDiICKxNPedUwgRcwCB5kkXvyaCDV2FaPE9d0P2UCq
 OAW0JSZcnM4KYgsLeEv8PPqJsYuRg4NFQFVi/okikDCvgKVE37nHLBC2oMTJmU9YQEqYBfQk
 2jYygoSZBeQltr+dA3WogsTPp8tYIW5wkth8upkJokZEYnZnG/MERuFZSCbNQpg0C8mkWUg6
 FjCyrGKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECI5HLa0djHtWfdA7xMjEwXiIUYKD
 WUmE1zenIF6INyWxsiq1KD++qDQntfgQozQHi5I479dZC+OEBNITS1KzU1MLUotgskwcnFIN
 TIf5g5x2VEhND9CZz3nF5/3aPZ4ZPjeTl9SmM6daVzqsmB8hz7f/q5po8/vY4/vOW6qX5rwr
 1vaM3S1+9bb8OtPGI33+j0obWS8uYbjZ1bqGIeHDNJc50QpHzL9+unvX+dt/BkeOspDP4k9f
 PdqfG8NQF+CdE8zx7NGCOZtrM6ccWrfAfVJCeYuZRULoTt40xTq3nZ2r3Vu83zPuV/Y+IWax
 oK/NUW+Ky9E1KbXruX8KJDy++ZHr5+d7//qnH/LedOlKxecXr5znnV8wwcEtKdw2M2LRfSP5
 /nf2z96IXUsX9fbVZi7fasz6K34Ht9TBB+3fZgRc/byWPeaPktsUxWfMj8+9L5n9zrU9ZG1e
 gRJLcUaioRZzUXEiAJ0sXt82AwAA
X-CMS-MailID: 20200929091724epcas2p2b1bddaf3f94929619721d4696036e74b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200929084051epcas2p35fb2228ed1bdfce6a7ddf5b37c944823
References: <CGME20200929084051epcas2p35fb2228ed1bdfce6a7ddf5b37c944823@epcas2p3.samsung.com>
 <000001d6963c$3cc53690$b64fa3b0$@samsung.com> <s5heemlklo0.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, lgirdwood@gmail.com,
 kimty@samsung.com,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
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

On 9/29/20 06:14 PM, Takashi Iwai wrote:
>On Tue, 29 Sep 2020 10:40:51 +0200,
>Gyeongtaek Lee wrote:
>> 
>> On 9/29/20 04:13 PM, Takashi Iwai wrote:
>> >On Tue, 29 Sep 2020 03:51:35 +0200,
>> >Gyeongtaek Lee wrote:
>> >> 
>> >> On 9/28/20 11:35 PM, Pierre-Louis Bossart wrote:
>> >> >On 9/28/20 6:13 AM, Jaroslav Kysela wrote:
>> >> >> Dne 28. 09. 20 v 12:50 Gyeongtaek Lee napsal(a):
>> >> >>> With a stream with low bitrate, user can't pause or resume the stream
>> >> >>> near the end of the stream because current ALSA doesn't allow it.
>> >> >>> If the stream has very low bitrate enough to store whole stream into
>> >> >>> the buffer, user can't do anything except stop the stream and then
>> >> >>> restart it from the first.
>> >> >>> If pause and resume is allowed during draining, user experience can be
>> >> >>> enhanced.
>> >> >> 
>> >> >> It seems that we need a new state to handle the pause + drain condition for
>> >> >> this case.
>> >> >> 
>> >> >> With this proposed change, the pause state in drain is invisible.
>> >> >
>> >> >Indeed it's be much nicer to have a new state, e..g 
>> >> >SNDRV_PCM_STATE_DRAINING_PAUSED.
>> >> Ok. I will add the new state.
>> >> >
>> >> >One concern is that states are defined in uapi/sound/asoc.h, so wouldn't 
>> >> >this have impacts on userspace as well? We'd change the value of 
>> >> >SNDRV_PCM_STATE_LAST.
>> >> >
>> >> I also agree that adding new state and increase LAST value in the header of uapi
>> >> could be dangerous. So, I added it to comress_offload.h for now.
>> >> It could be merged into snd_pcm_state_t in someday with big changes.
>> >> Could you review the fixed patch below?
>> >
>> >Hrm, this resulted in rather more complex changes than the original
>> >patch.  It shows that introducing yet another state is no good idea
>> >for this particular case.
>> >
>> >Since the possible application's behavior after this pause is as same
>> >as the normal pause (i.e. either resuming pause or dropping), I find
>> >it OK to take the original approach.
>> Thank you for the review.
>> I think that I should resend the original patch.
>
>Let's wait a bit for other opinions.  We may add rather a new flag
>instead of introducing a new state, too, for example.
>
>Also, I'm not sure about any side-effect to drivers that expect the
>pause only during the running state.  We might need some check for a
>capability flag?
Ok. I will wait for more opinion and then resend fixed patch.
>
>In anyway, the timing is bad; it's too late for 5.10 to apply such a
>core change.  Can we postpone this for 5.11?
No problem. Actually I need this patch on 5.4 stable.
>
>
>thanks,
>
>Takashi
>
>
>> Am I right?
>> >
>> >
>> >thanks,
>> >
>> >Takashi
>> >
>> >> With a stream with low bitrate, user can't pause or resume the stream
>> >> near the end of the stream because current ALSA doesn't allow it.
>> >> If the stream has very low bitrate enough to store whole stream into
>> >> the buffer, user can't do anything except stop the stream and then
>> >> restart it from first.
>> >> If pause, resume are allowed during draining, user experience can be
>> >> enhanced.
>> >> 
>> >> New state for pause during draining is defined in compress_offload.h for
>> >> now. If PCM_STATEs in uapi/sound/asound.h is changed, pcm libraries and
>> >> userspace application will be affected.
>> >> 
>> >> Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
>> >> Cc: stable@vger.kernel.org
>> >> ---
>> >>  include/uapi/sound/compress_offload.h |  3 ++
>> >>  sound/core/compress_offload.c         | 47 ++++++++++++++++++++++-----
>> >>  2 files changed, 41 insertions(+), 9 deletions(-)
>> >> 
>> >> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
>> >> index 7184265c0b0d..f30b9851d1d7 100644
>> >> --- a/include/uapi/sound/compress_offload.h
>> >> +++ b/include/uapi/sound/compress_offload.h
>> >> @@ -189,4 +189,7 @@ struct snd_compr_metadata {
>> >>  #define SND_COMPR_TRIGGER_DRAIN 7 /*FIXME move this to pcm.h */
>> >>  #define SND_COMPR_TRIGGER_NEXT_TRACK 8
>> >>  #define SND_COMPR_TRIGGER_PARTIAL_DRAIN 9
>> >> +
>> >> +/* FIXME move this to asound.h */
>> >> +#define	SNDRV_PCM_STATE_DRAINING_PAUSED	(SNDRV_PCM_STATE_LAST + 1)
>> >>  #endif
>> >> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
>> >> index 0e53f6f31916..58fbe0d99431 100644
>> >> --- a/sound/core/compress_offload.c
>> >> +++ b/sound/core/compress_offload.c
>> >> @@ -151,6 +151,7 @@ static int snd_compr_free(struct inode *inode, struct file *f)
>> >>  	case SNDRV_PCM_STATE_RUNNING:
>> >>  	case SNDRV_PCM_STATE_DRAINING:
>> >>  	case SNDRV_PCM_STATE_PAUSED:
>> >> +	case SNDRV_PCM_STATE_DRAINING_PAUSED:
>> >>  		data->stream.ops->trigger(&data->stream, SNDRV_PCM_TRIGGER_STOP);
>> >>  		break;
>> >>  	default:
>> >> @@ -431,6 +432,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
>> >>  	case SNDRV_PCM_STATE_RUNNING:
>> >>  	case SNDRV_PCM_STATE_PREPARED:
>> >>  	case SNDRV_PCM_STATE_PAUSED:
>> >> +	case SNDRV_PCM_STATE_DRAINING_PAUSED:
>> >>  		if (avail >= stream->runtime->fragment_size)
>> >>  			retval = snd_compr_get_poll(stream);
>> >>  		break;
>> >> @@ -708,11 +710,23 @@ static int snd_compr_pause(struct snd_compr_stream *stream)
>> >>  {
>> >>  	int retval;
>> >>  
>> >> -	if (stream->runtime->state != SNDRV_PCM_STATE_RUNNING)
>> >> +	switch (stream->runtime->state) {
>> >> +	case SNDRV_PCM_STATE_RUNNING:
>> >> +		retval = stream->ops->trigger(stream,
>> >> +			SNDRV_PCM_TRIGGER_PAUSE_PUSH);
>> >> +		if (!retval)
>> >> +			stream->runtime->state = SNDRV_PCM_STATE_PAUSED;
>> >> +		break;
>> >> +	case SNDRV_PCM_STATE_DRAINING:
>> >> +		retval = stream->ops->trigger(stream,
>> >> +			SNDRV_PCM_TRIGGER_PAUSE_PUSH);
>> >> +		if (!retval)
>> >> +			stream->runtime->state =
>> >> +				SNDRV_PCM_STATE_DRAINING_PAUSED;
>> >> +		break;
>> >> +	default:
>> >>  		return -EPERM;
>> >> -	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
>> >> -	if (!retval)
>> >> -		stream->runtime->state = SNDRV_PCM_STATE_PAUSED;
>> >> +	}
>> >>  	return retval;
>> >>  }
>> >>  
>> >> @@ -720,11 +734,22 @@ static int snd_compr_resume(struct snd_compr_stream *stream)
>> >>  {
>> >>  	int retval;
>> >>  
>> >> -	if (stream->runtime->state != SNDRV_PCM_STATE_PAUSED)
>> >> +	switch (stream->runtime->state) {
>> >> +	case SNDRV_PCM_STATE_PAUSED:
>> >> +		retval = stream->ops->trigger(stream,
>> >> +			SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
>> >> +		if (!retval)
>> >> +			stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
>> >> +		break;
>> >> +	case SNDRV_PCM_STATE_DRAINING_PAUSED:
>> >> +		retval = stream->ops->trigger(stream,
>> >> +			SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
>> >> +		if (!retval)
>> >> +			stream->runtime->state = SNDRV_PCM_STATE_DRAINING;
>> >> +		break;
>> >> +	default:
>> >>  		return -EPERM;
>> >> -	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
>> >> -	if (!retval)
>> >> -		stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
>> >> +	}
>> >>  	return retval;
>> >>  }
>> >>  
>> >> @@ -835,7 +860,9 @@ static int snd_compress_wait_for_drain(struct snd_compr_stream *stream)
>> >>  	 */
>> >>  
>> >>  	ret = wait_event_interruptible(stream->runtime->sleep,
>> >> -			(stream->runtime->state != SNDRV_PCM_STATE_DRAINING));
>> >> +			(stream->runtime->state != SNDRV_PCM_STATE_DRAINING) &&
>> >> +			(stream->runtime->state !=
>> >> +				SNDRV_PCM_STATE_DRAINING_PAUSED));
>> >>  	if (ret == -ERESTARTSYS)
>> >>  		pr_debug("wait aborted by a signal\n");
>> >>  	else if (ret)
>> >> @@ -857,6 +884,7 @@ static int snd_compr_drain(struct snd_compr_stream *stream)
>> >>  	case SNDRV_PCM_STATE_SETUP:
>> >>  	case SNDRV_PCM_STATE_PREPARED:
>> >>  	case SNDRV_PCM_STATE_PAUSED:
>> >> +	case SNDRV_PCM_STATE_DRAINING_PAUSED:
>> >>  		return -EPERM;
>> >>  	case SNDRV_PCM_STATE_XRUN:
>> >>  		return -EPIPE;
>> >> @@ -909,6 +937,7 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
>> >>  	case SNDRV_PCM_STATE_SETUP:
>> >>  	case SNDRV_PCM_STATE_PREPARED:
>> >>  	case SNDRV_PCM_STATE_PAUSED:
>> >> +	case SNDRV_PCM_STATE_DRAINING_PAUSED:
>> >>  		return -EPERM;
>> >>  	case SNDRV_PCM_STATE_XRUN:
>> >>  		return -EPIPE;
>> >> 
>> >> base-commit: a1b8638ba1320e6684aa98233c15255eb803fac7
>> >> -- 
>> >> 2.21.0
>> >> 
>> >> 
>> >
>> 
>

