Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA55554F89
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:39:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 720622332;
	Wed, 22 Jun 2022 17:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 720622332
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912393;
	bh=zzVDACcw8lc8h1jrfFyQ1kGE5dbgoJSjZhbhcFsXDUw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Va2TzveI8D4rPX7+rqzv/Rl5FZZhMalfdro8F7lo0SeMrTkA5+Ozn+ajMJFAKMG9O
	 7QoYgao/0sKb35QxxKfzteiVYS1xcuf0pKJKehocieyRvrhjh8vhrUxPMfkhW66Gh5
	 wy+FRxGfQLTpupZzSzN//vZgOEq5F4l1ie3G07G8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD6D1F80714;
	Wed, 22 Jun 2022 17:24:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5099F800CB; Tue, 21 Jun 2022 11:34:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28002F800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 11:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28002F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BUGmrcAU"
Received: by mail-ed1-x534.google.com with SMTP id fd6so15783483edb.5
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 02:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c7tGMV7/SSO3JozWEHbkFTrboHXpmm3VDf/oaKBPuDs=;
 b=BUGmrcAUC+BxJxranrDe0YJYzGvQkDLTBZjdzWtcfzrpUMCnxTVONXV0mU3URS5tLL
 aEOSB9xjhNccR9NdTm0PXAB31J+uj3WMdOSSAcTNqu5PPt4bWhBbZj33RozwJCD/yiKw
 aHWzcKV8n5eWavzTVIcGpfPCfSHFkmxIrynAq1xxs+lS4+qvsptHbhl4YwmwptrNB3Nm
 BqUf9oYH5JyI1RkDsf7QjLD7aLBiXMcbClIMDqdNnscmsnklX7J0ionOlcwtPKbTTD6W
 MWo/2NK17ioZE0f4OZTLPJxUbR3T9Flg/zpzKS0On4R8An+t7QKX8I7HCC+lq7kqxQUE
 aL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c7tGMV7/SSO3JozWEHbkFTrboHXpmm3VDf/oaKBPuDs=;
 b=i6Yl4czfV1EM4ekSbIapEQeUaJhDjMsp838+TxCY/7BUYbknSavNZjlJOS/mGCnvW9
 l9vFrpcDhyLLaYM+aM43RSskHOIdNQtd4d981MBe9pKZLxOqmnWERE7m57TYjPEyLn4u
 s7IDusSDY33sp84BG7L0qWpL7+qgM7Urv6usWrUR5ful+9Lanhyi1QEaOsILUo3FFKre
 c8f5QejNz2GJkRonyoJgF6hdY8YiHBbJQaiNGchdgSvEoaDOmlIy+CLFomrDrqULoOTF
 V8y4rXh784VjR/2TiIE4oIHxAo+ubnQ2lQKy1wNE1AuxUN3OrgCsNnLG5S+oW9DvVhCE
 RAew==
X-Gm-Message-State: AJIora/0WIUQ4vDOQE5Gwx2b/HHQojTAUeR+jPsmxBwMgp1DrsZpQI7Y
 BX8aq+P28KOUiL4coSkdJNjzdQiCs1UWOPqVHC4=
X-Google-Smtp-Source: AGRyM1vl6qAENnpkydkK4orwRZWx0Z6A0R1L281fxwrvs+ww8MsmgIRorfjJHWF6QSaoxaSyeHSEr2OQ0e5QEiIHYqg=
X-Received: by 2002:a05:6402:4390:b0:42e:b7e:e9ac with SMTP id
 o16-20020a056402439000b0042e0b7ee9acmr34705675edc.97.1655804052209; Tue, 21
 Jun 2022 02:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-18-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-18-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:33:35 +0200
Message-ID: <CAHp75VcN0hf5_AVB-aRBhyvwuojuDC=FbBUqWpUWQR=r=zSRPA@mail.gmail.com>
Subject: Re: [PATCH 17/49] regmap-irq: Add broken_mask_unmask flag
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:18 +0200
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Lee Jones <lee.jones@linaro.org>,
 Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, tharvey@gateworks.com,
 linux-actions@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 rjones@gateworks.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Walle <michael@walle.cc>, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
 Matti Vaittinen <mazziesaccount@gmail.com>
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

On Mon, Jun 20, 2022 at 10:08 PM Aidan MacDonald
<aidanmacdonald.0x0@gmail.com> wrote:
>
> This flag is necessary to prepare for fixing the behavior of unmask
> registers. Existing chips that set mask_base and unmask_base must
> set broken_mask_unmask=1 to declare that they expect the mask bits

Boolean should take true/false.

> will be inverted in both registers, contrary to the usual behavior
> of mask registers.

> diff --git a/include/linux/regmap.h b/include/linux/regmap.h
> index ee2567a0465c..21a70fd99493 100644
> --- a/include/linux/regmap.h
> +++ b/include/linux/regmap.h
> @@ -1523,6 +1523,7 @@ struct regmap_irq_chip {
>         bool clear_on_unmask:1;
>         bool not_fixed_stride:1;
>         bool status_invert:1;
> +       bool broken_mask_unmask:1;

Looking at the given context, I would group it with clean_on_unmask above.

The above is weird enough on its own. Can you prepare a precursor
patch that either drops the bit fields of booleans or moves them to
unsigned int?

Note, bit fields in C are beasts when it goes to concurrent access. It
would be nice to ensure these are not the cases of a such.

-- 
With Best Regards,
Andy Shevchenko
