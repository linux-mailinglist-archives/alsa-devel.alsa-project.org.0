Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E754A580E23
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 09:45:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54BB382E;
	Tue, 26 Jul 2022 09:44:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54BB382E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658821514;
	bh=H2KeWrOzAXHDnSJ3/65qH1ppJmiHemG/nnbZgxI3jzE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K3862Zb25/B/eXP3JEZCFCawXVVqFTZdA+xsJ3SbxKWtUlVa4o3NvDN6WomsH4Jiu
	 GhM8RKPnzT2CVIAZ8m0sLx5ZmTSAguPAA4ztAuptseaslBUFsNAmhMsvs/TOsrNDjz
	 VAKRa9vxrkYLBk1MnkmHxvrUvpI1kiKpswjiJplE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F76DF800FA;
	Tue, 26 Jul 2022 09:44:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38CBFF8025A; Tue, 26 Jul 2022 09:44:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1610F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 09:44:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1610F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Ym+bHhwv"
Received: by mail-ed1-x532.google.com with SMTP id u12so11700432edd.5
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 00:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H2KeWrOzAXHDnSJ3/65qH1ppJmiHemG/nnbZgxI3jzE=;
 b=Ym+bHhwvskOMHiERPb5yUCs1eGp56rwLMbKAaFS98pgXStoOLSihNMoH4rQRFQfGuz
 4OsAYQ6EuIuFKf7+DuQNVGuwkMfeiTFgH/ipAz5QY0Xb9l5hSk+wOj/Hgb+a9sxvG3gt
 M4+lMQCwSksyAf0ccK2kEPdHrQKIqanxxPsp3IdtPy7hZlPMXpRrb65kmOGPals3Pyv/
 bxIepVZ0fxG5q+LhgCQZ7C6adGImqG4UIfkCiZmULp24+O3hIQBZYlZdU7gT3Y3giI6q
 /93PPLLu/X18mf258zOF/Y8kmUIJIB1Xda+FFHnE/9cpup+/pwo9LEKW9Gz0fey7yrzL
 Lt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H2KeWrOzAXHDnSJ3/65qH1ppJmiHemG/nnbZgxI3jzE=;
 b=abgxyDRADP567dRkER1NNfimolx7pUhFChvwWbNgO68u/emV4bPxalTVJZI68G9ZTq
 h4Aoc2FAnRMrWvd2ZJYec3PRN53ck7Dg6yCG4Ac/gH459d4xmN0xXD1OJAZj2n9zW3Ah
 zidiZbgVNk53rl1DmkfM52R4/eNtmOYJ0cD65UMCzynVqKMQ9T90H2xesfbZIERdQvX+
 ogCgCmzgFwomGKej/b4/PoczlXtALGD671w8r1ASvAzedLAC7rLyaiMxOXmETG1/jIM3
 p9lOH+uf0qQhEGGfku9JtzQ5/P1B42fCEzqwTZr25g3SbIi0FnflVX9zMI8kMH4KEB86
 is/A==
X-Gm-Message-State: AJIora+O8URnkUMTWziIfFfZgylEdwHTc+26YAIt9v3aXpBr7bS9NCTY
 hT14+7qwVCzLwHZcahEwYLMyF73ZqRMv0XLtGHyhfw==
X-Google-Smtp-Source: AGRyM1v3kT3K37Yj20BSAcGqG5U8pY1U1AGavoRoQliTz7JyTg1UgxHXgP477tw1Qfv05bbtXF75pBZUuP5jsCDzKdk=
X-Received: by 2002:a05:6402:371a:b0:43a:ece9:ab8e with SMTP id
 ek26-20020a056402371a00b0043aece9ab8emr16905320edb.126.1658821441691; Tue, 26
 Jul 2022 00:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220720112152.22918-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220720112152.22918-1-lukas.bulwahn@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Jul 2022 09:43:50 +0200
Message-ID: <CACRpkdYKn1rLRXs45J4ZDP1G9nsWkH-8g25_onOsY+39+n01bw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ti: remove sound support for DaVinci DM644x and
 DM646x
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
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

On Wed, Jul 20, 2022 at 1:22 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 7dd33764486d ("ARM: davinci: Delete DM644x board files") and commit
> b4aed01de486 ("ARM: davinci: Delete DM646x board files") removes the
> support for DaVinci DM644x and DM646x boards.
>
> Hence, remove the sound support for those boards as well.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
