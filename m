Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D76412CE999
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 09:30:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65EE9185A;
	Fri,  4 Dec 2020 09:30:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65EE9185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607070657;
	bh=BFz3wtlydRdBCLt2TC7R8FQN/cjuYB3BQdmcqZcvaC8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VrjsnTiGVzVnFQbQlFwIqXGQTNpwFbYDk7cPElQ7mjnbl47qaok++ktEeM1nXlwH7
	 pCmRTnTAtzVBLpN0I0mf/y7SkxTI1jiyIIfFDbHPksdPWAMz/joTM9MJKl5ZxQtBei
	 1x+uAB2lNgooiPyQ1MEZHjPVJPfP6ahuElJKvwT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3911F800E2;
	Fri,  4 Dec 2020 09:29:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2961F800E2; Fri,  4 Dec 2020 09:28:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 782AEF8012A
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 09:28:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 782AEF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Xgd3xtq4"
X-Gm-Message-State: AOAM531VYf/W4ehpoqJ7ZGjT4SbH6P8NYyBXpc5a4GFAsAG6V4hukcZC
 oW6JLIlj+032SfBceU0UILmZrZ8DGAxOczXJiGg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607070509;
 bh=BFz3wtlydRdBCLt2TC7R8FQN/cjuYB3BQdmcqZcvaC8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Xgd3xtq4nfIyIpExSXzmvFojn4tC5RelcrR1dRWP+4zmwLdOQd8g5VjypBtSQVnTg
 vp2tg0QTHS+sETqSamSL6z5l0y/x14XL7Mnyouzwg7lzAmq+6umPUaKgkQXjoNPX3o
 f8G8ahX4QmM0Y8GbHMDy27ACvwxMK829Hz70b0hoyIXq8e5TUG+h+PcF6ViTQjKT5m
 8IiHRgntuSlrQhBac5BIGKa8t2J64ZGxisAMTdTEsWn8aeHFntJvfThhWOy543/ICx
 lr4AChNoAtVaCWbk7IcjObtEP5asS64kl7koKP1NqUKEjxPqCJUqUVrx76sSwm4wtG
 78IwJbab6n5bw==
X-Google-Smtp-Source: ABdhPJxHBJQFwzULk9x5VQBenjJYD648I/eZ8dzgx9dnZcZOXrI7Q96m0GQGG2BEeb+MJg4Vyh9/QLizXMl6+0QMev0=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr2769894otk.251.1607070508028; 
 Fri, 04 Dec 2020 00:28:28 -0800 (PST)
MIME-Version: 1.0
References: <20201203225458.1477830-1-arnd@kernel.org>
 <CA+Px+wWmJrS46TzWgKWiufJH7ryB+mOH7H4xfGZex2j=NutfLA@mail.gmail.com>
In-Reply-To: <CA+Px+wWmJrS46TzWgKWiufJH7ryB+mOH7H4xfGZex2j=NutfLA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 4 Dec 2020 09:28:11 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3qrPa0Jue-eLrXn+ufBsvY4+UQr7SQ9ZHxuEMtvoYMhA@mail.gmail.com>
Message-ID: <CAK8P3a3qrPa0Jue-eLrXn+ufBsvY4+UQr7SQ9ZHxuEMtvoYMhA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: cros_ec_codec: fix uninitialized memory read
To: Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Guenter Roeck <groeck@chromium.org>,
 Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, Dec 4, 2020 at 3:56 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Fri, Dec 4, 2020 at 6:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > gcc points out a memory area that is copied to a device
> > but not initialized:
> >
> > sound/soc/codecs/cros_ec_codec.c: In function 'i2s_rx_event':
> > arch/x86/include/asm/string_32.h:83:20: error: '*((void *)&p+4)' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> >    83 |   *((int *)to + 1) = *((int *)from + 1);
> >
> > Initialize all the unused fields to zero.
> >
> > Fixes: 727f1c71c780 ("ASoC: cros_ec_codec: refactor I2S RX")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Acked-by: Tzung-Bi Shih <tzungbi@google.com>
>
> In the case in i2s_rx_event(), only the "cmd" member is used.  But it
> is fine to please the compiler.

I wouldn't do it just to please the compiler. I sent this patch since
the code clearly copies the uninitialized data here. If only
one byte is meant to be copied, then we should change the
function call to not pass the entire structure. I'll send a new
patch for that.

> struct __ec_align4 ec_param_ec_codec_i2s_rx {
>         uint8_t cmd; /* enum ec_codec_i2s_rx_subcmd */
>         uint8_t reserved[3];
>
>         union {
>             ...
>         };
> };
>
> I am a bit curious about, in other use cases of
> ec_param_ec_codec_i2s_rx, why the compiler doesn't complain about
> uninitialization of the "reserved" member?

The -Wmaybe-uninitialized warning is fundamentally unreliable.
In this case, the __constant_memcpy() function accesses the
members one at a time, and the warning is for the first 'int' array
member that is completely uninitialized, while the 'reserved'
part of the structure is still in the first 'int' that is partially initialized.

      Arnd
