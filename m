Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8108A554F98
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:41:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2883E2034;
	Wed, 22 Jun 2022 17:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2883E2034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912471;
	bh=UfTwuxijVWdhV7QEtSaVKdi1g5VARHr70jUKi8xmdsM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jqZTYuZ9/ag8+qEQmY1YkOCgV6E/J4e/S6bPByzFQ9aVZlEWCfR6DmdbKFCz/bTCW
	 PjI/wHeqnje2H4FCuiUTkFD9W54WeHmWC7ntNZGH71wJAik+QNNecszcl9s9KilJbR
	 R0hBpeDV7roQREfqasAipM27we0pC0Lsf7fVlFpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1917AF80737;
	Wed, 22 Jun 2022 17:24:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42D92F80155; Tue, 21 Jun 2022 11:45:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4E46F800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 11:45:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4E46F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aZan9a+4"
Received: by mail-ed1-x52d.google.com with SMTP id cf14so8805681edb.8
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 02:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CTHYGS8g7sCFv5p4IGpE8ByIK0vfNIUXHpKKS2cHepQ=;
 b=aZan9a+4JhusAULYzHK4QFgDvTJUfc7zekQyAVoRGCyOHUagzlr3IY3SntNiCuk2D1
 NQjyRuwmILTBnDHyj8RbP6weJG7bsYc7fpeAX5WMX7NI80xLjR2pEQelEAuHWyLISW03
 dZaw/laN5sK9zCYrzCpBc92fUeGmzlgcNNnV+C/p3f0do3S2Xro53gDdPjHT4fWtJj81
 rYkou1ikTNpl6+XOXXlO5K890puNv8x9VBAb1IKHcoUKaWjKVctK6anPKEkAjSj3/2W5
 5VnldB0KCYV6EffLfKh44jApav4JdfNauC+sb7GhpOh85EPNh735t0b35swaLkY44kt/
 +liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CTHYGS8g7sCFv5p4IGpE8ByIK0vfNIUXHpKKS2cHepQ=;
 b=aU+x20ImFj7BDwFPpktIL0OVNrIlxvBriW9KqKPZMPHHoZ9peI3IBa03i/7Zz/AlWR
 7UZxAqwl/h/JLdiNZLOEhAttPaQwtLcG4AXqUZ0SDqnQI48pPK68TlScp9pyJA3gH8Wf
 LU3nEWGx/IhyXacF83jjnow847M3aFeJUWvaZFOIdDfnO67zwjyB3b4G81O20WYLGGvI
 df74Lb+u61cg9fvDjUdG2S/0WjDmvquXzfICIdM3Lm4yX2UrD/318Cd92Kb6DY4fwqHd
 oL+Del4O9dnSuj25bf9pWZ0bCC9B0yHxnXInONVb0eyGgagefP8fcUyGHAPADlx+LHeI
 qQ+Q==
X-Gm-Message-State: AJIora+tpMJIdYIt69xZmrFXOXpDpN0qOrAnXMm2B7P82oSfypK/dwCg
 dTzKESnncgQjAgfncFXuknViMP26qDWte0++Mwc=
X-Google-Smtp-Source: AGRyM1u+LlqfMEeQQX/kZr8ewmIWAzmzCCS9cETMG4/8g63994DOIJmrlDmEJXOU2GEP6EkqBPGnv4N6VF0F7gWLvvI=
X-Received: by 2002:a05:6402:f8d:b0:435:6df2:68a with SMTP id
 eh13-20020a0564020f8d00b004356df2068amr20143116edb.209.1655804752004; Tue, 21
 Jun 2022 02:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-47-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-47-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:45:15 +0200
Message-ID: <CAHp75VcidJzb+1-uNMuDCKPSaxKkCdKnB=iF33g_PqaiyHAN8g@mail.gmail.com>
Subject: Re: [PATCH 46/49] regmap-irq: Refactor checks for status bulk read
 support
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

On Mon, Jun 20, 2022 at 10:11 PM Aidan MacDonald
<aidanmacdonald.0x0@gmail.com> wrote:
>
> There are several conditions that must be satisfied to support
> bulk read of status registers. Move the check into a function
> to avoid duplicating it in two places.

...

> -       } else if (!map->use_single_read && map->reg_stride == 1 &&
> -                  data->irq_reg_stride == 1) {
> +       } else if (regmap_irq_can_bulk_read_status(data)) {

>

While at it, you may drop this unneeded blank line.

>                 u8 *buf8 = data->status_reg_buf;
>                 u16 *buf16 = data->status_reg_buf;

-- 
With Best Regards,
Andy Shevchenko
