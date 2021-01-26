Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A050130414C
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 16:02:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37EA217B5;
	Tue, 26 Jan 2021 16:01:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37EA217B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611673328;
	bh=oou4JBBLNg89AoflcEwukaUQeMGozONrAI+ykd68abc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S26qvk4eQuuGFenD4V/0pWMoJmo37NxS0OV3zV7B2CBblBGE+Bxzrsk2lUmhtYx5E
	 t5bBQHmSHGBU/m4nIbFZsdIg2v0pzxd1o/sQ5Wo59cFMYc397fu+Z9IKyJ2JlQNywY
	 aRIllckmFvW20C1E75dPbiONiJb8+TxySfm6K2A4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF5FBF80217;
	Tue, 26 Jan 2021 16:00:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62583F8020D; Tue, 26 Jan 2021 16:00:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C1FEF8015B
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 16:00:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C1FEF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CMa6kBvp"
Received: by mail-lf1-x135.google.com with SMTP id o10so23074821lfl.13
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 07:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oou4JBBLNg89AoflcEwukaUQeMGozONrAI+ykd68abc=;
 b=CMa6kBvpR7r2i7zpxtIhNACZ2ViuaRO16BBxLI8B05cp9KOHqdEStU7xvCXZWY74SX
 9lqFxZaRm4aqr+c9UZoLdzO0SOMIUuiYyxAeIJJGdPM/fiZR4aDiStE89i/QvkPTJ04r
 UajsbqVlBJyRziIRZGuKOojtOnzJ5Q4KD2yRDbzkXpaQtXrh1M9quvjUl/9uy5spVVb5
 GO92t8QxJaHe3M7H82gYGbZA9hX7M29967sScvq3sc6d0cfSQmE9sZiJQiLeevmZHPqx
 RurYYDJ0RzvHiUwdCy41fLjd6IqcaiDE2XMbg2avVyrkBgog0Qghh8I/VRVS9XJ7SVPY
 wkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oou4JBBLNg89AoflcEwukaUQeMGozONrAI+ykd68abc=;
 b=qY3VilxM/gvWQLGD6D7OI7AG3tjbYgG3Am7aAVtFIVhtpXoo7ZIIlHY/9obOPeAhDL
 pXZI4Xf8UP0HSBZKh25p+7bb+J8hY4nXkui+XXvz0M0JEazW+14XYYl8NRIKjo7E4cpS
 SnuveNWb1MJuj38YebRqP7Yn+hjH+jlwIuEzBr1FBWrR0k0QLQ2rqOn35moNFNeMU149
 uNAZ5Z2BMqlAKzKygz9a6xkPd2dLlGzLzMmIKMUZq+9hw4RCfmivZhu0dzA27Lak+hfD
 EBARNgNNeYMYGSE/nYqpfPlO/Sgxx3J89kRGhf3GK1PxOTd79QDEloCRsqTPRKrD7z32
 Kdxw==
X-Gm-Message-State: AOAM532R1WJhYwJ/XBH5kcQU58d1o9xG0XmJQUf0zYez4BEstkR8rPuU
 XykheL/9SQPgCtlvC0YSRNDYz/BaR9aBssEyN9t6Pg==
X-Google-Smtp-Source: ABdhPJzrV9fkzjpZBwQ0mQ9Fy53MLqpTRDv/TPUMKddMWfeRpgkK8NEwID8Bpzlme642rYr1YhFm4FNjevHCdUpgQwY=
X-Received: by 2002:ac2:4285:: with SMTP id m5mr2664496lfh.649.1611673219946; 
 Tue, 26 Jan 2021 07:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20210126132531.2084711-1-robert.foss@linaro.org>
 <20210126132531.2084711-2-robert.foss@linaro.org>
In-Reply-To: <20210126132531.2084711-2-robert.foss@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Jan 2021 16:00:09 +0100
Message-ID: <CACRpkda4pChqJoR-RH_QGMq0NBgyWFsyhzQHthFWPZkm62qC8A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: mediatek: mt8192: Fix
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

Patch applied!

Yours,
Linus Walleij
