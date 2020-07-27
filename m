Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D673522EE26
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 16:00:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BDC516B0;
	Mon, 27 Jul 2020 15:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BDC516B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595858417;
	bh=EMXQkZvLySYW6eMH6mzEuZqKFnVS7jV2ZttmzOwe/k4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PYvZjPcvyDkc0KYCG6ZTh6HJgW9TGkWKi5XAhvDKoNf6Mxe6t1V4+Sw9Yaorem7Kr
	 I3AMHAuyAsWkQxrFNsFumXmEU0kPY1cekI4f/MKjvxvI7+yn709gxTNVJYEt6xm4u1
	 zHzLDZ3NQX3V8+LEvRxLuKM+kdzhLeoGrRGFQa8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 929A8F802C3;
	Mon, 27 Jul 2020 15:57:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA85EF802C2; Mon, 27 Jul 2020 15:57:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D554F8029B
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 15:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D554F8029B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tkpVP+Sj"
Received: by mail-lf1-x141.google.com with SMTP id 140so9058721lfi.5
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 06:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EMXQkZvLySYW6eMH6mzEuZqKFnVS7jV2ZttmzOwe/k4=;
 b=tkpVP+Sj+rzDeOOdgdZqZD4cxsAnYE/u9cPO4u+f5mRv1pb9MPjC95kzpy3IqI9Nu+
 4Opa1pKIVzL7ZwoEmnY6IwKtAELvq0cA76fYKg+1pEwEeDohKDKU1RY0MroTRE+/4QeB
 GG0/5QXAeZGnEgWjEcovghoWQLn9MKuZp6notPBD3FuwuwH0V06b7Wk27UQ0c+eapAT5
 fv4y+FvZoqCNvyJCrO59cszqj4LhSV9K52PcWADSeqbjMvmE4sBsWscbCQ2vyDK/adTt
 SLCfw3teybU6sZQGTghgAM4ReHZ/tSbEfGgwhdBRLWr9IgBRzP9iW0ZL1OAEPaceQJOQ
 XDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EMXQkZvLySYW6eMH6mzEuZqKFnVS7jV2ZttmzOwe/k4=;
 b=bxcwX+RjcOMGwh7nqBocnwt3P3C7sVQ3vYaUn8IIY51P1aAB/Y2IJB9I9+ih/QI0lK
 TI5YBE6ahs/qCAkRWrzFplqIZt6iedxVGOKCIUMKLCme9AUGHro3z/vtCB/wmy4YP7hg
 gACPLTZn2aGviWOOGrf4X93ZcFZyg4wZdvMvzYKp4Cf0v0tEWMvDWwsL32sbY/ja909G
 xWKD/ioxKtirAK08RrI8cDrlRz/5PC1a2obZi0AV1J3HdZU3Ce+Ff9Ht6Ux/CAELsW49
 P014T+vZi6bwe/cDSi9UEvyLyUI/BDvN8lk+ouVc87tAXP/acaIFo1OvEN79CvcyLxAB
 jw3Q==
X-Gm-Message-State: AOAM530PUUVVy4rfGPSNYQ7K1E2ItZMyqZuBbyt+E9Jwcho/ZZgw+WHo
 6wIlTNPsgvtfKIFamYNhpjunPxtKLrEARAgmEIU=
X-Google-Smtp-Source: ABdhPJyy/ZjE6SdMTyaiBpYcZ+xIikw1+qZaMPosMUseCKwQzpiu/8cGpYf1p6ikVhIW2Xlnc6hKr9fngJ2WEyXINvI=
X-Received: by 2002:a19:8957:: with SMTP id l84mr11615510lfd.66.1595858242263; 
 Mon, 27 Jul 2020 06:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200717135959.19212-1-festevam@gmail.com>
 <20200723092140.GB10899@ediswmail.ad.cirrus.com>
 <CAOMZO5DvR1CNwR2fG_e48Kv9FPdXj-UrboPpAbA9tTakOdpw6A@mail.gmail.com>
 <20200727132717.GC10899@ediswmail.ad.cirrus.com>
In-Reply-To: <20200727132717.GC10899@ediswmail.ad.cirrus.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 27 Jul 2020 10:57:10 -0300
Message-ID: <CAOMZO5CiP-Utnaw4yEE2dTL1O=snQG_Bd+n=GC3B1BrizYtH=A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: wm8962: Do not access WM8962_GPIO_BASE
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "S.j. Wang" <shengjiu.wang@nxp.com>, Mark Brown <broonie@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

Hi Charles,

On Mon, Jul 27, 2020 at 10:27 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> Alright fair enough, this is a good a fix as any for these two
> registers. Although I would suggest considering my questions for
> your additional control 4 issue, since there is a little more to
> think about there.

Yes, I will investigate more the issue related to the control 4 register.

> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks, Charles!
