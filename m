Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AE912519
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 01:27:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A371D1847;
	Fri,  3 May 2019 01:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A371D1847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556839669;
	bh=S/WAQPhShUyqxKBGRBUiavlmpPKu9Z0HT/EEmJRkEZA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qRzuknsrbhJ89WXRfwUWyK3h7iLMlFk4GRBAoAiACi4eMyzL5p3Tk+srt3qxNJTdw
	 MyakgUbGvOORfSsOChAhyXZBWHPFjQSHXC2nDiy3ljNNlA7290GbziWrXC8H7zjdFX
	 PbJSjwuYYVz4FBBayRe2XP4TjuGNNxC5W1Z0zMzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE4F5F896EA;
	Fri,  3 May 2019 01:26:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01DA3F896C7; Fri,  3 May 2019 01:26:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B793DF8075A
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 01:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B793DF8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="D5Vag4C7"
Received: by mail-ot1-x343.google.com with SMTP id s11so3767302otp.0
 for <alsa-devel@alsa-project.org>; Thu, 02 May 2019 16:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AV72kMoyuF+QibKJ6vo9oS5inRdSgzWI06nSeOXAe10=;
 b=D5Vag4C7pjPDfjlre+GG1RXxUpy/RrsnYhUzikwGreU/qD4iR48FvgomPr+pGei536
 pLexsObugWTJkK1o6YutRH1fQAp2fzl3n/G21PwpvtDykf4h5ThkRn6UWP0GJGkqHCZ+
 +AD01oHBiehnqhkLvGyii8CRhTfd1/wZ1OweI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AV72kMoyuF+QibKJ6vo9oS5inRdSgzWI06nSeOXAe10=;
 b=CMwvB8ZjFIMMz1scJ42f/2w2XOTTzN43ocm2oQlmui2XEJLQqRW8hUp2gRTba0vlu7
 fi7KN3k0dMHeMH881zc9EktfS57dVKDZlphWAh+ImeJKUItW3JxpvCSaeYq2mY4hHGFx
 z1vk65E0vSuuffozxPQM3huMobo90FZrnpKDvgkzlxPQEIjqGr+t7C7zgp0Q/YOU+i7p
 UEOWwyljXKWeiRPGHc0zCnoA2dqfApr6X9/EVlrtqaGsDSrDf5qjrwu7nOfWDir6uwen
 W9nNmb5jQCR6QAwP1RFU2xxmZ0Z/fQ3dBc9DCzL3niwyVHFq2NWCIlH05aNY1MBmLLqp
 Sw0w==
X-Gm-Message-State: APjAAAW6CeseIjR5Go0/KkrmhxvHaUhiH6xXAsBJmmAL7Iks9VjV+HLW
 N4N23yVxpnMU2K12+xcDR4hCTglBeifzE3yTRorSnw==
X-Google-Smtp-Source: APXvYqweG+LOF1GTGhv2e2JMKMExxm3saku/F9rzsApZTCOXWWIsznMiDEo0tL9ZFowdx4wQNEQ5ihF21s4SgUd6HRY=
X-Received: by 2002:a05:6830:54:: with SMTP id d20mr4718886otp.4.1556839555534; 
 Thu, 02 May 2019 16:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190502222016.241729-1-cujomalainey@chromium.org>
In-Reply-To: <20190502222016.241729-1-cujomalainey@chromium.org>
From: Ben Zhang <benzh@chromium.org>
Date: Thu, 2 May 2019 19:25:44 -0400
Message-ID: <CAEQjanM3geN7us7ZqmGqX_68csCtQK9qwOwrnZ_fCXRgy4QymQ@mail.gmail.com>
To: Curtis Malainey <cujomalainey@chromium.org>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: RT5677-SPI: Disable 16Bit SPI
	Transfers
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

On Thu, May 2, 2019 at 6:20 PM Curtis Malainey
<cujomalainey@chromium.org> wrote:
>
> The current algorithm allows 3 types of transfers, 16bit, 32bit and
> burst. According to Realtek, 16bit transfers have a special restriction
> in that it is restricted to the memory region of
> 0x18020000 ~ 0x18021000. This region is the memory location of the I2C
> registers. The current algorithm does not uphold this restriction and
> therefore fails to complete writes.
>
> Since this has been broken for some time it likely no one is using it.
> Better to simply disable the 16 bit writes. This will allow users to
> properly load firmware over SPI without data corruption.
>
> CC: Ben Zhang <benzh@chromium.org>
> CC: Oder Chiou <oder_chiou@realtek.com>
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>  sound/soc/codecs/rt5677-spi.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
> index 167a02773a0b..b296e62fdbb4 100644
> --- a/sound/soc/codecs/rt5677-spi.c
> +++ b/sound/soc/codecs/rt5677-spi.c
> @@ -58,13 +58,15 @@ static DEFINE_MUTEX(spi_mutex);
>   * RT5677_SPI_READ/WRITE_32:   Transfer 4 bytes
>   * RT5677_SPI_READ/WRITE_BURST:        Transfer any multiples of 8 bytes
>   *
> - * For example, reading 260 bytes at 0x60030002 uses the following commands:
> - * 0x60030002 RT5677_SPI_READ_16       2 bytes
> + * Note:
> + * 16 Bit writes and reads are restricted to the address range
> + * 0x18020000 ~ 0x18021000
> + *
> + * For example, reading 256 bytes at 0x60030004 uses the following commands:
>   * 0x60030004 RT5677_SPI_READ_32       4 bytes
>   * 0x60030008 RT5677_SPI_READ_BURST    240 bytes
>   * 0x600300F8 RT5677_SPI_READ_BURST    8 bytes
>   * 0x60030100 RT5677_SPI_READ_32       4 bytes
> - * 0x60030104 RT5677_SPI_READ_16       2 bytes
>   *
>   * Input:
>   * @read: true for read commands; false for write commands
> @@ -79,15 +81,13 @@ static u8 rt5677_spi_select_cmd(bool read, u32 align, u32 remain, u32 *len)
>  {
>         u8 cmd;
>
> -       if (align == 2 || align == 6 || remain == 2) {
> -               cmd = RT5677_SPI_READ_16;
> -               *len = 2;
> -       } else if (align == 4 || remain <= 6) {
> +       if (align == 4 || remain <= 4) {
>                 cmd = RT5677_SPI_READ_32;
>                 *len = 4;
>         } else {
>                 cmd = RT5677_SPI_READ_BURST;
> -               *len = min_t(u32, remain & ~7, RT5677_SPI_BURST_LEN);
> +               *len = (((remain - 1) >> 3) + 1) << 3;
> +               *len = min_t(u32, *len, RT5677_SPI_BURST_LEN);

Since it already handles the case where remain&7 != 0 here, I think we
can remove len_with_pad in rt5677_spi_write and replace it with len in
the for loop to make it simpler.

>         }
>         return read ? cmd : cmd + 1;
>  }
> @@ -108,7 +108,7 @@ static void rt5677_spi_reverse(u8 *dst, u32 dstlen, const u8 *src, u32 srclen)
>         }
>  }
>
> -/* Read DSP address space using SPI. addr and len have to be 2-byte aligned. */
> +/* Read DSP address space using SPI. addr and len have to be 4-byte aligned. */
>  int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
>  {
>         u32 offset;
> @@ -124,7 +124,7 @@ int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
>         if (!g_spi)
>                 return -ENODEV;
>
> -       if ((addr & 1) || (len & 1)) {
> +       if ((addr & 3) || (len & 3)) {
>                 dev_err(&g_spi->dev, "Bad read align 0x%x(%zu)\n", addr, len);
>                 return -EACCES;
>         }
> @@ -159,8 +159,8 @@ int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
>  }
>  EXPORT_SYMBOL_GPL(rt5677_spi_read);
>
> -/* Write DSP address space using SPI. addr has to be 2-byte aligned.
> - * If len is not 2-byte aligned, an extra byte of zero is written at the end
> +/* Write DSP address space using SPI. addr has to be 4-byte aligned.
> + * If len is not 4-byte aligned, then extra zeros are written at the end
>   * as padding.
>   */
>  int rt5677_spi_write(u32 addr, const void *txbuf, size_t len)
> @@ -178,7 +178,7 @@ int rt5677_spi_write(u32 addr, const void *txbuf, size_t len)
>         if (!g_spi)
>                 return -ENODEV;
>
> -       if (addr & 1) {
> +       if (addr & 3) {
>                 dev_err(&g_spi->dev, "Bad write align 0x%x(%zu)\n", addr, len);
>                 return -EACCES;
>         }
> --
> 2.21.0.593.g511ec345e18-goog
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
