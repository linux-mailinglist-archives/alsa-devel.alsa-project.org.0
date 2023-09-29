Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ACE7B3790
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 18:11:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77A0CDF3;
	Fri, 29 Sep 2023 18:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77A0CDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696003896;
	bh=7slaRwdgYQYfL8rpTN9/U42szrwZgmJ70Q/UCQpa7WQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UbEvJ68tEXYDw8ZWihmnZ9oNB/gYZQd9+8WqpwddTklq1PDpwhYFArZomTg8YgVCp
	 kTt9zGtRqqQPlqu8cTWPObRnIBtN/oq7Q/yjT2hSczP4rRSYFXHEJU6SXAybFuEiYn
	 hBwFdD4SHQV+iw6Tq7JuriAtEu8QJ7jdEG3UC/M8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 332F7F8016A; Fri, 29 Sep 2023 18:10:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C42F5F8016A;
	Fri, 29 Sep 2023 18:10:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3570F801D5; Fri, 29 Sep 2023 18:10:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5B99F800AE
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 18:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5B99F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=v6XB3Df3
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3231dff4343so559955f8f.0
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Sep 2023 09:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696003826; x=1696608626;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsosfGEshqIoKCDorpEdcceOnoGA7Z3Gi/jf7+l6H3o=;
        b=v6XB3Df3+OM0x85Kx2x1cLczxXAvVTqw9X3K3M5OvF0DrV0x1rvXVVyW6MWX5t2nnr
         +XcL0X+MLpgk7Gwule03zlhqDzXqrA1KqXNjIsL4gEJhWnYSbIOgPCyg9Gn3jCDf4+sr
         i2Bonlbjspp1ZI/Imy0hYZVnDJ0JDyjvP3pvU4M/sAOFDAa6NM0CY6Hc5REhX7gBo4o5
         /n0SdFw4zcGGAHAfsiGFuNnf24lsxRE2xZikqE67Ctm8CRZQ7wJ7rP6w4zL7/dppsCii
         T4KQXDHTMWvW6YQkiXG8vTPhJzJYyRaaX47YxsirrfJc1gGriXDYz7f8J8pEQl5KyrX8
         yokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696003826; x=1696608626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsosfGEshqIoKCDorpEdcceOnoGA7Z3Gi/jf7+l6H3o=;
        b=niY3SVN5nHWG/l07edjMNBUzapWUHDURA9c4zap1+mBDFyQyo2iSd76F/F5EYs66Iv
         yTaqRIlOX4EKR6D8cM6hvYrva2soUtVgz1lXm9CjjWyo2xkignxcBHz04+kovtUir8aM
         HYglpQt+6W/RgIldkY+xFQo1ooKM72zyJ8k+YDE4HBCT88D9GvjyQV2CwVpXWsmhIQIR
         IJTnYWIKKxYxMz80lyHcJf/6zwW/ww0Cqh7eTj0KU6mXxwqXecXdAXPNpywvo37uTSCW
         iKfSYFmd6v08aWtqbNjXUn7e7fgQQaLgApc141T+mFmAk4LaRAyuwGhSbsIvZG5Xflxc
         t0lg==
X-Gm-Message-State: AOJu0YyFSduW0f+qfUNH+su1ejB7BMz/mBtoypzHlkfGZiuiCIt9Lj/l
	mNKrErF5kcmj7+DJ68AHz1KkPhLS+6CXQ6HkewBEgw==
X-Google-Smtp-Source: 
 AGHT+IGJVy4cn6wsfYJyybJLTpVzhBoLAsGq/mtGnVfwMtDc27EoHCRTJrLpDNvmF4nasPQGeqo5XBwkuq750bEZ3zY=
X-Received: by 2002:a05:6000:1090:b0:31f:f8a7:a26c with SMTP id
 y16-20020a056000109000b0031ff8a7a26cmr4058353wrw.25.1696003825641; Fri, 29
 Sep 2023 09:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230920153819.2069869-1-andriy.shevchenko@linux.intel.com>
 <CAKwvOd=7vk2HKOpgVrRd2RtKSF9tXPqbVmN+5teLTNoBy4BWVg@mail.gmail.com>
In-Reply-To: 
 <CAKwvOd=7vk2HKOpgVrRd2RtKSF9tXPqbVmN+5teLTNoBy4BWVg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 29 Sep 2023 09:10:11 -0700
Message-ID: 
 <CAKwvOdkbcUh+tmsNcT4nCzFY37WbAUdjHJ62qNe=p8SetaQNTQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] device property: Replace custom implementation of
 COUNT_ARGS()
To: "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>, llvm@lists.linux.dev,
	alsa-devel@alsa-project.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: K4QU4WO3P4HXUKFBPMQCJOSR6XTQMK2Z
X-Message-ID-Hash: K4QU4WO3P4HXUKFBPMQCJOSR6XTQMK2Z
X-MailFrom: ndesaulniers@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K4QU4WO3P4HXUKFBPMQCJOSR6XTQMK2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 20, 2023 at 9:50=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Sep 20, 2023 at 8:38=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Replace custom and non-portable implementation of COUNT_ARGS().
> >
> > Fixes: e64b674bc9d7 ("software node: implement reference properties")
> > Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> > Closes: https://lore.kernel.org/r/ZQoILN6QCjzosCOs@google.com
>
> Thanks for the patch!
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1935
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Of course Linux would have a macro for this!  I should have known.
> Trying to wrap my head around it. Awesome

(resending as text/plain)

Can someone pick this up for linux-next?

CI for linux-next has been red for days over this.

>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  include/linux/property.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/property.h b/include/linux/property.h
> > index 1684fca930f7..55c2692ffa8c 100644
> > --- a/include/linux/property.h
> > +++ b/include/linux/property.h
> > @@ -10,6 +10,7 @@
> >  #ifndef _LINUX_PROPERTY_H_
> >  #define _LINUX_PROPERTY_H_
> >
> > +#include <linux/args.h>
> >  #include <linux/bits.h>
> >  #include <linux/fwnode.h>
> >  #include <linux/stddef.h>
> > @@ -314,7 +315,7 @@ struct software_node_ref_args {
> >  #define SOFTWARE_NODE_REFERENCE(_ref_, ...)                    \
> >  (const struct software_node_ref_args) {                               =
 \
> >         .node =3D _ref_,                                          \
> > -       .nargs =3D ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1, \
> > +       .nargs =3D COUNT_ARGS(__VA_ARGS__),                       \
> >         .args =3D { __VA_ARGS__ },                                \
> >  }
> >
> > --
> > 2.40.0.1.gaa8946217a0b
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
