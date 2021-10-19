Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 390084337BB
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 15:49:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97AB116BA;
	Tue, 19 Oct 2021 15:48:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97AB116BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634651374;
	bh=XMC/wPCLR3CBhhlT5pdzczydUVy9/N9xDjzMYHJpisA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iZ7pQFv8O6OgZnx7aBjHqzzyq7TzhuYq2TGJlAVlVoBarln+Yx5PLOrpsYxKAmj9Q
	 ZAnwBbWDGX9K+gATvmoE/bshk1RodSyVsIvFG6HaRfWmyNUvLOoZOKG83lXJDSfsQN
	 FfF7VQ6+6yh4tT5A9EOlagU8HTjUbPpnb2tK1LGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6284FF80249;
	Tue, 19 Oct 2021 15:48:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DF54F80249; Tue, 19 Oct 2021 15:48:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D007F80240
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 15:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D007F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kMZhjuo3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80D8461052
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 13:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634651312;
 bh=XMC/wPCLR3CBhhlT5pdzczydUVy9/N9xDjzMYHJpisA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kMZhjuo3B2Fzbnmj685kq/s1jO8GOP2QFIM4ctWuZ6RE4kZ9mVawAMG69lrcUd82b
 0WYx/2MdPmwxxVqO2/sXP1lBSLng1S4c2iM/RXioOVpJMib+/7Ns8ElFd0t1xMweI1
 ruodbyT+qmHnjaP8HP/lbLn7mF0XBoGmMhg3uqNkAVdvu03Hv06JoUQ6BgKA1hzTgs
 ENrEIUMFWisfj1gats+3SjEdJinZqV+X661ThwWRoZ417l/Dai3B1gcKNTFoNBx5F/
 tA5T4PVjZqGpXvFgF6sQHekoy1w2EwXObSJBI2At3rWLji9q/SKrRqvtY7+j+n15dE
 ioqUMX9hRTKiw==
Received: by mail-ed1-f50.google.com with SMTP id z20so13085081edc.13
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 06:48:32 -0700 (PDT)
X-Gm-Message-State: AOAM5320s54x8VOlq7dPffnHjIwkZs411OD/F1T5mt8Ub3bmDjNtEjDi
 PIoQ+vkgBBu1qcdJaUkOC/k3H6IzfWRa48E2dA==
X-Google-Smtp-Source: ABdhPJyAfrYlSPnzjG28JymfwvH0BP3fn74QUTfI0oe+sTUWy23ijNdMN4gs6ujRiJQN0RszPk5QghJDBRsUY0PgyKY=
X-Received: by 2002:a05:6402:1778:: with SMTP id
 da24mr53073940edb.318.1634651259310; 
 Tue, 19 Oct 2021 06:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211018101608.3818840-1-tzungbi@google.com>
In-Reply-To: <20211018101608.3818840-1-tzungbi@google.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 19 Oct 2021 08:47:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK9UQ9K+GseF5QtiPW_sHMiupq1HAwDArN6P+H8iBwJ-Q@mail.gmail.com>
Message-ID: <CAL_JsqK9UQ9K+GseF5QtiPW_sHMiupq1HAwDArN6P+H8iBwJ-Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: rename reset controller
 headers in DT example
To: Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
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

On Mon, Oct 18, 2021 at 5:16 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Commit f07c776f6d7e ("arm64: dts: mediatek: Move reset controller
> constants into common location") moves the reset controller headers.
> However, it forgot to rename the DT example in mt8192-afe-pcm.yaml.
>
> Renames the DT example to pass dt_binding_check.
>
> Fixes: f07c776f6d7e ("arm64: dts: mediatek: Move reset controller constants into common location")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> The patch bases on next-20211018.
>
> In Mark's tree[1], the commit f07c776f6d7e hasn't shown up.
> In Matthias's tree[2], mt8192-afe-pcm.yaml hasn't applied.
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
>
> Also, I am not sure if the commit hash "f07c776f6d7e" would change
> or not after it applies to mainline.
>
>  Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Not great as things will break again in the merge window temporarily.
You could just not use the 1 reset define in the example and avoid all
that, but this is fine:

Acked-by: Rob Herring <robh@kernel.org>
