Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97083554FA6
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:42:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35E4B244A;
	Wed, 22 Jun 2022 17:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35E4B244A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912566;
	bh=X6SLr4OZtLPKEsNY6C82Z1+S44Ie7xruQ9IFGvCJHIs=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=teuDteKrcUReemC6VZ5REBNobBx9oH+7NJoh9t/vQC0whMC1PCarXvS/XJ0mPs1Gt
	 Y0/+GqP6/qkXL4DnYeiDLnQZzH6Skw0/PC/WLZ4GYr93FeGgz/L0O5IkdmmRp1W7DQ
	 KmEBQCwbgFn2QiDhro50Iuh/O0JdRdNSvQh7g8gc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41503F80765;
	Wed, 22 Jun 2022 17:24:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D45FF80155; Tue, 21 Jun 2022 23:06:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94ABCF80104
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 23:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94ABCF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jUd5EpK/"
Received: by mail-wr1-x42b.google.com with SMTP id o16so20624509wra.4
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 14:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=references:from:to:cc:subject:in-reply-to:date:message-id
 :mime-version; bh=B+AifBFHSjsojzLa/Un/BRuE3LfBPqi3dOTl8DfRwag=;
 b=jUd5EpK/oDVgY0PrmyIj4MbqMNgKMDJSXTdrkx7aDI+kKFIwzflLFxbl8tnmBcS4Tp
 gB4gaM7Xma3+XSg+VGLSGTTgAuKWgIh6oZEa3B1gj7CGcxjYDaT+mvOLqiK71CJ9lCAf
 VLJs+n52lPXvDYIMyuayGTeKnVXRXd+7SYpLLXlfBBqdyIzNsIzgV1Pov6IBTxeWpOLA
 y2WofGIr0wPjngMAcYFM5cXxiNo4M8n8MEvUAduAxgAsmqhRyoZLMLWAdXvCTVIIBRWG
 Zr/aISNe4jZxXrKY34Xe5QxN9wI5wZzSkhMqFa50UXd8ZPYof9DpGUqyIGw0r9T09fDC
 iUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=B+AifBFHSjsojzLa/Un/BRuE3LfBPqi3dOTl8DfRwag=;
 b=OQp53bhWVw6mvdOiPmy+sDGxzwlW6ED35DgWMAm+3F2DwF4Ql+6iDCKEFmu7WdqbjD
 Zk7o+dfef1qzOvnyzQB+10IX0WXwFqTC7d+X+wq7OWdw29kKF9Za8Hxew6MWFgukqzS2
 vrq3ggULDU6KbInjAMQQMZW3xtiicG4SS2dOo/H6vUlQrLve3YIAFwUkK5uJx6DfN6JZ
 WAh/yjIUlq1IR+ADflsT6WncwRRHslur5W5k9dIc0LRH3fogKbViRNHaTRmPMSVYcqpy
 WGE3JXvtXRvs796tdBP8ObwsaxbG5cy/Qu3k/+b6FMrkpTNgIlI2tg8GNDRxxA3Q65DE
 g48w==
X-Gm-Message-State: AJIora9fG/LSpk9/bAotTYyh79nZbr/pj2maGqUbx3kHPlnRtIpkeiC9
 EA4X7Wg0HONA14qx4sMa6tA=
X-Google-Smtp-Source: AGRyM1ts9ak9btzFswFUFoMElfPqueKySjcD1ty3sVAYSJ8wBUDzoTa0DLvFqOB9/wbjCt3Z3zA1LA==
X-Received: by 2002:a5d:47a5:0:b0:210:2b96:a952 with SMTP id
 5-20020a5d47a5000000b002102b96a952mr31343094wrb.248.1655845578965; 
 Tue, 21 Jun 2022 14:06:18 -0700 (PDT)
Received: from localhost (92.40.168.124.threembb.co.uk. [92.40.168.124])
 by smtp.gmail.com with ESMTPSA id
 j1-20020adfff81000000b00210bac248c8sm16976883wrr.11.2022.06.21.14.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 14:06:18 -0700 (PDT)
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-18-aidanmacdonald.0x0@gmail.com>
 <CAHp75VcN0hf5_AVB-aRBhyvwuojuDC=FbBUqWpUWQR=r=zSRPA@mail.gmail.com>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 17/49] regmap-irq: Add broken_mask_unmask flag
In-reply-to: <CAHp75VcN0hf5_AVB-aRBhyvwuojuDC=FbBUqWpUWQR=r=zSRPA@mail.gmail.com>
Date: Tue, 21 Jun 2022 22:07:24 +0100
Message-ID: <6DVb6JaRd4bhUPBIyfXXiqm668jAPyls@localhost>
MIME-Version: 1.0
Content-Type: text/plain
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
 linux-actions@lists.infradead.org, "open list:GPIO
 SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
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


Andy Shevchenko <andy.shevchenko@gmail.com> writes:

> On Mon, Jun 20, 2022 at 10:08 PM Aidan MacDonald
> <aidanmacdonald.0x0@gmail.com> wrote:
>>
>> This flag is necessary to prepare for fixing the behavior of unmask
>> registers. Existing chips that set mask_base and unmask_base must
>> set broken_mask_unmask=1 to declare that they expect the mask bits
>
> Boolean should take true/false.
>
>> will be inverted in both registers, contrary to the usual behavior
>> of mask registers.
>
>> diff --git a/include/linux/regmap.h b/include/linux/regmap.h
>> index ee2567a0465c..21a70fd99493 100644
>> --- a/include/linux/regmap.h
>> +++ b/include/linux/regmap.h
>> @@ -1523,6 +1523,7 @@ struct regmap_irq_chip {
>>         bool clear_on_unmask:1;
>>         bool not_fixed_stride:1;
>>         bool status_invert:1;
>> +       bool broken_mask_unmask:1;
>
> Looking at the given context, I would group it with clean_on_unmask above.
>
> The above is weird enough on its own. Can you prepare a precursor
> patch that either drops the bit fields of booleans or moves them to
> unsigned int?

Sure.

> Note, bit fields in C are beasts when it goes to concurrent access. It
> would be nice to ensure these are not the cases of a such.

These are read-only so there's no danger here.
