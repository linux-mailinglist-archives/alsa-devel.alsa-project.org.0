Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68943844057
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 14:18:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D81AFB76;
	Wed, 31 Jan 2024 14:18:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D81AFB76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706707131;
	bh=dr6D8tcSVVpexu92k5w3N7i9nF+7FRKOS7uUR00A6YM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cOOsaXgCxlljpVoDjzK38UBCE0zRxFTEvhWAIMJbJfURIIaiAL74fWkfHuuD1725B
	 e98sAk1tWYaab50hTyey7XEdZGFAjlDE8kXe4dYPLPlXdZAo9OqfZcktrRSjPaVntn
	 6gzqUBdBUuKiXEHNow3QHMsZiXyIbKpnfLseOAYc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44D19F805A1; Wed, 31 Jan 2024 14:18:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96D8FF805A1;
	Wed, 31 Jan 2024 14:18:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52B90F8055C; Wed, 31 Jan 2024 14:18:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF479F80149
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 14:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF479F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MlhhTsFB
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-603e086c05bso30869797b3.3
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jan 2024 05:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706707086; x=1707311886;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dr6D8tcSVVpexu92k5w3N7i9nF+7FRKOS7uUR00A6YM=;
        b=MlhhTsFBDoeeUPn9b2behcHl7iBKH8vANwhQjjlsxq094FFO+VCHQVGCRsFH/4n84Z
         jhWfWuZV1FbEZNnZAO4ou8v77U/7IYwfBm4NP+zd5kDdirNDxSjoxm8wALRkWosD2j8S
         MDi8MWA5Xp8MWOWAguIbLNT98To9D1ICcctw9uyTf1YWTWuuXGU6+UVOodJEiiCdfc2w
         rUSBSWKipnXNnBq3PmbvGegjzPDjJTKLCd8ItQjcWyBt3o26RJQP3+XcdS8T7rIXBev2
         2iIEgIiyyQVs1LtPGttMLUDTS4RpGbqTwUf9djRCXB7vtQkRogVQ1c1YwnxFSUwhdhdx
         vxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706707086; x=1707311886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dr6D8tcSVVpexu92k5w3N7i9nF+7FRKOS7uUR00A6YM=;
        b=SmQzSS1WTaTONICpnXdE7cojzxmxXZC4Wq5hZMsQz1cQzr69/c1VMA+53+r6lW552A
         g5s5W7rB7k4NlJZML99qWQJkPmxPwrMsc4avu69OFXonp6utqwlAI+tgVE2RiJvrPqnE
         wBTMr7mcez/u+5Iph4Y2QcQ2Lx2Mtbrr3wnG4V3ZgSC8x5uHjiFaKRldSdwHcdTgHPmn
         UekhBRVYRSdNgOVgGq9tU/3BWegLOvd+LJgN0WFlFSL1FLkYKfpCd1EJXrSGcUGZ9umD
         uB+F0B9BVGQ4Zl0hCGqkUXQ4LCMHI6yP3xeZOVeiP27bjs3+hfjYV/SoV59inNyOu8fO
         q8XQ==
X-Gm-Message-State: AOJu0YxC0fR72CxXHNu8jT30T/OX90WtNvQYsS1vCFHsQDbY3jVpo0Aw
	jxtM6p+4/1WF0rsjSuIS5v1wR5Zzy7tSzWQgOxsHkRMmFEs9dpeqlM312dtp887rgPfia4jWJ34
	B9lShb0FAOLSKKmySVFGlFQLHpU8zjJ45m3kbJA==
X-Google-Smtp-Source: 
 AGHT+IFVACpGX4CJfjjGDw2bakc2klq/FcD8fSXKF03+Z3ok8uxur5h6A7nnyOGYfn7248iMkpgzntKDjCWeB+kOfoE=
X-Received: by 2002:a81:79d5:0:b0:5ff:f756:8804 with SMTP id
 u204-20020a8179d5000000b005fff7568804mr1275150ywc.45.1706707085871; Wed, 31
 Jan 2024 05:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
 <20240129115216.96479-5-krzysztof.kozlowski@linaro.org>
 <CACRpkdYf4HUaV-Pjr81WjLbzy9zdAnyFWs9gPayPC6-3OjHQwA@mail.gmail.com>
 <CAMRc=Mc1SGLeUOWmKg=fvCdM+RR6FSu2QkFuR17s7L99eRMGug@mail.gmail.com>
In-Reply-To: 
 <CAMRc=Mc1SGLeUOWmKg=fvCdM+RR6FSu2QkFuR17s7L99eRMGug@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 14:17:54 +0100
Message-ID: 
 <CACRpkdbaxqTzwL9L02vCpMMdBYsubNP1VkNuJ8mXB_=4E3Kjaw@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
 Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Sean Anderson <sean.anderson@seco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: J343SJJD5ZUJEO4BV5HZOM77KCHSCH4I
X-Message-ID-Hash: J343SJJD5ZUJEO4BV5HZOM77KCHSCH4I
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J343SJJD5ZUJEO4BV5HZOM77KCHSCH4I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 31, 2024 at 10:37=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> [Me]
> > reset -> virtual "gpio" -> many physical gpios[0..n]
>
> This is a different problem: it supports many users enabling the same
> GPIO (in Krzysztof's patch it's one but could be more if needed) but -
> unlike the broken NONEXCLUSIVE GPIOs in GPIOLIB - it counts the number
> of users and doesn't disable the GPIO for as long as there's at least
> one.

I don't know if the NONEXCLUSIVE stuff is broken, if you mean reference
counting isn't working on them, then that is by design because they were
invented for regulators and such use cases that do their own reference
counting. It's also used for hacks where people need to look up a desc in
a second spot, (perhaps we can fix those better).

As I say in commit b0ce7b29bfcd090ddba476f45a75ec0a797b048a
"This solution with a special flag is not entirely elegant and should ideal=
ly
be replaced by something more careful as this makes it possible for
several consumers to enable/disable the same GPIO line to the left
and right without any consistency."

I think for regulators (which is the vast majority using it) it isn't broke=
n
because the regulator reference counting is working.

So if we solve that problem for reset, we probably should put it in
drivers/gpio/* somewhere so we can reuse the same solution for
regulators and get rid of NONEXCLUSIVE altogether I think?

The NONEXCLUSIVE stuff was prompted by converting regulators to
gpio descriptors, so it was for the greater good one can say. Or the
lesser evil :( my judgement can be questioned here.

Yours,
Linus Walleij
