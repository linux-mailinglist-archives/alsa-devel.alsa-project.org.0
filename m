Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F4632A428
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 16:37:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C677174F;
	Tue,  2 Mar 2021 16:36:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C677174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614699435;
	bh=ZgmRhqiuhJzzl6wadvFstMENEzyQMb242bDEML+yA1Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l0Zg6eV76CBpRABjwQUe9ybA/NSrH7dQjXkkgUt/QFE0MPdTizWACgTtV/7KRScMe
	 SvA7PRhwrECG/oWYmD1ibsNwCUsdTqApxnvgEo9X0UttoPcRBVdzE2E3q9RTwTB1Ne
	 pZRBvJhi9gTCit1kXlquPqSwdcs+gQ+1Rwr4si4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB498F802CA;
	Tue,  2 Mar 2021 16:35:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56DA3F80271; Tue,  2 Mar 2021 16:35:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95802F8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 16:35:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95802F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="mzldlBoL"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id CE368A178A;
 Tue,  2 Mar 2021 16:35:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=3sXhMOkM8LPe
 kLQJ3JvWQSiaoISGZyoWfcdIHtOJozw=; b=mzldlBoLn0NX3gqduhq7oHrlZOp4
 MdnN2j6nmr6SccEt9rMCwx1Fp9sfgTRp2Xe6VfqzGoIFItrsWos7VfFvvhtvRi1z
 ZVD61qHZQN2ajz0hY0ktQzvf7Xa3HhObJtZJObTvK7V7LmxRu3zsorJh7ssWYK9m
 D8LrFdlko5HsOJR1tUimCA5eViDiEAc/vnKXjvkd5aGqlN26tU8eZSeoydpk9qm0
 RMr2dArQLodtJXuUw6Rm6gzeWAmMgNIy/wWdroW2gMDrbADAO9PQLDkohZAvpDSl
 rZrbXOSx2dpsYLzYPYiaUBSzyz/N+4tphZJkTS6d1NBaW4yeCiR78tCmuA==
Subject: Re: [PATCH v6 9/9] ALSA: virtio: introduce device suspend/resume
 support
To: Takashi Iwai <tiwai@suse.de>
References: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
 <20210227085956.1700687-10-anton.yakovlev@opensynergy.com>
 <s5hpn0kjt31.wl-tiwai@suse.de>
 <7d4daea0-ed59-e84c-c28a-945c49204c83@opensynergy.com>
 <s5hwnuqgifa.wl-tiwai@suse.de>
 <d9853306-2adf-24fe-935c-f7f8a1295dc3@opensynergy.com>
 <s5hr1kxhqcn.wl-tiwai@suse.de>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <2479ed0f-4c90-f565-81cd-8d0348cd14bc@opensynergy.com>
Date: Tue, 2 Mar 2021 16:35:24 +0100
MIME-Version: 1.0
In-Reply-To: <s5hr1kxhqcn.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org, "Michael S.
 Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, virtualization@lists.linux-foundation.org
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

On 02.03.2021 10:11, Takashi Iwai wrote:
> On Tue, 02 Mar 2021 09:09:33 +0100,
> Anton Yakovlev wrote:
>>
>> On 02.03.2021 07:48, Takashi Iwai wrote:
>>> On Tue, 02 Mar 2021 07:29:20 +0100,
>>> Anton Yakovlev wrote:
>>>>
>>>> On 28.02.2021 13:05, Takashi Iwai wrote:
>>>>> On Sat, 27 Feb 2021 09:59:56 +0100,
>>>>> Anton Yakovlev wrote:
>>>>>>
>>>>
>>>> [snip]
>>>>
>>>>>> --- a/sound/virtio/virtio_pcm.c
>>>>>> +++ b/sound/virtio/virtio_pcm.c
>>>>>> @@ -109,6 +109,7 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
>>>>>>                  SNDRV_PCM_INFO_BATCH |
>>>>>>                  SNDRV_PCM_INFO_BLOCK_TRANSFER |
>>>>>>                  SNDRV_PCM_INFO_INTERLEAVED |
>>>>>> +             SNDRV_PCM_INFO_RESUME |
>>>>>>                  SNDRV_PCM_INFO_PAUSE;
>>>>>
>>>>> Actually you don't need to set SNDRV_PCM_INFO_RESUME.
>>>>> This flag means that the driver supports the full resume procedure,
>>>>> which isn't often the case; with this, the driver is supposed to
>>>>> resume the stream exactly from the suspended position.
>>>>>
>>>>> Most drivers don't set this but implement only the suspend-stop
>>>>> action.  Then the application (or the sound backend) will re-setup the
>>>>> stream and restart accordingly.
>>>>
>>>> I tried to resume driver without SNDRV_PCM_INFO_RESUME, and alsa-lib
>>>> called only ops->prepare(). It makes sense for a typical hw, but we have
>>>> "clean" unconfigured device on resume. And we must set hw parameters as
>>>> a first step. It means, that code should be more or less the same. And
>>>> maybe it's better to set SNDRV_PCM_INFO_RESUME, since it allows us to
>>>> resume substream in any situation (regardless of application behavior).
>>>> I can refactor code to only send requests from trigger(RESUME) path and
>>>> not to call ops itself. It should make code more straitforward. What do
>>>> you say?
>>>
>>> How about calling hw_params(NULL) conditionally in the prepare?
>>
>> Then the question is that condition. When ops->prepare() is called, the
>> substream is in SUSPENDED state or not? If not then we need to track
>> this in some additional field (and it will make logic a little bit
>> clumsy, since that field is needed to be carefully handled in other
>> places).
> 
> Yes, you'd need to have a suspend/resume PM callback in the driver
> that flips the internal flag to invalidate the hw_parmas, and in the
> prepare callback, just call hw_params(NULL) if that flag is set.
> 
>>> Doing the full stack work in the trigger callback is bad from the API
>>> design POV; in general the trigger callback is supposed to be as short
>>> as possible.
>>
>> Yeah, but usually original subsystem design does not take into account
>> para-virtualized devices, which usually have it's own slightly different
>> reality. And we need to introduce some tricks.
> 
> The hardware drivers do a lot of more things in either suspend/resume
> PM callbacks or prepare callback for re-setup of the hardware.  We can
> follow the similar pattern.  Heavy-lifting works in the trigger
> callbacks is really something to avoid.

Ok, I redone this part and now the driver sets parameters for the device
in ops->prepare() if the substream was suspended. And everything works
fine. Thanks! I will send a new patch set soon.


> Takashi
> 

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

