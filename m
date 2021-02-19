Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA74F31FEDD
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Feb 2021 19:39:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46FF1823;
	Fri, 19 Feb 2021 19:38:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46FF1823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613759989;
	bh=YDT2qCAcUqd81uNnwZCvYPGshNUUiNRO54PC1mKGQec=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WF7DwWjmJUtNyu2lsfkT9xBbwO7ftUNu/ItDaTiYGMpB2/eD5unqK8XgR9ZU6ft69
	 lfRcQteJTGblEjykwsmNDln8nafAeyAgA6rktLXBFvC8E3/Vnn1d32bwayV9YRT2z0
	 o1f9I+dy2ffo3v1OhSGmnWEvUxm8GWgduXLBaPJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1EA5F80258;
	Fri, 19 Feb 2021 19:38:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0857F8020B; Fri, 19 Feb 2021 19:38:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E748EF8013F
 for <alsa-devel@alsa-project.org>; Fri, 19 Feb 2021 19:38:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E748EF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YUpkBNDg"
Received: by mail-lj1-x22f.google.com with SMTP id c17so25348907ljn.0
 for <alsa-devel@alsa-project.org>; Fri, 19 Feb 2021 10:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gn1Kuv5TKWX39WwU/P0WkfEYM+bFshGRiN2DpGL7m5o=;
 b=YUpkBNDgh1enaXtn92taQ72JldTs4oNdEwRWzkXZpzWxHaNYUtPv3sMBb3Qs0c0f2J
 zI7+eUmqHNLGOuk3IkfiSzifDsSlc5ph1h8rNk/8pI4YoOnzvsicuynDtXIA0C12g/qA
 omE8zbvNjentceUgUB0zqbgD3NZ5fdf+AXrKVu/BaTYozwmsHXAqampULMJcU+sAaEWG
 y92LPLiW3dvCPXqaJS7/zOzy8z6s55jkHD3GWZO4cj/8gZHu9mxsAn/gCuPuJ+tEkz1+
 dfOdIOaWIfL4hwg7INtI03d4xHMvJQMCh412uvgCxJKpBmiqa6o8IYKp6kzVqz4yapw/
 cPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gn1Kuv5TKWX39WwU/P0WkfEYM+bFshGRiN2DpGL7m5o=;
 b=Lf+EILpDkFNuOHcacXR8wPP8ibpbzev+swTkbOSp+S1o9yxUAJ3gLyUo0As1c1yeV9
 xa3GPfuNc2b/HW5JKyBVyBji0rfWA08APAOC08dSAmhCmdd5HebW0V0O/CTW8/VthBT4
 /CS7OzHV0I8yGJj8CK+2KcHMAhbOcQAS0k7OuVFvzkxrP6rLuaSo5rvO3uo6cnj3W1Oz
 iZ22smWs0bdyWHss78rw0SzhDYTfhSVpEvmzrjzKuIL3MoPAGouiEv/9gsNORUx7w4jj
 DgUmbClcnJjUJDxScjmrwUELW2+PQwvENqRNRaANOggtrpW2R9AC6xZBdxBAeM60NCwY
 1pbQ==
X-Gm-Message-State: AOAM533RE/w69iOSfOPUpxVu4Eil+eT/9uyT89RDw1FZPFZlC+UapwNR
 DgKk3Dy8Eiqk+AuDXUrfW44WcCwXyXmSb6ZUteo=
X-Google-Smtp-Source: ABdhPJxc7tpZ2H+Nl7fNF07EVZ8sxuZ8ttVEjt80uE4eooMglBVriLfdmpa/io5j2Yzy0KYrOk8kDZrRZDTxALD78k8=
X-Received: by 2002:a05:6512:10c5:: with SMTP id
 k5mr6192845lfg.583.1613759883484; 
 Fri, 19 Feb 2021 10:38:03 -0800 (PST)
MIME-Version: 1.0
References: <20210219183308.GA2117@ubuntu-dev>
In-Reply-To: <20210219183308.GA2117@ubuntu-dev>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 19 Feb 2021 15:37:51 -0300
Message-ID: <CAOMZO5CtE9OrthMpGAcTHrSy_+np_yLUO1M9SVjTrsjz-gWbNA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sgtl5000: set DAP_AVC_CTRL register to correct
 default value on probe
To: Benjamin Rood <benjaminjrood@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 dmacdonald@curbellmedical.com
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

Hi Benjamin,

On Fri, Feb 19, 2021 at 3:33 PM Benjamin Rood <benjaminjrood@gmail.com> wrote:
>
> According to the SGTL5000 datasheet [1], the DAP_AVC_CTRL register has
> the following bit field definitions:
>
> | BITS  | FIELD       | RW | RESET | DEFINITION                        |
> | 15    | RSVD        | RO | 0x0   | Reserved                          |
> | 14    | RSVD        | RW | 0x1   | Reserved                          |
> | 13:12 | MAX_GAIN    | RW | 0x1   | Max Gain of AVC in expander mode  |
> | 11:10 | RSVD        | RO | 0x0   | Reserved                          |
> | 9:8   | LBI_RESP    | RW | 0x1   | Integrator Response               |
> | 7:6   | RSVD        | RO | 0x0   | Reserved                          |
> | 5     | HARD_LMT_EN | RW | 0x0   | Enable hard limiter mode          |
> | 4:1   | RSVD        | RO | 0x0   | Reserved                          |
> | 0     | EN          | RW | 0x0   | Enable/Disable AVC                |
>
> The original default value written to the DAP_AVC_CTRL register during
> sgtl5000_i2c_probe() was 0x0510.  This would incorrectly write values to
> bits 4 and 10, which are defined as RESERVED.  It would also not set
> bits 12 and 14 to their correct RESET values of 0x1, and instead set
> them to 0x0.  While the DAP_AVC module is effectively disabled because
> the EN bit is 0, this default value is still writing invalid values to
> registers that are marked as read-only and RESERVED as well as not
> setting bits 12 and 14 to their correct default values as defined by the
> datasheet.
>
> The correct value that should be written to the DAP_AVC_CTRL register is
> 0x5100, which configures the register bits to the default values defined
> by the datasheet, and prevents any writes to bits defined as
> 'read-only'.  Generally speaking, it is best practice to NOT attempt to
> write values to registers/bits defined as RESERVED, as it generally
> produces unwanted/undefined behavior, or errors.
>
> Also, all credit for this patch should go to my colleague Dan MacDonald
> <dmacdonald@curbellmedical.com> for finding this error in the first
> place.
>
> [1] https://www.nxp.com/docs/en/data-sheet/SGTL5000.pdf
>
> Signed-off-by: Benjamin Rood <benjaminjrood@gmail.com>

Thanks for the fix:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
