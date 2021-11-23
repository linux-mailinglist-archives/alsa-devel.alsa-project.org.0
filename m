Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0738345B52E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:17:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A1A617CE;
	Wed, 24 Nov 2021 08:16:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A1A617CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637738239;
	bh=Fmou/wuLUJUD4zJclGcPIdJu1KVjJ7yuzM0jDRLa/jU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CoaenySfZPPiBg5ZNcXU6URn7zvBqNliRnkzzXtN/q1MY73RNR9exJIDHqu0madTO
	 rOBSA74RGf6/rtZfLSaGJsdyfZE4/KC4iiN90yuLM65zPCTDB3gwc5yRyzn2bSIQvZ
	 +NN4Mr8hrlDcFB0xjrQHJ3WfWZ9uzLFf5BlS43Tk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 022D0F805F0;
	Wed, 24 Nov 2021 08:06:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86162F8049E; Wed, 24 Nov 2021 00:35:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C155F800E7
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 00:35:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C155F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="M1kOjxYt"
Received: by mail-ot1-x32f.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso1361138otj.1
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 15:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fmou/wuLUJUD4zJclGcPIdJu1KVjJ7yuzM0jDRLa/jU=;
 b=M1kOjxYtgXgq09yG/Tpxoql00WqAEf+/obBrTLesDBofwRUa7GWFazzYfDKZsB30ME
 LP42xJGdAe5cnwer5SKD8Etmug0Nt6ulXzhr/sIoE9xx2sYU5ALDWZXfWHpEvjhc83X4
 /EddGPPSnA96tKQr0ixoO9Iif78PSZQtfyiC4pLlvI90GT05IGmxb/4bv7ckDscOFVa0
 j8mh7s4sgr6HP2CGrSy/5EINAIynCtUbqRAKwELOEpj3OmmDipt7FyRZkcV3y0yyaOqi
 RMMwVrDE6PwHAX73yXnvFMVjk1xx32TWcnMG5ytYScelO405R1gRZUvoyiVzX+mFaqbl
 +gIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fmou/wuLUJUD4zJclGcPIdJu1KVjJ7yuzM0jDRLa/jU=;
 b=n55L0IGTxyd8m5xkOizAlPXvEibHcVaukrSd5ybIiXpwMJrQy3i/snBotG3J2zbb+I
 mD0n2Ho8bOejYU1M7PB8/V/f906FKwsjS40WDzl1BoAEchveUAq0zW2GzUCJ8LN8gbrQ
 yRBo8R5yI51l95jg2MwAtHLZ73j9aSTQEeKcf1rvXHkK6qerb1WkNQCzTXlFgi40O9fq
 s/GRwjAz38trkWWgwoMWMfINLLpy91Jw+9/bfASCF/+Xp24hv6w+FCZJ42830jwsvMvM
 GBPxUI4YXmlclwhfe+mYYzxXA5Y/v+sx2L/MChapXeNX2etrioLyzka3pp4nrtswxVCk
 oXnw==
X-Gm-Message-State: AOAM533nAfjewPJrqsZSZ/6esvHGGSuE9RFPd0QgkUuoMT0lr85/J3TV
 A9jXjoHOQGQZtfwTtvDE8v+TJMfojBSjfuHsGmgSlw==
X-Google-Smtp-Source: ABdhPJzM/xqGhHncEHhl2AIgExbTLI27yZdnho4Z+I5VLuYNi5uSlNeNxRyIKiu1OCuHPC8HqiuPUo4+VogT8mYjGlE=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr8027979otl.237.1637710535722; 
 Tue, 23 Nov 2021 15:35:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637592133.git.geert+renesas@glider.be>
 <afb895b597037a635acc4a1dc44b88598268a19b.1637592133.git.geert+renesas@glider.be>
In-Reply-To: <afb895b597037a635acc4a1dc44b88598268a19b.1637592133.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 Nov 2021 00:35:23 +0100
Message-ID: <CACRpkdZAA_XZQ7KXOsod8r5EZ0F9f1qaz3+FLsuyPfeD_mO5Dw@mail.gmail.com>
Subject: Re: [PATCH/RFC 07/17] iio: st_sensors: Use bitfield helpers
To: Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-aspeed@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-wireless@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-clk@vger.kernel.org,
 Ping-Ke Shih <pkshih@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 openbmc@lists.ozlabs.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-media@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Benoit Parrot <bparrot@ti.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, Eduardo Valentin <edubezval@gmail.com>,
 Paul Walmsley <paul@pwsan.com>, Rajendra Nayak <rnayak@codeaurora.org>,
 Tero Kristo <kristo@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Keerthy <j-keerthy@ti.com>, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
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

On Mon, Nov 22, 2021 at 4:55 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Use the field_prep() helper, instead of open-coding the same operation.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Clever!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
