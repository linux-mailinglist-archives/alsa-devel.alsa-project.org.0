Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F4714CF6F
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 18:18:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 071F31680;
	Wed, 29 Jan 2020 18:17:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 071F31680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580318328;
	bh=H0dasW1rXAlZ9rrvme4M0qWxWkj960PU+ph8tJQnJnA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QjHeq5JALlfX/q5GzfeBLAq6nVsj7ZatpgcGa9Sic1ucCzqdw/fTF/2CN409z1EW0
	 2Bl3XjbYPLDZX0yMJ6CP+3UaCApxbh/KbaXcY4shwAgXxqDHSCd6FdqLWTTXSsL7qB
	 WuIWqpcsarRNmivvKxMuHOE51NwCVgbPswxSAM6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4428BF80229;
	Wed, 29 Jan 2020 18:17:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28E39F8021E; Wed, 29 Jan 2020 18:17:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE114F80082
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 18:16:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE114F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="zQCcBtmQ"
Received: by mail-io1-xd2f.google.com with SMTP id x1so552055iop.7
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 09:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pkY3rJ7q3KWgPF0vkFnoBokd91LsatHYGYc1FguHOHQ=;
 b=zQCcBtmQis6AuD+Y0l2I3wUMZTiJj48In8KxB470fY0nN8dFsy5bp0PrxqV7iWkIYB
 Jv45cLhgptrUABNJ8c5e2e8Rv3+RLwKedrz58q8mzIHOHrjx0sBY7GyiQm8mz9ZwUW6j
 p95WenyQIWc5T/D0zJnkPpionch7K1fpyX8olp0BIyWNFE6k84JMG8pNw2xg2Td2Mnef
 AjpMrNttzTuCL6CZhSq/BY5ffsaBLeZU+l13CFb+a1DY9ZXTXhlstBE1bQAg3fsmZz5t
 IM+l9K4Paa5r4QBFE6Ns0qIP6E+idrQUu49NHh8a8lsYWiWUCxLxcnkVWKAQLPUgZmpx
 xtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pkY3rJ7q3KWgPF0vkFnoBokd91LsatHYGYc1FguHOHQ=;
 b=B3X07NAOOxmGnloXg0QrIkHrUICMZqW4qWulowAWpcVan9hghUyh6DYn+cDxIVOKQq
 4YL1OQt3qeY73KGX6faV0cTkcZVrGTuRzviZumRwoU6A1WloIxf/8/PeniiuYwYPcgRV
 0w9c4gcmskypYq5YfwQZ/AagmmVBuHJ1HCXIT2yolkGykSzPkEzj4hslEn4/x25XStIL
 Xa/BjdsERaL+y9WfhCYbpy2nLCUK5F7yh/D5hEzQx21go+y8Z/acMFrITR8ebO1fg5dE
 N55ONtI05U+HZ7aDstG3rgCKMSKKQaY7RehzubaS3CvL7SL6unsIgl9Tl9BXTe5drjB9
 22Gw==
X-Gm-Message-State: APjAAAUcr4YmB9HwPFqhAAeX2NzOg5fu2qDOutfG8YDKzpngFmnLcyKu
 dylgwqdxL3C9wve78xs11sWRsnVQmVAVZTzhhGbnfQ==
X-Google-Smtp-Source: APXvYqwNXxtlxqL6fnNFUTK9YD8EH5G9iggQtHHz7Bb1W3M7yZr0GZuK34/Yq3WGZO76KbRgLG0UaqJrN8wnOFBssqY=
X-Received: by 2002:a02:7f54:: with SMTP id r81mr104095jac.121.1580318214268; 
 Wed, 29 Jan 2020 09:16:54 -0800 (PST)
MIME-Version: 1.0
References: <CAFQqKeW5b5BEU1cXRzxqmmSNCQ8Qnifn3mivx4yVnrtk7Ho0Tg@mail.gmail.com>
 <s5hsgjyn1ci.wl-tiwai@suse.de>
 <aff5f7fd-13d2-b523-b3c6-a4529c4cf26e@linux.intel.com>
 <s5htv4edxf5.wl-tiwai@suse.de>
 <d143aa71-92c7-5ba7-4866-68eef82b99b0@linux.intel.com>
 <s5ho8umdwdz.wl-tiwai@suse.de> <s5hlfpqdw25.wl-tiwai@suse.de>
In-Reply-To: <s5hlfpqdw25.wl-tiwai@suse.de>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Wed, 29 Jan 2020 09:16:43 -0800
Message-ID: <CAFQqKeVCKp1cSL+j_uf-dbG8y1BYCTzHdrJFQ7Vo4VAsA8dYzQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] Question about the right fix for a sparse warning
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

>
> > Sorry, my bad, it seems that my sparse program was too old.  After
> > upgrading to the latest version, I could see the warning, too.
>
> ... and the cause was what I suspected: it's a 64bit compat type that
> defines the fields explicitly with __s32.  I overlooked that it's
> always used for __KERNEL__.  The tentative fix is below.
>
>
> thanks,
>
> Takashi
>
>
> --- a/include/uapi/sound/asound.h
> +++ b/include/uapi/sound/asound.h
> @@ -564,13 +564,13 @@ typedef char __pad_after_uframe[sizeof(__u64) -
> sizeof(snd_pcm_uframes_t)];
>  #endif
>
>  struct __snd_pcm_mmap_status64 {
> -       __s32 state;                    /* RO: state -
> SNDRV_PCM_STATE_XXXX */
> +       snd_pcm_state_t state;          /* RO: state -
> SNDRV_PCM_STATE_XXXX */
>         __u32 pad1;                     /* Needed for 64 bit alignment */
>         __pad_before_uframe __pad1;
>         snd_pcm_uframes_t hw_ptr;       /* RO: hw ptr (0...boundary-1) */
>         __pad_after_uframe __pad2;
>         struct __snd_timespec64 tstamp; /* Timestamp */
> -       __s32 suspended_state;          /* RO: suspended stream state */
> +       snd_pcm_state_t suspended_state;        /* RO: suspended stream
> state */
>         __u32 pad3;                     /* Needed for 64 bit alignment */
>         struct __snd_timespec64 audio_tstamp; /* sample counter or wall
> clock */
>  };
>

Thanks, Takashi. I will prepare a patch with the fix.

Thanks,
Ranjani
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
