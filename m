Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AD746CDC4
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 07:30:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 977EB2298;
	Wed,  8 Dec 2021 07:29:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 977EB2298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638945032;
	bh=ivVk3Ftp7QFfhVWPCAPztzeL36CAeXO6FxkC5g6+RPs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lTKV32az0ECrDbRK/kpma4OOb0BE3/5idb+qCUWvcDQSRcRk1Zq+PeK3BIjvz5Nzn
	 mQ6JluCY9m4BqrTiqZRMSSMPbyLLldci/UBX2EgehblhaUmnL8bbXETq9IjAGS7nm+
	 1i/dWJ9ab1YHDtuEUqLKHa2I0i10JCbcMm7VOCV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A17F80217;
	Wed,  8 Dec 2021 07:29:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 751FFF804E5; Wed,  8 Dec 2021 07:29:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5A30F80217
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 07:29:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5A30F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p7Tlb9qJ"
Received: by mail-ed1-x534.google.com with SMTP id y12so4675552eda.12
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 22:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ge8duN4sNFU8LlP54a+ac/TMCJbGoRstlWztgA2oT2k=;
 b=p7Tlb9qJ5H1ZRRcrMS0mlr42Jn6hA8VP2orglLASnbMQBgx1S1WeBr/AMrOSeesXnQ
 FRluYxOh0U5Ov4HWvBNuv3hTTSzYgFlsq7AC/NSoeEDrdP722tiB+4a45G8ysaCsuumR
 N25uK9AtBpGiUL2MR7tvUHfXrY4R+C7lwVL22UrSyvojE1/GcpIkz0ZhSJhVcQc3EXuo
 t1K8/XnGJZowgX+uPrPPkDOfUFvdLzuLndBaVJDj8uHnw9dAq+q/5vmn6PfqnXlaHXkV
 GC9QBRXfkEqG4YTtx0xMcskL1XccmQ2vBPQsdaCDfBrNPvXnr2YcsX+X7j2hq+9RRlQs
 VBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ge8duN4sNFU8LlP54a+ac/TMCJbGoRstlWztgA2oT2k=;
 b=vRi+ImUGjzU1PLK1/KxsQsJTq6IlmZifQbJ2V35EDrmlP+r0vj54Yt/HFmPtNSJBGy
 RjTFp9S/cTJNIdNYUeuow+26i9L0n3rP5LX9/S1VUqSYqA0A2nu178N76SQA9qGaC09+
 3bFWs1bMi72cQ7CdcRYVXXYjjjlNk8pRyy/mbNo7i25oJ7SB+tjlOGZD8v+4y+2ty+5x
 Hg6x+H8KsGrAkmmEPWNQ//t2IT+0lJ3yB2wW1JGH0tfD0finnS/9Lq5QkvvB3H4dFZOG
 o7BPHbkCQQMytK4iAskApmhzfr+EhUPfZwEvtUzK2AEiu7EJrtW+5zr7+O5Err7qTc7+
 HI2w==
X-Gm-Message-State: AOAM531wUrSusJtaKe+g1kZwYCJmv7bBzfG01MIPnry4MRpKoLX5n21U
 k/BHaM1DsguaOvtPWgGN2tC+gJhPgglBGkoJ+ps=
X-Google-Smtp-Source: ABdhPJzGz+VCI7qEgxFax+wzk8JXXv7V0YRLbnxVV2888/gXpKyM/ex1MlxEgxzSYFGBmpSEppU47Zmhh0wuCDsftjc=
X-Received: by 2002:a17:906:489b:: with SMTP id
 v27mr4989169ejq.567.1638944939879; 
 Tue, 07 Dec 2021 22:28:59 -0800 (PST)
MIME-Version: 1.0
References: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
 <1638891339-21806-4-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1638891339-21806-4-git-send-email-quic_srivasam@quicinc.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Dec 2021 08:28:23 +0200
Message-ID: <CAHp75Vd=47Tv9Sf+styPhxS2=O1H2KUDeKQXTULUYU5fDgGwwA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] pinctrl: qcom: Extract chip specific LPASS LPI code
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 Takashi Iwai <tiwai@suse.com>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, rohitkr@codeaurora.org,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Wed, Dec 8, 2021 at 2:39 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:
>
> Extract the chip specific SM8250 data from the LPASS LPI pinctrl driver
> to allow reusing the common code in the addition of subsequent
> platforms.

...

> @@ -661,8 +454,10 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
>
>         return ret;
>  }
> +EXPORT_SYMBOL(lpi_pinctrl_probe);

> +

Stray change.

...

> +#ifndef __PINCTRL_LPASS_LPI_H__
> +#define __PINCTRL_LPASS_LPI_H__

Missed headers.
At least bits.h.

...

> +#define NO_SLEW                                -1

Naming sucks for the header.

LPI_NO_SLEW ?

...

> +struct lpi_pingroup {
> +       const char *name;
> +       const unsigned int *pins;
> +       unsigned int npins;
> +       unsigned int pin;
> +       /* Bit offset in slew register for SoundWire pins only */
> +       int slew_offset;
> +       unsigned int *funcs;
> +       unsigned int nfuncs;
> +};

Are you going to convert this to use struct group_desc?

...

> +       LPI_MUX__,

Strange naming. Besides, if it is the terminator, drop the comma.

-- 
With Best Regards,
Andy Shevchenko
