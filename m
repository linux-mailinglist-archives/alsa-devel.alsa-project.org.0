Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A6F4266BF
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 11:26:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E5D11670;
	Fri,  8 Oct 2021 11:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E5D11670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633685183;
	bh=pXGZyjE+Y2XHiI3juPFFExq7L948okVr2jspOO7PJZ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vhrKZ/gTq5BFQohvgGm5bnxqdNABkenVV3yaQxdc6qsrsFqQ06XIhHWUDoEpYGcC2
	 q7nFpZ8ihEiSrrjr1sBXwbqS0lxDXfl3MHVvZfPoVJYPRxNYXagwSYczuLyoaYmv4x
	 CgS2dIAiWARIuu4EGmHdj3w8FCdwIOlfIcFnCqRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52774F80124;
	Fri,  8 Oct 2021 11:25:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46E08F80246; Fri,  8 Oct 2021 11:25:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B523BF80229
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 11:24:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B523BF80229
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MQeDw-1mNIz829Ha-00NgKy for <alsa-devel@alsa-project.org>; Fri, 08 Oct
 2021 11:24:56 +0200
Received: by mail-wr1-f45.google.com with SMTP id v25so27659569wra.2
 for <alsa-devel@alsa-project.org>; Fri, 08 Oct 2021 02:24:56 -0700 (PDT)
X-Gm-Message-State: AOAM532CTL3CGjFcGM+wk+tMZ+rYATFQyln7frUo58eEEEvGJY63F/7R
 fPIhKFHigV7UqXrPCyCSGe4/AYA2VKa+Wp23VyY=
X-Google-Smtp-Source: ABdhPJxbI9FlI5wrrkveY0OcRvKfdHT6ALl6Zio9wUi7opJy24FK9gPvC5um/n8zfpgrtkT+TFtW3m/pBAMoS+zbbfg=
X-Received: by 2002:adf:a3da:: with SMTP id m26mr2544913wrb.336.1633685096034; 
 Fri, 08 Oct 2021 02:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191211212025.1981822-1-arnd@arndb.de>
 <20191211212025.1981822-9-arnd@arndb.de>
 <29QBMJU8DE71E.2YZSH8IHT5HMH@mforney.org> <s5hpmsh9kdx.wl-tiwai@suse.de>
 <CAK8P3a0K3XtjiszC3XWgG0L8+AgO+xUGr_KEAnb9a5GmyecoUQ@mail.gmail.com>
 <s5hee8x9f92.wl-tiwai@suse.de>
 <CAK8P3a0pSZxqfk-bn+idrDYDwANSfiP9L6U1O5jLQvK+3vwyVQ@mail.gmail.com>
 <s5hy27497eo.wl-tiwai@suse.de> <20211007160634.GB7074@brightrain.aerifal.cx>
 <s5hr1cw95ar.wl-tiwai@suse.de> <20211007165158.GC7074@brightrain.aerifal.cx>
 <s5h5yu79aab.wl-tiwai@suse.de>
In-Reply-To: <s5h5yu79aab.wl-tiwai@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 Oct 2021 11:24:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0qxNLv3_RcR5COcRGPcTnYMcfbOjdWKiT2hKdcof9WUg@mail.gmail.com>
Message-ID: <CAK8P3a0qxNLv3_RcR5COcRGPcTnYMcfbOjdWKiT2hKdcof9WUg@mail.gmail.com>
Subject: Re: [musl] Re: [alsa-devel] [PATCH v7 8/9] ALSA: add new 32-bit
 layout for snd_pcm_mmap_status/control
To: musl@lists.openwall.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:kzKCuRIGGrpLBNdrR0rveDR0+PLeC29Os1qQ1pP2WbVZU2AHQc7
 dMFt8WB0C4pOYvajMes/EeChoY3BKq75+LvNpReJIAIvdG8tj+7E1mwVslBLgxIb8vKmwei
 gB6Qi6QkvaPLlQpzfLBtCwXTrDmVgzPFROXGuuWgKVC+K7PqCbdI7bmfDjREZPveXhR5ohN
 gLOh2q7jwvX8SzvS6Lxbw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OE9rzsDMyho=:1jJy5p2n9CBLktzC1aciOG
 l2PSYVyXvqzgwANPWU/s9yBHfprf3gTzmhPBWLJvuKQOCCGCg3xJlhyOZkNg1VPcz4iin1UuV
 XgNwPuE8hQUjyZPxypkMgU1Wobc1bZq4tJY3GNAMRP+m+GZ69+GQ4I6R9uklxHiB+p8nIGzp+
 BjudsoIeKqSdcA8VTr5S9Igkyt9xEl+wS0auRFji6B35JuJDwTT+FF8PCTZuZWCLjBltTO6w4
 fapmxvkOV/5ypXINyyOg1l3VrjmbtNtHNXdvfNFjODb8AzjZIgzNlwm1pv4/adaY94fUMR0sZ
 yPinXDDKQNNVyaH6uVLByU+D7UlM7tQG9HNrmUwSdIDFWrnDc2oJe3qN+lSh6oatw0oWNJMgl
 uGgqzSBaViaxdqlFVMGUr93NuLBdZEw2gopzPVJyvYxVDr0p3LgGhSNQ4UPvmDJMLLDvb1tuT
 OLh/tvtd6rXVj1D19dquaR7Sz8olY5w/0vgC/u35ze2aBPXZNoxw+ETi7yrn1GSeNZwQh35HM
 tFWEP20pWup9UCpPgrT/yrUGXLR3ASArw3su5eQDLBEcts38o9nMuJJf5TqYtW1572NTbD6aj
 TZbK5ht8CQT5zyKaNSKJfdOuP65uooBgXr/Jr5mpgqt3KgEi6mcn364jWl9Yf7F+0Y89AgMK4
 2HDyVMRs+1MIo9WxKemW8WDCsAGo6zPfmiYapyn0vNcb9UenkmfSSJ6kvyUHDA29dbPIZiiPH
 fZ+lpDG87r5NTqo798aWKGoz3uBsLqff73plBCf9z8rTEDqv1x2Dd2PBm1kawWtreTgenukCU
 pYrevkrlD2eP/3mRDUogc7XqG3MexkxMyzygEBHGwwD2jpzLz9ErhA2Yw/bMAK+dS8TXysKHS
 ANp8lCpv+gUvumu9gIAg==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
 Baolin Wang <baolin.wang@linaro.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Michael Forney <mforney@mforney.org>,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>
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

On Fri, Oct 8, 2021 at 10:43 AM Takashi Iwai <tiwai@suse.de> wrote:
> On Thu, 07 Oct 2021 18:51:58 +0200, Rich Felker wrote:
> > On Thu, Oct 07, 2021 at 06:18:52PM +0200, Takashi Iwai wrote:
>
> @@ -557,11 +558,15 @@ struct __snd_pcm_sync_ptr {
>  #if defined(__BYTE_ORDER) ? __BYTE_ORDER == __BIG_ENDIAN : defined(__BIG_ENDIAN)
>  typedef char __pad_before_uframe[sizeof(__u64) - sizeof(snd_pcm_uframes_t)];
>  typedef char __pad_after_uframe[0];
> +typedef char __pad_before_u32[4];
> +typedef char __pad_after_u32[0];
>  #endif
>
>  #if defined(__BYTE_ORDER) ? __BYTE_ORDER == __LITTLE_ENDIAN : defined(__LITTLE_ENDIAN)
>  typedef char __pad_before_uframe[0];
>  typedef char __pad_after_uframe[sizeof(__u64) - sizeof(snd_pcm_uframes_t)];
> +typedef char __pad_before_u32[0];
> +typedef char __pad_after_u32[4];
>  #endif

I think these should remain unchanged, the complex expression was intentionally
done so the structures are laid out the same way on 64-bit
architectures, so that
the kernel can use the __SND_STRUCT_TIME64 path internally on both 32-bit
and 64-bit architectures.

> @@ -2970,8 +2981,17 @@ static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
>         memset(&sync_ptr, 0, sizeof(sync_ptr));
>         if (get_user(sync_ptr.flags, (unsigned __user *)&(_sync_ptr->flags)))
>                 return -EFAULT;
> -       if (copy_from_user(&sync_ptr.c.control, &(_sync_ptr->c.control), sizeof(struct snd_pcm_mmap_control)))
> -               return -EFAULT;
> +       if (buggy_control) {
> +               if (copy_from_user(&sync_ptr.c.control_api_2_0_15,
> +                                  &(_sync_ptr->c.control_api_2_0_15),
> +                                  sizeof(sync_ptr.c.control_api_2_0_15)))
> +                       return -EFAULT;
> +       } else {
> +               if (copy_from_user(&sync_ptr.c.control,
> +                                  &(_sync_ptr->c.control),
> +                                  sizeof(sync_ptr.c.control)))
> +                       return -EFAULT;
> +       }

The problem I see with this is that it might break musl's ability to
emulate the new
interface on top of the old (time32) one for linux-4.x and older
kernels, as the conversion
function is no longer stateless but has to know the negotiated
interface version.

It's probably fine as long as we can be sure that the 2.0.16+ API
version only gets
negotiated if both the kernel and user sides support it, and musl only emulates
the 2.0.15 API version from the current kernels.

I've tried to understand this part of musl's convert_ioctl_struct(), but I just
can't figure out whether it does the conversion based the on the layout that
is currently used in the kernel, or based on the layout we should have been
using, and would use with the above fix. Rich, can you help me here?

       Arnd
