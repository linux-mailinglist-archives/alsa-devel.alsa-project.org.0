Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E04951249
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 04:23:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D38E414EB;
	Wed, 14 Aug 2024 04:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D38E414EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723602210;
	bh=oEPhdZKTVMMMYtu4Nx5jQ4/hJEvXTQ1pwlI8w6rCBJA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=In2H0qYQnPA+zEH3Nwy0GHEuRHn67k+dOOHaPuci8X6+t4Dn3qJssHsUjyP4unX2B
	 WxOdPb7aS4gOQMEdYZDLdr6jZjNUDADobH5YGjSkTMOMsDs/VOxIOiFF+9Fl/vAny4
	 b3STnvAqZnBX+53iH1kRIz04rbsBINfplblwnmrs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 034A7F8059F; Wed, 14 Aug 2024 04:22:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61177F805AF;
	Wed, 14 Aug 2024 04:22:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DA8BF80423; Wed, 14 Aug 2024 04:22:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22BC7F80107
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 04:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22BC7F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TtYl2p+B
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-39b3ffc570bso28498265ab.3
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Aug 2024 19:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723602167; x=1724206967;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89JHmaWrb++n3w64WkT++R6JNihPGry7EvRTcS8lWyw=;
        b=TtYl2p+BpBVxztMYEsmd6M3hSrqvcH1Yj7KjIGaOFa7WMjxeix9Hp/8xMQWJ991772
         8DrU6pz8wlnHnvITs6hkwbPEig3sKFFnhHCwWYs5lcMLDc9ZKHFdFhbRZv+c3BjvveTm
         sSVqoYbXEZGezRJhu1AL4rh42ohROWYr30Y48xE9Lv5NwbhqirJIZggkHrA/RFdTO37o
         SEDMqqlQDUvJVQJp9xXRqwCwTRle5JX/RbHvvqHG5Qg4F3X4kb2fkbeEgLyA0A8unPCn
         L0UY3Zy2N1pd+53g3OWMFB7MadB+sqnTf3kof76bOzrh/LY/isHwOh2ax78ONgZq/lQX
         ZXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723602167; x=1724206967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89JHmaWrb++n3w64WkT++R6JNihPGry7EvRTcS8lWyw=;
        b=e2Kp0OvVsGCFdCID6kf0r+wmpwYXqNkQ/CVmfipMuMEBYkbr1UV+FpHpGA/lPzgnlP
         uHeGmV0Ht7fURdnb0ngcM3mKTPwdICtZxIzhKlvh1ZpmLal5SVI0E86dkyOlvAcm7LjV
         Hp7hGnfGlJKEA8BGBFzCXG37f9nw286NEfRV0zzlI75K0EIKN8saDNKN0bXG+pdSZ0o3
         Twb9AV/uIvVczKBQPm2PlknGHZGfd2xFe1nchDTclymvnEdC5C3VebcFRtQ3roFld716
         c4iLO4xEqbXnhMet92+uRntK0umiLlIys7D+r5VVpw0WUROKi6pq5wXNdG/Bx7SseEhx
         ZVRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRhLH5z1rq+Hx4bUBT45KLpTgVBW1jtUItKsdWMZlmvWTbBI4fG0nIC8qk6/BQeg4J/Ia0MeTY6AgzPwzYzkgHlm9IcXniQtYei+0=
X-Gm-Message-State: AOJu0Yz+0MkkaFkcYzDE7awVEluNuvgpMjkfpf+XgKd5xBbUWByQzS25
	La0OUHEsqs6+JK7CF/kcZ7yzq0gKQ/V8iPgZF8QSOm4lod+4pGXPFK//stIRax6WJbDnosHeK5e
	J5XqCWvtjj5Rj/5wHqDKMXpbipvA=
X-Google-Smtp-Source: 
 AGHT+IFPVUkZK6h4SS7dzEMo826uVZIEi+fljxMmUw43807CP8vAA2UHQF5gxQfwfaTavdVKDSVhT479wlqQfJ6aRnI=
X-Received: by 2002:a05:6e02:1d9d:b0:397:c5da:dc02 with SMTP id
 e9e14a558f8ab-39d12484a08mr20645625ab.4.1723602167332; Tue, 13 Aug 2024
 19:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
 <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
 <ffa85004-8d86-4168-b278-afd24d79f9d8@linux.intel.com>
 <116041ee-7139-4b77-89be-3a68f699c01b@perex.cz>
 <930bb152-860a-4ec5-9ef0-1c96f554f365@linux.intel.com>
 <c9039808-cd04-452d-9f6c-f91811088456@perex.cz>
 <ed1192e0-00e7-4739-a687-c96dc2d62898@linux.intel.com>
 <CAA+D8AMOh=G7W5-dYw_=Xx-s0PqEu2suKYorscoWku86Rn-=+A@mail.gmail.com>
 <542d47c5-7ce3-4c17-8c0a-3a2b2a9e6c6a@linux.intel.com>
 <c3b8f7b8-fc5e-4285-bee8-7edd448a405d@perex.cz>
 <CAA+D8ANg7C7vuxU44mAG8EnmcZjB_te5N_=4M4v_-Q9ZyPZ49g@mail.gmail.com>
 <2be4303e-58e1-4ad7-92cf-f06fa6fa0f08@perex.cz>
 <7dc039db-ecce-4650-8eb7-96d0cfde09a2@linux.intel.com>
In-Reply-To: <7dc039db-ecce-4650-8eb7-96d0cfde09a2@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 14 Aug 2024 10:22:35 +0800
Message-ID: 
 <CAA+D8AMv=tHV3b-Rfo9Pjqs0bX5SVschD=WD06qxjJOk5zQmiQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 vkoul@kernel.org,
	tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: DWR4GUV53YRBSK7JXQ2KQR25BEAJACKX
X-Message-ID-Hash: DWR4GUV53YRBSK7JXQ2KQR25BEAJACKX
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DWR4GUV53YRBSK7JXQ2KQR25BEAJACKX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 12, 2024 at 9:44=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 8/12/24 15:31, Jaroslav Kysela wrote:
> > On 12. 08. 24 12:24, Shengjiu Wang wrote:
> >> On Fri, Aug 9, 2024 at 10:01=E2=80=AFPM Jaroslav Kysela <perex@perex.c=
z> wrote:
> >>>
> >>> On 09. 08. 24 14:52, Pierre-Louis Bossart wrote:
> >>>
> >>>>> And metadata
> >>>>> ioctl can be called many times which can meet the ratio modifier
> >>>>> requirement (ratio may be drift on the fly)
> >>>>
> >>>> Interesting, that's yet another way of handling the drift with
> >>>> userspace
> >>>> modifying the ratio dynamically. That's different to what I've seen
> >>>> before.
> >>>
> >>> Note that the "timing" is managed by the user space with this scheme.
> >>>
> >>>>> And compress API uses codec as the unit for capability query and
> >>>>> parameter setting,  So I think need to define "SND_AUDIOCODEC_SRC'
> >>>>> and 'struct snd_dec_src',  for the 'snd_dec_src' just defined outpu=
t
> >>>>> format and output rate, channels definition just reuse the
> >>>>> snd_codec.ch_in.
> >>>>
> >>>> The capability query is an interesting point as well, it's not clear
> >>>> how
> >>>> to expose to userspace what this specific implementation can do, whi=
le
> >>>> at the same time *requiring* userpace to update the ratio dynamicall=
y.
> >>>> For something like this to work, userspace needs to have pre-existin=
g
> >>>> information on how the SRC works.
> >>>
> >>> Yes, it's about abstraction. The user space wants to push data, read
> >>> data back
> >>> converted to the target rate and eventually modify the drift using a
> >>> control
> >>> managing clocks using own way. We can eventually assume, that if this
> >>> control
> >>> does not exist, the drift cannot be controlled. Also, nice thing is
> >>> that the
> >>> control has min and max values (range), so driver can specify the
> >>> drift range,
> >>> too.
> >>>
> >>> And again, look to "PCM Rate Shift 100000" control implementation in
> >>> sound/drivers/aloop.c. It would be nice to have the base offset for t=
he
> >>> shift/drift/pitch value standardized.
> >>
> >> Thanks.
> >>
> >> But the ASRC driver I implemented is different, I just register one so=
und
> >> card, one device/subdevice.  but the ASRC hardware support 4 instances
> >> together, so user can open the card device 4 times to create 4 instanc=
es
> >> then the controls can only bind with compress streams.
> >
> > It's just a reason to add the subdevice code for the compress offload
> > layer like we have in other APIs for overall consistency. I'll try to
> > work on this.
>
> I thought this was supported already? I remember there was a request to
> enable more than one compressed stream for enhanced cross-fade support
> with different formats? That isn't supported with the single-device +
> PARTIAL_DRAIN method.
>
> Vinod?
>
> >> I think I can remove the 'SNDRV_COMPRESS_SRC_RATIO_MOD',
> >
> > Yes.
> >
> >> Only define a private type for driver,  which means only the ASRC driv=
er
> >> and its user application know the type.
> >
> > The control API should be used for this IMHO.
>
> Agree, this would be a 'clean' split where the compress API is used for
> the data parts and the control parts used otherwise to alter the ratio
> or whatever else is needed.
>
> >> For the change in 'include/uapi/sound/compress_params.h",  should I
> >> keep them,  is there any other suggestion for them?
>
> You can add the SRC type but if you use a control for the parameters you
> don't need to add anything for the encoder options, do you?
>

Yes, to go further, I think we can use SND_AUDIOCODEC_PCM, then
the SRC type will be dropped.

But my understanding of the control means the .set_metadata() API, right?
As I said, the output rate, output format, and ratio modifier are applied t=
o
the instances of ASRC,  which is the snd_compr_stream in driver.
so only the .set_metadata() API can be used for these purposes.

Best regards
Shengjiu Wang
