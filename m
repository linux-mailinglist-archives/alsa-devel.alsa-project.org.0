Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3F767B8FF
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 19:07:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6028E1FB;
	Wed, 25 Jan 2023 19:07:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6028E1FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674670073;
	bh=ocnFMDZ7ZlvU+rb+860PuFe5t5fj/KSwMKPUi4UYQRM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ML6vnoQ6e3kJn9gGiPt00ZVNM255mHnwUwtKNh6Ef6ZzsNPdvL7WyNBsqB1tpXGwi
	 VrfnXXbO0IoGh4DmCtr9mB/KYFfQQCEAGCxJNDJyONiBGnIZfkDlfj2PUqds4Aab/h
	 aptuJeLb5TAhCrfPTOJgTz25bfGGyLhn3ZzRkgkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BFE2F804A9;
	Wed, 25 Jan 2023 19:06:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9128CF80424; Wed, 25 Jan 2023 19:06:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11890F800FB
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 19:06:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11890F800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=M2/A3DMK
Received: by mail-yb1-xb36.google.com with SMTP id p141so21292320ybg.12
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 10:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i6gHcOs4YL08us1jf7eqClQvl9hw2ZJ/GGVNUWPoV+M=;
 b=M2/A3DMKNrkMuVRPgHRpPnM/8VBUC0QRClJ3NCthcvkFRwtq1BW+UUx8wJbQS/X9Vv
 2yJ8qvGg+gMwklJ9FXlK/vBFNBdaFn8ccJVehxH35yPIMxPH9ca6nEpJSXuTz4LjWt2Z
 IDlOfE4eEsD3Z1W+AjNqU0g1hmLugc9QNuD0Uip2nVNRStA5qUAAuTIdragnFsRD/o8y
 a9xhWSMmO7A3GIedUYvaWvZBRlh8CONeCca5QiIA78iCmrEtWkL8u+HDMx2897+vo4Np
 uf0gLZCvjNxFlk+2jp05yaSolgRkw2jfQNaQ8nE5Qvkb8xwNAlJKyAHyi0H81LITNMXI
 YSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i6gHcOs4YL08us1jf7eqClQvl9hw2ZJ/GGVNUWPoV+M=;
 b=uLAPXY8xGoDLOvq4sZCsAwRanCLASruRyDaBnWbul/4FIGTHqMsnaM/gvCoVYeFR8I
 qxMAFUONjPyStLMqB/RphVhGxr43qJcYjvRM5AXW0vCVubh3oFTvdqt9pVfFdpLLdwNS
 m02SSrc5zPhj4m1GlZHoEQK3TkrBZ1JvsUF9YY2PXBVBlUEGhhYX9k3+55qYpg1FyMpK
 R2XkRt/SDjqaa8Loa6jTQjQNnFeU0Zc2p6jYii6sW5wZs+X32/CikSQxxyyEFEe1jKLj
 F4hWhWlAkIOEZYxLoaus3SS3L7wmnZpKi4ZTKruJQ0CSgkyGi2vHIX0WddZCpuICsezL
 uHwA==
X-Gm-Message-State: AO0yUKWWP1SKd3JNWnR6FACEqcq2F711Mg3gXUE7HiSxUh2VdFfLc8Oe
 iNLLFmUwpvlOXjHfeUwCYAEPMNGJBrv3n10DnjU=
X-Google-Smtp-Source: AK7set8F0oCAlc9rmKVcmN+8IgcVrtWUmWM94OpPt1k34aP+Ff+vyWVWi3YqW/cKi+1+SPo5uBf4dy1te01zWWnwa+w=
X-Received: by 2002:a25:b327:0:b0:80b:5bef:7c70 with SMTP id
 l39-20020a25b327000000b0080b5bef7c70mr864603ybj.20.1674670001505; Wed, 25 Jan
 2023 10:06:41 -0800 (PST)
MIME-Version: 1.0
References: <CAHhAz+gxrjB04c-GHa1YzahyKDQcW3+xoDt9iUnkj9THKvG_TA@mail.gmail.com>
 <53e3919e-48cc-81a0-365e-015235d10c9b@linux.intel.com>
In-Reply-To: <53e3919e-48cc-81a0-365e-015235d10c9b@linux.intel.com>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Wed, 25 Jan 2023 23:36:30 +0530
Message-ID: <CAHhAz+gTrToehWki8h17DdR_u8uKmRPsDWeEygijpm51MLvz1g@mail.gmail.com>
Subject: Re: struct snd_pcm_ops callbacks
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 25, 2023 at 8:30 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 1/25/23 05:21, Muni Sekhar wrote:
> > Hi,
> >
> > struct snd_pcm_ops callbacks can be used for sending\receiving PDM
> > audio data to and from a sound card? Or is it only designed for PCM
> > audio data?
>
> It depends what side of the sound card you are looking at, the physical
> interface with external devices or the userspace interface.
I am looking at the userspace interface side.

>
> PDM can be supported at the physical interface level as long as there is
> a conversion to PCM somewhere in the hardware. Userspace will
> play/record PCM. See examples in many codecs and SOCs.
>
> There is also the possibility of packing PDM (aka DSD) as pseudo-PCM,
> that's a trick used by several USB cards. In that case of course the
> sound card cannot apply any processing to the data and is just a
> pass-through module.
>
>


-- 
Thanks,
Sekhar
