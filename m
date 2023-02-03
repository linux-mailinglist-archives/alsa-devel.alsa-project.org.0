Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F302689EEE
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 17:12:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FF8F82E;
	Fri,  3 Feb 2023 17:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FF8F82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675440769;
	bh=QRRNoTzMjRizSzpLFIKSQ+E63xGe7NVolRJFEytWe/4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kxYqBlCaXXqbaUsPdMT2DusM1HZPHQXwufE2Tl6Bzl/T0gwkymwpIp91d7qUNEF6d
	 C/8stE761uvQ2SmNH9jgucHUdNh+hgf25Db/X4rUXmfKZeBEfwUoL9BfgWvQeoXpXR
	 5lCJPUxvEG1Kcpf+VdT7LUOFicL7OsF8CIdJ6Fec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2F68F80022;
	Fri,  3 Feb 2023 17:11:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B855F80254; Fri,  3 Feb 2023 17:11:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,NICE_REPLY_A,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D7C7F80022
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 17:11:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D7C7F80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=d306TnCx
Received: by mail-wm1-x32d.google.com with SMTP id k16so4250718wms.2
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 08:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:from:cc:references:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AdbY6AeAMBsCeBTaUMmQpE4IuWIwaK+hQQIfCN+oTsQ=;
 b=d306TnCx7NZBgj9qjWhdAPElGkTRQpmDq2LG2e4Ty8Um8e0OmwW4kq4o9MN28ojlt1
 S/BLaUpMFIBoueXMjbepU16edPAh9VaV6DnPQKEaa6tob5wuJCCMAVo/xwX9JdFJTWbw
 dTd7vptmlkRMcDm6/pXRt6VLOvkKNstuSrabMAIkUDJcX5G4VojMDIPKfXuLZ400Psc1
 8NmdHI4s6KrXin/F3+zW7pBkUBBFfzCYwN9WdRQVg3Es13lHvMivUUVTsfApWkm9SDMz
 jMrclizIiu9QCsStNi3LcyMOTbvlUIkQ8yvo6tU4GA1GPCudaU3LphSdXskoTgbMuqZ9
 /pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:cc:references:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AdbY6AeAMBsCeBTaUMmQpE4IuWIwaK+hQQIfCN+oTsQ=;
 b=fUHh81BS5zdPviakxop4rGJQFVr49inBQdGFEIXxJgIanH4SHxCQzCon9YEnSz/ZZ2
 6retUgr4y5LDxH4xX6NDSt/SLsj53s+1KzQTG0hb2sNSEgXCXDXMYwP0xUsBDFuu4hqt
 +Lu7P+wTp5DCISm6P5PJbMfWVtD6uKjJmnuUWAJtl3f/BIU5ywODC24I4wNr229fnfRH
 vBFQhzB/FQAxJUeycPJffg0HPaDwnDXPFr8QyItgRJmcy54Y7vah39q4KQeZjNFZ+0DE
 mfDQDOx9pBJhwAr+MhFrabydGfo0hkLkSGrEjypXHPAg5dgSpxRk6/XwrGdcGzy3twt1
 qA7A==
X-Gm-Message-State: AO0yUKVigCQr/c8tDHfhtIcyyTq8f7HkaNixcozZ8OT941vcN0+V3r4R
 to4i9mBaJTOijr2jCBgnVCo=
X-Google-Smtp-Source: AK7set8oQbd+XXdgMC4P2Q2JSN0J4ANvmtXxpYNbd+IJvrq1MXEruPvn1NqSAS0X05uV3A2eA0v/7Q==
X-Received: by 2002:a05:600c:3b9d:b0:3d2:3be4:2d9a with SMTP id
 n29-20020a05600c3b9d00b003d23be42d9amr10364225wms.20.1675440698705; 
 Fri, 03 Feb 2023 08:11:38 -0800 (PST)
Received: from [192.168.21.204] (surfbythesea.plus.com. [81.174.134.71])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c3b0d00b003dc51c48f0bsm9157544wms.19.2023.02.03.08.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 08:11:37 -0800 (PST)
Message-ID: <2598bf64-708c-cf62-e634-44db5a850226@gmail.com>
Date: Fri, 3 Feb 2023 16:11:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Overflow in calculating audio timestamp
Content-Language: en-GB
To: o-takashi@sakamocchi.jp, pierre-louis.bossart@linux.intel.com
References: <70ff4e3a-b171-131c-a039-4fc99aa4bbfc@gmail.com>
 <Y9xWlbhPg3PteH5G@workstation>
From: Alan Young <consult.awy@gmail.com>
In-Reply-To: <Y9xWlbhPg3PteH5G@workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 03/02/2023 00:34, Takashi Sakamoto wrote:
> Hi,
>
> Thank you for the report.
>
> On Thu, Feb 02, 2023 at 01:55:24PM +0000, Alan Young wrote:
>> sound/core/pcm_lib.c:update_audio_tstamp() contains the following
>> calculation:
>>
>>          audio_nsecs = div_u64(audio_frames * 1000000000LL,
>>                  runtime->rate);
>>
>> This will result in a 64-bit overflow after 4.4 days at 48000 Hz, or 1.1
>> days at 192000.
>>
>> Are you interested in a patch to improve this?
>>
>> The same calculation occurs in a couple of other places.
> I'm interested in your patch. Would you please post it C.C.ed to the
> list and me?  As you noted, we can see the issue in ALSA PCM core and
> Intel HDA stuffs at least.
>
>   * sound/core/pcm_lib.c
>   * sound/pci/hda/hda_controller.c
>   * sound/soc/intel/skylake/skl-pcm.c
>
> I note that 'NSEC_PER_SEC' macro is available once including
> 'linux/time.h'. It is better to use instead of the literal.
> The macro is defined in 'include/vdso/time64.h'.
>
>
> As another issue, the value of 'audio_frames' comes from the value of
> 'struct snd_pcm_runtime.hw_ptr_wrap'. In ALSA PCM core, the value is
> increased by the size of PCM buffer every time hw_ptr cross the boundary
> of PCM buffer, thus multiples of the size is expected. Nevertheless,
> there is no check for overflow within 64 bit storage. In my opinion, the
> committer had less care of it since user does not practically playback or
> capture PCM substream so long. But the additional check is preferable as
> long as it does not break the fallback implementation of audio time stamp.


I have not yet finished testing various alternatives. I want to extend 
the overflow by "enough" and also am conscious of the need to keep the 
overhead down.

I actually think, on reflection, that the only case that matters is the 
call from update_audio_tstamp(). The others only deal with codec delays 
which will be small (unless I misunderstand those drivers).

This is what I have so far but I'll submit a proper patch when I have it 
refined.

static u64 snd_pcm_lib_frames_to_nsecs(u64 frames, unsigned int rate)
{
     /*
      *  Avoid 64-bit calculation overflow after:
      *  - 4.8 days @ 44100
      *  - 0.56 days @ 384000
      *  extending these intervals by a factor of 100.
      */
     if (frames < 0xffffffffffffffffLLU / NSEC_PER_SEC)
         return div_u64(frames * NSEC_PER_SEC, rate);

     if (rate % 100 == 0)
         return div_u64(frames * (NSEC_PER_SEC/100), (rate/100));

     /* Fallback: reduce precision to approximately deci-micro-seconds: 1.28e-7 */
     return div_u64(frames * (NSEC_PER_SEC >> 7), rate) << 7;
}

Alan.
