Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AA6E72C0
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 14:40:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 789581F42;
	Mon, 28 Oct 2019 14:39:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 789581F42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572270021;
	bh=LuGAznsgB06XfCd31I95pXjJMmPYwmJTOhOcNxxsSdk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G7pCYPylHPcVuSlBqZWDae7GUToKtN8i6bFt2MeieLIKwYzHFFUVf/1XiuulZBLNJ
	 ahCuCI+0jgaRPyZKo7XCebCq2nFsPg+8ClBpJY/6tY8F7cXoahYfIoRsqkLVsd+TWf
	 H/0RFFzflnysQMkp70INz2Xjxv1a6OIL74Zt+Spc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A57D9F802BD;
	Mon, 28 Oct 2019 14:38:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EE8EF80361; Mon, 28 Oct 2019 14:38:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
 USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFC0BF80145
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:38:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFC0BF80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Prqdct9i"
Received: by mail-pf1-x442.google.com with SMTP id d13so5845392pfq.2
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 06:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wGuG1asRy1Pd6i7LZD0Q+1ycYN3PhkFDWywCgQeZeaY=;
 b=Prqdct9iwqd6MXUyCkYp/bYuS5H5kh75fxMDBkRg1GIZvSnA0QDrplJypF3PpZH/O4
 1Bp+n8ikRLiZi3wCtGM5EdYBOUSz43ptgDe6c+Hcy8PHIkk340xqjpnw5vAMXQg0epVe
 sAf4KtMlQiU90VOC0jQg8FpJ3tAS9FfS+/E+g84+mPVoqjuk3idBMh1ij/at+XIY4dN/
 g1LqadNQdpFOsPeWQcLJBphikMDb2w6+nCdjtvvL1t72BlJyYbk7JTKEXssBVe5BmlJj
 C0FCkIgO895PljSkL7ELKH67zSNzBeDxynIcajMChCFXKzawtODk/UlUtEcUk5oF7eZA
 z68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wGuG1asRy1Pd6i7LZD0Q+1ycYN3PhkFDWywCgQeZeaY=;
 b=M+cQqEbJF+/9bP2XmoUllZCGM0QSk+kjnn2wbTohZn44bh2LGFmeG7KS/Czfw1E6aT
 ENlJuzW8OiElvvhAcxOLNa1+nAMxVkRTGMlfDKRaZ3q3h4a0LDfptMpl9M+lFt8JFgbi
 QsqvlPyStp94NKN8Um4pJfWCQ7lQjd9xgBdjyhTmaj2WnkjxKvyh2ZZZT0Fi9Jj7dK3b
 ee/N2yHbxLhiOVIVB2KiowTXivzYpSJ1raWrJ65XuxkmuAgnJutq9ARgxSf6Id46LGK8
 plIakKzZqPIco5B61Vr4fEDIRLoF/c2NtBAUHvcRRMwHahWZrgkTHtI1GB7VK6klVzN6
 WXCQ==
X-Gm-Message-State: APjAAAV+WwhK/oMfDwIpqBozd5vq8eCm3qqWYM/WWaXOwGZBZlgNSv0f
 DZVHwn4KaBAglHFkY5Rwv2yw4LSiaDV34ZKeMDwRUg==
X-Google-Smtp-Source: APXvYqydhmDxjTnxvFA+bkrPFtaf5CWiccBWdY55qCD8pTVEhAH/wNy6ubCJ6Wv9G70Sm8WS+siNyBaJx6EIINzy3lQ=
X-Received: by 2002:a63:541e:: with SMTP id i30mr20918922pgb.130.1572269911356; 
 Mon, 28 Oct 2019 06:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000f838060595f602a7@google.com>
 <s5hr22xau8f.wl-tiwai@suse.de>
In-Reply-To: <s5hr22xau8f.wl-tiwai@suse.de>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 28 Oct 2019 14:38:20 +0100
Message-ID: <CAAeHK+yUrW00w_qDZ9L71WVXyX-Y__cbohZkUhNWDnYoVfV69g@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, wang6495@umn.edu, yuehaibing@huawei.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Alexander Potapenko <glider@google.com>,
 Allison Randal <allison@lohutok.net>,
 syzbot <syzbot+8f2612936028bfd28f28@syzkaller.appspotmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?B?5b2t6L6J?= <benquike@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] KMSAN: uninit-value in get_term_name
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

On Mon, Oct 28, 2019 at 2:13 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 28 Oct 2019 11:32:07 +0100,
> syzbot wrote:
> >
> > Uninit was stored to memory at:
> >  kmsan_save_stack_with_flags mm/kmsan/kmsan.c:151 [inline]
> >  kmsan_internal_chain_origin+0xbd/0x180 mm/kmsan/kmsan.c:319
> >  __msan_chain_origin+0x6b/0xd0 mm/kmsan/kmsan_instr.c:179
> >  parse_term_proc_unit+0x73d/0x7e0 sound/usb/mixer.c:896
> >  __check_input_term+0x13ef/0x2360 sound/usb/mixer.c:989
>
> So this comes from the invalid descriptor for a processing unit, and
> it's very likely the same issue as already spotted -- the validator up
> to 5.3-rc4 had a bug that passed the invalid descriptor falsely.
> This should have been covered by 5.3-rc5, commit ba8bf0967a15 ("ALSA:
> usb-audio: Fix copy&paste error in the validator").

#syz dup: KASAN: slab-out-of-bounds Read in build_audio_procunit
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
