Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B327C32966B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 07:31:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DD881678;
	Tue,  2 Mar 2021 07:30:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DD881678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614666704;
	bh=M2l2ou3IWlXyrPtnpy4NYg9rJak6YqWg+mTZAq6sVEM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ijHYj6WZqw6o4RLDAoEW68dsbkhSMn1yL8nbHSIphcEVa3tk0VuHtnqakkd3WvI8q
	 0r4xvUHv9w7UZdm7j0s3LOpdxom6ulm9rcb5V30lJvawGa+7/uKw+JRiN1blo4NTQ+
	 mOp9yGh9LOuFbl4zozQ70eDbUnKi7ApBd+cK7YHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7F17F80271;
	Tue,  2 Mar 2021 07:30:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4353AF80269; Tue,  2 Mar 2021 07:29:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74D32F80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 07:29:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74D32F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="MjzEBush"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 60282A1377;
 Tue,  2 Mar 2021 07:29:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=8Yt0B43U8OdE
 T4kdbA88SrJ5iYbOz8v13cIrkyLZ+4k=; b=MjzEBush0yFIE3j0zZ105jP/PY0E
 D7YBPxe7Y6qKmIURtf+Tb8KDVY8cPScamz6XWS7xHZZKlpQ5+c2rW4Q2vJ8/3B+k
 /AmeysgEuNtVxig0nxAscB2F9Yf8g9Ps3bhJIJ61HedqfjTSepLn12bOyOdPu0wB
 zq8EDJPin6Z9i8mHmEyv1RjHRKGRq3Stzk/FCVqHPKULSZyLDta1zG7B1qmqWO+0
 Hw+X6jbo7xY+/GOPgcQi+Eay9FBv1KO/A647aghWFKbYx6UGPx5poyus39XXm8oU
 kOKM2sPwI/VxIYfhqCxWAz4lmm/LZLqH/vCoHcoDTLcEoF9PaVlTIpGwrg==
Subject: Re: [PATCH v6 9/9] ALSA: virtio: introduce device suspend/resume
 support
To: Takashi Iwai <tiwai@suse.de>
References: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
 <20210227085956.1700687-10-anton.yakovlev@opensynergy.com>
 <s5hpn0kjt31.wl-tiwai@suse.de>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <7d4daea0-ed59-e84c-c28a-945c49204c83@opensynergy.com>
Date: Tue, 2 Mar 2021 07:29:20 +0100
MIME-Version: 1.0
In-Reply-To: <s5hpn0kjt31.wl-tiwai@suse.de>
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

On 28.02.2021 13:05, Takashi Iwai wrote:
> On Sat, 27 Feb 2021 09:59:56 +0100,
> Anton Yakovlev wrote:
>>

[snip]

>> --- a/sound/virtio/virtio_pcm.c
>> +++ b/sound/virtio/virtio_pcm.c
>> @@ -109,6 +109,7 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
>>                SNDRV_PCM_INFO_BATCH |
>>                SNDRV_PCM_INFO_BLOCK_TRANSFER |
>>                SNDRV_PCM_INFO_INTERLEAVED |
>> +             SNDRV_PCM_INFO_RESUME |
>>                SNDRV_PCM_INFO_PAUSE;
> 
> Actually you don't need to set SNDRV_PCM_INFO_RESUME.
> This flag means that the driver supports the full resume procedure,
> which isn't often the case; with this, the driver is supposed to
> resume the stream exactly from the suspended position.
> 
> Most drivers don't set this but implement only the suspend-stop
> action.  Then the application (or the sound backend) will re-setup the
> stream and restart accordingly.

I tried to resume driver without SNDRV_PCM_INFO_RESUME, and alsa-lib
called only ops->prepare(). It makes sense for a typical hw, but we have
"clean" unconfigured device on resume. And we must set hw parameters as
a first step. It means, that code should be more or less the same. And
maybe it's better to set SNDRV_PCM_INFO_RESUME, since it allows us to
resume substream in any situation (regardless of application behavior).
I can refactor code to only send requests from trigger(RESUME) path and
not to call ops itself. It should make code more straitforward. What do
you say?


-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

