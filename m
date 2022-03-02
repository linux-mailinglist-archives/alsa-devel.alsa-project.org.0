Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B9C4CB76C
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 08:06:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85C211939;
	Thu,  3 Mar 2022 08:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85C211939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646291194;
	bh=+zgxtLk+dfPgBQrgB52waUtMNEkXQ03m+IyU5C9fZ4c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DYaFr6BtDDDeys0dO1AdrPi1nxydKKlMjRktrxCqqktSQHJJM0PIHS8lkElp++tyq
	 jJHlk7zcutUdt7cCdsFo/etpPRo+5A8VRu6oslYyt7CeQFOHT0zMeZw5Zn+vUQdEbA
	 ImLtN0Vn0JXTiktSLGZPyHWMy9KF8p6guQrfCl/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEA7FF80533;
	Thu,  3 Mar 2022 08:03:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D13EBF801D5; Wed,  2 Mar 2022 21:25:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CFBFF80054
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 21:25:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CFBFF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linux-foundation.org
 header.i=@linux-foundation.org header.b="Be+smD91"
Received: by mail-ej1-x631.google.com with SMTP id pj17so1816358ejb.2
 for <alsa-devel@alsa-project.org>; Wed, 02 Mar 2022 12:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uy+qIY61mUv01aVZ77KYqcI4VQ6CnEr5ehBFaIlKwdg=;
 b=Be+smD91jIehBxsphVP8GxPmG9fZ7UzsziFVI8sCcayH4ghcjVwFadN69qX3SSZZfA
 w/nKcppYscRVDTynDM99u+3Int1mDvzuW1vHPoDdJ+8JxYLDdH7+xaY9DZL7COnmW4q3
 yEVm7FisHcBkdW7xwzBny/SyDipBoZU1ONqUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uy+qIY61mUv01aVZ77KYqcI4VQ6CnEr5ehBFaIlKwdg=;
 b=3oSrU62qTDpHxRbIF47aDhLyNrV5kVS/cY3rDjcHyifoy9lLW2oylVtveFBCoHn/Wv
 nGczX2i9F/y5OScV7wFe6czyHHhpKwcGdSF8zMQn4nmrQWpU2Qu4DAzROVQvZO+KMJ1p
 OX//PzA6RaVcCvwEb75IfoyHPcoaaDqGVopdO9knLjMdNpxgiTg6zBKh+ffrXcoCXBHK
 NVY7HEmauOOUxVPpIzXck7KcrwgOlDs4ik+dBg/n0e36of/KrSSlHXPZRyowXWxu6Vf3
 s6CxyuQW48jfrQFS4xgWx/1Vyfnpgrv+vqCzC5RWQy5B9A1Fv7yc8AnebLGer8vPbK2v
 yaVA==
X-Gm-Message-State: AOAM532t6dYwTudBoBdVvCrNwp8wP4vj9fz+YQDynMMGp3e0JYpFWOVm
 0OlgrDYF8TpbOpelPMt/wuApXfuvjjxNw1D437I=
X-Google-Smtp-Source: ABdhPJxgSKrNBx0LlcHTPu/LA87LvSEKVVBf1ZAjg5Z/0/lIqMrbVvM8S7ZDVUDOUITuy4CDqyT/gQ==
X-Received: by 2002:a17:906:c282:b0:6ce:369d:3d5 with SMTP id
 r2-20020a170906c28200b006ce369d03d5mr24291017ejz.425.1646252731386; 
 Wed, 02 Mar 2022 12:25:31 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 z22-20020a05640240d600b00415d8c59bf5sm10954edb.25.2022.03.02.12.25.31
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 12:25:31 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id r13so6221751ejd.5
 for <alsa-devel@alsa-project.org>; Wed, 02 Mar 2022 12:25:31 -0800 (PST)
X-Received: by 2002:a2e:3013:0:b0:246:2ca9:365e with SMTP id
 w19-20020a2e3013000000b002462ca9365emr21092331ljw.291.1646252342192; Wed, 02
 Mar 2022 12:19:02 -0800 (PST)
MIME-Version: 1.0
References: <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
 <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
 <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
 <7dc860874d434d2288f36730d8ea3312@AcuMS.aculab.com>
 <CAHk-=whKqg89zu4T95+ctY-hocR6kDArpo2qO14-kV40Ga7ufw@mail.gmail.com>
 <0ced2b155b984882b39e895f0211037c@AcuMS.aculab.com>
 <CAHk-=wix0HLCBs5sxAeW3uckg0YncXbTjMsE-Tv8WzmkOgLAXQ@mail.gmail.com>
 <78ccb184-405e-da93-1e02-078f90d2b9bc@rasmusvillemoes.dk>
 <202203021158.DB5204A0@keescook>
In-Reply-To: <202203021158.DB5204A0@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Mar 2022 12:18:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wikKPC0LUqZ8++EC5JOvGdBqVH9uUaTX=DvBioDoReYww@mail.gmail.com>
Message-ID: <CAHk-=wikKPC0LUqZ8++EC5JOvGdBqVH9uUaTX=DvBioDoReYww@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 03 Mar 2022 08:03:25 +0100
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>,
 "v9fs-developer@lists.sourceforge.net" <v9fs-developer@lists.sourceforge.net>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 David Laight <David.Laight@aculab.com>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
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

On Wed, Mar 2, 2022 at 12:07 PM Kees Cook <keescook@chromium.org> wrote:
>
> I've long wanted to change kfree() to explicitly set pointers to NULL on
> free. https://github.com/KSPP/linux/issues/87

We've had this discussion with the gcc people in the past, and gcc
actually has some support for it, but it's sadly tied to the actual
function name (ie gcc has some special-casing for "free()")

See

    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94527

for some of that discussion.

Oh, and I see some patch actually got merged since I looked there last
so that you can mark "deallocator" functions, but I think it's only
for the context matching, not for actually killing accesses to the
pointer afterwards.

               Linus
