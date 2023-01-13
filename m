Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0098166AFC8
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 08:52:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78ACF45DF;
	Sun, 15 Jan 2023 08:51:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78ACF45DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673769153;
	bh=Ql/MtFV/o8frGgk9ShYfUxbq3TlDhoE/TZ4GysCBCr4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QES7PWLW4Srww844LONEMvTy6CVzCPE/pLwkFMpxAdaGQbBDgJWJ1q5eN/dcLs/Co
	 Rw17zGGCqzVqpaqQw0uEuWnIXh7S6AKLlpcEYeY6PAbnQwnPlAzp2vS2a3+Rjrz52o
	 sNLqvLMSEI1DP69T65eCXH040LcjzbAjgmJG8MvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2481F805A0;
	Sun, 15 Jan 2023 08:48:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBF8FF8030F; Fri, 13 Jan 2023 11:18:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8710F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 11:18:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8710F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=flhQ/myV
Received: by mail-ed1-x52d.google.com with SMTP id s5so30503425edc.12
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 02:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kzDOK1JJgHEyW0UkKAsgNd5XNzteE1HhYTj65aQgafA=;
 b=flhQ/myVHK6JKteIP002IwYUQ1HLE+TmwKWGqM44yzp/wk8RhnYAAPRjqXegQMU8if
 d6UkFENK/I2Ko4Cb15fraqKWzsmk3OYAbY+jKgaNgczi/cP/YUAJOpFRBXFEhG/amnDM
 MKt96Tk+X16N9/QqPHILjSezJSRLF6NKMxI4CbKjK0YPFaPqzaZIQdlh45W4JTxdQe7Q
 Ujc6FxGNYml+oEhvlLnVApd2aS3tQUewdiS9+lDC7hrYBIVDa5bRcGrhPtD2+i8PajKn
 Mpe6V3OYsmoY/ds0Lt5Fw2llEK7vENozV9/3+oyJqCSmilDe6yDMCoCbTW9q6xCyyYCT
 Jy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kzDOK1JJgHEyW0UkKAsgNd5XNzteE1HhYTj65aQgafA=;
 b=rP+DkUUPSf2ICopYEwrRCL4fK2IXYj9h21h6NGHkYqfxK9B76Ud2CTnHWOGCMa6blQ
 Smbhbbj/pKeMZVs9GakNbpw/0FTLLDfi5vogEc2H8OqSD1HBa7oX2mNGZZGTdleRBPXa
 Xcxcd9ZjCwXzfAf8mNaXUvscz9aMXo7klnm22yv8fSWHm8u0Cu5O373JH37hCfGXXPhY
 3MR327SXqXS5hR1uW8khGFxGMPTU21EXlrBaKojmYrsWLPm8Y0Id2H9n+h44G1LpLEX+
 Jn3EXb/BF2e+Kgj90a3z/PEHaM5aUb+aYnJidj4avMsBRwjDBJUYgWMYko0K7IX9UrRz
 z0bA==
X-Gm-Message-State: AFqh2koiAYALOTMBl+Rt9oJN9Uc6udNmgpjTWdedlymuoXVvhcoprN56
 36kGQbkB3rlfPDnFwUQ6G3V9Bm/gnEwLDVM4GP8=
X-Google-Smtp-Source: AMrXdXvp/ij2CcKdAeoXa+bxrKAsBQX0J149SYtq9TQsQyh6L5bKkEtpxP6cToqRfrtaE1cNii7nZUYGchM8ODW9oZk=
X-Received: by 2002:a05:6402:40d3:b0:48e:c1a0:119f with SMTP id
 z19-20020a05640240d300b0048ec1a0119fmr3971521edb.115.1673605119927; Fri, 13
 Jan 2023 02:18:39 -0800 (PST)
MIME-Version: 1.0
References: <20221228120248.GA508080@bhelgaas>
 <20230112200819.GA1785077@bhelgaas>
In-Reply-To: <20230112200819.GA1785077@bhelgaas>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Fri, 13 Jan 2023 11:18:29 +0100
Message-ID: <CAOkhzLU_F9O0TxUzkb9YdHr357O3muj9V7GLTLsWzHm5mUsr-w@mail.gmail.com>
Subject: Re: [Bug 216859] New: PCI bridge to bus boot hang at enumeration
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 15 Jan 2023 08:48:19 +0100
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
Cc: Takashi Iwai <tiwai@suse.de>, linux-pci@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dear Bjorn

On Thu, Jan 12, 2023 at 9:08 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc sound folks]
>
> On Wed, Dec 28, 2022 at 06:02:48AM -0600, Bjorn Helgaas wrote:
> > On Wed, Dec 28, 2022 at 08:37:52AM +0000, bugzilla-daemon@kernel.org wrote:
> > > https://bugzilla.kernel.org/show_bug.cgi?id=216859
> >
> > >            Summary: PCI bridge to bus boot hang at enumeration
> > >     Kernel Version: 6.1-rc1
> > > ...
> >
> > > With Kernel 6.1-rc1 the enumeration process stopped working for me,
> > > see attachments.
> > >
> > > The enumeration works fine with Kernel 6.0 and below.
> > >
> > > Same problem still exists with v6.1. and v6.2.-rc1
> >
> > Thank you very much for your report, Zeno!
> >
> > v6.0 works, v6.1-rc1 fails.  Would you mind booting v6.1-rc1 with the
> > "ignore_loglevel initcall_debug" kernel parameters and taking a photo
> > when it hangs?
> >
> > How did you conclude that the hang is related to a PCI bridge?  I see
> > recent PCI messages in the photo, but it looks like the last message
> > is from NFS, so I'm wondering if I'm missing some context.  The v6.0
> > dmesg shows several other ntfs, fuse, JFS, etc messages before more
> > PCI-related things.  Anyway, the "initcall_debug" might help us narrow
> > it down a bit.
>
> Thanks very much for the bisection (complete log at [1])!
>
> The bisection claims the first bad commit is:
>
>   833477fce7a1 ("Merge tag 'sound-6.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound")
>
> with parents:
>
>   7e6739b9336e ("Merge tag 'drm-next-2022-10-05' of git://anongit.freedesktop.org/drm/drm")
>   86a4d29e7554 ("Merge tag 'asoc-v6.1' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus")
>
> Both 7e6739b9336e and 86a4d29e7554 tested "good" during the bisection.
>
> There is a minor conflict when merging 86a4d29e7554 into the upstream,
> but I can't imagine that being resolved incorrectly.
>
> Would you mind turning off CONFIG_SOUND in your .config and testing
> 833477fce7a1 again?  I'm a little skeptical that the hang would be
> sound-related, but I guess it's a place to start.
>
> Bjorn
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=216859#c35

Booting without sound into the commit 833477fce7a1 did not help. Same hang.

Best
Zeno
