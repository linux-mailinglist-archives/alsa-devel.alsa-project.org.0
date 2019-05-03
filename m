Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A023113496
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 22:56:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 191411829;
	Fri,  3 May 2019 22:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 191411829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556917001;
	bh=KhRP2F2FdF4MlZtST888J/HqX3+WXc3MOau099zBSB8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nbi7KlRALk8kOJdIFMT8yRg+J2zMI2tDCRFFiw+Gk5bkcNh4jxbg6GlHPE8wiVye7
	 g4UP21lA+2iGL8yFSS8Tnx/GG07GdoPcHHsFgr3mH55uepyesqNRLU3YrWG4IUV9Zd
	 D+sE+4wRxMpItaVLNG7Sh78pmppK+YCFscyKVXuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F3E4F80722;
	Fri,  3 May 2019 22:54:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B03A3F896B7; Fri,  3 May 2019 22:54:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4ECBF80722
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 22:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4ECBF80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="PTHDDHjf"
Received: by mail-oi1-x242.google.com with SMTP id t189so5389080oih.12
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 13:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6OdExlNg20WC8ltnTxLGyXC77kwc7mgrv8iolIuiD3Q=;
 b=PTHDDHjfZGFQeNZQ3QRUp6KCc+BJzugiHsEe+7snnW1zv5jy5qZxRN22wvplquAnjc
 8Te0H/e+9xMqj2tiG2Z5IUC1HK1R6ooNGe7HYXuaudRQJiJzpwT2bZMVmjWgJ4Vg4QQn
 vCu0g27F3rm6QYh08O26eK9NaP0UIj/ckSF3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6OdExlNg20WC8ltnTxLGyXC77kwc7mgrv8iolIuiD3Q=;
 b=eBY+e7SU/YmGjJRfD4UL9ZVOglVg0/dHTT5WHtiiRgZJCPjIZtQiokC/a7RsA7ILZZ
 gntGZwXq6Aj156SIN5sRe4jed7XGjI+BFHp1Jb0s14mgeAPccARsyS/BiJ3sw0iJD2dc
 WYUNgciBy0TwzZjTi9BEbeEncJPr0Ec4N325DLRK6fAvXuBpiC/P5J23ldJEOoDh8ShA
 YzpcjxU16uTVwjqgfDnIlg8EO74zUE2iwB8mUrGc86N1aOA1FC71AAkpOtuGowGnNvr4
 ooGAMP6hDdx8t0u7CFUdz5fheidswM6dgbbNy6GS4ZIgP3FqU0vRtQm8mThRvfWAJuqE
 AOlA==
X-Gm-Message-State: APjAAAXcwF3076FOquiqbVBOvFmiXbEMMsGpfyo+m34D4zHCqTGdEtVL
 CqTMX+lVcf5OwNs6dFB+aBFukrduFM1Z6ZSPxEsbdw==
X-Google-Smtp-Source: APXvYqwySx+04aOQwJ9d/gVbg/GrgoXX4PX9d70phfineXyIjLO+O4jeU8D/Xaqt75+rDvo7rJEsAc9DDT9UhJO34vA=
X-Received: by 2002:aca:de57:: with SMTP id v84mr475585oig.149.1556916888811; 
 Fri, 03 May 2019 13:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190503193213.227189-1-cujomalainey@chromium.org>
In-Reply-To: <20190503193213.227189-1-cujomalainey@chromium.org>
From: Ben Zhang <benzh@chromium.org>
Date: Fri, 3 May 2019 16:54:37 -0400
Message-ID: <CAEQjanPVZe0X+Qsp-J7N=wVG=5i3aHy5ZWxbcLV+onn=Nci8SA@mail.gmail.com>
To: Curtis Malainey <cujomalainey@chromium.org>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: RT5677-SPI: Disable 16Bit SPI
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

On Fri, May 3, 2019 at 3:32 PM Curtis Malainey
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

Reviewed-by: Ben Zhang <benzh@chromium.org>
Looks good to me. Thanks for the fix.

> ---
>  sound/soc/codecs/rt5677-spi.c | 35 ++++++++++++++++-------------------
>  1 file changed, 16 insertions(+), 19 deletions(-)
>
> diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
> index 167a02773a0b..84b6bd8b50e1 100644
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
> @@ -159,13 +159,13 @@ int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
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
>  {
> -       u32 offset, len_with_pad = len;
> +       u32 offset;
>         int status = 0;
>         struct spi_transfer t;
>         struct spi_message m;
> @@ -178,22 +178,19 @@ int rt5677_spi_write(u32 addr, const void *txbuf, size_t len)
>         if (!g_spi)
>                 return -ENODEV;
>
> -       if (addr & 1) {
> +       if (addr & 3) {
>                 dev_err(&g_spi->dev, "Bad write align 0x%x(%zu)\n", addr, len);
>                 return -EACCES;
>         }
>
> -       if (len & 1)
> -               len_with_pad = len + 1;
> -
>         memset(&t, 0, sizeof(t));
>         t.tx_buf = buf;
>         t.speed_hz = RT5677_SPI_FREQ;
>         spi_message_init_with_transfers(&m, &t, 1);
>
> -       for (offset = 0; offset < len_with_pad;) {
> +       for (offset = 0; offset < len;) {
>                 spi_cmd = rt5677_spi_select_cmd(false, (addr + offset) & 7,
> -                               len_with_pad - offset, &t.len);
> +                               len - offset, &t.len);
>
>                 /* Construct SPI message header */
>                 buf[0] = spi_cmd;
> --
> 2.21.0.1020.gf2820cf01a-goog
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
