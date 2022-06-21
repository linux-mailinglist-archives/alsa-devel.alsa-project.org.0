Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D382554F8E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:40:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A57C32459;
	Wed, 22 Jun 2022 17:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A57C32459
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912424;
	bh=e3FpxMolr7Z3ghcKTJ1I50gys7aqVBNdUah/zqqeKts=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h5nonpv3gjL5PALLCDqCJ60+TxDM1MM1pFztGZYdw9yT6xPTa3zPTr0+eDPNlGJeW
	 IZYHhdjov2Pd0wTKV6ThZvZNP6J2VwXN0qv4de48vHUWJtnVEiUiwWHCTNcOjS34CO
	 gYYM4nrCYf/2KSJanCj2lo8yFH1TYJO2RzKzNWs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EB60F80720;
	Wed, 22 Jun 2022 17:24:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3F1AF80155; Tue, 21 Jun 2022 11:36:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3395DF800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 11:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3395DF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GZTXPEfS"
Received: by mail-ej1-x62a.google.com with SMTP id ay16so6845112ejb.6
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 02:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B3mXXvSs4qGpLiVTug5tdC+fphrM4PCUnQdpfU/r3B4=;
 b=GZTXPEfS47hEV7elN7AWU0dyhKzNKwdabIk8g/G/aEeYWfI/AEfKiiKKiJ0evIjaEd
 FtH51zPQdYz0Wv0AmPXOMQLodWRlV7HyTinHEw6fgJQgOlyjsTl6fQZSl/ybu604W4F+
 UxX4FRJSL6jlr9oxoyyq/C/sBcO8EH2byvWx7KEErHyh/iWfN8aNrTMTHnPVZ2W1J4lS
 1/7esI1emn382GWt20lYVLjXhb37rvclxIVWEiEfxWQVq7ufkcL+iuwCEDXuZqtEs1hI
 31L1rsZzI7J12QKbgN32jIG+MHsmRs2cNl3LB3qH6J7/PgBIg4Xu7+4egEgkvTA5IXOX
 L5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B3mXXvSs4qGpLiVTug5tdC+fphrM4PCUnQdpfU/r3B4=;
 b=YwIPyBLGIvoFGdsUi/R912iGSZzDnj7ZeCGoPchF+hffpxKNDRtmTEeuIKF5OFvXyw
 jo9G9YLX0vTRk928XqhGBl2ZImi3TIO0EKM9QhRNFVb+5WlAhp/FbK3PJLkH1DPq1Iqx
 EnBA5Ov/FgmRt6VQPEMiGSmdLFhYaSElUU3N/+4/v2kMz+3eqXzB+WOvezEx23/gbS77
 j2kIREF3fCzsgUgGidRSQTb2PTmcVRawgMAhVSudBjVqs5pHsT5QanRqy9mNwftuZANW
 9Am+0ck+a4F05vnHtNdI8NEJGFXCJ4J51VbC3QE+A1Zx6HoPiDdD/cY/oDT63GnkvG23
 VM9w==
X-Gm-Message-State: AJIora+Hw2C3I4u+QBe/ZsJyuV0CmaYGdxNdpInFbi/hEraOlz1Wv7Aa
 Z7d4XQIJ9ZScZsS2WZlgJifyPJfeHIAUqS1Gl6Q=
X-Google-Smtp-Source: AGRyM1sRYgfxiRNVCrgQTqEdasUCfu0meMegNlwo9FOn+D5YKqJkROr+llcEryQym3oDDQnhAyovKBjYaNBAW2RF8Ek=
X-Received: by 2002:a17:907:9721:b0:70c:65e7:2aa5 with SMTP id
 jg33-20020a170907972100b0070c65e72aa5mr24694089ejc.132.1655804186418; Tue, 21
 Jun 2022 02:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-20-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-20-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:35:49 +0200
Message-ID: <CAHp75Vc9=fcUCAZuTAg9FTWCAtsOo8PaCdGj3NNyOwkN9PJHUA@mail.gmail.com>
Subject: Re: [PATCH 19/49] mfd: stpmic1: Add broken_mask_unmask irq chip flag
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
> The STPMIC1 has a normal "1 to disable" mask register with
> separate set and clear registers. It's relying on masks and
> unmasks being inverted from their intuitive meaning, so it
> needs the broken_mask_unmask flag.

Same comment as per previous patch and continues to all patches of a kind.

-- 
With Best Regards,
Andy Shevchenko
