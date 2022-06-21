Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A56B9554F8D
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:40:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 457F1244A;
	Wed, 22 Jun 2022 17:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 457F1244A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912408;
	bh=psrrBHS+XnAFdAxwkcRW8VK5DggNaLIcunsHh5BDjj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JYgyb4sVUa56diTS5VHPURWDH5jvCf7fjcFKLefII4bnTlyKiI3QJZCuF1xH9WA+h
	 lFRgqv86dVioAqR/lmJ3oJa9yDmMAmsLbWGnWfz8ggX6JHQtonAF/rab8eaVIR1250
	 LA2nefno87WjuZeU4kpx5CL+GWbFqijTLFoPzJbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A46AEF80718;
	Wed, 22 Jun 2022 17:24:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92AD8F80253; Tue, 21 Jun 2022 11:35:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16A38F800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 11:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16A38F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UixjmExe"
Received: by mail-ej1-x632.google.com with SMTP id cw10so2475084ejb.3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 02:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a56PheGcF+r+BjhYmHX7tYRduE7y97a0JE0aqCMtBZI=;
 b=UixjmExeWC3NrbmY2//fqkfPnJRAmI3sK61SBW8J25ecyvNRu8cdjcXzZrB9vFZaVW
 YUpJGfwbiuk1/Q15sPGbqfe6e4JyoZUF59VlyzpkI8jO20sjRrqotK1X7unN/KnfUqEu
 p1Se6aKX+tKaHJYE71hUPqHSk+sEw3O9OOYNMtYAQ70/ZfGxiMBPLX85OQUMZjK6B5Cg
 tPCfGRSWvPAgVwm+hlCyY4iVKhj6g7/5PYEeerpe5McbZ3g4CAAkUyCi8c3KpFsTdeoC
 DSdWLIDZ7kz2SMZgvQ71gwC1mUwdwSgDGv5XUY5Mjm6N+iOs/pHvh4h7V4c3k1ultgT7
 JV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a56PheGcF+r+BjhYmHX7tYRduE7y97a0JE0aqCMtBZI=;
 b=B+cELhMSSVb5SwUHTCuNbjzktDzNKvwvcCbITa4GqCIp9J2wpsKDzl3w45X5YXR/mf
 JezX8oOxH7tKm2CQJeyEnG0OJ5cwblD6Kw7WyAqXYiQwAOsI9uCWMf4hwEebc2qh0wHS
 Aw/TFjyMqKbiduzGSyRRmyWgli7gD2BrgWIKkMqmcpcksGik5Y6O00cKqPOD4OE1PUQD
 SzrflMwIBS+AjZLq8gqAcZOO21onAnrT7ZhIdXJDx2/oi7o02e+syjOPRggdBcDetnJJ
 lxVKC3dMGZbyj5NSmDjs5TkUqNDv2p/woiLLghffHTb5REkJa7ENl+Nylohza8T0lLeC
 qgFA==
X-Gm-Message-State: AJIora8HTBXY4Hkm+m/U3DHPGPWs/jAPeAudhb98E2yhoz5TUM/n2Pw6
 YIIr+PubwSFYWUai2d4gZQQAyYhJFx+oI0orSe8=
X-Google-Smtp-Source: AGRyM1vsBhYdy8df/ZvLMM++hzJQmiiHBbGOufLVS/g7a50OxkgQ40vccBsdp5QFt6gNbEpmAGHvXM35Y2xJUEtiTAs=
X-Received: by 2002:a17:906:d9d9:b0:710:f2ae:b455 with SMTP id
 qk25-20020a170906d9d900b00710f2aeb455mr25461664ejb.77.1655804146381; Tue, 21
 Jun 2022 02:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-19-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-19-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:35:09 +0200
Message-ID: <CAHp75Vea8F5ogP8kjfdP4SK3aeohoRnkGZ7LtsLuwfXwL+APvA@mail.gmail.com>
Subject: Re: [PATCH 18/49] mfd: qcom-pm8008: Add broken_mask_unmask irq chip
 flag
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
> The qcom-pm8008 appears to use "1 to enable" convention for
> enabling interrupts, with separate set and clear registers.
> It's relying on masks and unmasks being inverted from their

It relies

> intuitive meaning, so it needs the broken_mask_unmask flag.

How has it worked until now?

-- 
With Best Regards,
Andy Shevchenko
