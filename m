Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF1F131FD2
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 07:31:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD168180D;
	Tue,  7 Jan 2020 07:30:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD168180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578378679;
	bh=sH3xYr0ytmZQy6KZLqvjFbDRE/4bua71OLHalQEYaMA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PxBBJkR4eCDlHxrfSBWdRvAmlU6L6rNawBsbtULOhItJ5XSjONnoSU44th2NOECUi
	 jmFUZL0ngrsUokTzRSVVfeCeQQbSfjvcdAmCsnRe673zxapWQoC++UapO9L20eqELs
	 axJwsrO+K+AcFkIBTQ7pvcnsRQrKGbXb0izWGp+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21783F80172;
	Tue,  7 Jan 2020 07:29:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08AEAF8014A; Tue,  7 Jan 2020 07:29:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=disabled version=3.4.0
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EE4FF8010B
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 07:29:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EE4FF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com
 header.b="PUtkQKRh"
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 0076TA86007052
 for <alsa-devel@alsa-project.org>; Tue, 7 Jan 2020 15:29:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0076TA86007052
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1578378551;
 bh=V4OXT4Fpyi9+NOlQeIWNoTFry/VXFE9skkoLr0JmobU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PUtkQKRh/fLDhr7OyI2jsy3dRzrVKjGRsJD26kFb8Yi5DYb3ZzVIj9aI89P3bCxO2
 kcx+0mSsXbAq4C2G/aOvNTObJyA3sA7ZRSemwGljOlIhcw4yni6N1g0mkghKwLkTff
 PCvpPysq86Ay4TJqu/B05j3eWpmSKVpUV3flWj7fJbDYzYBRe9GDCcNj/9ZPgS6WVy
 mBpxYB8cwCaNXyhhFYC562rrdIJWQJ4ftIQllFGlOQDej1RK7yQoEXLAEkU4cuevXA
 FSB3dvO2xXez30a7IBaDz3GjYj6T2nLHidaWCSDoGt0mX8w317v0yQ6iasfpegGulk
 qbQdyYxrLIKew==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id f7so18069772uaa.8
 for <alsa-devel@alsa-project.org>; Mon, 06 Jan 2020 22:29:10 -0800 (PST)
X-Gm-Message-State: APjAAAU+mMY5vXL1TFCq3Bm7e1bjY9bmSGLgX2M6alYBimRetXH8l/xM
 q8yyNpzR5fCVlGNfaQ72TfIwEL9PpB2L2h5XQzw=
X-Google-Smtp-Source: APXvYqypZNoHbzfj+w5gFDA3N15SQKWwFjdrHnOhN5aGCU+FKq8xDDltKeTcAoYEWk93oUB5yZ92m3AGy2jJt8IgSdk=
X-Received: by 2002:ab0:2ea6:: with SMTP id y6mr41352359uay.25.1578378549666; 
 Mon, 06 Jan 2020 22:29:09 -0800 (PST)
MIME-Version: 1.0
References: <20200106045833.1725-1-masahiroy@kernel.org>
 <20200107051521.GF705@sol.localdomain>
In-Reply-To: <20200107051521.GF705@sol.localdomain>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 7 Jan 2020 15:28:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNATbLESJ6CdPSN8bdpt7+4iOKW2L3c4OZaz2sLzqJH6BTw@mail.gmail.com>
Message-ID: <CAK7LNATbLESJ6CdPSN8bdpt7+4iOKW2L3c4OZaz2sLzqJH6BTw@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@lip6.fr>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-crypto@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-i2c@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] treewide: remove redundent IS_ERR() before
	error code check
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

On Tue, Jan 7, 2020 at 2:15 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Mon, Jan 06, 2020 at 01:58:33PM +0900, Masahiro Yamada wrote:
> > 'PTR_ERR(p) == -E*' is a stronger condition than IS_ERR(p).
> > Hence, IS_ERR(p) is unneeded.
> >
> > The semantic patch that generates this commit is as follows:
> >
> > // <smpl>
> > @@
> > expression ptr;
> > constant error_code;
> > @@
> > -IS_ERR(ptr) && (PTR_ERR(ptr) == - error_code)
> > +PTR_ERR(ptr) == - error_code
> > // </smpl>
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Any reason for not doing instead:
>
>         ptr == ERR_PTR(-error_code)
>
> ?

Because there is no reason to change

        PTR_ERR(ptr) == -error_code
to
        ptr == ERR_PTR(-error_code)



     if (PTR_ERR(ptr) == -error_code)
style seems to be used more often.

But, I think it is just a matter of preference after all.
Both work equally fine.



>  To me it seems weird to use PTR_ERR() on non-error pointers.  I even had to
> double check that it returns a 'long' and not an 'int'.  (If it returned an
> 'int', it wouldn't work...)
>
> - Eric



-- 
Best Regards
Masahiro Yamada
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
