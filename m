Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7001322EF
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 10:50:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5084F181D;
	Tue,  7 Jan 2020 10:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5084F181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578390614;
	bh=1PcpiKpFZWaiSnL1DqvC+fLOWBA9xvvHoduGEVDqRcE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=anPPUZAvChzuAbEwUCj6lOAIZXaNFo4k3QYwJ7vHGD06QlOSdD+6VhSKg6m4AQOqD
	 29Jda0pAx0S7zAiey6AOWFUK/lD0kU8LEwzSohcGMYzxYAb6TaSadlIjrL7Kd3MSGP
	 QlnQlHgtiDb3Og8clA8LYnGr7B5rzA8w/vXlzy5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32C44F80140;
	Tue,  7 Jan 2020 10:48:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0526EF8014A; Tue,  7 Jan 2020 10:48:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D189F8010B
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 10:48:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D189F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qtI5LJo3"
Received: by mail-lf1-x143.google.com with SMTP id l18so30253639lfc.1
 for <alsa-devel@alsa-project.org>; Tue, 07 Jan 2020 01:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=57yyaLukCeYKAR+EhYGKNLb0YJSXe31eGECRa1cvyNQ=;
 b=qtI5LJo3/WvWrVIOP518oxDc3sCuQZBRfr9C5k+6doCxp3MzxLMN6EKtFZgGos+b45
 LkDrzheTzcH8ElGC1D31coYR3J0ag0BydTOCnkr0keaP+7TP+453ZoSSijAkFO2Jn1ns
 DNdC6m9acz9YM+LvrQD5aWwTHN9J/0xtaN/wa6UdUP77zaUcnKO8GMK4A0X+UZtyuYfn
 Dojan9A7M8+5unJ7aoUrDc47Ap1APgA/gtyvSA7dLOqWIWFwN1g/8EJ7ozI0vLP2h50c
 GKOWEwNT6+mgWVJ7cN5Kj5Q8b64XwtQVqTm3ZukPYVhj6NAOIjZbqLym6VSOgAH+u1qH
 GQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=57yyaLukCeYKAR+EhYGKNLb0YJSXe31eGECRa1cvyNQ=;
 b=gYy5E0O6wTMAeVyBep/HLkDxXnqTIC3X6ofElflURkK+ZefPhvR52EoxyPfkYIY4Ss
 0fxqzej7lSnqK3Mryt0Q/mLzci6faRAxL1i3oA4ldbvPW9V7lRDVlhW36UIQaug71cZ6
 VywJwM6B7JSr5d3bWYv2q6wqqC21acgWA9cgrIiUl6kEsq7CNC75HgyYq7ia1d7lqq5R
 I3vHpfgR5YG3RI8ZqBktqedjZPw6re4fux9IK6fD1BKoVsekyLMDq/WLcUd+bqZg3GMm
 3DJ9KQRk9sH5h0P3q07wx6tmAGrFEZgsokqUFEYB6vCI51dai1VujoADjqjyS7OU3g8M
 XB5Q==
X-Gm-Message-State: APjAAAXigJmeexnMR8mH/7YLzYuodeezbE7dvhp5m5VEEWf2vB1OTCF+
 wIrSUbxTDYEbotCYzkjV80JW4ERcFUtVos9dA1lm9w==
X-Google-Smtp-Source: APXvYqwJ4NEleHWVj49bXWx9f2Reukpm63SdKPnvrbrbdsGZZiFUSvBsk8NVHRhgjrknGj8ifWCADNENNBxCswle48I=
X-Received: by 2002:a19:c648:: with SMTP id w69mr58882108lff.44.1578390504987; 
 Tue, 07 Jan 2020 01:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
 <20191219103153.14875-10-srinivas.kandagatla@linaro.org>
In-Reply-To: <20191219103153.14875-10-srinivas.kandagatla@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jan 2020 10:48:14 +0100
Message-ID: <CACRpkdaoU9B+981iF4wvLgY-QNNnsNUE=CYVmfX8zNtUuOtKfQ@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, bgoswami@codeaurora.org,
 Vinod Koul <vinod.koul@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, spapothi@codeaurora.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
Subject: Re: [alsa-devel] [PATCH v6 09/11] gpio: wcd934x: Add support to
	wcd934x gpio controller
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

On Thu, Dec 19, 2019 at 11:33 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> This patch adds support to wcd934x gpio block found in
> WCD9340/WC9341 Audio codecs.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

I think I reviewed an earlier version of the patch set yesterday,
the comments are still valid for this version.

Sorry for lag in my reviews :/

Yours,
Linus Walleij
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
