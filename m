Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B13A1627DC
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 15:15:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED920169F;
	Tue, 18 Feb 2020 15:14:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED920169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582035332;
	bh=0Ix2d08LCpwj+w4WoHDZ0BeMIQRrKb6o9aW6P4f2fZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IEgPcsimzgfIfOttqc1TXKk7yGLkHAx8pvFpzSTY1dyILT0jnb9OLKGU+3rvO0B7A
	 TL56AelKLIcbfKHtigJQp+H04v7JHOWf0n1ERvyy9r5KOld70DU+tsgz5ceK+8fDzR
	 mj/6fPQu3UasRH+0xQsCAw5ub6xlp6nXloiI0QdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 129AEF8014A;
	Tue, 18 Feb 2020 15:13:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2DA5F80148; Tue, 18 Feb 2020 15:13:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05446F80137
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 15:13:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05446F80137
Received: by mail-ot1-f66.google.com with SMTP id i6so19619491otr.7
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 06:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xIGu2Frv1sIXH/32fSc0dEEu4VzyHnNJMuWeixXt4so=;
 b=AuvEMgDf5ftaxy1OhxtmMrVWijwl45hbpAp+0EBF+dgoTNmkitVOdvSjF3DifqitpN
 +CR+0u1bYI6X8ox2DvRSPuc3/ZqZD/3xr6TQH3vXHnqSC7nBJArwfKKZQU7yg4+ZaHgw
 jPrEqCXhvz7rt5hi4t9uT9gDk6W7BzbeeLK4wsHNvFPvIT4XHddwo2+BBqTBbfFf8LKe
 m5HkGIsPoGg59zGbhSb/HGISem9xuwMaNbEj+94v2ZEs1uGAUHrSeEJ6yA6gsw3ASu2+
 5f8rd0Qt6KykS3yuWvtuB2t036bz6C4r7ZaesEq1JznVVbhh2mg+BkGs5xjh2aCqBSAA
 M4ew==
X-Gm-Message-State: APjAAAVzo+sDEi/kmKCGI9YHCtnQdZCn2er/RjEU9KplyE9hDc5WpKHF
 mn3OgAdJ6ERjoSNwC+4FqI9hgaZqPtQCrksA4Eo=
X-Google-Smtp-Source: APXvYqwq7ZrkVxCwDxzidMb1IF/ed6FGbeBmsWTjcOiGwEYVvfJqCie4oq96n58tgmlGgT4cbz53tmg9q7ne+a5eUp0=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr16069703ots.250.1582035224535; 
 Tue, 18 Feb 2020 06:13:44 -0800 (PST)
MIME-Version: 1.0
References: <202002180512.4RU8Rxge%lkp@intel.com>
In-Reply-To: <202002180512.4RU8Rxge%lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Feb 2020 15:13:33 +0100
Message-ID: <CAMuHMdW8SvDgQJyenTtEm4Xn2Ma6PK9pfwKR2_gn60t2AqNWXg@mail.gmail.com>
Subject: "imply" and modular target dependencies (was: Re: [asoc:for-5.7
 21/76] wcd9335.c:undefined reference to `slim_stream_prepare')
To: kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, kbuild-all@lists.01.org,
 Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>
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

On Mon, Feb 17, 2020 at 10:55 PM kbuild test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7
> head:   3cd23f021e2e5f3350125abcb39f12430df87d06
> commit: ea00d95200d02ece71f5814d41b14f2eb16d598b [21/76] ASoC: Use imply for SND_SOC_ALL_CODECS
> config: x86_64-randconfig-s2-20200217 (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
> reproduce:
>         git checkout ea00d95200d02ece71f5814d41b14f2eb16d598b
>         # save the attached .config to linux build tree
>         make ARCH=x86_64
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>

Thanks for your report!

> All errors (new ones prefixed by >>):
>
>    ld: sound/soc/codecs/ab8500-codec.o: in function `ab8500_codec_read_reg':
>    ab8500-codec.c:(.text+0x479): undefined reference to `abx500_get_register_interruptible'
>    ld: sound/soc/codecs/ab8500-codec.o: in function `ab8500_codec_probe':
>    ab8500-codec.c:(.text+0xdf1): undefined reference to `abx500_get_register_interruptible'
>    ld: ab8500-codec.c:(.text+0xe18): undefined reference to `abx500_set_register_interruptible'
>    ld: sound/soc/codecs/ab8500-codec.o: in function `ab8500_codec_write_reg':
>    ab8500-codec.c:(.text+0x4b1): undefined reference to `abx500_set_register_interruptible'

The above are fixed in next-20200218.

>    ld: sound/soc/codecs/mc13783.o: in function `mc13783_probe':
>    mc13783.c:(.text+0x24c): undefined reference to `mc13xxx_reg_write'
>    ld: mc13783.c:(.text+0x25e): undefined reference to `mc13xxx_reg_write'
>    ld: mc13783.c:(.text+0x270): undefined reference to `mc13xxx_reg_write'
>    ld: mc13783.c:(.text+0x282): undefined reference to `mc13xxx_reg_write'
>    ld: mc13783.c:(.text+0x294): undefined reference to `mc13xxx_reg_write'
>    ld: sound/soc/codecs/mc13783.o:mc13783.c:(.text+0x2a6): more undefined references to `mc13xxx_reg_write' follow
>    ld: sound/soc/codecs/mc13783.o: in function `mc13783_probe':
>    mc13783.c:(.text+0x2c5): undefined reference to `mc13xxx_reg_rmw'
>    ld: mc13783.c:(.text+0x2e4): undefined reference to `mc13xxx_reg_rmw'
>    ld: sound/soc/codecs/mc13783.o: in function `mc13783_remove':
>    mc13783.c:(.text+0x212): undefined reference to `mc13xxx_reg_rmw'

CONFIG_SND_SOC_MC13783=y
CONFIG_MFD_MC13XXX=m

>    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_trigger':
> >> wcd9335.c:(.text+0x323): undefined reference to `slim_stream_prepare'
> >> ld: wcd9335.c:(.text+0x32f): undefined reference to `slim_stream_enable'
> >> ld: wcd9335.c:(.text+0x345): undefined reference to `slim_stream_unprepare'
> >> ld: wcd9335.c:(.text+0x351): undefined reference to `slim_stream_disable'
>    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_slim_status':
> >> wcd9335.c:(.text+0x1970): undefined reference to `of_slim_get_device'
> >> ld: wcd9335.c:(.text+0x1995): undefined reference to `slim_get_logical_addr'
> >> ld: wcd9335.c:(.text+0x19b2): undefined reference to `__regmap_init_slimbus'
>    ld: wcd9335.c:(.text+0x19f3): undefined reference to `__regmap_init_slimbus'
>    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_hw_params':
> >> wcd9335.c:(.text+0x348f): undefined reference to `slim_stream_allocate'
>    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_slim_driver_init':
> >> wcd9335.c:(.init.text+0x3c): undefined reference to `__slim_driver_register'
>    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_slim_driver_exit':
> >> wcd9335.c:(.exit.text+0x8): undefined reference to `slim_driver_unregister'

CONFIG_SND_SOC_WCD9335=y
CONFIG_SLIMBUS=m

>    ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_trigger':
> >> wcd934x.c:(.text+0x30d): undefined reference to `slim_stream_prepare'
> >> ld: wcd934x.c:(.text+0x319): undefined reference to `slim_stream_enable'
> >> ld: wcd934x.c:(.text+0x32f): undefined reference to `slim_stream_unprepare'
> >> ld: wcd934x.c:(.text+0x33b): undefined reference to `slim_stream_disable'
>    ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_hw_params':
> >> wcd934x.c:(.text+0x2620): undefined reference to `slim_stream_allocate'
>    ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_codec_probe':
> >> wcd934x.c:(.text+0x27ee): undefined reference to `of_slim_get_device'
> >> ld: wcd934x.c:(.text+0x2818): undefined reference to `slim_get_logical_addr'
> >> ld: wcd934x.c:(.text+0x2836): undefined reference to `__regmap_init_slimbus'

CONFIG_SND_SOC_WCD934X=y
CONFIG_SLIMBUS=m

All CONFIG_SND_SOC_* symbols above are tristate and have dependencies
on the modular symbols.

However, the "imply" statements in SND_SOC_ALL_CODECS force all of them
builtin, despite their dependencies being modular.

So while "imply" is meant to be a softer form of "select", obeying target
dependencies, it does not seem to obey modular tristate dependencies?

Or am I missing something?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
