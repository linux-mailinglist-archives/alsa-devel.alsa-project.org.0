Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C5441150E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 14:55:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03F8B16A1;
	Mon, 20 Sep 2021 14:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03F8B16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632142529;
	bh=W1eYMmg9H2jFhknPdndD+apjfXD08+jcBBvof7g6zWw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H9NgCrCembh7tO1ldQfeo2Z8mLLeBsJeuk7DxFNLbaBZ9NkQ9V/gYcJ/GzmeSS3oF
	 VKMsvrb0K2f3c6/c9F3LWlVsG3iJ97Lvw42NWXyUlVUnwfxCC7FwQyjVMeJDzxkX7/
	 VBoapvbMAV4vv1WQRLYRt7MlMmz7pjUK8ECDibp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B0E4F80129;
	Mon, 20 Sep 2021 14:54:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C52F2F80124; Mon, 20 Sep 2021 14:54:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2555DF80124
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 14:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2555DF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S7MJFsqD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4630610FB
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 12:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632142439;
 bh=W1eYMmg9H2jFhknPdndD+apjfXD08+jcBBvof7g6zWw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S7MJFsqD329nVxBkT3qwZRjVziZdooDG/bJRPvx0Q9Iq3SPPXzDGYDb+9aSViTfS7
 7SXCE6oiiFvWGI+1XYBiwps+OZoeEXZIVulXjF6zI1a3BuzLgVGtJLEgGRRFi4k5H2
 wvf4P7hbXWrcNIXiU0FL940HN90ryprb+4Qv/w6MUY8kItqxzd0k2iinbx7TW6g/pb
 4vYAIGMdwbagWgjGpjWTACn0kkA7eDZvVyg1RshPDqgPee6wuvkwNPJw6jSywFuxJr
 LymfjSSgslnzgDwl8eoxu99g5NOfpmNw3DU+7VJczwV4sQRaLkvE+6qxI3gHS76Fv2
 q2S9mgfzC/0vQ==
Received: by mail-wr1-f47.google.com with SMTP id u15so29410186wru.6
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 05:53:59 -0700 (PDT)
X-Gm-Message-State: AOAM530BsJPgXk0TnKQ32Gd1U/O1jaPv1NQ8gnP8fXXboVC8NF8wfdgE
 x3TB3cbv8krfZQYWYvHS5+sO0R0y+R2fGUXd8AM=
X-Google-Smtp-Source: ABdhPJwgSLeOA+5EYUZWyMXPW6vc2urD0vjnW6PXs7wvXSXhdxd/LtmNdjYm/cajU/C5Q3kNTl/tQUp6tjS8FOlAVrE=
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr29348860wmf.82.1632142438279; 
 Mon, 20 Sep 2021 05:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210920100206.1418649-1-arnd@kernel.org>
 <20210920123542.GA14852@sirena.org.uk>
In-Reply-To: <20210920123542.GA14852@sirena.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 20 Sep 2021 14:53:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0uz0Uy1p1Ku9_rqwgh0hnEhWrDqxzgd9cU4Dcd++TMMQ@mail.gmail.com>
Message-ID: <CAK8P3a0uz0Uy1p1Ku9_rqwgh0hnEhWrDqxzgd9cU4Dcd++TMMQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: force COMMON_CLK dependency
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Trevor Wu <trevor.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On Mon, Sep 20, 2021 at 2:35 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Sep 20, 2021 at 12:01:58PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Without CONFIG_COMMON_CLK, this driver fails to link:
> >
> > ERROR: modpost: "clk_unregister_gate" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!
> > ERROR: modpost: "clk_register_gate" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!
>
> This doesn't apply against current code, please check and resend.

It's already fixed the way that Geert suggested in your asoc/for-5.15,
sorry for the dup.

        Arnd
