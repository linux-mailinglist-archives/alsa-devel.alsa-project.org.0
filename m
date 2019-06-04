Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A554D34195
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 10:17:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C99716DB;
	Tue,  4 Jun 2019 10:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C99716DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559636244;
	bh=paGoDttXvvX1zgMgQ3QbQkN6UTt/eXjA7rUwyThKl6M=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fp9rcpIYWfzsyaSR9VEZQc4Gfski2I4DZiN2Wlhm0s5aSFOs4DhT/ryVn5UvHnO0q
	 QVMzbKXdv3GX/HXHzH+GQjprOgznxu5v3sFYpwJthF09+vywVRuu2QX7tqyxJ5iS0r
	 ix+dOuyHsXzgqF6QyWJuS+I+m1jWap8p9LV7OWNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9722EF896CE;
	Tue,  4 Jun 2019 10:15:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A91FF896CE; Tue,  4 Jun 2019 10:15:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8504F896CE
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 10:15:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8504F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gg5NaBQk"
Received: by mail-lj1-x241.google.com with SMTP id j24so18814397ljg.1
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 01:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dLlcBHBLLtHstGlRzl9TA6x38HKIxAAJAQ+NO6ZQeWw=;
 b=gg5NaBQkvVlyEjdj76PxCTZ1E9NORC9Uvd2TwtPXwamT631BYBINpO1n7lK40xKlDO
 YF75M03YPHv++3XvpBenhsCevE5QP7jrqgBlPPpsxQf51yLY6i1cDVealPzeWuUeOETM
 Ln8JFOLHaVnUBWlqWtttsyLypGE2AUK6dJbQPwWb8IaMS2uov9Ribb9tr0Px/NPd77BZ
 Vq/ZUbvc7w1hd3O2czGTLEIl+HviRJodECXWHyuwPhv+2YED4WlErKwRwgz0j/FSpbNQ
 BTyOuHsVjmHZEuUOPLjDQWOR3mp4KfA/QHcX/64K8vTFTQx8TqPMWoAJLp6RCAYNkKyw
 5Liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dLlcBHBLLtHstGlRzl9TA6x38HKIxAAJAQ+NO6ZQeWw=;
 b=ZyXxTxWTpknHwEMvjNq0bKLZ0h71B/wpE9lxIYmp4dN9x5hhNPrHJSapUT0kMufVaE
 HdZYBKcZq5Rp1awxeiCDKwjpUIUzcxWswqpB2AWqSXo08SOAjrRn0GfEpd5G4jiRWoH8
 HJr29qFON+jKG20Zf9MJcrcZQj1Sf2wni9Vq5apaUY5h+Iac8Yggwug4sT6uaXj76w4m
 bbSlpJeH75m1BwwNVe1nFc0KIsq9rUwp+IU6nieZtFaa+CN5fg3VscTQg1WVkqzg5IWA
 yt8jL28ek7fVReq7b7LUtVDVxMxF6X8iTF1tPgNSn9bewOhEhX63+E+titveRiaaBQGI
 ZzsQ==
X-Gm-Message-State: APjAAAV6eyD1NxS+nPvLa+69n9ILHH4pLHnsjGhh45lXcqKUlqPnr3xm
 UEWRD0qKoB+yOJbmhmJBuPUFiDH8KnzetajxzQw=
X-Google-Smtp-Source: APXvYqzP1NG5gWwqUWs2RU4TEYclgqRL9GlvmJKeApSsoDlNeSku/Zjez2PSP00HTB0NSoYWsCg5La13x7bHF3bdJrY=
X-Received: by 2002:a2e:91c3:: with SMTP id u3mr16042008ljg.130.1559636134081; 
 Tue, 04 Jun 2019 01:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190603174735.21002-1-codekipper@gmail.com>
 <20190603174735.21002-2-codekipper@gmail.com>
 <20190604073443.cnnqd7ucbaehxdvj@flea>
 <CAGb2v64T5MypDD9A5FNfyikB9vFJZf9+TiQaXi_o2K53QmfaQg@mail.gmail.com>
In-Reply-To: <CAGb2v64T5MypDD9A5FNfyikB9vFJZf9+TiQaXi_o2K53QmfaQg@mail.gmail.com>
From: Code Kipper <codekipper@gmail.com>
Date: Tue, 4 Jun 2019 10:15:22 +0200
Message-ID: <CAEKpxBn-XX+GRrMuCccwcC9TFKXGYV4S2ZwX+jBV==33RsW-aQ@mail.gmail.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] Re: [PATCH v4 1/9] ASoC: sun4i-i2s:
 Fix sun8i tx channel offset mask
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

On Tue, 4 Jun 2019 at 09:39, Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Tue, Jun 4, 2019 at 3:34 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Mon, Jun 03, 2019 at 07:47:27PM +0200, codekipper@gmail.com wrote:
> > > From: Marcus Cooper <codekipper@gmail.com>
> > >
> > > Although not causing any noticeable issues, the mask for the
> > > channel offset is covering too many bits.
> > >
> > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> >
> > Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Would be nice to have
>
> Fixes: 7d2993811a1e ("ASoC: sun4i-i2s: Add support for H3")
Thanks....I'll keep this in mind for future reference as jernej also
mention this to me.
BR,
CK
>
> But otherwise,
>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
