Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8525848A5
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 01:25:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F04CD15E5;
	Fri, 29 Jul 2022 01:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F04CD15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659050735;
	bh=bmQ6p+R4Pyz7oJM6YEpaBUrkF2LARwqIBmAJw60i+hY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QHHO9NAxOhsXRG5D/0SR8kEsolNIHljCKbZYqCkWXjlXFtUMIs364+RX0gefXb6AP
	 7Yb5FNo+zGMed8L1oRvJ8EuiwCvE+pDhH/9jXrbJ5p0JHtHehe+km2oFjpsJ9ktd3K
	 xwrrcCOm9KqG3mphxlb6XgfYF8ftuqSIpl+5NhUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BA2DF80508;
	Fri, 29 Jul 2022 01:24:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4A8BF8015B; Fri, 29 Jul 2022 01:24:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51CBEF8015B
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 01:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51CBEF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NlmLk8od"
Received: by mail-ed1-x52b.google.com with SMTP id c12so3970075ede.3
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 16:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KIA4RVx2AB2aGku6+GNAoiOt+zr30HmSggaLIZR7Rb8=;
 b=NlmLk8oda7BWnIZUcK2H0PzTRfh3iT5XLbYjkYZ6seU7fFknpWw36RqcBEP2JGMOy7
 oQOGj/qMTpupY+AxgM705aB8WLKvxuiLMVu1Th8UkpdbsTStkOCMB0DCjyrL1ra2DUm/
 O/P/tyxWCHnq7oS2hdYAzyA0HTYIdP43MoeI9e5ewZG5wZ52qaick0H9Qx5Mz6w27RbF
 +EV4QRFaHMN4SWAdFZEhLzUCLzE34ZwsfptHiWFWYFUcouvaphR+wH7XOTvTClyJB0cA
 RczTztzwgcN8A++WohoQTj/y42XLY074VxwHoh817MpDWR8yISaePKJSlfKL+mQDWHOm
 dWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KIA4RVx2AB2aGku6+GNAoiOt+zr30HmSggaLIZR7Rb8=;
 b=ts/jn8kDBLICcGaqad1hC/AgBMX0NhKpS/6ATzbJH+iOz20bRlMjBvhVCQdu299VTq
 IVLj6eh7ze1ddSmv/e+12/y29VcZqyU1UpEa11JPNmKRZo/MlShf4E3D+A5piZBgi+Ao
 8Uu17YQr5lSbZfjcRXMl+eYm818Ey3eVKI4stfVoELbF+QaOu0yOP50jgxjrDlSHCzHm
 fMh5neGFheWQdSV+Z36WcrZi7f0DBN9uXjOjl8D0Iu4rsgAbju4LP21YYnX3pHtxFHln
 AYDQK7f3mCq6ggrJVzLvTxYnB1x8YCo9sGif4PRg2FOkkJmfxoCsZqvOKxTjd8CijOVB
 3AmA==
X-Gm-Message-State: AJIora+80Wv7V1KnqIj7CeoHV2skP5n5DL459ORTAlIaJQu4mRNLNwJW
 7gP2XnYkaO6VwIaGIw2Hx+yBFuTWmd2ivgNdIRU=
X-Google-Smtp-Source: AGRyM1uL+/LS63rJB52evTcvuk1tse011MzwsBD9wpLEacOG/tM0fRTjbKj6Sn2Vp+/ZWJbVOjL3Mi9liDVsbrgUJ8Y=
X-Received: by 2002:a05:6402:64c:b0:43c:ea8e:85d6 with SMTP id
 u12-20020a056402064c00b0043cea8e85d6mr1164234edx.269.1659050663929; Thu, 28
 Jul 2022 16:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <CANX2M5Zw_zW6ez0_wvaXL1pbLnR2jWY=T7MgkT=4a-zNkiwVig@mail.gmail.com>
 <YtuceCr5OCJcDatJ@kroah.com> <874jz82kx0.wl-tiwai@suse.de>
 <CANX2M5Ywm+GpYY3+GsOWCLH24Nhy0M0LjBE-pHC8wFcd7SO=wQ@mail.gmail.com>
 <87tu73p1o2.wl-tiwai@suse.de>
In-Reply-To: <87tu73p1o2.wl-tiwai@suse.de>
From: Dipanjan Das <mail.dipanjan.das@gmail.com>
Date: Thu, 28 Jul 2022 16:24:12 -0700
Message-ID: <CANX2M5abRrSADvd3x_rm+TrA2ziu71VL6X3=v_Cft4LtaB=6Eg@mail.gmail.com>
Subject: Re: KASAN: vmalloc-out-of-bounds Write in snd_pcm_hw_params
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, fleischermarius@googlemail.com,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, consult.awy@gmail.com, syzkaller@googlegroups.com,
 its.priyanka.bose@gmail.com
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

On Tue, Jul 26, 2022 at 10:25 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> Thanks for the analysis.  A good news is that, at least for the
> vmalloc() case, it's a kind of false-positive; vmalloc() always takes
> the full pages, so practically seen, the size is page-aligned.  It's
> fooling the memory checker, though.
>
> But the similar problem could be seen with genalloc calls, and this
> was fixed by the upstream commit
> 5c1733e33c888a3cb7f576564d8ad543d5ad4a9e
>     ALSA: memalloc: Align buffer allocations in page size
>
> I suppose you can simply backport this commit to 5.10.y.  Could you
> confirm that this fixes your problem?

We confirm that the patch you proposed fixes the problem (blocks the
reproducer). How do we proceed with getting the issue fixed? Do we
send a patch according to the steps detailed here:
https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html?

-- 
Thanks and Regards,

Dipanjan
