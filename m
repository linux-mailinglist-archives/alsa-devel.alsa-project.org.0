Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CF0719AEB
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 13:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E6FB4E;
	Thu,  1 Jun 2023 13:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E6FB4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685618632;
	bh=sUmhHU1fbhyU+RUYWStGTJNMxjAzPmJ//EgW00C5mZw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eaty0oVsLn+k3a/1eKml8+gNjX3rSBzPnoTLqGGcO+1cNoGCVbM14NWKkZS1NBviI
	 3X1ffhZKUho3v6FLonknyJRRMf3vA0Fe3v6HSU8+XxSr4Jaa7cPfF3NSnG0OsM4OjV
	 /YiPIPsztkaYaw7xrusWk4yNmicRmkCKlPn/rBRs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 155E6F80132; Thu,  1 Jun 2023 13:23:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1512F80132;
	Thu,  1 Jun 2023 13:23:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 451B5F80149; Thu,  1 Jun 2023 13:22:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92D13F800C1
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 13:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92D13F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eZ9To0SI
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-3f829e958bdso5611151cf.3
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Jun 2023 04:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685618570; x=1688210570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUmhHU1fbhyU+RUYWStGTJNMxjAzPmJ//EgW00C5mZw=;
        b=eZ9To0SI50DTVI2dAf2RP1StKYs+cyEqUpAF2574fnqGhgB2TAaZ0gBa8bYXdn/j0x
         FuBa8X6m1Y1EYf3bzxSBu2csTyMGZkE9/fuq0cSSE1h5sqzqaZhxg4bU1VFvtPSzv9lW
         5QLOOoGgY2C/+BRg+CxZVUgRFDUMQ2vepXR8quVdyenHux1FM0wWOKni7MlZMsghXV69
         FUODS4sK/uZiVM1aOfjh7UXurbvyBjLO3yR32V+j2o7vSqQ5w39O3/jGmJebHAl220wl
         l2YbU4dB3dhyKQsqpA//vOIfL9sewdZswWZOJLPoyEsCk6buDMIeXHjvUR1hnxPzY0TO
         4ZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685618570; x=1688210570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUmhHU1fbhyU+RUYWStGTJNMxjAzPmJ//EgW00C5mZw=;
        b=dOlB2rYNCxF8mIIk5mbtrisZTGv8c+IJb7GMlZWjvLTDgF5LnWBXwygmvxmLPALWvA
         X7DpXQM2t+60v6QFQ78djdVqNA/y8kBGZj4PPfzJBKb/DjaeWJ1XITCwKS1HytAgjIOI
         ylg66rpSWOawRSyEfAEcSqUcwdpmdEOGuYZ1mG3yGdudnMYzgjgbcWp6/XSNspVsF7pV
         m/tDJ1rhe71ynoZWkJ/1GGsVkc3VItJM2PghjazrmB0ZHeX+gJmshbb0128qC4khRumz
         TlSMh52mN9rRXHajgcB4fmNVm6YrkT0+GXPbYaLS8YPlEoNLqRYagjqicSyTsLiX5NaC
         qbdA==
X-Gm-Message-State: AC+VfDyPsNV2DbX37d7ulqY/NHrMlW80d/7OeWW0/9kRyomyzhK+wDcY
	/BBnxfJquOEhIrkSnV7ru5Br2xCa4l5UioVrlidhXw==
X-Google-Smtp-Source: 
 ACHHUZ672XhBtqgSSO+77bYpfA5o+5/XdJD5UDVXzB2ag05nisa3IUi07jZC+Cq76E6sC0H/aS/YY93daCCv9WmxO/Y=
X-Received: by 2002:a05:622a:182a:b0:3f6:b055:81ff with SMTP id
 t42-20020a05622a182a00b003f6b05581ffmr9265467qtc.50.1685618569842; Thu, 01
 Jun 2023 04:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230530122112.1314458-1-ckeepax@opensource.cirrus.com>
 <20230530122112.1314458-5-ckeepax@opensource.cirrus.com>
In-Reply-To: <20230530122112.1314458-5-ckeepax@opensource.cirrus.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 1 Jun 2023 13:22:49 +0200
Message-ID: 
 <CACRpkdb-jk50gO_Y-7NKQfLjPOH6ZwL37YsQJoJNfoqS+N8NVw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pinctrl: cs42l43: Add support for the cs42l43
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	vkoul@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org,
	lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MG6AXLEXMO55I67HSD6K6ZKD4ADKFIW7
X-Message-ID-Hash: MG6AXLEXMO55I67HSD6K6ZKD4ADKFIW7
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MG6AXLEXMO55I67HSD6K6ZKD4ADKFIW7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 30, 2023 at 2:21=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> for portable applications. It provides a high dynamic range, stereo
> DAC for headphone output, two integrated Class D amplifiers for
> loudspeakers, and two ADCs for wired headset microphone input or
> stereo line input. PDM inputs are provided for digital microphones.
>
> Add a basic pinctrl driver which supports driver strength for the
> various pins, gpios, and pinmux for the 2 multi-function pins.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

This version looks acceptable to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess it will be merged with the rest.

Yours,
Linus Walleij
