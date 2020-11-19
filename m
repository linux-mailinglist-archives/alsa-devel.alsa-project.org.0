Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6DF2B9707
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 16:56:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 078F3170D;
	Thu, 19 Nov 2020 16:55:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 078F3170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605801372;
	bh=YgkNg+z1JE6nlRXgCoLdLXu3nDfsP6AEFIvihbBNFyI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZAbENff04s5dZN3I/NXPLC9cmsWwmkSXQoRKa3Mq1Ww4gIIhz7U0AUjuoREGXBxpR
	 kgz8Xnl67q9y0X1+nwWNsFb/fTeNWAS23ivgUw8gzEsYgmV4t7yIl9Um+lWbg0OiHk
	 jt5T1ugJAOo0qUt82+ItQAwHmdH13m1sOteafHKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D111BF801F5;
	Thu, 19 Nov 2020 16:54:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 556F7F801ED; Thu, 19 Nov 2020 16:54:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C2B5F800C5
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 16:54:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C2B5F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wA+fABuw"
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C240246AA
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605801259;
 bh=YgkNg+z1JE6nlRXgCoLdLXu3nDfsP6AEFIvihbBNFyI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wA+fABuwb4NeDqxjgsrJeJDXJZAYyUCXo8XshiYR1YliHrNIhz/7+qFXqbOgSBaRB
 Iu9UGlX1KPQCwP1laDV6wSJc8QBTX3VXDecHEgQ4zb/9GDVHoyBuys+8mv6dYOYRtY
 ZKq1dcr9DPR030HiKO/LBPf6SeT+t3hheh5QPbAw=
Received: by mail-oi1-f173.google.com with SMTP id s18so5672764oih.1
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 07:54:19 -0800 (PST)
X-Gm-Message-State: AOAM530/tCNkw1eope5OxFaPCHtwnjtTqIwK+Xu3BU3BOAUm02ZoparJ
 w1hBsSm4xTbi0XxXaAYmZH1ubKPb+WK7XVx4Mfo=
X-Google-Smtp-Source: ABdhPJxIjEaON8Ls1CLtuq2iV2e/QQeUBeT3oybYW5Kw1rjKdDdNieLwlJMOW2r4i3LLfp8PTJmwoIFbSaPhS8voEp8=
X-Received: by 2002:aca:180a:: with SMTP id h10mr3147154oih.4.1605801258329;
 Thu, 19 Nov 2020 07:54:18 -0800 (PST)
MIME-Version: 1.0
References: <20201119125318.4066097-1-geert+renesas@glider.be>
In-Reply-To: <20201119125318.4066097-1-geert+renesas@glider.be>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 19 Nov 2020 16:54:02 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0mHYgOYLBO1MHw1CUVgdnOQk4aRf5XTBj+jR-yEtzcoA@mail.gmail.com>
Message-ID: <CAK8P3a0mHYgOYLBO1MHw1CUVgdnOQk4aRf5XTBj+jR-yEtzcoA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsi: Stop using __raw_*() I/O accessors
To: Geert Uytterhoeven <geert+renesas@glider.be>
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

On Thu, Nov 19, 2020 at 1:53 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> There is no reason to keep on using the __raw_{read,write}l() I/O
> accessors in Renesas ARM or SuperH driver code.  Switch to using the
> plain {read,write}l() I/O accessors, to have a chance that this works on
> big-endian.
>
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I don't think this one is correct, as based on

static void fsi_pio_push16(struct fsi_priv *fsi, u8 *_buf, int samples)
{
        int i;

        if (fsi_is_enable_stream(fsi)) {
                /*
                 * stream mode
                 * see
                 *      fsi_pio_push_init()
                 */
                u32 *buf = (u32 *)_buf;

                for (i = 0; i < samples / 2; i++)
                        fsi_reg_write(fsi, DODT, buf[i]);
        } else {
                /* normal mode */
                u16 *buf = (u16 *)_buf;

                for (i = 0; i < samples; i++)
                        fsi_reg_write(fsi, DODT, ((u32)*(buf + i) << 8));
        }
}

the same helper is used for both accessing endianness-sensitive
register values (which need the converrsion in writel()) and
possibly in-memory byte streams that need the __raw_writel()
behavior of copying the input bytes in sequence rather than sets of
native-endian 16-bit or 32-bit samples.

> ---
> Assembler output difference on SuperH checked.

I'm also not sure whether changing this breaks big-endian SuperH,
which defines the accessors differently from Arm and most other
architectures.

Maybe better just mark the driver as 'depends on SH || !CPU_BIG_ENDIAN'
as it is clearly broken on big-endian Arm.

     Arnd
