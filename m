Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2589D2B978A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 17:15:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6818170F;
	Thu, 19 Nov 2020 17:14:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6818170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605802522;
	bh=9Vr+F3Hs3zBgGD/OCw8WoW/zJSqmiqYgNmjo4pGiywQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H75WCddS2nAcxQJNL7O41dszeHMYPXc4qNcacOHkrkLRA1O5OiFhxF6xjAi15qb9X
	 3tOUWVD9QW6d6L1ufc4Mj6mFcKAR7wamzty+cR9JnjKVIYPotHlBl4LNvoi+ljWtvo
	 gNUJzE57kxX58y5At1gJKTa6dSk9PAB0YJt2Dkmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34683F801F5;
	Thu, 19 Nov 2020 17:13:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3CBDF801ED; Thu, 19 Nov 2020 17:13:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88EEBF800EE
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 17:13:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88EEBF800EE
Received: by mail-oi1-f193.google.com with SMTP id v202so3737677oia.9
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 08:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TT/SVBPg0FOd/6gd2zs5bV2PmI2jOatYGsnFBx6lsLQ=;
 b=XuHBhuxSwr4XULQKAWorTn9ccMRTZ6DEQvny1yXquYh1+omKCLW4d8PLy1H8FFZxNn
 XVmIBwyTFrreIUXFe94VGfiMnDad9ZeKlB+bXmzKtPEO1tFxxCiKgbZW7sQYjOeVltfv
 kbkJs/mRP2OrYQ7MxTFemJR14S3dkC69WOP+/IiSrrNHqiP14s6UClgtQJjkgefsrrMK
 fYqvpXF9mb5/0SHIQOCbVwy7zXYIpe4/RBZ9i7HD7X/KaIV8ztVJQdNecvjoKu5b/9SK
 mgmkGo585IuVC/TOnYVJ1E8ItxwDZ9DeTZCqs7RHVbJ+8+QcsuXVFv/bMTFiWosXMcVs
 3VNQ==
X-Gm-Message-State: AOAM532/LwHiP+X+ebsvurqrX3DMBqhMpErzUK4jGu1Mw6O2vmY/yodi
 XX3Wsv10dM14NUAN6cF4itXGtK/5I4iqEOkvgAg=
X-Google-Smtp-Source: ABdhPJwkNWbiKsK4J0PnL0TkNFnaTQ5Utiz9WzRauBrRa7OTfF4+29oCzEUctYji8hZsN5Yc8M1idhRPaCN2r8Mwwe8=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr3119656oia.153.1605802413609; 
 Thu, 19 Nov 2020 08:13:33 -0800 (PST)
MIME-Version: 1.0
References: <20201119125318.4066097-1-geert+renesas@glider.be>
 <CAK8P3a0mHYgOYLBO1MHw1CUVgdnOQk4aRf5XTBj+jR-yEtzcoA@mail.gmail.com>
In-Reply-To: <CAK8P3a0mHYgOYLBO1MHw1CUVgdnOQk4aRf5XTBj+jR-yEtzcoA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2020 17:13:22 +0100
Message-ID: <CAMuHMdXmHOo+6TgYOsAuSC7-iHEyBnLvqX=MCN3qYybUi5M-hw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsi: Stop using __raw_*() I/O accessors
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
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

Hi Arnd,

On Thu, Nov 19, 2020 at 4:54 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Thu, Nov 19, 2020 at 1:53 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > There is no reason to keep on using the __raw_{read,write}l() I/O
> > accessors in Renesas ARM or SuperH driver code.  Switch to using the
> > plain {read,write}l() I/O accessors, to have a chance that this works on
> > big-endian.
> >
> > Suggested-by: Arnd Bergmann <arnd@kernel.org>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I don't think this one is correct, as based on
>
> static void fsi_pio_push16(struct fsi_priv *fsi, u8 *_buf, int samples)
> {
>         int i;
>
>         if (fsi_is_enable_stream(fsi)) {
>                 /*
>                  * stream mode
>                  * see
>                  *      fsi_pio_push_init()
>                  */
>                 u32 *buf = (u32 *)_buf;
>
>                 for (i = 0; i < samples / 2; i++)
>                         fsi_reg_write(fsi, DODT, buf[i]);
>         } else {
>                 /* normal mode */
>                 u16 *buf = (u16 *)_buf;
>
>                 for (i = 0; i < samples; i++)
>                         fsi_reg_write(fsi, DODT, ((u32)*(buf + i) << 8));
>         }
> }
>
> the same helper is used for both accessing endianness-sensitive
> register values (which need the converrsion in writel()) and
> possibly in-memory byte streams that need the __raw_writel()
> behavior of copying the input bytes in sequence rather than sets of
> native-endian 16-bit or 32-bit samples.

Thanks, good catch!

> > ---
> > Assembler output difference on SuperH checked.
>
> I'm also not sure whether changing this breaks big-endian SuperH,
> which defines the accessors differently from Arm and most other
> architectures.

On SH, this driver is only used on SH7724 systems.
Compiling an ecovec24_defconfig kernel with CONFIG_CPU_BIG_ENDIAN=y
shows that the same code (native 32-bit access) is generated for
big-endian as for little-endian, which means that it indeed must be
broken for one of them. But this is not changed by my patch.

> Maybe better just mark the driver as 'depends on SH || !CPU_BIG_ENDIAN'
> as it is clearly broken on big-endian Arm.

"depends on !CPU_BIG_ENDIAN"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
