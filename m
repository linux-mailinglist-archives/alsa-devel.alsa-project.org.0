Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6E0304147
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 16:01:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06D5517A9;
	Tue, 26 Jan 2021 16:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06D5517A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611673306;
	bh=5PPoqIyCpJtL/ek+tU9+EyocWfpZVKR5Q6N/JZNTSoc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cPslV0iF6xTB+zvM5hovaUe2seVTOZm7wrbZBLUSckM5BdcYCER1lhLxThk6LSsLt
	 7Z8VnnYHNMtXIZNg/tMulmvB4oCiMoIn2g/gNDt0HzHLqSTrxi0bVwjwZg0L4lK4I3
	 Mk9gQP+v/l/xYxwEdmv18dCnDcBF1OLSsy9HZNRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AF47F801D8;
	Tue, 26 Jan 2021 16:00:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04598F8015B; Tue, 26 Jan 2021 16:00:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B82AF8011C
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 15:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B82AF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CJW5k+g5"
Received: by mail-lf1-x135.google.com with SMTP id v24so23112923lfr.7
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 06:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5PPoqIyCpJtL/ek+tU9+EyocWfpZVKR5Q6N/JZNTSoc=;
 b=CJW5k+g5rrW0iG7J1Vqjf7EeICvtVMaqQr4Mrssy80eRmciKqXrKNu2x10XtIpUMjd
 2Q9fD9jJF+Yiw/QHFgpLarnnoC9HGqb7+JqNxEgSc6ULWHrPbJmfwNrJC6HhunyJagtg
 X99euSfrluWSS5ypVzSO5NDMQXTO+CUmJuikTOK8ZdbxbZzpn8/jxBjqRW7InmA6noQy
 kVpakp5prj7msQgdbf5j7iuW6hQhykXGedscqJrv+7qvBclJSxgfLk7uWbofhgk5yXoC
 HYVsH6NmMWQ2xYCfoGIVnVCnWAy7NrLg+zu14JIFrJsRVJ3PouFzyRQeh8veAj9pmYVy
 LVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5PPoqIyCpJtL/ek+tU9+EyocWfpZVKR5Q6N/JZNTSoc=;
 b=uFuIzswj1L+tfF3hHtrqGQFBKxHXF4BoD4MLSn+Fuijq1VDrC6wSrBTxuSAgRAxxIH
 vUbB1s0Q3imVhldLFHWtz09BEuWqStQM2KBNrnfX7JCnj9+X6kIWV5EsENRXJaZCfk5Y
 1OMsWrwfzLG3eMMnIGVhg481E+EiRc21oZcCRZCEhgtk71qp9ab9jZG6a3+YUe+WqSO/
 Z9JpXUMBKcP9zbONRW/1JGdvFOqJAeGdtDIaTKCFVzfN0bnIkfE2vVvKMSX+VLHWqDjH
 0m1veyehQxfoyuR7vOMpj0P9JKo/KfedXFI9bIb9XK7eWlYEiY7RsYMocjtx7P0YUGjO
 2yzQ==
X-Gm-Message-State: AOAM532C3CNdw8apsAe+S9cd9Fjxxvb9N88NkO/E6MWiLO3NV8+4VEU5
 0znW31ehr6CE55xgNZlBx+oLybEpVuHJQ+KzHLQMEQ==
X-Google-Smtp-Source: ABdhPJw+UEQhd8vKQIGL6NeYSPSicxlz7dsriKTU3lH8LHsu7n43H+WLi/pKgx8+e/k/qqhhJKe1LW7Bfg9MZUXVmL8=
X-Received: by 2002:a19:495d:: with SMTP id l29mr2785470lfj.465.1611673197037; 
 Tue, 26 Jan 2021 06:59:57 -0800 (PST)
MIME-Version: 1.0
References: <20210126132531.2084711-1-robert.foss@linaro.org>
In-Reply-To: <20210126132531.2084711-1-robert.foss@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Jan 2021 15:59:46 +0100
Message-ID: <CACRpkdYPY3HxpWHMp08477z62PBYEjCKWpw3Uf0SQ7VHVB3jdw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl: pinctrl-microchip-sgpio: Fix
 dt_binding_check warning
To: Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, jiaxin.yu@mediatek.com,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 shane.chien@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>
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

On Tue, Jan 26, 2021 at 2:26 PM Robert Foss <robert.foss@linaro.org> wrote:

> Silence indentation level warning reported by dt_binding_check in
> order to reduce noise during routine checks.
>
> $ make dt_binding_check
> mt8192-mt6359-rt1015-rt5682.yaml:10:4: [warning] wrong indentation:
> expected 2 but found 3 (indentation)
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

I already have a fix for this in my tree, thanks anyway!

Yours,
Linus Walleij
